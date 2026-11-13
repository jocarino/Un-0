# Oscillator and coherent Ising machines: noise, variability, and robustness

Search date: 13 November 2026; scope: 2015–2026, with emphasis on 2022–2026.
Oscillator Ising machines (OIMs) provide close precedents for noisy Kuramoto dynamics, but usually decode binary phases after relaxation.
Coherent Ising machines (CIMs) add optical amplitude dynamics, quantum noise, and noisy measurement-feedback loops.
E1 frequency mismatch is addressed by tuning, injection locking, and calibration; coupling delay can be more damaging than frequency spread.
E2 is often deliberately retained or injected for exploration: optimum noise depends on dynamics, graph, and schedule.
E3 is addressed by phase stabilization, reference clocks, microwave encoding, or symmetry-protected polarization encoding.
E5 can affect the dynamics as well as final output when measurements are fed back; baseline shifts and phase thresholds matter.
CIM “error correction” usually means amplitude equalization and escape from local minima, rather than parity codes or redundant copies.
Auxiliary ferromagnetically coupled spins are a relevant redundancy precedent, principally for stable fields and dynamic-range management.
Reported scales range from a few physical oscillators to 100,512 optical pulses; physical scale, simulated scale, and graph connectivity must be separated.
No included work establishes RAID-style circular averaging of learned continuous features in a short-horizon image generator; mixed E1–E5 chip-yield studies remain a gap in this search.

**Reading and extraction conventions.** E1–E5 follow [the project catalog](../../hardware-error-catalog.md). Tags are interpretive mappings, not terminology used by the authors. “Analogy” marks endogenous amplitude/encoding errors rather than demonstrated manufacturing defects. Unlisted error categories were not established in the inspected material. “Partial” means selected main-text sections/figures were inspected, not all proofs or supplements. Some publisher pages were blocked; indexed publisher/PMC main-text sections and accessible author PDFs were used, with this limitation stated locally. Numerical claims below are source-reported, not reproduced. A scale or trial count is not itself a noise-tolerance result. Related papers and the patent are not independent replications.

**Search coverage and trails.** Live searches included arXiv, publisher and IEEE Xplore records, Nature/Science journals, NeurIPS/ICLR/ICML queries, DATE/ISSCC/IEDM/VLSI queries, theses, patents, and NTT institutional material. Backward trails included Wang → Chou/Dutta, Leleu → Kako/Reifenstein, and Honjo → early CIM demonstrations; forward trails included Graber, Gower, Shi, Fan, Takesue, and 2026 OIM/optical work. Searches did not establish a directly relevant ICLR/ICML or DATE/VLSI paper deserving inclusion. Non-oscillator latch/p-bit machines, Ising solvers used to decode *other* quantum hardware, and unverified media claims were excluded. This is a focused source review, not an exhaustive database export.

## Entries

### 1. Haribara et al. — early large-scale noisy CIM benchmarking

**Citation:** Yoshitaka Haribara, Shoko Utsunomiya, Ken-ichi Kawarabayashi, and Yoshihisa Yamamoto. “A coherent Ising machine for MAX-CUT problems: Performance evaluation against semidefinite programming relaxation and simulated annealing.” arXiv:1501.07030 (2015; revised 2016). [Record](https://arxiv.org/abs/1501.07030), [PDF inspected, v5](https://arxiv.org/pdf/1501.07030v5).

- **Year / venue / type:** 2015–2016 / arXiv preprint / simulation.
- **System and scale:** Stochastic DOPO network model; up to 20,000 vertices and approximately 10^8 edges.
- **Errors covered:** E2, intrinsic stochastic optical dynamics; not a manufacturing-yield study.
- **Mitigation used:** Pump evolution and coupled oscillator search; repeated stochastic trials rather than hardware ECC.
- **Key quantitative results:** Reports nearly size-independent modeled computation time to obtain reasonably accurate cuts over the tested range up to 2 × 10^4 vertices. This is approximate-quality scaling, not constant-time exact optimization or a measured chip runtime.
- **Relevance to Un-0:** **Med** — early example of evaluating stochastic dynamics against an explicit quality target across system sizes.
- **Read status:** **Partial** — abstract, model/benchmark framing, and scale claims in the revised PDF; not all benchmark tables.

### 2. Yamamoto et al. — intrinsic amplitude and phase restoration

**Citation:** Yoshihisa Yamamoto, Kazuyuki Aihara, Timothee Leleu, Ken-ichi Kawarabayashi, Satoshi Kako, Martin Fejer, Kyo Inoue, and Hiroki Takesue. “Coherent Ising machines—optical neural networks operating at the quantum limit.” *npj Quantum Information* **3**, 49 (2017). [Article](https://doi.org/10.1038/s41534-017-0048-9).

- **Year / venue / type:** 2017 / npj Quantum Information / review.
- **System and scale:** DOPO CIMs; surveys 4-, 16-, 100-, 2,000-, and approximately 10,000-spin implementations.
- **Errors covered:** E2 and phase/amplitude perturbations; E5 homodyne detection. Endogenous amplitude heterogeneity is also discussed.
- **Mitigation used:** Phase-sensitive amplification/deamplification restores binary phase; gain saturation restores amplitude.
- **Key quantitative results:** Phase restoration applies to errors small compared with ±π/2. Reviews a 100-spin ground-state success probability of 21 ± 9%, without active amplitude homogenization. This is not a measured continuous-phase error-correction threshold.
- **Relevance to Un-0:** **High** — explains why binary attractors can reject perturbations, and why that protection cannot automatically be assumed for continuous learned phases.
- **Read status:** **Partial** — indexed publisher sections on restoration, heterogeneity, and experimental performance; direct publisher opening blocked.

### 3. Wang and Roychowdhury — frequency variability in phase-based Ising dynamics

**Citation:** Tianshi Wang and Jaijeet Roychowdhury. “OIM: Oscillator-based Ising Machines for Solving Combinatorial Optimisation Problems.” In *Unconventional Computation and Natural Computation*, pp. 232–256 (2019). [Preprint record](https://arxiv.org/abs/1903.07163), [PDF](https://arxiv.org/pdf/1903.07163).

- **Year / venue / type:** 2019 / UCNC / theory.
- **System and scale:** Coupled phase oscillators with second-harmonic synchronization; large-network numerical benchmarks, not a large fabricated array.
- **Errors covered:** E1 natural-frequency spread; E2 additive Gaussian noise. E3 uniform detuning is related but not a separate temperature/aging qualification.
- **Mitigation used:** Subharmonic injection locking (SHIL), coupling/synchronization schedules, controlled noise.
- **Key quantitative results:** Binary phases are separated by π and imposed using a drive at twice the oscillator frequency. Section 3.4 explicitly incorporates individual ω_i into phase dynamics and a Lyapunov analysis; it predicts gradual degradation, but provides no universal percentage mismatch threshold transferable to Un-0.
- **Relevance to Un-0:** **High** — directly related sinusoidal phase dynamics and an explicit frequency-mismatch model; its binary attractors and symmetry assumptions differ.
- **Read status:** **Partial** — dynamics, frequency-variation section, and noise/schedule discussion in PDF.

### 4. Chou et al. — weighted LC oscillator hardware

**Citation:** Jeffrey Chou, Suraj Bramhavar, Siddhartha Ghosh, and William Herzog. “Analog Coupled Oscillator Based Weighted Ising Machine.” *Scientific Reports* **9**, 14786 (2019). [Article](https://doi.org/10.1038/s41598-019-49699-5), [preprint](https://arxiv.org/abs/1906.06312).

- **Year / venue / type:** 2019 / Scientific Reports / hardware demonstration.
- **System and scale:** Fully connected 4-node differential LC network, approximately 50 kHz; programmable weighted crossbar.
- **Errors covered:** E1 practical oscillator/coupling precision and bias sensitivity; stochastic run variability is characterized, without isolated E1–E5 sweeps.
- **Mitigation used:** Careful oscillator/coupling bias tuning; buffered gain-ratio coupling and programmable potentiometers.
- **Key quantitative results:** Single-run ground-state accuracy 98% for binary-weight random MAX-CUT problems, 84% for 5-bit weights; solutions within 5 oscillator cycles. Potentiometers have 1,024 taps. These results are at four nodes, not evidence of large-array mismatch tolerance.
- **Relevance to Un-0:** **Med** — demonstrates precision-dependent task degradation and the importance of coupling implementation.
- **Read status:** **Partial** — publisher abstract, circuit implementation, programming, and statistical headline results; supplements not inspected.

### 5. Leleu et al. — correcting amplitude heterogeneity

**Citation:** Timothée Leleu, Yoshihisa Yamamoto, Peter L. McMahon, and Kazuyuki Aihara. “Destabilization of Local Minima in Analog Spin Systems by Correction of Amplitude Heterogeneity.” *Physical Review Letters* **122**, 040607 (2019). [DOI](https://doi.org/10.1103/PhysRevLett.122.040607), [PDF](https://arxiv.org/pdf/1810.12565).

- **Year / venue / type:** 2019 / Physical Review Letters / simulation.
- **System and scale:** Analog soft-spin dynamics with an auxiliary error variable per spin; SK benchmarks at N = 80, 100, 150, 200, plus G-set problems.
- **Errors covered:** Amplitude heterogeneity distorting the objective: an E1-like mapping-error analogy, not injected fixed chip mismatch.
- **Mitigation used:** Adaptive amplitude correction and control of instability in the auxiliary-variable dynamics.
- **Key quantitative results:** Reports ground-state finding probability above 99.9% at N = 200 in the studied regime. Benchmark sets contain 5,000, 5,000, 3,000, and 2,000 instances respectively; confidence intervals use 20 runs per instance. Proposed hardware speedups are projections.
- **Relevance to Un-0:** **High** — strong prior art for auxiliary corrective dynamics, but neither replication averaging nor a parity code.
- **Read status:** **Partial** — main mechanism and numerical-results sections, with selected supplementary benchmark details.

### 6. Inui and Yamamoto — noise correlations affect success

**Citation:** Yoshitaka Inui and Yoshihisa Yamamoto. “Noise correlation and success probability in coherent Ising machines.” arXiv:2009.10328 (2020). [Record](https://arxiv.org/abs/2009.10328), [PDF](https://arxiv.org/pdf/2009.10328).

- **Year / venue / type:** 2020 / arXiv preprint / theory.
- **System and scale:** Optical-delay, measurement-feedback, and mean-field CIM models; includes two-oscillator analysis and a periodic six-spin lattice.
- **Errors covered:** E2 quantum fluctuations and their spatial correlations; E5 measurement-feedback noise.
- **Mitigation used:** Choice of coupling/measurement architecture; analyzes which correlation metric predicts successful configurations.
- **Key quantitative results:** Six-spin runs count as successful when all six real amplitudes have the same sign. A mean-field comparison with 10^3 Brownian particles approaches random-guess success 1/2^5 = 3.125%. Normalized coordinate correlation tracks success more directly than entanglement or discord in these comparisons.
- **Relevance to Un-0:** **High** — directly cautions against assuming independent errors among redundant copies or using noise variance alone.
- **Read status:** **Partial** — abstract, correlation interpretation, and six-spin success-probability section of PDF.

### 7. Kako et al. — noisy measurement-feedback error correction

**Citation:** Satoshi Kako, Timothée Leleu, Yoshitaka Inui, Farad Khoyratee, Sam Reifenstein, and Yoshihisa Yamamoto. “Coherent Ising Machines with Error Correction Feedback.” *Advanced Quantum Technologies* **3**(11), 2000045 (2020). [Full text](https://advanced.onlinelibrary.wiley.com/doi/full/10.1002/qute.202000045), [preprint](https://arxiv.org/abs/2005.10895).

- **Year / venue / type:** 2020 / Advanced Quantum Technologies / simulation.
- **System and scale:** Measurement-feedback DOPO network with adaptive pump, coupling, and intensity target; explicit N = 16 example.
- **Errors covered:** E2 quantum noise; E5 noisy homodyne measurement; endogenous amplitude/mapping error.
- **Mitigation used:** Per-oscillator intensity feedback and energy-dependent switching between amplification and deamplification.
- **Key quantitative results:** N = 16 example uses 21-level weights from −1 to 1 and 10,000 independent trials; g² = 10^−4 and an assumed photon lifetime 40 cavity round trips. Measurement uncertainty is explicitly propagated through feedback. These are modeled parameters, not measured noise tolerances.
- **Relevance to Un-0:** **High** — shows how corrective feedback interacts with noisy measurements and changes search dynamics.
- **Read status:** **Partial** — accessible full-text principle, Gaussian-noise model, and numerical-example sections.

### 8. Dutta et al. — stochastic phase-transition oscillators

**Citation:** Sourav Dutta, Abhishek Khanna, Adou S. Assoa, Hanjong Paik, Darrell G. Schlom, Zoltan Toroczkai, Arijit Raychowdhury, and Suman Datta. “An Ising Hamiltonian solver based on coupled stochastic phase-transition nano-oscillators.” *Nature Electronics* **4**, 502–512 (2021). [Article](https://doi.org/10.1038/s41928-021-00616-7), [author manuscript](https://arxiv.org/pdf/2007.12331).

- **Year / venue / type:** 2021 / Nature Electronics / hardware demonstration.
- **System and scale:** Eight electrically coupled VO₂ PTNOs measured; experimentally calibrated simulation extended to 100 nodes.
- **Errors covered:** E2 intrinsic phase stochasticity; device nonidealities enter calibrated simulations, without a complete isolated E1–E5 qualification.
- **Mitigation used:** Gradually increasing injection-locking strength suppresses phase fluctuations late in the search.
- **Key quantitative results:** Eight-device prototype reports 96% success after 600 annealing cycles. Simulated 100-node dense MAX-CUT efficiency is 1.3 × 10^7 solutions/s/W. The latter is a projection from calibrated simulation, not measured 100-device hardware.
- **Relevance to Un-0:** **High** — closely related phase dynamics and a practical noise schedule; beneficial exploration need not preserve a fixed generated image.
- **Read status:** **Partial** — author-manuscript architecture, stochastic dynamics and scaling; published abstract checked for final headline numbers.

### 9. Wang et al. — expanded OIM benchmarks and noise ablation

**Citation:** Tianshi Wang, Leon Wu, Parth Nobel, and Jaijeet Roychowdhury. “Solving combinatorial optimisation problems using oscillator based Ising machines.” *Natural Computing* **20**, 287–306 (2021). [DOI](https://doi.org/10.1007/s11047-021-09845-3), [author PDF](https://jaijeet.github.io/research/PDFs/2021-05-05-Springer-Natural-Computing--Wang-Wu-Nobel-Roychowdhury--OIM--invited.pdf).

- **Year / venue / type:** 2021 / Natural Computing / simulation.
- **System and scale:** Phase/SDE OIM; G-set benchmarks and frustrated-loop tests spanning 216–64,000 simulated spins.
- **Errors covered:** E2 deliberately injected noise; E1 frequency-variation framework retained from earlier OIM work.
- **Mitigation used:** Coupling, SHIL, and noise schedules; explicit removal-of-noise and removal-of-SHIL comparisons.
- **Key quantitative results:** G-set study uses 200 trials per problem; reports best-known cuts on 29/54 problems. Frustrated-loop study uses 50 instances per size and 100 runs per candidate runtime. Removing noise worsens cuts; removing SHIL reaches none of the referenced best cuts.
- **Relevance to Un-0:** **High** — clear ablation and instance-distribution precedent. Many stochastic runs are not many independently mismatched chips.
- **Read status:** **Partial** — benchmark tables, ablations, and TTS methodology; related to entry 3, not independent replication.

### 10. Reifenstein et al. — all-optical correction circuitry

**Citation:** Sam Reifenstein, Satoshi Kako, Farad Khoyratee, Timothée Leleu, and Yoshihisa Yamamoto. “Coherent Ising Machines with Optical Error Correction Circuits.” *Advanced Quantum Technologies* **4**(11), 2100077 (2021). [Article](https://doi.org/10.1002/qute.202100077), [preprint](https://arxiv.org/abs/2108.07369).

- **Year / venue / type:** 2021 / Advanced Quantum Technologies / proposal.
- **System and scale:** Optical chaotic amplitude/feedback correction; N signal pulses and N error pulses; proposed pump factory contains N² pulses across N cavities.
- **Errors covered:** E2 quantum noise; amplitude heterogeneity, an E1-like mapping-error analogy.
- **Mitigation used:** Optical auxiliary error pulses, nonlinear feedback, and destabilization of undesirable attractors.
- **Key quantitative results:** Published parameter tables give 500 integration steps for example separated-feedback runs and 1,000 for chaotic-feedback runs, ΔT = 0.4. The N² pump requirement is an explicit scaling cost. No measured optical correction chip or manufacturing-yield threshold is established here.
- **Relevance to Un-0:** **High** — direct prior art for analog corrective auxiliaries, with important physical overhead; not circular averaging.
- **Read status:** **Partial** — preprint abstract/architecture and indexed publisher implementation/parameter sections; complete PDF retrieval was unreliable.

### 11. Honjo et al. — noise and distributions at 100,000 spins

**Citation:** Toshimori Honjo, Tomohiro Sonobe, Kensuke Inaba, Takahiro Inagaki, Takuya Ikuta, Yasuhiro Yamada, Takushi Kazama, Koji Enbutsu, Takeshi Umeki, Ryoichi Kasahara, Ken-ichi Kawarabayashi, and Hiroki Takesue. “100,000-spin coherent Ising machine.” *Science Advances* **7**(40), eabh0952 (2021). [Article](https://doi.org/10.1126/sciadv.abh0952), [PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC8480917/), [institutional explanation](https://group.ntt/en/newsrelease/2021/09/30/210930a.html).

- **Year / venue / type:** 2021 / Science Advances / hardware demonstration.
- **System and scale:** 100,512 DOPO pulses, 5-km cavity; digitally assisted dense interactions.
- **Errors covered:** E2 spontaneous-emission and measurement-backaction fluctuations; E5 measurement feedback.
- **Mitigation used:** Stabilized optical apparatus and selection of pump/operating point; noise near threshold also used as a resource.
- **Key quantitative results:** 100,000-node MAX-CUT reference score reached in approximately 600 μs versus 0.7 s for the compared CPU SA. At 22 ms/890 circulations, near-threshold operation yields broad score distributions. These are approximate-score comparisons, not exact-ground-state or yield guarantees.
- **Relevance to Un-0:** **Med** — large-scale distribution reporting; optical time multiplexing differs from spatially mismatched Kuramoto chips.
- **Read status:** **Partial** — indexed article abstract/introduction and institutional quantitative account; PMC direct access blocked.

### 12. Ng et al. — quantum noise for repeated low-energy sampling

**Citation:** Edwin Ng, Tatsuhiro Onodera, Satoshi Kako, Peter L. McMahon, Hideo Mabuchi, and Yoshihisa Yamamoto. “Efficient sampling of ground and low-energy Ising spin configurations with a coherent Ising machine.” *Physical Review Research* **4**, 013009 (2022). [Article](https://doi.org/10.1103/PhysRevResearch.4.013009), [PDF](https://arxiv.org/pdf/2103.05629).

- **Year / venue / type:** 2022 / Physical Review Research / simulation.
- **System and scale:** Discrete-time Gaussian-state measurement-feedback CIM; benchmark examples reach N = 100.
- **Errors covered:** E2 quantum noise; E5 homodyne monitoring and feedback.
- **Mitigation used:** Low-finesse, noise-dominated operation; exploit fluctuations for exploration rather than restart for each sample.
- **Key quantitative results:** Sampling all configurations through the first-excited energy scales approximately as 1.08^N for the studied binary-weight problems. At N = 100, median 20 desired configurations require median 6 × 10^6 round trips; projected 60 ms at 10-GHz repetition rate. Parametric drive can be off or reversed without destroying sampling performance.
- **Relevance to Un-0:** **Med** — useful precedent for separating distributional fidelity from reproducing one deterministic output.
- **Read status:** **Partial** — article abstract and discrete-time/model framing in accessible preprint; not all appendices.

### 13. Inui et al. — amplitude control with bias fields

**Citation:** Yoshitaka Inui, Mastiyage Don Sudeera Hasaranga Gunathilaka, Satoshi Kako, Toru Aonishi, and Yoshihisa Yamamoto. “Control of amplitude homogeneity in coherent Ising machines with artificial Zeeman terms.” *Communications Physics* **5**, 154 (2022). [Article](https://doi.org/10.1038/s42005-022-00927-x).

- **Year / venue / type:** 2022 / Communications Physics / simulation.
- **System and scale:** Amplitude-controlled DOPO CIM including local-field implementation; explicit frustrated N = 16 ring.
- **Errors covered:** E2 and E5 in stochastic measurement-feedback model; endogenous amplitude inhomogeneity, not injected manufacturing E1.
- **Mitigation used:** Dynamically maintained target amplitude and feedback-compatible artificial Zeeman terms.
- **Key quantitative results:** For the 16-spin antiferromagnetic nearest/next-nearest-neighbor ring, β = 10 gives peak ground-state success more than five times the uncontrolled β = 0 case. Simulations use g² = 10^−3 and final time t = 10; success means energy −16.
- **Relevance to Un-0:** **High** — corrective control must coexist with external drives, relevant to learned K_drive.
- **Read status:** **Partial** — indexed publisher model and frustrated-ring results; direct article/PDF opening blocked.

### 14. Cen et al. — microwave encoding improves long-term stability

**Citation:** Qizhuang Cen, Hao Ding, Tengfei Hao, Shanhong Guan, Zhiqiang Qin, Jiaming Lyu, Wei Li, Ninghua Zhu, Kun Xu, Yitang Dai, and Ming Li. “Large-scale coherent Ising machine based on optoelectronic parametric oscillator.” *Light: Science & Applications* **11**, 333 (2022). [Article](https://doi.org/10.1038/s41377-022-01013-1), [PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC9700853/).

- **Year / venue / type:** 2022 / Light: Science & Applications / hardware demonstration.
- **System and scale:** 25,600 microwave-pulse spins; 10-GHz carrier, 250-MHz pulse rate, 20-km fiber.
- **Errors covered:** E2 timing/phase fluctuations; E3 temperature, vibration, and reference-frequency drift.
- **Mitigation used:** Encode phase at microwave rather than optical frequency; referenced local oscillator and parametric phase locking.
- **Key quantitative results:** Stable operation over 12 hours; reported 1D defect density 0.0025 versus 0.02 in the cited optical comparison. The spin-storage stability demonstration and programmable difficult-graph solving are distinct qualifications.
- **Relevance to Un-0:** **High** — architecture/reference choices can reduce common-mode sensitivity before redundancy is added.
- **Read status:** **Partial** — indexed publisher setup, stability results, and discussion; direct HTML/PDF access blocked.

### 15. Böhm et al. — injected noise as a sampling control

**Citation:** Fabian Böhm, Diego Alonso-Urquijo, Guy Verschaffelt, and Guy Van der Sande. “Noise-injected analog Ising machines enable ultrafast statistical sampling and machine learning.” *Nature Communications* **13**, 5847 (2022). [Article](https://doi.org/10.1038/s41467-022-33441-3).

- **Year / venue / type:** 2022 / Nature Communications / hardware demonstration.
- **System and scale:** Time-multiplexed optoelectronic nonlinear-feedback Ising machine; simulated sparse graphs include N = 8,192. Adjacent architecture, not a DOPO network.
- **Errors covered:** E2 controlled Gaussian noise; E5 digitized readout is part of apparatus, not separately stress-tested.
- **Mitigation used:** Tune noise to a target effective temperature; compare analog noise source with digital pseudorandom injection.
- **Key quantitative results:** Simulated energy-distribution KL divergence approximately 0.09 at N = 64 and 0.02 at N = 8,192 against MCMC reference. Experimental spin acquisition is approximately 139,000 spins/s; GSample/s claims refer to projected spatial systems.
- **Relevance to Un-0:** **Med** — supports noise as a distributional resource; does not show preservation of generator features under hardware noise.
- **Read status:** **Partial** — indexed publisher sampling-results and apparatus sections; direct page access blocked.

### 16. Lo et al. — fully connected CMOS OIM

**Citation:** Hao Lo, William Moy, Hanzhao Yu, Sachin Sapatnekar, and Chris H. Kim. “An Ising solver chip based on coupled ring oscillators with a 48-node all-to-all connected array architecture.” *Nature Electronics* **6**, 771–778 (2023). [Article](https://doi.org/10.1038/s41928-023-01021-y).

- **Year / venue / type:** 2023 / Nature Electronics / hardware demonstration.
- **System and scale:** 48 logical nodes; strongly coupled horizontal–vertical oscillator pairs form an all-to-all crossbar; 65-nm CMOS at 1.2 V.
- **Errors covered:** E1 environmental/variation resilience and E3 operating-temperature dependence are claimed/tested; no E4 fault threshold established in accessible material.
- **Mitigation used:** Strong oscillator pairing and coupled-array architecture; direct graph mapping reduces embedding requirements.
- **Key quantitative results:** Arbitrary graphs through 48 nodes map directly. Statistical measurements vary graph size, density, temperature, and problem instance. A numerical temperature range or mismatch-tolerance percentage could not be verified from accessible primary text and is deliberately not supplied.
- **Relevance to Un-0:** **Med** — paired oscillators are structurally relevant redundancy, but here implement connectivity, not averaging/error correction.
- **Read status:** **Abstract-only** — publisher record/abstract available through search; full and shared-PDF access blocked. Specific robustness curves need follow-up.

### 17. Graber and Hofmann — calibration and variation across real chips

**Citation:** M. Graber and K. Hofmann. “An integrated coupled oscillator network to solve optimization problems.” *Communications Engineering* **3**, 116 (2024). [Article](https://doi.org/10.1038/s44172-024-00261-w), [PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC11343741/).

- **Year / venue / type:** 2024 / Communications Engineering / hardware demonstration.
- **System and scale:** 1,440 oscillators, 11,724 couplers, 28-nm CMOS; 100-MHz nominal frequency. Benchmarks also run on nine additional chips.
- **Errors covered:** E1 manufacturing frequency mismatch and routing delays; E3 operating-condition sensitivity; E5 phase/reference calibration and 4-bit detection.
- **Mitigation used:** Coarse/fine frequency calibration, reference-phase alignment, routing-delay lookup table.
- **Key quantitative results:** Frequency standard deviation falls from 6.7 to 0.33 MHz, with approximately 0.7 percentage-point accuracy gain. Raw frequencies span 75.6–119.1 MHz. Routing-delay settings have approximately 400-ps tolerance; uncalibrated routing performs like random output. Calibration uses 500 samples/oscillator.
- **Relevance to Un-0:** **High** — strongest direct calibration/real-chip precedent; more chips improve evidence beyond repeated initializations.
- **Read status:** **Partial** — indexed publisher/PMC calibration, methods, and comparison sections; direct access blocked. No complete chip-yield distribution extracted.

### 18. Maher et al. — device noise is not always improved by extra annealing

**Citation:** Olivier Maher, Manuel Jiménez, Corentin Delacour, Nele Harnack, Juan Núñez, María J. Avedillo, Bernabé Linares-Barranco, Aida Todri-Sanial, Giacomo Indiveri, and Siegfried Karg. “A CMOS-compatible oscillation-based VO₂ Ising machine solver.” *Nature Communications* **15**, 3334 (2024). [Article](https://doi.org/10.1038/s41467-024-47642-5), [PDF inspected](https://pure.tue.nl/ws/portalfiles/portal/331788011/s41467-024-47642-5.pdf).

- **Year / venue / type:** 2024 / Nature Communications / hardware demonstration.
- **System and scale:** Up to nine capacitively coupled crossbar VO₂ devices; graph coloring, MAX-CUT, MAX-3SAT.
- **Errors covered:** E1 device/parasitic variation; E2 cycle-to-cycle fluctuations.
- **Mitigation used:** Load capacitance for frequency uniformity, problem-dependent bias/coupling tuning, SHIL.
- **Key quantitative results:** Stability within 25 cycles; single-oscillator amplitude variation below 3.5%. Extra annealing techniques produced no conclusive improvement in these small graphs; authors attribute sufficient exploration partly to intrinsic noise/variability. Some device characterization is at 220 K; this is not unrestricted room-temperature qualification.
- **Relevance to Un-0:** **High** — supports testing fixes against existing stochasticity and preserving hardware/calibration context.
- **Read status:** **Partial** — PDF device, coupling, task-mapping, and discussion sections; supplements not inspected.

### 19. Shi et al. — high-noise operation and explicit coefficient mismatch

**Citation:** Ruqi Shi, Fabian Böhm, Thomas Van Vaerenbergh, and Peter Bienstman. “Enhancing the performance of coherent Ising machines in the large-noise regime with a fifth-order nonlinearity.” *Optics Express* **32**(12), 21681–21695 (2024). [DOI](https://doi.org/10.1364/OE.522474), [PDF](https://www.photonics.intec.ugent.be/download/pub_5154.pdf).

- **Year / venue / type:** 2024 / Optics Express / simulation.
- **System and scale:** Fifth-order soft-spin CIM model; BiqMac dense MAX-CUT benchmarks at N = 60–100 and further scaling tests.
- **Errors covered:** E2 large injected noise; E1 spin-to-spin nonlinear-coefficient variation.
- **Mitigation used:** Tunable fifth-order nonlinearity, including subcritical bifurcation, plus annealing/noise settings.
- **Key quantitative results:** Abstract reports average 59.5% improvement in median TTS and sixfold median success-rate improvement against low-noise cubic baseline. With σ = 0.1ζ coefficient spread on g05_100.6, success changes 49%→45% for supercritical and 96%→95% for subcritical dynamics. These are specific model/instance results, not universal 10% tolerance.
- **Relevance to Un-0:** **High** — particularly useful precedent for combining a dynamic-noise sweep with fixed parameter variation.
- **Read status:** **Partial** — PDF model, parameter sensitivity, mismatch paragraph, and benchmark table.

### 20. Reifenstein et al. — optical correction patent disclosure

**Citation:** Sam Reifenstein, Satoshi Kako, Timothee Leleu, and Yoshihisa Yamamoto (inventors). “Coherent ising machine with optical error correction for optimization solution generator system and method.” US patent application **US20240419958A1**, published 19 December 2024; priority 17 August 2021; assignees NTT Research, Inc. and The University of Tokyo. [Disclosure](https://patents.google.com/patent/US20240419958A1/en).

- **Year / venue / type:** 2024 / US patent application / proposal.
- **System and scale:** Optical signal/error-pulse circuits; numerical G-set comparisons, including 50 instances.
- **Errors covered:** E2 quantum noise and amplitude/mapping errors; not demonstrated E4 repair.
- **Mitigation used:** Auxiliary amplitude-feedback circuits and chaotic exploration; overlaps entry 10.
- **Key quantitative results:** Defines TTS using 99% success; disclosure reports CIM-CAC more than tenfold faster in matrix-vector-multiplication count on 13/50 instances than its discrete simulated-bifurcation comparison. These are disclosed simulation claims, not independent measurements or proof of patent scope/validity.
- **Relevance to Un-0:** **Med** — relevant prior-art terminology for analog correction; no identified RAID/circular-mean implementation.
- **Read status:** **Partial** — bibliographic data, circuit/search descriptions, and comparison paragraphs; claims not exhaustively analyzed.

### 21. Takesue et al. — auxiliary-spin redundancy and readout-baseline correction

**Citation:** Hiroki Takesue, Kensuke Inaba, Toshimori Honjo, Yasuhiro Yamada, Takuya Ikuta, Yuya Yonezu, Takahiro Inagaki, Takeshi Umeki, and Ryoichi Kasahara. “Finding independent sets in large-scale graphs with a coherent Ising machine.” *Science Advances* **11**(7), eads7223 (2025). [Article](https://doi.org/10.1126/sciadv.ads7223), [PDF inspected](https://pdfs.semanticscholar.org/3fb1/9876ce672eae444c0e31b612d4c12072e60b.pdf).

- **Year / venue / type:** 2025 / Science Advances / hardware demonstration.
- **System and scale:** Dense graphs up to 40,000 nodes; shared ferromagnetically coupled auxiliary-spin group supplies effective fields.
- **Errors covered:** E5 AC-coupled homodyne baseline fluctuations; limited field/coupling dynamic range, an E1-like implementation-error analogy.
- **Mitigation used:** Auxiliary fields plus random spin-flip transformation to suppress readout DC imbalance.
- **Key quantitative results:** Best auxiliary count approximately 5% of problem size; 49,744 signal pulses hold repeated embeddings. Per graph, 100 runs × 32 computations yield 3,200 × embedding-count results. Uses 99%-confidence time-to-target, often approximate scores.
- **Relevance to Un-0:** **High** — clearest redundancy-related precedent here; extra spins stabilize/represent fields rather than average learned phases.
- **Read status:** **Partial** — PDF auxiliary-spin, baseline, repetition, and performance-metric sections.

### 22. Gower — learned OIM robustness to phase noise and quantization

**Citation:** Alex Gower. “Learning at the Speed of Physics: Equilibrium Propagation on Oscillator Ising Machines.” *Machine Learning and the Physical Sciences Workshop, NeurIPS 2025*; arXiv:2510.12934 (2025). [Record](https://arxiv.org/abs/2510.12934), [version 1 HTML inspected](https://arxiv.org/html/2510.12934v1).

- **Year / venue / type:** 2025 / NeurIPS ML4PS workshop / simulation.
- **System and scale:** Euler-integrated OIM neural networks; 784–500–10 full-data model, 784–120–10 smaller benchmark.
- **Errors covered:** E2 Gaussian phase noise; E5 phase quantization; parameter quantization is related to implementation precision, not a per-chip E1 offset experiment.
- **Mitigation used:** Equilibrium-propagation learning with optimized nudging strength β under noise.
- **Key quantitative results:** Full MNIST 97.2 ± 0.1%, Fashion-MNIST 88.0 ± 0.1%. Smaller benchmark reaches 92.0 ± 0.3% at ξ = 0.2; 4-bit phase and 10-bit parameter results are 89.8 ± 1.5% and 89.4 ± 1.5%. Suggests β ≳ ξ/2; this is model-specific.
- **Relevance to Un-0:** **High** — closest learned, continuous-phase oscillator noise study, but classification/steady-state learning differs from image generation.
- **Read status:** **Full** — version 1 workshop text and figure captions, not a hardware implementation.

### 23. Fan et al. — temporally correlated noise

**Citation:** Chen-Rui Fan, Bo Lu, Yi-Xuan Yao, Qing Ai, and Chuan Wang. “Non-Markovian effect enhanced quantum noises in a coherent Ising machine.” *Optics Express* **33**(11), 22208–22221 (2025). [DOI](https://doi.org/10.1364/OE.562816), [author-hosted PDF](https://quanphys.bnu.edu.cn/file/paper/2025OE.pdf).

- **Year / venue / type:** 2025 / Optics Express / simulation.
- **System and scale:** Conventional and spiking-neural-network CIM models; includes N = 500 complete-graph example and variable-size benchmarks.
- **Errors covered:** E2 temporally correlated/non-Markovian noise and measurement-feedback model; not shared slow E3 drift merely because noise is correlated in time.
- **Mitigation used:** Engineer noise correlations and auxiliary dissipative/spiking dynamics.
- **Key quantitative results:** N = 500 comparison uses 1,000 computations. Table 2 fits TTS as p·q^√N: q = 3.21 versus 1.84 for conventional versus spiking CIM on binary d = 0.5 graphs; 3.87 versus 1.94 for weighted graphs. Success targets use solutions found by SNN-CIM, not independently certified optima throughout.
- **Relevance to Un-0:** **High** — motivates checking temporal noise structure instead of only white-jitter variance.
- **Read status:** **Partial** — PDF noise model, parameter discussion, scaling table, and target-definition caveat.

### 24. Raimondo et al. — tunable noisy phase locking

**Citation:** Eleonora Raimondo, Andrea Grimaldi, Vasyl Tyberkevych, Riccardo Tomasello, Anna Giordano, Mario Carpentieri, Andrei Slavin, Massimo Chiappini, and Giovanni Finocchio. “Adaptive Ising Machine Based on Phase Locking of an Auto-Oscillator to a Biharmonic External Driving with Noise.” *Physical Review Letters* **136**, 177201 (2026). [DOI](https://doi.org/10.1103/jv9m-4mny), [preprint PDF](https://arxiv.org/pdf/2510.19648).

- **Year / venue / type:** 2026 / Physical Review Letters / simulation.
- **System and scale:** Noisy auto-oscillator theory validated numerically with spin-torque oscillators; 101-spin MAX-CUT and 112-spin MAX-SAT examples.
- **Errors covered:** E2 phase slips/noisy driving; drive/frequency control, without a manufacturing-yield sweep.
- **Mitigation used:** Biharmonic drive moves between stochastic sampling and deterministic phase locking; ramp second-harmonic component during annealing.
- **Key quantitative results:** Benchmarks use 100 trials over 75 μs simulated time. Illustrative second-harmonic current densities 0.3 and 0.6 MA/cm² distinguish probabilistic/deterministic modes. Neither mode wins on every problem; plotted success percentages were not transcribed.
- **Relevance to Un-0:** **High** — directly connects external drive, noise, phase locking, and useful exploration.
- **Read status:** **Partial** — preprint theory/benchmark sections; published metadata verified separately.

### 25. Quinn et al. — stable polarization readout rather than optical phase readout

**Citation:** Liam Quinn, Yiqing Xu, Julien Fatome, Gian-Luca Oppo, Stuart G. Murdoch, Miro Erkintalo, and Stéphane Coen. “Coherent Ising machine based on polarization symmetry breaking in a driven Kerr resonator.” *Nature Communications* **17**, 2100 (2026). [Article](https://doi.org/10.1038/s41467-026-68794-6), [PDF](https://www.nature.com/articles/s41467-026-68794-6.pdf).

- **Year / venue / type:** 2026 / Nature Communications / hardware demonstration.
- **System and scale:** Fiber Kerr resonator; polarization-spin chains up to 100 spins with optical neighbor coupling.
- **Errors covered:** E3 drift/bias; E5 phase-sensitive-readout difficulty; E2 environmental noise seeds symmetry breaking.
- **Mitigation used:** Symmetry-protected polarization states and intensity discrimination; resonator control remains part of apparatus.
- **Key quantitative results:** Continuous trials over more than one hour without manual adjustment or rejected trials. A 64-spin distribution uses 1,500 trials; TTS points use 1,500–4,500 runs and a 99% target probability. Example annealing time 273 μs. This is chain robustness, not arbitrary dense-graph yield.
- **Relevance to Un-0:** **High** — concrete long-term/common-mode stability and readout precedent; changes the physical encoding.
- **Read status:** **Partial** — PDF/primary-text architecture, distribution, stability, and TTS sections; supplements not inspected.

### 26. Hasan et al. — hardware interactions can depart from the ideal phase model

**Citation:** Abir Hasan, E. M. Hasantha Ekanayake, Kyle Lee, Kerem Camsari, and Nikhil Shukla. “Breakdown of Gradient-Flow Dynamics in Oscillator Ising Machines from Harmonic Misalignment.” arXiv:2605.17243 (2026). [HTML inspected](https://arxiv.org/html/2605.17243v1).

- **Year / venue / type:** 2026 / arXiv preprint / theory.
- **System and scale:** Weakly coupled oscillator models; two-oscillator ring examples with 3, 5, 7, 9, and 25 inverter stages, plus LC, Duffing, van der Pol, and relaxation models. Stage counts are not spin counts.
- **Errors covered:** No direct E1–E5 sweep; systematic waveform/interaction-model error is adjacent to E1 coupling implementation error.
- **Mitigation used:** Establishes harmonic-wise quadrature requirements and a diagnostic for non-gradient interactions; no demonstrated redundancy fix.
- **Key quantitative results:** Normalized non-gradient metric δ remains above 0.3 for the studied ring configurations and for the studied threshold-switching relaxation parameter range. This measures interaction structure, not solver failure probability or a noise threshold.
- **Relevance to Un-0:** **High** — adding parameter noise to ideal sinusoids may miss systematic hardware-model error.
- **Read status:** **Partial** — main HTML derivation, model comparisons, and limitations; supplemental derivations not fully read.

## Gaps / open questions noted by the literature

1. **Redundancy exists, but its function matters.** Leleu/Kako/Reifenstein add corrective state variables, Lo pairs oscillators for connectivity, and Takesue adds aligned auxiliary spins for fields/dynamic range. None of these establishes circular-mean averaging of independent copies of learned continuous features. Repeating a graph many times and retaining the best score is also different from averaging its states. This is a bounded search conclusion, not a novelty certification or patent opinion.

2. **E4 is conspicuously weak in this set.** No included study establishes an end-to-end fault-rate curve for dead oscillators, stuck phases, and broken couplers, followed by spare remapping or coded recovery. Software-configurable links are not evidence of fault tolerance. A combined fault/noise/yield protocol would address a real evidential gap in these sources.

3. **Run randomness and chip randomness are different populations.** Thousands of initializations quantify conditional solver success. They do not estimate manufacturing yield under fixed E1 offsets. Graber's ten-chip testing is unusually relevant, but the inspected evidence does not provide a full multivariate E1–E5 yield distribution or confidence interval for a specified acceptance threshold.

4. **The closest actual mismatch result is narrow.** Shi's 10% coefficient-spread example concerns a fifth-order coefficient on one instance; Graber calibrates frequencies and delays in a particular CMOS architecture. Neither supplies a transferable “10% variation is safe” specification for learned ω, K, or K_drive. Wang's frequency-reduction argument should not erase coupling-weight, delay, waveform, or readout imperfections.

5. **Noise-as-resource is task dependent.** Wang, Dutta, Böhm, Ng, Shi, Fan, and Raimondo exploit fluctuations for search/sampling. Maher reports no conclusive extra-annealing benefit at small scale. Maximizing cut score or sampling diversity can improve while fixed-seed output reproducibility worsens. Un-0 therefore needs distinct image-preservation and distributional-generation criteria before importing these claims.

6. **Temporal, spatial, and common-mode correlations remain separate issues.** Inui shows correlation structure changes success; Fan studies temporal correlations. Neither proves redundant copies will have independent error. A shared drive, supply, reference, or decoder can leave averaging ineffective against common-mode drift. The reviewed papers do not establish a redundancy threshold for such a mixture.

7. **Binary attractor protection does not imply continuous-feature protection.** The ±π/2 restoration picture relies on phase binarization. Un-0 preserves continuous phases and decodes after roughly ten Euler steps. Whether restoring phases, adding auxiliary dynamics, or allowing more settling time preserves learned generative computation is unanswered by these works.

8. **Readout can be part of the computation.** Kako and Ng model measurement noise fed back every round trip, whereas final-only E5 injection represents a different boundary. Takesue shows a baseline problem fixed by a spin transformation; Quinn avoids phase-sensitive readout through another encoding. No included work measures a learned decoder's tolerance to phase-measurement errors or coded feature readout.

9. **Report the metric and all selection overhead.** Exact-ground-state success, approximate cut ratio, defect density, KL divergence, classification accuracy, TTS, and time-to-target are not interchangeable. For independent repeated trials, the common 99% convention is TTS = T_run·log(0.01)/log(1−p); it requires an explicit target and uncertainty on p. Include calibration, failed/filtered runs, parameter tuning, graph embedding, readout, and digital postprocessing when comparing robustness costs. Graber's threshold sweep and Quinn's no-rejection stability reporting illustrate why these details matter.

10. **Recent model-to-hardware caveat.** Hasan et al. (entry 26) identify non-gradient interaction components in realistic oscillators. This is not an E1–E5 mitigation experiment: matching an ideal sinusoidal oscillator model to hardware may require more than adding noise. Its result does not establish that useful optimization requires exact gradient flow.

11. **What this review leaves unestablished.** No direct Un-0 hardware-noise study, learned-feature analog parity code, RAID-style circular-mean recovery curve, or combined-error generative-model yield study was verified. Noise-aware oscillator learning has relevant precedent in Gower, but that is not evidence that the same fine-tuning strategy works for a class-conditional image generator. Full supplements and blocked primary robustness curves remain follow-up reading; no experiments were run for this review.
