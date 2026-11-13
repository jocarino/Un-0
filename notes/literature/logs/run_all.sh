#!/bin/bash
# two batches of 5, in parallel within a batch
cd /home/joao/Work/un0-hardware-noise/notes/literature/logs
run_batch() { while IFS=$'\t' read -r nn slug scope; do ./run_worker.sh "$nn" "$slug" "$scope" & done; wait; }
sed -n 1,5p topics.tsv | run_batch
sed -n 6,10p topics.tsv | run_batch
echo ALL_DONE >> status.txt
