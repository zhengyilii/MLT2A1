library(ggpubr)
library(ggplot2)
library(tidyverse)
library(patchwork)
library(ggpmisc)
library(cowplot)

df=read.csv("./SVA_8C_average_correlation.csv",header=T)
rownames(df)=df[,1]
df=df[,-1]
vilist=c("SVA_D","SVA_C","SVA_B","SVA_F")

my_umap_Plot <- function(vilist){
  name=vilist
  b <- ggplot(df, aes(x = !! rlang::sym(name), y = X8C_average))
  formula <- y ~ x
  plot=b + geom_point(shape = 17,size=8)+
    geom_smooth(method = "lm", color = "black", fill = "lightgray") +
    stat_poly_eq(aes(label=paste(eq.label,after_stat(adj.rr.label),after_stat(p.value.label),sep = "~~~~")),
                 formula = y~x,
                 parse=T,
                 size=15,
                 family="serif",
                 label.x=0.1,
                 label.y=0.9)+ theme_classic()+theme(
                   axis.text.x = element_text(size = 20),
                   axis.text.y = element_text(size = 20),
                   axis.title.x=element_text(size = 20),
                   axis.title.y=element_text(size = 20),
                   legend.text = element_text(size = 20)
                 )+geom_text(aes(label=row.names(df),hjust=0.5,vjust=1),size=8)
}
umap_list <- lapply(vilist,my_umap_Plot)

pic=plot_grid(plotlist = umap_list, align = "h", 
              nrow = 2)
pdf("SVA_8C_average_correlation_arrest_embryo.pdf",width=30,height = 30)
print(pic)
dev.off()
