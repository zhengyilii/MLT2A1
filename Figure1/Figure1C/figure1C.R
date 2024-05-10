library(ggpubr)
df=read.csv("./8C_top50_TE_8C_gene_correlation_R2_tpm.csv",header=T,check.names=F)
df$label=""
label_gene <- c("MLT2A1","SVA_C","SVA_B","SVA_D","SVA_F")
df$label[match(label_gene,df$TE)] = label_gene
df$group[match(label_gene,df$TE)] = "label_gene"
ggscatter(df,x="R2",y="tpm",label=df$label,size=4,font.label = 10,palette=c("#000000"),xlab = "Correlation coefficient (R2)",ylab = "Expression in 8C embryo (TPM)")+
  geom_hline(aes(yintercept=0.5), colour="#000000", linetype="dashed")+geom_vline(aes(xintercept=0.2), colour="#000000", linetype="dashed")
