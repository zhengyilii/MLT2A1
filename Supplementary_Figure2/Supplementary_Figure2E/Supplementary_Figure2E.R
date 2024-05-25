library(ggplot2)
df=read.csv("./8C_DUX_fusion_length.csv")
p=ggplot(df, aes(x = length)) +geom_density(aes(fill = type), alpha=0.4,adjust=2)+theme_classic()

pdf("8C_DUX_fusion_length.pdf",width=15,height = 15)
print(p)
dev.off()