# Physical neural networks: physics-aware training, digital twins, and calibration

Search date: 2026-11-13. Scope: 2015–2026, with emphasis on 2022–2026; 25 works retained.
Physics-aware training (PAT) and hardware-in-the-loop learning already compensate for analog model mismatch using measured forward passes and approximate digital gradients (entries 1, 11–14).
Offline hardware-aware training instead randomizes characterized nonidealities before deployment; it need not identify or retrain every individual chip (16, 19–20).
Learned stochastic digital twins address noisy dynamics and memory, making NADO particularly close to the proposed Un-0 fine-tuning problem (7).
Adaptive surrogate models and sharpness-aware objectives address inaccurate gradients, transfer between devices, and post-deployment perturbations (3, 8).
Mixed-signal hardware also uses bias lookup tables, circuit sizing, population codes, repeated measurements, and homeostatic learning (15, 17–18, 23–25).
Population averaging is explicit prior art: Zendrikov measures the resource–precision trade-off, and Krause combines population encoding with coupled-oscillator calibration (24–25).
The verified Wright/McMahon seed is Nature 601, 549–555 (2022), not a simulation-only proposal; it includes an electronic oscillator demonstration (1).
These results establish substantial prior art for the mitigation components, but the retained works do not establish the complete Un-0 study: a Kuramoto image generator, E1–E5 isolation, circular-mean/ECC feature redundancy, and combined-error yield.
That last statement is a scoped search finding, not proof of novelty; error labels below are review mappings to the project catalog, not terminology necessarily used by the authors.

## Entries

### 1. Wright et al. — Physics-aware training

**Citation:** Logan G. Wright, Tatsuhiro Onodera, Martin M. Stein, Tianyu Wang, Darren T. Schachter, Zoey Hu, and Peter L. McMahon. “Deep physical neural networks trained with backpropagation.” *Nature* **601**, 549–555 (2022). [Published paper](https://doi.org/10.1038/s41586-021-04223-6); [accessible preprint](https://arxiv.org/abs/2104.13386).

- **Year / venue / type:** 2022 / Nature / hardware demonstration.
- **System and scale:** Mechanical plate, nonlinear electronic oscillator, and optical second-harmonic generation; sequential physical layers, including a three-layer mechanical MNIST classifier. Not a large coupled Kuramoto array.
- **E1–E5:** E1-like model/device mismatch and E2 physical noise; E5-like measurement uncertainty is present but not cleanly isolated. No E4 fault campaign or separate common-drift sweep.
- **Mitigation:** Physical forward passes; differentiable surrogate backward passes evaluated at measured activations; input-dependent noise modeling for the offline baseline.
- **Key quantitative results:** MNIST test accuracy **87%, 93%, and 97%** for mechanical, electronic, and optical implementations respectively (Fig. 4). Learned-model output errors are approximately **1–2%** for optics and **5–10%** for electronics (Methods).
- **Relevance to Un-0:** **High** — directly establishes training of imperfect physical dynamical computations, including an oscillator, with approximate gradients.
- **Read status:** **partial** — paper/preprint methods, results, and selected supplementary material; publication metadata verified.

### 2. Momeni et al. — Training-method review

**Citation:** Ali Momeni, Babak Rahmani, Benjamin Scellier, Logan G. Wright, Peter L. McMahon, Clara C. Wanjura, Yuhang Li, Anas Skalli, Natalia G. Berloff, Tatsuhiro Onodera, Ilker Oguz, Francesco Morichetti, Philipp del Hougne, Manuel Le Gallo, Abu Sebastian, Azalia Mirhoseini, Cheng Zhang, Danijela Marković, Daniel Brunner, Christophe Moser, Sylvain Gigan, Florian Marquardt, Aydogan Ozcan, Julie Grollier, Andrea J. Liu, Demetri Psaltis, Andrea Alù, and Romain Fleury. “Training of physical neural networks.” *Nature* **645**, 53–61 (2025). [Publication](https://doi.org/10.1038/s41586-025-09384-2); [2024 review preprint](https://arxiv.org/html/2406.03372v1).

- **Year / venue / type:** 2025 / Nature / review.
- **System and scale:** Optical, electronic, spintronic, mechanical, and other PNNs; no single experimental scale.
- **E1–E5:** Discusses mismatch, stochasticity, and measurement/training constraints corresponding broadly to E1/E2/E5; not an E1–E5 benchmark.
- **Mitigation:** Surveys PAT, physical backpropagation, local learning, equilibrium methods, and hardware-aware training.
- **Key quantitative results:** **No new comparative robustness measurement.** The **29-page, 4-figure** 2024 preprint is a citation-trail source, not a demonstrated scaling result.
- **Relevance to Un-0:** **High** — places non-isomorphic dynamical substrates within the PNN training literature.
- **Read status:** **partial** — preprint training sections and references; published abstract and bibliographic record. Versions counted once.

### 3. Zheng et al. — Dual adaptive training

**Citation:** Ziyang Zheng, Zhengyang Duan, Hang Chen, Rui Yang, Sheng Gao, Haiou Zhang, Hongkai Xiong, and Xing Lin. “Dual adaptive training of photonic neural networks.” *Nature Machine Intelligence* **5**, 1119–1129 (2023). [Publication](https://doi.org/10.1038/s42256-023-00723-4); [preprint](https://arxiv.org/html/2212.06141).

- **Year / venue / type:** 2023 / Nature Machine Intelligence / hardware demonstration.
- **System and scale:** Single-/multiple-layer diffractive PNNs and interferometer networks; image classification. Numerical and experimental validations must be distinguished.
- **E1–E5:** E1-like systematic phase/component errors and deployment misalignment; combined systematic-error configurations. Misalignment is not automatically temperature drift; no E4 campaign.
- **Mitigation:** Systematic-error prediction networks jointly adapted with task parameters, improving surrogate gradients beyond a fixed PAT model.
- **Key quantitative results:** In the preprint's multiple-layer diffractive comparison, a **1 cm axial shift** gives **25.5%** accuracy on direct deployment versus **66.9%** with PAT; baseline error-free accuracy is **98.6%**. Each error-prediction module has **26,800** parameters versus **7,765,442** for the compared UNet (results section).
- **Relevance to Un-0:** **High** — a fixed clean Kuramoto surrogate may need adaptation when chip dynamics change substantially.
- **Read status:** **partial** — preprint results/methods and published abstract; numerical values above explicitly refer to the preprint comparison.

### 4. Momeni et al. — Physical local learning

**Citation:** Ali Momeni, Babak Rahmani, Matthieu Malléjac, Philipp del Hougne, and Romain Fleury. “Backpropagation-free training of deep physical neural networks.” *Science* **382**, 1297–1303 (2023). [Publication](https://doi.org/10.1126/science.adi8474); [preprint](https://arxiv.org/abs/2304.11042).

- **Year / venue / type:** 2023 / Science / hardware demonstration.
- **System and scale:** Acoustic and microwave wave-processing systems; optical model also studied. Physical transformations interleaved with trainable digital operations.
- **E1–E5:** Unknown transfer functions and perturbation-induced model mismatch; E1-like static errors and E3-like changes of operating conditions, rather than a calibrated thermal-aging study.
- **Mitigation:** Physical local learning (PhyLL), using contrastive local forward evaluations rather than a differentiable model of every physical layer.
- **Key quantitative results:** The June 2023 preprint reports **95.76%** vowel test accuracy for its acoustic example and **97.21%** MNIST test accuracy for its two-layer optical example. These are **preprint results**, not independently verified final-paper hardware numbers for the optical platform.
- **Relevance to Un-0:** **Medium** — alternative when gradients through real oscillators are inaccurate; requires an architecture/training change.
- **Read status:** **partial** — preprint results and perturbation discussion; final publication abstract. Optical experimental status is not inferred from preprint wording.

### 5. Pai et al. — Measured photonic backpropagation

**Citation:** Sunil Pai, Zhanghao Sun, Tyler W. Hughes, Taewon Park, Ben Bartlett, Ian A. D. Williamson, Momchil Minkov, Maziyar Milanizadeh, Nathnael Abebe, Francesco Morichetti, Andrea Melloni, Shanhui Fan, Olav Solgaard, and David A. B. Miller. “Experimentally realized in situ backpropagation for deep learning in photonic neural networks.” *Science* **380**, 398–404 (2023). [Publication](https://doi.org/10.1126/science.ade8450); [author PDF](https://bencbartlett.com/assets/pdf/science.ade8450.pdf).

- **Year / venue / type:** 2023 / Science / hardware demonstration.
- **System and scale:** **Three-layer, four-port** silicon photonic network; **64-port** MNIST networks assessed in simulation.
- **E1–E5:** E1 component/phase errors and measurement limitations analogous to E5; no full E1–E5 isolation.
- **Mitigation:** Interfere forward and backward optical fields to measure gradients; calibrated phase-voltage maps for generation/readout.
- **Key quantitative results:** Experimental test accuracy **above 94%**, comparable with digital simulations (abstract); larger-scale error studies are numerical, not fabricated 64-port training demonstrations.
- **Relevance to Un-0:** **Medium** — establishes physical gradient measurement, but optical reciprocity and accessible internal fields do not automatically hold for driven Kuramoto dynamics.
- **Read status:** **partial** — abstract and author-PDF architecture/calibration sections.

### 6. Hughes et al. — Adjoint-gradient precursor

**Citation:** Tyler W. Hughes, Momchil Minkov, Yu Shi, and Shanhui Fan. “Training of photonic neural networks through in situ backpropagation and gradient measurement.” *Optica* **5**, 864–871 (2018). [Author PDF](https://momchilmm.github.io/publications/Hughes_Optica_2018.pdf); [preprint record](https://arxiv.org/abs/1805.09943).

- **Year / venue / type:** 2018 / Optica / simulation.
- **System and scale:** Interferometer mesh; gradient-field example with **three MZIs** and a classifier with **two 3 × 3** unitary optical units.
- **E1–E5:** Motivated by model inaccuracies corresponding to E1; not a measured fabrication/noise/fault tolerance campaign.
- **Mitigation:** Adjoint/time-reversal construction obtains gradients from in-device intensity measurements; avoids finite-difference probing of every parameter.
- **Key quantitative results:** Numerically learns XOR from **four training examples**; validates local gradient recovery against the adjoint calculation. No physical-chip yield or noise threshold reported in the inspected sections.
- **Relevance to Un-0:** **Medium** — important backward citation from physical backpropagation, with substrate assumptions that must be checked before transfer.
- **Read status:** **partial** — PDF derivation, gradient validation, and XOR demonstration.

### 7. Manneschi et al. — NADO and stochastic digital twins

**Citation:** Luca Manneschi, Ian T. Vidamour, Kilian D. Stenning, Charles Swindells, Guru Venkat, David Griffin, Lai Gui, Daanish Sonawala, Denis Donskikh, Dana Hariga, Elisa Donati, Susan Stepney, Will R. Branford, Jack C. Gartside, Thomas J. Hayward, Matthew O. A. Ellis, and Eleni Vasilaki. “Noise-aware training of neuromorphic dynamic device networks.” *Nature Communications* **16**, 9192 (2025). [Publication](https://doi.org/10.1038/s41467-025-64232-1); [preprint HTML](https://arxiv.org/html/2401.07387).

- **Year / venue / type:** 2025 / Nature Communications / hardware demonstration.
- **System and scale:** Nanoring arrays and artificial spin-vortex ice; logical multilayer networks constructed by serial measurements of **one device per class**.
- **E1–E5:** E2 colored stochastic dynamics and E5 measurement variability; sim-to-real mismatch. **Device-to-device E1 variability explicitly not directly tested.**
- **Mitigation:** Neural-SDE twins, BPTT, noise-aware connectivity optimization, layerwise physical corrective data for regression.
- **Key quantitative results:** MNIST transfer tested on **1,000 unseen samples**, averaged over **three runs**. Published discussion reports **2.2 × 10⁻³ MSE** for physical three-hidden-layer, five-step Mackey–Glass prediction versus **1 × 10⁻³** for simulated noiseless leaky integrators using the same cascade method.
- **Relevance to Un-0:** **High** — directly relevant to learned stochastic oscillator dynamics; does not establish many-chip yield.
- **Read status:** **partial** — published discussion/methods and preprint results; final author list verified.

### 8. Xu et al. — Sharpness-aware robustness and transfer

**Citation:** Tengji Xu, Zeyu Luo, Shaojie Liu, Li Fan, Qiarong Xiao, Benshan Wang, Dongliang Wang, and Chaoran Huang. “Physical neural networks using sharpness-aware training.” *Nature Communications* **17**, 1766 (2026). [Publication](https://doi.org/10.1038/s41467-026-68470-9); [earlier preprint](https://arxiv.org/html/2411.12352).

- **Year / venue / type:** 2026 / Nature Communications / hardware demonstration.
- **System and scale:** **4 × 4 MRR** weight bank, free-space diffractive optics, and simulated MZI networks; classification and other tasks.
- **E1–E5:** E1 fabrication/model mismatch, E2 operational noise, E3 thermal drift; optical alignment errors as additional perturbations. No demonstrated E4 dead-oscillator/ECC study.
- **Mitigation:** Optimize low loss and low parameter sensitivity; compatible with offline and in-situ training and cross-device transfer.
- **Key quantitative results:** Published diffractive results: **98% versus 43%** MNIST accuracy at **1° rotation**, **97% versus 36%** at **one-pixel shift**, and **93% versus 12%** at **1.05 scaling**, SAT versus standard training. Published MRR results give **91% versus 52%** without temperature control, a **2°C** shift from characterization.
- **Relevance to Un-0:** **High** — strong comparator for noise-aware fine-tuning and chip-independent robust weights.
- **Read status:** **partial** — published result excerpts and preprint methods/results; version-specific numbers distinguished.

### 9. Sunada et al. — Noise-robust optimal-control learning

**Citation:** Satoshi Sunada, Tomoaki Niiyama, Kazutaka Kanno, Rin Nogami, André Röhm, Takato Awano, and Atsushi Uchida. “Blending Optimal Control and Biologically Plausible Learning for Noise-Robust Physical Neural Networks.” *Physical Review Letters* **134**, 017301 (2025). [Publication](https://doi.org/10.1103/PhysRevLett.134.017301); [arXiv record and supplement](https://arxiv.org/abs/2502.19053).

- **Year / venue / type:** 2025 / Physical Review Letters / hardware demonstration.
- **System and scale:** Continuous-time optoelectronic delay dynamics; virtual temporal nodes rather than a specified physical oscillator array.
- **E1–E5:** E2 dynamical noise and E5 measurement errors; reduced dependence on exact dynamics. No quantified E4 fault/yield study verified.
- **Mitigation:** Approximate optimal-control adjoints through direct feedback alignment; variants reduce required model knowledge.
- **Key quantitative results:** Supplement Table S1 gives simulated MNIST accuracy **0.973** for DFA–adjoint versus **0.869** for the uncontrolled ELM baseline; approximate nonlinear variants give **0.970, 0.967, and 0.906**. These are **simulation comparisons**, not experimental noise thresholds.
- **Relevance to Un-0:** **High** — continuous-time dynamics and noise-tolerant training closely match the computational setting.
- **Read status:** **partial** — published abstract and arXiv supplement; main-paper experimental numbers not independently extracted.

### 10. Liu et al. — Chip-in-the-loop programming

**Citation:** Shaojie Liu, Tengji Xu, Benshan Wang, Dongliang Wang, Qiarong Xiao, Li Fan, and Chaoran Huang. “Calibration-free and precise programming of large-scale ring resonator circuits.” *Optica* **12**, 1113–1121 (2025). [Publication](https://doi.org/10.1364/OPTICA.557415); [earlier preprint, different title/author list](https://arxiv.org/html/2410.22064).

- **Year / venue / type:** 2025 / Optica / hardware demonstration.
- **System and scale:** **16 MRRs** in a **4 × 4** bank experimentally; **16 × 16** circuits in simulation.
- **E1–E5:** E1 fabrication variations, E3 temperature shifts, thermal crosstalk, and operational measurement variability. No E4 fault correction.
- **Mitigation:** Measured weight error plus approximate gradients; one-device characterization replaces exhaustive coupled lookup tables. “Calibration-free” still allows initial characterization and alignment.
- **Key quantitative results:** **9.1-bit precision × 16 weights**, roughly **10 iterations**, **4°C** temperature robustness (Table 1). A two-weight example improves **5.4 to 9.4 bits**. Claimed **O(1)** concerns pre-calibration, not total measurements or execution time.
- **Relevance to Un-0:** **High** — concrete comparator for trimming effective omega/K/K_drive before task-specific retraining.
- **Read status:** **partial** — published methods/results/Table 1 and preprint calibration sections.

### 11. Schmitt et al. — Early BrainScaleS hardware-in-the-loop

**Citation:** Sebastian Schmitt, Johann Klaehn, Guillaume Bellec, Andreas Grübl, Maurice Güttler, Andreas Hartel, Stephan Hartmann, Dan Husmann, Kai Husmann, Vitali Karasenko, Mitja Kleider, Christoph Koke, Christian Mauch, Eric Müller, Paul Müller, Johannes Partzsch, Mihai A. Petrovici, Stefan Schiefer, Stefan Scholze, Bernhard Vogginger, Robert Legenstein, Wolfgang Maass, Christian Mayr, Johannes Schemmel, and Karlheinz Meier. “Neuromorphic Hardware In The Loop: Training a Deep Spiking Network on the BrainScaleS Wafer-Scale System.” *IJCNN* (2017). [DOI](https://doi.org/10.1109/IJCNN.2017.7966125); [paper](https://arxiv.org/abs/1703.01909).

- **Year / venue / type:** 2017 / IJCNN / hardware demonstration.
- **System and scale:** BrainScaleS-1; **100–15–15–5** logical architecture, reduced MNIST task; **10,000×** biological-time acceleration.
- **E1–E5:** E1 analog substrate variability and mapping distortions; not independent E2–E5 sweeps.
- **Mitigation:** Software pretraining, then physical firing-rate measurements and approximate backpropagation updates.
- **Key quantitative results:** Across **130** neuron selections/initializations, transfer gives **72% (+12/−10 IQR)** accuracy, improving to **95% (+1/−2 IQR)**; software reaches **97%** (Results/Fig. 9).
- **Relevance to Un-0:** **High** — early direct precedent for recovering transferred performance; 130 mappings are not 130 independently fabricated chips.
- **Read status:** **partial** — arXiv PDF architecture and results; publication metadata verified.

### 12. Cramer et al. — Surrogate gradients and self-calibration

**Citation:** Benjamin Cramer, Sebastian Billaudelle, Simeon Kanya, Aron Leibfried, Andreas Grübl, Vitali Karasenko, Christian Pehle, Korbinian Schreiber, Yannik Stradmann, Johannes Weis, Johannes Schemmel, and Friedemann Zenke. “Surrogate gradients for analog neuromorphic computing.” *PNAS* **119**(4), e2109194119 (2022). [Publication](https://doi.org/10.1073/pnas.2109194119); [paper](https://arxiv.org/abs/2006.07239).

- **Year / venue / type:** 2022 / PNAS / hardware demonstration.
- **System and scale:** BrainScaleS-2, **512 physical neurons**, **6-bit** synapses; MNIST **256–246–10** network and recurrent speech classifiers.
- **E1–E5:** E1 deliberate decalibration/device mismatch; physical variability and digitized-state limitations related to E2/E5. No complete fault/yield study.
- **Mitigation:** Inject recorded membrane traces and spikes into the differentiable computation graph; hardware-in-the-loop BPTT and regularization.
- **Key quantitative results:** **97.6 ± 0.1%** MNIST with dropout/rotation. Published Fig. 4 reports learning hardly affected by artificial parameter decalibration up to **σd = 30%**. **1.7 μs** membrane sampling for **256** neurons; approximately **85,000 classifications/s** (MNIST).
- **Relevance to Un-0:** **High** — nearest recurrent-dynamics precedent for correcting the training graph using measured states.
- **Read status:** **partial** — PDF methods/tables and published full-text XML self-calibration results; final citation verified.

### 13. Göltz et al. — First-spike training under hardware distortions

**Citation:** Julian Göltz, Laura Kriener, Andreas Baumbach, Sebastian Billaudelle, Oliver Breitwieser, Benjamin Cramer, Dominik Dold, Akos Ferenc Kungl, Walter Senn, Johannes Schemmel, Karlheinz Meier, and Mihai Alexandru Petrovici. “Fast and energy-efficient neuromorphic deep learning with first-spike times.” *Nature Machine Intelligence* **3**, 823–835 (2021). [Publication](https://doi.org/10.1038/s42256-021-00388-x); [paper](https://arxiv.org/abs/1912.11443).

- **Year / venue / type:** 2021 / Nature Machine Intelligence / hardware demonstration.
- **System and scale:** BrainScaleS-2; **256–246–10** MNIST network, **16 × 16** inputs.
- **E1–E5:** E1 fixed-pattern variability; simulated timing jitter, spike loss, and limited parameter precision. Spike loss is E4-like, not proof of dead-neuron remapping.
- **Mitigation:** First-spike-time gradients using actual hardware spike times; calibration followed by in-the-loop adaptation.
- **Key quantitative results:** **96.9 ± 0.1%** MNIST accuracy, **48 μs / 8.4 μJ** per classification; residual calibrated parameter variability is on the order of **5%** (hardware/results sections).
- **Relevance to Un-0:** **Medium** — useful temporal-error and sparse-readout precedent, with different state encoding and task.
- **Read status:** **partial** — PDF hardware, benchmark, and distortion discussion.

### 14. Pehle et al. — BrainScaleS-2 calibration infrastructure

**Citation:** Christian Pehle, Sebastian Billaudelle, Benjamin Cramer, Jakob Kaiser, Korbinian Schreiber, Yannik Stradmann, Johannes Weis, Aron Leibfried, Eric Müller, and Johannes Schemmel. “The BrainScaleS-2 Accelerated Neuromorphic System With Hybrid Plasticity.” *Frontiers in Neuroscience* **16**, 795876 (2022). [Full text](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2022.795876/full).

- **Year / venue / type:** 2022 / Frontiers in Neuroscience / hardware demonstration.
- **System and scale:** **512 neurons**, **131,072 synapses**, embedded digital plasticity processors, parallel ADC access; analog neuron dynamics with digital routing and control.
- **E1–E5:** E1 controllability/calibration and E5 acquisition constraints; plasticity compensates operating variability. Not an isolated E1–E5 study.
- **Mitigation:** Per-neuron configuration, observable internal states, programmable feedback/plasticity, rapid reconfiguration for host-in-the-loop learning.
- **Key quantitative results:** **256** simultaneous membrane recordings at **1.7 μs** intervals. Reports **97.6 ± 0.1%** MNIST and **less than 7 μs** decision time for the cited surrogate-gradient application; those results overlap entry 12 and are not independent replications.
- **Relevance to Un-0:** **High** — shows that calibration observability and control interfaces are hardware design requirements.
- **Read status:** **partial** — architecture, acquisition, and learning sections of published full text.

### 15. Richter et al. — DYNAP-SE2 biasing and characterization

**Citation:** Ole Richter, Chenxi Wu, Adrian M. Whatley, German Köstinger, Carsten Nielsen, Ning Qiao, and Giacomo Indiveri. “DYNAP-SE2: a scalable multi-core dynamic neuromorphic asynchronous spiking neural network processor.” *Neuromorphic Computing and Engineering* **4**, 014003 (2024). [Publication](https://doi.org/10.1088/2634-4386/ad1cd7); [paper](https://arxiv.org/abs/2310.00564).

- **Year / venue / type:** 2024 / Neuromorphic Computing and Engineering / hardware demonstration.
- **System and scale:** **1,024 analog neurons**, **four cores**, **64 synapses/neuron**; **4-bit** configurable synaptic weights.
- **E1–E5:** E1 bias/current mismatch; E3 temperature sensitivity addressed at bias-generator design level. Internal analog monitoring supports characterization but is not an E5 denoising experiment.
- **Mitigation:** Temperature-aware reference-current circuitry; coarse/fine biases; lookup-table correction of bias-generator deviations; sADC internal-state access.
- **Key quantitative results:** **256 neurons/core** share configuration resources. Very small bias currents can require **several seconds** to settle; nominally equivalent coarse/fine settings can differ physically (bias-generator section).
- **Relevance to Un-0:** **High** — realistic constraints on independent parameter trimming, calibration time, and shared-control errors.
- **Read status:** **partial** — PDF architecture, bias-generator, and monitoring sections.

### 16. Çakal et al. — Offline DYNAP-SE2 hardware-aware training

**Citation:** Uğurcan Çakal, Maryada, Chenxi Wu, Ilkay Ulusoy, and Dylan R. Muir. “Gradient-descent hardware-aware training and deployment for mixed-signal neuromorphic processors.” *Neuromorphic Computing and Engineering* **4**, 014011 (2024). [Publication](https://doi.org/10.1088/2634-4386/ad2ec3); [paper HTML](https://arxiv.org/html/2303.12167v2).

- **Year / venue / type:** 2024 / Neuromorphic Computing and Engineering / hardware demonstration.
- **System and scale:** DYNAP-SE2; frozen-noise pattern recognition with **60 input channels** and **two** decision outputs.
- **E1–E5:** E1 neuron/synapse mismatch and weight quantization. Training-time parameter resampling represents chip variability, not necessarily continuous-time E2 jitter.
- **Mitigation:** Differentiable circuit-level behavioral model, parameter-noise injection, constrained mapping, and unsupervised weight quantization.
- **Key quantitative results:** Table 1 hardware firing-rate ratios are **9.0** and **>100** for the trained patterns; mean untrained ratio **1.9**. **1,000** untrained inputs tested in simulation versus **10** on hardware. Reconfiguration required **at least 5 min** per iteration in this setup.
- **Relevance to Un-0:** **High** — direct precedent for randomized-chip training followed by physical deployment; limited hardware sample size.
- **Read status:** **partial** — HTML mismatch method, deployment, Table 1, and limitations.

### 17. Maryada et al. — Cross-homeostatic chip-in-the-loop calibration

**Citation:** Maryada, Saray Soldado-Magraner, Martino Sorbaro, Rodrigo Laje, Dean V. Buonomano, and Giacomo Indiveri. “Stable recurrent dynamics in heterogeneous neuromorphic computing systems using excitatory and inhibitory plasticity.” *Nature Communications* **16**, 5522 (2025). [Publication](https://doi.org/10.1038/s41467-025-60697-2); [published PDF](https://d-nb.info/1375431064/34).

- **Year / venue / type:** 2025 / Nature Communications / hardware demonstration.
- **System and scale:** DYNAP-SE2; examples include **200-neuron** recurrent populations and multiple coexisting attractors.
- **E1–E5:** E1 heterogeneity/cross-chip variability and E2 activity noise. Multi-day operation is reported, but not a controlled E3 temperature/aging sweep.
- **Mitigation:** Host-computed cross-homeostatic excitatory/inhibitory weight updates; stochastic rounding; average repeated physical measurements.
- **Key quantitative results:** **57 initializations across two chips** in Fig. 2; reported convergence **100%** in tested settings. Each iteration uses **five repetitions of 1 s**, with training stopped after **400 iterations**; many runs converge before **200**.
- **Relevance to Un-0:** **High** — concrete multi-chip stability evidence and measured feedback calibration; no image generation or phase-copy code.
- **Read status:** **partial** — published PDF results, chip-in-the-loop method, and figure captions.

### 18. Costa et al. — Session recalibration and heterogeneous feature populations

**Citation:** Filippo Costa, Eline V. Schaft, Geertjan Huiskamp, Erik J. Aarnoutse, Maryse A. van’t Klooster, Niklaus Krayenbühl, Georgia Ramantani, Maeike Zijlmans, Giacomo Indiveri, and Johannes Sarnthein. “Robust compression and detection of epileptiform patterns in ECoG using a real-time spiking neural network hardware framework.” *Nature Communications* **15**, 3255 (2024). [Publication](https://doi.org/10.1038/s41467-024-47495-y); [full-text repository](https://pmc.ncbi.nlm.nih.gov/articles/PMC11021517/).

- **Year / venue / type:** 2024 / Nature Communications / hardware demonstration.
- **System and scale:** DYNAP-SE; repeated feedforward modules and **10-neuron** UP/DN accumulator populations; **40 neurons/channel** for the described analysis.
- **E1–E5:** E1 mismatch intentionally used for heterogeneous feature responses; session-to-session recalibration. No isolated E3 aging or E4 fault results.
- **Mitigation:** Evolutionary optimization of sparse temporal responses using a representative pattern; rerun calibration at each session; robust population representation.
- **Key quantitative results:** Parameter CV can reach **20%**; one-channel analysis uses **3.9% of 1,024 neurons**. One reported EEG-band recording achieves approximately **34× compression** after SNN encoding. These are application/scale results, not a measured 20% robustness threshold for Un-0.
- **Relevance to Un-0:** **Medium** — illustrates redundancy over heterogeneous learned features and practical recurring calibration.
- **Read status:** **partial** — published design-principles, calibration, and compression passages, including full-text XML; bibliographic record verified.

### 19. Rasch et al. — Systematic nonideality sensitivity and HWA training

**Citation:** Malte J. Rasch, Charles Mackin, Manuel Le Gallo, An Chen, Andrea Fasoli, Frédéric Odermatt, Ning Li, S. R. Nandakumar, Pritish Narayanan, Hsinyu Tsai, Geoffrey W. Burr, Abu Sebastian, and Vijay Narayanan. “Hardware-aware training for large-scale and diverse deep learning inference workloads using in-memory computing-based accelerators.” *Nature Communications* **14**, 5282 (2023). [Publication](https://doi.org/10.1038/s41467-023-40770-4); [paper](https://arxiv.org/abs/2302.08469).

- **Year / venue / type:** 2023 / Nature Communications / simulation.
- **System and scale:** Measured-PCM-calibrated crossbar models; **11 workloads**, **0.3–108 million parameters**, CNNs/RNNs/transformers.
- **E1–E5:** E1 programming/fixed variations; E2 stochastic operational effects; E3 conductance drift; E4 failed-zero/stuck cells; E5 read/ADC effects. PCM drift is not necessarily spatially common drift.
- **Mitigation:** Hardware-aware retraining with realistic nonidealities, drift compensation, clipping/scaling, and sensitivity analysis.
- **Key quantitative results:** Preprint reports **5/11** workloads within **1% of floating-point reference** after **≥1 h** drift. Fault sensitivity includes failed-zero probability up to **1.7%**, stuck-maximum **0.1%**, and stuck-random **0.2%** (tables).
- **Relevance to Un-0:** **High** — strong precedent for error-by-error sweeps and combined realistic models; different compute substrate.
- **Read status:** **partial** — PDF benchmark, model, and sensitivity tables; final metadata verified.

### 20. Joshi et al. — Noise-aware transfer and drift compensation

**Citation:** Vinay Joshi, Manuel Le Gallo, Simon Haefeli, Irem Boybat, S. R. Nandakumar, Christophe Piveteau, Martino Dazzi, Bipin Rajendran, Abu Sebastian, and Evangelos Eleftheriou. “Accurate deep neural network inference using computational phase-change memory.” *Nature Communications* **11**, 2473 (2020). [Publication](https://doi.org/10.1038/s41467-020-16108-9); [paper](https://arxiv.org/abs/1906.03138).

- **Year / venue / type:** 2020 / Nature Communications / hardware demonstration.
- **System and scale:** ResNet-32, **361,722 weights**, **two PCM devices/weight** in a hardware/software experiment; other computation remains software.
- **E1–E5:** E1 write variability, E2/E5 conductance/read fluctuations, E3 drift; imperfect yield acknowledged, not a complete fault-remapping campaign.
- **Mitigation:** Characterization-based training noise; global drift scaling; periodic batch-normalization recalibration.
- **Key quantitative results:** Hardware **93.75%** CIFAR-10 after programming; **>92.6%** over **one day** with global drift compensation, improved to approximately **93.5%** with activation recalibration. Without compensation, accuracy falls toward **10% in ~1,000 s** (hardware results).
- **Relevance to Un-0:** **High** — strong precedent for separating noise-aware training from post-deployment reference/gain correction.
- **Read status:** **partial** — published training and hardware drift sections. Differential device pairs are not RAID/ECC copies.

### 21. Davies et al. — Loihi platform boundary

**Citation:** Mike Davies, Narayan Srinivasa, Tsung-Han Lin, Gautham Chinya, Yongqiang Cao, Sri Harsha Choday, Georgios Dimou, Prasad Joshi, Nabil Imam, Shweta Jain, Yuyun Liao, Chit-Kwan Lin, Andrew Lines, Ruokun Liu, Deepak Mathaikutty, Steve McCoy, Arnab Paul, Jonathan Tse, Guruguhanathan Venkataramanan, Yi-Hsin Weng, Andreas Wild, Yoonseok Yang, and Hong Wang. “Loihi: A Neuromorphic Manycore Processor with On-Chip Learning.” *IEEE Micro* **38**(1), 82–99 (2018). [Publication](https://doi.org/10.1109/MM.2018.112130359); [paper PDF](https://redwood.berkeley.edu/wp-content/uploads/2021/08/Davies2018.pdf).

- **Year / venue / type:** 2018 / IEEE Micro / hardware demonstration.
- **System and scale:** **128 neuromorphic cores**, up to **1,024 compartments/core**, **14 nm**, **60 mm²**.
- **E1–E5:** **No analog mismatch calibration evidence:** Loihi is fully digital despite its neuromorphic algorithms and asynchronous communication.
- **Mitigation:** Programmable local digital learning; numerical precision/routing constraints, rather than trimming analog neuron transfer functions.
- **Key quantitative results:** LASSO example reports **>1,000× energy-delay-product improvement** over an iso-process/voltage/area CPU comparison; not an analog robustness result.
- **Relevance to Un-0:** **Low** — useful exclusion boundary for “analog Loihi-like” claims.
- **Read status:** **partial** — PDF digital-neuron model, architecture, and abstract.

### 22. Romera et al. — Learning frequencies of coupled physical oscillators

**Citation:** Miguel Romera, Philippe Talatchian, Sumito Tsunegi, Flavio Abreu Araujo, Vincent Cros, Paolo Bortolotti, Juan Trastoy, Kay Yakushiji, Akio Fukushima, Hitoshi Kubota, Shinji Yuasa, Maxence Ernoult, Damir Vodenicarevic, Tifenn Hirtzlin, Nicolas Locatelli, Damien Querlioz, and Julie Grollier. “Vowel recognition with four coupled spin-torque nano-oscillators.” *Nature* **563**, 230–234 (2018). [Publication](https://doi.org/10.1038/s41586-018-0632-y); [paper](https://arxiv.org/abs/1711.02704).

- **Year / venue / type:** 2018 / Nature / hardware demonstration.
- **System and scale:** **Four coupled** spin-torque oscillators; **seven vowels**, **37 female speakers** in the described dataset.
- **E1–E5:** E1 natural-frequency variation and physical noise; noiseless simulations with **2% frequency mismatch**. Not five separately controlled error classes.
- **Mitigation:** Real-time supervised current updates tune natural frequencies and synchronization regions.
- **Key quantitative results:** Representative training converges after **48 steps**; published supplementary demonstration shows **89% training recognition**. This figure is explicitly training-set recognition, not held-out image-generation quality.
- **Relevance to Un-0:** **High** — direct coupled-oscillator calibration/training prior art, though spin-torque amplitude/phase dynamics differ from the Un-0 model.
- **Read status:** **partial** — PDF learning/simulation sections and published supplementary description.

### 23. Qiao et al. — ROLLS and circuit-level mismatch reduction

**Citation:** Ning Qiao, Hesham Mostafa, Federico Corradi, Marc Osswald, Fabio Stefanini, Dora Sumislawska, and Giacomo Indiveri. “A reconfigurable on-line learning spiking neuromorphic processor comprising 256 neurons and 128K synapses.” *Frontiers in Neuroscience* **9**, 141 (2015). [Full text](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2015.00141/full).

- **Year / venue / type:** 2015 / Frontiers in Neuroscience / hardware demonstration.
- **System and scale:** ROLLS: **256 neurons**, **64K plastic plus 64K programmable synapses**, **180 nm CMOS**.
- **E1–E5:** E1 transistor mismatch and analog variability; stochastic synaptic operation. No quantified E3/E4/E5 campaign.
- **Mitigation:** Larger critical soma transistors, configurable biases, bistable spike-based learning, homeostatic scaling, and attractor architectures; not merely software post-calibration.
- **Key quantitative results:** **51.4 mm²**, approximately **4 mW** for typical attractor-network experiments. Hardware population response variation is measured in Fig. 5; a numerical improvement factor from transistor sizing was not verified.
- **Relevance to Un-0:** **Medium** — shows early mitigation through circuit design and population dynamics, against which calibration/redundancy costs should be compared.
- **Read status:** **partial** — published PDF architecture, mismatch, and learning-circuit sections.

### 24. Krause et al. — Robust coupled oscillators on DYNAP-SE

**Citation:** Renate Krause, Joanne J. A. van Bavel, Chenxi Wu, Marc A. Vos, Alain Nogaret, and Giacomo Indiveri. “Robust neuromorphic coupled oscillators for adaptive pacemakers.” *Scientific Reports* **11**, 18073 (2021). [Publication](https://doi.org/10.1038/s41598-021-97314-3); [paper](https://arxiv.org/abs/2104.01638).

- **Year / venue / type:** 2021 / Scientific Reports / hardware demonstration.
- **System and scale:** **Three coupled neuronal oscillators**, each using excitatory/inhibitory populations on DYNAP-SE; hardware core has **256 neurons**.
- **E1–E5:** E1 mismatch and E2 intrinsic activity noise; respiratory-input drift robustness is not on-chip common E3 drift.
- **Mitigation:** Average population activity; iterative chip-in-the-loop tuning; fit a per-oscillator input-current/period mapping and set coupling-dependent phase delays.
- **Key quantitative results:** Measured synaptic constants **30 ± 4 ms**; calibrated oscillation periods **200–700 ms**. Target phase-delay intervals **15, 110, 430 ms** produce **17 ± 0.3, 108 ± 3, 431 ± 3 ms** in the published results.
- **Relevance to Un-0:** **High** — combines oscillator frequency/phase calibration with redundant population encoding; different from circular-mean copies of a learned image generator.
- **Read status:** **partial** — PDF population/tuning sections and published numerical-result passages.

### 25. Zendrikov et al. — Measured population-averaging trade-offs

**Citation:** Dmitrii Zendrikov, Sergio Solinas, and Giacomo Indiveri. “Brain-inspired methods for achieving robust computation in heterogeneous mixed-signal neuromorphic processing systems.” *Neuromorphic Computing and Engineering* **3**, 034002 (2023). [Publication](https://doi.org/10.1088/2634-4386/ace64c); [published PDF](https://iris.uniss.it/retrieve/89b28310-9d50-4ccd-b9cc-ff5bff9d7c78/Zendrikov_2023_Neuromorph._Comput._Eng._3_034002.pdf); [preprint](https://doi.org/10.1101/2022.10.26.513846).

- **Year / venue / type:** 2023 / Neuromorphic Computing and Engineering / hardware demonstration.
- **System and scale:** DYNAP-SE population codes, recurrent computational primitives; averaging study uses **256 neurons** partitioned into different cluster sizes.
- **E1–E5:** E1 heterogeneous response mismatch and E2 irregular spiking; time-window readout precision relates to E5. No shared-drift or fault-code benchmark.
- **Mitigation:** Spatial and temporal averaging, population codes, selective amplification, signal restoration, and attractor computation.
- **Key quantitative results:** Section 3.1 drives neurons with **200 Hz** input for approximately **50 Hz** output; cluster sizes **1–128**, **ten** regroupings/configuration, integration windows **20 ms–5 s**. Authors report approximately **8-bit equivalent precision** with **8–16 neurons** and **100–200 ms** integration.
- **Relevance to Un-0:** **High** — explicit redundancy/precision prior art; independence and state geometry must be rechecked for circular phase averaging.
- **Read status:** **partial** — indexed published Section 3.1 and abstract; direct PDF fetch blocked. Precision definition/plots not independently rederived.

## Gaps / open questions noted by the literature

1. **Novelty must be specific.** Physical forward-pass training, approximate gradients, noise injection, reference-based drift correction, and spatial/temporal redundancy are established (1, 10–12, 16–20, 24–25). The retained works do not demonstrate RAID-style circular-mean oscillator copies or an analog error-correcting code protecting a class-conditional Kuramoto image generator. This is a bounded finding, not a claim that no such paper or patent exists.

2. **Per-device adaptation and population yield answer different questions.** PAT and BrainScaleS results show that a device can learn around its imperfections (1, 11–13). Sharpness-aware training explicitly addresses transfer and deployment perturbations (8). Neither single-device recovery nor many random initializations establishes manufacturing yield. Schmitt's 130 mappings, Maryada's 57 initializations on two chips, and Çakal's ten hardware test inputs should retain their denominators.

3. **Stochastic dynamics are not fixed chip mismatch.** NADO learns colored stochastic dynamics and measurement variability, but its published discussion explicitly says device-to-device variability was not directly considered because one physical device per class was repeatedly sampled (7). Un-0's E1 should remain fixed within a simulated chip; E2 should vary during integration. Resampling E1 at each integration step would test a different model.

4. **Averaging gains depend on correlation and representation.** Zendrikov's population experiment assumes sufficiently uncorrelated mismatch (25); Krause averages population spike activity (24). Neither proves the same gain for coupled oscillator copies sharing fabrication offsets, supply/temperature noise, or a decoder. The open Un-0 question is whether circular averaging remains effective after coupled nonlinear dynamics, and how copy disagreement should be detected. This application-specific inference follows from, but is not answered by, those papers.

5. **Readout and observability can dominate calibration cost.** BrainScaleS needs parallel ADCs and state recording for its training graph (12–14); photonic backpropagation needs bidirectional access and internal monitors (5–6). NADO discusses low experimental throughput and external actuation/readout overhead (7). For Un-0, the useful question is whether final phases suffice, or intermediate phase trajectories are needed to identify omega/K/K_drive errors. Report measurement and retraining costs alongside redundancy overhead.

6. **Drift types should not be conflated.** PCM conductance drift has heterogeneous, state-dependent components (19–20); photonic drift involves resonances and crosstalk (8, 10); drift of a measured respiratory input is not hardware aging (24). A single shared offset is a justified E3 ablation, but these sources do not establish that it captures every physically important drift mode. Robustness to one does not imply robustness to the others.

7. **Faults are less developed in this training subset.** Rasch includes stuck/failed device models (19); Göltz studies spike loss (13). Neither establishes spare-oscillator remapping or learned phase/feature ECC. Fixed fabrication mismatch, missing events, permanently dead oscillators, and broken couplings should be separately identified. A dedicated coding/fault-tolerance search is needed before making a broad ECC novelty claim.

8. **Most reported tasks allow more error than generative reconstruction.** Classification dominates the retained demonstrations. NADO explicitly notes that regression requires accurate continuous outputs and suffers more from depth-dependent mismatch (7). Its cascade correction is especially relevant to a generator decoded after several integration steps. None of the retained results supplies an Un-0 FID/DINO degradation threshold or a noise tolerance transferable as a numerical constant.

9. **Compensation baselines are essential to interpreting redundancy.** Literature-backed alternatives are one-time device calibration (10, 15, 24), task-specific chip-in-the-loop fine-tuning (1, 11–13), deployment-independent noise-aware training (16, 19–20), flat-minimum training (8), and periodic reference/activation correction (20). The unresolved comparison is which gives the best quality/yield per measurement, device, energy, and calibration interval. This is a review implication; no experiments were run here.

10. **Search coverage and limits.** Live searches included arXiv, Nature/Science, Optica, Frontiers, IOP/IEEE-indexed records, Scholar-style title/citation queries, NeurIPS/OpenReview, and DATE/ISSCC/IEDM/VLSI calibration terms. Backward trails included the 2024/2025 training review and the Wright/Pai/Hughes chain; forward trails included DAT, NADO, and SAT. Searches also reached the [Cornell Stein thesis (2024)](https://mcmahon.aep.cornell.edu/theses/2024_Stein.pdf), [NTT's PAT announcement](https://ntt-research.com/community/ntt-research-and-cornell-scientists-introduce-deep-physical-neural-networks/), and [PAT patent application US20240193414A1](https://patents.google.com/patent/US20240193414A1/en). These overlapping/supporting records are not counted as independent experimental entries; the patent was screened, not assessed legally. Broad conference queries did not yield additional sufficiently verified close works for inclusion. This is not a complete export of all database results or a PRISMA-complete review.

11. **Access/version limitations.** All entries are marked partial because targeted methods/results were read, rather than every page and supplement. Publisher blocks were worked around with author PDFs, arXiv, or indexed paper passages where available. Quantitative results taken only from preprints are identified explicitly. In particular, the Science PhyLL optical example should not be promoted to a final-paper physical demonstration without checking the version of record. A verified 2026 lead, [Sun et al., “Digital twin optical computing system,” Opto-Electronic Advances 9, 250254](https://doi.org/10.29026/oea.2026.250254), was not retained as an entry because the primary full text/abstract could not be accessed; press-release accuracy and timing claims were not substituted for paper evidence.

12. **What remains unverified.** No direct primary-paper match was established for the complete requested combination: Un-0-like learned omega/K/K_drive, approximately ten integration steps, isolated E1–E5 plus their fixes, random combined-error chips with yield statistics, and circular-mean/ECC feature redundancy before/after noise-aware fine-tuning. The evidence supports testing that precise combination while acknowledging extensive prior art for its individual parts.
