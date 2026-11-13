# Oscillator hardware variability and mitigation

Search date: 2026-11-13. Scope: osc-hardware-variability; literature sought from 2015–2026, emphasizing 2022–2026.
Both supplied seeds are verified: arXiv:2211.05497 is the DONN mismatch study; s44335-024-00015-z is a 2024 review (Entries 01–02).
Fixed oscillator mismatch and coupling variability have already been studied separately, including random parameter ensembles (Entries 01, 03).
Frequency errors can be much more damaging than coupling errors, but tolerance depends strongly on architecture and task (Entries 01, 03, 06).
Measured CMOS mitigation includes frequency trimming, reference-phase alignment, and routing-delay calibration (Entry 04).
VO₂ work also addresses manufacturing uniformity, bias compensation, and temperature-dependent loss of oscillation (Entries 07–10, 22).
Synchronization can reduce spintronic linewidth with increasing oscillator count, providing a physical redundancy precedent (Entries 11–15).
Noise can help locking or optimization in some regimes; those benefits do not establish fidelity of continuous learned phase features (Entries 05, 16, 24).
Photonic “error correction” includes feedback and amplitude regulation, which must be distinguished from redundant analog error-correcting codes (Entries 18–20).
No retained work establishes the complete Un-0 proposal: class-conditional image generation, E1–E5 isolation, copy/feature redundancy, and combined-error chip-yield evaluation.

Taxonomy follows `notes/hardware-error-catalog.md`: **E1** fixed manufacturing mismatch; **E2** stochastic integration noise/jitter; **E3** shared environmental/aging drift; **E4** dead/stuck devices or broken connections; **E5** final readout error. Mapping papers onto these labels is this review's interpretation. Input corruption, random initial states, and optimization failures are not automatically hardware errors. “Partial” means specified sections of the primary text were read, not that the entire paper/supplement was checked. Numerical results are the authors' reports unless explicitly labeled as calculations.

## Entries

### 01 — Device mismatch in differential ONNs (verified seed)

**Citation:** Jafar Shamsi, María José Avedillo, Bernabé Linares-Barranco, and Teresa Serrano-Gotarredona. “Effect of Device Mismatches in Differential Oscillatory Neural Networks.” *IEEE Transactions on Circuits and Systems I: Regular Papers* **70**(2), 872–883 (2023; online 2022). [DOI](https://doi.org/10.1109/TCSI.2022.3221540); [arXiv paper](https://arxiv.org/pdf/2211.05497).

- **Year / venue / type:** 2023, preprint 2022 / IEEE TCSI / simulation.
- **System and scale:** VO₂ differential oscillatory neurons and memristor-bridge synapses; principal mismatch comparisons at 8 and 16 neurons, plus a 4-neuron single-ended comparison.
- **Errors:** E1, separately in neuron components and synaptic resistances. Not an E2–E5 campaign.
- **Mitigation:** Differential architecture and device-parameter design-space optimization; calibration suggested, not implemented.
- **Key quantitative results:** Synchronization/stability stay above 90% below 20% synaptic-resistance relative standard deviation (RSD); retrieval is robust to approximately 15%. Natural-frequency RSD of 0.5% causes desynchronization/instability. Optimizing thresholds increases tolerated threshold-voltage RSD by 7.5× and 2.5× for 8 and 16 neurons under the paper's >80% performance criteria. Ten mismatch realizations per sweep point.
- **Relevance to Un-0:** **High** — direct precedent for separate omega-like and K-like mismatch sweeps, with strongly different sensitivities.
- **Read status:** **Partial** — primary PDF mismatch methods/results, sensitivity analysis, design exploration, conclusion, and references.

### 02 — Cross-technology oscillator-computing review (verified seed)

**Citation:** Aida Todri-Sanial, Corentin Delacour, Madeleine Abernot, and Filip Sabo. “Computing with oscillators from theoretical underpinnings to applications and demonstrators.” *npj Unconventional Computing* **1**, 14 (2024). [Publisher](https://www.nature.com/articles/s44335-024-00015-z); [accessible publisher PDF](https://pure.tue.nl/ws/portalfiles/portal/347235748/s44335-024-00015-z.pdf).

- **Year / venue / type:** 2024 / npj Unconventional Computing / review.
- **System and scale:** CMOS ring/relaxation oscillators, transition-metal oxides, spintronics, optical and mechanical approaches; no new hardware population.
- **Errors:** E1/E2 explicitly discussed; technology-dependent nonidealities and interconnect parasitics. No unified E1–E5 benchmark.
- **Mitigation:** Reviews injection locking, architecture choice, training, and physical coupling design; identifies substantial remaining scaling and learning challenges.
- **Key quantitative results:** Comparative example: 1,968 ring oscillators operating at 1 GHz. These are cited demonstrator figures, not new robustness measurements. The review supplies no universal mismatch threshold or redundancy-gain number.
- **Relevance to Un-0:** **High** — useful citation map; explains why weak-coupling phase-only models can omit waveform/amplitude effects important in hardware.
- **Read status:** **Partial** — oscillator models, architecture/demonstrator discussion, challenges, future directions, and selected references in the 17-page repository PDF.

### 03 — Weakly coupled Kuramoto architecture with variability ensembles

**Citation:** Damir Vodenicarevic, Nicolas Locatelli, Flavio Abreu Araujo, Julie Grollier, and Damien Querlioz. “A Nanotechnology-Ready Computing Scheme based on a Weakly Coupled Oscillator Network.” *Scientific Reports* **7**, 44772 (2017). [Primary full text](https://www.nature.com/articles/srep44772?error=cookies_not_supported).

- **Year / venue / type:** 2017 / Scientific Reports / simulation.
- **System and scale:** Kuramoto recognition network; reference system has 4 core and 2 input oscillators, 500–680 MHz input sweep, 1 μs trajectories.
- **Errors:** E1 natural frequencies and coupling strengths; E2 phase diffusion; coupling phase lags. E5 detector design is discussed, without an independent readout-noise sweep.
- **Mitigation:** Quasi-synchronization readout, greater frequency spacing/coupling, tunable biases. Authors explicitly attribute coupling tolerance to redundant connections.
- **Key quantitative results:** 70% reference-map agreement at 1 MHz isolated-oscillator linewidth. Across 100 random draws, worst-case agreement remains >70% for ±2 MHz frequency offsets or 20% coupling variation. Uniform coupling phase lag beyond π/6 gives <50% agreement.
- **Relevance to Un-0:** **High** — closest early precedent for E1/E2 sweeps, random-chip-like ensembles, and redundancy; map agreement is not image quality or formal manufacturing yield.
- **Read status:** **Partial** — model, detector, noise, frequency/coupling variability, phase-lag and nonlinearity sections.

### 04 — CMOS calibration at 1,440-oscillator scale

**Citation:** Markus Graber and Klaus Hofmann. “An integrated coupled oscillator network to solve optimization problems.” *Communications Engineering* **3**, 116 (2024). [Primary full text](https://www.nature.com/articles/s44172-024-00261-w?error=cookies_not_supported).

- **Year / venue / type:** 2024 / Communications Engineering / hardware demonstration.
- **System and scale:** 28 nm CMOS Ising/QUBO chip: 1,440 oscillators, 11,724 coupling elements, including 2,584 routable connections.
- **Errors:** E1 oscillator mismatch; propagation-delay and reference-phase errors; E3 process/voltage/temperature dependence discussed. Readout alignment is not a standalone E5 noise experiment.
- **Mitigation:** On-chip coarse/fine frequency calibration; externally assisted reference-phase and routing-delay calibration; SHIL.
- **Key quantitative results:** Free-running frequencies span 75.6–119.1 MHz. Calibration to 100 MHz reduces frequency standard deviation from 6.7 to 0.33 MHz; average computing accuracy improves by about 0.7 percentage points. Routing calibration uses 100 ps delay steps. Reported solving time is 950 ns, typically 319 μW per node.
- **Relevance to Un-0:** **High** — concrete calibration baseline and evidence that frequency, drive/reference alignment, and coupling delay need separate treatment.
- **Read status:** **Partial** — system description, parameter sensitivity, and all three calibration routines.

### 05 — Mixed-signal Saturated Kuramoto ONN

**Citation:** Corentin Delacour, Stefania Carapezzi, Gabriele Boschetto, Madeleine Abernot, Thierry Gil, Nadine Azemard, and Aida Todri-Sanial. “A mixed-signal oscillatory neural network for scalable analog computations in phase domain.” *Neuromorphic Computing and Engineering* **3**, 034004 (2023). [DOI](https://doi.org/10.1088/2634-4386/ace9f5); [published PDF](https://pure.tue.nl/ws/portalfiles/portal/331787953/Delacour_2023_Neuromorph._Comput._Eng._3_034004.pdf).

- **Year / venue / type:** 2023 / Neuromorphic Computing and Engineering / hardware demonstration.
- **System and scale:** 9-neuron PCB and 16-neuron CMOS ASIC; larger simulated networks. Noise study uses 12, 16, 24, 32, and 48 nodes.
- **Errors:** E2 Gaussian white current noise; frequency mismatch and interconnect phase lag discussed as E1/design concerns.
- **Mitigation:** Analog local phase computation with digital signal propagation; bias tuning and architectural shielding. Moderate noise can assist optimization.
- **Key quantitative results:** Estimated ASIC input-current noise coefficient ≈0.8 pA in the paper's convention. Simulated robustness up to about 15 pA; degradation above that level. At 2.5 pA, an example finds a better cut than the noiseless network. Evaluation after 100 cycles; 10 random graphs per size/density setting.
- **Relevance to Un-0:** **High** — explicit ODE-to-SDE hardware-noise model; its dimensional current-noise coefficient cannot be copied directly into Un-0 phase noise.
- **Read status:** **Partial** — architecture, hardware scope, stochastic equations, noise results, discussion.

### 06 — Computing despite heterogeneous natural frequencies

**Citation:** Nil Dinç, Filip Sabo, and Aida Todri-Sanial. “Harnessing Phase Dynamics Across Diverse Frequencies with Multifrequency Oscillatory Neural Networks.” *Advanced Intelligent Discovery* **2**(5), e202500152 (2026; first online 26 December 2025). [Primary full text](https://advanced.onlinelibrary.wiley.com/doi/10.1002/aidi.202500152).

- **Year / venue / type:** 2026 issue, 2025 online / Advanced Intelligent Discovery / hardware demonstration.
- **System and scale:** Four resistively coupled Wien-bridge oscillators; complementary Kuramoto pattern-retrieval simulations.
- **Errors:** E1-like frequency mismatch; component/parasitic deviations. No stochastic or fault-yield campaign.
- **Mitigation:** Rescale learned coupling weights; in hardware reduce coupling resistances, subject to physical limits.
- **Key quantitative results:** Baseline locking fails for 13.2 versus 13.4 kHz at 10 kΩ coupling. Authors call this approximately 2%; the stated frequencies imply approximately 1.5% (reviewer's calculation). Heterogeneous frequencies 10.4, 13.2, 14.1, and 17.6 kHz lock near 12 kHz using 220 Ω couplings and retrieve two configured patterns.
- **Relevance to Un-0:** **High** — frequency dispersion need not be eliminated; changing K can compensate, but also changes dynamics and may exceed hardware coupling limits.
- **Read status:** **Partial** — methods and hardware implementation/results, Tables 1–3. Publication-year ambiguity resolved from issue and online dates.

### 07 — Reducing VO₂ manufacturing variability

**Citation:** Olivier Maher, Roy Bernini, Nele Harnack, Bernd Gotsmann, Marilyne Sousa, Valeria Bragaglia, and Siegfried Karg. “Highly reproducible and CMOS-compatible VO₂-based oscillators for brain-inspired computing.” *Scientific Reports* **14**, 11600 (2024). [Primary full text](https://www.nature.com/articles/s41598-024-61294-x); [IBM record](https://research.ibm.com/publications/highly-reproducible-and-cmos-compatible-volesssubgreater2lesssubgreater-based-oscillators-for-brain-inspired-computing).

- **Year / venue / type:** 2024 / Scientific Reports / hardware demonstration.
- **System and scale:** Silicon-compatible crossbar VO₂ devices; seven devices characterized together.
- **Errors:** E1 switching-threshold dispersion; E2 cycle-to-cycle amplitude variation. Oscillation failure from excessive variability/coupling is discussed, not an injected E4 test.
- **Mitigation:** ALD/annealing optimization and HfO₂ substrate interlayer; select sufficiently matched devices.
- **Key quantitative results:** Oscillation amplitude varies <3.5% over 250 cycles within one device; transition voltages vary up to 10% across devices. Authors select crossbars with <5% device-to-device variability for easier synchronization. Excessive coupling can cause oscillation failure or breakdown.
- **Relevance to Un-0:** **High** — grounds hardware distributions and shows that mismatch, coupling, and device survival interact; simple independent Gaussian errors are only an initial approximation.
- **Read status:** **Partial** — fabrication motivation, variability/reproducibility results, and network discussion; supplement not comprehensively read.

### 08 — VO₂ Ising hardware with frequency compensation and SHIL

**Citation:** Olivier Maher, Manuel Jiménez, Corentin Delacour, Nele Harnack, Juan Núñez, María J. Avedillo, Bernabé Linares-Barranco, Aida Todri-Sanial, Giacomo Indiveri, and Siegfried Karg. “A CMOS-compatible oscillation-based VO₂ Ising machine solver.” *Nature Communications* **15**, 3334 (2024). [Primary full text](https://www.nature.com/articles/s41467-024-47642-5?error=cookies_not_supported).

- **Year / venue / type:** 2024 / Nature Communications / hardware demonstration.
- **System and scale:** Up to nine capacitively coupled VO₂ crossbar oscillators on silicon; graph coloring, Max-cut, and Max-3SAT.
- **Errors:** E1 frequency/parasitic dispersion and E2 cycle variability. Sparse problem graphs are not broken-coupling fault tests.
- **Mitigation:** External load capacitance compensates contact/parasitic differences; second-harmonic injection locks/binarizes phases; problem-specific tuning.
- **Key quantitative results:** Stable states within 25 cycles; reported convergence easier at graph density η>0.4. A representative single-device trace uses 220 K, 5 V, 50 kΩ, and 11.27 nF. Additional noise/SHIL annealing did not establish improvements in their small hardware networks.
- **Relevance to Un-0:** **High** — measured mismatch mitigation and a useful negative result; SHIL's binary phases would constrain a continuous-phase generator.
- **Read status:** **Partial** — abstract, oscillator design, SHIL, experimental limitations and discussion. Not all supplements checked.

### 09 — Ambient-temperature drift can stop VO₂ oscillation

**Citation:** Stefania Carapezzi, Corentin Delacour, Andrew Plews, Ahmed Nejim, Siegfried Karg, and Aida Todri-Sanial. “Role of ambient temperature in modulation of behavior of vanadium dioxide volatile memristors and oscillators for neuromorphic applications.” *Scientific Reports* **12**, 19377 (2022). [Primary full text](https://www.nature.com/articles/s41598-022-23629-4?error=cookies_not_supported).

- **Year / venue / type:** 2022 / Scientific Reports / simulation.
- **System and scale:** Single-device 3D electrothermal TCAD plus oscillator load circuit; network crosstalk implications discussed.
- **Errors:** E3 temperature dependence, with possible spatially nonuniform thermal crosstalk; E4-like cessation is an operating-point consequence, not a permanent defect model.
- **Mitigation:** Model-based choice of load line/capacitance and operating range; no demonstrated closed-loop compensation.
- **Key quantitative results:** At 3 V and 15 kΩ, sustained oscillation exists over 293–307 K, disappearing outside that interval for the specified circuit. Frequency max/min variation is 22% at 150 nF and 29% at 40 nF. Frequency dependence is nonmonotonic.
- **Relevance to Un-0:** **High** — shared temperature drift need not be a linear common omega offset; it may alter amplitude, coupling, and oscillatory operation together.
- **Read status:** **Partial** — temperature/load-line analysis, frequency/amplitude/power results, conclusions.

### 10 — VO₂ feature filter with per-device bias adjustment

**Citation:** Elisabetta Corti, Joaquin Antonio Cornejo Jimenez, Kham M. Niang, John Robertson, Kirsten E. Moselund, Bernd Gotsmann, Adrian M. Ionescu, and Siegfried Karg. “Coupled VO₂ Oscillators Circuit as Analog First Layer Filter in Convolutional Neural Networks.” *Frontiers in Neuroscience* **15**, 628254 (2021). [Primary full text](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2021.628254/full).

- **Year / venue / type:** 2021 / Frontiers in Neuroscience / hardware demonstration.
- **System and scale:** Four crossbar VO₂ oscillators experimentally; proposed oscillator filtering layer evaluated with VGG13/MNIST.
- **Errors:** E1 device variability, E2 fluctuations/crosstalk; E5 phase-extraction scatter discussed without isolated detector-noise injection.
- **Mitigation:** Tune transistor gates and oscillator input voltages to align frequencies; use relative-phase reference.
- **Key quantitative results:** Approximately 10% device-to-device variability compensated with Vg=1.4–1.6 V and Vin=1.8–2.2 V. Four phase patterns identified, but fluctuations/crosstalk hinder experimental input-delay pattern recognition. Reported 95% MNIST performance belongs to the architecture evaluation, not a fully physical CNN.
- **Relevance to Un-0:** **High** — direct learned-feature/decoder analogy and practical evidence that observing stable patterns is weaker than reliable end-to-end inference.
- **Read status:** **Partial** — abstract, four-oscillator results, variability compensation, and classification scope.

### 11 — Two-dimensional SHNO arrays and collective noise reduction

**Citation:** Mohammad Zahedinejad, Ahmad A. Awad, Shreyas Muralidhar, Roman Khymyn, Himanshu Fulara, Hamid Mazraati, Mykola Dvornik, and Johan Åkerman. “Two-dimensional mutually synchronized spin Hall nano-oscillator arrays for neuromorphic computing.” *Nature Nanotechnology* **15**, 47–52 (2020; online 2019). [Publisher](https://www.nature.com/articles/s41565-019-0593-9?error=cookies_not_supported).

- **Year / venue / type:** 2020 / Nature Nanotechnology / hardware demonstration.
- **System and scale:** 2×2 through 8×8 SHNO nanoconstriction arrays; 4×4 synchronization maps for neuromorphic use.
- **Errors:** E2 linewidth/phase noise; fabrication nonuniformity implicit, with no isolated E1 threshold established in the abstract.
- **Mitigation:** Mutual synchronization and collective operation.
- **Key quantitative results:** Robust synchronization up to 64 constrictions; short-timescale Q increases linearly with synchronized count, reaching 170,000. Response to two independently tuned microwave inputs yields recognition-relevant synchronization maps.
- **Relevance to Un-0:** **High** — physical precedent for noise suppression through multiple oscillators; synchronizing one collective mode is different from averaging many distinct learned features.
- **Read status:** **Abstract-only** — publisher abstract and public figure descriptions; full article was subscription restricted.

### 12 — Limits of synchronization in long SHNO chains

**Citation:** Akash Kumar, Himanshu Fulara, Roman Khymyn, Mohammad Zahedinejad, Mona Rajabali, Xiaotian Zhao, Nilamani Behera, Afshin Houshang, Ahmad A. Awad, and Johan Åkerman. “Robust mutual synchronization in long spin Hall nano-oscillator chains.” *Nano Letters* (2023). [DOI](https://doi.org/10.1021/acs.nanolett.3c02036); [primary preprint](https://arxiv.org/pdf/2301.03859).

- **Year / venue / type:** 2023 / Nano Letters / hardware demonstration.
- **System and scale:** Chains up to 50 constrictions in W/NiFe, W/CoFeB/MgO, and NiFe/Pt stacks.
- **Errors:** E2 linewidth/coherence, and nonuniform dynamics/partial synchronization associated with scaling; no independent E1–E5 sweep.
- **Mitigation:** Mutual synchronization; current/field operating-point selection.
- **Key quantitative results:** Robust complete locking up to 21 constrictions; linewidth below 200 kHz, Q above 79,000, operation around 10 GHz; peak power enhancement up to 400×. Chains longer than 21 can lock but more readily split into partially synchronized states. Reported tunability spans 2–28 GHz across conditions.
- **Relevance to Un-0:** **High** — redundancy gains can saturate or fail through collective modes; count alone does not guarantee robustness.
- **Read status:** **Partial** — primary PDF abstract/introduction, including reported synchronization/scaling results; journal identity verified through arXiv DOI record.

### 13 — Nonvolatile SHNO frequency trimming

**Citation:** Jong-Guk Choi, Jaehyeon Park, Min-Gu Kang, Doyoon Kim, Jae-Sung Rieh, Kyung-Jin Lee, Kab-Jin Kim, and Byong-Guk Park. “Voltage-driven gigahertz frequency tuning of spin Hall nano-oscillators.” *Nature Communications* **13**, 3783 (2022). [Primary full text](https://www.nature.com/articles/s41467-022-31493-z?error=cookies_not_supported).

- **Year / venue / type:** 2022 / Nature Communications / hardware demonstration.
- **System and scale:** Individual gated SHNO devices using perpendicular-anisotropy Co/Ni multilayers; not a large trained array.
- **Errors:** E1 mitigation capability via frequency adjustment; no quantified mismatch-distribution or E2–E5 test.
- **Mitigation:** Nonvolatile voltage-controlled magnetic anisotropy; cumulative frequency programming independent of drive current.
- **Key quantitative results:** Up to 2.1 GHz tuning at 1.25 MV/cm; magnetic-anisotropy change up to 0.22 T. Demonstrated material-characterization programming applies gate voltage for 5 min at 150 °C, then measures at room temperature; not instantaneous ambient-temperature trimming.
- **Relevance to Un-0:** **Med** — shows a physical mechanism to store corrected omega values, but does not validate generic per-chip calibration or phase-copy averaging.
- **Read status:** **Partial** — abstract, tuning mechanism, programming conditions, and principal results.

### 14 — Spin-wave coupling phase is an adjustable hardware variable

**Citation:** Akash Kumar, Avinash Kumar Chaurasiya, Victor H. González, Nilamani Behera, Ademir Alemán, Roman Khymyn, Ahmad A. Awad, and Johan Åkerman. “Spin-wave-mediated mutual synchronization and phase tuning in spin Hall nano-oscillators.” *Nature Physics* **21**, 245–252 (2025). [Primary full text](https://www.nature.com/articles/s41567-024-02728-1?error=cookies_not_supported).

- **Year / venue / type:** 2025 / Nature Physics / hardware demonstration.
- **System and scale:** Two nanoconstriction SHNOs; electrical and phase-resolved Brillouin-light-scattering measurements plus micromagnetic simulations.
- **Errors:** E1/design variability in coupling phase and frequency is relevant; direct work concerns controllability, not a randomized mismatch campaign. Current/field dependence could mediate drift, but E3 compensation is not demonstrated.
- **Mitigation:** Adjust current or magnetic field; explore voltage-gated phase control in simulation.
- **Key quantitative results:** Variable-phase mutual synchronization between two oscillators separated by >200 nm. Phase-resolved maps are reported at 0.55, 0.70, and 0.75 mA; avoid interpreting detection reference settings as the interoscillator phase range.
- **Relevance to Un-0:** **Med** — scalar K-strength errors omit hardware coupling-phase errors, which may require an additional lag parameter.
- **Read status:** **Partial** — abstract/main motivation and phase-resolved measurement descriptions; no full supplementary audit.

### 15 — 105,000 synchronized SHNOs: current 2026 scaling evidence

**Citation:** Nilamani Behera, Avinash Kumar Chaurasiya, Akash Kumar, Roman Khymyn, Artem Litvinenko, Lakhan Bainsla, Ahmad A. Awad, and Johan Åkerman. “Nanosecond phase ordering in ultra-large spin Hall nano-oscillator lattices for unconventional computing.” *Nature Nanotechnology* **21**, 1105–1112 (2026). [Primary full text](https://www.nature.com/articles/s41565-026-02216-y?error=cookies_not_supported).

- **Year / venue / type:** 2026 / Nature Nanotechnology / hardware demonstration.
- **System and scale:** W–Ta/CoFeB/MgO lattices up to 105,000 SHNOs, widths 10–20 nm, pitches 24–40 nm.
- **Errors:** E2 collective linewidth; thermal management relevant to E3. No programmed heterogeneous computation or injected fault-yield results.
- **Mitigation:** Dense coupling, efficient stack, improved heat removal, mutual synchronization.
- **Key quantitative results:** Power scales as N and linewidth as N⁻¹. Best linewidth 25.3 kHz at 26.2 GHz gives Q≈1.04×10⁶. Synchronization proxy rises from about 10 ns for 100 oscillators to 45 ns for 105,000; defined using 10–90% integrated BLS rise time.
- **Relevance to Un-0:** **High** — strong physical redundancy precedent; coherent emission does not demonstrate arbitrary learned omega/K/K_drive or error-corrected generation.
- **Read status:** **Partial** — main scaling results, thermal-design rationale, time-resolved measurements, conclusions.

### 16 — MEMS noise-assisted recovery and drift suppression

**Citation:** Zhan Shi, Qiangfeng Lv, Mengqi Fu, Xuefeng Wang, Zhilong Huang, Xueyong Wei, Marco Amabili, and Ronghua Huan. “Noise-enhanced stability in synchronized systems.” *Science Advances* **11**(31), eadx1338 (2025). [DOI](https://doi.org/10.1126/sciadv.adx1338); [primary full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC12315954/).

- **Year / venue / type:** 2025 / Science Advances / hardware demonstration.
- **System and scale:** Two electrostatically coupled micromechanical oscillators; separate validation with two macroscale rotors.
- **Errors:** E2 injected broadband noise; E3-like thermal/disturbance-induced frequency shifts, not a shared-temperature aging sweep.
- **Mitigation:** Controlled white-noise injection to assist synchronization and recovery.
- **Key quantitative results:** One-minute frequency drift falls from 0.023 to 0.012 Hz/s as injected noise increases from 0 to 1 Vpp. Short-term stability (<10 s) worsens while long-term stability (>10 s) improves. A 0.5 mA, 50 ms perturbation causes desynchronization; 0.5 Vpp noise restores locking. Excessive noise lengthens synchronization time.
- **Relevance to Un-0:** **Med** — cautions against assuming monotonic noise damage; benefit depends on timescale and desired computation.
- **Read status:** **Partial** — primary abstract, experimental results, Fig. 3 description, discussion and methods; supplement not fully checked.

### 17 — Widening MEMS locking tolerance

**Citation:** Jiahao Song, Yutao Xu, Qiqi Yang, Ronghua Huan, and Xueyong Wei. “Synchronization bandwidth enhancement induced by a parametrically excited oscillator.” *Microsystems & Nanoengineering* **10**, 95 (2024). [Primary full text](https://www.nature.com/articles/s41378-024-00709-1?error=cookies_not_supported).

- **Year / venue / type:** 2024 / Microsystems & Nanoengineering / hardware demonstration.
- **System and scale:** A parametrically excited SOI MEMS resonator with PLL feedback and external injection; not an ONN classifier.
- **Errors:** E1-like frequency detuning tolerance; stability/noise motivation. No manufacturing ensemble or E4/E5 error campaign.
- **Mitigation:** Parametric excitation and nonlinear-response engineering expand injection-locking range.
- **Key quantitative results:** Synchronization bandwidth 8.85 kHz, >94% of hysteresis interval. Resonator natural frequency 52.86 kHz; reported hysteresis interval 9.32 kHz, under vacuum <0.1 Pa. Representative parametric drive: 550 mV AC and 35 V DC.
- **Relevance to Un-0:** **Med** — establishes that locking margins depend on oscillator physics; a fixed universal mismatch percentage is inappropriate.
- **Read status:** **Partial** — abstract, experimental setup, nonlinear-response and synchronization sections.

### 18 — Photonic error-detection/correction feedback

**Citation:** Satoshi Kako, Timothée Leleu, Yoshitaka Inui, Farad Khoyratee, Sam Reifenstein, and Yoshihisa Yamamoto. “Coherent Ising machines with error correction feedback.” *Advanced Quantum Technologies*, 2000045 (2020). [DOI](https://doi.org/10.1002/qute.202000045); [primary manuscript HTML](https://arxiv.org/html/2005.10895v2).

- **Year / venue / type:** 2020 / Advanced Quantum Technologies / simulation.
- **System and scale:** Measurement-feedback degenerate optical parametric oscillator (DOPO) network; SK spin-glass benchmarks up to 300 spins.
- **Errors:** E2 quantum fluctuations and E5-like homodyne measurement uncertainty; amplitude heterogeneity is an additional analog error, not necessarily fabrication E1.
- **Mitigation:** Feedback modulates pump, coupling, and target intensity to escape local minima and regulate dynamics; no parity code.
- **Key quantitative results:** With optimized feedback and normalized computation time tmax=N², mean success probabilities are 94%, 93%, 88%, 84%, and 90% for N=100, 150, 200, 250, and 300, averaged over 10 instances per size. These are optimizer success rates, not chip yields.
- **Relevance to Un-0:** **High** — prior analog “error correction,” but objective-dependent feedback differs from preserving generator trajectories through redundancy.
- **Read status:** **Partial** — mechanism, measurement-noise description, scaling table, conclusions.

### 19 — Optical auxiliary error pulses

**Citation:** Sam Reifenstein, Satoshi Kako, Farad Khoyratee, Timothée Leleu, and Yoshihisa Yamamoto. “Coherent Ising Machines with Optical Error Correction Circuits.” *Advanced Quantum Technologies* **4**(11), 2100077 (2021). [DOI](https://doi.org/10.1002/qute.202100077); [primary manuscript HTML](https://arxiv.org/html/2108.07369v1).

- **Year / venue / type:** 2021 / Advanced Quantum Technologies / proposal.
- **System and scale:** Proposed optical CIM with N signal and N auxiliary error pulses; simulations include 100/800-spin noise/energy studies and larger benchmark graphs.
- **Errors:** E2 quantum noise; E5-like extraction/homodyne uncertainty; amplitude heterogeneity. Not a fabricated mismatch-tolerant coded chip.
- **Mitigation:** Chaotic amplitude control, chaotic feedback control, separated feedback control, phase-sensitive amplification.
- **Key quantitative results:** At N=100 with extraction reflectivity RB=0.1, success probability is nearly unchanged for saturation parameter g²≲10⁻⁴ but drops rapidly above 10⁻³. Noise performance averaged over 100 SK instances. Optical implementation needs auxiliary error channels and N² pump-weight pulses.
- **Relevance to Un-0:** **High** — relevant redundancy/control overhead precedent; “error pulses” are feedback state, not RAID copies or an analog parity code.
- **Read status:** **Partial** — architecture, optical implementation, quantum-noise equations/results, selected benchmark details.

### 20 — Microwave-photonic encoding reduces environmental sensitivity

**Citation:** Qizhuang Cen, Hao Ding, Tengfei Hao, Shanhong Guan, Zhiqiang Qin, Jiaming Lyu, Wei Li, Ninghua Zhu, Kun Xu, Yitang Dai, and Ming Li. “Large-scale coherent Ising machine based on optoelectronic parametric oscillator.” *Light: Science & Applications* **11**, 333 (2022). [Primary full text](https://www.nature.com/articles/s41377-022-01013-1?error=cookies_not_supported).

- **Year / venue / type:** 2022 / Light: Science & Applications / hardware demonstration.
- **System and scale:** 25,600 time-multiplexed microwave-phase spins in a 20 km optoelectronic cavity.
- **Errors:** E2 timing/shot/thermal noise; E3 temperature/vibration-induced phase drift. No isolated E4 or detector-noise sweep.
- **Mitigation:** Encode spins at microwave rather than optical carrier frequency, reducing phase sensitivity to cavity-delay variation; parametric 0/π locking.
- **Key quantitative results:** 10 GHz microwave pulses, 4 ns spacing (250 MHz repetition); stable operation over 12 h. Cavity-length/oscillation-wavelength ratio decreases from roughly 10⁹ for optical encoding to 10⁶. Long-term stability test is specifically on noninteracting spins.
- **Relevance to Un-0:** **Med** — encoding/reference choice can dominate shared-drift tolerance; time-multiplexed spins do not equal independent manufactured oscillator copies.
- **Read status:** **Partial** — abstract, stability rationale, setup and noninteracting-spin stability results.

### 21 — Hardware learning compensates tunable spin-torque dynamics

**Citation:** Miguel Romera, Philippe Talatchian, Sumito Tsunegi, Flavio Abreu Araujo, Vincent Cros, Paolo Bortolotti, Juan Trastoy, Kay Yakushiji, Akio Fukushima, Hitoshi Kubota, Shinji Yuasa, Maxence Ernoult, Damir Vodenicarevic, Tifenn Hirtzlin, Nicolas Locatelli, Damien Querlioz, and Julie Grollier. “Vowel recognition with four coupled spin-torque nano-oscillators.” *Nature* **563**, 230–234 (2018). [DOI](https://doi.org/10.1038/s41586-018-0632-y); [primary manuscript](https://arxiv.org/pdf/1711.02704).

- **Year / venue / type:** 2018 / Nature / hardware demonstration.
- **System and scale:** Four electrically coupled spin-torque oscillators; seven vowels, 37 female speakers; two microwave input frequencies.
- **Errors:** E1 frequency differences and E2 noise; simulations separate ideal/noiseless behavior with 2% natural-frequency mismatch.
- **Mitigation:** Real-time hardware learning tunes individual bias currents/frequencies; mutual coupling expands locking ranges.
- **Key quantitative results:** Up to 89% training and 88% held-out recognition; average cross-validation test accuracy 84.3%. Ideal noiseless comparison reaches 94% training accuracy. Thirty trained parameters include the input mapping and four oscillator currents.
- **Relevance to Un-0:** **High** — precedent for adapting learned oscillator parameters to physical devices, with a clear hardware/software performance gap.
- **Read status:** **Partial** — learning/results and ideal-device comparison in primary manuscript; not all supplementary analysis.

### 22 — Calibratable VO₂ neurons with measured device data (2026)

**Citation:** Zhiyuan Li, Jie Gong, Wei Tang, Beining Zhang, Weihao Niu, Zhengzhe Zhang, Zhiyuan Liu, Xiangshui Miao, and Rui Yang. “Calibratable Oscillatory Neurons Based on VO₂ Memristors for Precision Neuromorphic Computing.” *IEEE Electron Device Letters* **47**(3), 518–521 (2026; online 29 December 2025). [DOI](https://doi.org/10.1109/LED.2025.3649000); [author-uploaded primary text](https://www.researchgate.net/publication/399168228_Calibratable_Oscillatory_Neurons_Based_on_VO_2_Memristors_for_Precision_Neuromorphic_Computing).

- **Year / venue / type:** 2026 / IEEE Electron Device Letters / hardware demonstration.
- **System and scale:** Cr₂O₃-buffered VO₂ devices and 1T1M oscillator neurons; 10 devices for device-to-device statistics; simulated 784–400–10 Fashion-MNIST SNN.
- **Errors:** E1 and cycle-to-cycle E2 device variability; input-image noise is not hardware jitter.
- **Mitigation:** Buffer-layer fabrication and transistor-gate calibration.
- **Key quantitative results:** C2C variation 0.26%; endurance >10¹² cycles. Simulated inter-neuron frequency dispersion falls from 10.1% to 1.8%; simulated accuracy recovers from 78.4% to 88.37%. These network/calibration-distribution results are not a physically implemented multilayer network.
- **Relevance to Un-0:** **Med** — recent calibration precedent; SNN firing-rate encoding differs from phase-coupled generative dynamics.
- **Read status:** **Partial** — author-uploaded device/results text and figures. Page-header dates override the upload page's erroneous “January 2025” metadata; publisher DOI access failed.

### 23 — Large CMOS ring array and phase-readout correction

**Citation:** William Moy, Ibrahim Ahmed, Po-wei Chiu, John Moy, Sachin S. Sapatnekar, and Chris H. Kim. “A 1,968-node coupled ring oscillator circuit for combinatorial optimization problem solving.” *Nature Electronics* **5**, 310–317 (2022). [Publisher](https://www.nature.com/articles/s41928-022-00749-3?error=cookies_not_supported).

- **Year / venue / type:** 2022 / Nature Electronics / hardware demonstration.
- **System and scale:** 1,968-node King's-graph ring oscillator array with five coupling-strength levels and multiphase phase measurement.
- **Errors:** E1/environmental variations claimed as tolerable; E5-related phase measurement/nonideal map effects addressed. Public text does not quantify an isolated E5 noise threshold.
- **Mitigation:** Multiphase measurement; extended-data description says relative-phase postprocessing eliminates nonideal effects in spin maps. Further calibration details were not accessible.
- **Key quantitative results:** Up to 95% accuracy on randomly generated optimization problems; average measured power 0.042 W; convergence in <50 oscillation cycles. Accuracy is an optimization metric, not image recognition or manufacturing yield.
- **Relevance to Un-0:** **High** — hardware scale and evidence that readout conventions/postprocessing matter, but binary spin-map correction may discard useful continuous phase information.
- **Read status:** **Partial** — abstract, public circuit/measurement descriptions and extended-data caption; main article subscription restricted.

### 24 — Common noise can aid frequency locking

**Citation:** Jaykumar Vaidya, Mohammad Khairul Bashar, and Nikhil Shukla. “Using noise to augment synchronization among oscillators.” *Scientific Reports* **11**, 4462 (2021; preprint 2020). [Publisher](https://www.nature.com/articles/s41598-021-83806-9); [primary manuscript](https://arxiv.org/pdf/2012.01355).

- **Year / venue / type:** 2021 / Scientific Reports / hardware demonstration.
- **System and scale:** Two to four Schmitt-trigger relaxation oscillators; four-node graph-coloring demonstration.
- **Errors:** E1-like deliberately different frequencies and E2 shared injected white noise. Shared fast noise is not E3 slow drift.
- **Mitigation:** Common-noise-induced frequency locking reduces necessary capacitive coupling.
- **Key quantitative results:** In a representative pair, locking begins at 270 mVrms injected noise; isolated linewidths of 20 and 32 Hz become 10 Hz when locked. Four-oscillator computation locks with 1 pF coupling plus noise versus 5 pF without noise, a 5× reduction.
- **Relevance to Un-0:** **High** — noise correlations change collective behavior; independent oscillator jitter and common noise require distinct models. Locking benefit need not imply generator-output fidelity.
- **Read status:** **Partial** — primary manuscript experimental circuit, pair/four-oscillator noise results and graph-coloring description; publication verified against journal record.

## Gaps / open questions noted by the literature

- **What has already been done:** Separate frequency/coupling mismatch studies, phase-noise sweeps, random fabrication-like ensembles, hardware calibration, and synchronization-based noise suppression all predate Un-0. Entry 03 explicitly invokes redundant couplings and tests 100 draws; Entry 01 uses repeated mismatch realizations. A novelty claim must therefore be narrower than “first robustness study of oscillator hardware” or “first use of redundancy.”
- **Un-0-specific evidence remains missing in this corpus:** None of these works tests the specified class-conditional coupled-Kuramoto image generator, learned omega/K/K_drive together, a roughly ten-step transient, decoded image quality, and all five errors with matched fixes. Most results concern equilibrium binary attractors, synchronization maps, or coherent emission. The absence here is a search finding, not proof that no such work exists.
- **Redundancy is not yet the requested code:** Entries 11–15 establish collective noise reduction; Entries 18–19 establish auxiliary feedback. Neither demonstrates circular-mean aggregation of independently perturbed copies of each learned feature, syndrome-based analog correction, or a decoder exploiting redundant generative features. Uncoupled output averaging and dynamically coupled replicas also change different parts of the system.
- **Independent versus correlated error:** Common forcing can promote locking (Entry 24), whereas device diffusion can erode computational regions (Entry 03). Reviewer inference: copy averaging should not be expected to remove common drift or shared coupling bias. No retained work provides a complete correlation-aware redundancy/yield analysis for Un-0-like computation.
- **Phase reference and physical model validity:** Entries 03–04 and 14 show sensitivity to coupling phase, routing delay, and reference alignment. Reviewer inference: a common omega shift can be removed by a rotating frame only when drive and readout share the corresponding symmetry; fixed class drives or an absolute-phase decoder can break it. This symmetry must not be assumed from oscillator synchronization alone.
- **Drift can change the operating regime:** Entry 09 predicts cessation of oscillation outside a load-line-dependent temperature window; Entry 07 warns about coupling-induced failure. Frequency-only Gaussian drift omits these effects. Aging and temporal recalibration intervals are much less directly quantified than static matching in the retained sources.
- **Faults are underrepresented:** No retained primary study demonstrates the specified dead-oscillator/stuck-phase/broken-coupling campaign with spares/remapping or circular-mean correction. Sparse graph topology, local-minimum trapping, and temporary desynchronization were deliberately not counted as injected permanent faults.
- **Readout deserves its own model:** Phase extraction, reference thresholds, homodyne uncertainty, and postprocessing appear in Entries 03–04, 10, 18–19, and 23. Most do not isolate a final E5 phase-measurement perturbation from errors already fed back into the dynamics. Feedback measurement noise and terminal decoder noise are not interchangeable.
- **Combined-error yield is still a distinct question:** Random draws and repeated runs exist, but the retained papers do not combine fixed per-chip mismatch, fresh jitter, shared drift, permanent faults, and readout noise with a specified image-quality acceptance threshold across many chips. Repeated optimizer trials estimate algorithmic success probability, not manufacturing yield. Reported 100-draw mismatch ensembles are genuine prior art, not evidence of a complete E1–E5 yield study.
- **Cost and task preservation:** Stronger coupling, injection locking, calibration circuitry, and auxiliary optical channels have area/power/time costs. Binary locking can improve an Ising objective while destroying continuous learned feature geometry. Relevant comparisons would need equal resource budgets and preservation of the intended computation; this is a synthesis of the architectural differences, not an experiment performed here.

Search coverage and audit: Live searches used broad and exact-title queries combining oscillator/ONN/Kuramoto with mismatch, frequency dispersion, phase noise, calibration, variability, redundancy, and fault tolerance. Sources searched included arXiv, IEEE/IEEE-oriented conference queries (DATE, ISSCC, IEDM and VLSI), Nature/Science-family journals, NeurIPS/ICLR/ICML proceedings-oriented searches, university theses/repositories, IBM Research, and Google Patents. Search-engine queries targeting Scholar and proceedings yielded substantial off-topic material; this was not treated as a complete database export or citation index. The nearest patent hits, including [training of oscillatory neural networks](https://patents.google.com/patent/US20220004876A1/en) and [mixed-signal neuromorphic circuit architecture](https://patents.google.com/patent/EP4361893A1/en), did not provide verified quantitative redundancy/mismatch results for inclusion as separate entries. Their claims were not comprehensively reviewed; no patent-novelty conclusion is made.

Backward trails included DONN → Vodenicarevic (2017), the 2024 review → mixed-signal CMOS and spintronic demonstrators, and spintronic hardware → hardware learning. Forward trails included later work citing/discussing heterogeneous-frequency computation, the 2023 SHNO chains, the 2026 large-lattice successor, and 2026 VO₂ calibration. Publisher related-article links were used as leads and each retained work was independently opened. Preprint/journal versions are one entry each. A 2025 CMOS Ising-chip successor and broader device reviews were inspected as leads but omitted where accessible robustness evidence added little to the retained primary studies. No experiments, model execution, or repository changes beyond this output file were performed.
