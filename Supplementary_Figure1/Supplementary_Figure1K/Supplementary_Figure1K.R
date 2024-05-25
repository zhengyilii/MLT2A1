library(ggplot2)
library(ggpubr)

df=read.csv("./embryo_exp_noexp_MLT2A1.csv")
my_comparisons <- list( c("embryo-exp","embryo-noexp"))
plot=ggplot(df, aes(x=type, y=length, fill=type)) + 
  geom_violin(scale='width',draw_quantiles = c(0.5),adjust=2)+
  labs(title="embryo_exp_noexp_MLT2A1",x="type", y = "length")+ theme_classic()+scale_fill_brewer(palette="RdBu")+stat_compare_means(comparisons = my_comparisons)+ # Add pairwise comparisons p-value
  stat_compare_means(label = "p.signif",method = "wilcox.test")
pdf("embryo_exp_noexp_MLT2A1_length.pdf",width=5,height = 5)
print(plot)
dev.off()
