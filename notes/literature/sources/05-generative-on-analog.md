# Generative models on noisy analog and physical hardware

Search cutoff: 13 November 2026; scope searched: 2015–2026, emphasizing 2022–2026.
Generative inference on imperfect physical hardware already has substantial precedent across resistive memories, optics, spintronics, and thermodynamic machines.
All three supplied seeds are verified: ASSERT (2609.00955), guidance recalibration (2608.19644), and the resistive-memory solver (2404.05648).
The last seed now has a 2026 journal version with changed performance numbers; those versions must not be conflated.
The closest oscillator-specific work found is Wang and Achour's Analog Interaction Systems (AIS), including transient-noise sweeps and fine-tuning.
EtaMix, ASSERT, and guidance recalibration establish sampler-side mitigation of accumulated analog error without retraining.
Earlier analog GAN work already studies mismatch, aging, faults, and combined disturbances; noise-aware generative training is also established.
Related redundancy exists: BrainScaleS combines physical neuron compartments, Thermies merges samples from imprecise distributions, and CN101 averages repeated estimates.
None of the reviewed works establishes the complete proposed Un-0 study: E1–E5 isolation, matched fixes, circular-mean oscillator redundancy or feature codes, and combined-chip yield.
That is a bounded search finding, not proof of novelty; physical noise used intentionally for sampling must be distinguished from unwanted hardware error.

Taxonomy follows `notes/hardware-error-catalog.md`: E1 fixed manufacturing/programming mismatch; E2 fresh temporal jitter; E3 shared slow drift; E4 dead/stuck/broken components; E5 final readout noise. Mapping other substrates onto these categories is this review's interpretation. Intermediate ADC/MVM noise is explicitly distinguished from final-phase E5. “Not studied” means not established in the material read, not necessarily absent from every supplement. Quantitative gains are authors' reports, not independently reproduced. Read status **partial** means selected methods/results and/or figures were read, without claiming exhaustive supplement review. **Abstract-only** includes verified indexed primary-source abstracts where direct full-text access failed. Each numbered subsection is one work; preprints and journal versions are not counted twice.

## Entries

### 1. Analog Interaction Systems: the closest oscillator-generator comparison

**Citation:** Yu-Neng Wang and Sara Achour. “Generative Models on Analog Hardware with Dynamics.” arXiv:2606.27294, 2026. [Paper and HTML](https://arxiv.org/html/2606.27294v1).

- **Year / venue / type:** 2026 / arXiv preprint / simulation.
- **System and scale:** Sparse oscillator/integrator AIS; Kuramoto with second-harmonic injection locking (KuraSHIL); four piecewise parameter intervals; 80 Euler steps of size 0.05.
- **E1–E5:** E2 additive Gaussian perturbations in dynamics; low-bit parameter quantization is adjacent to E1, not a fixed random chip mismatch experiment. E3–E5 not established.
- **Mitigation:** Hidden physical states, asymmetric/time-varying coupling, quantization fine-tuning, then noise-injected fine-tuning (15,000 generator iterations per stage).
- **Quantitative results:** Table 3: full-precision/noiseless MNIST/Fashion-MNIST FID 27.6/80.8; 4-bit/noiseless 27.2/81.9; 4-bit noise δ=0.025 gives 29.1/75.1, rising to 54.5/90.4 at δ=0.1. Four seeds. Estimated 23 µJ/image, not measured generator hardware energy.
- **Un-0 relevance:** **High** — direct precedent for a learned oscillator generator under integration noise and corrective fine-tuning; no copy averaging/ECC comparison shown.
- **Read status:** **Partial** — formulation, hardware constraints, Table 3, evaluation and related work.

### 2. EtaMix at DATE 2026

**Citation:** Yuannuo Feng, Wenyong Zhou, Yuexi Lv, Hanjie Liu, Guangyao Wang, Zhengwu Liu, Ngai Wong, and Wang Kang. “Noise-Aware Adaptive Sampling for Robust Diffusion Models on Analog Compute-in-Memory.” *2026 Design, Automation & Test in Europe Conference (DATE)*, pp. 1–3, 2026. [IEEE / DOI](https://doi.org/10.23919/DATE69613.2026.11539632).

- **Year / venue / type:** 2026 / DATE / simulation.
- **System and scale:** DDPM/DDIM inference with CIM-induced weight perturbations; array size/model parameter count not established from accessible abstract.
- **E1–E5:** E1-like weight perturbations; abstract does not resolve their temporal persistence or separately establish E2–E5.
- **Mitigation:** EtaMix interpolates stochastic and deterministic sampling: more stochasticity early, less late; no retraining or hardware modification.
- **Quantitative results:** Up to 2.01× and 5.12× FID improvement for DDPM and DDIM, respectively. Abstract reports early-step vulnerability and a robustness/step-count tradeoff. Absolute FIDs and noise units unavailable in material read.
- **Un-0 relevance:** **High** — antecedent to ASSERT's temporal mitigation; shows sampler changes are an established alternative to redundancy.
- **Read status:** **Abstract-only** — IEEE abstract; author list checked against the bibliographic record. Do not assume EtaMix and ASSERT are independent experimental replications.

### 3. ASSERT: persistent spatial error and temporal sensitivity

**Citation:** Yuannuo Feng, Yizhe Chen, Wenshuai Yao, Yuxin Xie, Ngai Wong, Wenyong Zhou, and Wang Kang. “ASSERT: Adaptive Stochastic Sampling for Robust Diffusion Models on Analog Compute-in-Memory Hardware.” arXiv:2609.00955, 2026. [HTML](https://arxiv.org/html/2609.00955v1).

- **Year / venue / type:** 2026 / arXiv; manuscript identifies ASP-DAC January 2027, a future venue at cutoff / simulation.
- **System and scale:** CIFAR-10 through 256×256 latent diffusion. Noise calibrated to 28-nm eFlash hardware: four 2.2-Mb arrays; validation measurements from 100 chips.
- **E1–E5:** E1 fixed per-layer weight maps throughout a deployment; E2 fresh MVM-output noise. ADC effects are intermediate, not isolated final E5. No dedicated E3/E4 study.
- **Mitigation:** Early stochasticity, cosine decay to deterministic refinement; unchanged network evaluations.
- **Quantitative results:** 100-step noisy CIFAR-10 FID 33.53→5.90; 500-step 163.38→21.27 (7.68×). Noise-model R²=0.993, histogram KL=0.0198. FIDs use 50,000 images and three seeds, not 100 complete chip-generation trials.
- **Un-0 relevance:** **High** — persistent versus fresh error, correlated propagation, and stage sensitivity map directly onto E1/E2 concerns.
- **Read status:** **Partial** — noise model, trajectory analysis, experiments, tables; Jacobian-gain/error-alignment assumptions are not directly measured.

### 4. Classifier-free guidance recalibration under analog errors

**Citation:** Wenshuai Yao and Wenyong Zhou. “When Guidance Goes Off-Scale: Recalibrating Diffusion Transformers under Analog Compute-in-Memory Nonidealities.” arXiv:2608.19644, 2026. [HTML](https://arxiv.org/html/2608.19644v1).

- **Year / venue / type:** 2026 / arXiv preprint / simulation.
- **System and scale:** PixArt-Sigma, PixArt-alpha, DiT-XL/2; simulated CIM mappings; 30,000 generated images per condition.
- **E1–E5:** E1-like effective-weight distortion central; discussion includes read/peripheral effects but does not establish separate catalog E2–E5 sweeps. Common branch drift is discussed, not an E3 aging/temperature validation.
- **Mitigation:** Recalibrate only guidance scale for the noise condition; no retraining. Excessive guidance also amplifies error.
- **Quantitative results:** At σ_CIM=0.20, FID 59.22→20.49 (PixArt-Sigma), 72.37→21.12 (PixArt-alpha), 20.89→6.62 (DiT-XL/2); at least 87% of induced FID gap closed.
- **Un-0 relevance:** **High** — conditional control can distort disproportionately even when branch predictions appear accurate. Transfer requires an analogous controllable conditioning parameter in Un-0.
- **Read status:** **Partial** — method, residual analysis, experimental setup and results.

### 5. Resistive-memory continuous-time diffusion solver

**Citation:** Jichang Yang, Hegan Chen, Jia Chen, Songqi Wang, Qifan Zhu, Xinyuan Zhang, Yan Zeng, Shaocong Wang, Mingrui Yang, Yifei Yu, Xi Chen, Bo Wang, Binbin Cui, Yi Li, Ning Lin, Meng Xu, Yi Li, Xiaoxin Xu, Xiaojuan Qi, Xumeng Zhang, Dashan Shang, Zhongrui Wang, Han Wang, Qi Liu, Kwang-Ting Cheng, and Ming Liu. “Resistive memory-based neural differential equation solver for score-based diffusion model.” *Nature Communications* **17**, 6354, 2026. [Journal](https://doi.org/10.1038/s41467-026-72900-z); [2024 seed preprint](https://arxiv.org/html/2404.05648v1).

- **Year / venue / type:** 2024 preprint; 2026 journal / Nature Communications / hardware demonstration.
- **System and scale:** 180-nm resistive-memory macros, analog neural network plus feedback integrator; 2D latent dynamics, hidden layers of 14 nodes.
- **E1–E5:** E1 conductance programming errors; E2 circuit fluctuations partly supply sampling noise; retention characterized, not shared E3 drift. E4/E5 sweeps not established.
- **Mitigation:** Hardware/algorithm co-design and continuous-time integration; no redundancy code.
- **Quantitative results:** Journal reports 69.0×/116.5× sampling acceleration and 31.5%/52.0% energy reductions; energy includes simulation-based extrapolation. Preprint instead reports 64.8×/156.5× and 80.8%/75.6% power reductions: different version/metric.
- **Un-0 relevance:** **High** — physical neural dynamics solving generative ODE/SDEs, with measured imperfections.
- **Read status:** **Partial** — preprint device/circuit sections and journal methods/discussion; not a large image-denoiser-on-one-chip demonstration.

### 6. Analog Diffusion Models (ADM)

**Citation:** Heiner Kremer, Fabian Falck, Jiaqi Chu, Grace Brennan, Burcu Canakci, James H. Clegg, Daniel Cletheroe, Douglas J. Kelly, Christos Gkantsidis, Michael Hansen, Paul Jeha, Kirill P. Kalinin, Jim Kleewein, Babak Rahmani, Saravan Rajmohan, Victor Rühle, Jannes Gladrow, Francesca Parmigiani, and Hitesh Ballani. “Analog Diffusion Models.” Research Square preprint, version 1, 2026. [DOI](https://doi.org/10.21203/rs.3.rs-8919479/v1).

- **Year / venue / type:** 2026 / Research Square / hardware demonstration.
- **System and scale:** 3D optical/analog-electronic computer with 2,304 programmable weights; 2D distributions and latent MNIST-family distributions.
- **E1–E5:** Noisy analog operation established; abstract does not separate E1–E5 mechanisms or validate all five.
- **Mitigation:** Implicit integration converts each diffusion step into a fixed-point problem; conventional diffusion training retained.
- **Quantitative results:** Measured fixed-point convergence 10–15 µs/step; nanosecond operation is a miniaturization projection. Abstract reports simulation models spanning 32 million–13 billion parameters and up to 16× fewer diffusion steps, distinct from prototype scale.
- **Un-0 relevance:** **High** — solver/hardware co-design is an alternative to protecting explicit integration with redundancy.
- **Read status:** **Abstract-only** — indexed primary PDF abstract; direct Research Square/PDF returned 403. This entry deliberately fixes v1; a newer v2 record surfaced but was not assessed.

### 7. Optical diffusion with online digital-twin calibration

**Citation:** Ilker Oguz, Niyazi Ulas Dinc, Mustafa Yildirim, Junjie Ke, Innfarn Yoo, Qifei Wang, Feng Yang, Christophe Moser, and Demetri Psaltis. “Optical Diffusion Models for Image Generation.” *Advances in Neural Information Processing Systems* **37**, 59150–59173, 2024. [Proceedings](https://papers.nips.cc/paper_files/paper/2024/hash/6cb81234ab47027e991728ed7dd76735-Abstract-Conference.html); [PDF](https://papers.nips.cc/paper_files/paper/2024/file/6cb81234ab47027e991728ed7dd76735-Paper-Conference.pdf).

- **Year / venue / type:** 2024 / NeurIPS / hardware demonstration.
- **System and scale:** Passive diffractive Optical Denoising Unit (ODU); 20×20 images, three datasets/subsets; T=1000 steps, M=10 modulation sets.
- **E1–E5:** Alignment/calibration discrepancy is E1-like; intermediate camera/readout errors are E5-adjacent. No complete E1–E5 separation.
- **Mitigation:** Online training updates a digital twin to track experimental discrepancies; time-binned optical denoisers.
- **Quantitative results:** Reported generation FIDs 206.6 (MNIST subset), 227.7 (Fashion-MNIST subset), 131.4 (Quick, Draw! clocks). Estimated 15 mJ/image versus 1.7 J conventional baseline; not an end-to-end measured 100× system advantage.
- **Un-0 relevance:** **High** — calibration-aware training of iterative physical generation, with conversion overhead explicitly relevant.
- **Read status:** **Partial** — PDF main method/results and selected appendices.

### 8. Snapshot and iterative optical generative models

**Citation:** Shiqi Chen, Yuhang Li, Yuntian Wang, Hanlong Chen, and Aydogan Ozcan. “Optical generative models.” *Nature* **644**, 903–911, 2025. [Article](https://doi.org/10.1038/s41586-025-09446-5).

- **Year / venue / type:** 2025 / Nature / hardware demonstration.
- **System and scale:** Shallow digital encoder produces phase seeds; free-space diffractive decoder synthesizes images. Single- and five-layer decoding studied; MNIST, fashion, faces, butterflies, artworks in simulations/experiments, with experimental subsets distinguished in article.
- **E1–E5:** Optical power/noise and efficiency tradeoffs addressed; phase modulation/readout are E1/E5-adjacent. No isolated E1–E5 robustness matrix established.
- **Mitigation:** Joint encoder/decoder training, efficiency-aware objective, deeper decoders; diffusion-teacher guidance for snapshot variant.
- **Quantitative results:** Optical propagation <1 ns, but SLM refresh limits overall rate. Five-layer example reaches ~50% diffraction efficiency at FID≈100; single-layer efficiency reaches 41.8% with quality compromise.
- **Un-0 relevance:** **High** — phase-coded physical generator plus decoder; illustrates why propagation latency alone is insufficient for hardware claims.
- **Read status:** **Partial** — architecture, efficiency analysis and experimental description.

### 9. Noise-aware photonic GAN

**Citation:** Changming Wu, Xiaoxuan Yang, Heshan Yu, Ruoming Peng, Ichiro Takeuchi, Yiran Chen, and Mo Li. “Harnessing optoelectronic noises in a photonic generative network.” *Science Advances* **8**(3), eabm2956, 2022. [Article](https://pmc.ncbi.nlm.nih.gov/articles/PMC8782447/); [preprint](https://arxiv.org/abs/2109.08622).

- **Year / venue / type:** 2022 (2021 preprint) / Science Advances / hardware demonstration.
- **System and scale:** Four programmable phase-change memory cells, 2×2 optical tensor core; GAN generator uses photonic dot products.
- **E1–E5:** E2 optoelectronic fluctuations; E1 weight/hardware nonidealities and detection effects are included broadly, without catalog-isolated sweeps. E3/E4 not established.
- **Mitigation:** Injected-noise-aware training; optical amplified-spontaneous-emission noise also supplies intentional randomness.
- **Quantitative results:** Experimental generation of digit “7”; all ten digits in simulation. Prototype 4,000 operations/s, limited by variable optical attenuators and core size.
- **Un-0 relevance:** **High** — noise-aware training and beneficial-versus-harmful noise are prior art, well before the proposed study.
- **Read status:** **Partial** — primary full-text results/methods excerpts and preprint abstract; PMC access intermittently challenged.

### 10. Scattering-based photonic diffractive GAN

**Citation:** Ziyu Zhan, Hao Wang, Qiang Liu, and Xing Fu. “Photonic diffractive generators through sampling noises from scattering media.” *Nature Communications* **15**, 10643, 2024. [Journal](https://doi.org/10.1038/s41467-024-55058-4); [preprint HTML, earlier title](https://arxiv.org/html/2404.09948v1).

- **Year / venue / type:** 2024 / Nature Communications / hardware demonstration.
- **System and scale:** Scattering medium samples speckle; diffractive phase generator with 100×100 programmable weights; digital discriminator and computer-mediated SLM/camera loop.
- **E1–E5:** Physical random sampling is E2-like by mechanism, but is a resource, not an unwanted-error sweep. Hardware/scattering consistency concerns E1-like mapping. E3–E5 isolation not established.
- **Mitigation:** Random and physics-aware encodings associate experimental speckle with training images; cascaded/parallel diffractive configurations.
- **Quantitative results:** 10,000 programmable weights and over 10^8 optical computing operations reported in preprint; scale claim is not a measured end-to-end throughput rate. Absolute FID not transcribed from material read.
- **Un-0 relevance:** **Med** — learned generation through measured physical transfer functions; latent noise differs from phase-integration error.
- **Read status:** **Partial** — preprint introduction/architecture and journal implementation excerpts.

### 11. Probabilistic optical oscillator sampling

**Citation:** Seou Choi, Yannick Salamin, Charles Roques-Carmes, Rumen Dangovski, Di Luo, Zhuo Chen, Michael Horodynski, Jamison Sloan, Shiekh Zia Uddin, and Marin Soljačić. “Photonic probabilistic machine learning using quantum vacuum noise.” *Nature Communications* **15**, 7760, 2024. [Journal](https://doi.org/10.1038/s41467-024-51509-0); [HTML](https://arxiv.org/html/2403.04731v1).

- **Year / venue / type:** 2024 / Nature Communications / hardware demonstration.
- **System and scale:** Biased bistable optical parametric oscillator implements time-multiplexed photonic probabilistic neurons; FPGA/GPU feedback; PixelCNN MNIST generation.
- **E1–E5:** E2-like vacuum fluctuations intentionally seed sampling. Bias control matters, but no separate manufacturing/drift/fault/final-readout sweeps established.
- **Mitigation:** Controllable injected optical bias sets probabilities; hybrid measurement-and-feedback architecture.
- **Quantitative results:** Proposed all-optical extension estimates ~1 Gbps sampling and ~5 fJ/MAC; these are projections, not measured performance of the demonstrated hybrid generator.
- **Un-0 relevance:** **Med** — oscillator-based probabilistic generation, but bistable sampling differs from continuous Kuramoto phase trajectories.
- **Read status:** **Partial** — primary abstract, introduction and architecture; not all supplementary calibration details.

### 12. Voltage-controlled magnetoelectric diffusion

**Citation:** Yang Cheng, Qingyuan Shu, Albert Lee, Haoran He, Ivy Zhu, Minzhang Chen, Renhe Chen, Zirui Wang, Hantao Zhang, Chih-Yao Wang, Shan-Yi Yang, Yu-Chen Hsin, Cheng-Yi Shih, Hsin-Han Lee, Ran Cheng, and Kang L. Wang. “Voltage-controlled magnetoelectric devices for neuromorphic diffusion process.” *Nature Communications* **16**, 5022, 2025. [Article](https://doi.org/10.1038/s41467-025-58932-x).

- **Year / venue / type:** 2025 / Nature Communications / hardware demonstration.
- **System and scale:** 80×80 voltage-controlled MTJs integrated with 180-nm CMOS; experimental random sequences used by DDPM; neural denoising is not demonstrated wholly inside the array.
- **E1–E5:** E2 thermal stochasticity harnessed for Markov diffusion; no comprehensive unwanted E1–E5 robustness evaluation established.
- **Mitigation:** Pulse voltage/duration control switching probabilities and noise statistics.
- **Quantitative results:** T=1000 diffusion steps; 40,000 device-sampled random numbers used in training/generation. Authors report ~10^3 better energy-per-bit-per-area than traditional hardware; this is not a 1000× whole-model energy measurement.
- **Un-0 relevance:** **Med** — device-native noise can implement a desired stochastic term if calibrated.
- **Read status:** **Partial** — journal device/array and generation sections. Journal author list used; preprint has additional authors.

### 13. In-situ p-bits for neural SDEs

**Citation:** Zhihua Xiao, Yaoru Hou, Zihan Tong, Yicheng Jiang, Yiyang Zhang, Xuezhao Wu, Albert Lee, Di Wu, Hao Cai, and Qiming Shao. “In-Memory Neural Stochastic Differential Equations with Probabilistic Differential Pair Achieved by In-Situ P-Bit Using CMOS Integrated Voltage-Controlled Magnetic Tunnel Junctions.” *2024 IEEE International Electron Devices Meeting (IEDM)*, 2024. [DOI](https://doi.org/10.1109/IEDM50854.2024.10873318); [author-hosted PDF](https://forkxz.github.io/assets/pdf/2024197751.pdf).

- **Year / venue / type:** 2024 / IEDM; indexed February 2025 / hardware demonstration.
- **System and scale:** Data-bit/p-bit differential MTJ cells; four arrays characterized. Generation uses measured conductances/random streams in a CIM emulator, not a complete physical denoiser.
- **E1–E5:** E1 array/device resistance and switching variation; E2 thermal randomness; E5-adjacent resistance read margins. E3/E4 sweeps not established.
- **Mitigation:** In-situ stochastic MC-dropconnect avoids separate RNG sampling/transfer; differential pair read margin ~6σ.
- **Quantitative results:** 6× throughput and 2.19× efficiency versus same-technology ex-situ p-bits; 3× and 1.36× versus CMOS comparison. Endurance tested to 10^12 write cycles.
- **Un-0 relevance:** **Med** — practical noise injection inside dynamics versus separate noise hardware.
- **Read status:** **Partial** — PDF methods, generation-emulator description and device results.

### 14. Polariton dyads: noise bias compensation and optical diffusion proposal

**Citation:** Alexander Johnston and Natalia G. Berloff. “Macroscopic Noise Amplification by Asymmetric Dyads in Non-Hermitian Optical Systems for Generative Diffusion Models.” *Physical Review Letters* **132**, 096901, 2024. [DOI](https://doi.org/10.1103/PhysRevLett.132.096901); [HTML](https://arxiv.org/html/2206.12200v2).

- **Year / venue / type:** 2024 (2022 preprint) / Physical Review Letters / proposal.
- **System and scale:** Coupled polariton dyads; model-based noise amplification and optical diffusion architecture, not a trained image generator hardware demonstration.
- **E1–E5:** E1 imperfection-induced bias counteracted by pump adjustment; E2 fluctuations deliberately amplified; E5 integrated optical measurements discussed. E3/E4 not established.
- **Mitigation:** Rebalance pumping; tune dyad separation/pump to control noise distribution.
- **Quantitative results:** Projection: 10^7 dyads on 2 cm² at 4 µm separation; 10 ps coherence and 10 ns integration give n=1000 events. Claimed ≥10^3 speed/energy benefit is an architectural estimate.
- **Un-0 relevance:** **Med** — physical calibration can remove bias while preserving useful randomness; no oscillator-copy decoding code tested.
- **Read status:** **Partial** — abstract and diffusion/measurement proposal sections.

### 15. Generative thermodynamic computing by learned Langevin dynamics

**Citation:** Stephen Whitelam. “Generative Thermodynamic Computing.” *Physical Review Letters* **136**, 037101, 2026. [DOI](https://doi.org/10.1103/kwyy-1xln); [2025 preprint HTML](https://arxiv.org/html/2506.15121v3).

- **Year / venue / type:** 2025 preprint; 2026 journal / Physical Review Letters / simulation.
- **System and scale:** Nonlinear thermodynamic computer: 784 visible plus 512 hidden continuous degrees of freedom; learned bilinear couplings/biases.
- **E1–E5:** E2 Langevin thermal fluctuations essential to generation; no separate E1 mismatch, E3 shared drift, E4 faults or E5 measurement-noise validation.
- **Mitigation:** Train couplings by maximizing reverse-noising-trajectory likelihood; autonomous dynamics encode denoising without an external denoising network.
- **Quantitative results:** 28×28 visible digit grid; noising duration t_f=2.5 in simulation units. Analog energy advantage is estimated, not measured; no comparable FID value established in material read.
- **Un-0 relevance:** **High** — generation emerges from learned physical dynamics; expressly suggests electrical/mechanical/Josephson oscillator implementations.
- **Read status:** **Partial** — preprint derivation and numerical illustration; journal metadata/abstract verified. This is a digital simulation, despite some media calling it a built computer.

### 16. Normal Computing's analog stochastic processing unit

**Citation:** Denis Melanson, Mohammad Abu Khater, Maxwell Aifer, Kaelan Donatella, Max Hunter Gordon, Thomas Ahle, Gavin Crooks, Antonio J. Martinez, Faris Sbahi, and Patrick J. Coles. “Thermodynamic computing system for AI applications.” *Nature Communications* **16**, 3757, 2025. [Journal](https://doi.org/10.1038/s41467-025-59011-x); [2023 preprint](https://arxiv.org/abs/2312.04836).

- **Year / venue / type:** 2023 preprint; 2025 journal / Nature Communications / hardware demonstration.
- **System and scale:** Eight all-to-all capacitively coupled RLC cells on PCB; Gaussian sampling, matrix inversion and uncertainty quantification, not complete image diffusion.
- **E1–E5:** E1 component precision; E2 injected fluctuations; E5 analog voltage sampling. No full E3/E4 sweep established.
- **Mitigation:** Programmable capacitance/coupling and statistical sampling; calibration and component constraints discussed.
- **Quantitative results:** Two-cell voltages sampled at 12 MHz. Projected Gaussian-sampling crossover near dimension 3000 for 10,000 samples; ~10× speed/energy improvement at dimension 10,000 is extrapolated beyond the eight-cell device.
- **Un-0 relevance:** **Med** — measured coupled analog dynamics and sampling/readout costs; not evidence that a large nonlinear generator is intrinsically robust.
- **Read status:** **Partial** — device architecture, methods, performance projection and limitations.

### 17. Thermies: ensemble error mitigation

**Citation:** Maxwell Aifer, Denis Melanson, Kaelan Donatella, Gavin Crooks, Thomas Ahle, and Patrick J. Coles. “Error Mitigation for Thermodynamic Computing.” arXiv:2401.16231, 2024. [HTML](https://arxiv.org/html/2401.16231v1).

- **Year / venue / type:** 2024 / arXiv preprint / hardware demonstration.
- **System and scale:** Gaussian sampling and thermodynamic linear algebra; numerical dimensions >1000, plus experiment on a thermodynamic computer.
- **E1–E5:** E1-adjacent analog parameter imprecision/discretization central; E2 desired sampling fluctuations. No demonstrated E3–E5 correction.
- **Mitigation:** THERMIES probabilistically rounds covariance elements up/down, samples multiple realizable distributions, and merges their samples. This is distribution mixing, not averaging generated images or phases.
- **Quantitative results:** Leading imprecision dependence reduced from O(ε) to O(ε²); 20% experimental matrix-inversion error reduction; number of ensemble draws reported essentially dimension-independent in numerical tests.
- **Un-0 relevance:** **High** — explicit prior art for redundant/ensemble mitigation in physical probabilistic computation, but its Gaussian covariance assumptions do not establish nonlinear phase-generator ECC.
- **Read status:** **Partial** — abstract, method and scalability/experimental descriptions.

### 18. Extropic: Denoising Thermodynamic Models and all-transistor hardware

**Citation:** Andraž Jelinčič, Owen Lockwood, Akhil Garlapati, Peter Schillinger, Isaac L. Chuang, Guillaume Verdon, and Trevor McCourt. “An efficient probabilistic hardware architecture for diffusion-like models.” *npj Unconventional Computing* **3**, 30, 2026. [Journal](https://doi.org/10.1038/s44335-026-00075-3); [2025 preprint](https://arxiv.org/abs/2510.23972); [company explanation](https://extropic.ai/writing/thermodynamic-computing-from-zero-to-one).

- **Year / venue / type:** 2025 preprint; 2026 journal / npj Unconventional Computing / proposal.
- **System and scale:** DTM chains 2–8 energy-based models; transistor-noise RNG measured; full generator performance inferred from circuit/system simulation on binarized Fashion-MNIST.
- **E1–E5:** E1 process corners and within-chip RNG variation; E2 transistor shot noise is useful sampling randomness. No end-to-end E3–E5 generator sweeps established.
- **Mitigation:** Algorithm/architecture co-design, programmable sigmoidal RNG and local grid interactions; not phase-copy correction.
- **Quantitative results:** Measured RNG autocorrelation time ~100 ns; ~200 simulated RNG realizations per process corner. ~10,000× energy reduction at comparable generation quality is projected, not measured full-chip image-generation efficiency.
- **Un-0 relevance:** **High** — directly relevant physical-generative alternative and component-level manufacturing robustness evidence.
- **Read status:** **Partial** — journal architecture/process variation and efficiency analysis; company blog checked against paper.

### 19. CN101: digital thermodynamic generation and averaging

**Citation:** Lars Holdijk, Denis Melanson, Zier Mensch, Brandon Birchall, Vincent Cheung, Nicholas Lehrter, Maxwell Aifer, Samuel Duffield, Jan Ole Ernst, Rajath Salegame, Antonio J. Martinez, Gavin Crooks, Miranda Cheng, Zach Belateche, Marc Bright, Patrick J. Coles, and Faris Sbahi. “CN101 - A Digital Thermodynamic Computer for Generative AI.” arXiv:2608.00754, 2026. [HTML](https://arxiv.org/html/2608.00754v1).

- **Year / venue / type:** 2026 / arXiv preprint / hardware demonstration.
- **System and scale:** Digital CMOS stochastic accumulator machine: four 64×64 tiles, 16,384 MAC cells, 256 accumulators, ~500 MHz; VAE and flow matching.
- **E1–E5:** Finite precision and sampling variance, adjacent to E1/E2 but not analog manufacturing/jitter sweeps; E3–E5 not established.
- **Mitigation:** Longer averaging, independent repeated readouts K=2,4,8,16, concurrent stage relaxation. Averaging retains a quantization bias floor.
- **Quantitative results:** 8×8 digit decoder RMSE 0.083±0.028 at 500,000 cycles; floor ~0.09 in cycle sweep. CIFAR generation ~0.06 pixel RMSE against the model's CPU reference; not a FID claim.
- **Un-0 relevance:** **High** — direct comparison for repeated estimates versus irreducible bias; explicitly digital, despite the thermodynamic label.
- **Read status:** **Partial** — hardware table, averaging and generation results.

### 20. Analog memristive GAN with mismatch, aging, faults and combined noise

**Citation:** O. Krestinskaya, B. Choubey, and A. P. James. “Memristive GAN in Analog.” *Scientific Reports* **10**, 5838, 2020. [Article](https://doi.org/10.1038/s41598-020-62676-7).

- **Year / venue / type:** 2020 / Scientific Reports / simulation.
- **System and scale:** Analog memristive DCGAN; 1.7 million memristors; circuit blocks in 180-nm CMOS; 28×28 MNIST generation.
- **E1–E5:** E1 conductance/transistor variation; E2 activation-output noise; E3-like uniform aging and circuit-temperature sweep; E4 stuck/disconnected cells; E5-adjacent noisy sensor input, not final generator phase measurement.
- **Mitigation:** Dropout-based design/regularization and device precision selection; mainly sensitivity characterization rather than a separate matched fix for every error.
- **Quantitative results:** Tolerates conductance σ≈0.04, ~0.3–0.5% failed devices, ~2–4% aging by authors' quality assessment. Joint memristor σ=0.02 plus hardware noise degrades substantially beyond ~10% hardware variation. Circuit temperature tested −15 to 65°C; FID uses 10,000 generated/reference images.
- **Un-0 relevance:** **High** — strong antecedent for isolated and combined hardware-error assessment in generation; no many-chip yield or circular redundancy established.
- **Read status:** **Partial** — device nonidealities, system/circuit simulations and results.

### 21. BrainScaleS generative sampling with physical compartment redundancy

**Citation:** Akos F. Kungl, Sebastian Schmitt, Johann Klähn, Paul Müller, Andreas Baumbach, Dominik Dold, Alexander Kugele, Eric Müller, Christoph Koke, Mitja Kleider, Christian Mauch, Oliver Breitwieser, Luziwei Leng, Nico Gürtler, Maurice Güttler, Dan Husmann, Kai Husmann, Andreas Hartel, Vitali Karasenko, Andreas Grübl, Johannes Schemmel, Karlheinz Meier, and Mihai A. Petrovici. “Accelerated Physical Emulation of Bayesian Inference in Spiking Neural Networks.” *Frontiers in Neuroscience* **13**, 1201, 2019. [Article](https://doi.org/10.3389/fnins.2019.01201).

- **Year / venue / type:** 2019 / Frontiers in Neuroscience / hardware demonstration.
- **System and scale:** Largest experiment: 609 functional neurons across 28 HICANN chips; 208 sampling neurons, one bias, 400 noise-source neurons.
- **E1–E5:** E1 neuronal variability, E2 input correlations/stochasticity; other catalog errors not isolated.
- **Mitigation:** Four physical compartments per functional neuron reduce leak/time-constant variability; calibration and hardware-in-loop wake-sleep training compensate remaining distortions.
- **Quantitative results:** Pattern-completion error ~50%→~10% within 50 biological ms; nominal dynamics 10,000× accelerated. Guided class-conditioned dreaming demonstrated; not an FID comparison.
- **Un-0 relevance:** **High** — clear physical redundancy precedent for generative hardware, although compartment combination differs from independent oscillator-copy circular means.
- **Read status:** **Partial** — architecture, calibration/redundancy, training and generative results.

### 22. Patent: analog restoration/diffusion with controlled noise reinjection

**Citation:** Francesca Parmigiani, Hitesh Ballani, Kirill Kalinin, Christos Gkantsidis, Jannes Gladrow, Daniel Jonathan Finchley Cletheroe, Babak Rahmani, Jiaqi Chu, Oscar Lawrence Spencer Davis, and Douglas James Kelly; assignee Microsoft Technology Licensing LLC. “Implementation of restoration models.” International patent application **WO2026015204A1**, published 15 January 2026. [Patent text](https://patents.google.com/patent/WO2026015204A1/en).

- **Year / venue / type:** 2026 / WIPO patent publication / proposal.
- **System and scale:** Analog denoiser, analog multipliers, noise injection and feedback; optical matrix multiplication among embodiments. No fabricated array scale established.
- **E1–E5:** E2-like controllable physical noise; temperature-controlled resistor noise is an intended control, not demonstrated E3 drift correction. E1/E4/E5 correction not established.
- **Mitigation:** Variance schedules via analog noise generation/scaling; one embodiment reuses one sampled noise vector with changing scale.
- **Quantitative results:** Two distinct implementations of noise scheduling described; no verified FID, chip-yield, latency or energy measurement. A patent disclosure is not experimental validation.
- **Un-0 relevance:** **Med** — prior disclosure of feedback generative analog computation with explicit noise management; no oscillator RAID claim assessed here.
- **Read status:** **Partial** — bibliographic record, description and selected claims; no legal scope/validity assessment.

## Gaps / open questions noted by the literature

1. **The broad novelty claim is unavailable.** Noisy physical generators, noise-aware training, inference-time correction and even physical redundancy all predate this project. AIS (entry 1) directly studies learned oscillator generation with transient noise; the 2020 GAN (20) covers several catalog errors and a combined case. A defensible research claim must specify the Un-0 architecture, error distributions, fixes and yield methodology.

2. **Fixed mismatch and jitter must remain different random variables.** ASSERT (3) explicitly keeps weight maps fixed throughout a deployment and redraws output noise per operation. Its three generation seeds are not equivalent to its 100-chip noise-model validation. The important unresolved comparison for Un-0 is a distribution of complete-generation outcomes over fixed simulated chips, rather than repeated stochastic samples from one chip.

3. **Error amplification is state- and time-dependent.** ASSERT's early-stage explanation uses sufficient Jacobian-gain/alignment assumptions that it does not directly measure. Guidance recalibration (4) identifies relative distortion of a conditional residual; AIS (1) shows nonlinear, indirect generation trajectories. These support investigating sensitivity along Un-0 trajectories, but do not establish that diffusion's vulnerable stages transfer to a roughly ten-step Kuramoto generator.

4. **There is related redundancy, but no demonstrated equivalence to the candidate fixes.** Four-compartment neurons (21), imprecise-distribution mixing (17), and repeated statistical estimates (19) are distinct mechanisms. None establishes circular-mean averaging of independent copies of learned Kuramoto features, an analog code protecting those features, or correction of dead/stuck oscillators in a pretrained class-conditional generator. Learned hidden states in AIS increase expressivity; they should not automatically be called an error-correcting code.

5. **Common-mode error is the difficult redundancy control.** The reviewed averaging results do not establish removal of shared temperature/aging bias. CN101 (19) explicitly retains a quantization bias floor despite longer averaging. For Un-0, independent mismatch/jitter and correlated drift need separate results; any expectation that replica averaging removes shared drift would require additional evidence. This is this review's inference, not a reported oscillator-generator result.

6. **E3, E4 and final E5 are under-separated.** Aging/fault sweeps exist in the 2020 GAN, but comprehensive modern diffusion studies isolating drift, stuck components and final measurement error were not found here. Intermediate ADC noise, noisy training images, and phase measurement immediately before decoding are different injection sites. Retention/endurance measurements alone do not demonstrate robustness to shared drift or failed devices during generation.

7. **Fine-tuning is established; fair comparisons still matter.** Noise-aware training in photonic GANs (9), online calibration in optical diffusion (7), hardware-loop learning (21), and quantization/noise fine-tuning in AIS (1) are precedents. Whether training across simulated chips generalizes to held-out mismatch/fault combinations, and how it compares at equal area/energy to redundancy, remains unresolved by these entries.

8. **Physical stochasticity is not automatically harmless.** Entries 9–18 often deliberately exploit randomness. Their results do not imply that arbitrary noise in omega, K or K_drive reproduces a desired generative SDE. The stochastic term's distribution, correlations, amplitude and location all matter; intended latent randomness must be distinguished from distortion of a learned vector field.

9. **Prototype and projection scales differ sharply.** ADM's 2,304 hardware weights versus billion-parameter simulation, the resistive solver's 2D latent dynamics, Extropic's measured RNG versus modeled full generator, and CN101's digital implementation should remain explicit. Energy/latency estimates frequently exclude or separately model decoding, conversion, control and I/O. The resistive solver's journal/preprint numbers also changed materially.

10. **Search trail and bounds.** Live searches covered arXiv/HTML/PDFs, IEEE DATE/IEDM/ISSCC/VLSI terms, Nature/Science-family publications, NeurIPS proceedings, ICLR/OpenReview and ICML queries, company material, thesis repositories and patents. Backward trails from ASSERT reached EtaMix/CIM acceleration; trails from physical diffusion reached photonic GANs, spintronics and thermodynamic sampling; forward title/identifier searches located the 2026 resistive-solver journal version and later AIS comparisons. No access to a complete subscription citation index or exhaustive Google Scholar citation export was available, so this is a documented topic search, not a certified exhaustive bibliography.

11. **Screened boundaries and remaining leads.** [AIG-CIM, DAC 2024](https://61dac.conference-program.com/presentation/?id=RESEARCH768&sess=sess116) is explicitly digital CIM, so it is not evidence of analog-error mitigation. “Analog Bits” and generative analog-circuit design are also not physical generative execution. [Kungl's thesis](https://archiv.ub.uni-heidelberg.de/volltextserver/28385/1/Kungl_Akos_Ferenc_Doktorarbeit.pdf) surfaced as a relevant historical lead, but was not independently extracted; entry 21 provides the checked journal evidence. Adjacent [redundant-residue analog neural networks](https://doi.org/10.1038/s41467-024-49324-8) warrant a separate coding-focused review and are not counted here as a demonstrated generative fix. Search coverage back to 2015 did not justify adding weakly related early papers merely to fill the date range.

No experiments were run. Only this source file was created for this task. Entries: **22**.
