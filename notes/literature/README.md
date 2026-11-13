# Literature review: hardware noise and redundancy for Un-0

This is a literature review done before any Un-0 hardware-noise experiments, compiled on 2026-11-13. **Start with [SYNTHESIS.md](SYNTHESIS.md).**

## Files

| File | Contents |
|------|----------|
| [BRIEF.md](BRIEF.md) | Task brief: scope, topics and output format |
| [SYNTHESIS.md](SYNTHESIS.md) | Bottom line, table of the 25 key works, per-error state of the art, the RAID/redundancy analysis, novelty check of the 4-step plan, recommended plan and metric changes, bibliography |
| [sources/01-osc-hardware-variability.md](sources/01-osc-hardware-variability.md) | Oscillator hardware (VO₂, SHNO, CMOS, MEMS, photonic): mismatch, phase noise, calibration (24 entries) |
| [sources/02-kuramoto-ml-models.md](sources/02-kuramoto-ml-models.md) | Kuramoto and learned-oscillator ML: Un-0, AKOrN, EqProp, OscNet, associative memories (25) |
| [sources/03-ising-machines-noise.md](sources/03-ising-machines-noise.md) | Oscillator and coherent Ising machines: noise, variability, correction feedback (26) |
| [sources/04-aimc-hwa-training.md](sources/04-aimc-hwa-training.md) | Analog in-memory computing nonidealities, hardware-aware training, drift compensation (22) |
| [sources/05-generative-on-analog.md](sources/05-generative-on-analog.md) | Generative models on analog, optical and thermodynamic hardware (22) |
| [sources/06-analog-ecc-redundancy.md](sources/06-analog-ecc-redundancy.md) | Analog ECC, ABFT, multi-device and layer redundancy, oscillator phase-noise averaging (30) |
| [sources/07-physical-nn-training.md](sources/07-physical-nn-training.md) | Physical NNs, physics-aware and in-situ training, neuromorphic mismatch calibration (25) |
| [sources/08-dynamical-robustness.md](sources/08-dynamical-robustness.md) | Neural ODE/SDE, DEQ and reservoir robustness; few-step sampler error (23) |
| [sources/09-faults-yield-readout.md](sources/09-faults-yield-readout.md) | Faults, remapping, yield definitions, ADC and readout (26) |
| [sources/10-unconv-ai-and-peers.md](sources/10-unconv-ai-and-peers.md) | Unconventional AI publications, plus Extropic, Normal, Lightmatter, Mythic, EnCharge, Sagence, Rain (31) |
| `logs/` | Worker scripts (`run_worker.sh`, `topics.tsv`) and each worker's final reply (`*.last.md`). Full transcripts are not committed |

## How it was made
- **Phase 1:** ten Codex workers (`gpt-6.1-sol`, reasoning effort medium, live web search) each wrote one topic file. Each entry records type, scale, E1–E5 coverage, mitigation, numbers, relevance, and read status (full, partial or abstract-only).
- **Phase 2:** Claude Opus 5.5 read all ten files, spot-checked 13 citations (all exist), and wrote the synthesis.

## Caveats
- Most entries were read partially, and some are abstract-only.
- Numbers are the authors' reports and were not reproduced.
- "Not found" means not found in this search.
- No patent-clearance search was done.
