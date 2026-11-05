# accept CLI arguments:
# 1. path to "dict" file
# 2. output path for "interval_list" file
args <- commandArgs(trailingOnly=TRUE)

# read and parse dictionary file from GATK CreateSequenceDictionary
# assume each row of the dictionary corresponds to one chromosome
first_line <- readLines(args[1], n = 1)
dict <- read.table(args[1], skip = 1)
intervals <- data.frame(V1 = gsub("SN:", "", dict$V2), V2 = 1, V3 = gsub("LN:", "", dict$V3), V4 = "+", V5 = "ACGTmer")

# write to output file
write(first_line, args[2])
write(do.call(paste, c(dict, sep="\t")), args[2], append = TRUE)
write(do.call(paste, c(intervals, sep="\t")), args[2], append = TRUE)
