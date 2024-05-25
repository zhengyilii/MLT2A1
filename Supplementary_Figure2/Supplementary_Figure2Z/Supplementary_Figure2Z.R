df=read.csv("./DUX4_up_minor_ZGA_gene_2A1ASO_sh161_sh2477.csv")
df$condition = factor(df$condition, levels = c("DUX4ASO","sh161","sh2477"))
plot=ggplot(df, aes(x=condition, y=logFC, fill=condition)) + 
  geom_violin(scale='width',draw_quantiles = c(0.5),adjust=2)+
  labs(title="DUX4OE_up_minor_ZGA",x="condition", y = "logFC")+ theme_classic()+scale_fill_brewer(palette="RdBu")

pdf("DUX4_up_minor_ZGA_gene_2A1ASO_sh161_sh2477.pdf",width=5,height = 8)
print(plot)
dev.off()

df=read.csv("./DUX4_up_major_ZGA_gene_2A1ASO_sh161_sh2477.csv")
df$condition = factor(df$condition, levels = c("DUX4ASO","sh161","sh2477"))
plot=ggplot(df, aes(x=condition, y=logFC, fill=condition)) + 
  geom_violin(scale='width',draw_quantiles = c(0.5),adjust=2)+
  labs(title="DUX4OE_up_major_ZGA",x="condition", y = "logFC")+ theme_classic()+scale_fill_brewer(palette="RdBu")

pdf("DUX4_up_major_ZGA_gene_2A1ASO_sh161_sh2477.pdf",width=5,height = 8)
print(plot)
dev.off()