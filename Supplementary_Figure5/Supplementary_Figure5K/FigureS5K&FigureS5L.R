library(dplyr)
library(tidyr)
library(ggpubr)
library(ggplot2)
library(tidyverse)
library(patchwork)
library(cowplot)
library(ggnested)

a = list.files() 
dir = paste("./",a,sep="") 
n = length(dir)
i=seq(1,n)
i=as.data.frame(i)
i=as.matrix(i)
my_comparisons <- list(c("NC","KD"))

my_umap_Plot <- function(i){
  new.data = read.csv(file = dir[i])
  t=new.data[,-1]
  tc=gather(t,key="condition",value = "tpm")
  tc$tpm=as.numeric(tc$tpm)
  tc$tpm_t=tc$tpm+0.1
  tc$logtpm=log(tc$tpm_t,2)
  file1=paste(dir[i],"_violin.pdf",sep="")
  tc$type[which(grepl("NC",tc$condition))]="NC"
  tc$type[which(grepl("KD",tc$condition))]="KD"
  tc$type = factor(tc$type, levels = c("NC","KD"))
  p=ggnested(tc, 
             aes(x = type,
                 y = logtpm, 
                 main_group = type, 
                 sub_group = condition),
             nested_aes = "fill") + geom_violin(scale='width',draw_quantiles = c(0.5),adjust=2)+
    labs(title=paste(dir[i],length(rownames(t))),x="condition", y = "log2(tpm+0.1)")+ theme_classic()+stat_compare_means(comparisons = my_comparisons,method = "wilcox.test")+scale_fill_brewer(palette="RdBu")
}

umap_list <- lapply(i,my_umap_Plot)
pic=plot_grid(plotlist = umap_list, align = "h", 
              nrow =1)
pdf("chirp_FC3_p0.05_20kb_ZGA_gene_4C_8C_ASO.pdf",width=20,height = 8)
print(pic)
dev.off()