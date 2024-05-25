library(ggpubr)
library(ggthemes)

data=read.csv("./DUX4_HNRNPU_embryo_gene_DE.csv",header=T,check.names=F)
data$Group="not-significant"
data$Group[which((data$FDR<0.05)&(data$logFC>0.6))]="up-regulated"
data$Group[which((data$FDR<0.05)&(data$logFC< -0.6))]="down-regulated"
data$label=""
label_gene <- c("LEUTX","DUXA","PRAMEF11","PRAMEF4","PRAMEF19","KLF17","DUX4","SLC34A2")
data$label[match(label_gene,data$gene)] = label_gene
data$Group[match(label_gene,data$gene)] = "label_gene"
p=ggscatter(data,x="logCPM",y="logFC",color="Group",label=data$label,size=1.6,font.label = 12,palette=c("#2f5688","#ff8c00","#BBBBBB","#CC0000"),repel = T,xlab = "log mean expression",ylab = "log2FC",)+theme_base()+geom_hline(yintercept = c(-0.6,0.6),linetype="dashed")
p

pdf("siHNRNPU_gene_diff_volcano.pdf",width=10,height = 8)
print(p)
dev.off()