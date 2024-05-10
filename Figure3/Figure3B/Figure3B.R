library("ChIPseeker")
library("org.Hs.eg.db")
library("TxDb.Hsapiens.UCSC.hg38.knownGene")
library(clusterProfiler)
library(ggplot2)
library(RColorBrewer)

txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene
peak<- readPeakFile("./chirp_FC3_p0.05_summit_chipseeker.bed")
peakAnno <- annotatePeak(peak,
                         TxDb=txdb,
                         tssRegion=c(-1000, 1000),
                         annoDb = "org.Hs.eg.db")
f2=peak
options(ChIPseeker.ignore_1st_exon = T)
options(ChIPseeker.ignore_1st_intron = T)
options(ChIPseeker.ignore_downstream = T)
options(ChIPseeker.ignore_promoter_subcategory = T)
x=annotatePeak(f2,TxDb=txdb,
               tssRegion=c(-1000, 1000),
               annoDb = "org.Hs.eg.db")
p=plotAnnoPie(x,col=brewer.pal(6, "Set3"))

df <- as.data.frame(x)
write.csv(df,file = "./chirp_FC3_p0.05_summit_anno.csv")
