#!/bin/bash
#BSUB -q general
#BSUB -G compute-yeli
#BSUB -R gpuhost
#BSUB -g /wu.w/ood-job-group
#BSUB -a 'docker(wuw2024/washu:atac0708)'
#BSUB -n 24
#BSUB -M 100GB
#BSUB -R 'select[mem>32GB && tmp>32GB] rusage[mem=100GB, tmp=100GB] span[hosts=1]'
#BSUB -W 36000
#BSUB -o /storage2/fs1/btc/Active/yeli/wanying/logs/cons_45.out
#BSUB -e /storage2/fs1/btc/Active/yeli/wanying/logs/cons_45.err

export PATH="/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/opt/conda/envs/nf-core-atacseq-1.2.2/bin/:$PATH"
cd /storage2/fs1/btc/Active/yeli/wanying/1.CATlas/00.fragment/GSE261983

../GSE163160/chromap/chromap  -t 24 --preset atac -x ../GSE163160/hg38.index -r ../../0.data/7.genome/hg38.fa -1 SRR28397537_1.fastq -2 SRR28397537_3.fastq -b SRR28397537_2.fastq -o SRR28397537_fragments.tsv