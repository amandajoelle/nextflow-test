#!/usr/bin/env nextflow

params.input = "$projectDir/work/ce/6ddbb72d1d54d02086fa5906e23b8d/trimmed.fasta "

singularity = 'https://depot.galaxyproject.org/singularity/flye:2.9--py310h590eda1_1'

process assemble {
  container = singularity
  input:
    path (params.input)
  output:
    file('assembly.fasta')
  script:
    """
    flye --nano-raw ${params.input} -o assembly
    mv assembly/assembly.fasta assembly.fasta
    """
}

workflow {
  assemble(params.input).view()
}