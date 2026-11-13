# Kuramoto and learned-oscillator ML models

Search date: 2026-11-13; publication window searched: 2015–2026, emphasizing 2022–2026.
Kuramoto-based learning and generation already exist, including AKOrN, oscillator EqProp, OscNet, orientation diffusion, and Un-0.
The closest direct hardware-error precedent is training oscillator networks despite fixed natural-frequency dispersion (entry 5).
Earlier associative-memory simulations jointly examine frequency/coupling dispersion and stochastic forcing (entry 15).
AKOrN's adversarial and image-corruption results concern inputs, not fabrication mismatch or integration jitter (entry 3).
Stochastic orientation diffusion deliberately uses noise to generate samples; that is not evidence of hardware-noise tolerance (entry 4).
Un-0 reports solver and integration-time ablations, but the inspected releases do not establish an E1–E5 hardware-error benchmark (entries 1–2).
Mitigations already explored include synchronization-aware learning, stronger nudging, coupling adjustment, injection locking, and stable attractor design.
Circular means and paired oscillator networks appear in prior work, but their purposes differ from averaging redundant copies of learned Un-0 features.
No inspected work establishes the complete proposed combination of E1–E5 isolation, matched fixes, copy/ECC redundancy, and simulated-chip generative yield.
This is a bounded search finding, not a claim of proven novelty; partial reading and access limitations remain explicit below.

Taxonomy follows `notes/hardware-error-catalog.md`: E1 fixed chip-level parameter mismatch; E2 stochastic integration jitter; E3 shared slow parameter drift; E4 dead/stuck oscillators or broken couplings; E5 phase-readout noise. “None directly” means no matching hardware-error test was verified, not that the model is immune. Input corruption, initial-state perturbations, deliberate sparsity, and phase quantization are labeled separately. Missing numerical results are marked as unverified rather than inferred from plots.

Search coverage: live arXiv, publisher, NeurIPS/ICLR/ICCV/DATE, IEEE-Xplore-directed, Nature-family, thesis, company-blog, and patent searches. ISSCC/IEDM/VLSI-directed queries did not yield a verified in-scope RAID-style generative result. Citation trails included AKOrN → binding/orientation diffusion/OPL; Wang → Rageau → Gower; Kumar → 2015 spin-torque work; Heger → later oscillator memories. These are reference-list and title/citing-work trails, not an exhaustive citation-index export. Sources are primary papers, publisher pages, an author-institution repository, company releases, and a patent document. OscNet here means Cai/Lee's CMOS work, not the unrelated similarly named JAX library. Conference/preprint versions of one study are grouped rather than counted twice.

## Entries

### 1. Un-0: learned oscillator image generation

**Citation:** Unconventional AI. “Introducing Un-0: Generating Images with Coupled Oscillators.” Company technical release, 25 June 2026. [Article and appendix](https://unconventional.ws/blog/introducing-un-0-generating-images-with-coupled-oscillators/).

- **Year / venue / type:** 2026 / Unconventional AI technical blog / simulation.
- **System and scale:** Class-conditional Kuramoto population plus conditioning oscillators and conventional decoder; main pools of 1,024–16,384 oscillators; CIFAR-10 and ImageNet 64×64.
- **E1–E5:** None directly verified. Solver/time perturbations are numerical robustness, not E2 or E3.
- **Mitigation:** Learned frequencies/couplings; reference-relative sin/cos readout. No copy averaging or analog ECC reported.
- **Quantitative results:** CIFAR-10 FID 11.01 at 1,024 and 8.76 at 4,096 oscillators; ImageNet FID 6.74 at 16,384. Models trained with 10 integration steps show approximately 3% FID increase with finer/adaptive integration.
- **Relevance to Un-0:** **High** — the target model and essential baseline for separating solver sensitivity from physical errors.
- **Read status:** **partial** — architecture, results, ablations, and appendix inspected; no code executed. Energy-efficiency ambition is not a measured chip result.

### 2. Sparse and modular Un-0

**Citation:** Unconventional AI. “Less is More: Scaling Dynamics with Sparsity.” Company research article, 13 August 2026. [Article](https://www.unconventional.ws/blog/less-is-more-scaling-dynamics-with-sparsity/).

- **Year / venue / type:** 2026 / Unconventional AI technical blog / simulation.
- **System and scale:** Sparse/modular learned Kuramoto generators; CIFAR baseline has 1,024 main plus 8 conditioning oscillators and 1.22M parameters; ImageNet dense comparison has 6,657 total oscillators.
- **E1–E5:** No direct sweep. E4-adjacent connectivity removal occurs before training, not as post-training broken couplings.
- **Mitigation:** Fixed random sparsity or disconnected dense modules; architecture retrained under its mask.
- **Quantitative results:** Eliminates 50–98.4% of interactions across configurations. Reports ImageNet FID 7.15, about 1.9 better than its matched-size dense baseline. This is not the larger original model's FID-6.74 comparison.
- **Relevance to Un-0:** **High** — establishes sparse connectivity prior art and module-level feature interventions, but not redundant feature repair.
- **Read status:** **partial** — main results, mask definitions, and modular activation-patching discussion inspected.

### 3. Artificial Kuramoto Oscillatory Neurons (AKOrN)

**Citation:** Takeru Miyato, Sindy Löwe, Andreas Geiger, Max Welling. “Artificial Kuramoto Oscillatory Neurons.” ICLR, 2025; arXiv:2410.13821, 2024. [Paper](https://arxiv.org/html/2410.13821v2); [conference version](https://proceedings.iclr.cc/paper_files/paper/2025/file/6d892051f91812700f427250e95e04f5-Paper-Conference.pdf).

- **Year / venue / type:** 2025 (preprint 2024) / ICLR / simulation.
- **System and scale:** Hyperspherical generalized Kuramoto neurons with convolutional/attentive connectivity; CIFAR-10 model has three Kuramoto layers; additional object-discovery and Sudoku models.
- **E1–E5:** None directly. Tests adversarial/common image corruption and randomized initial states.
- **Mitigation:** Synchronization dynamics, regularization, and energy-based voting for reasoning; voting is over initializations, not damaged-chip phase-copy averaging.
- **Quantitative results:** Table 4: convolutional model 88.91% clean, 58.91% AutoAttack/EoT accuracy at ℓ∞=8/255, 83.0% common-corruption accuracy, ECE 1.3%. Mixed model: 91.23%, 51.56%, 86.4%, ECE 1.4% respectively.
- **Relevance to Un-0:** **High** — learned oscillator ML and robustness precedent; hardware-error claims require separate evidence.
- **Read status:** **partial** — model, robustness tables, reasoning/voting, and selected appendices inspected.

### 4. Kuramoto Orientation Diffusion Models

**Citation:** Yue Song, T. Anderson Keller, Sevan Brodjian, Takeru Miyato, Yisong Yue, Pietro Perona, Max Welling. “Kuramoto Orientation Diffusion Models.” NeurIPS 38, 2025. [Paper](https://arxiv.org/html/2509.15328v1); [proceedings](https://proceedings.neurips.cc/paper_files/paper/2025/hash/062649fadaed89b5bcdc74359db8a35b-Abstract-Conference.html).

- **Year / venue / type:** 2025 / NeurIPS / simulation.
- **System and scale:** Pixel/channel values mapped to circular phase variables; local/global stochastic coupling; learned periodic score network; 100–1,000 reverse steps in reported orientation-data comparisons.
- **E1–E5:** E2-like mathematical noise appears intentionally in the generative SDE; no hardware-jitter robustness evaluation verified. No E1/E3/E4/E5 test verified.
- **Mitigation:** Wrapped Gaussian transitions, periodic embeddings, structured synchronization prior.
- **Quantitative results:** At 1,000 steps, local model FID 18.75 versus baseline 23.84 on SOCOFing; 14.19 versus 20.37 on Brodatz. At 100 steps, SOCOFing FID 67.49 versus 104.92.
- **Relevance to Un-0:** **High** — direct Kuramoto image-generation prior art, but a different reverse-SDE architecture.
- **Read status:** **partial** — SDE formulation, methods, tables, and natural-image limitation discussion inspected.

### 5. Training and synchronizing oscillator networks with EqProp — verified seed

**Citation:** Théophile Rageau, Julie Grollier. “Training and synchronizing oscillator networks with Equilibrium Propagation.” *Neuromorphic Computing and Engineering* 5(3), 034008, 2025. [DOI](https://doi.org/10.1088/2634-4386/adebaa); [readable preprint](https://arxiv.org/html/2504.11884v1).

- **Year / venue / type:** 2025 / Neuromorphic Computing and Engineering / simulation.
- **System and scale:** 784–500–10 layered phase oscillators, also amplitude–phase oscillators; full MNIST.
- **E1–E5:** **E1 directly:** Gaussian fixed natural-frequency dispersion. Imperfect synchronization produces dynamical fluctuations, not a separately injected E2 process. No E3–E5 verified.
- **Mitigation:** EqProp learns couplings that promote synchronization; larger nudging β distinguishes learning signal from unsynchronized activity.
- **Quantitative results:** Identical-frequency accuracy 97.77±0.08% over five runs; 96–97% at approximately 5–10% dispersion; text reports >95% at 10–15%. Amplitude–phase model: 96.85±0.16%.
- **Relevance to Un-0:** **High** — closest verified training-under-frequency-mismatch precedent; not a pretrained generator or copy-redundancy study.
- **Read status:** **partial** — main derivation, synchronization/dispersion results, architecture, and selected appendices inspected. Seed 2504.11884 confirmed.

### 6. Coupled phase oscillators trained with equilibrium propagation

**Citation:** Qingshan Wang, Clara C. Wanjura, Florian Marquardt. “Training coupled phase oscillators as a neuromorphic platform using equilibrium propagation.” *Neuromorphic Computing and Engineering* 4, 034014, 2024. [DOI](https://doi.org/10.1088/2634-4386/ad752b); [preprint](https://arxiv.org/html/2402.08579v1).

- **Year / venue / type:** 2024 / Neuromorphic Computing and Engineering / simulation.
- **System and scale:** XY/Kuramoto networks; five-unit XOR; handwritten-digit study uses the small 8×8 digits benchmark, not full 28×28 MNIST; up to 300 hidden units.
- **E1–E5:** None directly verified; random initialization and multistability are central.
- **Mitigation:** Multiple initial configurations, suitable cost function, and preparation procedures to manage competing equilibria.
- **Quantitative results:** Best layered accuracy 94.1% with 200 hidden units and 15,220 parameters; all-to-all 93.3% with 11 hidden units/1,596 parameters. Matched layered ANN: 95.0%.
- **Relevance to Un-0:** **High** — explains attractor/initialization pitfalls when learning physical oscillator dynamics; does not establish frequency-dispersion tolerance.
- **Read status:** **partial** — learning framework, XOR and digit results, benchmark table inspected; publisher access restricted, preprint used.

### 7. EqProp on oscillator Ising machines

**Citation:** Alex Gower. “How to Train an Oscillator Ising Machine using Equilibrium Propagation.” arXiv:2505.02103, 2025. [Paper](https://arxiv.org/html/2505.02103v1). Related workshop version: “Learning at the Speed of Physics: Equilibrium Propagation on Oscillator Ising Machines,” NeurIPS Machine Learning and the Physical Sciences workshop, 2025. [Workshop paper](https://ml4physicalsciences.github.io/2025/files/NeurIPS_ML4PS_2025_153.pdf).

- **Year / venue / type:** 2025 / arXiv; NeurIPS workshop / simulation.
- **System and scale:** SHIL/field-driven phase oscillators; 784–500–10 and 784–120–10 networks.
- **E1–E5:** **E2:** Gaussian phase noise; **E5-adjacent:** phase-detection quantization. Parameter quantization is not random E1 mismatch. Frequency calibration assumed; no E3/E4 sweep verified.
- **Mitigation:** Optimize nudging β; calibrated VCO frequencies; sufficient phase/parameter precision.
- **Quantitative results:** Full MNIST 97.2±0.1%, Fashion-MNIST 88.0±0.1%; reduced MNIST/100 task peaks at 92.0±0.3% at ξ=0.2. Reports 4-bit phase and 10-bit parameter tolerance on reduced task.
- **Relevance to Un-0:** **High** — direct internal-noise mitigation evidence, with equilibrium rather than finite-time generation.
- **Read status:** **partial** — preprint dynamics and workshop methods/results inspected. Versions grouped as one study.

### 8. OscNet: Machine Learning on CMOS Oscillator Networks

**Citation:** Wenxiao Cai, Thomas H. Lee. “OscNet: Machine Learning on CMOS Oscillator Networks.” arXiv:2502.07192, 2025. [Paper](https://arxiv.org/html/2502.07192v1).

- **Year / venue / type:** 2025 / arXiv / simulation.
- **System and scale:** CMOS-inspired phase/Potts networks and MIMO connections; MNIST feature layers with 10, 16, 64, or 128 hidden neurons.
- **E1–E5:** None directly verified; master-pump locking and phase coding are architectural features, not measured hardware-error fixes.
- **Mitigation:** Hebbian/forward-only learning and injection-locking formulation; no copy/ECC correction tested.
- **Quantitative results:** Table 1 unsupervised accuracy 57.31%, compared with 13.77%/28.72% for listed one-/two-layer autoencoders. With supervised linear readout: 77.47% at 10 hidden neurons and 91.33% at 128. OscNet K-means: 60.84%, versus 59.46% conventional K-means.
- **Relevance to Un-0:** **Medium** — learned phase dynamics and CMOS mapping, but classification rather than generation.
- **Read status:** **partial** — architecture, simulation description, and result tables inspected. “Experimental” ML results do not establish fabricated-chip measurements.

### 9. OscNet v1.5

**Citation:** Wenxiao Cai, Zongru Li, Iris Wang, Yu-Neng Wang, Thomas H. Lee. “OscNet v1.5: Energy Efficient Hopfield Network on CMOS Oscillators for Image Classification.” *IEEE/CVF ICCV Workshops*, pp. 4792–4800, 2025. [Proceedings](https://openaccess.thecvf.com/content/ICCV2025W/HCV/html/Cai_OscNet_v1.5_Energy_Efficient_Hopfield_Network_on_CMOS_Oscillators_for_ICCVW_2025_paper.html); [readable arXiv v2, alternate title](https://arxiv.org/html/2506.12610v2).

- **Year / venue / type:** 2025 / ICCV Workshops / simulation.
- **System and scale:** Learned sparse Hopfield representations; Kuramoto/SHIL inference with 784 pixel nodes and pairwise elimination.
- **E1–E5:** None directly; noisy input reconstruction and planned sparsity are not E2/E4 hardware injections.
- **Mitigation:** Sparse learned connections, normalization, attractor retrieval.
- **Quantitative results:** Conference abstract reports 24% of full connections with 0.1% accuracy reduction. ArXiv v2 Table 1 reports 97.40% with its representation versus 96.83% raw-image classifier at 128 hidden units; these feature-classifier results are distinct from oscillator retrieval accuracy.
- **Relevance to Un-0:** **Medium** — connectivity economy and oscillator classification baseline; no chip-yield or redundant-copy evidence.
- **Read status:** **partial** — proceedings metadata and arXiv v2 methods/results inspected; version/title difference retained.

### 10. Binding threshold and oscillatory neurons

**Citation:** Vladimir Fanaskov, Ivan Oseledets. “Binding threshold units with artificial oscillatory neurons.” arXiv:2505.03648, 2025. [Paper](https://arxiv.org/html/2505.03648v1).

- **Year / venue / type:** 2025 / arXiv / theory.
- **System and scale:** Hybrid Hopfield–generalized-Kuramoto memory; approximately 1.2M-parameter Hopfield base; sparse oscillator subnetworks with rotating dimensions 4 or 6.
- **E1–E5:** None directly; task relabeling and dynamical convergence rather than physical error sweeps.
- **Mitigation:** Lyapunov-compatible coupling and time-dependent low-rank weight corrections; not analog ECC.
- **Quantitative results:** Original MNIST base accuracy 97.2%; label-swap accuracy falls to 76.3% before adaptation; Table 2 hybrid with k=350, D=4 reaches 96.8% on swap and 97.1% on conflation.
- **Relevance to Un-0:** **Medium** — mathematical constraints for hybrid oscillator/standard-neuron learning and stability; no transferable hardware tolerance guarantee.
- **Read status:** **partial** — energy/coupling construction, numerical protocol, tables, and selected implementation appendix inspected; proofs not fully checked.

### 11. Oscillatory Predictive Learning (OPL)

**Citation:** Mohammed-Yassine Habibi, Klea Ziu, Martin Takáč, Makoto Yamada. “Neither Adversarial Training Nor Purification: Emergent Adversarial Robustness from Oscillatory Predictive Learning.” arXiv:2609.08683, 2026. [Paper](https://arxiv.org/html/2609.08683v1).

- **Year / venue / type:** 2026 / arXiv / simulation.
- **System and scale:** AKOrN plus X-PhiNet predictive self-supervised pretraining; CIFAR-10/100 and CIFAR-10-C; randomized oscillator initialization. Total oscillator count not extracted.
- **E1–E5:** None directly; evaluates input attacks/corruptions.
- **Mitigation:** Predictive pretraining plus oscillatory architecture; adaptive attacks account for initialization randomness.
- **Quantitative results:** AutoAttack-rand/EoT K=20 at ℓ∞=8/255: 76.63±0.76% CIFAR-10 and 50.44% CIFAR-100 robust accuracy. PGD-100/EoT K=5 gives 76.10% on CIFAR-10; that table reports clean accuracy 86.81%.
- **Relevance to Un-0:** **Medium** — forward citation trail from AKOrN; evidence for representation robustness, not hardware-error correction.
- **Read status:** **partial** — abstract, model description, attack tables and diagnostics inspected; preprint claims not independently reproduced.

### 12. Kuramoto attention and circular means

**Citation:** Joshua Nunley. “Kuramoto Attention: Synchronizing Self-Attention on the Torus.” arXiv:2606.11585, 2026. [Paper](https://arxiv.org/html/2606.11585v1).

- **Year / venue / type:** 2026 / arXiv / simulation.
- **System and scale:** Phase-valued self-attention, adaptive Kuramoto coupling; approximately 1M/5M-parameter language models; enwiki8; five seeds.
- **E1–E5:** None directly. Positional phase drift is designed encoding, not E3 temperature drift.
- **Mitigation:** Attention-weighted circular mean, geometry-preserving update bounds; used for token aggregation rather than redundant hardware copies.
- **Quantitative results:** Validation BPC at 1M: 1.637±0.010 versus matched transformer 1.616±0.004. At 5M: mean 1.468 versus 1.456; median 1.448 versus 1.452. Replacing circular mean with learned value projection costs +0.25±0.07 BPC in its ablation.
- **Relevance to Un-0:** **Medium** — establishes explicit circular-mean learned-oscillator computation; does not anticipate the exact fault-repair application.
- **Read status:** **partial** — equations, numerical tables, ablations and limitations inspected.

### 13. Active oscillatory associative memory

**Citation:** Matthew Du, Agnish Kumar Behera, Suriyanarayanan Vaikuntanathan. “Active oscillatory associative memory.” *Journal of Chemical Physics* 160(5), 055103, 2024; preprint 2023. [DOI](https://doi.org/10.1063/5.0171983); [paper](https://arxiv.org/html/2307.13123v1).

- **Year / venue / type:** 2024 / Journal of Chemical Physics / simulation.
- **System and scale:** Generalized Kuramoto/Hopfield phase memory; N=200, averaged over 16 pattern sets and 8 initial configurations.
- **E1–E5:** **E2:** additive white and temporally correlated Ornstein–Uhlenbeck forcing; no E1/E3–E5 test verified.
- **Mitigation:** Nonlinear stability-enhancing couplings; active noise changes the effective energy landscape.
- **Quantitative results:** Initial phase-noise σ=0.1 gives overlap approximately 0.995; retrieval defined by final overlap >0.8. Compares passive limit τ→0 with active τ=1 and nonlinear strengths ε=0 versus 1; correlated forcing enlarges the retrieval region. No single universal improvement percentage tabulated.
- **Relevance to Un-0:** **High** — warns that temporal correlation and nonlinear interactions change noise response; “all jitter is harmful” is not general.
- **Read status:** **partial** — model, simulation parameters/phase diagrams, and effective-energy argument inspected.

### 14. Cross-frequency coupling increases memory capacity

**Citation:** Connor Bybee, Alexander Belsten, Friedrich T. Sommer. “Cross-Frequency Coupling Increases Memory Capacity in Oscillatory Neural Networks.” COSYNE presentation / arXiv:2204.07163, 2022. [Paper](https://arxiv.org/html/2204.07163v1).

- **Year / venue / type:** 2022 / COSYNE; arXiv / simulation.
- **System and scale:** Q-state phasor associative memory and subharmonic injection locking; capacity simulations use N=1,024 units.
- **E1–E5:** **E2-like:** additive white noise appears in an illustrative coupled-population simulation; primary analysis concerns capacity/retrieval, not a calibrated hardware-noise sweep. E1/E3–E5 not verified.
- **Mitigation:** External harmonic locking stabilizes discrete phase states; sparse-connectivity trade-offs studied.
- **Quantitative results:** Q=3 gives optimal storage in the reported capacity/information comparison. Without cross-frequency coupling the state drifts from a stored pattern; with it the model converges. Capacity plotted, no unsupported numerical value transcribed.
- **Relevance to Un-0:** **Medium** — attractor stabilization prior art; discretizing phases can conflict with a continuous generative latent.
- **Read status:** **full** — short text and figure captions read; plotted values not digitized.

### 15. Micromechanical oscillator memory: mismatch and stochasticity

**Citation:** Ankit Kumar, Pritiraj Mohanty. “Autoassociative Memory and Pattern Recognition in Micromechanical Oscillator Network.” *Scientific Reports* 7, 411, 2017. [Paper](https://pmc.ncbi.nlm.nih.gov/articles/PMC5428492/); [DOI](https://doi.org/10.1038/s41598-017-00442-y).

- **Year / venue / type:** 2017 / Scientific Reports / simulation.
- **System and scale:** 96 all-to-all coupled self-sustained mechanical oscillators; amplitude and phase dynamics; pseudoinverse pattern couplings.
- **E1–E5:** **E1:** frequency/coupling dispersion; **E2:** white stochastic forcing. E3–E5 not verified.
- **Mitigation:** Attractor-based retrieval; frequency trimming proposed, not demonstrated; stronger coupling does not universally repair detuning.
- **Quantitative results:** Frequency draws span [1−δ,1+δ]; significant retrieval degradation at δ=10⁻³. Coupling dispersion remains reasonably stable up to σ=3.3×10⁻³. Dispersion curves average 100 independent simulations then 100 time steps.
- **Relevance to Un-0:** **High** — earlier joint hardware-imperfection sensitivity study, although small binary memory rather than learned generation.
- **Read status:** **partial** — main model, dispersion/noise results and conclusion read; supplementary information not fully read.

### 16. Spintronic oscillator reservoir computing

**Citation:** Jacob Torrejon, Mathieu Riou, Flavio Abreu Araujo, Sumito Tsunegi, Guru Khalsa, Damien Querlioz, Paolo Bortolotti, Vincent Cros, Kay Yakushiji, Akio Fukushima, Hitoshi Kubota, Shinji Yuasa, Mark D. Stiles, Julie Grollier. “Neuromorphic computing with nanoscale spintronic oscillators.” *Nature* 547, 428–431, 2017. [Paper](https://pmc.ncbi.nlm.nih.gov/articles/PMC5575904/).

- **Year / venue / type:** 2017 / Nature / hardware demonstration.
- **System and scale:** One physical spin-torque nano-oscillator, time-multiplexed reservoir; spoken-digit and waveform recognition.
- **E1–E5:** **E2-related:** experimentally examines performance dependence on intrinsic oscillation noise; E5 amplitude-detection chain exists but no isolated phase-readout-noise test verified. No E1/E3/E4 sweep verified.
- **Mitigation:** Select operating current/field for useful nonlinearity, memory and signal-to-noise; trained readout and cochlear preprocessing.
- **Quantitative results:** Up to 99.6% spoken-digit recognition with cochlear filtering; error reduction up to 15× relative to its control.
- **Relevance to Un-0:** **Medium** — establishes hardware oscillator computation despite noise; single-device reservoir cannot establish array yield.
- **Read status:** **partial** — device, recognition results, noise/operating-regime discussion inspected.

### 17. Robust Kuramoto autoassociative memory (MONACO)

**Citation:** Daniel Heger, Katharina Krischer. “Robust autoassociative memory with coupled networks of Kuramoto-type oscillators.” *Physical Review E* 94, 022309, 2016. [DOI](https://doi.org/10.1103/PhysRevE.94.022309); [paper](https://arxiv.org/html/1604.02085v1).

- **Year / venue / type:** 2016 / Physical Review E / theory.
- **System and scale:** Two mirrored oscillator networks with global coupling; examples use 49 or 52 oscillator pairs storing three binary patterns.
- **E1–E5:** None directly quantified. Authors explicitly leave robustness to frequency deviations/noise open. Initial erroneous pixels are not dead devices.
- **Mitigation:** Isolated attractors and analytical basin-of-attraction bounds; paired networks generate coupling modulation internally, not redundant-copy averaging.
- **Quantitative results:** N=49, M=3 example guarantees recognition for fewer than 6.25 erroneous pixels under its sufficient criterion. Reported random-error tests have 0% failure at 6–11 errors and 5.6% at 16; 300 trials per pattern/error count.
- **Relevance to Un-0:** **High** — important paired-oscillator/robustness prior art, with a clear distinction between basin correction and hardware-error correction.
- **Read status:** **partial** — architecture, criteria, simulation tables, and explicit open questions read; proofs not fully checked.

### 18. Robust dual-pillar spin-torque associative computing

**Citation:** Mrigank Sharad, Deliang Fan, Kaushik Roy. “Energy-Efficient and Robust Associative Computing With Injection-Locked Dual-Pillar Spin-Torque Oscillators.” *IEEE Transactions on Magnetics* 51(7), article 7017509, 2015. [DOI](https://doi.org/10.1109/TMAG.2015.2394379); [institutional abstract](https://asu.elsevierpure.com/en/publications/energy-efficient-and-robust-associative-computing-with-injection-/).

- **Year / venue / type:** 2015 / IEEE Transactions on Magnetics / simulation.
- **System and scale:** Dual-pillar STO arrays; separate low-resistance injection and high-resistance sensing terminals. Array size not confirmed from accessible abstract.
- **E1–E5:** **E1/E2:** parameter variation and noise motivate injection locking; E3–E5 not verified as isolated tests.
- **Mitigation:** Strong common AC injection for noise/variation-tolerant locking, conditional unlocking for recognition.
- **Quantitative results:** No tolerance percentage or task accuracy verified in accessible abstract. Two terminals serve separate injection/readout functions; this is not duplication of the learned feature. Do not transfer numbers from differently titled 2013 arXiv:1309.3306 with a different author list.
- **Relevance to Un-0:** **Medium** — early robustness-by-locking precedent, not a generative redundancy result.
- **Read status:** **abstract-only** — institution-hosted citation/abstract confirmed; numerical full-text evidence unavailable in this pass.

### 19. Learning algorithms for oscillator associative memory

**Citation:** Manuel Jiménez, María J. Avedillo, Bernabé Linares-Barranco, Juan Núñez. “Learning algorithms for oscillatory neural networks as associative memory for pattern recognition.” *Frontiers in Neuroscience* 17, 1257611, 2023. [Paper](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2023.1257611/full).

- **Year / venue / type:** 2023 / Frontiers in Neuroscience / simulation.
- **System and scale:** Phase-coded ONN memory; 12×8 binary-character patterns, ten stored targets; low-precision weights.
- **E1–E5:** No direct E1–E5 injection verified. Limited weight precision is E1-adjacent representational error; “noise robustness” mainly means corrupted input pixels.
- **Mitigation:** Iterative Random Partial Update Symmetric Hebbian (IRPUSH) learning; partial updates improve low-bit solutions.
- **Quantitative results:** Three-bit weights with 33% partial update reach 90.9% retrieval accuracy versus approximately 72% best without partial updates. Maximum noisy-pixel count compatible with >95% accuracy increases from 7 to 27.
- **Relevance to Un-0:** **Medium** — shows learned coupling rules can improve precision tolerance; input denoising must not be labeled hardware-jitter correction.
- **Read status:** **partial** — algorithm overview, precision/retrieval tables and discussion inspected.

### 20. Circuit-aware ONN design using machine learning

**Citation:** Tamás Rudner, Wolfgang Porod, Gyorgy Csaba. “Design of oscillatory neural networks by machine learning.” *Frontiers in Neuroscience* 18, 1307525, 2024. [Paper](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2024.1307525/full).

- **Year / venue / type:** 2024 / Frontiers in Neuroscience / simulation.
- **System and scale:** Differentiable ring-oscillator circuit ODEs; BPTT learns resistive coupling; hybrid oscillator/MLP classifiers. Augmented classifier has 16,325 trainable parameters.
- **E1–E5:** None directly verified in inspected sections; circuit realism alone is not a mismatch/drift/fault sweep.
- **Mitigation:** Learn couplings in the circuit model; conventional readout improves multiclass discrimination.
- **Quantitative results:** Table 2 augmented multiclass classifier averages 95.1% (range 93–97%) versus matched perceptron 94.4% (93–95%); pure winner-takes-all oscillator classifier 66.7% (65–70%). Binary classifiers report 98% worst case.
- **Relevance to Un-0:** **High** — precedent for differentiating through oscillator dynamics and assessing decoder/readout contribution.
- **Read status:** **partial** — model/training and architecture comparisons read. Energy numbers are estimates, not measured fabricated-system efficiency.

### 21. ClassONN

**Citation:** Filip Sabo, Aida Todri-Sanial. “ClassONN: Classification with Oscillatory Neural Networks using the Kuramoto Model.” *Design, Automation & Test in Europe (DATE), Late Breaking Results*, 2024. [Two-page paper](https://past.date-conference.com/proceedings-archive/2024/DATA/10014_pdf_upload.pdf).

- **Year / venue / type:** 2024 / DATE Late Breaking Results / simulation.
- **System and scale:** Kuramoto associative-memory classifier; binarized MNIST images with ten class-average target patterns and their inverses; pixel-wise oscillator encoding.
- **E1–E5:** None directly. Corrupted binary images and spurious final pixels concern classification/retrieval, not an E1–E5 device model.
- **Mitigation:** Diederich–Opper II training, class prototypes, Hamming-distance classification against targets and inverses.
- **Quantitative results:** 69.81% training and 71.88% test classification accuracy. The study uses confidence histograms to check convergence to targets, showing that attractor convergence and correct labeling are different metrics.
- **Relevance to Un-0:** **Medium** — relevant conference-side ML baseline and caution against judging robustness only by synchronization or convergence.
- **Read status:** **full** — two-page text, methods, results and captions read; no numerical values inferred from confusion-map colors.

### 22. Multifrequency ONNs and mismatch compensation

**Citation:** Nil Dinç, Filip Sabo, Aida Todri-Sanial. “Harnessing Phase Dynamics Across Diverse Frequencies with Multifrequency Oscillatory Neural Networks.” *Advanced Intelligent Discovery* 2, e202500152; first published 26 December 2025 (publisher issue metadata also displays 2026). [Paper](https://doi.org/10.1002/aidi.202500152).

- **Year / venue / type:** 2025 online / Advanced Intelligent Discovery / hardware demonstration.
- **System and scale:** Four breadboard Wien-bridge oscillators; additional simulation with 784 oscillators and ten memorized MNIST images.
- **E1–E5:** **E1 directly:** frequency mismatch. No isolated E2–E5 sweep verified.
- **Mitigation:** Coupling-strength scaling selected from frequencies/weights or preliminary ODE analysis to restore locking.
- **Quantitative results:** Breadboard loses locking at approximately 200 Hz detuning (13.4 versus 13.2 kHz), described by authors as approximately 2%. Software tests use 500 kHz mean, author-described frequency “variances” of 10–100%, and 50% initially noisy pixels; unscaled retrieval deteriorates around 50% spread. Do not reinterpret that ambiguous “variance” as a calibrated standard deviation.
- **Relevance to Un-0:** **High** — direct alternative mismatch mitigation; scaling all couplings may alter a generator's learned finite-time map.
- **Read status:** **partial** — hardware setup, software method/results and limitations inspected; supplementary material not read.

### 23. Exponential-capacity oscillator memory

**Citation:** Arie Ogranovich, Taosha Guo, Arvind R. Venkatakrishnan, Madelyn Shapiro, Francesco Bullo, Fabio Pasqualetti. “Oscillator-Based Associative Memory with Exponential Capacity: Theory, Algorithms, and Hardware Implementation.” arXiv:2604.01469, 2026; submitted to *IEEE Transactions on Control of Network Systems*. [Paper](https://arxiv.org/html/2604.01469v1).

- **Year / venue / type:** 2026 / arXiv, journal submission / theory.
- **System and scale:** Honeycomb/chained-cycle Kuramoto network; charge-density-wave circuit simulation includes two five-oscillator cycles sharing a node.
- **E1–E5:** Initial phase perturbation bounds, not continuous E2 forcing or terminal E5 noise; no E1/E3/E4 sweep verified.
- **Mitigation:** Topology and stable phase-locked configurations with size-independent minimum basins.
- **Quantitative results:** Stable configuration count `(2 ceil(n_c/4) − 1)^m` for m cycles of size n_c. Two-cycle/five-node-per-cycle circuit example reproduces ±2π/5 phase spacing. “Hardware implementation” section reports numerical circuit simulation, not a measured prototype.
- **Relevance to Un-0:** **Medium** — encoded attractor correction and scaling theory, not arbitrary learned-image manifold redundancy.
- **Read status:** **partial** — theorem statements, topology, circuit-validation section and conclusion inspected; proofs not fully checked.

### 24. Variance-Aware Noisy Training — verified but adjacent seed

**Citation:** Xiao Wang, Hendrik Borras, Bernhard Klein, Holger Fröning. “Variance-Aware Noisy Training: Hardening DNNs against Unstable Analog Computations.” arXiv:2503.16183, 2025, v2 September 2025. [Paper](https://arxiv.org/html/2503.16183v2).

- **Year / venue / type:** 2025 / arXiv / simulation.
- **System and scale:** Conventional LeNet-5 and ResNet-18/50; CIFAR-10, CINIC-10, Tiny ImageNet; **not a Kuramoto or oscillator model**.
- **E1–E5:** E2-analogous additive activation noise. Variation in noise amplitude across devices/time is studied; this is not E1 fixed parameter offsets or E3 common signed frequency drift. E4/E5 not isolated.
- **Mitigation:** Randomize noise standard deviation during training rather than train at one fixed level.
- **Quantitative results:** Relative area-under-accuracy-curve (rAUC), **not classification accuracy**, increases 79.3→97.6% on CIFAR-10 and 32.4→99.7% on Tiny ImageNet. Evaluation σ spans 0.1–3.0 in activation units, not oscillator radians.
- **Relevance to Un-0:** **Medium** — useful noisy-fine-tuning control, but no oscillator-specific prior-art claim follows.
- **Read status:** **partial** — setup, noise placement, rAUC definition and training schedule inspected. Seed title/scope mismatch explicitly resolved.

### 25. Patent: oscillator neural learning with an averaging circuit

**Citation:** Dmitri Nikonov, Ian Young (inventors); Intel Corporation (assignee). “Oscillator based neural network apparatus.” US patent US12020144B2, granted/published 25 June 2024; priority 23 September 2019; application publication US20210089876A1, 25 March 2021. [Patent text](https://patents.google.com/patent/US12020144B2/en).

- **Year / venue / type:** 2024 grant (2021 application publication) / US patent / proposal.
- **System and scale:** Oscillators encode input/weight differences; a shared-frequency averager and per-oscillator phase/frequency detectors update weights. General M-channel circuit; no measured array scale confirmed.
- **E1–E5:** E2-related qualitative claim that frequency encoding resists noise/jitter better than pulse timing; no isolated E1–E5 benchmark verified.
- **Mitigation:** Synchronization/average-frequency feedback for unsupervised learning. The averaging node is not circular averaging of independently damaged copies of one learned feature.
- **Quantitative results:** No measured accuracy, noise threshold, or yield percentage verified; patent specifies analog and digital-weight embodiments, not numerical robustness evidence.
- **Relevance to Un-0:** **Medium** — relevant averaging/oscillator-learning prior art to distinguish in a novelty search; not a legal scope opinion.
- **Read status:** **partial** — metadata, abstract, detailed averaging/learning description and selected claims inspected.

## Gaps / open questions noted by the literature

1. **Input robustness versus internal error robustness.** AKOrN, OPL, ClassONN, and much associative-memory work test damaged inputs or initial states. These results cannot substitute for fixed-chip ω/K/K_drive perturbations or fresh stochastic forcing throughout integration. Entries 3–4, 11, 19 and 21 identify the distinction and source each result.

2. **Direct manufacturing-mismatch prior art is substantial.** Rageau–Grollier train despite frequency dispersion; Kumar–Mohanty quantify both frequency/coupling spread and noise; Dinç et al. compensate mismatch using coupling adjustment (entries 5, 15, 22). Therefore “first robustness study of Kuramoto ML under analog imperfections” would be too broad. The remaining question is transfer to a pretrained, finite-time, class-conditional image generator and its learned drive matrix.

3. **The proposed complete pipeline was not located.** No inspected work benchmarks circular-mean averaging of redundant Un-0 oscillator copies, analog ECC over its learned latent features, each E1–E5 alone with matched mitigation, then mixed-error quality distributions over simulated chips. That specific conjunction is a plausible research gap, not a certified priority claim. Patent coverage and full citation-index coverage are incomplete.

4. **Redundancy is not automatically error correction.** MONACO's two subnetworks compute coupling modulation (entry 17); Nunley's circular mean aggregates tokens (entry 12); the Intel patent averages frequency for learning (entry 25). None provides the requested demonstrated copy-redundancy fix. Attractor-based binary memories do correct corrupted cues, so a claim of “first analog error correction with oscillators” would also be too broad.

5. **Noise statistics matter.** Du et al. find different retrieval behavior under white and temporally correlated noise, and Gower finds that nudging strength must track noise scale (entries 7, 13). A single independent-Gaussian jitter curve would not establish tolerance to correlated/shared forcing. These studies do not establish that beneficial memory noise improves generative FID.

6. **Shared drift, hard faults, readout noise, and yield remain weakly covered here.** No core inspected learned-generator paper establishes temperature/aging sweeps, dead/stuck-oscillator recovery, separate final-phase measurement-noise curves, or mixed-error manufacturing-yield distributions. Gower's phase quantization is useful adjacent evidence for readout precision, but is not stochastic E5 phase measurement noise. Static trained sparsity is not failure after training (entries 2, 7, 9).

7. **Common-mode phase symmetry needs a precise definition.** Inference from the difference-coupled equations: an identical additive frequency offset applied to every evolving main/conditioning/reference oscillator produces a common rotation; a readout using exact relative phases can cancel it. Offsetting only the main pool relative to its drive/reference, or changing coupling gain, need not cancel. The Un-0 reference-relative readout is documented in entry 1. This is a mathematical caveat for interpreting E3, not a new experiment or a verified immunity claim for the local implementation.

8. **Finite-time generative computation differs from equilibrium memory.** Most EqProp/associative-memory results concern stable final states; Un-0 learns a distribution at a chosen integration horizon. Stronger locking, attractor correction, or phase discretization may erase sample diversity even while stabilizing synchronization. This is an inference across entries 1, 5–7 and 13–17, not an established quantitative Un-0 result.

9. **Compensation cost is rarely comparable.** The inspected sources do not provide a shared generative-quality-versus-cost comparison among oscillator copies, repeated runs, calibration, spare devices, ECC overhead, and noisy fine-tuning. Noise-aware training across varying noise strengths is established in conventional DNNs (entry 24), but its numbers do not transfer directly to oscillator parameters or radians.

10. **Evidence/access limits.** Most entries are partial readings with specific sections identified; entry 18 remains abstract-only. Figures were not digitized, experiments were not reproduced, and no model was run. “No test verified” refers to the inspected evidence. Further work should read remaining supplements and search complete citing-paper/patent families before making an absolute novelty claim. This review records 25 distinct works, grouping duplicate versions.
