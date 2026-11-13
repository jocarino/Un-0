# Dynamical robustness of neural ODEs, reservoirs, equilibrium models, and generative samplers

Related work establishes noise-aware training, dynamical stability constraints, and averaging as precedents; none alone establishes robustness of Un-0.
The closest redundancy precedent is a 2026 oscillator-reservoir preprint, including physical measurements and ensemble averaging [1].
Neural SDEs combine injected dynamical noise with repeated stochastic predictions, but primarily evaluate classification and input corruptions [2].
Lyapunov and contraction methods offer ways to suppress perturbation growth, subject to assumptions about the dynamics [3–7].
Continuous-time stability must be distinguished from stability of the deployed, approximately ten-step Euler map [3,5,7].
DEQ studies expose solver nonconvergence and gradient masking, alongside practical Jacobian and trajectory regularisation [8–12].
Physical reservoirs provide direct precedents for measured noise, read averaging, device replication, and temperature changes [13–15].
Reservoir forecasting studies show why low one-step error and richer features need not imply stable autonomous behaviour [16–18].
Generative-sampler work separates discretisation error from learned-vector-field error and calibrated quantisation perturbations [20–23].
No inspected work combines Un-0, E1–E5, circular-mean redundancy, and population-level chip yield; this is a scoped search finding, not proof of novelty.

Search date: **13 November 2026**. Read `notes/hardware-error-catalog.md`; no experiments were run. Searches targeted 2015–2026, with emphasis on 2022–2026, using arXiv, proceedings, publisher/IEEE queries, Nature-family sources, theses, patents, and company publications. Backward trails included the references of LyaNet, NEMON, and reservoir-noise papers; forward trails included the 2022→2023 DEQ robustness studies, Jacobian regularisation→2024 serialized smoothing, and generative-solver→2026 quantisation correction work. Search phrases included “neural ODE parameter perturbations”, “neural SDE noise robustness”, “physical reservoir noise variability drift”, “ensemble reservoir computing”, “DEQ Jacobian robustness”, and “flow sampler quantization discretization”. DATE/ISSCC/IEDM/VLSI-targeted searches did not identify an additional sufficiently verified, directly relevant entry; this is not an exhaustive conference-index search.

**Extraction conventions:** E1 = fixed chip mismatch; E2 = stochastic noise during evolution; E3 = shared slow drift; E4 = permanent faults; E5 = final measurement noise. “Analogue” below means a transferable mathematical mechanism, not a demonstration of that exact hardware error. Input corruption is **not** relabelled as E2 or E5. Discretisation is a separate numerical error. Quantities are author-reported, with table/section locators where available. “Partial” means selected methods/results were inspected, not every proof, figure, or supplement. Missing numbers are explicitly marked rather than estimated from plots. Preprints and later conference versions are counted once.

## Entries

### 1. Ensemble reservoir computing: the closest oscillator-redundancy precedent

**Citation:** Yuma Nakamura, Tomoyuki Kubota, Yusuke Imai, Sumito Tsunegi, Hirofumi Notsu, and Kohei Nakajima. “Ensemble Reservoir Computing for Physical Systems.” arXiv:2601.21807, 2026. [Record](https://arxiv.org/abs/2601.21807); [text](https://arxiv.org/html/2601.21807).

- **Year / venue / type:** 2026 / arXiv preprint / hardware demonstration.
- **System and scale:** A 60-member STO ensemble is illustrated; methods describe measured device waveforms and virtual nodes, so simultaneous operation of 60 fabricated devices is not established here. Separate simulations use 30-node ESNs and up to 500,000 copies.
- **E1–E5:** E2 and noisy-observation/E5 analogues; independent temporal fluctuations. No isolated E1, shared E3, or E4 sweep.
- **Mitigation:** Average nonlinear observed features across independently fluctuating systems under common input; train a readout.
- **Quantitative results:** CRC accuracy 67.3%→99.4%; Hamming encoder/decoder 99.9%/89.4%. ESN memory recovery is partial at 10–100 copies and complete above 1,000 (supplement VI.1).
- **Relevance:** **High.** Direct redundancy precedent, but neither circular-mean phase replication nor codes protecting the reservoir. Coding is the computational task.
- **Read status:** **Partial** — methods, physical results, finite-size analysis, independence assumptions and limitations. Noise-realisation independence does not imply recovery of the noiseless nonlinear response.

### 2. Neural SDE noise regularisation and stochastic prediction averaging

**Citation:** Xuanqing Liu, Tesi Xiao, Si Si, Qin Cao, Sanjiv Kumar, and Cho-Jui Hsieh. “How Does Noise Help Robustness? Explanation and Exploration under the Neural SDE Framework.” *IEEE/CVF CVPR*, pp. 282–290, 2020. [Published record](https://openaccess.thecvf.com/content_CVPR_2020/html/Liu_How_Does_Noise_Help_Robustness_Explanation_and_Exploration_under_the_CVPR_2020_paper.html). Earlier version: “Neural SDE: Stabilizing Neural ODE Networks with Stochastic Noise,” [arXiv:1906.02355](https://arxiv.org/html/1906.02355).

- **Year / venue / type:** 2020; preprint 2019 / CVPR / simulation.
- **System and scale:** Convolutional neural ODE/SDE classifiers; earlier CIFAR-10 model has 115,000 parameters.
- **E1–E5:** E2 mechanism through additive/multiplicative diffusion and dropout-like noise; robustness endpoints concern inputs, not manufactured chips.
- **Mitigation:** Noise during training and inference; average multiple stochastic predictions.
- **Quantitative results:** **Earlier arXiv version, Table 1:** CIFAR-10 accuracy 81.63% for ODE, 83.60% with dropout-style SDE training, 84.55% with test-time noise averaging. These are not independently checked against final CVPR tables.
- **Relevance:** **High.** Prior art for noise-aware continuous computation plus redundancy; not a phase-space hardware demonstration.
- **Read status:** **Partial** — preprint theory/results; final publication abstract/metadata only (published PDF fetch blocked).

### 3. LyaNet: stability trained through a Lyapunov loss

**Citation:** Ivan Dario Jimenez Rodriguez, Aaron D. Ames, and Yisong Yue. “LyaNet: A Lyapunov Framework for Training Neural ODEs.” *ICML*, PMLR 162, 2022. [Paper](https://proceedings.mlr.press/v162/rodriguez22a/rodriguez22a.pdf).

- **Year / venue / type:** 2022 / ICML / theory.
- **System and scale:** Neural ODE classifiers on FashionMNIST, CIFAR-10/100; illustrative 2D state system. Total model sizes not extracted.
- **E1–E5:** None directly isolated; bounded-perturbation stability is relevant to E1–E3 analysis.
- **Mitigation:** Penalise violations of exponential Lyapunov decrease; Monte Carlo state sampling or path-integral training.
- **Quantitative results:** Table 1: CIFAR-10 nominal error 18.50%→17.22%; PGD ℓ∞ error at 8/255 falls 75.70%→58.97%. The continuous-network/path-integral variant does **not** improve this robustness metric. Section 5.2 explicitly flags coarse integration as potentially breaking the continuous-time condition.
- **Relevance:** **High.** A stability-training baseline and a direct warning for ten-step inference.
- **Read status:** **Partial** — guarantees, Table 1, convergence and discretisation discussion.

### 4. FI-ODE: certificates under uncertain dynamical parameters

**Citation:** Yujia Huang, Ivan Dario Jimenez Rodriguez, Huan Zhang, Yuanyuan Shi, and Yisong Yue. “FI-ODE: Certifiably Robust Forward Invariance in Neural ODEs.” arXiv:2210.16940, revised 2023. [Version 4](https://arxiv.org/html/2210.16940v4).

- **Year / venue / type:** 2023 revision; first posted 2022 / arXiv, publication venue not confirmed / theory.
- **System and scale:** Planar Segway control with a three-layer MLP controller, plus image classification; 1,000 adversarial initial states for control evaluation.
- **E1–E5:** E1-like bounded system-parameter uncertainty, not neural-weight fabrication mismatch; no stochastic E2 or independently tested E3–E5.
- **Mitigation:** Robust Lyapunov training, adaptive boundary sampling, adversarial training, and neighbourhood verification.
- **Quantitative results:** Section 4.1/Table 1: ±2% on each plant parameter; robust FI-ODE keeps 100% of tested trajectories safe, versus 50.4% for standard backprop training and 97.8% for the adversarial-training ablation. A robust forward-invariance certificate is also obtained.
- **Relevance:** **High.** Shows how parameter uncertainty can enter a certificate, while differing substantially from generative image fidelity.
- **Read status:** **Partial** — uncertainty setup, certification method and control results.

### 5. Stable neural ODE robustness can be a solver artefact

**Citation:** Yifei Huang, Yaodong Yu, Hongyang Zhang, Yi Ma, and Yuan Yao. “Adversarial Robustness of Stabilized Neural ODE Might be from Obfuscated Gradients.” *Mathematical and Scientific Machine Learning*, PMLR 145:497–515, 2022. [Record](https://proceedings.mlr.press/v145/huang22a.html); [paper](https://proceedings.mlr.press/v145/huang22a/huang22a.pdf).

- **Year / venue / type:** 2022 proceedings / MSML / simulation.
- **System and scale:** SONet and ResNet/ODE hybrids, including CIFAR-10; exact parameter count not extracted.
- **E1–E5:** None directly; adversarial initial/input perturbations and adaptive-solver behaviour.
- **Mitigation:** Skew-symmetric stable ODE blocks; importantly, stronger and gradient-free robustness evaluation.
- **Quantitative results:** Reported CIFAR-10 hybrid has 91.57% clean and 62.35% PGD-20 accuracy at ℓ∞=0.031, compared with 76.29%/45.24% for a TRADES baseline. The paper explains that adaptive HEUN2/BOSH3/DOPRI5 can mask gradients; CW and SPSA expose the weakness. The PGD score is not a reliable standalone guarantee.
- **Relevance:** **Medium.** Supports solver-aware evaluation, not evidence of hardware tolerance.
- **Read status:** **Partial** — architecture, abstract results and solver critique.

### 6. Minimal weight changes to control perturbation amplification

**Citation:** Arturo De Marinis, Nicola Guglielmi, Stefano Sicilia, and Francesco Tudisco. “Improving the robustness of neural ODEs with minimal weight perturbation.” arXiv:2501.10740v2, 2025. [Paper](https://arxiv.org/html/2501.10740v2). Version 1 used the title “Stability of neural ODEs by a control over the expansivity of their flows.”

- **Year / venue / type:** 2025 / arXiv preprint / theory.
- **System and scale:** 64-dimensional neural ODE state; 64×64 dynamical weight matrix; four image datasets.
- **E1–E5:** None directly; controlled weight modification mitigates input sensitivity, rather than testing random E1 mismatch.
- **Mitigation:** Minimise Frobenius-norm weight changes subject to a logarithmic-Jacobian-norm stability target; retrain.
- **Quantitative results:** Table 3: CIFAR-10 FGSM accuracy at ℓ∞=0.006 improves 32.11%→47.27%; clean accuracy 74.62%→76.23%. Stability controls flow amplification through an exponential logarithmic-norm bound.
- **Relevance:** **High.** Suggests structured changes to learned couplings, but observed input robustness cannot establish post-fabrication robustness.
- **Read status:** **Partial** — matrix-stabilisation method, architecture, Tables 1–4 and cost discussion.

### 7. Stable architectures: continuous and discrete dynamics must agree

**Citation:** Eldad Haber and Lars Ruthotto. “Stable architectures for deep neural networks.” *Inverse Problems* 34(1):014004, 2018 (online 2017). [DOI](https://doi.org/10.1088/1361-6420/aa9a90); [author preprint](https://arxiv.org/html/1705.03341).

- **Year / venue / type:** 2018 issue; 2017 preprint / Inverse Problems / theory.
- **System and scale:** ODE-inspired antisymmetric and Hamiltonian residual networks; toy networks up to 1,024 layers, plus MNIST.
- **E1–E5:** None directly isolated; feature sensitivity and numerical propagation motivate E1/E2 analysis.
- **Mitigation:** Antisymmetric weights, damping, smooth layerwise parameters, and leapfrog/Verlet integration.
- **Quantitative results:** Swiss-roll example achieves optimal validation accuracy with 32 Hamiltonian/Verlet layers, versus 1,024 for the standard ResNet. Section 4.1 requires suitable integration and small steps; forward Euler needs damping even for an otherwise stable antisymmetric continuous system.
- **Relevance:** **High.** Foundational reason to analyse Un-0's actual Euler update, not just its ODE.
- **Read status:** **Partial** — stability sections and toy numerical comparisons; not all journal-version material.

### 8. Stabilising DEQs by Jacobian regularisation

**Citation:** Shaojie Bai, Vladlen Koltun, and J. Zico Kolter. “Stabilizing Equilibrium Models by Jacobian Regularization.” *ICML*, PMLR 139:554–565, 2021. [Paper](https://proceedings.mlr.press/v139/bai21b/bai21b.pdf).

- **Year / venue / type:** 2021 / ICML / simulation.
- **System and scale:** 10-million-parameter CIFAR-10 MDEQ; 98-million-parameter language DEQ; ImageNet models.
- **E1–E5:** None directly; Jacobian-controlled amplification is transferable to E1–E3.
- **Mitigation:** Stochastic Jacobian Frobenius-norm penalty stabilises forward/backward equilibrium solves.
- **Quantitative results:** Table 2: CIFAR-10 MDEQ falls from 17 to 6 function evaluations, accuracy 93.6±0.2%→93.1±0.3%. Simply stopping the unregularised model at 6 gives 89.1%. Table 1: language-model training time falls from 3.1× to 1.5× the Transformer-XL reference.
- **Relevance:** **High.** A concrete stability/compute/accuracy baseline; DEQ fixed points differ from Un-0's finite transient.
- **Read status:** **Partial** — Jacobian rationale, fixed-point sensitivity expression, Tables 1–2.

### 9. Contractive implicit networks with sensitivity bounds

**Citation:** Saber Jafarpour, Alexander Davydov, Anton V. Proskurnikov, and Francesco Bullo. “Robust Implicit Networks via Non-Euclidean Contractions.” *NeurIPS* 34, 2021. [Paper](https://proceedings.neurips.cc/paper/2021/file/51a6ce0252d8fa6e913524bdce8db490-Paper.pdf).

- **Year / venue / type:** 2021 / NeurIPS / theory.
- **System and scale:** NEMON implicit networks; 100 hidden states on MNIST and convolutional CIFAR-10 models.
- **E1–E5:** None directly; bounded input/forcing sensitivity is analogous to some E1/E3 effects, subject to a separate mapping.
- **Mitigation:** Non-Euclidean contraction constraints and input-output Lipschitz regularisation.
- **Quantitative results:** MNIST mean best accuracy 97.72%, versus 97.21% for implicit deep learning and 97.62% for MON, over 5 runs. NEMON averages 12 forward iterations versus MON's 17. The output bound scales as ‖B‖∞‖C‖∞/[1−μ∞(A)] when μ∞(A)<1.
- **Relevance:** **High.** Explicit sensitivity-margin framework; its assumptions must be checked for driven phase dynamics.
- **Read status:** **Partial** — contraction framework, sensitivity bound and experimental section.

### 10. DEQ nonconvergence produces misleading robustness

**Citation:** Zonghan Yang, Tianyu Pang, and Yang Liu. “A Closer Look at the Adversarial Robustness of Deep Equilibrium Models.” *NeurIPS* 35, 2022. [Proceedings](https://papers.nips.cc/paper/2022/hash/43da8cca8f14139774bcbd935d51e0f2-Abstract-Conference.html); [text](https://arxiv.org/html/2306.01429).

- **Year / venue / type:** 2022; arXiv upload 2023 / NeurIPS / simulation.
- **System and scale:** CIFAR-10 DEQ-Large; forward/backward iteration budgets including 8/7 and 18/20.
- **E1–E5:** None directly; solver convergence and input attacks.
- **Mitigation:** Intermediate-state gradient estimates, unrolling-based training, and attacks that expose nonconvergence.
- **Quantitative results:** Table 1: the 8/7 exact-trained model appears to achieve 79.97% PGD-10 accuracy, but SQUARE reduces it to 5.95%; clean accuracy is 78.24%. Relative equilibrium residuals exceed 0.75 in this configuration; unrolling-trained final residual is about 0.04.
- **Relevance:** **Medium.** A warning against interpreting short iterative computation as equilibrium-certified robustness.
- **Read status:** **Partial** — convergence diagnostics, Table 1 and evaluation method.

### 11. Regularise intermediate dynamics, not only the endpoint

**Citation:** Zonghan Yang, Peng Li, Tianyu Pang, and Yang Liu. “Improving Adversarial Robustness of Deep Equilibrium Models with Explicit Regulations Along the Neural Dynamics.” *ICML*, PMLR 202:39349–39364, 2023. [Record](https://proceedings.mlr.press/v202/yang23i.html); [paper](https://proceedings.mlr.press/v202/yang23i/yang23i.pdf).

- **Year / venue / type:** 2023 / ICML / simulation.
- **System and scale:** CIFAR-10 DEQs; evaluation considers 8 intermediate states, 9 unrolling lengths and 2 relaxation settings (144 attacks).
- **E1–E5:** None directly; input-adversarial robustness, with a transferable intermediate-state training principle.
- **Mitigation:** Input entropy reduction along inference and random intermediate-state losses during adversarial training.
- **Quantitative results:** Table 2: intermediate-attack accuracy for TRADES baseline 50.46%; combined methods 55.18%, versus 56.09% under the easier final-state attack.
- **Relevance:** **Medium.** Supports supervising the trajectory if optional noise-aware fine-tuning is considered; does not establish E1–E5 tolerance.
- **Read status:** **Partial** — methods and Tables 2–4, including stronger evaluation of the test-time defence.

### 12. Serialized smoothing: noisy replicas can be correlated

**Citation:** Weizhi Gao, Zhichao Hou, Han Xu, and Xiaorui Liu. “Certified Robustness for Deep Equilibrium Models via Serialized Random Smoothing.” *NeurIPS* 37, 2024. [Proceedings](https://proceedings.neurips.cc/paper_files/paper/2024/hash/02cf868040aa0f0a1e1121cf255fdcfb-Abstract-Conference.html); [text](https://arxiv.org/html/2411.00899).

- **Year / venue / type:** 2024 / NeurIPS / theory.
- **System and scale:** MDEQ-Small/Large on CIFAR-10 and ImageNet; e.g. 30-iteration reference versus 1–3-iteration serialized solves.
- **E1–E5:** None directly; Gaussian input smoothing, not hardware jitter.
- **Mitigation:** Reuse previous equilibrium solutions across noisy evaluations, with a correlation-adjusted certificate.
- **Quantitative results:** Table 1: CIFAR-10 Large, radius 0.5, 45% certified accuracy for both MDEQ-30A and SRS-1A; per-image certification 12.89→1.79 seconds, about 7× faster.
- **Relevance:** **Medium.** Useful precedent for accounting for dependence when redundancy reuses states or computation; input certificates do not transfer automatically to phase errors.
- **Read status:** **Partial** — serialization, correlation treatment, Tables 1–3.

### 13. Atomic-switch reservoirs: averaging can help memory but not task error

**Citation:** Hiroshi Kubota, Tsuyoshi Hasegawa, Megumi Akai-Kasaya, and Tetsuya Asai. “Noise sensitivity of physical reservoir computing in a ring array of atomic switches.” *Nonlinear Theory and Its Applications, IEICE* 13(2):373–378, 2022. [Record](https://www.jstage.jst.go.jp/article/nolta/13/2/13_373/_article); [paper](https://eprints.lib.hokudai.ac.jp/dspace/bitstream/2115/85562/1/13_373.pdf).

- **Year / venue / type:** 2022 / NOLTA, IEICE / simulation.
- **System and scale:** 201-node ring reservoir; noise model informed by physical atomic-switch current measurements, not a complete fabricated 201-node demonstration.
- **E1–E5:** E2 current fluctuations and E5-like repeated noisy observations; not phase measurement.
- **Mitigation:** Increase operating current, repeat/average reads, adjust device time constant.
- **Quantitative results:** Sections 4–5: noise amplitude 10⁻¹⁰ A; operating current approximately 1→100 nA, supply 3 V, OFF resistance reduced tenfold. Read averaging improves memory capacity but **does not improve NARMA10 NRMSE**; exact curve values not extracted.
- **Relevance:** **High.** Direct oversampling precedent and evidence that denoising one proxy may not improve the target task.
- **Read status:** **Partial** — noise model, Sections 4–6 and results discussion.

### 14. Reservoir replication and temperature robustness in R–C circuits

**Citation:** Zelin Ma, Huasen Yi, Ziping Zheng, Zhanyi Chen, Weicheng Liu, Yibing Chen, Bojun Cheng, Chang Cai, Shusheng Pan, and Jun Ge. “Versatile and Robust Reservoir Computing with PWM-Driven Heterogenous R–C Circuits.” *Advanced Science* 12:e16413, 2025. [Paper](https://doi.org/10.1002/advs.202416413).

- **Year / venue / type:** 2025 / Advanced Science / hardware demonstration.
- **System and scale:** PWM-driven R–C reservoirs; 40-node benchmark configuration, eight heterogeneous sub-reservoirs for heartbeat classification.
- **E1–E5:** E1-like assembly/replica variation and E3 temperature changes; E2/E5 explicitly omitted from comparison simulations; no E4.
- **Mitigation:** Choose a stable substrate and diversify response times/nonlinearities; transfer fixed readout weights between assemblies.
- **Quantitative results:** Mackey–Glass NRMSE 0.015; heartbeat accuracy 94%. Section 2.4 tests a second assembly at 80°C; Hénon relative-error reduction 98.4% versus the memristor comparison. That comparison uses simulated memristors with 5% variation, not matched fabricated chips.
- **Relevance:** **High.** Precedent for transfer between physical instances plus temperature testing; only two R–C assemblies, not a manufacturing-yield distribution.
- **Read status:** **Partial** — architecture, benchmarks and Section 2.4; supporting information not fully read.

### 15. Match training noise to deployment noise

**Citation:** Chad Nathe, Chandra Pappu, Nicholas A. Mecholsky, Joseph D. Hart, Thomas Carroll, and Francesco Sorrentino. “Reservoir computing with noise.” *Chaos* 33:041101, 2023. [DOI](https://doi.org/10.1063/5.0130278); [text](https://arxiv.org/html/2303.00585).

- **Year / venue / type:** 2023 / Chaos / simulation.
- **System and scale:** 100-node recurrent reservoir; Lorenz, Rössler and Hindmarsh–Rose observer tasks.
- **E1–E5:** No exact hardware error; noisy input and target measurements are E5 analogues in a sensing pipeline, not final oscillator readout noise.
- **Mitigation:** Match training/test noise strength; low-pass filter signals.
- **Quantitative results:** Section III reports an order-of-magnitude error reduction when comparing high-training/low-testing noise with the opposite mismatch (normalised noise settings ε>10 versus ε<5). Best performance occurs near equal training/testing noise. These ε values use the paper's signal/time normalisation and are not phase standard deviations.
- **Relevance:** **Medium.** Supports distribution-matched noise training and filtering baselines, with different noise placement.
- **Read status:** **Partial** — equations, noise normalisation and training/test mismatch results.

### 16. Noise-inspired regularisation stabilises autonomous reservoir forecasts

**Citation:** Alexander Wikner, Joseph Harvey, Michelle Girvan, Brian R. Hunt, Andrew Pomerance, Thomas Antonsen, and Edward Ott. “Stabilizing machine learning prediction of dynamics: Novel noise-inspired regularization tested with reservoir computing.” *Neural Networks* 170:94–110, 2024. [Published record](https://www.sciencedirect.com/science/article/pii/S0893608023006159); [2022 manuscript](https://arxiv.org/html/2211.05262).

- **Year / venue / type:** 2024; preprint 2022 / Neural Networks / simulation.
- **System and scale:** 500-node reservoir, mean degree 3, spectral radius 0.6; chaotic Kuramoto–Sivashinsky PDE forecasting. This PDE is **not** a Kuramoto oscillator network.
- **E1–E5:** E2-like injected training noise, chiefly at inputs; no physical E1–E5 isolation.
- **Mitigation:** Linearized Multi-Noise Training (LMNT) approximates multiple small noise perturbations by a deterministic regulariser.
- **Quantitative results:** Manuscript Tables 1–2: 20 reservoir realisations; 7,000 valid-time forecasts and 1,000 climate forecasts. Figure 3 examines 1,000,000-step predictions, approximately 12,000 Lyapunov times. Noise/LMNT achieves stable, accurate climates; “indefinitely stable” is an empirical description, not an infinite-time certificate.
- **Relevance:** **High.** Useful precedent for evaluating error growth and regularisation across random dynamical instances.
- **Read status:** **Partial** — manuscript regularisation methods, experiment scales and climate-stability results; published abstract.

### 17. A better fitted flow map can still be an unstable integrator

**Citation:** Yuanzhao Zhang, Edmilson Roque dos Santos, Huixin Zhang, and Sean P. Cornelius. “How more data can hurt: Instability and regularization in next-generation reservoir computing.” *Chaos* 35:073102, 2025. [Paper](https://pmc.ncbi.nlm.nih.gov/articles/PMC12221348/).

- **Year / venue / type:** 2025; preprint 2024 / Chaos / simulation.
- **System and scale:** NGRC magnetic-pendulum modelling; two delayed states; example uses 1,000 radial-basis features.
- **E1–E5:** No isolated hardware errors; noise injection is a training remedy for numerical/dynamical instability.
- **Mitigation:** Scale ridge regularisation with training data or inject training noise.
- **Quantitative results:** Figure 4: with 100 training trajectories, basin error is about 0.2; with 1,000 trajectories, the fitted flow improves but all tested predictions diverge. Example Δt=0.01, regularisation 10⁻⁵. The paper links this to the learned multistep integrator rather than ordinary overfitting.
- **Relevance:** **High.** Strong reason to distinguish fitting error, integration stability and downstream output quality.
- **Read status:** **Partial** — Figures 3–4, integrator analysis and mitigation discussion.

### 18. A physical-reservoir tutorial explicitly separates noise sources

**Citation:** Susan Stepney. “Physical reservoir computing: a tutorial.” *Natural Computing* 23:665–685, 2024. [Paper](https://doi.org/10.1007/s11047-024-09997-y).

- **Year / venue / type:** 2024 / Natural Computing / review.
- **System and scale:** Multiple substrates; illustrative characterisation of 20,000 randomly configured 100-node ESNs.
- **E1–E5:** Discusses E2 internal noise, E3 environmental changes and E5 measurement noise; substrate-instance variability motivates characterisation. No E1–E5 joint sweep.
- **Mitigation:** Environmental calibration/isolation, repeated measurements and explicit interface characterisation.
- **Quantitative results:** Figure 4 spans 20,000 ESNs with spectral radius sampled over 0.5–2. Section 4.4 gives no numerical hardware-noise tolerance or yield result. Section 7 warns that noise can distort nominal rank/capacity measures.
- **Relevance:** **High.** Supports separating internal dynamics, interface artefacts and readout uncertainty before attributing robustness to redundancy.
- **Read status:** **Partial** — Sections 4.3–4.4, measurement and characterisation discussion; not the complete tutorial.

### 19. Noise limits usable reservoir features

**Citation:** Anthony M. Polloreno. “Restrictions on physical stochastic reservoir computers.” *Physical Review Applied* 24:014031, 2025. [Published record](https://journals.aps.org/prapplied/abstract/10.1103/xrh4-7ljd); [text](https://arxiv.org/html/2307.14474v5).

- **Year / venue / type:** 2025; initial preprint 2023 / Physical Review Applied / theory.
- **System and scale:** General stochastic physical reservoirs with n output bits and 2ⁿ probability-state coordinates/readout monomials.
- **E1–E5:** E2 stochastic dynamics and noisy accessible-output representation; no chip mismatch, drift or fault measurements.
- **Mitigation:** No demonstrated error-correcting method; identifies limits and motivates selection of useful observable features.
- **Quantitative results:** Equation 8 gives IPC as Σₖ1/(1+σ̃ₖ²). Theorem IV.2 bounds IPC polynomially in n despite 2ⁿ potential features, under the stated physicality/memory assumptions. No numerical noise threshold or Un-0 capacity bound is reported.
- **Relevance:** **Medium.** Motivates feature-level redundancy and information measurements, without implying that all added features provide independent robust capacity.
- **Read status:** **Partial** — definitions, capacity expression, theorem and assumptions; proof not independently verified.

### 20. Dedicated ODE solvers reduce few-step generative error

**Citation:** Cheng Lu, Yuhao Zhou, Fan Bao, Jianfei Chen, Chongxuan Li, and Jun Zhu. “DPM-Solver: A Fast ODE Solver for Diffusion Probabilistic Model Sampling in Around 10 Steps.” *NeurIPS* 35, 2022. [Record](https://arxiv.org/abs/2206.00927); [text](https://arxiv.org/html/2206.00927).

- **Year / venue / type:** 2022 / NeurIPS / simulation.
- **System and scale:** Diffusion probability-flow ODEs; CIFAR-10 and larger image datasets; 10–20 network evaluations rather than oscillator hardware.
- **E1–E5:** None directly; numerical discretisation only, not parameter fabrication noise.
- **Mitigation:** Solve the linear part analytically and approximate the remaining neural integral with high-order exponential integration.
- **Quantitative results:** CIFAR-10 FID 4.70 at 10 evaluations and 2.87 at 20; reported speedup 4–16×. Theorem 3.2 gives global error O(hᵏ) for orders k=1,2,3 under regularity assumptions.
- **Relevance:** **Medium.** Establishes a solver-error baseline; its diffusion-specific decomposition cannot be assumed to apply unchanged to Un-0.
- **Read status:** **Partial** — solver construction, convergence theorem and reported results.

### 21. EDM: discretisation, curvature and deliberate stochasticity

**Citation:** Tero Karras, Miika Aittala, Timo Aila, and Samuli Laine. “Elucidating the Design Space of Diffusion-Based Generative Models.” *NeurIPS* 35:26565–26577, 2022. [Paper](https://proceedings.neurips.cc/paper_files/paper/2022/file/a98846e9d9cc01cfb87eb694d946ce6b-Paper-Conference.pdf).

- **Year / venue / type:** 2022 / NeurIPS / simulation.
- **System and scale:** Image diffusion ODE/SDE samplers on CIFAR-10 and ImageNet-64; 35 network evaluations per CIFAR image in headline results.
- **E1–E5:** No hardware error sweep. Deliberate stochastic sampler noise is an E2 analogue, with compensating dynamics rather than arbitrary uncontrolled jitter.
- **Mitigation:** Heun integration, curvature-aware parameterisation/noise schedule, model preconditioning and calibrated stochastic sampling.
- **Quantitative results:** CIFAR-10 FID 1.79 conditional and 1.97 unconditional at 35 evaluations. Pretrained ImageNet-64 FID improves 2.07→1.55; retraining yields 1.36. These combined design results do not isolate hardware-noise recovery.
- **Relevance:** **Medium.** Helps separate intended sampling stochasticity from numerical and hardware imperfections.
- **Read status:** **Partial** — deterministic/stochastic sampling design and reported results.

### 22. Rectified flow trains trajectories for coarse Euler sampling

**Citation:** Xingchao Liu, Chengyue Gong, and Qiang Liu. “Flow Straight and Fast: Learning to Generate and Transfer Data with Rectified Flow.” *ICLR*, 2023; arXiv:2209.03003, 2022. [Text](https://arxiv.org/html/2209.03003); [conference PDF](https://openreview.net/references/pdf?id=tUjvLIXarl).

- **Year / venue / type:** 2023; preprint 2022 / ICLR / simulation.
- **System and scale:** Neural ODE image transport; DDPM++ CIFAR-10 model, one-step and full adaptive integration comparisons.
- **E1–E5:** None directly; robustness to coarse discretisation, not hardware jitter or mismatch.
- **Mitigation:** Reflow straightens trajectories; optional distillation learns a one-step generator.
- **Quantitative results:** Inspected arXiv Table 1: one-step Euler FID 378 for 1-rectified flow, 12.21 for 2-rectified, 8.15 for 3-rectified; distilled 2-rectified reaches 4.85. Full 1-rectified RK45 gives 2.58 at 127 evaluations. Distillation and reflow are separate interventions.
- **Relevance:** **Medium.** Clear precedent that training for short-step deployment matters; no evidence of analogue-parameter tolerance.
- **Read status:** **Partial** — straightening rationale and CIFAR-10 table; not all proofs or conference-version changes.

### 23. Q-Drift: calibrated sampler correction for numerical hardware error

**Citation:** Sooyoung Ryu, Mathieu Salzmann, and Saqib Javed. “Q-Drift: Quantization-Aware Drift Correction for Diffusion Model Sampling.” arXiv:2603.18095v2, 2026. [Record](https://arxiv.org/abs/2603.18095v2); [text](https://arxiv.org/html/2603.18095v2).

- **Year / venue / type:** 2026, September revision / arXiv preprint / simulation.
- **System and scale:** Six text-to-image models, three samplers including Euler and flow matching, two principal PTQ methods; 4–30 sampling steps.
- **E1–E5:** E1-like fixed quantised weights plus state-dependent numerical error; E2 is an auxiliary stochastic surrogate, not measured independent hardware jitter. “Drift” here does not mean E3 aging/temperature drift.
- **Mitigation:** Calibrate conditional residual variance and rescale each deterministic sampler update without retraining.
- **Quantitative results:** PixArt-Σ W3A4 FID 48.85→44.06; 10 paired calibration runs remain effective in SDXL. A milder W4A4 PixArt case slightly worsens 19.61→19.65.
- **Relevance:** **High.** Close generative precedent for calibration-based correction, but not a general Kuramoto noise-cancellation guarantee.
- **Read status:** **Partial** — correction derivation, main table, calibration and milder-quantisation appendix; v2 values supersede older search snippets.

## Gaps / open questions noted by the literature

1. **Redundancy itself is established; the exact protected computation remains open.** Entry 1 is close prior art for noisy oscillator-feature ensembles. Its CRC/Hamming benchmarks compute codes; they do not encode Un-0's latent state to correct failed oscillators. The inspected literature does not establish circular-mean phase replication, analogue ECC protecting the generator, or their combined yield benefit. Those narrower claims require comparison, not a broad “first use of redundancy” claim.

2. **Random-parameter chips differ from random trajectories.** A reservoir ensemble, multiple noise draws, or different initial states is not a population of chips with fixed omega/K/K_drive offsets. Entry 14 transfers readout weights between physical assemblies, but does not estimate large-population yield. The full distribution of image quality under E1 and combined E1–E5 remains unverified here.

3. **Independent noise and shared drift require different arguments.** Entry 1 relies on independence/phase-diversity conditions and identifies finite-ensemble limits. It gives no guarantee for correlated errors across copies. Shared E3 offsets may survive averaging. For circular variables, both phase alignment and concentration of the mean resultant matter; applying these ideas to Un-0 is a reviewer inference, not a result of these papers.

4. **Stability is not fidelity.** LyaNet discusses an expressiveness/stability tradeoff [3]; the atomic-switch study improves memory capacity without improving NARMA error [13]. Damping all dynamical sensitivity could suppress useful generative variation. Image identity preservation, class fidelity and distributional quality therefore remain separate outcomes; none is implied by a negative Lyapunov exponent alone.

5. **Finite transient sensitivity needs its own analysis.** Equilibrium sensitivity in [8–9] describes converged fixed points; Un-0 is a finite transient. The relevant quantities include finite-time perturbation gain, parameter-to-state sensitivity, and decoder amplification. As a transferable analysis identity, differentiating an ODE gives `dS/dt = J_state S + J_parameter`; this is not a measured Un-0 result. A long-time Lyapunov exponent can miss short-time/non-normal amplification.

6. **The deployed integrator is part of the model.** Continuous stability does not certify coarse Euler stability [3,7]. Generative sampler papers [20–22] explicitly reduce truncation error, whereas E2 Brownian noise changes the equation. Parameter-offset accumulation, fresh diffusion increments and solver truncation must be kept distinct when interpreting any future robustness curve. No experiments were performed for this review.

7. **Noise-aware fine-tuning has precedents but limited transfer guarantees.** Neural SDE and reservoir work [2,15–17] supports noise injection and matching deployment conditions. It does not show that Gaussian per-step training handles fixed per-chip biases, correlated colored noise, shared temperature drift, or stuck phases. Training noise distributions and evaluation noise distributions must be reported separately.

8. **Fault coverage is particularly weak in this slice.** No retained work directly isolates E4 dead oscillators, stuck phases and broken couplings in a class-conditional oscillator image generator. Random dropout during training is not evidence for arbitrary permanent defects after fabrication. Likewise, input corruption certificates in [5,10–12] do not certify internal faults.

9. **Feature redundancy requires an information and cost budget.** Entry 19 bounds usable stochastic-reservoir capacity under explicit assumptions; entry 1 documents finite-copy limits. Neither establishes an optimal number of Un-0 copies. The literature leaves open how energy, area, latency, calibration, readout precision and useful independent feature information trade against recovered image quality.

10. **Solver-aware verification is essential when claims use adversarial robustness.** Entries 5 and 10 show that inaccurate/obfuscated gradients can create impressive but misleading scores. For a prospective Un-0 study, direct sampled hardware perturbations would answer a different question from adversarial input attacks; any claimed certificates must explicitly include the internal uncertainty and deployed numerical map.

**Screened material and coverage limits.** [Yujia Huang's 2024 Caltech dissertation](https://thesis.caltech.edu/16314/) was checked at abstract/metadata level as a citation-trail source; its FI-ODE contribution was not counted twice. [TDK's October 2025 analogue-reservoir announcement](https://www.tdk.com/system/files/20251002_01_press_E.pdf) was read in part but supplied no quantitative E1–E5 robustness evidence. [EP4760593A1, “One-transistor reservoir computer using floating body effect”](https://patents.google.com/patent/EP4760593A1/en), published June 2026, was screened in part: optional accumulation/averaging of current measurements is relevant readout practice, but no verified comparative noise-recovery result was extracted. These are not additional entries. Publisher access failures were worked around using author/arXiv versions where possible; no entry is claimed as fully read. Search findings do not constitute an exhaustive patent search or an exclusion of unpublished/private prior art.
