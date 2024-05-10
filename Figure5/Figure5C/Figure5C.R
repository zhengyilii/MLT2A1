library(ggpubr)
library(ggplot2)
df=read.csv("./4C_8C_Morula_siDEG_stage_marker_gene_significant.csv")
df$type = factor(df$type, levels = c("Zygote_2C","4C","8C","Morula","ICM","TE"))
df$condition=factor(df$condition,levels = c("8C-ASO-down","8C-ASO-up","4C-ASO-down","4C-ASO-up"))
ggplot(df,aes(x=type,y=condition))+
  geom_point(aes(size=`logp`,
                 color=`condition`))+
  theme_bw()+
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(angle=90,hjust = 1,vjust=0.5))+
  labs(x=NULL,y=NULL)+grids()+scale_size(name = "-log10(adjusted-pvalue)",range=c(0,10))