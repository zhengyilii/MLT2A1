library(ggpubr)
df=read.csv("./MLT2A1_OE_ASO_dotplot.csv",header=T,check.names=F)
df$label=""
df$group="up"
label_gene <- c("MLT2A1_dup2477","MLT2A1_dup161","MLT2A1_dup287","MLT2A1_dup152","MLT2A1_dup2417")
df$label[match(label_gene,df$TE)] = label_gene
df$group[which(df$DUX4_ASO< df$DUX4_NC)]="down"
df$group[match(label_gene,df$TE)] = "label_gene"

p=ggscatter(df,x="DUX4_ASO",y="DUX4_NC",color="group",label=df$label,size=1.2,font.label = 10,repel = T,palette=c("#5786BD","#64B72F","#DF4633"),xlab = "Log10 TPM in MLT2A1 KD",ylab = "Log10 TPM in Ctrl KD")+
  geom_abline(slope =1,intercept = 0,lty="dashed")+xlim(0,3.5)+ylim(0,3.5)
pdf(file="./MLT2A1_OE_ASO_dotplot.pdf",width = 10,height = 10)
print(p)
dev.off()