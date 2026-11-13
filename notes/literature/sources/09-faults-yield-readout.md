# Faults, yield and readout in analog and AI accelerators

Fault tolerance, analog redundancy, remapping and noise-aware training all have substantial prior art; none can be claimed as new in general.
The closest precedents for the proposed redundancy are committee averaging [5], analog ECC [6], selective neuron/layer replication [13], and learned error-decorrelated output codes [18].
Most evidence concerns resistive-memory matrix multiplication and classification, rather than coupled Kuramoto dynamics or class-conditional image generation.
Permanent stuck-off, stuck-on and intermediate stuck conductances are distinct failure modes; a dead connection is not an adequate model for all faults.
Manufacturing defects and endurance-induced faults motivate both initial fault maps and periodic detection/remapping [2, 3, 12].
PCM drift compensation is established, but device-dependent conductance drift is not identical to a shared oscillator-frequency offset [7, 16].
Read noise, ADC quantization, clipping and converter mismatch should be distinguished; output-path errors can dominate weight errors [16, 22].
Published “yield” can mean device programmability, fault-free array probability, circuit-specification pass probability, or application-quality pass probability.
Accuracy at a selected fault density, even averaged across random maps, is not by itself an application-yield measurement.
The remaining opportunity is a measured, costed evaluation of these ideas for Un-0's recurrent phase dynamics, mixed E1–E5 errors and per-chip image-quality distribution.

Search date: **2026-11-13**. Scope searched: 2015–2026, with emphasis on 2022–2026. Read against `notes/hardware-error-catalog.md`; no experiments were run. Searches covered arXiv, IEEE/DATE/IEDM/VLSI and SISPAD records, Nature-family articles, NeurIPS/ICML/OpenReview, institutional theses, patents and IBM research pages. Science-family and ISSCC searches did not supply an additional sufficiently specific, verified quantitative entry. This is a focused source collection, not a claim of exhaustive database coverage.

Citation trails checked include Xia → committee machines → ReMeCo; Joshi → Rasch → later analog foundation models; and Li's analog ECC → the 2026 precision review and Xu's matrix-factorization work. Later citing works are recorded separately from their predecessors; preprint/journal versions of the same study are combined. Thesis and company pages were used for discovery and bibliographic checks, without counting duplicate results as independent evidence.

**Reading convention:** `partial` means selected main-text sections, figures/tables or indexed paper-text extracts were inspected; it does not mean the entire paper or supplement was read. `abstract-only` means no substantive main-text assessment. Several publisher/PDF opens were blocked; the entry identifies the accessible version. No entry is labelled `full`. Numbers are author-reported unless explicitly called a derivation. E-tags are cross-substrate analogies: E2 means stochastic computational noise, not necessarily SDE noise during integration; E3 includes retention/aging drift, which need not be shared across devices. Quantization is included under E5 by extension of the catalog's readout category.

## Entries

### 1. Burr et al. — early experimental tolerancing of PCM networks

**Citation:** Geoffrey W. Burr, Robert M. Shelby, Severin Sidler, Carmelo di Nolfo, Junwoo Jang, Irem Boybat, Rohit S. Shenoy, Pritish Narayanan, Kumar Virwani, Emanuele U. Giacometti, Bülent Kurdi and Hyunsang Hwang. “Experimental Demonstration and Tolerancing of a Large-Scale Neural Network (165 000 Synapses) Using Phase-Change Memory as the Synaptic Weight Element.” *IEEE Transactions on Electron Devices* 62(11), 3498–3507, 2015. [DOI](https://doi.org/10.1109/TED.2015.2439635); [author manuscript](https://s3.us.cloud-object-storage.appdomain.cloud/res-files/922-TED_special_issue_IEDM2014_reducedSize.pdf).

- **Year / venue / type:** 2015 / IEEE TED / hardware demonstration.
- **System and scale:** Three-layer perceptron; 164,885 synapses, two PCM devices per synapse; 5,000 MNIST training examples.
- **Errors / mitigation:** E1, E2, E4; device-compatible backpropagation and calibrated simulation of variability, nonresponsive devices and update imperfections.
- **Quantitative results / metrics:** Experimental training/test accuracy 82.2%/82.9%. Idealized symmetric bidirectional-device simulations exceed 94% with 5,000 training examples and 97% with 60,000. These latter values are projections, not measured-chip yield.
- **Relevance to Un-0:** **Med** — an early precedent for separate nonideality tolerancing followed by application-level accuracy assessment.
- **Read status:** **Partial** — manuscript abstract, tolerancing discussion and conclusion.

### 2. Liu et al. — defect-aware retraining and remapping

**Citation:** Chenchen Liu, Miao Hu, John Paul Strachan and Hai (Helen) Li. “Rescuing Memristor-based Neuromorphic Design with High Defects.” *54th ACM/EDAC/IEEE Design Automation Conference (DAC)*, 2017. [DOI](https://doi.org/10.1145/3061639.3062310); [author-institution record](https://scholars.duke.edu/publication/1267032).

- **Year / venue / type:** 2017 / DAC / simulation, using measured device defects.
- **System and scale:** MNIST networks with 784×10 weights or 784×256 plus 256×10 weights; defect characterization on a 64×64 TaOx array.
- **Errors / mitigation:** E4; identify significant weights, freeze defective locations during retraining, then remap significant weights away from defects. Endurance damage motivates faults arising after fabrication.
- **Quantitative results / metrics:** Two-layer baseline accuracy 92.64%; at 20% random defects unmitigated accuracy falls to 39.4%, while the proposed flow recovers almost the baseline. An examined physical array had 84% device yield; this is not 84% application yield.
- **Relevance to Un-0:** **High** — directly precedes chip-specific fault-aware fine-tuning and importance-based spare allocation.
- **Read status:** **Partial** — institutional abstract and indexed main-text device-model/evaluation sections; full publisher access unavailable.

### 3. Xia et al. — stuck-at faults and configurable redundancy

**Citation:** Lixue Xia, Wenqin Huangfu, Tianqi Tang, Xiling Yin, Krishnendu Chakrabarty, Yuan Xie, Yu Wang and Huazhong Yang. “Stuck-at Fault Tolerance in RRAM Computing Systems.” *IEEE Journal on Emerging and Selected Topics in Circuits and Systems* 8(1), 102–115, 2018. [DOI](https://doi.org/10.1109/JETCAS.2017.2776980); [author PDF](https://nicsefc.ee.tsinghua.edu.cn/%2Fnics_file%2Fpdf%2Fpublications%2F2018%2FIEEE%20JETCAS_236.pdf).

- **Year / venue / type:** 2018, online 2017 / IEEE JETCAS / simulation.
- **System and scale:** RRAM matrix-vector multiplication and MNIST networks; discussion includes 512×512 crossbars.
- **Errors / mitigation:** E4; conductance mapping with intrinsic fault tolerance, redundant columns, distribution-aware and reconfigurable redundancy, including imperfect spares.
- **Quantitative results / metrics:** Near fault-free MNIST accuracy with roughly 30% energy overhead. Redundant-cell demand falls from >200% to <40% for distribution-aware and <60% for reconfigurable schemes. At independent cell yield 0.99, a 512-cell column is fault-free with probability about 0.0058.
- **Relevance to Un-0:** **High** — spare oscillators/couplings can also be defective; system success cannot require every physical component to work perfectly.
- **Read status:** **Partial** — PDF introduction, fault definitions and redundancy/result summary.

### 4. El-Mhamdi et al. — probabilistic neuron-crash guarantees

**Citation:** El-Mahdi El-Mhamdi, Rachid Guerraoui, Andrei Kucharavy and Sergei Volodin. “The Probabilistic Fault Tolerance of Neural Networks in the Continuous Limit.” *arXiv:1902.01686*, 2019, version 2. [Paper](https://arxiv.org/html/1902.01686v2).

- **Year / venue / type:** 2019 / arXiv preprint / theory.
- **System and scale:** Wide feedforward networks with Bernoulli neuron/weight crashes; MNIST and CNN validation. Typical assumptions include layer widths ≥~100 and failure probabilities ~10^-4–10^-3.
- **Errors / mitigation:** E4; regularization based on propagated-error moments and a probabilistic certification algorithm. Random crashes resemble dropout, but permanence and the certification distribution matter.
- **Quantitative results / metrics:** Defines (ε,δ)-fault tolerance by probability of excess loss exceeding ε being ≤δ. A maximally interchangeable one-layer example has variance p/n, whereas concentrating all computation on one neuron gives variance p. These illustrate width benefits under assumptions, not measured yield.
- **Relevance to Un-0:** **High** — connects redundancy to a tail-probability success metric and highlights dependence on feature interchangeability.
- **Read status:** **Partial** — definitions, assumptions and representative bounds; proofs not fully checked.

### 5. Joksas et al. — committee averaging against mixed nonidealities

**Citation:** D. Joksas, P. Freitas, Z. Chai, W. H. Ng, M. Buckwell, C. Li, W. D. Zhang, Q. Xia, A. J. Kenyon and A. Mehonic. “Committee machines—a universal method to deal with non-idealities in memristor-based neural networks.” *Nature Communications* 11, 4273, 2020. [DOI](https://doi.org/10.1038/s41467-020-18098-0); [readable manuscript](https://arxiv.org/html/1909.06658v3).

- **Year / venue / type:** 2020 / Nature Communications / simulation, calibrated with experimental device data.
- **System and scale:** MNIST networks including 784(+bias):25(+bias):10; three memristor technologies; 128×64 array geometry.
- **Errors / mitigation:** E1, E4 and stochastic read-current noise analogous to E2/E5; ensemble output averaging plus input/output mapping to reduce line-resistance bias.
- **Quantitative results / metrics:** For the Ta/HfO2 case, median accuracy drops from ~95.9% digital to ~90.8% with nonidealities; five-member committees restore ~95.8%. Reports boxplots/distributions, not a specified application-pass yield. Also investigates committees under a fixed total memristor budget.
- **Relevance to Un-0:** **High** — a direct precedent for redundant analog networks and averaging; neither circular-mean phase averaging nor coupled redundant copies is demonstrated.
- **Read status:** **Partial** — simulation setup, fault/noise models and main accuracy results.

### 6. Li et al. — experimentally demonstrated analog ECC

**Citation:** Can Li, Ron M. Roth, Cat Graves, Xia Sheng and John Paul Strachan. “Analog error correcting codes for defect tolerant matrix multiplication in crossbars.” *IEEE International Electron Devices Meeting (IEDM)*, 36.6.1–36.6.4, 2020. [DOI](https://doi.org/10.1109/IEDM13553.2020.9371978); [institutional record](https://cris.technion.ac.il/en/publications/analog-error-correcting-codes-for-defect-tolerant-matrix-multipli/); [paper](https://repository.hku.hk/bitstream/10722/305968/1/Content.pdf).

- **Year / venue / type:** 2020 / IEDM / hardware demonstration.
- **System and scale:** Memristor crossbar MVM and MNIST classification; worked coding example has seven payload columns and four redundant columns.
- **Errors / mitigation:** E4, E5-like injected current errors; drift and transient disturbances are motivating cases. Analog ECC accepts bounded small errors and detects/corrects large outliers using redundant linear combinations.
- **Quantitative results / metrics:** Classification improves 90.31%→96.21% with shorted devices and 73.12%→97.36% with injected current noise. These are task-accuracy recoveries, not manufacturing yield.
- **Relevance to Un-0:** **High** — establishes analog ECC as prior art; linear MVM coding identities do not automatically survive nonlinear oscillator dynamics.
- **Read status:** **Partial** — institutional abstract and indexed paper introduction/code example; direct PDF retrieval blocked.

### 7. Joshi et al. — drift references and noise-aware training

**Citation:** Vinay Joshi, Manuel Le Gallo, Simon Haefeli, Irem Boybat, S. R. Nandakumar, Christophe Piveteau, Martino Dazzi, Bipin Rajendran, Abu Sebastian and Evangelos Eleftheriou. “Accurate deep neural network inference using computational phase-change memory.” *Nature Communications* 11, 2473, 2020. [Paper](https://www.nature.com/articles/s41467-020-16108-9); [preprint](https://arxiv.org/abs/1906.03138).

- **Year / venue / type:** 2020 / Nature Communications / hardware demonstration, with software inference using measured conductances.
- **System and scale:** ResNet-32: 361,722 weights, two PCM devices each, on a one-million-device 90-nm chip; ImageNet extension simulated.
- **Errors / mitigation:** E1, E3, E5 and observed programming failures; noise-aware training, global drift compensation from reference currents, adaptive batch-statistic calibration.
- **Quantitative results / metrics:** 93.75% CIFAR-10 after programming; global compensation retains >92.6% for one day, adaptive calibration >93.5%. Programming converges for 99.1% of nonzero-target devices without defect screening. Readout uses an 8-bit ADC.
- **Relevance to Un-0:** **High** — close precedent for reference-based common drift correction; heterogeneous residual drift remains after global compensation.
- **Read status:** **Partial** — indexed article methods/results, including hardware/software distinction; direct publisher opens blocked.

### 8. Zhang et al. — yield as a joint specification-pass probability

**Citation:** Shuhan Zhang, Fan Yang, Dian Zhou and Xuan Zeng. “Bayesian Methods for the Yield Optimization of Analog and SRAM Circuits.” *25th Asia and South Pacific Design Automation Conference (ASP-DAC)*, 440–445, 2020. [DOI](https://doi.org/10.1109/ASP-DAC47756.2020.9045614); [paper](https://csuncle.com/uploads/aspdac2020/pdf/p440_6C-3.pdf).

- **Year / venue / type:** 2020 / ASP-DAC / simulation.
- **System and scale:** Three-stage amplifier with 24 design variables; SRAM columns of 1, 64 and 512 cells.
- **Errors / mitigation:** E1; statistical design optimization using Gaussian-process models, adaptive yield estimation and max-value entropy search. Not neural-network retraining.
- **Quantitative results / metrics:** Amplifier mean yield 99.97%, using mean 8,350 optimization simulations versus 10,113 for expected improvement. Final amplifier yields checked with 50,000 Monte Carlo runs; SRAM failure rates with 10^8. The 512-cell case reports 3.51×10^-7 failure probability. Yield means all specified constraints pass jointly.
- **Relevance to Un-0:** **High** — supplies the statistical definition needed for per-chip quality yield; rare-tail estimates need adequate sampling.
- **Read status:** **Partial** — formulation and evaluation tables; optimizer derivation not fully reviewed.

### 9. Khaddam-Aljameh et al. — converter-linearity yield under mismatch

**Citation:** Riduan Khaddam-Aljameh, Pier-Andrea Francese, Luca Benini and Evangelos Eleftheriou. “An SRAM-Based Multibit In-Memory Matrix-Vector Multiplier With a Precision That Scales Linearly in Area, Time, and Power.” *IEEE Transactions on Very Large Scale Integration (VLSI) Systems* 29(2), 372–385, 2021. [Author manuscript](https://www.research-collection.ethz.ch/server/api/core/bitstreams/231ff105-faa2-4a9b-80db-705f73214b76/content).

- **Year / venue / type:** 2021 / IEEE TVLSI / simulation.
- **System and scale:** SRAM/switched-capacitor multibit MVM; transistor-level column of 128 computing units in 14-nm technology.
- **Errors / mitigation:** E1, E5; capacitor sizing and architecture chosen to constrain mismatch-induced conversion nonlinearity, without relying on calibration.
- **Quantitative results / metrics:** Uses target Y_DNL≥99% for maximum differential nonlinearity <0.5 LSB. This is a circuit acceptance target, not a demonstrated 99% yield of trained networks. Reports examples with 5-bit unsigned inputs/weights and an 8-bit MAC output.
- **Relevance to Un-0:** **Med** — a concrete precedent for threshold-defined readout yield; nominal phase bit depth alone omits mismatch and nonlinearity.
- **Read status:** **Partial** — indexed primary-manuscript sections/figure descriptions; direct repository PDF opens returned 403.

### 10. Putra et al. — fault-aware mapping versus retraining

**Citation:** Rachmad Vidya Wicaksana Putra, Muhammad Abdullah Hanif and Muhammad Shafique. “ReSpawn: Energy-Efficient Fault-Tolerance for Spiking Neural Networks considering Unreliable Memories.” *IEEE/ACM International Conference on Computer Aided Design (ICCAD)*, 1–9, 2021. [DOI](https://doi.org/10.1109/ICCAD51958.2021.9643524); [manuscript](https://arxiv.org/html/2108.10271v1).

- **Year / venue / type:** 2021 / ICCAD / simulation.
- **System and scale:** Single-layer fully connected MNIST SNNs; includes a 900-neuron network and off-chip/on-chip weight-memory fault maps.
- **Errors / mitigation:** E4; fault-aware bit shuffling puts significant bits in healthy locations; optional fault-aware training-and-mapping when training data are available.
- **Quantitative results / metrics:** Reports up to 70% accuracy improvement for the 900-neuron case without retraining, relative to its unmitigated faulty baseline. This author-described improvement should not be read as 70% chip yield or a universal 70-point gain.
- **Relevance to Un-0:** **Med** — a useful decision split between mapping-only recovery and data-dependent retraining, although digital memory bits differ from oscillator states.
- **Read status:** **Partial** — manuscript abstract, architecture and fault-model/mapping discussion.

### 11. Zhou et al. — low-precision ADCs and drift-aware TinyML

**Citation:** Chuteng Zhou, Fernando García Redondo, Julian Büchel, Irem Boybat, Xavier Timoneda Comas, S. R. Nandakumar, Shidhartha Das, Abu Sebastian, Manuel Le Gallo and Paul N. Whatmough. “ML-HW Co-Design of Noise-Robust TinyML Models and Always-On Analog Compute-in-Memory Edge Accelerator.” *IEEE Micro* 42(6), 76–87, 2022. [DOI](https://doi.org/10.1109/MM.2022.3198321); [AnalogNets manuscript](https://arxiv.org/html/2111.06503v1).

- **Year / venue / type:** 2022, preprint 2021 / IEEE Micro / simulation, with prototype PCM validation.
- **System and scale:** Keyword spotting and visual wake words; proposed 14-nm layer-serial AON-CiM accelerator.
- **Errors / mitigation:** E1, E3, E5; architecture co-design, noise injection, quantization-aware training and ADC gain/scaling constraints.
- **Quantitative results / metrics:** At 8-bit precision, accuracy losses after 24 hours PCM drift are 0.8%/1.2% for the two tasks. Journal accelerator estimates span 8-/6-/4-bit activations; these should not be mistaken for full silicon measurements of the proposed accelerator.
- **Relevance to Un-0:** **High** — readout range/gain and architecture can determine robustness alongside the training-noise amplitude.
- **Read status:** **Partial** — preprint nonideality/training sections and publisher-indexed journal abstract; version-dependent efficiency numbers omitted.

### 12. Tung et al. — clustered faults and faults appearing during use

**Citation:** Chung-Hsuan Tung, Biresh Kumar Joardar, Partha Pratim Pande, Janardhan Rao Doppa, Hai (Helen) Li and Krishnendu Chakrabarty. “Dynamic Task Remapping for Reliable CNN Training on ReRAM Crossbars.” *Design, Automation & Test in Europe Conference (DATE)*, 2023. [Paper](https://past.date-conference.com/proceedings-archive/2023/DATA/220.pdf).

- **Year / venue / type:** 2023 / DATE / simulation.
- **System and scale:** 128×128 crossbars in a tiled accelerator; VGG, ResNet and SqueezeNet on CIFAR-10/100 and SVHN.
- **Errors / mitigation:** E4; pre-deployment manufacturing faults and post-deployment endurance faults, nonuniform spatial distributions, BIST and dynamic task remapping (Remap-D).
- **Quantitative results / metrics:** Mean accuracy loss 0.85%; reported average advantage over AN-code ECC 12.5%. BIST takes 260 crossbar cycles, with estimated total training performance overhead 0.13%. Fault density is fraction of faulty cells; it is not application yield.
- **Relevance to Un-0:** **High** — tests assumptions that uniform independent fault maps and a once-only spare assignment can miss.
- **Read status:** **Partial** — fault model, BIST, architecture and reported evaluation summary.

### 13. BanaGozar et al. — selective neuron and layer redundancy

**Citation:** Ali BanaGozar, Seyed Hossein Hashemi Shadmehri, Sander Stuijk, Mehdi Kamal, Ali Afzali-Kusha and Henk Corporaal. “ReMeCo: Reliable Memristor-Based in-Memory Neuromorphic Computation.” *28th Asia and South Pacific Design Automation Conference (ASP-DAC)*, 396–401, 2023. [DOI](https://doi.org/10.1145/3566097.3567889); [paper](https://sstuijk.estue.nl/publications/aspdac23.pdf).

- **Year / venue / type:** 2023 / ASP-DAC / simulation.
- **System and scale:** LeNet/MNIST, 866K parameters; AlexNet/CIFAR-10, 62M; 8-bit weights mapped onto 4-bit devices.
- **Errors / mitigation:** E1, E4 and IR drop; sensitivity-guided redundancy of neurons, significant bits and layers; averages intermediate layer outputs.
- **Quantitative results / metrics:** Reports 98.5% accuracy recovery with roughly 4% redundancy, >20× less redundancy than its comparison baseline. This is recovery, not 98.5% absolute classification accuracy. Default fault model has 1% stuck devices, 16.2% of faults off and 83.8% on. Software accuracies are 98.94%/80.12%.
- **Relevance to Un-0:** **High** — particularly close prior art for redundancy over learned features, including mixed nonidealities and replication-cost tradeoffs.
- **Read status:** **Partial** — paper framework, implementation assumptions and evaluation; conference slides also inspected.

### 14. Hanif and Shafique — fault-aware quantization

**Citation:** Muhammad Abdullah Hanif and Muhammad Shafique. “FAQ: Mitigating the Impact of Faults in the Weight Memory of DNN Accelerators through Fault-Aware Quantization.” *arXiv:2305.12590*, 2023. [Paper](https://arxiv.org/html/2305.12590v1).

- **Year / venue / type:** 2023 / arXiv preprint / simulation.
- **System and scale:** ResNet-18, VGG11/16, AlexNet and MobileNetV2; CIFAR-10/100 and ImageNet; stuck bits in on-chip weight memory.
- **Errors / mitigation:** E4; map weights to nearby values representable under the known fault mask, optionally inside fault-aware retraining.
- **Quantitative results / metrics:** At fault rate 0.04, reports average accuracy increases of 76.38% for ResNet-18/CIFAR-10 and 70.47% for VGG11/CIFAR-10. Conversion costs <5% of one retraining epoch. Preserve the paper's percentage wording rather than treating these as yield or cross-paper-normalized gains.
- **Relevance to Un-0:** **Med** — cheap per-chip parameter adaptation may be a stronger baseline than retraining everything, but analog phase faults are not bit masks.
- **Read status:** **Partial** — method and evaluation overview; no journal publication inferred.

### 15. Quan et al. — training-free statistical correction

**Citation:** Chenghao Quan, Mohammed E. Fouda, Sugil Lee, Giju Jung, Jongeun Lee, Ahmed E. Eltawil and Fadi Kurdahi. “Training-Free Stuck-At Fault Mitigation for ReRAM-Based Deep Learning Accelerators.” *IEEE Transactions on Computer-Aided Design of Integrated Circuits and Systems* 42(7), 2174–2186, 2023. [DOI](https://doi.org/10.1109/TCAD.2022.3222288); [author manuscript](https://repository.kaust.edu.sa/bitstreams/8f43672c-cc2a-457d-bfa6-7ae7d10eedad/download).

- **Year / venue / type:** 2023, online 2022 / IEEE TCAD / simulation.
- **System and scale:** Binary and multibit networks on MNIST, CIFAR-10/100 and ImageNet; ReRAM crossbar accelerators.
- **Errors / mitigation:** E4, also E1 and IR drop; forward-parameter tuning (FPT) exploits activation statistics without gradient-based training or a dataset. Introduces effective fault rate (EFR).
- **Quantitative results / metrics:** Reports effectiveness up to 20% fault rate. No specific accuracy/overhead value was verified beyond this range claim. EFR seeks to predict application degradation better than raw faulty-cell fraction.
- **Relevance to Un-0:** **High** — motivates testing readout/statistical calibration as a low-cost baseline before model fine-tuning.
- **Read status:** **Partial** — indexed primary-paper first page/introduction; direct author PDFs returned 403/404. Detailed result curves not assessed.

### 16. Rasch et al. — comprehensive hardware-aware sensitivity sweeps

**Citation:** Malte J. Rasch, Charles Mackin, Manuel Le Gallo, An Chen, Andrea Fasoli, Frédéric Odermatt, Ning Li, S. R. Nandakumar, Pritish Narayanan, Hsinyu Tsai, Geoffrey W. Burr, Abu Sebastian and Vijay Narayanan. “Hardware-aware training for large-scale and diverse deep learning inference workloads using in-memory computing-based accelerators.” *Nature Communications* 14, 5282, 2023. [Published paper](https://www.nature.com/articles/s41467-023-40770-4); [manuscript](https://arxiv.org/html/2302.08469v1).

- **Year / venue / type:** 2023 / Nature Communications / simulation.
- **System and scale:** Eleven CNN/RNN/transformer workloads, ~0.3–108M parameters, 512×512 crossbar model.
- **Errors / mitigation:** E1, E3, E5 and stochastic analog noise; generic HWA training, clipping/scaling and drift compensation; not chip-specific fault-map retraining.
- **Quantitative results / metrics:** Five of eleven workloads achieve >99% normalized accuracy after one-hour drift; evaluation uses 24 inference repeats. Normalization measures retained performance above chance, not raw accuracy or chip yield. Input/output-path noise is especially damaging.
- **Relevance to Un-0:** **High** — strong precedent for individual-error sensitivity followed by combined nonideality evaluation and optional HWA retraining.
- **Read status:** **Partial** — model, metrics, tables and sensitivity conclusions in manuscript/published indexed text.

### 17. Park et al. — Monte Carlo yield and high-sigma estimation

**Citation:** Chanwoo Park, Hong Chul Nam, Jihun Park and Jongwook Jeon. “FlowSim: An Invertible Generative Network for Efficient Statistical Analysis under Process Variations.” *International Conference on Simulation of Semiconductor Processes and Devices (SISPAD)*, 157–160, 2023. [DOI](https://doi.org/10.23919/SISPAD57422.2023.10319551); [institutional abstract](https://pure.skku.edu/en/publications/flowsim-an-invertible-generative-network-for-efficient-statistica/).

- **Year / venue / type:** 2023 / SISPAD / simulation.
- **System and scale:** Semiconductor circuit/device statistical analysis under process/voltage/temperature variation; detailed benchmark sizes not verified from accessible abstract.
- **Errors / mitigation:** E1, with environmental variation adjacent to E3; normalizing-flow density estimation reduces statistical-analysis cost, rather than correcting neural computations.
- **Quantitative results / metrics:** Abstract claims >100× fewer simulations and <5% prediction error across reported circuit-performance statistical metrics. These are estimator benchmarks, not evidence of equivalent accuracy for an Un-0 yield estimator.
- **Relevance to Un-0:** **Med** — relevant if expensive per-chip quality measurements later motivate surrogate-assisted tail estimation.
- **Read status:** **Abstract-only** — institutional abstract verified; conference PDF retrieval unsuccessful.

### 18. Yu et al. — coding requires decorrelated feature errors

**Citation:** Anlan Yu, Ning Lyu, Jieming Yin, Zhiyuan Yan and Wujie Wen. “COLA: Orchestrating Error Coding and Learning for Robust Neural Network Inference Against Hardware Defects.” *40th International Conference on Machine Learning*, PMLR 202, 40277–40289, 2023. [Record](https://proceedings.mlr.press/v202/yu23a.html); [paper](https://proceedings.mlr.press/v202/yu23a/yu23a.pdf).

- **Year / venue / type:** 2023 / ICML / simulation.
- **System and scale:** LeNet-5, AlexNet, VGG16 and ResNet extensions; models span ~44K to ~41M parameters. Evaluates analog state deviations and digital bit errors.
- **Errors / mitigation:** E1/E2-like parameter deviations and E4-adjacent memory errors; error-correcting output codes, separated branches, weight orthogonalization and total-correlation regularization.
- **Quantitative results / metrics:** For ResNet-50/Tiny ImageNet at state-error parameter γ=0.2, ECOC accuracy is 18.22%, COLA 33.53% (appendix Table 6). Stronger codes alone need not improve robustness if errors remain correlated.
- **Relevance to Un-0:** **High** — close prior art for learned-feature coding; shared oscillator drift can violate the diversity assumptions behind redundancy.
- **Read status:** **Partial** — main motivation, architecture/complexity and appendix result tables.

### 19. Demirkiran et al. — redundant residues and low-precision readout

**Citation:** Cansu Demirkiran, Lakshmi Nair, Darius Bunandar and Ajay Joshi. “A blueprint for precise and fault-tolerant analog neural networks.” *Nature Communications* 15, 5098, 2024. [DOI](https://doi.org/10.1038/s41467-024-49324-8); [author PDF](https://bu-icsg.github.io/publications/2024/demirkiran-nature-2024.pdf).

- **Year / venue / type:** 2024 / Nature Communications / simulation.
- **System and scale:** Analog MVM with residue-number-system dataflow; MLPerf/LLM workloads and fault studies including ResNet-50 and BERT-Large.
- **Errors / mitigation:** E5 and stochastic analog-output errors; redundant residue number systems (RRNS), detection, correction and repeated attempts. Technology-agnostic proposal, not an oscillator-chip demonstration.
- **Quantitative results / metrics:** ≥99% of FP32 accuracy with 6-bit integer arithmetic for inference and 7-bit for training. With k redundant residues, conventional RRNS detects up to k erroneous residues and corrects floor(k/2). Reports output-error probability rather than manufacturing yield.
- **Relevance to Un-0:** **High** — phase/modulo arithmetic makes this conceptually relevant, but Un-0's learned nonlinear trajectories do not already implement residue arithmetic.
- **Read status:** **Partial** — PDF introduction, coding/readout framework and noise/error-probability sections.

### 20. Biswas et al. — joint quantization, fault and variability adaptation

**Citation:** Anmol Biswas, Raghav Singhal, Sivakumar Elangovan, Shreyas Sabnis and Udayan Ganguly. “Regularization-based Framework for Quantization-, Fault- and Variability-Aware Training.” *arXiv:2503.01297*, 2025. [Paper](https://arxiv.org/html/2503.01297v1).

- **Year / venue / type:** 2025 / arXiv preprint / simulation.
- **System and scale:** ResNet-18/CIFAR-10 and ImageNet; VGG/ResNet SNN extensions; 3-/4-bit weights and activations, with first/last-layer exceptions.
- **Errors / mitigation:** E1, E4, E5; regularization-based quantization and fault/variability-aware fine-tuning toward values physically representable under defects.
- **Quantitative results / metrics:** Studies up to 20% bit faults and resistance-state coefficient of variation σ/μ=0.4. ImageNet fault/variability adaptation uses 20 fine-tuning epochs. Fault-free CIFAR-10 4-bit ResNet-18 reaches 93.50% versus 93.26% FP reference; this does not establish that accuracy at maximum fault severity.
- **Relevance to Un-0:** **Med** — recent joint-error adaptation baseline, with an explicit need to preserve distinct fault and variability semantics.
- **Read status:** **Partial** — methods, evaluation setup and tables; preprint status retained.

### 21. Jeon et al. — redundant weight representation and per-chip compilation

**Citation:** Kang Eun Jeon, Sangheum Yeon, Jinhee Kim, Hyeonsu Bang, Johnny Rhe and Jong Hwan Ko. “Row-Column Hybrid Grouping for Fault-Resilient Multi-Bit Weight Representation on IMC Arrays.” *arXiv:2508.15685*, 2025. [Paper](https://arxiv.org/html/2508.15685v1).

- **Year / venue / type:** 2025 / arXiv preprint / simulation.
- **System and scale:** Bit-sliced ReRAM IMC; convolutional networks and small language models; comparisons discuss ResNet-18 (~12M) and VGG16 (~138M).
- **Errors / mitigation:** E4; redundant representations across rows/columns, fault-aware decomposition, integer-linear-program compilation. This is distinct from Xu's matrix-product method [25], despite overlapping “Fault-Free” terminology.
- **Quantitative results / metrics:** Reports up to 8 percentage points accuracy improvement, 150× compilation speedup and 2× energy efficiency against selected baselines. Illustrative R2C2 grouping has 0.01% inconsecutivity probability versus 3.49% for R1C4, but represents fewer levels.
- **Relevance to Un-0:** **High** — redundancy representation and offline chip-specific adaptation costs are both important comparisons.
- **Read status:** **Partial** — fault model, grouping mechanism, numerical examples and reported evaluation summary.

### 22. Hong et al. — adaptive ADC thresholds and paired readout

**Citation:** Haiqiao Hong, Zhiyuan Du, Mingrui Jiang, Ruibin Mao, Yuan Ren, Fuyi Li, Wei Mao, Muyuan Peng, Wei Zhang, Zhengwu Liu, Can Li and Ngai Wong. “Memristor-based adaptive analog-to-digital conversion for efficient and accurate compute-in-memory.” *Nature Communications* 16, 9749, 2025. [Paper](https://www.nature.com/articles/s41467-025-65233-w); [PMC copy](https://pmc.ncbi.nlm.nih.gov/articles/PMC12592462/).

- **Year / venue / type:** 2025 / Nature Communications / hardware demonstration, with circuit/system simulations.
- **System and scale:** 8×8 measured memristor array; adaptive quantization cells; VGG8/CIFAR-10 and ResNet-18/ImageNet evaluated with modified NeuroSim.
- **Errors / mitigation:** E1, E3, E5; data-aware thresholds, recalibration and paired ADCs whose disagreement identifies boundary-proximate inputs.
- **Quantitative results / metrics:** VGG8 reaches 89.55% at 5 bits under measured variation. ResNet-18 6-bit accuracy under variation improves 59.0%→65.5% with paired super-resolution readout. Reports ADC INL/DNL and 2.73 µS device-to-device standard deviation at 100–400 µS states. Network accuracies are simulated, not full-network silicon measurements.
- **Relevance to Un-0:** **High** — especially relevant to noisy/quantized final phase measurement and redundant readout.
- **Read status:** **Partial** — indexed primary article methods/results; direct publisher/PMC access intermittently blocked.

### 23. Büchel et al. — robust generation on noisy analog hardware models

**Citation:** Julian Büchel, Iason Chalas, Giovanni Acampa, An Chen, Omobayode Fagbohungbe, Hsinyu Tsai, Kaoutar El Maghraoui, Manuel Le Gallo, Abbas Rahimi and Abu Sebastian. “Analog Foundation Models.” *Advances in Neural Information Processing Systems* 38, 2025. [Proceedings](https://proceedings.neurips.cc/paper_files/paper/2025/hash/580baa016b012f8d3ea27b9ac758cee1-Abstract-Conference.html); [paper](https://proceedings.neurips.cc/paper_files/paper/2025/file/580baa016b012f8d3ea27b9ac758cee1-Paper-Conference.pdf).

- **Year / venue / type:** 2025 / NeurIPS / simulation.
- **System and scale:** Phi-3-mini-4k-instruct and Llama-3.2-1B-Instruct; billion-parameter language generators, not image generators.
- **Errors / mitigation:** E1/E2-like AIMC noise and E5 input/output quantization; hardware-aware adaptation using generated data and calibrated noise models.
- **Quantitative results / metrics:** Adaptation uses <1% of original pretraining-token counts; targets performance comparable to 4-bit weights/8-bit activations. Physical deployment is explicitly outside scope. Reports task performance and compute scaling rather than fault-density manufacturing yield.
- **Relevance to Un-0:** **Med** — generation under analog noise has precedent; this does not establish oscillator/image-generation or E4 fault tolerance.
- **Read status:** **Partial** — proceedings abstract, introduction, limitations and hardware-estimation appendix.

### 24. Tran et al. — analog neural-memory spare rows and columns, patent

**Citation:** Hieu Van Tran, Stanley Hong, Thuan Vu, Anh Ly, Hien Pham, Kha Nguyen and Han Tran; assignee Silicon Storage Technology Inc. “Redundant memory access for rows or columns containing faulty memory cells in analog neural memory in deep learning artificial neural network.” *European patent EP4206992B1*, published 12 February 2025; application publication EP4206992A1, 5 July 2023; family priority 11 July 2018. [Patent text](https://patents.google.com/patent/EP4206992B1/en).

- **Year / venue / type:** 2025 grant publication / European Patent Office / proposal.
- **System and scale:** Analog floating-gate neural-memory VMM arrays; conceptual 32×32 RGB, 5-bit input example. No fabricated accelerator scale verified.
- **Errors / mitigation:** E4; programmed redundancy latches disable bad rows/columns and enable replacements simultaneously during neural reads.
- **Quantitative results / metrics:** No measured yield improvement, accuracy or overhead benchmark identified. The 32×32/5-bit values describe an embodiment, not a result.
- **Relevance to Un-0:** **Med** — confirms spare remapping in analog neural computation as disclosed prior art; does not address coupled-state replacement.
- **Read status:** **Partial** — metadata and row/column-redundancy embodiments. No legal-status or freedom-to-operate conclusion drawn.

### 25. Xu et al. — matrix factorization around faulty analog devices

**Citation:** Zhicheng Xu, Jiawei Liu, Sitao Huang, Zefan Li, Shengbo Wang, Bo Wen, Ruibin Mao, Mingrui Jiang, Giacomo Pedretti, Jim Ignowski, Kaibin Huang and Can Li. “Fault-free analogue computing with imperfect hardware.” *Nature Electronics* 9, 811–824, 2026. [Published paper](https://www.nature.com/articles/s41928-026-01638-9); [2025 preprint](https://arxiv.org/html/2507.11134v1).

- **Year / venue / type:** 2026, preprint 2025 / Nature Electronics / hardware demonstration, with Monte Carlo simulation.
- **System and scale:** Multiple 64×64 TaOx arrays; represent target matrices as products of two adjustable matrices; additional compensation layers.
- **Errors / mitigation:** E1, E4; aging-related failures, E3-related selective reprogramming; fault-constrained factorization bypasses defective cells.
- **Quantitative results / metrics:** 64-point DFT simulation: >99.999% cosine similarity at 39% stuck-off faults, 8,192 devices, 50 random-location trials per rate. Physical demonstration uses an aged chip with ~5% stuck-off devices; do not call 39% a measured fabricated-chip yield result. Reports 56× communication BER reduction.
- **Relevance to Un-0:** **High** — strong modern comparator for representation-level redundancy; factorizing K would require preserving oscillator dynamics.
- **Read status:** **Partial** — preprint methods/results plus published metadata and extended-data descriptions.

### 26. Mannocci et al. — precision and correction taxonomy

**Citation:** Piergiulio Mannocci, Giacomo Larelli, Marco Bonomi and Daniele Ielmini. “Achieving high precision in analog in-memory computing systems.” *npj Unconventional Computing* 3, 1, 2026. [Paper](https://www.nature.com/articles/s44335-025-00044-2); [institutional record](https://re.public.polimi.it/handle/11311/1303767).

- **Year / venue / type:** 2026, published 7 January / npj Unconventional Computing / review.
- **System and scale:** Resistive AIMC primitives and systems; no single experimental scale or chip population.
- **Errors / mitigation:** E1–E5 analogues, including programming variability, drift, stuck cells, noise and converters; surveys bit slicing, residue representations, ECC and iterative refinement.
- **Quantitative results / metrics:** No new manufacturing-yield percentage established by this review. It distinguishes precision/cost tradeoffs and revisits experimental single-error analog ECC [6]; those primary results are not counted again as independent evidence. Bibliographic trap: “025” in the DOI and 2025 copyright do not make the publication year 2025.
- **Relevance to Un-0:** **High** — useful map of analog redundancy/correction approaches and their architectural assumptions.
- **Read status:** **Partial** — indexed main-text error/ECC sections and institutional metadata; publisher and repository PDF opens blocked.

## Gaps / open questions noted by the literature

1. **No directly matching Un-0 study identified.** The reviewed work establishes broad prior art for faults, averaging, ECC, feature redundancy, calibration and noise-aware training. It does not establish circular-mean protection of learned Kuramoto trajectories, dead/stuck oscillators in a class-conditional image generator, or a complete E1–E5 image-quality yield study. This is a bounded search finding, not proof of novelty.

2. **Averaging, coding and spare replacement solve different problems.** Committee machines [5] average separately perturbed network predictions; ReMeCo [13] averages intermediate features selectively. Analog ECC [6] depends on linear consistency checks; COLA [18] explicitly tackles correlated errors. An oscillator copy connected into the same dynamical network may perturb the computation itself. A useful distinction is independent complete-network replicas versus replicated state/feature units versus repeated final measurement. The benefit and cost of each remain unestablished here.

3. **Fault masks need physical semantics.** Measured memristor defects [2] include extreme and intermediate conductance errors; stuck-on and stuck-off fractions are unequal [13]. Remap-D [12] highlights clustering and new faults during use. For Un-0, disconnecting K, freezing a phase and allowing a stuck oscillator to continue driving neighbors are different E4 cases. The cited results cannot justify treating all three as independent zero-valued weight faults.

4. **Dropout-like training is an analogy with limits.** Bernoulli crashes [4] provide a mathematical connection, but the model's width, smoothness and small-failure assumptions matter. A mask refreshed per example/step differs from a permanent per-chip fault map. Dropout's utility as regularization does not establish robustness to stuck phases, saturated couplings or shared drift. A specific quantitative head-to-head claim for ordinary dropout versus fault-aware training was not verified in the accessible primary papers and is intentionally not supplied.

5. **Device yield, circuit yield and application yield must be reported separately.** Relevant definitions and examples are:

   | Metric | What is counted | Literature example / limitation |
   |---|---|---|
   | Device/programming yield | Devices meeting a conductance/programming requirement | 99.1% convergence in [7]; does not measure acceptable images per chip |
   | Structural yield | Arrays/columns with no defective cells | 0.99^512≈0.0058 in [3]; fault-tolerant computation can succeed despite structural defects |
   | Parametric yield | Random circuits jointly meeting explicit electrical specifications | Joint pass event in [8]; DNL threshold in [9] |
   | Application robustness | Accuracy, error or fidelity at a chosen severity | Accuracy curves [5, 16]; matrix cosine similarity [25]; not automatically a chip-pass fraction |
   | Application yield | Fraction of independently sampled chips meeting a fixed task-quality requirement | Appropriate synthesis for the project; a required image-quality threshold is not supplied by these classification papers |

   **Project implication (reviewer's synthesis):** define a chip-level quality statistic Q and a predetermined threshold, then estimate Y=P_chip(Q passes). Keep the number of chips separate from images/classes per chip and repeated readouts. Report the empirical distribution, low-quality quantiles, pass fraction and a binomial confidence interval; report calibration/retraining policy and redundancy cost alongside them. For FID-like distributional metrics, the sample count and estimator variability must also be separated from chip variability. These are proposed reporting requirements, not results of an experiment performed here.

6. **Rare-event yield claims are expensive to establish.** Analog yield work [8] explicitly uses much larger final validation populations than optimization populations. FlowSim [17] accelerates statistical estimation, but its abstract-level guarantees do not validate a surrogate for Un-0. Fifty Monte Carlo fault maps in [25] characterize fidelity variation; they cannot by themselves establish ppm-scale failure probabilities. Mean accuracy or a standard-error band can hide a low-yield tail.

7. **Nested randomness and common causes remain central.** HWA evaluation [16] distinguishes programming noise, elapsed drift and read noise. For this project, E1/E4 should persist within a sampled chip; E2/E5 vary within it; E3 can be shared among copies. Repeated reads do not create additional independent chips. Shared drift and correlated faults can limit redundancy gains even if independent jitter averages well. None of the reviewed studies establishes a universal redundancy scaling law for Un-0.

8. **Aging is not one shared scalar.** PCM work [7] separates global drift correction from heterogeneous residual drift; endurance introduces new E4 failures [12]; [25] combines fault adaptation with selective drift-related reprogramming. Oscillator temperature and aging models need corresponding physical calibration. A fixed common omega offset is one hypothesis, not a validated universal aging model.

9. **ADC bits alone do not define readout quality.** Rasch [16] finds input/output effects especially important; [9] uses a converter-linearity yield criterion; [22] studies threshold variation and redundant conversion. Phase wrapping, clipping/range, deterministic quantization, static measurement bias and fresh stochastic read noise merit distinct treatment. Re-reading a fixed biased or identically quantized phase does not guarantee improved precision. Whether the decoder benefits more from circular-mean estimates, calibrated quantization or noise-aware adaptation remains open.

10. **Comparison costs need more than replica count.** Papers account for redundant-cell/energy demand [3], selected-feature overhead [13], conversion time [14], or per-chip compilation [21]. Spares require detection and routing; coding requires decoding and usually extra representations; fine-tuning requires data and computation. Physical scale-out, coupled-copy interference, calibration cadence and preservation of class-conditional image diversity are not answered by classification-accuracy recovery alone.

11. **Evidence limits.** Most retained sources were partially read; one is abstract-only. Inaccessible supplements and paywalled result sections were not used to invent missing numbers. Patents are disclosures, not independent performance validation. Search also found company talks on PCM yield and theses that reproduce earlier work; they were not added as independent numerical results. No claim here establishes production yield, hardware feasibility, or legal clearance for the proposed oscillator design.
