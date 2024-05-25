library(ggpubr)
library(ggplot2)
library(dplyr)
library(paletteer)

df=read.csv("./8C_fusion_MLT2A1_transcript_logrpkm_plot.csv",header = T)
rownames(df)=df[,1]
df=df[,-1]

ggplot(df, aes(fusion_MLT2A1_log,fusion_transcript_log))+
  geom_point(size=6,color="steelblue")+
  geom_smooth(method = "lm")+theme_bw ()+
  stat_poly_eq(aes(label=paste(eq.label,after_stat(adj.rr.label),..p.value.label..,sep = "~~~~")),#添加公式
               formula = y~x,
               parse=T,
               size=5,
               family="serif")+geom_text(aes(label = rownames(df)),check_overlap = TRUE)

pdf("8C_fusion_MLT2A1_transcript_logrpkm_plot_correlation.pdf",width=5,height = 5)
print(plot)
dev.off()

df=read.csv("./toti_like_fusion_MLT2A1_transcript_logrpkm_plot.csv",header = T)
rownames(df)=df[,1]
df=df[,-1]

ggplot(df,aes(fusion_MLT2A1_log,fusion_transcript_log))+
  geom_point(size=6,color="steelblue")+
  geom_smooth(method = "lm")+theme_bw ()+
  stat_poly_eq(aes(label=paste(eq.label,after_stat(adj.rr.label),..p.value.label..,sep = "~~~~")),#添加公式
               formula = y~x,
               parse=T,
               size=5,
               family="serif")+geom_text(aes(label = rownames(df)),check_overlap = TRUE)

pdf("toti_like_fusion_MLT2A1_transcript_logrpkm_correlation.pdf",width=5,height = 5)
print(plot)
dev.off()