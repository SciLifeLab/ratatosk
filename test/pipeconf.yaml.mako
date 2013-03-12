# section parameter values either affect the exe application or
# correspond to global application parameters
bwa:
  bwaref: ${bwaref}
  InputFastqFile:
    parent_task: ratatosk.fastq.FastqFileLink

fastq:
  link:
    indir: ${fastq}

gatk:
  # NB: I don't know if these even works
  knownSites: 
    - ${knownSites1}
    - ${knownSites2}
  ref: ${ref}
  dbsnp: ${dbsnp}

picard:
  # InputBamFile "pipes" input from other modules
  InputBamFile:
    parent_task: ratatosk.samtools.SamToBam
  HsMetrics:
    parent_task: ratatosk.picard.SortSam
    targets: targets.interval_list
    baits: targets.interval_list
  DuplicationMetrics:
    parent_task: ratatosk.picard.SortSam
  AlignmentMetrics:
    parent_task: ratatosk.picard.SortSam
  InsertMetrics:
    parent_task: ratatosk.picard.SortSam

samtools:
  SamToBam:
    parent_task: test.test_wrapper.SampeToSamtools
