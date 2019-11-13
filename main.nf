/*
 * Define the default parameters 
 */

params.reference     = "data/ggal_reference.fa"
params.reads      = "data/*_{1,2}.fq.gz" 
params.results    = "results2"


/*
 *  Parse the input parameters
 */

reference_file  =  file(params.reference)  
Channel
    .fromFilePairs(params.reads)
    .into{fastqc_reads_ch; trimgalore_reads_ch} 
outDir = file(params.results)


/*
 * Process 1: Get Fastqc of Reads Before Trimming
 */

process '1_fastqc_reads_before_trim' { 

  publishDir params.results
  
  input:
      set replicateId, file(reads) from fastqc_reads_ch   

  //output:
      

  script:
  """
  mkdir $outDir
  fastqc -o $outDir --noextract $reads 
  """
}

/*
 *
 * Process 2: Trim Reads with Trim-galore
 *

process '2_trim-galore_reads' {

  input:
      

  output:


  script:
  """

  """
}


 *
 * Process 3: Get Fastqc of Reads After Trimming
 *

process '3_fastqc_reads_after_trim' {

  input:


  output:


  script:
  """

  """
}
*/
