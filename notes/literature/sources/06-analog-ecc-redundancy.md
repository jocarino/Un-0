# Analog error correction and redundancy, especially phase-domain oscillator averaging

Literature searched on 2026-11-13; taxonomy read from `notes/hardware-error-catalog.md`; no experiments run.
Analog redundancy is established prior art: replicated devices, layer outputs, checksums, and real-valued ECC all have precedents.
The closest phase-domain precedent is synchronization of multiple oscillators to suppress independent phase/frequency noise.
Ideal synchronized Kuramoto populations can achieve noise-power reduction proportional to 1/N; this is not a universal law for arbitrary learned couplings.
Experiments include optomechanical arrays, spin Hall oscillator chains/arrays, and coherent combination of redundant synthesizer channels.
Recent hardware shows both strong scaling and counterexamples: longer synchronized chains can have worse high-offset phase noise.
Roth-style analog ECC tolerates bounded background error while locating sparse large outliers; it does not remove all analog noise.
The supplied arXiv seeds 2402.13503 and 2404.15621 are genuine; the latter became an expanded 2025 journal article, counted once here.
The Pedretti seeds are **analog slicing**, not simply conventional bit slicing; both IEEE TED parts are verified.
No reviewed work establishes the complete Un-0 proposal: circular averaging of corresponding copies of a learned, driven, short-transient image generator under E1–E5 and chip-yield evaluation.

Coverage notes: 30 entries; primary papers, author manuscripts, publisher records, and primary technical-report abstracts were inspected. Searches included arXiv, IEEE/IEDM/ITC/DATE/ISSCC/VLSI terms, Nature-family journals, NeurIPS/ICLR/ICML terms, theses, patents, and company material. Citation trails ran backward from Wei/Roth, Pedretti, Yousuf, and oscillator-noise papers and forward to 2025–2026 work. This is a documented research search, not an exhaustive database export. Two older works (2005 and 2012) are retained because they directly address redundant oscillator neurons or the 1/N claim. Read status is conservative: **partial** means selected body/results/methods were read, not every proof or supplement; **abstract-only** means no body evidence is relied upon. E labels below are reviewer mappings to the project taxonomy, not necessarily the authors' terminology; crossbar readout is only an analogue of phase readout E5. Unreported quantities are stated explicitly rather than inferred.

## Entries

### 01. Frequency precision from synchronization: ideal 1/N and its failure

**Citation:** M. C. Cross, “Improving the frequency precision of oscillators by synchronization,” *Physical Review E* **85**, 046214 (2012). [Publisher](https://doi.org/10.1103/PhysRevE.85.046214); [author manuscript](https://arxiv.org/abs/1109.3684).

- **Year / venue / type:** 2012 / Physical Review E / theory.
- **System and scale:** N phase-reduced oscillators on disordered lattices; dissipative Kuramoto coupling compared with reactive coupling.
- **E1–E5:** E1 natural-frequency disorder; E2 independent dynamical noise. E3–E5 not directly corrected.
- **Mitigation:** Mutual entrainment averages noise in the collective phase mode.
- **Key quantitative results:** Purely dissipative entrained populations give N-fold frequency-precision improvement, equivalent to 1/N effective noise strength. With reactive coupling and localized wave sources, improvement saturates with N at large N. In the one-dimensional dissipative lattice, locking breaks down at disorder scale σ approximately N^(-1/2) with coupling normalized to one.
- **Relevance to Un-0:** **high** — direct theoretical precedent and essential qualification for the proposed redundancy scaling; steady entrainment differs from learned transients.
- **Read status:** **partial** — manuscript abstract, lattice/disorder discussion, collective-phase noise derivation; publication year checked against APS.

### 02. Optically coupled micromechanical arrays reduce phase noise

**Citation:** Mian Zhang, Shreyas Shah, Jaime Cardenas, and Michal Lipson, “Synchronization and Phase Noise Reduction in Micromechanical Oscillators Arrays Coupled through Light,” *Physical Review Letters* **115**, 163902 (2015). [DOI](https://doi.org/10.1103/PhysRevLett.115.163902); [paper](https://arxiv.org/pdf/1505.02009).

- **Year / venue / type:** 2015 / Physical Review Letters / hardware demonstration.
- **System and scale:** Silicon-nitride optomechanical resonator arrays; 3-, 4-, and 7-resonator systems with optical-field-mediated coupling.
- **E1–E5:** E1 resonator-frequency differences; E2 oscillator phase noise. No E3/E4/E5 correction demonstration.
- **Mitigation:** Synchronization of multiple physical oscillators through the radiation field.
- **Key quantitative results:** Phase noise improves by almost 10 dB relative to the individual-oscillator phase-noise limit; synchronization emerges as optical power rises despite initial mechanical-frequency disorder.
- **Relevance to Un-0:** **high** — physical demonstration of redundant oscillator noise suppression, though all copies form a common coherent oscillation rather than preserving many learned features.
- **Read status:** **partial** — PDF introduction, array/synchronization results, phase-noise and supplementary array descriptions.

### 03. Coupling topology and clean-reference injection matter

**Citation:** Paolo Maffezzoni, Bichoy Bahr, Zheng Zhang, and Luca Daniel, “Reducing Phase Noise in Multi-Phase Oscillators,” *IEEE Transactions on Circuits and Systems I: Regular Papers* **63**(3), 379–388 (2016). [DOI](https://doi.org/10.1109/TCSI.2016.2525078); [author PDF](https://web.ece.ucsb.edu/~zhengzhang/journals/2016_tcas1_reduce_phase_noise.pdf).

- **Year / venue / type:** 2016 / IEEE TCAS-I / simulation.
- **System and scale:** Chains of N=5 LC oscillators; simulated single-stage frequency 1.0261 GHz; external low-noise injection source.
- **E1–E5:** E2 phase noise; coupling topology/nonreciprocity. E1–E5 joint robustness not evaluated.
- **Mitigation:** Noise-transfer-function analysis and weak injection from a clean reference while maintaining prescribed phase separations.
- **Key quantitative results:** Near-carrier noise can decrease proportionally to N while far-offset noise remains nearly unchanged. Stable phase dynamics have one zero collective eigenvalue and N−1 decaying modes; nonreciprocal networks can degrade noise. Five-stage numerical examples demonstrate the reference-injection approach.
- **Relevance to Un-0:** **high** — preserves separated phases and explains why arbitrary learned K need not deliver equal-weight averaging.
- **Read status:** **partial** — phase-noise model, transfer-function analysis, proposed topology, numerical setup.

### 04. Two-dimensional spin Hall arrays: coherence and neuromorphic readout

**Citation:** Mohammad Zahedinejad, Ahmad A. Awad, Shreyas Muralidhar, Roman Khymyn, Himanshu Fulara, Hamid Mazraati, Mykola Dvornik, and Johan Åkerman, “Two-dimensional mutually synchronized spin Hall nano-oscillator arrays for neuromorphic computing,” *Nature Nanotechnology* **15**, 47–52 (2020; online 2019). [Publisher](https://www.nature.com/articles/s41565-019-0593-9).

- **Year / venue / type:** 2020 / Nature Nanotechnology / hardware demonstration.
- **System and scale:** 2×2 through 8×8 SHNO arrays; electrical and micro-Brillouin-light-scattering measurements; 4×4 neuromorphic synchronization-map demonstration.
- **E1–E5:** E2 white-noise-limited linewidth; physical device variability is present but not an isolated E1 sweep. No E3–E5 fix established.
- **Mitigation:** Mutual synchronization of many nanoconstrictions.
- **Key quantitative results:** On short white-noise-dominated timescales, Q increases linearly with N, reaching 170,000 for the largest arrays. Two independently tuned injected microwave frequencies produce neuromorphic synchronization maps.
- **Relevance to Un-0:** **high** — connects oscillator averaging/coherence to neuromorphic computing, but not redundant copies of distinct learned phase coordinates.
- **Read status:** **partial** — publisher abstract, figure descriptions, neuromorphic demonstration description; full-text opening was access-blocked.

### 05. Long SHNO chains: redundancy gains stop being monotonic

**Citation:** Akash Kumar, Himanshu Fulara, Roman Khymyn, Artem Litvinenko, Mohammad Zahedinejad, Mona Rajabali, Xiaotian Zhao, Nilamani Behera, Afshin Houshang, Ahmad A. Awad, and Johan Åkerman, “Robust Mutual Synchronization in Long Spin Hall Nano-oscillator Chains,” *Nano Letters* **23**(14), 6720–6726 (2023). [DOI](https://doi.org/10.1021/acs.nanolett.3c02036); [preprint](https://arxiv.org/abs/2301.03859).

- **Year / venue / type:** 2023 / Nano Letters / hardware demonstration.
- **System and scale:** Fabricated chains up to 50 nanoconstrictions in three material stacks; robust synchronization up to 21.
- **E1–E5:** E1 variability; E2 coherence/linewidth; E3-adjacent heating gradients, not a common aging-offset sweep.
- **Mitigation:** Stronger mutual coupling, fabrication/material optimization, synchronized emission.
- **Key quantitative results:** Published version reports linewidth <134 kHz, Q>79,000 near 10 GHz, and approximately 400× peak-power increase. Chains exceeding 21 show less robust synchronization and no commensurate signal-quality improvement. Preprint's <200-kHz figure is superseded here.
- **Relevance to Un-0:** **high** — concrete physical limit on “more copies always helps.”
- **Read status:** **partial** — preprint PDF and indexed publisher results/methods; published author list and numbers cross-checked with PubMed.

### 06. Direct phase-noise measurements reveal opposite effects across bandwidth

**Citation:** Artem Litvinenko, Akash Kumar, Mona Rajabali, Ahmad A. Awad, Roman Khymyn, and Johan Åkerman, “Phase noise analysis of mutually synchronized spin Hall nano-oscillators,” *Applied Physics Letters* **122**, 222401 (2023). [DOI](https://doi.org/10.1063/5.0152381); [full manuscript](https://arxiv.org/html/2303.18097v1).

- **Year / venue / type:** 2023 / Applied Physics Letters / hardware demonstration.
- **System and scale:** Single, 2-, and 10-nanoconstriction SHNO chains; down-converted phase traces and thermal modeling.
- **E1–E5:** E1 process variation; E2 flicker/thermal phase noise; E3-adjacent nonuniform self-heating. No E4/E5 correction.
- **Mitigation:** Mutual synchronization; phase extracted using Hilbert transform for measurement.
- **Key quantitative results:** Low-offset noise improves 2.8 dB for 2 and 6.2 dB for 10 oscillators versus ideal 3 and 10 dB. High-offset white-frequency noise instead worsens 2.1 and 3.1 dB. Modeled central-to-edge temperature difference is 13 K, corresponding to an estimated 20-MHz intrinsic-frequency spread.
- **Relevance to Un-0:** **high** — directly challenges unconditional phase-noise averaging; identifies mismatch, heating, and coupling delays as limits.
- **Read status:** **full** — main manuscript, methods/results/discussion and reference list; no independent reanalysis.

### 07. Ultra-large oscillator lattices, including transient ordering

**Citation:** Nilamani Behera, Avinash Kumar Chaurasiya, Akash Kumar, Roman Khymyn, Artem Litvinenko, Lakhan Bainsla, Ahmad A. Awad, and Johan Åkerman, “Nanosecond phase ordering in ultra-large spin Hall nano-oscillator lattices for unconventional computing,” *Nature Nanotechnology* **21**, 1105–1112 (2026). [Publisher](https://www.nature.com/articles/s41565-026-02216-y).

- **Year / venue / type:** 2026 / Nature Nanotechnology / hardware demonstration.
- **System and scale:** Up to 105,000 SHNOs, 10–20-nm constrictions; 146 fabricated array designs; time-resolved optical and microwave measurements.
- **E1–E5:** E2 collective linewidth; E1 fabrication sensitivity and thermal-management constraints discussed. No controlled E3–E5 campaign.
- **Mitigation:** Dense coupling, efficient W–Ta/CoFeB stack, improved heat removal, mutual synchronization.
- **Key quantitative results:** Linewidth scales approximately N^(-1); power scales N. Synchronization time rises from 10 ns at N=100 to about 45 ns for the largest lattices. A 48,750-oscillator array reaches 25.3-kHz linewidth at 26.2 GHz, Q=1.04×10^6.
- **Relevance to Un-0:** **high** — recent large-scale and transient precedent; explicitly does not demonstrate programmable Ising couplings or a computational task.
- **Read status:** **partial** — indexed primary main text, results, transient-time definition, methods, limitations; supplements not read.

### 08. Coherent combination of independent residual phase errors

**Citation:** Marco Pomponio, Archita Hati, and Craig Nelson, “Ultra-Low Phase Noise Frequency Division With Array of Direct Digital Synthesizers,” *IEEE Transactions on Instrumentation and Measurement* **73**, 5501310 (2024). [DOI](https://doi.org/10.1109/TIM.2023.3346538); [open manuscript](https://pmc.ncbi.nlm.nih.gov/articles/PMC10916524/).

- **Year / venue / type:** 2024 / IEEE TIM / hardware demonstration.
- **System and scale:** Four-channel DDS boards; two boards combine 8 parallel channels using a common clock.
- **E1–E5:** E2 residual channel phase noise; phase/alignment imperfections. Shared reference noise is not averaged away; not an E3 correction demonstration.
- **Mitigation:** Phase-aligned power combination; coherent carrier addition and incoherent residual-noise addition.
- **Key quantitative results:** Alignment accuracy 170 ps; 8-channel combination predicts 9-dB residual-noise reduction. At 9.765625 MHz, reported residual noise is −147 dBc/Hz at 1 Hz and −180 dBc/Hz at 100 kHz. Below about 30-Hz offset, output follows scaled common-reference noise.
- **Relevance to Un-0:** **high** — concrete phasor-combination precedent and common-mode noise floor; DDS hardware is not a learned Kuramoto generator.
- **Read status:** **partial** — open article theory, combining setup, measurement procedure/results.

### 09. Redundant clock generation without a shared failure point

**Citation:** Wolfgang Dür, Matthias Függer, and Andreas Steininger, “Generation of a fault-tolerant clock through redundant crystal oscillators,” *Microelectronics Reliability* **120**, 114088 (2021). [paper](https://repositum.tuwien.at/bitstream/20.500.12708/20347/1/Duer-2021-Microelectronics%20Reliability-vor.pdf).

- **Year / venue / type:** 2021 / Microelectronics Reliability / simulation.
- **System and scale:** Distributed ring-oscillator-like clock-generation network augmented with stable crystal references; 4 output clocks.
- **E1–E5:** E4 clock/component failures and glitches; synchronization/skew. No E1–E3/E5 statistical analog-error sweep.
- **Mitigation:** Distributed fault-tolerant clock algorithm, redundant references, bounded-skew synchronization; formal correctness proof accompanies simulations.
- **Key quantitative results:** Four outputs have no shared single point of failure in the modeled architecture; simulated failed-source glitches do not propagate to correct outputs. Recovery causes temporarily extended cycles. No phase-noise reduction factor is claimed here.
- **Relevance to Un-0:** **med** — useful TMR-adjacent oscillator precedent and reminder to protect references/voters; digital clock events differ from continuous phase features.
- **Read status:** **partial** — abstract, architectural motivation, fault model overview; not every proof or timing trace.

### 10. Redundant nonlinear oscillators inside a fault-tolerant neuron

**Citation:** Takahide Oya, Tetsuya Asai, Yoshihito Amemiya, Alexandre Schmid, and Yusuf Leblebici, “Single-Electron Circuit for Inhibitory Spiking Neural Network with Fault-Tolerant Architecture,” *IEEE International Symposium on Circuits and Systems (ISCAS)*, 2535–2538 (2005). [DOI](https://doi.org/10.1109/ISCAS.2005.1465142); [author PDF](https://lalsie.ist.hokudai.ac.jp/publication/dlcenter.php?fn=int_conf/iscas_2005_oya.pdf).

- **Year / venue / type:** 2005 / ISCAS / simulation. Older direct-precedent exception.
- **System and scale:** Capacitor-coupled single-electron nonlinear oscillators; redundant spiking-neuron units and competing winners-share-all network.
- **E1–E5:** E4 random device failures; background-charge and fabrication concerns motivate the work, without a full taxonomy sweep.
- **Mitigation:** Redundant neuron layer followed by weighted averaging/rescaling and decision stages, distinct from classical majority voting.
- **Key quantitative results:** Architecture uses redundancy factor 5 in reported comparisons; simulations show greater similarity to fault-free responses. An exact tolerated failure percentage was not reliably extracted and is not asserted.
- **Relevance to Un-0:** **high** — close prior art for redundant oscillator-based neural units, but neither circular-mean phase decoding nor image generation.
- **Read status:** **partial** — indexed primary PDF architecture and simulation descriptions; PDF text extraction/opening was unreliable.

### 11. Shared noise can aid phase-based computation

**Citation:** Jaykumar Vaidya, Mohammad Khairul Bashar, and Nikhil Shukla, “Using noise to augment synchronization among oscillators,” *Scientific Reports* **11**, 4462 (2021). [Publisher](https://www.nature.com/articles/s41598-021-83806-9); [manuscript](https://arxiv.org/pdf/2012.01355).

- **Year / venue / type:** 2021 / Scientific Reports / hardware demonstration.
- **System and scale:** Breadboard Schmitt-trigger relaxation oscillators and coupled networks for graph coloring; pair synchronization and larger-network examples.
- **E1–E5:** E2 externally injected common white noise. Common stochastic forcing is not the slow drift E3.
- **Mitigation:** Noise-assisted locking instead of removing noise; phase relations used for computation remain available.
- **Key quantitative results:** With injected noise, desired frequency locking and phase-based computational behavior occur at 5× lower capacitive coupling than without injected noise. Required noise threshold decreases as oscillator count increases.
- **Relevance to Un-0:** **med** — common versus independent E2 can change dynamics qualitatively; synchronization statistics alone do not establish generative fidelity.
- **Read status:** **partial** — manuscript abstract/introduction and indexed publisher discussion of experiments; not all network plots.

### 12. Roth's analog ECC foundation

**Citation:** Ron M. Roth, “Analog Error-Correcting Codes,” *IEEE Transactions on Information Theory* **66**(7), 4075–4088 (2020). [DOI](https://doi.org/10.1109/TIT.2020.2977918); [author PDF](https://ronny.cswp.cs.technion.ac.il/wp-content/uploads/sites/54/2020/10/analog.pdf).

- **Year / venue / type:** 2020 / IEEE TIT / theory. Earlier ISIT 2019 version is not a separate entry.
- **System and scale:** Real vector–matrix multiplication; [n,k] linear codes with r=n−k redundant columns, arbitrary analytical size.
- **E1–E5:** E4 sparse stuck/short-induced output outliers plus bounded background error analogous to E1/E2/E5; no general common-drift E3 guarantee.
- **Mitigation:** Append coded columns; decode output syndromes to locate large errors while tolerating small errors.
- **Key quantitative results:** Two error scales: background ≤δ and outliers >Δ; principal constructions handle 1 outlier. Sparse constructions can attain Δ/δ≤2⌈2n/r⌉ with suitable even r and n≤r(r−1), as restated in Wei/Roth. These are threshold guarantees, not denoising percentages.
- **Relevance to Un-0:** **high** — foundation for the analog-ECC candidate, applicable directly to linear readout/coupling primitives, not automatically nonlinear ODE states.
- **Read status:** **partial** — indexed author manuscript model/constructions and follow-up restatement; original PDF retrieval failed. Read with entry 13.

### 13. Essential correction to the analog ECC theorem

**Citation:** Ron M. Roth, “Corrections to ‘Analog Error-Correcting Codes’,” *IEEE Transactions on Information Theory* **69**(6), 3793–3794 (2023). [DOI](https://doi.org/10.1109/TIT.2023.3234208); [author correction](https://ronny.cswp.cs.technion.ac.il/wp-content/uploads/sites/54/2022/11/analog-correction.pdf).

- **Year / venue / type:** 2023 / IEEE TIT / theory.
- **System and scale:** Same real [n,k] codes; τ corrected errors and σ additional detected errors.
- **E1–E5:** Same sparse-outlier/bounded-background abstraction as entry 12; no new physical error experiment.
- **Mitigation:** Correct decoder requirements and proof, including false-alarm conditions.
- **Key quantitative results:** Original Theorem 1 retains its stated form when σ=0 or τ=0; the mixed τ>0, σ>0 case requires stronger conditions under the original definition. Revised conditions permit the height-based characterization with Δ≥2(h_(2τ+σ)+1)δ. False-alarm prohibition is restricted to at most τ errors.
- **Relevance to Un-0:** **high** — necessary when specifying what “corrects faults plus detects extra errors” actually guarantees.
- **Read status:** **partial** — indexed correction text including changed requirements/lemma; direct PDF retrieval failed. Bibliographic metadata independently checked.

### 14. Hardware analog ECC restores classification after faults/noise

**Citation:** Can Li, Ron M. Roth, Cat Graves, Xia Sheng, and John Paul Strachan, “Analog error correcting codes for defect tolerant matrix multiplication in crossbars,” *IEEE International Electron Devices Meeting (IEDM)*, 36.6.1–36.6.4 (2020). [DOI](https://doi.org/10.1109/IEDM13553.2020.9371978); [author manuscript](https://repository.hku.hk/bitstream/10722/305968/1/Content.pdf); [institutional record](https://cris.technion.ac.il/en/publications/analog-error-correcting-codes-for-defect-tolerant-matrix-multipli/).

- **Year / venue / type:** 2020 / IEDM / hardware demonstration.
- **System and scale:** Memristor crossbar multiplication and MNIST classifier; exact array dimensions not confirmed from accessible passages.
- **E1–E5:** E4 shorted devices; E2/E5 analogue through injected output-current noise. No E3 sweep.
- **Mitigation:** Thresholded analog ECC detecting/correcting large errors while tolerating small analog inaccuracies.
- **Key quantitative results:** MNIST accuracy recovers 90.31%→96.21% with shorted devices and 73.12%→97.36% with injected current noise.
- **Relevance to Un-0:** **high** — experimental evidence for the RAID/ECC analogy at a computational primitive; not an oscillator trajectory code.
- **Read status:** **partial** — indexed manuscript introduction/code description plus institutional abstract; complete PDF was inaccessible.

### 15. Multiple-outlier analog codes — verified seed 2402.13503

**Citation:** Hengjia Wei and Ron M. Roth, “Multiple-Error-Correcting Codes for Analog Computing on Resistive Crossbars,” *IEEE Transactions on Information Theory* **70**, 8647–8658 (2024). [paper](https://arxiv.org/html/2402.13503v1); [author publication record](https://ronny.cswp.cs.technion.ac.il/home/publications/).

- **Year / venue / type:** 2024 / IEEE TIT / theory.
- **System and scale:** Arbitrary-length real codes for crossbar VMM; spherical-code and sparse binary disjunct parity-check matrices.
- **E1–E5:** Multiple E4-like sparse outliers amid bounded background analogous to E1/E2/E5; no E3-specific protection.
- **Mitigation:** Coded redundant columns; group-testing-style sparse checks and efficient location decoders for selected families.
- **Key quantitative results:** With λ=2τ+σ, spherical constructions use r=Θ(λ² log n) and attain Δ/δ=O(n/√r). Another family has r=λn/ρ and attainable Δ/δ≤2λn/r under stated prime-power/row-weight conditions. No physical benchmark.
- **Relevance to Un-0:** **high** — extends the ECC option beyond one dead oscillator-equivalent output, subject to linearity and bounded-error assumptions.
- **Read status:** **partial** — introduction, error model, corrected decoder definition, construction summary/table and citation trail; proofs not fully audited.

### 16. Searching and analyzing analog ECC constructions

**Citation:** Anxiao Jiang, “Analog Error-Correcting Codes: Designs and Analysis,” *IEEE Transactions on Information Theory* **70**(11), 7740–7756 (2024). [DOI](https://doi.org/10.1109/TIT.2024.3454059); [IEEE record](https://xplorestaging.ieee.org/document/10663765).

- **Year / venue / type:** 2024 / IEEE TIT / theory.
- **System and scale:** Real linear analog ECC; permutation-based code families and small-code search. Specific tested code dimensions not established from the abstract.
- **E1–E5:** E4-like unlimited-magnitude outliers plus bounded E1/E2/E5-like background; E3 not directly modeled.
- **Mitigation:** Linear programming to compute m-height, permutation constructions, code search/verification.
- **Key quantitative results:** Explicitly treats correction/detection of 1 or more outliers. Abstract claims improved code performance but supplies no numerical threshold table or hardware accuracy; no percentage improvement is asserted here.
- **Relevance to Un-0:** **med** — useful for selecting a small feature/readout code after identifying the applicable error model.
- **Read status:** **abstract-only** — indexed IEEE abstract and metadata verified; body access failed. Formula-level conclusions are not attributed to this abstract.

### 17. Height profiles quantify analog ECC beyond Hamming distance

**Citation:** Ron M. Roth, Ziyuan Zhu, Changcheng Yuan, Paul H. Siegel, and Anxiao Jiang, “On the Height Profile of Analog Error-Correcting Codes,” *arXiv:2602.20366* (2026). [paper](https://arxiv.org/html/2602.20366v1).

- **Year / venue / type:** 2026 / arXiv preprint; no final venue assumed / theory.
- **System and scale:** General real [n,k,d] codes; LP and finite-codeword characterizations, spherical/Platonic-solid examples.
- **E1–E5:** Sparse E4-like outliers and bounded background analogous to E1/E2/E5; no direct E3 model.
- **Mitigation:** Analyze full height profile to determine error-scale separation needed for reliable location/detection.
- **Key quantitative results:** m-height becomes infinite for m≥d. For r=n−k, finite r-height requires MDS distance d=r+1. One finite candidate-set bound at m=r is r·binomial(n,r); distance alone misses Δ/δ performance.
- **Relevance to Un-0:** **med** — shows why digital “can correct t failures” is insufficient for analog features with background noise.
- **Read status:** **partial** — abstract, formulations, MDS corollaries and examples; LP/proof details not fully checked.

### 18. Geometric analog ECC — version-sensitive 2026 follow-up

**Citation:** Ziyuan Zhu, Changcheng Yuan, Ron M. Roth, Paul H. Siegel, and Anxiao Jiang, “A New Class of Geometric Analog Error Correction Codes for Crossbar Based In-Memory Computing,” *arXiv:2603.03723*, v4 (2026). [paper](https://arxiv.org/html/2603.03723v4).

- **Year / venue / type:** 2026 / arXiv preprint / theory.
- **System and scale:** Geometric real codes; dual polygonal and dual polyhedral families.
- **E1–E5:** Sparse E4-like outliers with bounded E1/E2/E5-like perturbations; E3 not specifically protected.
- **Mitigation:** Explicit geometric height-profile analysis for multiple-outlier codes.
- **Key quantitative results:** Table I gives dual-icosahedral h1=h2=√5 and h3=2+√5; dual-dodecahedral h1=3/√5, h2=φ, h4=3. These are mathematical code-height values, not measured analog precision.
- **Relevance to Un-0:** **med** — structured redundancy over real features; polygonal geometry does not itself make this an ECC for wrapped oscillator phases.
- **Read status:** **partial** — v4 abstract/introduction, family descriptions and height table. Earlier indexed versions describe different emphasis; version is pinned to avoid mixing claims.

### 19. Sharp limits on single-error analog correction

**Citation:** Hengzhuo Li, Zhengjie Jian, Xin Wang, and Hengjia Wei, “Sharp Bounds and New Constructions for Single-Error Detection and Correction in Analog Codes,” *arXiv:2606.03011*, v2 (2026). [paper](https://arxiv.org/html/2606.03011v2).

- **Year / venue / type:** 2026 / arXiv preprint / theory.
- **System and scale:** Arbitrary real [n,k] codes, including redundancy r=2 and higher fixed r.
- **E1–E5:** One E4-like outlier plus bounded background analogous to E1/E2/E5; no dynamical/shared-drift guarantee.
- **Mitigation:** Lower bounds and code constructions balancing redundancy against outlier/background separation.
- **Key quantitative results:** Γ1≥2⌈n/(n−k)⌉; for [n,n−2], Γ2≥csc²(π/(2n)). Higher-fixed-redundancy constructions achieve Γ2=O(n^(1+1/(r−1))). Γ is a required Δ/δ threshold ratio.
- **Relevance to Un-0:** **med** — low-overhead analog parity cannot promise arbitrary precision as protected vector length grows.
- **Read status:** **partial** — v2 abstract, theorem statements and scope; detailed geometric proofs not audited. Seed-era title “Bounds for Single-Error-Correcting Analog Codes” changed in v2.

### 20. Fixed-redundancy threshold exponent is optimal

**Citation:** Zhengyi Jiang, Wenhao Liu, Zhongyi Huang, and Hanxu Hou, “Optimal Exponent of the Single-Error Correction Threshold with Fixed Redundancy for Analog Error-Correcting Codes,” *arXiv:2608.08171* (2026). [paper](https://arxiv.org/html/2608.08171v1).

- **Year / venue / type:** 2026 / arXiv preprint / theory.
- **System and scale:** Real [n,k] codes with fixed r=n−k≥2; all block lengths satisfying the stated assumptions.
- **E1–E5:** Single sparse E4-like outlier amid bounded E1/E2/E5-like noise. No phase-dynamics model.
- **Mitigation:** Converse bounds for analog-ECC design, matching earlier constructions' asymptotic exponent.
- **Key quantitative results:** Γ2 grows at least Ω(n^(1+1/(r−1))); matching upper bounds establish the optimal exponent. An explicit weaker constant bound is Γ2≥n^(1+1/(r−1))/(4π√3 r). Thus r=2 has quadratic and r=3 has n^(3/2) scaling.
- **Relevance to Un-0:** **med** — guides realistic block sizes for redundancy over decoder features; asymptotic bounds do not establish a usable phase code.
- **Read status:** **partial** — abstract, converse statement, conclusion; proof not independently verified.

### 21. Multiple devices per weight and residual analog slices — Part I

**Citation:** Giacomo Pedretti, Piergiulio Mannocci, Can Li, Zhong Sun, John Paul Strachan, and Daniele Ielmini, “Redundancy and Analog Slicing for Precise In-Memory Machine Learning—Part I: Programming Techniques,” *IEEE Transactions on Electron Devices* **68**(9), 4373–4378 (2021). [DOI](https://doi.org/10.1109/TED.2021.3095433); [author PDF](https://juser.fz-juelich.de/record/904614/files/IEEE_TED_redundancy_and_slicing_part_1-3%20copia.pdf).

- **Year / venue / type:** 2021 / IEEE TED / hardware demonstration.
- **System and scale:** Integrated RRAM; 32×32 PageRank matrix replicated fourfold into 64×64 physical mapping.
- **E1–E5:** E1 programming variability; E4 stuck devices; E2/E5-like residual circuit/read noise characterized. E3 not evaluated.
- **Mitigation:** Redundancy-aware program/verify of average conductance; separately encode positive/negative residual errors with analog slicing.
- **Key quantitative results:** M=4 averages four conductances per coefficient; M=2 can compensate one stuck-off device within available conductance range. With M=4 and slicing, programming-error standard deviation reaches 0.4 μS. Read-to-read device σ<0.5 μS versus measured system noise floor σ=1.5 μS.
- **Relevance to Un-0:** **high** — direct redundancy/calibration model for learned K/omega implementation; residual slicing is more than blind averaging.
- **Read status:** **partial** — programming, redundancy, slicing, and noise-budget sections.

### 22. Multiple devices per weight and residual slices — Part II

**Citation:** Giacomo Pedretti, Piergiulio Mannocci, Can Li, Zhong Sun, John Paul Strachan, and Daniele Ielmini, “Redundancy and Analog Slicing for Precise In-Memory Machine Learning—Part II: Applications and Benchmark,” *IEEE Transactions on Electron Devices* **68**(9), 4379–4383 (2021). [DOI](https://doi.org/10.1109/TED.2021.3095430); [author PDF](https://juser.fz-juelich.de/record/904615/files/IEEE_TED_redundancy_and_slicing_part_2-2.pdf).

- **Year / venue / type:** 2021 / IEEE TED / hardware demonstration.
- **System and scale:** Three 64×64 RRAM arrays; 32-page PageRank hardware and MNIST CNN extension.
- **E1–E5:** E1 programming variability, E4 stuck devices, E5-like peripheral-noise floor; no E3 sweep.
- **Mitigation:** Redundancy plus residual analog slicing and shared readout peripherals.
- **Key quantitative results:** PageRank reaches 6.7 ENOB (108 equivalent levels), MAE=0.09. M=4 plus positive/negative slices uses 12 devices per matrix entry. CNN hardware baseline 94.25% versus software 98.15%; expanded-array **simulations** reach 97% with redundancy and 98.08% with redundancy+slicing.
- **Relevance to Un-0:** **high** — reports precision and hardware cost, and distinguishes hardware results from simulated fixes.
- **Read status:** **partial** — application results and benchmark sections; not every circuit-cost assumption audited.

### 23. Multi-memristive synapses average device imperfections at scale

**Citation:** Irem Boybat, Manuel Le Gallo, S. R. Nandakumar, Timoleon Moraitis, Thomas Parnell, Tomas Tuma, Bipin Rajendran, Yusuf Leblebici, Abu Sebastian, and Evangelos Eleftheriou, “Neuromorphic computing with multi-memristive synapses,” *Nature Communications* **9**, 2514 (2018). [DOI](https://doi.org/10.1038/s41467-018-04933-y); [paper](https://arxiv.org/pdf/1711.06507).

- **Year / venue / type:** 2018 / Nature Communications / hardware demonstration.
- **System and scale:** 144,000 synapses, 7 PCM devices per synapse: 1,008,000 physical devices; spiking temporal-correlation learning.
- **E1–E5:** E1 device variability and E2-like stochastic updates; asymmetry/resolution limitations. Not oscillator E2 integration noise; E3–E5 not jointly tested.
- **Mitigation:** Sum multiple device conductances for each synaptic weight; global counter arbitrates updates.
- **Key quantitative results:** Hardware runs 3,000 learning steps; 14,400 synapses receive correlated inputs with coefficient 0.75. Multi-device weights evolve more gradually and separate correlated inputs; numerical recognition gain is not asserted here.
- **Relevance to Un-0:** **high** — strong precedent for redundancy over learned parameters, but summing weights is different from averaging nonlinear trajectories.
- **Read status:** **partial** — synapse architecture, experimental methods and million-device result; not all ANN/SNN simulations.

### 24. Layer ensemble averaging — verified seed 2404.15621, final 2025 paper

**Citation:** Osama Yousuf, Brian D. Hoskins, Karthick Ramu, Mitchell Fream, William A. Borders, Advait Madhavan, Matthew W. Daniels, Andrew Dienstfrey, Jabez J. McClelland, Martin Lueker-Boden, and Gina C. Adam, “Layer ensemble averaging for fault tolerance in memristive neural networks,” *Nature Communications* **16**, 1250 (2025). [Publisher](https://www.nature.com/articles/s41467-025-56319-6); [2024 seed preprint](https://arxiv.org/abs/2404.15621).

- **Year / venue / type:** 2025 / Nature Communications / hardware demonstration.
- **System and scale:** 20,000-device platform; hardware three-layer 4×12, 12×6, 6×3 perceptron; separate image-classification simulations.
- **E1–E5:** E1 variability, E4 stuck faults, E2/E5-like read/write/peripheral noise. No comprehensive E3 study.
- **Mitigation:** Redundant layer mappings, output averaging, placement search and reduced-mapping-error encoding.
- **Key quantitative results:** At 20% stuck faults, simulated image-classification accuracy 40%→89.6%. Hardware continual-learning accuracy 55%→71%, within 1 percentage point of 72% software baseline; up to 4 averaged copies. These replace preprint figures 61%→72%.
- **Relevance to Un-0:** **high** — closest modern learned-feature/layer redundancy precedent; averaging is outside nonlinear activations and implemented digitally in the prototyping system.
- **Read status:** **partial** — preprint PDF methods/results and indexed final publisher results, checked against final abstract.

### 25. Redundant residue arithmetic for analog neural networks

**Citation:** Cansu Demirkiran, Lakshmi Nair, Darius Bunandar, and Ajay Joshi, “A blueprint for precise and fault-tolerant analog neural networks,” *Nature Communications* **15**, 5098 (2024). [DOI](https://doi.org/10.1038/s41467-024-49324-8); [author PDF](https://bu-icsg.github.io/publications/2024/demirkiran-nature-2024.pdf).

- **Year / venue / type:** 2024 / Nature Communications / simulation.
- **System and scale:** RNS/RRNS analog MVM architecture; modeled DNNs including ResNet-50, BERT-Large, and OPT-125M. Not a fabricated complete accelerator.
- **E1–E5:** E2/E5-like shot/thermal/conversion noise and residue errors; not an isolated E1–E4 chip-yield study.
- **Mitigation:** Multiple low-precision residues, redundant moduli, detection/correction/recomputation. Modulo operations can use ring oscillators or optical phase shifters.
- **Key quantitative results:** ≥99% of FP32 accuracy with 6-bit arithmetic for inference and up to 7-bit for training cases. Example 6-bit RRNS with one redundant modulus reduces required output current 1 mA→0.1 mA for a single correction attempt under the paper's noise model.
- **Relevance to Un-0:** **high** — connects coding to phase-capable hardware, but integer residue encoding differs from unrestricted circular phases.
- **Read status:** **partial** — architecture, accuracy, RRNS/noise and energy discussions; proofs/cost models not exhaustively audited.

### 26. Fault-aware matrix representation plus compensation layers

**Citation:** Zhicheng Xu, Jiawei Liu, Sitao Huang, Zefan Li, Shengbo Wang, Bo Wen, Ruibin Mao, Mingrui Jiang, Giacomo Pedretti, Jim Ignowski, Kaibin Huang, and Can Li, “Fault-free analogue computing with imperfect hardware,” *Nature Electronics* **9**, 811–824 (2026). [Publisher](https://www.nature.com/articles/s41928-026-01638-9).

- **Year / venue / type:** 2026 / Nature Electronics / hardware demonstration.
- **System and scale:** Memristor matrices decomposed into two adjustable submatrices; 32×32 DFT example and compensation-layer configurations.
- **E1–E5:** E4 stuck faults, E1 programming variation, E3 conductance drift via selective updates; E5 is a remaining circuit constraint.
- **Mitigation:** Optimize around known faulty devices, add scaled residual-compensation layers, selectively reprogram compensation arrays.
- **Key quantitative results:** DFT cosine similarity >99.999% despite 39% device faults; communication prototype BER reduced 56×. In extended data, k=32 plus one compensation layer reaches r²=0.9999 with 4,096 devices. Drift monitoring includes 50,000 s before and after a compensation-only update.
- **Relevance to Un-0:** **high** — recent feature/matrix redundancy and calibration alternative to blind replication; nonlinear dynamics need a separate mapping argument.
- **Read status:** **partial** — indexed primary abstract and extended-data descriptions; subscription main body unavailable.

### 27. Extended ABFT for RRAM matrix operations

**Citation:** Mengyun Liu, Lixue Xia, Yu Wang, and Krishnendu Chakrabarty, “Fault Tolerance for RRAM-Based Matrix Operations,” *IEEE International Test Conference (ITC)* (2018). [DOI](https://doi.org/10.1109/TEST.2018.8624687); [author PDF](https://nicsefc.ee.tsinghua.edu.cn/nics_file/pdf/publications/2018/ITC18_267_kXy8yR4.pdf).

- **Year / venue / type:** 2018 / ITC / simulation.
- **System and scale:** RRAM vector–matrix operations and Hopfield classifier; numerical array dimensions not confirmed from inspected sections.
- **E1–E5:** E4 faulty RRAM cells; quantized conductance/voltage constraints. No E2–E3/E5 trajectory-noise study.
- **Mitigation:** X-ABFT uses row checksums and diagnostic test-input vectors; handles test-input overflow from limited voltage levels.
- **Key quantitative results:** At 5% faulty RRAM cells, simulated Hopfield classification remains nearly at fault-free accuracy. No exact residual accuracy or overhead percentage is asserted from the accessible result summary.
- **Relevance to Un-0:** **high** — checksum/test-vector strategy for defective learned couplings; checks must be applied to linear primitives before nonlinear phase propagation.
- **Read status:** **partial** — PDF background, proposed-method overview, publisher abstract; full evaluation tables not audited.

### 28. Recent analog-MAC ABFT with weighted checksums

**Citation:** Shunta Kamegamori, Shoichi Hirasawa, Michihiro Koibuchi, and Hideyuki Kawashima, “A Preliminary Evaluation of Bit Error Detection and Correction Methods for Matrix Computations using Analog MAC Units,” *IEICE Technical Report* **125**(401), CPSY2025-57, 31–34 (March 2026; also DC2025-129). [Official record](https://ken.ieice.org/ken/paper/20260315LctH/eng/).

- **Year / venue / type:** 2026 / IEICE technical meeting report / simulation.
- **System and scale:** Analog MAC output bit errors and Ozaki high-precision matrix computation; matrix dimensions absent from English abstract.
- **E1–E5:** Output-bit corruption analogous to E5/E4, not continuously perturbed oscillator dynamics.
- **Mitigation:** Weighted checksum code instead of a simple checksum baseline.
- **Key quantitative results:** Baseline corrects at most 1 erroneous element per matrix; weighted checksums correct up to 1 independently per column. Abstract reports approximately 100× higher tolerable bit-error-rate ceiling.
- **Relevance to Un-0:** **med** — recent ABFT follow-up; most applicable after digitization or in decoder matrix operations.
- **Read status:** **abstract-only** — official English abstract and metadata; Japanese full report not read. Simulation classification reflects the evaluation description, with platform unspecified in the abstract.

### 29. CodeNet: redundancy across learned neural-network computations

**Citation:** Sanghamitra Dutta, Ziqian Bai, Tze Meng Low, and Pulkit Grover, “CodeNet: Training Large Scale Neural Networks in Presence of Soft-Errors,” *arXiv:1903.01042* (2019). [paper](https://arxiv.org/pdf/1903.01042). Presented in the ICML 2019 Coding Theory for Large-Scale Machine Learning workshop; no main-track publication assumed.

- **Year / venue / type:** 2019 / arXiv; ICML workshop / simulation.
- **System and scale:** Error-injection evaluation on Amazon EC2; 3-layer MNIST DNN distributed across 38 coded workers versus 40 replicated workers.
- **E1–E5:** E4-like transient computational/storage corruptions; not continuous analog jitter or shared drift.
- **Mitigation:** Layerwise MDS coding; checksum-preserving updates; correction and checkpoint recovery.
- **Key quantitative results:** After 2,000 iterations, CodeNet and replication both reach 89%; runtimes 2,322 s versus best replication 14,140 s (6.1×). Uncoded accuracy <50%. Injected per-node error probability 3×10^−4 per major operation.
- **Relevance to Un-0:** **med** — demonstrates learned-layer coding and fair redundancy comparisons; arbitrary nonlinear oscillator evolution does not preserve its checksums automatically.
- **Read status:** **partial** — framework and evaluation/table; 54-page proof appendices not fully read.

### 30. Coded computation can outperform full replication for erasures

**Citation:** Qian Yu, Mohammad Ali Maddah-Ali, and A. Salman Avestimehr, “Polynomial Codes: an Optimal Design for High-Dimensional Coded Matrix Multiplication,” *Advances in Neural Information Processing Systems 30 (NIPS)* (2017). [Proceedings paper](https://proceedings.neurips.cc/paper_files/paper/2017/file/e6c2dc3dee4a51dcec3a876aa2339a78-Paper.pdf).

- **Year / venue / type:** 2017 / NIPS / theory.
- **System and scale:** N distributed workers storing fractions 1/m and 1/n of two matrices; distributed multiplication and convolution.
- **E1–E5:** E4 analogue only: missing/straggling workers treated as erasures, not undetected analog perturbations. No direct E1/E2/E3/E5 coverage.
- **Mitigation:** Polynomial-encoded submatrices and interpolation decoding.
- **Key quantitative results:** Optimal recovery threshold mn returned workers, independent of total N for fixed m,n; tolerates N−mn missing workers. Decoding is almost linear in input size under the paper's assumptions.
- **Relevance to Un-0:** **low** — establishes coded redundancy beyond replication, but neither floating-point conditioning nor nonlinear phase trajectories receive analog-noise guarantees from this threshold.
- **Read status:** **partial** — model, optimal-threshold theorem and construction discussion; implementation/proof details not fully audited.

## Gaps / open questions noted by the literature

- **Novelty is in the application and evidence, not redundancy alone.** Entries 01–08 establish phase/coherence averaging; 10 establishes redundant oscillator neurons; 12–30 establish analog/layer/algorithmic coding. This search found no direct implementation of circular-mean averaging of corresponding copies of a trained class-conditional Kuramoto image generator, nor the requested isolated-error → fix → mixed-chip-yield sequence. This is a bounded negative search result, not proof of absence.

- **Circular averaging and physical synchronization are different interventions.** Coherently summing equal-amplitude outputs computes a resultant phasor related to `arg(sum(exp(i*theta_copy)))`; this relationship is our interpretation, not a claim that these papers use that software estimator for learned latent features. Synchronizing replicas changes the ODE; averaging independent final readouts does not. Neither guarantees preservation of a ten-step learned trajectory. The geometric codes in entry 18 use polygonal constructions over real vectors, not an ECC directly on the phase torus.

- **Preserve corresponding features and the intended sample.** A replica should represent the same learned coordinate and initial condition/class drive for noise suppression. Averaging different generative samples can remove desired diversity. Whether phase, sine/cosine features, decoder features, or decoded images should be averaged remains unestablished for Un-0. Layer averaging in entry 24 supplies a useful placement precedent but no answer for recurrent nonlinear dynamics.

- **1/N applies to noise power under independence, not universally to error amplitude.** Ideal small-error averaging implies standard-deviation scaling 1/√N. With equal pairwise correlation ρ, elementary covariance algebra gives mean-error variance σ²[ρ+(1−ρ)/N]; this is a reviewer-derived diagnostic, not a new experimental result. Shared drift, shared drive/reference noise, and correlated device errors leave a floor. Entries 01, 03, 06, and 08 document limitations of naive averaging in physical systems.

- **Common phase drift may be invisible internally yet visible to the decoder.** Relative-phase coupling can reject a global phase shift internally, but Un-0's drive and readout may fix an absolute reference. None of the oscillator-noise papers proves E3 immunity for that learned, driven decoder. A reference oscillator or reference channel is distinct from additional copies exposed to the same drift.

- **A circular mean is not a fault voter.** For small concentrated phase errors it is natural; when the resultant length approaches zero, the estimated direction becomes unstable or undefined. Sparse stuck-phase copies can bias a mean even when independent Gaussian noise averages down. Robust circular location, explicit fault detection/exclusion, and reference/voter reliability remain separate requirements. Entry 09 illustrates the shared-failure-point issue; entry 10 uses averaging plus a decision stage rather than unrestricted circular averaging.

- **Linear ECC does not commute with nonlinear phase dynamics.** Roth/ABFT checksums survive linear VMM because encoded outputs remain codewords. The sine coupling, learned drive, nonlinear transient propagation, and phase wrapping do not automatically preserve those constraints. Applying a code to coupling evaluations, to sine/cosine readout, or to learned decoder features requires an explicit invariant or decoding argument. E4 device defects can also spread to many output coordinates and cease to be sparse.

- **Analog ECC has a finite separation requirement.** Small background errors are tolerated, not exactly removed; “unlimited magnitude” means outliers may be arbitrarily large, not that arbitrarily small outliers can always be corrected. Entries 13 and 15–20 sharpen the assumptions and overhead/threshold tradeoffs. Bounded-noise guarantees do not immediately apply to unbounded Gaussian integration increments without a probabilistic failure analysis.

- **Mismatch, coupling delay, heating, and bandwidth limit redundancy.** Entries 05–06 find departures from ideal scaling; 07 obtains better scaling through different geometry/material/thermal design. These results cannot be compared solely by oscillator count. White noise, flicker noise, phase slips, and slow thermal variation need distinct interpretation. Long-time spectral linewidth is not the same metric as endpoint phase error over approximately ten Euler steps.

- **Calibration and redundancy are often combined.** Pedretti's redundancy-aware programming and residual slices, Yousuf's placement/encoding, and Xu's fault-aware factorization use measured hardware information. Their gains should not be attributed to blind replication alone. Weight redundancy can improve a realized K without demonstrating that post-integration trajectory averaging repairs the same error.

- **Yield and cost remain important open evidence for this project.** None of the inspected works reports the complete E1–E5 joint distribution, random combinations over many Un-0 chips, generative quality/diversity, and optional noise-aware fine-tuning together. Comparable accounting needs actual redundant devices, peripheral/readout cost, latency/repeated runs, calibration effort, correlations, and decoder overhead. A four-copy hardware average and four serial simulated runs have different cost profiles.

- **Search/access limits.** No directly verified modern paper using circular-mean voting of redundant Un-0-like oscillator features was found despite targeted phase-voting, redundant-copy, circular-statistics, oscillator-array, thesis, and patent searches. Relevant patent search located HPE's [US20240039562A1](https://patents.google.com/patent/US20240039562A1/en), but it is not counted as independent experimental evidence for Roth-style crossbar correction. Several publisher/PDF openings failed; abstract-only entries and partial reads are identified individually. Preprint theory and preliminary reports require appropriate weight relative to hardware demonstrations; no paper's data or code was executed.
