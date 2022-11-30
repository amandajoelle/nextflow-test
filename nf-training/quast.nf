#!/usr/bin/env nextflow

params.fasta1 = "$projectDir/work/6c/019966b42353cb565aa8dfecc1bcc6/assembly.fasta"
params.fasta2 = "$projectDir/data/003.fasta"


singularityImage = "https://depot.galaxyproject.org/singularity/quast:5.2.0--py39pl5321h2add14b_1"

process compare {
  container = singularityImage

  input:
    path fasta1
    path fasta2

  output:
    path "report_dir"

  script:
    """
    quast.py  -o report_dir ${fasta1} ${fasta2}
    """
}

workflow {
  compare(params.fasta1, params.fasta2).view()
}