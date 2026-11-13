#!/bin/bash
# usage: run_worker.sh NN slug "scope"
NN=$1; SLUG=$2; SCOPE=$3
cd /home/joao/Work/un0-hardware-noise
export PATH=$HOME/.local/bin:$PATH
OUT=notes/literature/sources/$NN-$SLUG.md
PROMPT="You are a research assistant doing one part of a systematic literature review. Do NOT run any experiments and do NOT modify any file other than the one output file below.

Project context: we are testing how Un-0 (Unconventional AI's class-conditional image generator built on coupled Kuramoto oscillators: learned omega, coupling K and drive K_drive, phases integrated with an ODE solver for ~10 Euler steps, then decoded) holds up under simulated analog-hardware imperfections, and which fixes work. Read notes/hardware-error-catalog.md for the error taxonomy: E1 manufacturing mismatch (fixed per-chip offsets on omega/K/K_drive), E2 random jitter (stochastic noise during integration), E3 shared drift (temperature/aging, common offset), E4 faults (dead oscillator, stuck phase, broken coupling), E5 readout noise (phase measurement). The candidate fix is RAID-style redundancy: circular-mean averaging of oscillator copies, analog error-correcting codes, redundancy over learned features. Plan: each error alone; each with its fix; random combinations over many simulated chips (yield); optional noise-aware fine-tuning. We want to know whether this has been done before.

YOUR TOPIC: $SLUG
SCOPE: $SCOPE

Instructions:
- Use live web search extensively. Search broadly: arXiv, Google Scholar-style queries, IEEE Xplore, Nature/Science family, NeurIPS/ICLR/ICML, DATE/ISSCC/IEDM/VLSI, company blogs, theses, patents. Cover 2015-2026, prioritising 2022-2026. Follow citation trails both ways from the key papers. Aim for 15-40 relevant entries; quality over padding.
- Open and read papers (abstract pages, HTML versions, PDFs) rather than relying on snippets wherever possible. Record for each entry whether it was read in full, partially, or abstract-only.
- NEVER invent citations, authors, venues, or numbers. If you are unsure a paper exists or cannot confirm it, leave it out. Seed references given in the scope are unverified: verify them and drop or flag any that do not check out.
- Write exactly one file: $OUT (Markdown). Structure:
  1. '# <topic title>' then a ~10-line topic summary.
  2. '## Entries' — one subsection per work with: full citation (authors, title, venue, year) + URL; year; venue; type (one of: hardware demonstration / simulation / theory / proposal / review); system and scale (e.g. number of oscillators/devices/spins/parameters); which of E1-E5 it covers; mitigation used; key quantitative results (numbers!); relevance to Un-0 (high/med/low + one line why); read status (full / partial / abstract-only).
  3. '## Gaps / open questions noted by the literature'.
- Finish by replying with a 3-line summary and the number of entries written."
codex exec -m gpt-6.1-sol -c model_reasoning_effort="medium" -c web_search="live" \
  -c sandbox_workspace_write.network_access=true \
  -C /home/joao/Work/un0-hardware-noise -s workspace-write --skip-git-repo-check \
  -o notes/literature/logs/$SLUG.last.md "$PROMPT" > notes/literature/logs/$SLUG.log 2>&1
echo "$NN $SLUG exit=$?" >> notes/literature/logs/status.txt
