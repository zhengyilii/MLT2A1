library(ggpubr)
df=read.csv("./DUX4_sh161_dotplot.csv",header=T,check.names=F)
df$label=""
df$group="up"
label_gene <- c("MLT2A1_dup2477","MLT2A1_dup161","MLT2A1_dup1692","MLT2A1_dup3456","MLT2A1_dup1730")
df$label[match(label_gene,df$TE)] = label_gene
df$group[which(df$DUX4_sh161< df$DUX4_NC)]="down"
df$group[match(label_gene,df$TE)] = "label_gene"

df$logDUXNC=log10(df$DUX4_NC+0.1)+1
df$logsh161=log10(df$DUX4_sh161+0.1)+1

p=ggscatter(df,x="logsh161",y="logDUXNC",color="group",label=df$label,size=1.2,font.label = 10,repel = T,palette=c("#5786BD","#64B72F","#DF4633"),xlab = "Log10 TPM in dup161 KD",ylab = "Log10 TPM in Ctrl KD")+
  geom_abline(slope =1,intercept = 0,lty="dashed")+xlim(0,3)+ylim(0,3)
pdf(file="./DUX4_sh161_dotplot.pdf",width = 10,height = 10)
print(p)
dev.off()


df=read.csv("./DUX4_sh2477_dotplot.csv",header=T,check.names=F)
df$label=""
df$group="up"
label_gene <- c("MLT2A1_dup2477","MLT2A1_dup161","MLT2A1_dup287","MLT2A1_dup3456","MLT2A1_dup1692","MLT2A1_dup1730")
df$label[match(label_gene,df$TE)] = label_gene
df$group[which(df$DUX4_sh2477< df$DUX4_NC)]="down"
df$group[match(label_gene,df$TE)] = "label_gene"

df$logDUXNC=log10(df$DUX4_NC+0.1)+1
df$logsh2477=log10(df$DUX4_sh2477+0.1)+1

p=ggscatter(df,x="logsh2477",y="logDUXNC",color="group",label=df$label,size=1.2,font.label = 10,repel = T,palette=c("#5786BD","#64B72F","#DF4633"),xlab = "Log10 TPM in dup2477 KD",ylab = "Log10 TPM in Ctrl KD")+
  geom_abline(slope =1,intercept = 0,lty="dashed")+xlim(0,3)+ylim(0,3)
pdf(file="./DUX4_sh2477_dotplot.pdf",width = 10,height = 10)
print(p)
dev.off()

