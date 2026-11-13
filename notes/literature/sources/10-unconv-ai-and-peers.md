# Unconventional AI and peer startups: hardware non-idealities and robustness

Search cut-off: 2026-11-13; scope: 2015–2026, with emphasis on 2022–2026.
Un-0 is verified as a company technical report/blog and open software release; this search did not establish a separate peer-reviewed Un-0 paper.
Unconventional explicitly discusses noise, unintended coupling, drift, numerical fidelity, and training around memory errors; these concerns are not absent from its public research.
Its sparse Un-0 follow-up studies connectivity and trainability, rather than post-training fault tolerance or redundant oscillator copies.
The current source already includes relative-phase readout, relevant to common-mode rejection, but not a demonstrated E1–E5 correction suite.
Normal Computing supplies especially close prior art: Thermies combines samples from imprecisely programmed distributions, with an eight-node hardware demonstration.
Extropic reports both physical noise primitives and foundry-model manufacturing-variation simulations; useful stochasticity is distinguished from parameter error.
Lightmatter and related academic work demonstrate calibration, stabilization, hardware-aware training, and extra optical components for error tolerance.
Mythic, EnCharge's academic lineage, Sagence, and Rain provide further evidence for analog-aware training, statistical compensation, feature partitioning, and reference-based drift correction.
No inspected source establishes the specific combination of Un-0, circular-mean copy redundancy/analog codes, isolated E1–E5 tests, and combined-error chip-yield evaluation; this is a bounded search finding, not proof of novelty.

## Entries

Error labels follow `notes/hardware-error-catalog.md`: E1 fixed manufacturing mismatch; E2 stochastic integration noise; E3 shared temperature/aging drift; E4 hard faults; E5 readout error. Labels applied to non-oscillator systems are **analogies**, not claims of identical error physics. Quantization and model-form error are recorded separately. “Not reported” means no defensible numerical result was located in the material inspected. Read status describes the inspected version, not every supplement. Corporate authorship is used for unsigned company posts; long author lists use conventional “et al.” citations.

### 01. Un-0 original technical report

**Citation:** Unconventional AI. “Introducing Un-0: Generating Images with Coupled Oscillators.” Company technical blog/report, 25 June 2026. [Report](https://unconv.ai/blog/introducing-un-0-generating-images-with-coupled-oscillators/).

- **Year / venue / type:** 2026 / Unconventional AI blog / simulation.
- **System and scale:** Class-conditional Kuramoto generator; 1,024–4,096 main oscillators for CIFAR-10 and 6,656–16,384 for ImageNet-64; learned dynamics and conventional decoder.
- **E1–E5 coverage:** None systematically swept. Random initial phases are a generative prior, not E2 integration jitter. Changing inference duration/step count is not a manufacturing-error test.
- **Mitigation:** No copy averaging, analog error-correcting code, or fault remapping reported. Ablations separate learned dynamics, frozen reservoirs, and decoder-only generation.
- **Quantitative results:** ImageNet-64 FID 6.74 with 16,384 oscillators and 322.44M parameters; report CIFAR-10 FID 8.76 with 4,096 oscillators. The approximately 1,000× efficiency ambition is not a measured silicon result.
- **Relevance:** **High** — establishes the model and clean benchmark, without establishing hardware robustness.
- **Read status:** **partial** — technical body, benchmark tables, ablations, references and portions of appendix; no independent reproduction.

### 02. Un-0 repository and relative-phase readout

**Citation:** Unconventional AI / unconv-ai contributors. *Un-0*. GitHub software repository, 2026; main branch inspected 13 November 2026. [Repository](https://github.com/unconv-ai/Un-0), [model source](https://github.com/unconv-ai/Un-0/blob/main/un0/model.py).

- **Year / venue / type:** 2026 / GitHub / simulation.
- **System and scale:** Six released checkpoints; main and conditioning oscillator populations, `omega`, `K`, `K_cond`, and class-dependent `K_drive`; deterministic ODE integration after initialization.
- **E1–E5 coverage:** No E1–E5 injection suite identified in the inspected README/model. Readout supports absolute, mean-relative, reference-oscillator, and pairwise phases.
- **Mitigation:** Default `ReadoutTransform` uses `ref_oscillator`: subtract phase zero, then encode sine/cosine. This is relative-coordinate processing, not redundant copies or an ECC. The mean-relative option uses an arithmetic phase mean.
- **Quantitative results:** README clean-FID values are 8.86, 9.38, 11.16 for CIFAR-10 n4096/n2048/n1024, differing slightly from the launch report. ImageNet-64 best remains 6.74. Checkpoint configuration, rather than constructor defaults, determines actual integration settings.
- **Relevance:** **High** — provides a pre-existing common-phase rejection mechanism and precise injection locations.
- **Read status:** **partial** — README and model dynamics/readout/integration source; no code executed or weights downloaded.

### 03. Analog noise and the system energy budget

**Citation:** Unconventional AI. “Analog is dead, long live analog!” Company research blog, 30 April 2026. [Article](https://unconv.ai/blog/analog-is-dead-longlive-analog/).

- **Year / venue / type:** 2026 / company blog / proposal.
- **System and scale:** Analog/digital dot-product engines and mixed-signal AI systems; no new oscillator chip demonstration.
- **E1–E5 coverage:** E2/E5 analog thermal-noise and conversion-precision tradeoffs; analog error accumulation discussed qualitatively. No E4 experiment.
- **Mitigation:** Joint model/hardware design; possible larger models to recover accuracy; strong nonlinearities proposed to control accumulated analog errors.
- **Quantitative results:** Thermal noise scales as √(kT/C), so one additional precision bit requires approximately 4× capacitance/energy in the discussed regime. Compares low precision of 1–4 bits with rapidly rising analog cost above roughly 8 bits. Gives digital 4-bit MAC efficiency exceeding 100 TOPS/W as context, not an Un-0 measurement.
- **Relevance:** **High** — explicitly recognizes that robustness overhead can erase an attractive compute-array energy number.
- **Read status:** **full** — article text and figure captions; cited historical analyses not independently audited here.

### 04. Digital twins must include non-ideal dynamics

**Citation:** Unconventional AI. “System Modeling: The Substrate for Neural Co-Evolution.” Company research blog, 11 June 2026. [Article](https://unconv.ai/blog/system-modeling-the-substrate-for-neural-co-evolution/).

- **Year / venue / type:** 2026 / company blog / simulation.
- **System and scale:** Double-pendulum proxy illustrating the company’s hardware-modeling methodology; two mechanical joints, not an oscillator-chip benchmark.
- **E1–E5 coverage:** Explicitly names circuit noise, unintended couplings and drift: E1/E2/E3 analogies plus model-form error. E4/E5 are not separately quantified.
- **Mitigation:** Non-ideal digital twins, solver-fidelity checks, and co-design of physical abstractions and training models.
- **Quantitative results:** Illustrative trajectories cover about 10 seconds. Compares coarse Euler integration with higher-order DoPri qualitatively; no numerical Un-0 sensitivity threshold, manufacturing yield, or correction gain is supplied.
- **Relevance:** **High** — directly anticipates the concern that idealized training exploits dynamics that disappear with physical perturbations.
- **Read status:** **full** — text, captions and qualitative comparison descriptions; animations were not independently measured.

### 05. Training around imperfect parameter memory

**Citation:** Unconventional AI. “Smoothing the Triangle: Rethinking the Memory Stack for Unconventional AI.” Company research blog, 9 July 2026. [Article](https://unconv.ai/blog/smoothing-the-triangle-rethinking-the-memory-stack-for-unconventional-ai/).

- **Year / venue / type:** 2026 / company blog / proposal.
- **System and scale:** PCM/RRAM parameter storage and short-retention working memory; no demonstrated Un-0 memory array.
- **E1–E5 coverage:** E1 variability, E2 noise, E3 retention/drift analogies; symbol/bit errors also discussed without separating hard faults from stochastic corruption.
- **Mitigation:** Accept higher error rates, train models around errors, choose more noise-resilient model families, and manage retention architecturally.
- **Quantitative results:** Suggests programming below 1 µS as an efficiency direction; gives roughly 100 ms conventional DRAM retention as context. No measured error-rate-versus-FID curve or noise-aware Un-0 fine-tuning result.
- **Relevance:** **High** — public evidence that noise-aware training is already part of the company’s research argument, although no oscillator-redundancy result follows.
- **Read status:** **full** — article; followed its links to a 2024 noise-aware-finetuning workshop abstract and neural-ODE robustness work. Those are external antecedents, not company demonstrations.

### 06. Sparse and modular Un-0

**Citation:** Unconventional AI. “Less is More: Scaling Dynamics with Sparsity.” Company research blog, 13 August 2026. [Report](https://unconv.ai/blog/less-is-more-scaling-dynamics-with-sparsity/).

- **Year / venue / type:** 2026 / company blog / simulation.
- **System and scale:** Un-0 on CIFAR-10/ImageNet-64, plus MNIST1D and Stacked MNIST; fixed random masks or disconnected oscillator modules.
- **E1–E5 coverage:** E4-adjacent topology removal, but **not** post-training broken-coupling injection. Stability concerns are synchronization collapse and trainability, not measured E1–E5 tolerance.
- **Mitigation:** Train sparse/modular systems from the outset to reduce connectivity and preserve diverse dynamics.
- **Quantitative results:** Reports removing 50%–98.4% of interactions. A 16-module ImageNet-64 variant achieves FID 7.15, approximately 1.9 better than its dense comparison. The article alternates n6656/n6657 labels; retain its comparison rather than equating that baseline with every released checkpoint. CIFAR FID improvements correlate with recall at 0.924 versus precision at −0.114.
- **Relevance:** **High** — feature specialization and module independence could inform redundancy, but intentional sparsity does not prove tolerance to arbitrary failed learned couplings.
- **Read status:** **partial** — main results, mechanisms, captions and related-work discussion; no reruns.

### 07. Explicitly funded work on noise and drift

**Citation:** Unconventional AI; project abstract by Logan Wright, Yale University. “Announcing the 2026 Unconventional Grant Winners,” especially “Noise as a Resource (Or at Least Not a Hindrance): Physical Neural Scaling Laws for Co-Designed AI Hardware.” 10 September 2026. [Announcement](https://unconv.ai/blog/2026-unconventional-grant-winners/).

- **Year / venue / type:** 2026 / company grant announcement / proposal.
- **System and scale:** Proposed electronic physical neural networks; no disclosed device count or completed oscillator experiment.
- **E1–E5 coverage:** Explicit E2 noise and E3 environmental drift; mismatches between mathematical and physical dynamics also identified. No distinct E4/E5 study.
- **Mitigation:** Derive physical scaling laws and co-design architectures/algorithms respecting realizable hardware constraints.
- **Quantitative results:** Five projects receive $100,000 each, from nearly 100 submissions. These are funding figures, not robustness improvements; no numerical mitigation result is reported.
- **Relevance:** **High** — prevents treating robustness as an issue the company has overlooked; the disclosed work is prospective.
- **Read status:** **partial** — announcement and complete Wright project abstract; other project abstracts screened for relevance.

### 08. Rao interview: noisy computation as a design premise

**Citation:** Eric Choi, interviewer; Naveen Rao, interviewee. “Breaking 80 Years of Computing Rules: Unconventional AI Redesigns the Foundations of AI Compute.” *Palo Alto Capital / Founder Chats*, 3 June 2026; HumanX interview and written follow-up. [Interview](https://paloaltocapital.substack.com/p/unconventionalai).

- **Year / venue / type:** 2026 / published interview / proposal.
- **System and scale:** Unconventional’s time-evolving silicon-computation vision; no disclosed oscillator-chip size.
- **E1–E5 coverage:** E2 broadly: Rao explicitly asks whether imperfectly repeatable, noisy physics can support AI. No separated E1–E5 test protocol.
- **Mitigation:** Neural/hardware co-evolution and task-specific tolerance of imperfect arithmetic; no described calibration algorithm or redundant-copy decoder.
- **Quantitative results:** Approximately 1,000× efficiency is a target. No measured noise distribution, tolerated mismatch, failure fraction or FID degradation is provided.
- **Relevance:** **High** — a first-person statement of intended noise tolerance, not evidence that the proposed fixes have been validated.
- **Read status:** **partial** — relevant first-person Q&A sections and interview provenance; no independent listening to the conference panel.

### 09. Unconventional runtime/firmware job disclosure

**Citation:** Unconventional AI. “Member of Technical Staff, System Software (Runtime & Firmware).” Employer job posting on LinkedIn, undated; accessed 13 November 2026. [Listing](https://www.linkedin.com/jobs/view/member-of-technical-staff-system-software-runtime-firmware-at-unconventional-ai-4471769862).

- **Year / venue / type:** 2026 observation; publication date unconfirmed / employer recruitment listing / proposal.
- **System and scale:** Host runtime and on-device SoC firmware, targeting both simulation and silicon; dimensions undisclosed.
- **E1–E5 coverage:** Calibration and measured-hardware/simulation correlation explicitly assigned as responsibilities; the listing does not specify which error channels are calibrated.
- **Mitigation:** Firmware calibration, silicon bring-up, and closing the loop between measured behavior and system models.
- **Quantitative results:** No calibration accuracy, drift interval, yield, hardware scale or robustness benchmark reported. A 1,000× efficiency mission is not a measured result.
- **Relevance:** **Med** — evidence of planned operational calibration, insufficient to infer its implementation or effectiveness.
- **Read status:** **partial** — role and responsibilities retrieved; subsequent retrieval redirected. Company careers landing page exposed no equivalent technical details in readable text.

### 10. DS-ISA: wear-leveling and control, not error correction

**Citation:** Ang Li / Unconventional AI. “Speaking the Language of Physics: Introducing the First Instruction Set Architecture (ISA) for Dynamical System Hardware.” Company blog, 30 June 2026, discussing Chunshu Wu, Ruibing Song, Chuan Liu, Tong Geng and Ang Li, “DS-ISA: Instruction Set Architecture for Dynamical System Units,” *ISCA*, 2026, pp. 1689–1703. [Blog](https://unconv.ai/blog/speaking-the-language-of-physics-introducing-the-first-instruction-set-architecture-isa-for-dynamical-system-hardware/), [paper DOI](https://doi.org/10.1109/ISCA66397.2026.00123).

- **Year / venue / type:** 2026 / company account of ISCA research / proposal.
- **System and scale:** Dynamical-system-unit controller; physical node/coupling groups, load/lock/evolve/store operations.
- **E1–E5 coverage:** E3/E4-adjacent lifetime management; no measured aging/fault tolerance established by the blog.
- **Mitigation:** Fine-grained masks permit partitioning and proposed runtime wear-leveling; not demonstrated spare-node recovery or ECC.
- **Quantitative results:** Nine instructions; five composable execution phases. No numerical robustness result.
- **Relevance:** **Med** — identifies control mechanisms that could support calibration/remapping. Blog explicitly says the research predates Li joining Unconventional.
- **Read status:** **partial** — complete technical blog; underlying paper metadata verified, paper not read.

### 11. Thermies: ensemble mitigation on actual thermodynamic hardware

**Citation:** Maxwell Aifer, Denis Melanson, Kaelan Donatella, Gavin Crooks, Thomas Ahle and Patrick J. Coles. “Error Mitigation for Thermodynamic Computing.” arXiv:2401.16231, 2024. [Paper](https://arxiv.org/abs/2401.16231), [HTML](https://arxiv.org/html/2401.16231v1).

- **Year / venue / type:** 2024 / arXiv / hardware demonstration.
- **System and scale:** Normal Computing Gaussian sampler; eight fully coupled PCB cells and 8×8 matrix inversion; simulations beyond dimension 1,000.
- **E1–E5 coverage:** Primarily finite programming precision, **not automatically E1 unknown manufacturing mismatch**. Thermal sampling noise is computationally useful E2-like stochasticity. E3–E5 not separately evaluated.
- **Mitigation:** Stochastically choose neighboring rounded parameter settings and merge their samples, canceling first-order distribution error. This is mixture sampling, not averaging corresponding oscillator phases.
- **Quantitative results:** Small-imprecision distribution error changes from O(ε) to O(ε²). Hardware inversion error falls about 20% using four ensemble draws; reported curves average ten repetitions. Ensemble covariance error scales approximately M⁻¹ᐟ².
- **Relevance:** **High** — close ensemble-based mitigation precedent, but its guarantees require suitable realizable distributions and do not establish nonlinear Un-0 trajectory correction.
- **Read status:** **partial** — main argument, quantitative figures and hardware implementation; supplement sections inspected selectively.

### 12. Normal Computing SPU: three devices and non-ideal circuit models

**Citation:** Denis Melanson, Mohammad Abu Khater, Maxwell Aifer, Kaelan Donatella, Max Hunter Gordon, Thomas Ahle, Gavin Crooks, Antonio J. Martinez, Faris Sbahi and Patrick J. Coles. “Thermodynamic computing system for AI applications.” *Nature Communications* **16**, 3757, 2025; preprint arXiv:2312.04836, 2023. [Paper](https://doi.org/10.1038/s41467-025-59011-x), [full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC12015238/).

- **Year / venue / type:** 2025 / Nature Communications / hardware demonstration.
- **System and scale:** Eight fully connected RLC PCB cells; proposed integrated resistive architecture modeled up to 20 cells.
- **E1–E5 coverage:** E1 component tolerances, E2 driven stochastic dynamics, E5 ADC overhead/measurement; quantized coupling included. No systematic E3/E4 yield study.
- **Mitigation:** Statistical estimation over time; links to Thermies for imprecision rather than claiming averaging eliminates tolerance error.
- **Quantitative results:** 8×8 inversion repeated on three nominally identical SPUs, with 12,000 samples per device. A 20-cell, 8-bit-bank non-ideality comparison shows approximately 2% asymptotic error; a separate timing/energy configuration table reports 4%, so these should not be conflated.
- **Relevance:** **High** — explicit multi-device reproducibility and realistic circuit-model precedent, below the scale and error combinations of the proposed yield study.
- **Read status:** **partial** — results, non-ideality discussion and methods tables; supplement not fully read.

### 13. Thermodynamic linear algebra distinguishes noise from mismatch

**Citation:** Maxwell Aifer, Kaelan Donatella, Max Hunter Gordon, Samuel Duffield, Thomas Ahle, Daniel Simpson, Gavin Crooks and Patrick J. Coles. “Thermodynamic linear algebra.” *npj Unconventional Computing* **1**, 13, 2024. [Paper](https://doi.org/10.1038/s44335-024-00014-0), [author-hosted PDF](https://threeplusone.com/pubs/Aifer2024a.pdf).

- **Year / venue / type:** 2024 / npj Unconventional Computing / theory.
- **System and scale:** d-dimensional coupled harmonic systems for linear solves, inverse, determinant and Lyapunov equations; no new chip.
- **E1–E5 coverage:** E1 mismatch and E2 thermal fluctuations explicitly separated; model nonlinearity and finite programming precision also identified. Readout resolution creates an E5-like limitation.
- **Mitigation:** Time averages of equilibrium moments; stochastic rounding for imprecision. Authors explicitly state that the latter does not remedy component mismatch. Smaller signals reduce nonlinear effects but demand more sensitive measurement.
- **Quantitative results:** Overdamped matrix-inverse runtime bound O(d²κε⁻²), exposing the precision cost; claimed speedup is asymptotic and assumption-dependent. No mismatch-tolerance threshold is established.
- **Relevance:** **High** — rejects the inference that making noise useful automatically solves fixed hardware error.
- **Read status:** **partial** — journal algorithms, scaling table and “Noise resilience and error mitigation”; preprint HTML also inspected.

### 14. Matrix exponentials: distribution statistics versus individual trajectories

**Citation:** Samuel Duffield, Maxwell Aifer, Gavin Crooks, Thomas Ahle and Patrick J. Coles. “Thermodynamic matrix exponentials and thermodynamic parallelism.” *Physical Review Research* **7**, 013147, 2025. [Paper](https://doi.org/10.1103/PhysRevResearch.7.013147), [supplement](https://journals.aps.org/prresearch/supplemental/10.1103/PhysRevResearch.7.013147/Thermodynamic_Matrix_Exponentials_PRR_sup_mat.pdf).

- **Year / venue / type:** 2025 / Physical Review Research / theory.
- **System and scale:** d-node Langevin circuits; matrix exponential inferred from delayed correlations. Circuit proposal and numerical analysis, not a measured processor.
- **E1–E5 coverage:** E1 mismatch, E2 thermal/shot noise, finite programming precision, nonlinear components and E5 measurement-resolution tradeoffs.
- **Mitigation:** Correlation/time averaging and Thermies-style rounding for precision error; mismatch left for separate strategies.
- **Quantitative results:** Statistical RMS-error bound decreases as T⁻¹ᐟ² with averaging time T; predicted dimension-linear speedup under stated assumptions. The supplement's 20% mitigation figure cites earlier inversion work, not a new matrix-exponential experiment.
- **Relevance:** **High** — explicitly contrasts computation using equilibrium moments with computing a function from an individual noisy ODE trajectory, the latter being closer to fixed-seed Un-0.
- **Read status:** **partial** — abstract, preprint algorithm and journal supplement noise-resilience/convergence sections.

### 15. Extropic denoising models include manufacturing Monte Carlo

**Citation:** Andraž Jelinčič, Owen Lockwood, Akhil Garlapati, Peter Schillinger, Isaac L. Chuang, Guillaume Verdon and Trevor McCourt. “An efficient probabilistic hardware architecture for diffusion-like models.” *npj Unconventional Computing* **3**, 30, 2026; preprint arXiv:2510.23972, 2025. [Paper](https://doi.org/10.1038/s44335-026-00075-3), [preprint HTML](https://arxiv.org/html/2510.23972v2).

- **Year / venue / type:** 2026 / npj Unconventional Computing / simulation.
- **System and scale:** Denoising thermodynamic models using sparse Boltzmann machines, typically 70×70 binary variables and 12-neighbor connectivity; measured RNG primitive supports architecture projections.
- **E1–E5 coverage:** E1 foundry-PDK process corners and within-chip variation; E2 native stochastic sampling/autocorrelation. No E1–E5 combined image-quality/yield sweep located.
- **Mitigation:** All-transistor noise-aware circuit design; regular sparse architecture; training penalty controls sampling correlations/mixing. Not oscillator-copy averaging.
- **Quantitative results:** About 200 RNG realizations per process corner, across three corners. Measured RNG correlation time approximately 100 ns. Approximately 10,000× lower image-generation energy is a system-model projection on Fashion-MNIST, not a measured full-chip image-generation result.
- **Relevance:** **High** — direct manufacturing-variability precedent; the numerical process study concerns primitive speed/energy, not generative yield under five error channels.
- **Read status:** **partial** — preprint architecture, Fig. 4 and variation discussion; journal abstract/discussion and metadata; appendices selectively inspected.

### 16. Extropic experimentally controls intrinsic fluctuations

**Citation:** Nahuel Freitas, Geremia Massarelli, Jeremy Rothschild, Dylan Keane, Ethan Dawe, Sewook Hwang, Akhil Garlapati and Trevor McCourt. “Taming nonequilibrium thermal fluctuations in subthreshold CMOS circuits.” *Physical Review Applied* **25**, 034061, 2026. [Paper](https://doi.org/10.1103/5l2z-3f1h), [PDF](https://journals.aps.org/prapplied/pdf/10.1103/5l2z-3f1h).

- **Year / venue / type:** 2026 / Physical Review Applied / hardware demonstration.
- **System and scale:** Capacitively coupled CMOS inverters fabricated in an advanced TSMC FinFET process; two-node Gaussian-sampler demonstration.
- **E1–E5 coverage:** E2 thermal/shot stochasticity; low-frequency pink noise and extrinsic/amplifier noise relevant to E3/E5. Not a manufacturing-yield or dead-device study.
- **Mitigation:** Bias-controlled effective conductance/temperature; fit measured covariance and spectral contributions to a physical stochastic model.
- **Quantitative results:** Example supplies 137±1 and 142±1 mV. Fitted-parameter analysis estimates approximately 15 aJ per independent sample and a practical minimum correlation time near 1 ns; these are conditional estimates, not full-system energy measurements.
- **Relevance:** **Med** — useful evidence on realistic noise spectra and model identification; Gaussian voltage fluctuations differ from learned Kuramoto phase trajectories.
- **Read status:** **partial** — main experiments and spectral/model-fitting appendices; journal correction dated 3 April 2026 noted.

### 17. Torx and XTR-0 expose controlled stochastic primitives

**Citation:** Guillaume Verdon, Leo Tyrpak, Owen Lockwood, Seth Morton, Alexander Neagoe, Anton Sugolov, Ian MacCormack and Mirko Amico. “A Framework for Stochastic Differentiable Programming.” arXiv:2608.01612, 2026. [Paper](https://arxiv.org/abs/2608.01612), [HTML](https://arxiv.org/html/2608.01612v1).

- **Year / venue / type:** 2026 / arXiv / hardware demonstration.
- **System and scale:** Parameterized stochastic circuits; X0/XTR-0 supplies physical randomness to a hybrid host/FPGA workflow. This is not a fully analog execution of every demonstrated application.
- **E1–E5 coverage:** E2 sampling/autocorrelation and E5 amplification/digitization boundaries; no E1–E5 mitigation benchmark.
- **Mitigation:** Typed stochastic kernels, closed-loop control of primitive parameters, and sampling intervals respecting relaxation time.
- **Quantitative results:** X0 controls use 8-bit DACs; representative pbit decorrelation about 100 ns. In a separate simulated 28×28 binary-MNIST example, 50 additional correlated gates close 41% of the FID gap and reduce bit error from 0.114 to 0.113; this is algorithmic discretization repair, not hardware-fault correction.
- **Relevance:** **Med** — concrete control/readout interfaces and statistical fidelity distinctions for physical stochastic computing.
- **Read status:** **partial** — framework, selected demonstrations and X0 platform appendix.

### 18. Thermalizers: error propagation can contract or accumulate

**Citation:** Mirko Amico, Andraž Jelinčič, Colin Oscar Nancarrow, Leo Tyrpak, David Roberts, Seth Morton, Dalton Sakthivadivel, Ashwin Gopal and Guillaume Verdon. “Thermalizing Stochastic Programs.” arXiv:2608.01615, 2026, v2. [Paper](https://arxiv.org/abs/2608.01615), [HTML](https://arxiv.org/html/2608.01615v2).

- **Year / venue / type:** 2026 / arXiv / theory.
- **System and scale:** Stochastic programs compiled to hardware-native energy-based kernels; enumerable 12-spin example and proposed Z1 mappings.
- **E1–E5 coverage:** Addresses topology/coupling constraints, optimization residual and incomplete mixing; these are not direct E1–E5 injection experiments. E2-like sampling bias is relevant.
- **Mitigation:** Model-context matching and trajectory-level REINFORCE post-training; contraction bounds assess propagation of residual errors.
- **Quantitative results:** For contraction ρ<1, accumulated total-variation error is bounded by max per-step error/(1−ρ). In the 12-spin example ρ≈0.28 and the measured stationary error plateau is reached around three sweeps. The plateau comparison excludes the Z1 lattice-connectivity constraint.
- **Relevance:** **High** — a recent, explicit peer treatment of error accumulation and retraining; no guarantee transfers directly to deterministic phase-space trajectories.
- **Read status:** **partial** — compilation/residual sections, contraction bound, Fig. 12 and relevant appendix.

### 19. Lightmatter: calibration and stabilization in a large photonic processor

**Citation:** Sufi R. Ahmed, Reza Baghdadi, Mikhail Bernadskiy, et al. “Universal photonic artificial intelligence acceleration.” *Nature* **640**, 368–374, 2025. [Paper](https://doi.org/10.1038/s41586-025-08854-x), [company account](https://lightmatter.com/blog/a-new-kind-of-computer/), [paper PDF mirror](https://radicaldatascience.wordpress.com/wp-content/uploads/2025/04/nature-paper-_universal-photonic-artificial-intelligence-acceleration_.pdf).

- **Year / venue / type:** 2025 / Nature / hardware demonstration.
- **System and scale:** Four 128×128 photonic tensor cores and two digital control dies; mixed photonic/electronic processor.
- **E1–E5 coverage:** E1 weight-transfer fabrication error; E2 analog noise; E3 thermal/laser drift; E5 ADC precision.
- **Mitigation:** Programmable per-cell slope calibration, MZI feedback using 1% monitor taps, laser-power regulation, adaptive block floating point, and digital accumulation/nonlinearities.
- **Quantitative results:** 7-bit weights, 10-bit activation input, 11-bit output ADC; ADC ENOB 9.8. Reports 65.5 trillion ABFP16 operations/s at 78 W electrical plus 1.6 W optical power. Model workloads use the original weights without hardware-specific fine-tuning.
- **Relevance:** **High** — detailed demonstrated calibration/drift-control baseline; ABFP16 does not imply 16 physical analog bits.
- **Read status:** **partial** — publisher abstract and paper body extracted from PDF mirror; supplement not read.

### 20. Local photonic error correction and simulated circuit populations

**Citation:** Saumil Bandyopadhyay, Ryan Hamerly and Dirk Englund. “Hardware error correction for programmable photonics.” *Optica* **8**, 1247–1255, 2021. [Paper](https://doi.org/10.1364/OPTICA.424052), [HTML preprint](https://arxiv.org/html/2103.04993v1).

- **Year / venue / type:** 2021 / Optica / simulation.
- **System and scale:** Interferometer meshes, two-layer optical neural networks, and recirculating filters; neural-network simulations up to 256 modes.
- **E1–E5 coverage:** E1 static beamsplitter/phase fabrication error; not a demonstration of E4 dead components despite “error correction” terminology.
- **Mitigation:** One-time local device calibration and analytic adjustment of phase settings; also analyzes redundant interferometer components to expand realizable operations.
- **Quantitative results:** Neural-network results use medians over 300 randomly generated circuits. At 4% splitter variation, correction keeps accuracy within 1% of baseline in the reported comparison. Tests matrix errors at N=64,128,256 and 2% splitter variation.
- **Relevance:** **High** — close precedent for many simulated manufactured devices plus mitigation. This is calibrated operator realization, not a parity code or circular-mean replication.
- **Read status:** **partial** — correction construction, population benchmarks, scaling and redundant-device discussion.

### 21. Extra optical components improve error tolerance

**Citation:** Ryan Hamerly, Saumil Bandyopadhyay and Dirk Englund. “Asymptotically fault-tolerant programmable photonics.” *Nature Communications* **13**, 6831, 2022. [Paper](https://doi.org/10.1038/s41467-022-34308-3), [full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC9708693/).

- **Year / venue / type:** 2022 / Nature Communications / theory.
- **System and scale:** N×N programmable photonic meshes; 3-splitter MZI and MZI-plus-crossing architectures.
- **E1–E5 coverage:** E1 static splitting errors, including correlated errors; title does **not** establish E4 arbitrary dead-device tolerance.
- **Mitigation:** Add a splitter or crossing to avoid inaccessible optical transformations; progressive self-configuration. No added phase shifters in the proposed designs.
- **Quantitative results:** Reports more than 3× improved hardware-error robustness in an optical-neural-network benchmark. Prior redundant-MZI approaches require about 1.5–2× as many splitters and phase shifters; proposed designs reduce that overhead. Asymptotic fidelity result is model-dependent.
- **Relevance:** **High** — extra analog hardware for correctability has clear precedent, but its algebraic mechanism differs from replicated learned oscillator states.
- **Read status:** **partial** — abstract, architecture, introduction and correction formalism; full supplementary proofs not read. Academic MIT/NTT work, not a Lightmatter product claim.

### 22. Train once, transfer to many imperfect devices

**Citation:** Sri Krishna Vadlamani, Dirk Englund and Ryan Hamerly. “Transferable learning on analog hardware.” *Science Advances* **9**(28), eadh3436, 2023. [Paper](https://doi.org/10.1126/sciadv.adh3436), [full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC10337896/).

- **Year / venue / type:** 2023 / Science Advances / simulation.
- **System and scale:** Two-layer photonic classifiers, 256 or 400 input Fourier features; MNIST-family datasets.
- **E1–E5 coverage:** E1 static beamsplitter imperfections. “Highly faulty” means analog parameter error here, not E4 dead/stuck components.
- **Mitigation:** One-time error-aware training with maximally error-tolerant interferometer settings, followed by transfer to characterized imperfect meshes.
- **Quantitative results:** Claims tolerance up to 5× contemporary fabrication tolerances. Baselines use five trained ideal models and five random faulty meshes per error level: 25 accuracies per level. Error levels span 1%–35%; reports medians and interquartile ranges.
- **Relevance:** **High** — strong prior art for population-based robustness and transferable training. More relevant than assuming each chip must be separately retrained.
- **Read status:** **partial** — main transfer mechanism and methods/population protocol. MIT/NTT academic lineage related to photonic startups, not a company deployment demonstration.

### 23. Lightmatter-linked in-situ photonic training

**Citation:** Saumil Bandyopadhyay, Alexander Sludds, Stefan Krastanov, Ryan Hamerly, Nicholas Harris, Darius Bunandar, Matthew Streshinsky, Michael Hochberg and Dirk Englund. “Single-chip photonic deep neural network with forward-only training.” *Nature Photonics* **18**, 1335–1343, 2024. [Paper](https://doi.org/10.1038/s41566-024-01567-z), [earlier preprint](https://arxiv.org/html/2208.01623v1).

- **Year / venue / type:** 2024 / Nature Photonics / hardware demonstration.
- **System and scale:** Three-layer, six-neuron coherent photonic neural network with optical linear and nonlinear operations.
- **E1–E5 coverage:** E1 component/phase calibration errors; training evaluates actual hardware output. No separated E2–E5 sweep or device-yield study established.
- **Mitigation:** In-situ forward-only stochastic optimization; phase-shifter characterization and hardware calibration.
- **Quantitative results:** Journal reports 410 ps inference latency and 92.5% six-class vowel accuracy. Earlier 2022 preprint reports 92.7%; these are version-specific figures, not two independent replications. Its central-difference training uses two batched forward evaluations per update.
- **Relevance:** **High** — actual-device training can absorb model/calibration imperfections; no redundant oscillator mechanism demonstrated.
- **Read status:** **partial** — journal abstract/metadata plus preprint training and calibration sections; journal supplement not read.

### 24. EnCharge lineage: high-SNR programmable charge-domain compute

**Citation:** Hongyang Jia, Hossein Valavi, Yinqi Tang, Jintao Zhang and Naveen Verma. “A Programmable Heterogeneous Microprocessor Based on Bit-Scalable In-Memory Computing.” *IEEE Journal of Solid-State Circuits* **55**(9), 2020. [DOI](https://doi.org/10.1109/JSSC.2020.2987714), [company-hosted publication abstract](https://blog-test.enchargeai.com/news-and-publications/a-programmable-heterogeneous-microprocessor-based-on-bit-scalable-in-memory-computing).

- **Year / venue / type:** 2020 / IEEE JSSC / hardware demonstration.
- **System and scale:** 65-nm CMOS, 590-Kb IMC accelerator, near-memory digital compute and RISC-V host; ten-layer CIFAR-10 CNN.
- **E1–E5 coverage:** Aggregate compute SNR and precision limitations, E2/E5 analogies; no isolated E1–E5 study in inspected material.
- **Mitigation:** High-SNR IMC, integrated conversion/digital support, bit-scalable computation from 1–8 bits.
- **Quantitative results:** CIFAR-10 accuracy 89.3% at 1-bit versus 92.4% at 4-bit quantization; corresponding energy 5.31 versus 105.2 µJ/image. These are precision/energy tradeoffs, not redundancy gains.
- **Relevance:** **Med** — demonstrated alternative of improving intrinsic signal quality and choosing precision.
- **Read status:** **abstract-only** — company repost of the paper abstract; its 2022 webpage date is not the paper year. Academic predecessor, subsequently promoted by EnCharge.

### 25. Statistical error compensation in Verma-associated hardware

**Citation:** Saion K. Roy, Han Mo Ou, Mostafa G. Ahmed, Peter Deaville, Bonan Zhang, Naveen Verma, Pavan K. Hanumolu and Naresh R. Shanbhag. “Compute SNR-boosted 22 nm MRAM-based In-memory Computing Macro using Statistical Error Compensation.” *ESSCIRC*, pp. 25–28, 2023. [DOI](https://doi.org/10.1109/ESSCIRC59616.2023.10268688), [institutional record](https://collaborate.princeton.edu/en/publications/compute-snr-boosted-22-nm-mram-based-in-memory-computing-macro-us/).

- **Year / venue / type:** 2023 / ESSCIRC / hardware demonstration.
- **System and scale:** 22-nm MRAM IMC macro; ResNet20/CIFAR-10 evaluation. Array dimensions not established from inspected abstract.
- **E1–E5 coverage:** E1 offset/mismatch and aggregate analog compute error; output nonlinearity is additional model-form error, not purely E5.
- **Mitigation:** Offset-compensating current sensing and a statistical error-compensation block.
- **Quantitative results:** SNR improvement 2.7–6 dB; CIFAR-10 accuracy 74.8%→82.0% without on-chip training; reports a 5× energy-per-operation reduction tradeoff. Omit the overhead percentage because institutional text renders it ambiguously as “0.S%”.
- **Relevance:** **Med** — small explicit correction circuitry can outperform relying on training alone; academic Verma-associated work, not established EnCharge commercial silicon.
- **Read status:** **abstract-only** — institutional abstract and bibliographic metadata.

### 26. Feature-bank ensembles under analog SNR constraints

**Citation:** Yinqi Tang, Jintao Zhang and Naveen Verma. “Scaling Up In-Memory-Computing Classifiers via Boosted Feature Subsets in Banked Architectures.” *IEEE Transactions on Circuits and Systems II: Express Briefs* **66**(3), 477–481, 2019; online 2018. [DOI](https://doi.org/10.1109/TCSII.2018.2854759), [institutional record](https://collaborate.princeton.edu/en/publications/scaling-up-in-memory-computing-classifiers-via-boosted-feature-su/).

- **Year / venue / type:** 2019 / IEEE TCAS-II / hardware demonstration.
- **System and scale:** 130-nm CMOS classifier; 16×16 MNIST images partitioned over four memory banks.
- **E1–E5 coverage:** Aggregate low-SNR analog computation, E2/E5 analogies; not an isolated oscillator-error evaluation.
- **Mitigation:** Error-adaptive boosting and multi-armed-bandit feature selection partition the feature vector into multiple classifier subsets.
- **Quantitative results:** Measured ten-class accuracy 91%, energy 879.7 pJ/classification, 14.3× lower energy than the compared separated-memory/digital-accelerator system.
- **Relevance:** **High** — direct antecedent for distributing learned feature computations and combining imperfect results; feature partitioning/boosting is not identical to replicated features or parity coding.
- **Read status:** **abstract-only** — institutional abstract/metadata; author PDF retrieval failed. Academic EnCharge lineage, predating the startup.

### 27. Mythic production-scale analog compute and analog-aware training

**Citation:** Laura Fick, Skylar Skrzyniarz, Malav Parikh, Michael B. Henry and David Fick. “Analog Matrix Processor for Edge AI Real-Time Video Analytics.” *IEEE ISSCC*, pp. 260–262, 2022. [Paper](https://doi.org/10.1109/ISSCC42614.2022.9731773), [conference press kit](https://www.isscc.org/s/ISSCC2022PressKit.pdf).

- **Year / venue / type:** 2022 / ISSCC / hardware demonstration.
- **System and scale:** 40-nm flash-based processor, 76 analog-compute tiles; each contains a 1,024×2,048 NOR-flash array.
- **E1–E5 coverage:** Abstract explicitly identifies analog-chain non-idealities and noise; E1/E2/E5 analogies are not separately isolated in available material.
- **Mitigation:** Analog-aware training and large pattern-matching computations that suppress noise; mixed digital/analog system integration.
- **Quantitative results:** Conference summary gives 16.6–59.3 TOPS and 3.3–10.9 TOPS/W across 8-bit to 2-bit settings. These are throughput/efficiency figures, not a measured noise-tolerance curve.
- **Relevance:** **Med** — commercial-scale precedent for analog-aware deployment; no circular-mean replica or combined-chip-yield evidence established.
- **Read status:** **partial** — publisher abstract and conference session summary; full paper inaccessible. Do not attribute neighboring ARCHON paper’s PVT feedback result to Mythic.

### 28. Mythic patent: channel equalization and SNR-aware scaling

**Citation:** David Fick, Daniel Graves, Michael Klachko, Ilya Perminov, John Mark Beardslee and Evgeny Shapiro; assignee Mythic, Inc. “Systems and methods for enhancing inferential accuracy of an artificial neural network during training on a mixed-signal integrated circuit.” US20250131260A1, published 24 April 2025; priority 1 April 2021. [Patent publication](https://patents.google.com/patent/US20250131260A1/en).

- **Year / venue / type:** 2025 / US patent application publication / proposal.
- **System and scale:** Mixed-signal neural-network accelerator channels/layers; no measured chip dimensions specified by the inspected passages.
- **E1–E5 coverage:** E1 weight-programming error and E2/E5 activation-noise analogies. No E4 correction demonstration.
- **Mitigation:** Select channel optimization using noise thresholds; equalize channel magnitudes and scale layer signals to use available range.
- **Quantitative results:** Uses illustrative output code 255 and an example of signal values about 50% below representable maximum; these are motivating examples, not measured improvements. No controlled accuracy/yield result established.
- **Relevance:** **Med** — documented company strategy to improve noise tolerance through representation/scaling during training, rather than replication.
- **Read status:** **partial** — inventors/dates, description and noise/channel-scaling embodiments; no legal scope opinion or implementation claim.

### 29. Sagence patent: reference arrays reject PVT and aging drift

**Citation:** Vishal Sarin, Sankha Saha, Biprangshu Saha, Sang T. Nguyen and Vikram Kowshik; assigned to Sagence AI Corporation in 2026. “Methods and systems for pvt and aging compensation of flash cells.” US20250378854A1, published 11 December 2025; claims priority to 2019 filings. [Patent publication](https://patents.google.com/patent/US20250378854A1/en).

- **Year / venue / type:** 2025 / US patent application publication / proposal.
- **System and scale:** Analog flash MAC array plus N parallel matched reference cells; N not fixed.
- **E1–E5 coverage:** E1 local/process variation and E3 voltage/temperature/aging changes explicitly addressed; no E4 fault-tolerance result.
- **Mitigation:** A reference array experiences similar threshold shifts; feedback adjusts common control-gate bias while matching bit-line conditions. Parallel reference cells reduce local variation effects.
- **Quantitative results:** Illustrative programmed cell-current range 1–127 nA; reference-current condition at least N times the lowest operating current. No measured temperature interval, residual drift, accuracy recovery or yield improvement supplied.
- **Relevance:** **High** — close architectural precedent for reference oscillators correcting shared drift, including averaging reference elements.
- **Read status:** **partial** — specification, reference-cell circuit and claims; patent is disclosure of a method, not proof of working silicon.

### 30. Rain’s equilibrium-propagation circuit simulations

**Citation:** Jack Kendall, Ross Pantone, Kalpana Manickavasagam, Yoshua Bengio and Benjamin Scellier. “Training End-to-End Analog Neural Networks with Equilibrium Propagation.” arXiv:2006.01981, 2020. [Paper](https://arxiv.org/abs/2006.01981), [PDF](https://arxiv.org/pdf/2006.01981).

- **Year / venue / type:** 2020 / arXiv / simulation.
- **System and scale:** Rain Neuromorphics/Mila nonlinear resistive networks; Spectre/SPICE MNIST model with 100 hidden neurons.
- **E1–E5 coverage:** Physical nonlinearities, positive conductance limits and reliable weight updating; no systematic independent E1–E5 sweep. Do not infer thermal-noise robustness merely from circuit simulation.
- **Mitigation:** Equilibrium propagation estimates local conductance gradients from free/nudged voltage states; trains the physical network formulation directly.
- **Quantitative results:** MNIST test error 3.43% after ten epochs; same-size PyTorch positive-weight comparison 3.85±0.05% at ten epochs. Reliable memristor conductance updates remain an explicit open hardware challenge.
- **Relevance:** **Med** — alternative to perfect-model backpropagation and a predecessor to Rain-associated physical training. This paper is not a fabricated-chip demonstration.
- **Read status:** **partial** — architecture, numerical results/table, discussion and update constraints; lengthy proofs not fully read.

### 31. Rain-associated MADEM trains actual imperfect memristors

**Citation:** Su-in Yi, Jack D. Kendall, R. Stanley Williams and Suhas Kumar. “Activity-difference training of deep neural networks using memristor crossbars.” *Nature Electronics* **6**, 45–51, 2023; published online 21 November 2022. [Paper](https://doi.org/10.1038/s41928-022-00869-w), [author conference abstract](https://www.nanoge.org/proceedings/NeuMatDeCaS/63687a15df7aae485771ec8a).

- **Year / venue / type:** 2023 / Nature Electronics / hardware demonstration.
- **System and scale:** Co-designed tantalum-oxide memristor crossbars; one-layer and multilayer Braille-word classifiers. Exact array dimensions not independently verified in accessible primary text.
- **E1–E5 coverage:** E1 analog-device imprecision/model mismatch; E2/E5 aggregate analog non-idealities. No separated hard-fault or temperature/yield evaluation confirmed.
- **Mitigation:** Memristor activity-difference energy minimization computes local training information from behavior of the same hardware being trained.
- **Quantitative results:** Scaled modeling projects more than four orders of magnitude training-energy advantage; this is not measured full-system energy savings. Accessible primary abstract does not give a numerical Braille accuracy, so none is inferred.
- **Relevance:** **High** — actual peer-associated hardware training absorbs imperfections, while the earlier Rain paper only simulated circuitry.
- **Read status:** **abstract-only** — publisher abstract/metadata and author’s conference abstract; full paper/supplement unavailable in this search.

## Gaps / open questions noted by the literature

### What appears established, and what remains unestablished

1. **Noise awareness is established; the exact Un-0 study is not.** Company discussions of non-ideal digital twins, imperfect memory, operational calibration and noise/drift research are explicit (03–09). The inspected Un-0 report/repository do not demonstrate isolated E1–E5 robustness curves, their corresponding fixes, or a combined-error generative-yield distribution (01–02). An absence in these inspected sources cannot establish absence from internal work, unpublished patents or inaccessible talks.

2. **Ensembling is prior art, but the averaged object matters.** Thermies merges samples from deliberately different realizable parameter settings to improve a target distribution (11). It does not average independently generated images or phases to reconstruct a specific clean trajectory. Its authors explicitly separate programmable imprecision from unknown component mismatch (13–14). A circular-mean replica method would need a different justification for biased errors and nonlinear trajectories.

3. **Many-device robustness studies already exist.** Photonic correction evaluates hundreds of randomly imperfect circuits (20); transferable training evaluates distributions across fabricated-error models (22); Extropic uses PDK samples and process corners (15). Normal reports three physical SPUs (12). The open combination here is large learned oscillator generators, physical error correlations, E1–E5 mixtures and a stated image-quality yield criterion—not Monte Carlo chip variation itself.

4. **Analog hardware redundancy already exists.** Extra optical splitters/MZIs enlarge the correctable transformation set (20–21), and Sagence uses multiple reference cells to reduce local variation (29). These mechanisms do not establish an analog parity code across Un-0 learned features, or its cost/quality tradeoff. “Fault-tolerant” in the photonic titles concerns continuous fabrication errors; it should not be cited as a dead-oscillator/stuck-phase result.

5. **Training on actual hardware can help, but is not a universal remedy.** Photonic in-situ training and Rain-associated MADEM are hardware demonstrations (23, 31); transferable photonic training offers a train-once alternative (22). Their update rules, physical constraints and error models differ from Un-0. None establishes that clean pretrained Un-0 weights will tolerate a given chip distribution, or that one fine-tuned model covers correlated error combinations.

6. **Error propagation needs an appropriate notion of stability.** Unconventional warns that physical and numerical perturbations can change useful trajectories (04). Thermalizers bounds errors of composed stochastic kernels and identifies contraction-dependent error floors (18). These are distributional bounds, not bounds on fixed-seed image deviation. Normal’s distinction between trajectory computation and equilibrium statistics is particularly relevant (14).

### Consequences for interpreting the proposed Un-0 investigation

- **Common drift has an exact special case.** Inference from the inspected equations/source: adding the same angular-frequency offset δ(t) to *every main and conditioning oscillator* adds a common integrated phase, leaving all sine phase differences unchanged. A reference-relative readout removes that common phase. Main-pool-only frequency drift changes phase relative to the conditioning pool; shared K/K_drive gain changes alter the dynamics and do not generally cancel. Common-mode immunity should therefore not be claimed for every E3 definition. This is an analytical observation, not an experiment or published robustness result. [Model source](https://github.com/unconv-ai/Un-0/blob/main/un0/model.py).
- **Reference readout introduces a shared measurement path.** Inference from that same transform: independent noise on the chosen reference phase enters every relative phase. Consequently, its effect differs from noise on an ordinary oscillator. Relative-coordinate processing is already present; redundant reference measurement and physical calibration are separate questions. [Readout implementation](https://github.com/unconv-ai/Un-0/blob/main/un0/model.py).
- **Intentional sparsity is not fault tolerance.** Sparse/modular Un-0 trains around fixed connectivity and reports feature specialization (06). Deleting learned edges or whole modules afterward is a different intervention. Feature partitioning/boosting (26) and extra optical hardware (21) are useful comparators, not evidence that redundant modules preserve the same generative distribution.
- **Desired randomness must be separated from unwanted error.** Un-0’s random initial condition supplies image diversity; Extropic and Normal deliberately use fluctuating dynamics to sample distributions (11–18). Averaging independent generative seeds can remove desired diversity. Replica correspondence, correlation, bias, and the averaging stage must therefore be specified before equating averaging with error correction.
- **Accuracy and energy need the same accounting boundary.** Lightmatter’s ABFP format combines limited analog precision with digital scaling and feedback (19). Unconventional itself warns that noise-driven model expansion and memory traffic can erase array-level gains (03). No inspected paper supplies the oscillator-copy count, readout overhead and recalibration energy needed to price the proposed Un-0 fixes.

### Search trail, exclusions and evidence limits

Live searches covered arXiv, publisher/IEEE records, Nature/Science-family papers, conference materials, company research pages, GitHub source, employer postings, interviews and Google Patents. Queries combined the company names and former names with noise, mismatch, variability, calibration, drift, faults, robustness, redundancy, analog-aware training, ISSCC, IEDM, DATE and VLSI. Unconventional’s two-page research index was screened through the cut-off. Its [founding announcement](https://unconv.ai/blog/introducing-unconventional-ai/), [neural co-evolution essay](https://unconv.ai/blog/neural-co-evolution-the-inevitability-of-hardware-and-software-co-evolution-for-ai/) and [gyroscope tutorial](https://unconv.ai/blog/machine-learning-with-dynamics/) supplied context but did not establish additional E1–E5 mitigation results. Acquisition, finance/culture and generic funding coverage were not counted as robustness works.

Backward trails included Un-0’s references to Extropic and Normal, Normal’s references to Thermies and Rain-associated MADEM, and photonic correction’s calibration/redundant-device antecedents. Forward trails linked 2021 photonic correction to 2022 asymptotic correction, 2023 transferable learning and 2024 in-situ hardware training; linked 2023 thermodynamic proposals/2024 Thermies to the 2025 SPU demonstration; and extended Extropic’s 2025 architecture to its 2026 device and compiler papers. Search results were used to find primary works, not treated as independent replications.

Unverified or unavailable material was not promoted into evidence: no confirmed Unconventional-assigned public patent describing the proposed oscillator redundancy was located; no separate arXiv Un-0 report was established. This is not a patent-clearance search. The 2020 Mythic IWOMP keynote was discoverable, but full retrieval failed, so it is not an entry. Extropic’s older “Inside X0 and XTR-0” page returned a shell rather than its article; factory-calibration claims repeated in secondary summaries were therefore not adopted. Rain’s later digital-compute product direction was not assumed to validate its earlier analog claims.

Access limitations affected some IEEE/Nature pages and author PDFs. For Lightmatter’s Nature paper, a PDF mirror was read as the paper itself; for several EnCharge-lineage works and MADEM, only primary abstracts could be inspected. The status labels identify those limits. Generic searches for “Rain” and “Mythic” produced unrelated weather/medical/gaming results, which were excluded. No experiment, training run, model inference, or reproduction was performed; the numerical results above are attributed source results. This file contains **31 entries**, including grey literature and explicitly labeled academic predecessors; it is not 31 independent hardware demonstrations.
