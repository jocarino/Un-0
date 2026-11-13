# Analog in-memory computing non-idealities and hardware-aware training

Search date: 2026-11-13; topic: `aimc-hwa-training`; search window: 2015–2026, with emphasis on 2022–2026.
Hardware-aware (HWA) training, calibrated device-noise injection, and drift compensation are established AIMC methods; their application alone would not constitute a new mitigation principle.
The verified 2023 seed compares eleven workloads and explicitly reports architectures for which HWA training does not reach its iso-accuracy target [1].
Programming errors, time-varying device noise, converter errors, and drift must be distinguished; a single Gaussian weight perturbation does not capture all of them [1, 2, 4].
Global drift compensation removes a common gain change, while adaptive normalization or more local calibration addresses residual distribution changes [2, 12, 22].
Redundant devices and repeated computation already improve analog precision; independence and the energy/area cost are central qualifications [5, 6].
Training at one noise level can generalize poorly to other levels; variance-aware training addresses this, but can sacrifice peak accuracy [9].
Recent evidence extends to billion-parameter language models and real chips with different optimal training-noise levels [10, 20].
The oscillator seed arXiv:1808.08412 is genuine, but concerns classification and phase-noise tolerance, rather than PCM/RRAM or image generation [7].
No work in this retained corpus demonstrates the complete Un-0 proposal: coupled-oscillator image generation, circular-mean copy redundancy, E1–E5 combinations, and chip-yield distributions.
This is a bounded literature finding, not proof of worldwide absence; the most defensible potential contribution is the particular dynamics, mitigation placement, and joint-error/yield evaluation.

Scope and interpretation: E1–E5 follow `notes/hardware-error-catalog.md`. For crossbars, E1 denotes the analogous persistent programming/manufacturing error; E2 denotes time-varying computational noise, not necessarily white phase diffusion; E3 includes common drift **and** device-dependent residual drift, which is broader than Un-0's shared-offset example. Crossbar ADC/read noise is marked E5 (proxy) because it often occurs inside every layer, whereas the catalog's E5 is terminal phase measurement. An E-label is an analogy, not evidence that the same stochastic process was tested. Read status **partial** means abstract plus selected main-text/results/methods passages or PDF pages, without a complete supplement audit; **abstract-only** means no substantive body was read. No entry is claimed as fully read.

Search coverage: live searches included arXiv, Nature-family journals, Frontiers, NeurIPS proceedings, IEEE/IEEE Xplore-targeted queries, DATE/ISSCC/IEDM/VLSI terms, institutional theses, IBM material, and patents. Backward trails included the 2023 HWA paper's prior noise-training work and AIHWKit, and the redundant-computation seed's multi-memristive antecedent. Forward trails included AnalogNAS, Analog Foundation Models, post-training calibration, variance-aware training, and the November 2026 retraining-free preprint. The 2026 precision review supplied a further ECC trail. Search hits without confirmed primary metadata/results were excluded; a search of a venue is not a claim of exhaustive coverage. A 2025 MIT thesis and IBM blog were screened but not retained as additional independent results. All three supplied seeds checked out. Reference numbers below identify works, not independent experimental replications.

## Entries

### 1. Broad hardware-aware retraining benchmark — verified Nature Communications seed

**Citation:** Malte J. Rasch, Charles Mackin, Manuel Le Gallo, An Chen, Andrea Fasoli, Frédéric Odermatt, Ning Li, S. R. Nandakumar, Pritish Narayanan, Hsinyu Tsai, Geoffrey W. Burr, Abu Sebastian, and Vijay Narayanan. “Hardware-aware training for large-scale and diverse deep learning inference workloads using in-memory computing-based accelerators.” *Nature Communications* **14**, 5282 (2023). [Paper](https://www.nature.com/articles/s41467-023-40770-4); [open text](https://pmc.ncbi.nlm.nih.gov/articles/PMC10469175/).

- **Year / venue / type:** 2023 / Nature Communications / simulation.
- **System and scale:** PCM-calibrated crossbar model; 11 CNN, recurrent, and transformer workloads.
- **E1–E5:** E1, E2, E3, E5 proxy; not a failure-map/E4 study.
- **Mitigation:** HWA retraining with realistic forward-path nonidealities, noise ramping, learned signal scales, and drift compensation.
- **Quantitative results:** 5/11 workloads meet the authors' iso-accuracy criterion (within 1% of FP reference) after at least 1 h drift; inference repeated 15–25 times per training trial.
- **Limits:** Input/output noise is especially damaging; generic weight-noise training and extensive retraining do not solve every architecture.
- **Un-0 relevance:** **High** — strong precedent for isolated-error sensitivity and combined nonideality evaluation; no oscillator-state integration.
- **Read status:** **partial** — abstract, model, training, results, and evaluation passages.

### 2. PCM noise-aware inference with global drift compensation and AdaBS

**Citation:** Vinay Joshi, Manuel Le Gallo, Simon Haefeli, Irem Boybat, S. R. Nandakumar, Christophe Piveteau, Martino Dazzi, Bipin Rajendran, Abu Sebastian, and Evangelos Eleftheriou. “Accurate deep neural network inference using computational phase-change memory.” *Nature Communications* **11**, 2473 (2020). [Paper](https://www.nature.com/articles/s41467-020-16108-9); [arXiv](https://arxiv.org/abs/1906.03138).

- **Year / venue / type:** 2020 / Nature Communications / hardware demonstration.
- **System and scale:** ResNet-32, 361,722 weights, two PCM devices per weight; ImageNet also evaluated in simulation.
- **E1–E5:** E1 programming error, E2 conductance/read fluctuations, E3 drift, E5 proxy. Defective devices are discussed, not a separate E4 robustness benchmark.
- **Mitigation:** Noise injection during software training; global drift compensation (GDC); adaptive batch-normalization statistics update (AdaBS).
- **Quantitative results:** CIFAR-10 hardware accuracy 93.7%, retained above 93.5% over one day; simulated ImageNet top-1 71.6%.
- **Limits:** GDC restores mean scale but not all activation-distribution changes; AdaBS requires calibration data and computation.
- **Un-0 relevance:** **High** — direct precedent for reference-based drift correction plus training; normalization recovery is not automatically available for oscillator phases.
- **Read status:** **partial** — abstract, noise-training and drift-compensation passages.

### 3. Optimizing redundant conductance encodings rather than merely adding copies

**Citation:** Charles Mackin, Malte J. Rasch, An Chen, Jonathan Timcheck, Robert L. Bruce, Ning Li, Pritish Narayanan, Stefano Ambrogio, Manuel Le Gallo, S. R. Nandakumar, Andrea Fasoli, Jose Luquin, Alexander Friz, Abu Sebastian, Hsinyu Tsai, and Geoffrey W. Burr. “Optimised weight programming for analogue memory-based deep neural networks.” *Nature Communications* **13**, 3765 (2022). [Paper](https://www.nature.com/articles/s41467-022-31405-1); [open text](https://pmc.ncbi.nlm.nih.gov/articles/PMC9247051/).

- **Year / venue / type:** 2022 / Nature Communications / simulation.
- **System and scale:** PCM weight encodings with most/least significant differential pairs (four conductances); CNNs, LSTMs, transformers.
- **E1–E5:** E1, E2, E3; occasional failures motivate redundancy but no separate E4 yield result established here.
- **Mitigation:** Numerically optimized software-weight-to-conductance mappings, significance allocation, and drift compensation.
- **Quantitative results:** Illustrated optimized mapping reduces weight-error standard deviation approximately 39% immediately after programming and 17% at one month versus its naive counterpart.
- **Limits:** Naively filling the most significant pair and correcting with the least significant pair is suboptimal; drift compensation can amplify errors.
- **Un-0 relevance:** **High** — redundant representation and allocation already have prior art; learned-feature redundancy needs a dynamics-specific benefit.
- **Read status:** **partial** — encoding formulation and Fig. 2 explanation.

### 4. IBM AIHWKit simulator and separation of training/inference imperfections

**Citation:** Malte J. Rasch, Diego Moreda, Tayfun Gokmen, Manuel Le Gallo, Fabio Carta, Cindy Goldberg, Kaoutar El Maghraoui, Abu Sebastian, and Vijay Narayanan. “A Flexible and Fast PyTorch Toolkit for Simulating Training and Inference on Analog Crossbar Arrays.” *IEEE International Conference on Artificial Intelligence Circuits and Systems (AICAS)* (2021). [Paper PDF](https://confcats-event-sessions.s3.amazonaws.com/aicas21/papers/1033.pdf); [arXiv](https://arxiv.org/abs/2104.02184).

- **Year / venue / type:** 2021 / IEEE AICAS / simulation.
- **System and scale:** Configurable crossbar tiles/unit cells; VGG-8/CIFAR-10 timing example; PCM-calibrated programming/drift models.
- **E1–E5:** E1 device-to-device variation, E2 cycle/read noise, E3 decay/drift, E5 output-noise proxy.
- **Mitigation:** Configurable HWA forward passes, ideal backward/update options, multi-device cells, Tiki-Taka support, drift compensation.
- **Quantitative results:** Paper reports analog-training simulation commonly 2–5× slower than FP; example 60 s/epoch versus 15 s on a V100. These are software timings, not chip acceleration.
- **Limits:** Assumed simultaneous programming creates discrepancies with measured early drift below about 1,000 s.
- **Un-0 relevance:** **High** — precedent for sampled chip parameters versus transient noise and empirical calibration; crossbar models do not substitute for phase-dynamics models.
- **Read status:** **partial** — PDF architecture, timing, device-model, and inference sections.

### 5. Dynamic precision through redundant computation — verified arXiv seed

**Citation:** Sahaj Garg, Joe Lou, Anirudh Jain, and Mitchell Nahmias. “Dynamic Precision Analog Computing for Neural Networks.” *arXiv:2102.06365* (2021). [Abstract](https://arxiv.org/abs/2102.06365); [HTML](https://arxiv.org/html/2102.06365v1).

- **Year / venue / type:** 2021 / arXiv preprint / simulation.
- **System and scale:** Analog electronic/optical MVMs; ResNet-50 and BERT, with other vision networks.
- **E1–E5:** E2 thermal/shot noise and weight-noise models; E5-like noisy MVM outputs. Not an E3/E4 correction demonstration.
- **Mitigation:** Repeat operations in time or space and average; learn layer-specific precision/energy allocation without retraining network weights.
- **Quantitative results:** Abstract reports up to 89% vision and 24% NLP energy reduction; idealized optical simulations reach 2.7 aJ/MAC (ResNet-50) and 1.6 aJ/MAC (BERT), below 2% accuracy degradation.
- **Limits:** Optical energy excludes loss/data-movement/memory costs. Averaging requires appropriately independent errors; it does not remove a persistent shared bias.
- **Un-0 relevance:** **High** — explicit prior art for redundancy/averaging and selective allocation, but not circular averaging inside coupled dynamics.
- **Read status:** **partial** — abstract, noise/precision derivation, redundancy motivation, limitations.

### 6. Multi-memristive synapses and averaging of device variability

**Citation:** Irem Boybat, Manuel Le Gallo, S. R. Nandakumar, Timoleon Moraitis, Thomas Parnell, Tomas Tuma, Bipin Rajendran, Yusuf Leblebici, Abu Sebastian, and Evangelos Eleftheriou. “Neuromorphic computing with multi-memristive synapses.” *Nature Communications* **9**, 2514 (2018). [Paper](https://www.nature.com/articles/s41467-018-04933-y); [arXiv](https://arxiv.org/abs/1711.06507).

- **Year / venue / type:** 2018 / Nature Communications / hardware demonstration.
- **System and scale:** PCM synapses; experiments exceeding one million devices; characterization includes 1, 3, and 7 devices per synapse.
- **E1–E5:** E1 inter-device and E2 intra-device/update variability; nonlinear/asymmetric updates extend beyond the catalog.
- **Mitigation:** Sum multiple device conductances; global counter arbitrates individual updates and depression events.
- **Quantitative results:** At fixed effective range, minimum mean update decreases as 1/N and update standard deviation as 1/√N, improving update resolution by √N.
- **Limits:** Better fabrication uniformity cannot eliminate intrinsic cycle randomness; redundancy incurs device/selection overhead and does not establish common-mode cancellation.
- **Un-0 relevance:** **High** — strong antecedent for redundant analog learned quantities; the demonstrated sum is not a phase circular mean.
- **Read status:** **partial** — abstract and device/multi-device characterization.

### 7. Oscillator classification and phase-noise tolerance — verified bridge seed

**Citation:** Damir Vodenicarevic, Nicolas Locatelli, Julie Grollier, and Damien Querlioz. “Nano-oscillator-based classification with a machine learning-compatible architecture.” *Journal of Applied Physics* (2018), DOI 10.1063/1.5042359. [arXiv record](https://arxiv.org/abs/1808.08412); [PDF](https://arxiv.org/pdf/1808.08412); [publisher explainer confirming citation](https://www.aip.org/scilights/new-architecture-trains-a-nano-oscillator-classifier-with-standard-machine-learning-algorithms).

- **Year / venue / type:** 2018 / Journal of Applied Physics / simulation.
- **System and scale:** Six coupled oscillators; learned linear combinations of inputs determine natural frequencies; fixed coupling.
- **E1–E5:** E2 phase noise; no complete E1–E5 study.
- **Mitigation:** Offline backpropagation through oscillator-based computation; synchronization-based representation. Not RAID/ECC.
- **Quantitative results:** Extended architecture's Iris binary tasks achieve 100%, 98%, 100% versus reference 67%, 87%, 67%; 90 training and 60 test examples. These numbers are architecture comparisons, not measured noise-recovery gains.
- **Limits:** Small classification tasks; neither image generation nor PCM/RRAM; no verified redundancy benefit.
- **Un-0 relevance:** **High** — closest seed to learned oscillator dynamics, but outside the central AIMC evidence.
- **Read status:** **partial** — abstract and architecture/benchmark PDF passages; phase-noise claim verified in abstract, threshold not transcribed.

### 8. Transfer robustness across thousands of passive-ReRAM mappings

**Citation:** Philippe Drolet, Raphaël Dawant, Victor Yon, Pierre-Antoine Mouny, Matthieu Valdenaire, Javier Arias Zapata, Pierre Gliech, Sean U. N. Wood, Serge Ecoffey, Fabien Alibart, Yann Beilliard, and Dominique Drouin. “Hardware-aware Training Techniques for Improving Robustness of Ex-Situ Neural Network Transfer onto Passive TiO2 ReRAM Crossbars.” *arXiv:2305.18495* (2023). [Record](https://arxiv.org/abs/2305.18495); [HTML](https://arxiv.org/html/2305.18495v1).

- **Year / venue / type:** 2023 / arXiv preprint / simulation.
- **System and scale:** Fully connected half-moons classifier; experimentally informed passive TiO2 crossbars; thousands of weight transfers.
- **E1–E5:** E1 transfer/tuning variability and systematic sneak-path/biasing effects; do not equate these directly to E2 jitter or E4 faults.
- **Mitigation:** Hardware-adapted dropout, reparameterization, regularization.
- **Quantitative results:** 79.5% of test points are classified correctly with probability at least 95% over transfers, versus 18.5% for conventional training. This is not a 79.5% mean accuracy claim.
- **Limits:** Tiny synthetic classification task; uncertainty is measured across mappings, not manufacturing yield of image generators.
- **Un-0 relevance:** **High** — close methodological precedent for reporting cross-chip reliability rather than one mean score.
- **Read status:** **partial** — abstract and HTML overview.

### 9. Variance-aware noisy training and failure of a single training-noise level

**Citation:** Xiao Wang, Hendrik Borras, Bernhard Klein, and Holger Fröning. “Variance-Aware Noisy Training: Hardening DNNs against Unstable Analog Computations.” *ECML PKDD 2025*; arXiv:2503.16183v2 (2025). [Versioned HTML](https://arxiv.org/html/2503.16183v2); [conference preprint](https://ecmlpkdd-storage.s3.eu-central-1.amazonaws.com/preprints/2025/research/preprint_ecml_pkdd_2025_research_1294.pdf).

- **Year / venue / type:** 2025 / ECML PKDD / simulation.
- **System and scale:** LeNet-5, ResNet-18/50; CIFAR-10, CINIC-10, Tiny ImageNet; additive activation noise.
- **E1–E5:** E2 computational noise; changing variance motivated by E1 chip differences/E3 environment, not explicit offset drift; E5 proxy.
- **Mitigation:** Sample noise strength per image, then noise per activation; variance-aware noisy training (VANT).
- **Quantitative results:** v2 reports relative AUC robustness 79.3%→97.6% on CIFAR-10 and 32.4%→99.7% on Tiny ImageNet. These are **normalized curve-area scores, not classification accuracies**. v1 abstract numbers differ.
- **Limits:** Fixed-noise training, QAT, and SAM are weaker comparators; VANT can lose peak matched-noise accuracy. Empirical matched-noise envelope is not a proven theoretical bound.
- **Un-0 relevance:** **High** — directly motivates noise-distribution generalization tests.
- **Read status:** **partial** — methods, metric definition, limitations, abstract.

### 10. Analog Foundation Models: HWA adaptation at language-model scale

**Citation:** Julian Büchel, Iason Chalas, Giovanni Acampa, An Chen, Omobayode Fagbohungbe, Hsinyu Tsai, Kaoutar El Maghraoui, Manuel Le Gallo, Abbas Rahimi, and Abu Sebastian. “Analog Foundation Models.” *Advances in Neural Information Processing Systems* **38** (NeurIPS 2025). [Proceedings](https://proceedings.neurips.cc/paper_files/paper/2025/hash/580baa016b012f8d3ea27b9ac758cee1-Abstract-Conference.html); [extended arXiv v3](https://arxiv.org/html/2505.09663v3).

- **Year / venue / type:** 2025 / NeurIPS / simulation.
- **System and scale:** Phi-3-mini-4k-instruct and Llama-3.2-1B-Instruct; hardware-derived noise.
- **E1–E5:** E1 programming noise; additional E2 read-noise/E3 drift evaluations; E5 ADC proxy. No fault-repair benchmark.
- **Mitigation:** Synthetic-data distillation, hardware-aware adaptation, static input/output quantization, weight clipping.
- **Quantitative results:** Less than 1% of original pretraining tokens; v3 Appendix F.1 Phi-3 benchmark average 65.57 with noise versus unadapted noisy model 59.73 and digital QAT 65.63 without that noise.
- **Limits:** Digital quantization methods can lose substantial accuracy under analog noise/static ranges; calibration and HWA are complementary. Numbers depend on noise setting.
- **Un-0 relevance:** **Medium** — preserves pretrained generative capability using model-derived data; not an oscillator image generator.
- **Read status:** **partial** — methodology, comparisons, selected ablations; citation uses proceedings author spelling.

### 11. Very recent retraining-free input centering and rotations

**Citation:** George Karfakis and Puneet Gupta. “Enabling Retraining-Free Accurate Inference in Analog Compute in Memory Accelerators.” *arXiv:2611.08693v1* (5 November 2026). [Record](https://arxiv.org/abs/2611.08693); [HTML](https://arxiv.org/html/2611.08693v1).

- **Year / venue / type:** 2026 / arXiv preprint / simulation.
- **System and scale:** PCM/ReRAM CNNs, vision transformers, and LLMs up to 14B parameters; shared calibration.
- **E1–E5:** E1 device/programming error, E2 read noise, E3 drift, E5 converters/reference error; no E4 recovery established.
- **Mitigation:** Offline input centering and array-compatible Hadamard rotations, spreading shared-reference errors; no weight retraining.
- **Quantitative results:** ReRAM, 6-bit ADCs, one-day setting: ViT-B/16 37.4%→82.9% and Phi-4 27.0%→72.2%, within 2.2 percentage points of FP for the reported benchmarks.
- **Limits:** Newly posted, peer review not established; transformation relies on linear-layer equivalences and does not directly preserve arbitrary oscillator dynamics.
- **Un-0 relevance:** **Medium** — important calibration/representation baseline before attributing gains to fine-tuning or redundancy.
- **Read status:** **partial** — abstract/introduction and method overview; not a full overhead audit.

### 12. Physical reference-cell drift tracking in the readout

**Citation:** Alessio Antolini, Andrea Lico, Francesco Zavalloni, Eleonora Franchi Scarselli, Antonio Gnudi, Mattia Luigi Torres, Roberto Canegallo, and Marco Pasotti. “A Readout Scheme for PCM-Based Analog In-Memory Computing With Drift Compensation Through Reference Conductance Tracking.” *IEEE Open Journal of the Solid-State Circuits Society*, pp. 69–82 (2024), DOI 10.1109/OJSSCS.2024.3432468. [Author-hosted PDF](https://cris.unibo.it/bitstream/11585/976134/3/A_Readout_Scheme_for_PCM-Based_Analog_In-Memory_Computing_With_Drift_Compensation_Through_Reference_Conductance_Tracking.pdf).

- **Year / venue / type:** 2024 / IEEE OJSSCS / hardware demonstration.
- **System and scale:** 90-nm embedded PCM MAC testchip; eight reference cells; 512×512 MVM precision estimated from MAC measurements, not a measured full neural network.
- **E1–E5:** E1 mismatch/programming, E3 retention/thermal-accelerated drift, E5 readout proxy.
- **Mitigation:** Reference-cell conductance tracking (RCCT) and optimized program-and-verify.
- **Quantitative results:** Mean MAC decrease approximately zero at room temperature; 3× smaller after 64 h at 85 °C. Estimated MVM accuracy 97.4%, worst temporal decrease below 3%.
- **Limits:** Correcting common drift does not eliminate coefficient spread; reported MVM accuracy is not classification accuracy.
- **Un-0 relevance:** **High** — concrete precedent for reference oscillators tracking a common change.
- **Read status:** **partial** — abstract and experimental drift/readout passages.

### 13. Robust analog training requires more than generic SGD and a nominal reference

**Citation:** Malte J. Rasch, Fabio Carta, Omobayode Fagbohungbe, and Tayfun Gokmen. “Fast and robust analog in-memory deep neural network training.” *Nature Communications* **15**, 7133 (2024). [Paper](https://www.nature.com/articles/s41467-024-51221-z).

- **Year / venue / type:** 2024 / Nature Communications / simulation.
- **System and scale:** Resistive arrays used for gradient accumulation and weight storage; LeNet/MNIST example; material-noise, symmetry, retention, endurance sweeps.
- **E1–E5:** E1 device/reference variations, E2 update/conductance noise, E3 retention/reference drift; endurance is an E4-related lifetime constraint, not a remapping demonstration.
- **Mitigation:** Chopped TTv2 and analog gradient accumulation with dynamic reference (AGAD).
- **Quantitative results:** Baseline TTv2 fails to reach desired accuracy when its reference drifts more than 5% of conductance range in the reported setting. Gradient devices need roughly 0.5–4 pulses/input versus 2–4×10^-4 for weight devices.
- **Limits:** TTv2 variants need suitable asymmetry; AGAD is more general. Digital gradient accumulation has quadratic work despite constant-time analog MVM.
- **Un-0 relevance:** **Medium** — reference stability and on-device training limits; distinct from software noise-aware fine-tuning.
- **Read status:** **partial** — abstract and device-requirements/results passages.

### 14. HERMES: near-software inference with calibrated physical PCM cores

**Citation:** Manuel Le Gallo, Riduan Khaddam-Aljameh, Milos Stanisavljevic, Athanasios Vasilopoulos, Benedikt Kersting, Martino Dazzi, Geethan Karunaratne, Matthias Brändli, Abhairaj Singh, Silvia M. Müller, Julian Büchel, Xavier Timoneda, Vinay Joshi, Malte J. Rasch, Urs Egger, Angelo Garofalo, Anastasios Petropoulos, Theodore Antonakopoulos, Kevin Brew, Samuel Choi, Injo Ok, Timothy Philip, Victor Chan, Claire Silvestre, Ishtiaq Ahsan, Nicole Saulnier, Vijay Narayanan, Pier Andrea Francese, Evangelos Eleftheriou, and Abu Sebastian. “A 64-core mixed-signal in-memory compute chip based on phase-change memory for deep neural network inference.” *Nature Electronics* **6**, 680–693 (2023). [Paper](https://www.nature.com/articles/s41928-023-01010-1).

- **Year / venue / type:** 2023 / Nature Electronics / hardware demonstration.
- **System and scale:** 14-nm CMOS/PCM, 64 cores; ResNet and LSTM.
- **E1–E5:** E1 device/circuit variability, E2 noise, E5 conversion proxy; drift is relevant but no independent E3/E4 sweep confirmed from abstract.
- **Mitigation:** HWA models and calibrated mixed-signal execution; digital activations/communication integrated on chip.
- **Quantitative results:** 8-bit I/O: four-phase mode 16.1 TOPS, 2.48 TOPS/W; one-phase mode 63.1 TOPS, 9.76 TOPS/W.
- **Un-0 relevance:** **Medium** — real precision/throughput tradeoff; not a redundancy-controlled oscillator benchmark.
- **Read status:** **abstract-only** — publisher abstract and metadata; no full-chip calibration audit.

### 15. Architecture choice changes both mean accuracy and drift robustness

**Citation:** Hadjer Benmeziane, Corey Lammie, Irem Boybat, Malte Rasch, Manuel Le Gallo, Hsinyu Tsai, Ramachandran Muralidhar, Smail Niar, Ouarnoughi Hamza, Vijay Narayanan, Abu Sebastian, and Kaoutar El Maghraoui. “AnalogNAS: A Neural Network Design Framework for Accurate Inference with Analog In-Memory Computing.” *IEEE EDGE* (2023); arXiv:2305.10459. [Record](https://arxiv.org/abs/2305.10459); [HTML](https://arxiv.org/html/2305.10459v1).

- **Year / venue / type:** 2023 / IEEE EDGE / hardware demonstration.
- **System and scale:** HWA-trained networks for CIFAR-10, visual wake words, keyword spotting; 64-core PCM hardware, 256×256 unit cells/core.
- **E1–E5:** E1/E2 PCM model and repeated evaluations, E3 drift, E5 proxy; no E4 fault repair.
- **Mitigation:** Search over network width/depth/branches with accuracy, drift loss, and variability objectives.
- **Quantitative results:** Measured CIFAR-10 accuracy 92.05% for T500 versus ResNet-32 89.87%. Simulated month-drift drop 1.8% versus 5.04%; do not present that as month-long hardware measurement.
- **Limits:** Hardware validation offloads non-MVM work to the host; compact digital architectures do not necessarily remain robust on analog hardware.
- **Un-0 relevance:** **High** — precedent for redundancy/capacity allocation and variation-aware objectives, beyond merely training with noise.
- **Read status:** **partial** — search method and simulation/hardware results.

### 16. Generative-image precedent: passive-RRAM GAN with physical randomness

**Citation:** Siddharth Satyam, Honey Nikam, and Shubham Sahay. “Energy-Efficient Implementation of Generative Adversarial Networks on Passive RRAM Crossbar Arrays.” *arXiv:2111.14484*, v2 (2022; first submitted 2021). [Record](https://arxiv.org/abs/2111.14484); [HTML](https://arxiv.org/html/2111.14484v2).

- **Year / venue / type:** 2022 version / arXiv preprint / simulation.
- **System and scale:** Fully connected MNIST GAN; 54 arrays of 64×64 RRAM; model calibrated to more than 324 devices and approximately two million measurements.
- **E1–E5:** E1 device-to-device variation, E2 physical randomness/update noise; nonlinear switching beyond E1–E5. No complete drift/fault/readout factorial benchmark.
- **Mitigation:** Hardware-aware simulation, sign-based Manhattan updates; use device randomness as generator input.
- **Quantitative results:** Simulated cumulative array training energy 48.34 μJ with true-random input versus 52.06 μJ with pseudo-random input; updates use ±0.8 V, 100-ns pulses. Quality evaluated with an MNIST classifier, not FID; energy is not a measured whole-system figure.
- **Limits:** Body reports switching-threshold variability can hurt accuracy, despite favorable abstract language about randomness; useful latent randomness is not equivalent to harmless computational noise.
- **Un-0 relevance:** **High** — defeats a broad claim that hardware-imperfect image generation is unexplored; no coupled oscillator/circular redundancy.
- **Read status:** **partial** — architecture, update, quality, and energy sections.

### 17. Device-specific digital representations reduce hardware-in-loop retraining cost

**Citation:** Bernhard Klein, Lisa Kuhn, Johannes Weis, Arne Emmel, Yannik Stradmann, Johannes Schemmel, and Holger Fröning. “Towards Addressing Noise and Static Variations of Analog Computations Using Efficient Retraining.” In *Machine Learning and Principles and Practice of Knowledge Discovery in Databases*, ECML PKDD 2021 Workshops, pp. 409–420 (2021), DOI 10.1007/978-3-030-93736-2_32. [Institutional citation](https://www.kip.uni-heidelberg.de/Veroeffentlichungen/details.php?id=4484); [PDF](https://www.kip.uni-heidelberg.de/Veroeffentlichungen/download.php/6776/temp/4484.pdf).

- **Year / venue / type:** 2021 / ECML PKDD Workshops / hardware demonstration.
- **System and scale:** Analog multiplier arrays and column integrators on BrainScaleS-2; chip-specific lookup tables/splines plus Gaussian noise. Full network/device count not verified in inspected passages.
- **E1–E5:** E1 static variation, E2 electrical noise, E5 integrator-output proxy.
- **Mitigation:** Train mostly against an extracted hardware representation, then finish with hardware-in-loop epochs.
- **Quantitative results:** Retraining time reduced from over 10 h to below 2 h, with improved accuracy; do not interpret as a universal 5× chip speedup.
- **Limits:** Requires characterization of the particular instance; generic fleet training and chip-specific adaptation are different deployment strategies.
- **Un-0 relevance:** **High** — direct precedent for per-chip mismatch modeling and calibration before fine-tuning.
- **Read status:** **partial** — abstract and introductory hardware-representation discussion.

### 18. Patent: measured partial-sum noise injection and cross-chip distributions

**Citation:** Sai Kiran Cherupally, Jian Meng, Shihui Yin, Deliang Fan, and Jae-sun Seo. “Hardware noise-aware training for improving accuracy of in-memory computing-based deep neural network hardware.” US patent application **US20220318628A1**, published 6 October 2022; priority 6 April 2021; Arizona State University assignee. [Patent text](https://patents.google.com/patent/US20220318628A1/en).

- **Year / venue / type:** 2022 / US patent application / proposal.
- **System and scale:** Measured XNOR-SRAM/C3SRAM noise; ResNet-18, VGG, AlexNet, MobileNet; five XNOR-SRAM chips.
- **E1–E5:** E1 chip differences, E2 computation noise, E5 ADC proxy; supply dependence is E3-like, not a temporal-aging demonstration.
- **Mitigation:** Conditional probability tables inject measured noise at crossbar partial sums; ensemble tables across chips.
- **Quantitative results:** Claimed ResNet-18 loss reduced from 3.5% to about 1% of software baseline; five tables pooled using 100,000 samples/chip (500,000 total); voltages 0.6/0.8/1.0 V.
- **Limits:** Patent claims/examples are not an independent peer-reviewed replication; larger digital precision can accumulate more analog partial-sum noise.
- **Un-0 relevance:** **High** — clear earlier disclosure of hardware-calibrated noise-aware training across chips; no legal scope opinion inferred.
- **Read status:** **partial** — metadata and experimental examples.

### 19. Review connecting calibration, redundant arithmetic, and analog ECC

**Citation:** Piergiulio Mannocci, Giacomo Larelli, Marco Bonomi, and Daniele Ielmini. “Achieving high precision in analog in-memory computing systems.” *npj Unconventional Computing* **3**, 1 (2026), DOI 10.1038/s44335-025-00044-2. [Review](https://www.nature.com/articles/s44335-025-00044-2).

- **Year / venue / type:** **2026** / npj Unconventional Computing / review. Publisher date is 7 January 2026 despite “025” in DOI.
- **System and scale:** Resistive-memory MVM primitives and multicore systems; surveys bit slicing, residue arithmetic, ECC, iterative refinement.
- **E1–E5:** E1 mismatches/parasitics, E2 device noise, E3 PCM drift, E4 stuck cells, E5 conversion/readout proxies.
- **Mitigation:** Circuit/device calibration, HWA, analog ECC, redundant moduli, mixed-precision correction.
- **Quantitative results:** Discusses **single-error (1-error) correction** demonstrations and multiple-error codes; no new aggregate accuracy benchmark. Conditioning can cost approximately log10(κ) decimal digits in inverse problems.
- **Limits:** Ordinary memory-bit ECC does not automatically protect analog MVM outputs; extra redundancy and decoding cost remain. Reviewed ECC demonstrations must be cited at their primary sources for detailed performance claims.
- **Un-0 relevance:** **High** — establishes analog ECC as prior art; nonlinear oscillator trajectories need a compatible protected representation.
- **Read status:** **partial** — abstract and ECC/iterative-refinement passages.

### 20. Real-chip verification of variation-aware training and shift correction

**Citation:** Naoaki Tsutsui, Kengo Akimoto, Takaaki Imaizumi, Kazuki Tsuda, Yusuke Koumura, Kiyotaka Kimura, Ryo Nakazato, Chizuko Tani, Takafumi Fukumoto, Yoshinori Ando, Yuto Yakubo, Toru Nakura, and Shunpei Yamazaki. “Verification of training and compensation under variations: simulation and measurement on oxide semiconductor analog in-memory computing chips.” *npj Unconventional Computing* **3**, 32 (2026). [Paper](https://www.nature.com/articles/s44335-026-00074-4).

- **Year / venue / type:** 2026 / npj Unconventional Computing / hardware demonstration.
- **System and scale:** Three oxide-semiconductor chips; network 506→256→10; only first-layer MAC on chip, remainder software.
- **E1–E5:** E1 persistent circuit/ADC offsets, E2 operational noise, E5 ADC proxy; no explicit E3/E4 sweep.
- **Mitigation:** Variation-aware Gaussian output-noise training, dropout comparison, shift correction.
- **Quantitative results:** Chip output-error standard deviations 31, 39, 68 LSB; 12 regional samples establish positive association with optimal training noise. Evaluation uses 1,000 test images, 8-bit inputs/weights, 10 training epochs.
- **Limits:** Larger training noise is not universally best; optimum depends on chip. Small two-layer classifier does not establish large-model generality.
- **Un-0 relevance:** **High** — empirical support for chip distributions and separating deterministic correction from stochastic tolerance.
- **Read status:** **partial** — noise modeling, discussion, and methods.

### 21. Early systematic device requirements and the limits of global calibration

**Citation:** Tayfun Gokmen and Yurii Vlasov. “Acceleration of Deep Neural Network Training with Resistive Cross-Point Devices: Design Considerations.” *Frontiers in Neuroscience* **10**, 333 (2016). [Paper](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2016.00333/full).

- **Year / venue / type:** 2016 / Frontiers in Neuroscience / simulation.
- **System and scale:** Resistive processing units; MNIST device-tolerance analysis; projected large-system architectures, not a fabricated billion-weight chip.
- **E1–E5:** E1 device variability/asymmetry, E2 computational/update noise, E5 MVM readout proxy; not a combined drift/fault yield demonstration.
- **Mitigation:** Statistical tolerance analysis; adjust pulse widths/amplitudes for global up/down asymmetry.
- **Quantitative results:** Example device specifications include 1,000 storage levels and 2% tolerance on device up/down asymmetry; projected Design 2: 840M weights, 21,000 TOPS at 250 W. Projections are not measurements.
- **Limits:** Global asymmetry can be calibrated, but random device-specific asymmetry remains restrictive; specifications must be reconsidered for different architectures/datasets.
- **Un-0 relevance:** **Medium** — early precedent for one-nonideality-at-a-time specifications and global-versus-local correction.
- **Read status:** **partial** — abstract and device-specification/discussion tables.

### 22. Post-training range calibration can replace some HWA complexity

**Citation:** Corey Lammie, Athanasios Vasilopoulos, Julian Büchel, Giacomo Camposampiero, Manuel Le Gallo, Malte Rasch, and Abu Sebastian. “Improving the Accuracy of Analog-Based In-Memory Computing Accelerators Post-Training.” *IEEE International Symposium on Circuits and Systems (ISCAS)* (2024), DOI 10.1109/ISCAS58744.2024.10558540. [Record](https://arxiv.org/abs/2401.09859); [HTML](https://arxiv.org/html/2401.09859v1).

- **Year / venue / type:** 2024 / IEEE ISCAS / simulation.
- **System and scale:** Pretrained RoBERTa across GLUE tasks; crossbar input ranges and per-column conductance ranges.
- **E1–E5:** E1/E2 modeled device/computation imperfections and E5 DAC/ADC proxy; not an isolated E3/E4 repair benchmark.
- **Mitigation:** Post-training optimization of column conductance ranges and DAC input ranges, complementing HWA fine-tuning.
- **Quantitative results:** Reduces training complexity/hardware-information requirements with no notable accuracy change (≤0.1% reported) across GLUE; further post-training adjustment can improve already learned settings.
- **Limits:** “Post-training” does not mean all network adaptation was eliminated; noise-aware fine-tuning remains part of the evaluated workflow.
- **Un-0 relevance:** **High** — compare low-cost calibration against expensive noise-aware training and redundancy before attributing recovery to either.
- **Read status:** **partial** — abstract and workflow overview.

## Gaps / open questions noted by the literature

- **What is already done?** Noise-aware/HWA training, per-device statistical modeling, compensation of average drift, chip-specific adaptation, repeated analog computation, redundant conductance representations, and analog ECC all have clear antecedents [1–6, 12, 17–19, 22]. A broad “RAID for analog AI” or “train with hardware noise” novelty claim would be too strong. Within this corpus, the exact combination for Un-0 remains undemonstrated.

- **Matching the trained distribution is a limitation, not a solved detail.** VANT documents loss under noise-level mismatch and a peak-accuracy/coverage tradeoff [9]; three physical chips have different optimal training-noise settings [20]. Missing for Un-0: generalization from training noise to unseen mixtures, chip tails, correlations, and drift trajectories. The literature motivates this question; it does not demonstrate Un-0 robustness.

- **Common drift is not identical to independent device drift.** PCM compensation restores a mean scale while residual errors persist [2, 3, 12]. A shared frequency shift, common coupling-gain change, and oscillator-specific detuning can have different consequences. Reference oscillators should be assessed against the parameter actually drifting; successful PCM gain normalization does not prove correction of phase-dynamics errors. This transfer question is an inference from the different physical models.

- **Averaging must specify what is independent and where it happens.** Multiple conductances and repeated MVMs are established [5, 6]. Repeating a read on the same chip can reduce fresh read noise but retains the same fixed mismatch; copies sharing drift retain correlated bias. Circular averaging after the ODE, averaging forces at every step, and coupling redundant oscillators create different systems. No retained source demonstrates their equivalence or a circular-mean guarantee for Un-0.

- **Faults and ECC are not interchangeable with small noise.** The review distinguishes memory-bit protection from computation-level analog ECC and notes redundancy/decoding overhead [19]. Injecting small weight noise should not be described as proof of dead-oscillator or stuck-phase recovery. Missing here: code constraints preserved through nonlinear, driven oscillator evolution, multiple faults, decoder behavior when the circular resultant is near zero, and failure correlation across copies. These are Un-0-specific extrapolations, not claims tested by the crossbar papers.

- **Internal noise can dominate terminal measurement.** Crossbar studies emphasize computation/conversion errors at intermediate operations [1, 4, 10]. Their “read noise” often perturbs effective weights or every MVM; it is not automatically the catalog's final phase readout. Un-0's repeated coupled integration makes placement and temporal correlation central. The reviewed papers do not establish that an endpoint phase perturbation emulates integration jitter.

- **Yield has antecedents, but full joint-error yield remains a gap in this corpus.** Thousands of transfer realizations [8], multi-chip noise distributions [18, 20], and architecture-level variability metrics [15] precede the proposed approach. None of the retained works reports Un-0 image-quality yield over joint E1–E5 with separately attributable fixes. Mean accuracy alone would miss chip tails; “many simulated chips” should retain persistent mismatch within each chip and separate run variability from chip variability.

- **Generator metrics need more than recognition.** Hardware-imperfect GAN generation already exists [16], but its classifier-based quality measure is not FID or a distributional diversity guarantee. The oscillator seed is a classifier [7]. No retained study validates DINO/pixel paired-seed fidelity, class retention, FID, and diversity together for a coupled-oscillator image generator. A generator can preserve class recognition while losing diversity or changing the intended sample.

- **What demonstrably does not suffice?** Generic noise injection omitting circuit/range effects [1]; global drift correction alone [2, 3]; conventional fixed-noise training under changing variance [9]; ordinary digital quantization robustness under realistic analog constraints [10]; and nominally precise but drifting training references [13]. Conversely, recent calibration/representation methods [11, 22] mean retraining should not be assumed necessary for every model. These are conditional findings, not universal impossibility results.

- **Cost and evidence boundaries matter.** Redundancy consumes devices/energy/time [5, 6]; reference tracking and adaptive normalization cost circuitry or calibration [2, 12]; on-chip training has update/endurance requirements distinct from inference-only deployment [13, 21]. The 2026 retraining-free results are a very recent preprint [11]; the patent is disclosure rather than independent replication [18]; HERMES was inspected at abstract level [14]. No experiments were run for this review, and none of the reported numbers are new Un-0 measurements.

- **Search limitations:** This is a focused source note, not a PRISMA-complete database export or an exhaustive patent search. IEEE and some publisher pages were access-limited; accessible author/arXiv versions were used where available. “Not found” is restricted to this search and these 22 retained works. Earlier 2015 material was searched but no additional directly qualifying work was retained; absence of a 2015 entry is not an absence claim. Full supplements, code, and independent replication were not audited. In particular, the next literature step for an ECC-specific novelty claim is primary-source review of the codes cited in [19], rather than treating the review itself as a new demonstration.
