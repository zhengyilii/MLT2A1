df=read.csv("./DUX4_up_ZGA_ASO_logFC.csv")
df$type = factor(df$type, levels = c("DUX_up_minor_ZGA","DUX_up_major_ZGA"))
plot=ggplot(df, aes(x=type, y=logFC, fill=type)) + 
  geom_violin(scale='width',draw_quantiles = c(0.5),adjust=2)+
  labs(title="DUX4OE_up_ZGA gene",x="type", y = "logFC")+ theme_classic()+scale_fill_brewer(palette="RdBu")

pdf("DUX4_up_ZGA_ASO_logFC.pdf",width=5,height = 8)
print(plot)
dev.off()