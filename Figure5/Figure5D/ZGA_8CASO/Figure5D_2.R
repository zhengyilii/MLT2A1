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

my_umap_Plot <- function(i){
  new.data = read.csv(file = dir[i],check.names = F)
  t=new.data[,-1]
  tc=gather(t,key="condition",value = "tpm")
  tc$tpm=as.numeric(tc$tpm)
  tc$tpm_t=tc$tpm+0.1
  tc$logtpm=log(tc$tpm_t,10)
  file1=paste(dir[i],"_violin.pdf",sep="")
  tc$condition = factor(tc$condition, levels = c("8C_NC1","8C_NC2","8C_NC3","8C_KD1","8C_KD2","8C_KD3"))
  p=ggplot(tc,aes(x=condition, y=logtpm, fill=condition)) + 
    geom_violin(adjust=1)+geom_boxplot(width=0.2,outlier.shape = NA)+stat_summary(fun=mean, geom="point", shape=20, size=3, color="black", fill="black")+
    labs(title=file1,x="type", y = "log10(tpm+0.1)")+ theme_classic()+scale_fill_brewer(palette="RdBu") # Add pairwise comparisons p-value
}

umap_list <- lapply(i,my_umap_Plot)
pic=plot_grid(plotlist = umap_list, align = "h", 
              nrow =1)
pdf("ZGA_8CASO.pdf",width=20,height = 12)
print(pic)
dev.off()