# Literature synthesis: hardware noise in Un-0 and RAID-style redundancy

Synthesis date: 2026-11-13. Written by Claude (Opus 5.5) from the ten topic files in `sources/`, which hold 254 entries in total and were gathered by Codex workers using live web search. Plan under review: `notes/hardware-error-catalog.md`. **No experiments were run.**

How to read this:
- Numbers are the authors' own reports, as extracted by the workers. They have not been reproduced.
- Most entries were read **partially**: methods and results only, not supplements. Each source file marks abstract-only entries.
- "Not found" means not found in this search. It does not prove absence, and no patent-clearance search was done.
- File references use `[NN-k]`, meaning entry *k* in `sources/NN-*.md`.

---

## 1. Bottom line

1. **No one has done what we planned on Un-0, or on any learned Kuramoto image generator.** We found no study combining E1–E5 isolation, matched fixes, circular-mean copy redundancy, and image-quality yield over many simulated chips. Every topic worker reached the same conclusion independently.
2. **Each individual ingredient is well-trodden.** Most step-by-step outcomes are predictable from prior work, so a paper framed as "first robustness study of oscillator ML" or "first use of redundancy for analog AI" would be rejected as prior art.
3. **The closest single precedent is Wang & Achour 2026** (AIS, arXiv:2606.27294) [05-1]. They train an oscillator (Kuramoto + SHIL) generator, sweep transient integration noise, and recover quality with noise-injected fine-tuning. That partly replicates our step 1 (E2) and step 4.
4. **Other precedents for the remaining steps:**
   - E1 alone: frequency vs coupling mismatch sweeps in oscillator networks [01-1, 01-3, 02-5, 02-15].
   - Isolated and combined errors, including aging and faults, in an analog generator: memristive GAN [05-20].
   - Fixed vs fresh errors in analog diffusion: ASSERT [05-3].
   - Feature and output redundancy: committee machines, layer-ensemble averaging, analog ECC [09-5, 06-24, 06-14].
5. **Novel enough to be worth publishing:**
   - (a) Per-chip *application yield* of an oscillator generator under mixed E1–E5.
   - (b) Circular-mean redundancy *placed inside or around a finite-time learned phase dynamics*, together with its failure modes: shared drift, stuck phases, a near-zero resultant, coupled vs independent copies.
   - (c) Error-type-specific results for Un-0's learned ω/K/K_drive and its reference-oscillator readout.
6. **Replication, or a predictable result:**
   - Averaging N independent noisy copies shrinks error variance by about 1/N. This is textbook, and synchronized arrays already show it in hardware [06-1, 06-7].
   - Calibration removes static frequency spread [01-4].
   - Noise-aware fine-tuning helps [04-1, 05-1].
   - Reference-based correction removes common drift [04-2, 10-29].
7. **Two free findings from the literature plus the Un-0 source code** [02 gap 7, 10 §Consequences]:
   - A common ω offset applied to *all* oscillators is mathematically invisible to Un-0's reference-relative readout. That E3 test is a null control, not an experiment.
   - Noise on reference oscillator 0 enters *every* readout feature, which makes it a single point of failure for E5.

---

## 2. Demonstrated vs proposed: the 25 most relevant works

Type key: **HW** = hardware demonstration; Sim = simulation; Th = theory; Prop = proposal. The "Err" column uses our E-labels, mapped by the workers.

| # | Work | Type | System / scale | Err | Mitigation | Headline number |
|---|------|------|----------------|-----|-----------|-----------------|
| 1 | Wang & Achour 2026, *Generative Models on Analog Hardware with Dynamics* [05-1] | Sim | Kuramoto+SHIL oscillator generator, 80 Euler steps, MNIST/F-MNIST | E2, (E1 quant.) | Quantization then noise-injected fine-tuning | 4-bit FID 27.2 → 29.1 at δ=0.025 and 54.5 at δ=0.1 (MNIST) |
| 2 | Krestinskaya et al. 2020, *Memristive GAN in Analog* [05-20] | Sim | 1.7M-memristor DCGAN, MNIST | E1–E4, combined | Dropout, precision choice | Tolerates conductance σ≈0.04, 0.3–0.5% failed devices, 2–4% aging |
| 3 | Feng et al. 2026, ASSERT [05-3] | Sim | Diffusion on 28 nm eFlash CIM model (100-chip noise validation) | E1 fixed + E2 fresh | Sampler stochasticity schedule, no retraining | CIFAR-10 FID 33.5 → 5.9 (100 steps) |
| 4 | Rageau & Grollier 2025, EqProp on oscillators [02-5] | Sim | 784–500–10 phase oscillators | E1 (ω dispersion) | Train couplings for sync | 97.8% clean; 96–97% at 5–10% dispersion |
| 5 | Shamsi et al. 2023, DONN mismatch [01-1] | Sim | VO₂ differential ONN, 8–16 neurons | E1 (ω vs K separately) | Design optimization | 0.5% ω RSD desynchronizes; synapse RSD up to 20% is fine |
| 6 | Vodenicarevic et al. 2017 [01-3] | Sim | Kuramoto recognizer, 100 random draws | E1, E2 | Redundant couplings, readout design | >70% agreement at ±2 MHz ω or 20% K; phase lag >π/6 → <50% |
| 7 | Gower 2025, EqProp on OIMs [02-7, 03-22] | Sim | 784–500–10 OIM | E2, E5 (quantization) | Tune nudging β to noise | 97.2% MNIST; 4-bit phase readout still 89.8% on reduced task |
| 8 | Graber & Hofmann 2024 [01-4, 03-17] | **HW** | 28 nm CMOS, 1,440 oscillators, 10 chips | E1, E3, E5 | Frequency, reference-phase and routing-delay calibration | ω σ 6.7 → 0.33 MHz (of 100 MHz); uncalibrated delays act like random output |
| 9 | Cross 2012 [06-1] | Th | N dissipative Kuramoto oscillators | E1, E2 | Mutual sync (collective mode) | Noise power ∝ 1/N; saturates with reactive coupling or disorder |
| 10 | Litvinenko et al. 2023 [06-6] | **HW** | 2- and 10-SHNO chains | E1, E2, E3 | Mutual sync | 2.8 / 6.2 dB gain vs ideal 3 / 10 dB; high-offset noise *worsens* |
| 11 | Behera et al. 2026 (arXiv 2501.18321) [01-15, 06-7] | **HW** | Up to 105,000 SHNOs | E2 | Mutual sync | Linewidth ∝ N⁻¹; Q≈10⁶ |
| 12 | Zhang et al. 2015 [06-2] | **HW** | 3–7 optomechanical oscillators | E1, E2 | Sync through light | ~10 dB phase-noise reduction |
| 13 | Nakamura et al. 2026, *Ensemble RC* [08-1] | **HW** + Sim | STO reservoir feature ensembles | E2, E5 | Average features across noisy copies | Task accuracy 67.3 → 99.4%; ESN needs >1,000 copies for full recovery |
| 14 | Yousuf et al. 2025, layer ensemble averaging [06-24] | **HW** | 20k-device memristor platform | E1, E4, E2/E5 | Redundant layer copies + averaging | 20% stuck faults: 40 → 89.6% (sim); HW 55 → 71% |
| 15 | Joksas et al. 2020, committee machines [09-5] | Sim (device-calibrated) | Memristor MLPs | E1, E4, E2/E5 | Average 5 network copies | 90.8 → 95.8% (digital 95.9%) |
| 16 | Li, Roth et al. 2020, analog ECC [06-14, 09-6] | **HW** | Memristor crossbar MVM | E4, E2/E5 | Roth analog ECC on linear MVM | MNIST 73.1 → 97.4% under injected noise |
| 17 | Roth 2020/2023; Wei & Roth 2024 [06-12,13,15] | Th | Real [n,k] codes for VMM | E4 outliers + bounded noise | Syndrome decoding | Corrects sparse large errors only above Δ/δ separation |
| 18 | Pedretti et al. 2021 TED I/II [06-21,22] | **HW** | RRAM, M=4 devices/weight | E1, E4, E5 | Redundancy + analog slicing | 6.7 ENOB; 12 devices per entry |
| 19 | Rasch et al. 2023, HWA training [04-1] | Sim (PCM-calibrated) | 11 workloads | E1–E5 | HWA training, drift compensation | Only 5/11 reach iso-accuracy; I/O noise is the most damaging |
| 20 | Joshi et al. 2020 [04-2, 07-20] | **HW** | PCM, ResNet-32 | E1, E2, E3 | Noise training + global drift comp. + AdaBS | 93.75% → >92.6% over 1 day; ~10% within 1,000 s without compensation |
| 21 | Wang et al. 2025, VANT [04-9] | Sim | ResNets | E2 (variable σ) | Randomize training-noise σ | rAUC 79 → 98% (CIFAR-10) |
| 22 | Vadlamani et al. 2023 [10-22]; Bandyopadhyay et al. 2021 [10-20] | Sim | Photonic meshes, 25–300 random imperfect circuits | E1 | Error-aware training; local calibration | Up to 5× fabrication tolerance; within 1% at 4% splitter error |
| 23 | Wright et al. 2022, PAT [07-1] | **HW** | Includes an electronic oscillator PNN | E1, E2 | Physics-aware training | 93% MNIST (electronic) |
| 24 | Aifer et al. 2024, Thermies [05-17, 10-11] | **HW** (8 cells) | Thermodynamic sampler | E1 (precision) | Ensemble of rounded distributions | Error O(ε) → O(ε²); −20% on HW |
| 25 | Un-0 blog + repo; sparsity blog [02-1,2; 10-1,2,6] | Sim | 1k–16k oscillators | none | Reference-relative sin/cos readout | ImageNet-64 FID 6.74; ~3% FID change with finer integration |

---

## 3. Per error type

Device numbers below are reported values to help pick σ ranges. They do not transfer directly to Un-0's normalized units (see §6.2).

### E1: manufacturing mismatch
- **State of the art.**
  - Frequency mismatch is far more damaging than coupling mismatch in phase-locked ONNs. VO₂ DONN: 0.5% ω RSD destroys sync, while synapse RSD up to 20% is tolerated [01-1]. MEMS memory degrades at δ=10⁻³ in ω, while coupling holds up to 3.3×10⁻³ [02-15].
  - Coupling *phase lag* or delay is a separate killer, beyond ω and K magnitude. A lag above π/6 drops a Kuramoto recognizer below 50% [01-3], and uncalibrated routing delay gives random output on a 1,440-oscillator chip [01-4].
- **Typical device spreads.**

  | Device | Reported spread |
  |---|---|
  | Raw CMOS ring oscillators | ~6.7% σ, calibrated to 0.33% [01-4] |
  | VO₂ transition voltage | up to 10% device-to-device; <5% after selection [01-7] |
  | VO₂ neuron frequency | 10.1% → 1.8% dispersion with calibration [01-22] |
  | Spin-torque oscillator demos | 2% frequency mismatch [01-21] |

- **Best-supported mitigations.**
  - Measure-and-trim calibration [01-4, 01-22, 07-10].
  - Training with randomized parameters: Rageau tolerates 5–15% dispersion [02-5]; DYNAP-SE resampling [07-16]; photonic transferable training reaches 5× tolerance [10-22].
  - Rescaling coupling to restore locking [01-6]. This changes the learned dynamics.
  - Chip-in-the-loop fine-tuning [07-1, 07-12]: BrainScaleS learning was barely affected by 30% decalibration.
- **Unknown for oscillator generators.** Whether Un-0's finite ~10-step transient is as frequency-fragile as equilibrium ONNs, or more forgiving because it never needs to lock. Also, how mismatch in K_drive (the class conditioning) distorts class identity. The guidance-recalibration result in diffusion [05-4] suggests conditioning paths can be disproportionately sensitive.

### E2: random jitter
- **State of the art.** Often deliberately kept as a resource in Ising machines and samplers [03-8, 03-9, 03-15]. AIS gives the only generator-level numbers: FID rises 7% at δ=0.025 and doubles at δ=0.1 [05-1].
  - The noise *structure* matters as well as its σ. Common (shared) noise *aids* locking [01-24]. Colored or OU noise changes retrieval [02-13]. Spatial correlations change success rates [03-6].
- **Mitigations.**
  - Noise-aware or variance-randomized training [05-1, 04-9, 02-7].
  - Averaging repeated runs or copies [04-5]: Garg et al. cut energy by up to 89% via selective repetition.
  - Sampler schedules [05-2, 05-3].
- **Unknown.** Whether Un-0 damps or amplifies jitter over its transient. No source measures finite-time perturbation gain for a learned Kuramoto generator. Long-time Lyapunov arguments can miss short-time non-normal amplification [08 gap 5].

### E3: shared drift
- **State of the art.**
  - Drift is rarely a clean scalar offset. VO₂ frequency varies 22–29% over 293–307 K, and oscillation *stops* outside that window [01-9]. SHNO self-heating gives a 13 K gradient, about 20 MHz of spread [06-6]. PCM drift is heterogeneous and state-dependent [04-2].
  - Global correction removes the mean but leaves a residual [04-2, 04-3, 04-12].
- **Mitigations.**
  - Reference cells or arrays [04-12, 10-29]; Sagence reference arrays are a direct analogue of "reference oscillators".
  - Global drift compensation plus adaptive normalization [04-2].
  - Encoding or symmetry choices that make the readout drift-insensitive [03-14, 03-25].
- **Un-0-specific (analytic inference, not a published result) [02 gap 7, 10 §Consequences]:**
  - A *common ω offset applied to every main and conditioning oscillator* is a pure rotating-frame shift. Un-0's default `ref_oscillator` readout cancels it exactly.
  - A main-pool-only offset, or a K or K_drive gain change, does *not* cancel.
- **Unknown.** Sensitivity to drift that is partly common and partly per-oscillator, and to slow drift *during* a run.

### E4: faults
- **State of the art.** Mature for crossbars, almost absent for oscillator networks.
  - Remapping onto spares [09-2, 09-3, 09-12]: 1% stuck cells is a typical default [09-13]. Note that 0.99⁵¹² ≈ 0.6% of 512-cell columns are defect-free [09-3], so spares must tolerate faults themselves.
  - Fault-aware training and factorization [09-25]: 39% stuck faults, with cosine similarity above 99.999%.
  - Layer and neuron redundancy [06-24, 09-13]: 98.5% recovery for 4% redundancy.
  - Analog ECC [06-14].
- **What has not been done.** No dead-oscillator, stuck-phase, or broken-coupling campaign in any coupled-oscillator ML system. The ONN, Ising and Kuramoto files all flag this. Only Krestinskaya's GAN injects stuck devices into a generator [05-20], tolerating 0.3–0.5%.
- **Modelling caution [09 gap 3].** The three variants differ physically and should be modelled separately:
  - a disconnected oscillator (row and column of K zeroed);
  - a stuck phase that *still drives its neighbours*;
  - a broken single edge.

### E5: readout noise
- **State of the art.**
  - In crossbars, I/O and ADC noise is the most damaging nonideality [04-1].
  - Phase readouts reported: 4-bit detection on a CMOS OIM [03-17], 4-bit phase tolerated in EqProp-OIM [02-7], ADC ENOB 9.8 in Lightmatter [10-19].
  - Paired, redundant ADCs flag boundary cases [09-22].
- **Unknown.** How Un-0's learned decoder tolerates terminal phase noise and quantization. Also, the shared-reference amplification: Un-0 subtracts phase 0 from every oscillator, so noise on the reference adds to *all* features [10 §Consequences]. A mean-relative circular readout or redundant reference measurement would spread that risk. No source has tested this.

---

## 4. The redundancy (RAID) idea

### What exists

| Mechanism | Precedent | What it actually averages |
|---|---|---|
| Physically coupled copies (synchronization) | Cross 2012 theory, 1/N noise power [06-1]; optomechanical 10 dB [06-2]; SHNO arrays up to 105k, linewidth ∝ 1/N [06-4,5,7]; multi-phase LC [06-3] | One collective mode. The copies stop being independent features, and the dynamics change |
| Coherent phasor combination of independent channels | Pomponio 2024 DDS array: 8 channels, 9 dB, floor set by the *common* reference [06-8] | Physically ≈ the circular mean (resultant phasor) of independent phases. Closest analogue to our proposal |
| Redundant oscillator neurons + weighted averaging | Oya et al. 2005 single-electron oscillators, redundancy factor 5 [06-10] | Averaging plus a decision stage, aimed at faults |
| Ensemble of noisy physical oscillator reservoirs | Nakamura 2026 STO ensembles [08-1] | Arithmetic mean of nonlinear features; independence assumed |
| Multiple devices per weight | Boybat 2018, σ ∝ 1/√N [04-6]; Pedretti M=4 + slicing [06-21,22]; two-PCM differential [04-2] | Parameters (K) before the dynamics |
| Network, committee or layer replicas | Joksas 2020 [09-5]; Yousuf 2025 [06-24]; ReMeCo 4% selective redundancy [09-13] | Outputs or intermediate features of whole replicas |
| Repeated computation in time | Garg 2021 dynamic precision [04-5]; CN101 repeated readouts with a bias floor [05-19] | Only fresh noise (E2, E5), never fixed E1 |
| Analog ECC | Roth 2020 + correction [06-12,13]; Li IEDM HW [06-14]; multi-error codes [06-15–20] | Linear MVM outputs; corrects *sparse large* outliers, tolerates bounded small noise |
| Algorithmic / coded computation | ABFT checksums [06-27,28]; CodeNet [06-29]; RRNS residues, which mentions ring-oscillator modulo [06-25] | Linear algebra only |
| Learned error-decorrelated feature codes | COLA, ICML 2023 [09-18] | Learned features; shows codes fail when errors stay correlated |
| Population codes in mixed-signal neuromorphic hardware | Zendrikov: 8–16 neurons ≈ 8-bit precision [07-25]; Krause oscillator populations [07-24]; BrainScaleS 4-compartment neurons [05-21] | Spiking rates |
| Distribution ensembles | Thermies [05-17] | Samples from different rounded distributions, not corresponding trajectories |

**Has circular-mean redundancy over oscillator phase copies been done for ML?** Not as such. No work averages corresponding copies of the learned phase features of a trained oscillator model with a circular mean and reports task quality. The physics is old, though: synchronization arrays and coherent phasor combining both show it. The math is textbook circular statistics. So the honest framing is *novel application plus a characterization of its limits in a learned dynamical generator*, not a new mechanism.

### Expected payoff, from the literature and elementary statistics

- **E2 and E5 with independent copies:** for small errors, circular variance falls ~1/N, so σ falls ~1/√N. With pairwise error correlation ρ the residual is σ²[ρ + (1−ρ)/N] [06 gap], meaning the floor is set by whatever the copies share.
- **E1:** it helps only if each copy has its *own* mismatch, like independent chips or devices, as in committee machines. Re-running on the same chip leaves E1 untouched [04-5].
- **E3:** essentially no help, because copies share the drift. A reference or calibration is the right tool [04-12, 10-29]. Pomponio's combined DDS output follows the common reference noise at low offsets [06-8].
- **E4:** the circular mean is *not* a voter. One stuck copy biases the mean, and a near-zero resultant length makes the direction unstable [06 gap]. Use a robust circular estimator (circular median or trimmed mean), detection-and-exclusion, or an analog ECC with an outlier threshold.
- **Diminishing returns in hardware:** SHNO chains beyond 21 elements stop improving [06-5]. Ten-oscillator chains reach 6.2 dB, not the ideal 10, and high-offset noise worsens [06-6]. Thermal gradients and coupling delays are the culprits.

### Cost
N copies cost N× oscillators, area and energy for the copied part, plus readout. Repetition in time costs N× latency. Pedretti uses 12 devices per entry for 6.7 ENOB [06-22]. Selective redundancy (ReMeCo, 4%) or analog ECC (r redundant columns, with sharp threshold limits [06-19, 06-20]) is far cheaper than full replication. Unconventional's own blog warns that robustness overhead can erase the analog energy advantage [10-3]. Any redundancy result should therefore be reported per unit cost.

### Placement choices our experiments must make explicit
Each option gives a different system with a different result:
1. **Independent chip replicas**, averaged at the readout (committee-style).
2. **Replicated oscillators coupled into the same network** (synchronization-style). This changes the ODE.
3. **Averaging the final phases** vs **averaging the sin/cos decoder features** vs **averaging decoded images**.
4. **Repeated runs on one chip.**

### A concrete opportunity
In Un-0, the coupling term Σ_j K_ij sin(θ_j − θ_i) is a *linear* map applied to the sin/cos vectors. If K were implemented as a crossbar, Roth-style analog ECC could protect that MVM at every step [06-12, 06-14]. Linear ECC does not commute with the nonlinear phase update, so it must be applied per step, not to the trajectory as a whole. We found no prior work doing this inside an oscillator ODE.

---

## 5. Novelty check of the 4-step plan

| Step | Closest prior work | How ours differs | Verdict |
|---|---|---|---|
| 0. Toy-Kuramoto warm-up | Vodenicarevic 2017 [01-3]; Kumar–Mohanty 2017 [02-15] | Debugging only | Do it (cheap); not a contribution |
| 1. Each E alone, no fix | E1: DONN [01-1], Rageau [02-5]. E2: AIS [05-1], Delacour [01-5]. All E: memristive GAN [05-20], Rasch HWA [04-1] | First sweep on a pretrained, class-conditional, finite-time learned Kuramoto generator. Covers learned K_drive, reference readout, and damping-vs-amplification over the transient | **Worth doing but known** in method. Essential baseline. Novelty is Un-0-specific: E4 and the E3/E5 reference effects are the least covered |
| 2. Each E + matched fix | E1 calibration [01-4], randomized training [02-5, 10-22]. E2/E5 averaging [04-5, 06-1]. E3 reference correction [04-2, 10-29]. E4 spares/remap [09-2, 09-3], layer averaging [06-24]. ECC [06-14] | Fixes are known; applying them to phase dynamics is not. **Circular-mean copy redundancy inside a learned generator has no direct precedent** | **Worth doing but known** for calibration, reference and remap. **Worth doing (novel)** for circular-mean redundancy, but only if the study reports correlation, placement, the E4 failure modes and cost. A plain "averaging N copies gives 1/√N" result is predictable |
| 3. Random E1–E5 per chip, many chips, yield | Combined errors without yield: [05-20], [04-1]. Many random devices: photonic 25–300 circuits [10-20, 10-22], ReRAM thousands of transfers [04-8], ten real CMOS chips [01-4]. Yield definitions [09-8, 09 table] | No prior per-chip image-quality yield distribution for any oscillator or physical generator under mixed errors with fixes on | **Worth doing — the most novel part.** Put most effort here |
| 4. Noise-aware fine-tuning | AIS (an oscillator generator!) [05-1]; HWA [04-1]; VANT [04-9]; photonic GAN [05-9]; physics-aware training [07-1]; sharpness-aware training [07-8] | Differs mainly in model and evaluation protocol (held-out chips, yield) | **Known.** Do it as a comparator to redundancy at equal cost, not as a headline. Low priority |

---

## 6. Recommended changes to the plan and its metrics

### 6.1 Error models
1. **Split E3 into three tests:**
   - (a) a common ω offset on *all* oscillators, as a **null control** that should give exactly zero change with `ref_oscillator` readout and so validates the harness;
   - (b) a main-pool-only ω offset;
   - (c) a K or K_drive gain change (temperature-like).
   Add slow in-run drift as an option.
2. **Add coupling phase lag** (Sakaguchi α, sin(θ_j − θ_i − α)) as a separate E1 parameter. Prior work finds it more damaging than coupling magnitude [01-3, 01-4]. Optionally add a waveform or harmonic-misalignment term [03-26].
3. **Split E4** into dead (row and column of K zeroed), stuck-but-still-driving, and broken single edge. Use realistic fault mixes: stuck-on and stuck-off are unequal [09-13]. Include clustered faults [09-12].
4. **E2 in three flavours:** independent white, temporally correlated (OU), and common-mode. Correlation decides whether averaging works [01-24, 02-13, 03-6].
5. **E5:** add phase quantization (2–8 bits) alongside Gaussian noise, and **a separate test of noise on the reference oscillator only**. Compare `ref_oscillator`, mean-relative (circular) and pairwise readouts.
6. **Keep the nesting right [09 gap 7]:**
   - E1 and E4 are fixed per chip, drawn from a chip seed.
   - E2 and E5 are fresh per run.
   - E3 is shared across copies.
   - Never resample E1 per step.

### 6.2 Noise magnitudes to sweep (log-spaced; device numbers are anchors, not units)
Express E1 and E2 in units native to the dynamics:
- σ_ω relative to the spread of learned ω, and relative to typical coupling strength Σ_j|K_ij|, since locking depends on that ratio.
- K errors as relative multiplicative error.

| Error | Suggested range | Anchors |
|---|---|---|
| E1 ω | 0.1% – 10% relative | 0.33% calibrated CMOS, 6.7% raw [01-4]; 0.5% breaks DONN [01-1]; 1.8–10% VO₂ [01-22]; 2% STO [01-21] |
| E1 K | 1% – 30% relative | DONN OK to 20% [01-1]; 20% in [01-3]; PCM/RRAM conductance σ≈4% in [05-20] |
| E1 coupling lag α | 0 – π/4 | π/6 threshold in [01-3] |
| E2 | Normalize σ√dt to phase radians per step; sweep until FID doubles | AIS δ 0.025–0.1 [05-1]; Gower ξ up to 0.2 [02-7] |
| E3 | ω offset 0–5%; K gain ±10% | VO₂ 22–29% over 14 K (extreme) [01-9]; MRR 2 °C shift collapses accuracy [07-8] |
| E4 | 0.1% – 5% of oscillators/edges | GAN tolerates 0.3–0.5% [05-20]; 1% default [09-13]; HWA uses 0.1–1.7% [07-19] |
| E5 | 2–10 bits; Gaussian σ to match | 4-bit [01-4, 02-7]; ENOB 9.8 [10-19] |

### 6.3 Metrics
1. **Keep** paired-seed fidelity (DINO distance, pixel MSE) and class retention. **Add**:
   - FID with a fixed sample count;
   - **precision and recall**, since Unconventional's sparsity post reports FID tracking recall (correlation 0.924) [10-6], and noise may hit diversity rather than fidelity;
   - an area-under-degradation-curve summary over σ (rAUC-style) [04-9].
2. **Application yield [09 gap 5]:**
   - Define a chip-level statistic Q, for example paired DINO distance or class accuracy on a fixed seed and class set, plus FID on a chip subset.
   - Fix the pass threshold *before* running.
   - Report Y = P(chip passes) with a binomial confidence interval, the low quantiles (5th and 1st percentile chip), and the full distribution.
   - Keep chips separate from runs per chip.
   - Report the number of chips. ~200–1,000 is feasible; ppm tails are not claimable.
3. **Separate solver error from hardware error.** Un-0 shows ~3% FID change just from integrator choice [02-1]. Run a no-noise dt and solver baseline first.
4. **Measure amplification directly.** Track the finite-time perturbation gain ‖δθ(t)‖/‖δθ(0)‖ along trajectories, which answers "damp or amplify" from the catalog. Optionally compute the parameter-sensitivity ODE dS/dt = J_θ S + J_p [08 gap 5].
5. **Report cost with every fix:** number of copies, oscillators, repeated runs, calibration measurements, and fine-tuning compute. Compare fixes at equal cost.

### 6.4 Baselines every fix should beat
- No fix.
- **One-shot global calibration:** fit and subtract a common ω offset or K gain, Joshi-style [04-2].
- Coupling rescaling [01-6].
- Repeated runs on the same chip (time redundancy) vs N copies (space redundancy).
- Averaging decoded images or features from N independent chip replicas (committee [09-5]) vs a circular mean of phases.
- Robust circular median vs mean under E4.
- A simple sampler change: more integration steps, or ASSERT-style early stochasticity [05-3].
- Noise-aware fine-tuning at equal compute (step 4), evaluated on **held-out chips**.

### 6.5 Framing for a write-up
Claim *"application yield and redundancy trade-offs for a learned oscillator generator under realistic mixed hardware errors"*. Cite AIS, the memristive GAN, ASSERT, DONN, Rageau–Grollier, layer averaging and analog ECC as closest prior work. Avoid claiming novelty for redundancy, noise-aware training, calibration or isolated sensitivity sweeps.

---

## 7. Bibliography (works cited above)

Full entries, with read status and more works, are in the source files.

**Oscillator hardware and Kuramoto ML**
- Shamsi et al., Effect of Device Mismatches in Differential ONNs, IEEE TCSI 70(2) 2023. https://arxiv.org/abs/2211.05497
- Todri-Sanial et al., Computing with oscillators…, npj Unconv. Comput. 1, 14 (2024). https://www.nature.com/articles/s44335-024-00015-z
- Vodenicarevic et al., A Nanotechnology-Ready Computing Scheme…, Sci. Rep. 7, 44772 (2017). https://www.nature.com/articles/srep44772
- Graber & Hofmann, An integrated coupled oscillator network…, Commun. Eng. 3, 116 (2024). https://www.nature.com/articles/s44172-024-00261-w
- Delacour et al., Mixed-signal ONN…, Neuromorph. Comput. Eng. 3, 034004 (2023). https://doi.org/10.1088/2634-4386/ace9f5
- Dinç, Sabo, Todri-Sanial, Multifrequency ONNs, Adv. Intell. Discov. (2025/26). https://doi.org/10.1002/aidi.202500152
- Maher et al., Highly reproducible VO₂ oscillators, Sci. Rep. 14, 11600 (2024). https://www.nature.com/articles/s41598-024-61294-x
- Carapezzi et al., Ambient temperature and VO₂ oscillators, Sci. Rep. 12, 19377 (2022). https://www.nature.com/articles/s41598-022-23629-4
- Li et al., Calibratable VO₂ oscillatory neurons, IEEE EDL 47(3) 2026. https://doi.org/10.1109/LED.2025.3649000
- Romera et al., Vowel recognition with four coupled STNOs, Nature 563 (2018). https://arxiv.org/abs/1711.02704
- Vaidya, Bashar, Shukla, Using noise to augment synchronization, Sci. Rep. 11, 4462 (2021). https://arxiv.org/abs/2012.01355
- Unconventional AI, Introducing Un-0 (25 Jun 2026). https://unconv.ai/blog/introducing-un-0-generating-images-with-coupled-oscillators/ ; repo https://github.com/unconv-ai/Un-0
- Unconventional AI, Less is More: Scaling Dynamics with Sparsity (2026). https://unconv.ai/blog/less-is-more-scaling-dynamics-with-sparsity/
- Miyato et al., AKOrN, ICLR 2025. https://arxiv.org/abs/2410.13821
- Song et al., Kuramoto Orientation Diffusion Models, NeurIPS 2025. https://arxiv.org/abs/2509.15328
- Rageau & Grollier, Training and synchronizing oscillator networks with EqProp, NCE 5 (2025). https://arxiv.org/abs/2504.11884
- Gower, EqProp on Oscillator Ising Machines (2025). https://arxiv.org/abs/2505.02103 ; https://arxiv.org/abs/2510.12934
- Kumar & Mohanty, Autoassociative memory in micromechanical oscillator network, Sci. Rep. 7, 411 (2017). https://doi.org/10.1038/s41598-017-00442-y
- Du et al., Active oscillatory associative memory, J. Chem. Phys. 160 (2024). https://arxiv.org/abs/2307.13123

**Ising machines**
- Wang & Roychowdhury, OIM (2019). https://arxiv.org/abs/1903.07163
- Dutta et al., Ising solver with stochastic PTNOs, Nat. Electron. 4 (2021). https://arxiv.org/abs/2007.12331
- Inui & Yamamoto, Noise correlation and success probability in CIMs (2020). https://arxiv.org/abs/2009.10328
- Shi et al., CIM large-noise regime, Opt. Express 32 (2024). https://doi.org/10.1364/OE.522474
- Hasan et al., Breakdown of gradient flow in OIMs from harmonic misalignment (2026). https://arxiv.org/abs/2605.17243

**Analog in-memory computing and training**
- Rasch et al., HWA training…, Nat. Commun. 14, 5282 (2023). https://www.nature.com/articles/s41467-023-40770-4
- Joshi et al., Accurate DNN inference using computational PCM, Nat. Commun. 11, 2473 (2020). https://www.nature.com/articles/s41467-020-16108-9
- Garg et al., Dynamic Precision Analog Computing (2021). https://arxiv.org/abs/2102.06365
- Boybat et al., Multi-memristive synapses, Nat. Commun. 9, 2514 (2018). https://www.nature.com/articles/s41467-018-04933-y
- Wang et al., Variance-Aware Noisy Training (2025). https://arxiv.org/abs/2503.16183
- Antolini et al., PCM readout with reference conductance tracking, IEEE OJSSCS (2024). https://doi.org/10.1109/OJSSCS.2024.3432468
- Mannocci et al., Achieving high precision in AIMC, npj Unconv. Comput. 3, 1 (2026). https://www.nature.com/articles/s44335-025-00044-2

**Generative models on analog hardware**
- Wang & Achour, Generative Models on Analog Hardware with Dynamics (2026). https://arxiv.org/abs/2606.27294
- Feng et al., ASSERT (2026). https://arxiv.org/abs/2609.00955
- Feng et al., EtaMix, DATE 2026. https://doi.org/10.23919/DATE69613.2026.11539632
- Yao & Zhou, Guidance recalibration under CIM nonidealities (2026). https://arxiv.org/abs/2608.19644
- Krestinskaya, Choubey, James, Memristive GAN in Analog, Sci. Rep. 10, 5838 (2020). https://doi.org/10.1038/s41598-020-62676-7
- Wu et al., Harnessing optoelectronic noises in a photonic generative network, Sci. Adv. 8 (2022). https://arxiv.org/abs/2109.08622
- Aifer et al., Error Mitigation for Thermodynamic Computing (2024). https://arxiv.org/abs/2401.16231
- Kungl et al., Accelerated physical emulation of Bayesian inference, Front. Neurosci. 13 (2019). https://doi.org/10.3389/fnins.2019.01201

**Redundancy and error correction**
- Cross, Improving frequency precision of oscillators by synchronization, PRE 85 (2012). https://arxiv.org/abs/1109.3684
- Zhang et al., Synchronization and phase noise reduction in micromechanical oscillator arrays, PRL 115 (2015). https://arxiv.org/abs/1505.02009
- Kumar et al., Robust mutual synchronization in long SHNO chains, Nano Lett. 23 (2023). https://arxiv.org/abs/2301.03859
- Litvinenko et al., Phase noise analysis of mutually synchronized SHNOs, APL 122 (2023). https://arxiv.org/abs/2303.18097
- Behera et al., Ultra-large mutually synchronized SHNO networks (arXiv 2025; journal version cited by workers as Nat. Nanotechnol. 21, 2026 — journal title not independently verified). https://arxiv.org/abs/2501.18321
- Pomponio, Hati, Nelson, Ultra-low phase noise frequency division with DDS array, IEEE TIM 73 (2024). https://pmc.ncbi.nlm.nih.gov/articles/PMC10916524/
- Oya et al., Single-electron fault-tolerant spiking neural circuit, ISCAS 2005. https://doi.org/10.1109/ISCAS.2005.1465142
- Roth, Analog Error-Correcting Codes, IEEE TIT 66 (2020); Corrections, IEEE TIT 69 (2023). https://doi.org/10.1109/TIT.2020.2977918 ; https://doi.org/10.1109/TIT.2023.3234208
- Li, Roth, Graves, Sheng, Strachan, Analog ECC for defect-tolerant MVM in crossbars, IEDM 2020. https://doi.org/10.1109/IEDM13553.2020.9371978
- Wei & Roth, Multiple-error-correcting codes for analog computing on resistive crossbars (2024). https://arxiv.org/abs/2402.13503
- Pedretti et al., Redundancy and Analog Slicing, IEEE TED 68(9) Parts I/II (2021). https://doi.org/10.1109/TED.2021.3095433 ; https://doi.org/10.1109/TED.2021.3095430
- Yousuf et al., Layer ensemble averaging for fault tolerance in memristive NNs, Nat. Commun. 16, 1250 (2025). https://arxiv.org/abs/2404.15621
- Demirkiran et al., Blueprint for precise and fault-tolerant analog NNs, Nat. Commun. 15, 5098 (2024). https://doi.org/10.1038/s41467-024-49324-8
- Xu et al., Fault-free analogue computing with imperfect hardware, Nat. Electron. 9 (2026). https://arxiv.org/abs/2507.11134
- Nakamura et al., Ensemble Reservoir Computing for Physical Systems (2026). https://arxiv.org/abs/2601.21807

**Faults, yield and readout**
- Joksas et al., Committee machines…, Nat. Commun. 11, 4273 (2020). https://doi.org/10.1038/s41467-020-18098-0
- Xia et al., Stuck-at fault tolerance in RRAM computing systems, IEEE JETCAS 8 (2018). https://doi.org/10.1109/JETCAS.2017.2776980
- BanaGozar et al., ReMeCo, ASP-DAC 2023. https://doi.org/10.1145/3566097.3567889
- Yu et al., COLA, ICML 2023. https://proceedings.mlr.press/v202/yu23a.html
- Zhang et al., Bayesian yield optimization of analog/SRAM circuits, ASP-DAC 2020. https://doi.org/10.1109/ASP-DAC47756.2020.9045614
- Tung et al., Dynamic task remapping on ReRAM, DATE 2023. https://past.date-conference.com/proceedings-archive/2023/DATA/220.pdf
- Hong et al., Memristor-based adaptive ADC, Nat. Commun. 16, 9749 (2025). https://www.nature.com/articles/s41467-025-65233-w

**Physical neural networks and dynamical robustness**
- Wright et al., Deep physical neural networks trained with backpropagation, Nature 601 (2022). https://doi.org/10.1038/s41586-021-04223-6
- Cramer et al., Surrogate gradients for analog neuromorphic computing, PNAS 119 (2022). https://doi.org/10.1073/pnas.2109194119
- Çakal et al., HWA training for mixed-signal neuromorphic processors, NCE 4 (2024). https://doi.org/10.1088/2634-4386/ad2ec3
- Zendrikov et al., Robust computation in heterogeneous mixed-signal neuromorphic systems, NCE 3 (2023). https://doi.org/10.1088/2634-4386/ace64c
- Xu et al., PNNs using sharpness-aware training, Nat. Commun. 17 (2026). https://doi.org/10.1038/s41467-026-68470-9
- Vadlamani, Englund, Hamerly, Transferable learning on analog hardware, Sci. Adv. 9 (2023). https://doi.org/10.1126/sciadv.adh3436
- Bandyopadhyay, Hamerly, Englund, Hardware error correction for programmable photonics, Optica 8 (2021). https://doi.org/10.1364/OPTICA.424052
- Rodriguez et al., LyaNet, ICML 2022. https://proceedings.mlr.press/v162/rodriguez22a/rodriguez22a.pdf
- Haber & Ruthotto, Stable architectures for deep neural networks, Inverse Problems 34 (2018). https://arxiv.org/abs/1705.03341
- Liu et al., Neural SDE / How does noise help robustness, CVPR 2020. https://arxiv.org/abs/1906.02355

---

## Appendix: verification and limits

- **Citation spot-check (13 works, by this thread, via arXiv and web).** All existed with matching titles and authors:

  | Work | arXiv |
  |---|---|
  | Wang & Achour | 2606.27294 |
  | ASSERT | 2609.00955 |
  | Rageau & Grollier | 2504.11884 |
  | Karfakis & Gupta | 2611.08693 |
  | Shamsi et al. | 2211.05497 |
  | Hasan et al. | 2605.17243 |
  | Nakamura et al. | 2601.21807 |
  | Xu et al. | 2507.11134 |
  | Litvinenko et al. | 2303.18097 |
  | Yousuf et al. | 2404.15621 |
  | Behera et al. 105k SHNO | 2501.18321 |

  The Un-0 blog (unconv.ai) was also checked; its FIDs match. Two caveats:
  - Behera et al.: the journal title and volume quoted by workers were not reachable behind the Nature paywall.
  - Yousuf et al.: the arXiv title differs from the 2025 journal title, as the worker noted.
- **Seed references.** All verified by the workers. 2503.16183 is a generic-DNN paper (VANT), not oscillator-specific.
- **Coverage gaps.**
  - No exhaustive patent search.
  - Several paywalled papers were read at abstract level only. Each source file flags these.
  - Unconventional AI's internal work is unknown: absence from their public blog and repo is not absence.
