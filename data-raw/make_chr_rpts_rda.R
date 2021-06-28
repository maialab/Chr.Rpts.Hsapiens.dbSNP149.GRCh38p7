# Generate chromosome reports data frames

chromosomes <- c(1:22, "X", "Y", "MT")
chr_names <- paste0("chr_", chromosomes); names(chr_names) <- chromosomes
chr_files <- paste0("chr_", chromosomes, ".txt.gz"); names(chr_files) <- chromosomes

# system.file call requires the package to be loaded (using devtools).
chr_files_full <- system.file("data-raw/chr_rpts", chr_files, package = "Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7")
names(chr_files_full) <- chromosomes
extdata_dir <- system.file("inst/extdata", ".", package = "Chr.Rpts.Hsapiens.dbSNP149.GRCh38p7")

# column types (26 columns)
col_types <- c(rep("integer", 6),   # Columns 1 thru 6
               rep("character", 4), # Columns 7 thru 10
               rep("integer", 2),   # Columns 11 thru 12
               "character",         # Column 13
               rep("double", 3),    # Columns 14 thru 16
               rep("integer", 3),   # Columns 17 thru 19
               rep("character", 3), # Columns 20 thru 22
               "integer",           # Column 23
               rep("character", 3)) # Columns 24 thru 26

# column names (26 columns)
col_names <- c(
  "snp_id",                # Column 1
  "mapweight",             # Column 2
  "snp_type",              # Column 3
  "chr_hits",              # Column 4
  "ctg_hits",              # Column 5
  "total_hits",            # Column 6
  "chr",                   # Column 7
  "ctg_accession",         # Column 8
  "ctg_version",           # Column 9
  "ctg_id",                # Column 10
  "ctg_position",          # Column 11
  "chr_position",          # Column 12
  "local_loci",            # Column 13
  "avg_het",               # Column 14
  "s.e._het",              # Column 15
  "max_prob",              # Column 16
  "validated",             # Column 17
  "genotypes",             # Column 18
  "linkouts",              # Column 19
  "orig_build",            # Column 20
  "upd_build",             # Column 21
  "mapped_other_assembly", # Column 22
  "suspect",               # Column 23
  "clin_sign",             # Column 24
  "allele_orig",           # Column 25
  "gmaf"                   # Column 26
  )

save_chr_rpt <- function(chr_name) {
  chr_rpt_src <- chr_files_full[chr_name] # input
  chr_rpt_rds <- paste0(extdata_dir, '/', chr_names[chr_name], '.rds') # output

  # Read the chr report source file
  message("Reading chromosome ", chr_rpt_src, "...")
  df <- read.table(chr_rpt_src,
                   col.names = col_names,
                   colClasses = col_types,
                   sep = "\t", skip = 7)
  message("Finished reading.")

  # Save data frame as an Rda object
  message("Saving ", chr_rpt_rds, "...")
  saveRDS(df, file = chr_rpt_rds)
  message("Done saving.")
}


# Saving chr reports' data frame as Rda objects
for(chrname in chromosomes) save_chr_rpt(chrname)
