#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
- $import: GATK-docker.yml

inputs:
  max_alternate_alleles:
    type: int?
    inputBinding:
      position: 2
      prefix: --max_alternate_alleles
  reference:
    type: File
    inputBinding:
      position: 2
      prefix: -R
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
      - .fai
      - ^.dict
  activeProbailityThreshold:
    type: double?
    inputBinding:
      position: 2
      prefix: --activeprobabilityThreshold
  alleles:
    type: string[]?
    inputBinding:
      position: 2
  outputfile_HaplotypeCaller:
    type: string?
    inputBinding:
      position: 2
      prefix: -o
  stand_emit_conf:
    type: double?
    inputBinding:
      position: 2
      prefix: --standard_min_confidence_threshold_for_emitting
  kmerSzie:
    type: int[]?
    inputBinding:
      position: 2
  minDanglingBranchLength:
    type: int?
    inputBinding:
      position: 2
      prefix: --minDanglingBranchLength
  bandPassSigma:
    type: double?
    inputBinding:
      position: 2
      prefix: --consensus
  maxReadsInRegionPerSample:
    type: int?
    inputBinding:
      position: 2
      prefix: --maxReadsInRegionPerSample
  dontIncreaseKmerSizesForCycles:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --dontIncreaseKmerSizesForCycles
  dbsnp:
    type: File
    inputBinding:
      position: 2
      prefix: --dbsnp
  globalMAPQ:
    type: int?
    inputBinding:
      position: 2
      prefix: --phredScaledGlobalReadMismappingRate
  java_arg:
    type: string
    default: -Xmx4g
    inputBinding:
      position: 0
  min_base_quality_score:
    type: int?
    inputBinding:
      position: 2
      prefix: --min_base_quality_score
  excludeAnnotation:
    type: string?
    inputBinding:
      position: 2
  allowNonUniqueKmersInRef:
    type: boolean?
    inputBinding:
      position: 2 
      prefix: --allowNonUniqueKmersInRef
  group:
    type: string[]?
    inputBinding:
      position: 2
  pcr_indel_model:
    type: string?
    inputBinding:
      position: 2
      prefix: --pcr_indel_model
  bamOutput:
    type: File?
    inputBinding:
      position: 2
      prefix: --bamOutput
  stand_call_conf:
    type: double?
    inputBinding:
      position: 2
      prefix: --standard_min_confidence_threshold_for_calling
    doc: The minimum phred-scaled confidence threshold at which variants should be
      called
  activeRegionExtension:
    type: int?
    inputBinding:
      position: 2
      prefix: --activeRegionExtension
    doc: The active region extension; if not provided defaults to Walker annotated
      default
  activeRegionOut:
    type: File?
    inputBinding:
      position: 2
      prefix: --activeRegionOut
    doc: Output the active region to this IGV formatted file
  useAllelesTrigger:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --useAllelesTrigger
    doc: Use additional trigger on variants found in an external alleles file
  forceActive:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --forceActive
    doc: If provided, all bases will be tagged as active
  sample_name:
    type: string?
    inputBinding:
      position: 2
      prefix: --sample_name
    doc: Use additional trigger on variants found in an external alleles file
  useFilteredReadsForAnnotations:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --useFilteredReadsForAnnotations
    doc: Use the contamination-filtered read maps for the purposes of annotating variants
  disableOptimizations:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --disableOptimizations
    doc: Dont skip calculations in ActiveRegions with no variants
  minPruning:
    type: int?
    inputBinding:
      position: 2
      prefix: --minPruning
    doc: Minimum support to not prune paths in the graph
  activeRegionMaxSize:
    type: int?
    inputBinding:
      position: 2
      prefix: --activeRegionMaxSize
    doc: The active region maximum size; if not provided defaults to Walker annotated
      default
  output_mode:
    type: string?
    inputBinding:
      position: 2
      prefix: --output_mode
    doc: The PCR indel model to use
  annotateNDA:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --annotateNDA
    doc: If provided, we will annotate records with the number of alternate alleles
      that were discovered (but not necessarily genotyped) at a given site
  ERCIS:
    type: int?
    inputBinding:
      position: 2
      prefix: --indelSizeToEliminateInRefModel
    doc: The size of an indel to check for in the reference model
  GVCFGQBands:
    type: int[]?
    inputBinding:
      position: 2

    doc: Input prior for calls
  allSitePLs:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --allSitePLs
    doc: Annotate all sites with PLs
  numPruningSamples:
    type: int?
    inputBinding:
      position: 2
      prefix: --numPruningSamples
    doc: Number of samples that must pass the minPruning threshold
  gcpHMM:
    type: int?
    inputBinding:
      position: 2
      prefix: --gcpHMM
    doc: Flat gap continuation penalty for use in the Pair HMM
  contamination:
    type: File?
    inputBinding:
      position: 2
      prefix: --contamination_fraction_to_filter
    doc: Tab-separated File containing fraction of contamination in sequencing data
      (per sample) to aggressively remove. Format should be "" (Contamination is double)
      per line; No header.
  graphOutput:
    type: File?
    inputBinding:
      position: 2
      prefix: --graphOutput
    doc: Write debug assembly graph information to this file
  dontTrimActiveRegions:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --dontTrimActiveRegions
    doc: If specified, we will not trim down the active region from the full region
      (active + extension) to just the active interval for genotyping
  annotation:
    type: string[]?
    inputBinding:
      position: 2

    doc: One or more specific annotations to apply to variant calls
  bamWriterType:
    type: string?
    inputBinding:
      position: 2
      prefix: --bamWriterType
    doc: Which haplotypes should be written to the BAM.
  genotyping_mode:
    type: string?
    inputBinding:
      position: 2
      prefix: --genotyping_mode
    doc: The --genotyping_mode argument is an enumerated type (GenotypingOutputMode),
      which can have one of the following values
  activityProfileOut:
    type: File?
    inputBinding:
      position: 2
      prefix: --activityProfileOut
    doc: Output the raw activity profile results in IGV format
  input_prior:
    type: double[]?
    inputBinding:
      position: 2

    doc: Input prior for calls
  inputBam_HaplotypeCaller:
    type: File
    inputBinding:
      position: 2
      prefix: -I
    secondaryFiles:
    - ^.bai
    doc: bam file produced after printReads
  indel_heterozygosity:
    type: double?
    inputBinding:
      position: 2
      prefix: --indel_heterozygosity
    doc: Heterozygosity for indel calling
  emitRefConfidence:
    type: string?
    inputBinding:
      position: 2
      prefix: --emitRefConfidence
    doc: Mode for emitting reference confidence scores
  consensus:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --consensus
    doc: Print out very verbose debug information about each triggering active region
  heterozygosity:
    type: double?
    inputBinding:
      position: 2
      prefix: --heterozygosity
    doc: Heterozygosity for indel calling
  minReadsPerAlignmentStart:
    type: int?
    inputBinding:
      position: 2
      prefix: --minReadsPerAlignmentStart
    doc: Minimum number of reads sharing the same alignment start for each genomic
      location in an active region
  sample_ploidy:
    type: int?
    inputBinding:
      position: 2
      prefix: --sample_ploidy
    doc: Use additional trigger on variants found in an external alleles file
  debug:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --debug
    doc: Print out very verbose debug information about each triggering active region
  doNotRunPhysicalPhasing:
    type: boolean?
    inputBinding:
      position: 2
      prefix: --doNotRunPhysicalPhasing
    doc: As of GATK 3.3, HaplotypeCaller outputs physical (read-based) information
      (see version 3.3 release notes and documentation for details). This argument
      disables that behavior.
  comp:
    type: string[]?
    inputBinding:
      position: 2

    doc: comp binds reference ordered data. This argument supports ROD files of the
      following types BCF2, VCF, VCF3
  maxNumHaplotypesInPopulation:
    type: int?
    inputBinding:
      position: 2
      prefix: --maxNumHaplotypesInPopulation
    doc: Maximum number of haplotypes to consider for your population
outputs:
  output_haplotypeCaller:
    type: File
    outputBinding:
      glob: $(inputs.outputfile_HaplotypeCaller)

arguments:
- valueFrom: ./tmp
  position: 0
  separate: false
  prefix: -Djava.io.tmpdir=
#- valueFrom: /home/biodocker/bin/GenomeAnalysisTK-2.8-1-g932cd3a/GenomeAnalysisTK.jar
- valueFrom: /GenomeAnalysisTK.jar
  position: 1
  prefix: -jar
- valueFrom: HaplotypeCaller
  position: 2
  prefix: -T
baseCommand: [java]
doc: |
  GATK-RealignTargetCreator.cwl is developed for CWL consortium
  Call germline SNPs and indels via local re-assembly of haplotypes 

