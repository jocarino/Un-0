# Hardware error catalog

Running list of the imperfections a physical oscillator chip would have, how
conventional chips already deal with the same kind of problem, where to inject
each one into the Un-0 simulation, and how to test whether a fix works.

Status key: `idea` → `simulated` → `fix tested` → `combined test passed`

## Error types

| # | Error | Behaviour | Conventional-chip counterpart | Candidate fix | Status |
|---|-------|-----------|-------------------------------|---------------|--------|
| E1 | Manufacturing mismatch | Fixed per chip: oscillator i always runs a bit fast, or a coupling is a bit strong | Process variation → speed binning, fuse trimming at test, per-unit calibration tables (e.g. camera fixed-pattern-noise correction) | Measure once, then compensate. Or train with randomized parameters so the model tolerates the spread | idea |
| E2 | Random jitter | New on every run, at every instant | Thermal or clock noise → timing margins, ECC, averaging (stacking several camera exposures) | Average independent copies or repeated runs (circular mean for phases). Train with injected noise | idea |
| E3 | Slow drift | Shared by many oscillators, changes with temperature or age | On-die temperature sensors, periodic recalibration, joystick-drift recalibration | Reference oscillators with a known answer: measure the offset and correct it, then repeat periodically | idea |
| E4 | Faults | Dead oscillator, stuck phase, broken coupling | Spare memory rows/columns, disabled cores sold as a lower model | Built-in test, then remap onto spares. Fault-aware training (dropout-like) | idea |
| E5 | Readout noise | Imperfect phase measurement at the end | ADC noise | Oversampling, averaging readings, noise-aware decoder | idea |

### Why analog is harder than the digital analogy suggests

Digital gates snap every signal back to a clean 0 or 1 at each step, so small
errors are erased before they can grow. An analog oscillator keeps the exact
phase, so an error at step 3 is still there at step 25 and passes through every
coupling along the way. Coupled dynamics can **dampen** errors or **amplify**
them. The first thing to measure is which one Un-0 does.

## Where to inject in the Un-0 code

All references are to `Un-0/un0/model.py`.

| # | Injection point | Sketch |
|---|-----------------|--------|
| E1 | `dynamics.omega`, `dynamics.K`, `dynamics.K_drive` (lines ~106–117) | `omega += σ·N(0,1)` and `K *= 1 + σ·N(0,1)`, sampled **once per simulated chip** (fixed seed per chip) |
| E2 | The `odeint` call in `forward` (~line 386) | Replace it with an Euler–Maruyama loop: `θ += v(θ)·dt + σ·√dt·N(0,1)` with fresh noise at each step |
| E3 | Same parameters as E1, but one shared offset | `omega += δ` for all oscillators, or `K *= (1+α)` (a temperature-like gain change). Optionally make δ change during the run |
| E4 | `K` rows/columns, state | Zero row i and column i of `K` (dead oscillator), or keep θ_i fixed (stuck) |
| E5 | `main_phases` just before `self.readout(...)` | `phases += σ·N(0,1)` |

## Experiment plan

**Metric (no dataset needed):** for a fixed starting seed and class, compare
the clean image with the image produced under noise, using the distance between
their DINO features or the pixel MSE. Also check whether a classifier still
recognizes the class. Use FID later, for headline numbers.

1. **Sensitivity sweep:** run each error E1–E5 alone at increasing σ, with no
   fix, using the pretrained CIFAR-10 checkpoint. Output: a degradation curve
   per error type, and the σ where images break.
2. **One error + its fix:** repeat step 1 with the matching fix enabled. Does
   the curve flatten? What does the fix cost (copies, runs, calibration
   measurements)?
3. **Everything at once:** a random combination of E1–E5 per chip, with all
   fixes on, over many simulated chips. Report the distribution of quality
   across chips, as you would for manufacturing yield.
4. **Noise-aware fine-tuning** (needs training data and compute): fine-tune
   with randomized E1–E5 and compare against steps 2–3.

Step 0, optional warm-up: run the same sweeps on `toy_kuramoto.py` first, to
debug the injection code cheaply.

## Log

- 2026-11-13 — Catalog created. Nothing run yet: the Un-0 environment and
  weights are not installed on either machine.
