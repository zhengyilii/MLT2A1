library(ggpubr)
library(ggplot2)
df=read.csv("./DUXOE_ASO_sh161_sh2477.csv")
df$type = factor(df$type, levels = c("Zygote_2C","4C","8C","Morula","ICM","TE"))
df$condition=factor(df$condition,levels = c("DUXOE_up","DUXOE_sh2477_down","DUXOE_sh161_down","DUXASO_down"))
ggplot(df,aes(x=type,y=condition))+
  geom_point(aes(size=`log_ad_p`,
                 color=`condition`))+
  theme_bw()+
  theme(panel.grid = element_blank(),
        axis.text.x=element_text(angle=90,hjust = 1,vjust=0.5))+
  labs(x=NULL,y=NULL)+grids()+scale_size(name = "-log10(adjusted-pvalue)",range=c(0,10))