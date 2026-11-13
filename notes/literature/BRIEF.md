# Task: full literature review before we run any Un-0 hardware-noise experiments

You are working for Joao on `/home/joao/Work/un0-hardware-noise` (branch `hardware-noise`, a fork of unconv-ai/Un-0). The project tests how Un-0, Unconventional AI's coupled-Kuramoto-oscillator image generator, holds up under simulated analog-hardware imperfections, and which fixes work. Read `notes/hardware-error-catalog.md` first. It defines 5 error types:
- E1: manufacturing mismatch (offsets on omega/K/K_drive)
- E2: random jitter (Euler–Maruyama in place of odeint)
- E3: shared drift
- E4: faults
- E5: readout noise

It also has a 4-step plan: each error alone with no fix; each with its matching fix; random combinations over many simulated chips (yield); optional noise-aware fine-tuning. Joao's candidate fix is RAID-style redundancy: circular-mean averaging of oscillator copies, analog error-correcting codes, and redundancy over learned features.

Joao worries we may just be repeating published work. Your job is a **full, systematic literature review** so we know what the field has done before experimenting. **Do not run any experiments.** When done, stop and wait for Joao.

## Shell setup
Non-interactive shells need `export PATH=$HOME/.local/bin:$PATH`. Don't use `uv sync` (it pins CUDA wheels). Not needed for this task anyway.

## Phase 1: gather with Codex workers on GPT-6.1 Sol, medium effort
Run one Codex worker per topic below, in parallel batches of about 5, as background shell jobs. Base invocation:

```
codex exec -m gpt-6.1-sol -c model_reasoning_effort="medium" -C /home/joao/Work/un0-hardware-noise \
  -s workspace-write --skip-git-repo-check -o notes/literature/logs/<slug>.last.md "<worker prompt>" \
  > notes/literature/logs/<slug>.log 2>&1
```

Workers need live web search. Before launching the batch, run a 1-minute smoke test to confirm search works in `codex exec` with this CLI version (codex-cli 0.167). Try the documented web-search config/flag, e.g. `-c web_search="live"` or `--search`; check `codex exec --help` and `codex --help`. Workers also need network access, so if the workspace-write sandbox blocks it, adjust the sandbox setting. Don't fall back to a different model without telling Joao.

Each worker writes exactly one file: `notes/literature/sources/<NN>-<slug>.md`. Tell each worker to:
- Search broadly: arXiv, Google Scholar-style queries, IEEE, Nature/Science, NeurIPS/ICLR/ICML, DATE/ISSCC/IEDM, company blogs, theses, patents. Cover 2015–2026, prioritising 2022–2026. Follow citation trails both ways from the key papers. Aim for 15–40 relevant entries, quality over padding.
- Open and read papers, not just snippets, where possible. Record whether each entry was read in full or abstract-only.
- Give each entry: full citation + URL; year; venue; type (**hardware demonstration** / simulation / theory / proposal / review); system and scale (e.g. number of oscillators or devices); which of E1–E5 it covers; mitigation used; key quantitative results; relevance to Un-0 (high/med/low, with one line why).
- Start the file with a 10-line topic summary. End it with "Gaps / open questions noted by the literature".
- Never invent citations. If unsure a paper exists, leave it out.

Topics (slug: scope):
1. `osc-hardware-variability`: oscillatory neural networks and oscillator computing hardware (VO2, spin-torque/spin-Hall nano-oscillators, CMOS ring and relaxation oscillators, ReRAM-coupled, MEMS, photonic). Covers device mismatch, frequency dispersion, phase noise, coupling variability, calibration.
2. `kuramoto-ml-models`: Kuramoto and learned-oscillator ML models (AKOrN, Kuramoto orientation diffusion, equilibrium propagation on oscillators, OscNet, oscillator Hopfield/associative memory, Un-0) and any robustness or perturbation analysis of them.
3. `ising-machines-noise`: oscillator-based Ising machines and coherent Ising machines. Covers noise, variability, and noise-as-resource, plus how robustness is reported and mitigated at scale.
4. `aimc-hwa-training`: analog in-memory computing non-idealities and hardware-aware / noise-injection training (IBM AIHWKit, PCM/RRAM drift and programming noise, variance-aware training, drift compensation, global calibration), including what doesn't work.
5. `generative-on-analog`: generative models on noisy/analog/physical hardware. Covers diffusion on compute-in-memory (EtaMix, ASSERT, guidance recalibration), analog diffusion models, optical generative models, resistive-memory score solvers, thermodynamic/probabilistic computing (Extropic, Normal Computing), physical generative models.
6. `analog-ecc-redundancy`: error correction and redundancy for analog computation. Covers Roth's analog ECC and follow-ups, algorithm-based fault tolerance, redundancy/multi-device per weight, ensemble/layer averaging, TMR analogues for analog, coded computation, and **phase/circular-mean averaging or redundancy in oscillator systems** (search hard for this one).
7. `physical-nn-training`: physical neural networks and in-situ / physics-aware / digital-twin training (Wright & McMahon), sim-to-real gap, chip-in-the-loop calibration. Also mixed-signal neuromorphic mismatch (BrainScaleS, DYNAP-SE, Loihi-analog) and how they calibrate.
8. `dynamical-robustness`: robustness of neural ODEs and continuous-time / reservoir systems to parameter perturbation and stochastic (SDE) noise. Covers noise as regularisation, sensitivity/Lyapunov analysis, physical reservoir computing under noise, and robustness of implicit/equilibrium models.
9. `faults-yield-readout`: fault and yield modelling for analog/AI accelerators. Covers Monte Carlo process-variation yield, stuck-at and dead units, aging/drift, ADC/readout noise and quantisation, fault-tolerant DNN methods, and metrics used to report yield.
10. `unconv-ai-and-peers`: everything Unconventional AI (unconv.ai, Naveen Rao) has published or said, including the Un-0 paper/report, talks, patents and job posts touching hardware non-idealities. Same for peer startups (Extropic, Normal Computing, Lightmatter, Mythic, EnCharge, Sagence, Rain, etc.) on robustness.

Seed references from an earlier quick search (verify; don't trust blindly): arXiv 2211.05497 (DONN mismatch), 2504.11884 (EqProp Kuramoto), 1808.08412, Nat. Commun. 2023 s41467-023-40770-4 (HWA training), arXiv 2503.16183, DATE 2026 EtaMix, arXiv 2609.00955 (ASSERT), 2608.19644, 2404.05648, Roth analog ECC, arXiv 2402.13503, Pedretti redundancy & slicing TED Parts I/II, arXiv 2404.15621, 2102.06365, Wright et al. Nature 2022, npj Unconv. Comput. s44335-024-00015-z, Un-0 blog + repo (no hardware-noise analysis found there).

When the workers finish, check every file exists and is substantive. Re-run or patch any weak topic. Spot-check about 10 citations across files for existence.

## Phase 2: synthesis (you, Opus 5.5, medium effort)
Read all source files. You may use Claude subagents (model opus) to cross-check clusters. Write `notes/literature/SYNTHESIS.md`:
1. **Bottom line** (≤10 lines): has anyone done what we planned? Which parts are novel, which are replication?
2. **Demonstrated vs proposed**: a table of the most relevant ~25 works with type, scale, error types, mitigation, headline number.
3. **Per error type E1–E5**: state of the art, typical tolerances, best-supported mitigations with numbers, and what's unknown for oscillator generators.
4. **Redundancy / RAID idea**: what exists (crossbar redundancy, analog ECC, ensembles, any phase-domain averaging), expected payoff, cost, and whether circular-mean redundancy for phases has been done.
5. **Novelty check of our 4-step plan**: for each step, give the closest prior work and how ours differs. Mark it as worth doing, worth doing but known, or skip.
6. **Recommended changes to the plan and metrics**, e.g. metrics the field uses, noise magnitudes to sweep taken from real devices, and baselines to compare against.
7. **Bibliography** with links.

Also write `notes/literature/README.md`, an index of the files. Be honest about uncertainty and abstract-only sources.

## Wrap-up
Commit `notes/literature/` (logs may be omitted or kept small) to `hardware-noise` and push to `origin` (Joao's public fork). **Never push to upstream.** Keep the repo-local git identity as is; never use a personal email. End the commit message with:

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>

Then post a concise summary (bottom line + top 5 findings + plan changes) and wait for Joao. Do not start experiments.
