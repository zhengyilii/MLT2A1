library(dplyr)
library(tidyr)
library(ggpubr)
library(ggplot2)
library(tidyverse)
library(patchwork)
library(cowplot)
library(ggnested)
new.data = read.csv("./major_ZGA_arrest.csv",check.names = F)
rownames(new.data) <- new.data$gene
my_comparisons <- list( c("8C_R1","2PN_1"),c("8C_R1","2PN_2"),c("8C_R1","2PN_3"),c("8C_R1","2PN_4"),c("8C_R1","2PN_5"),c("8C_R1","2PN_6"),
                        c("8C_R1","2PN_7"),c("8C_R1","2PN_8"),c("8C_R1","2PN_9"),c("8C_R1","2PN_10"),
                        c("8C_R1","3PN_1"),c("8C_R1","3PN_2"),c("8C_R1","3PN_3"),c("8C_R1","3PN_4"),
                        c("8C_R2","2PN_1"),c("8C_R2","2PN_2"),c("8C_R2","2PN_3"),c("8C_R2","2PN_4"),c("8C_R2","2PN_5"),c("8C_R2","2PN_6"),
                        c("8C_R2","2PN_7"),c("8C_R2","2PN_8"),c("8C_R2","2PN_9"),c("8C_R2","2PN_10"),
                        c("8C_R2","3PN_1"),c("8C_R2","3PN_2"),c("8C_R2","3PN_3"),c("8C_R2","3PN_4"))
t=new.data[,-1]
tc=gather(t,key="condition",value = "tpm")
tc$tpm=as.numeric(tc$tpm)
tc$tpm_t=tc$tpm+0.1
tc$logtpm=log(tc$tpm_t,10)
tc$condition = factor(tc$condition, levels = c("8C_R1","8C_R2","2PN_1","2PN_2","2PN_3","2PN_4","2PN_5","2PN_6","2PN_7","2PN_8","2PN_9","2PN_10",
                                               "3PN_1","3PN_2","3PN_3","3PN_4"))
p=ggplot(tc, aes(x=condition, y=tpm_t, fill=condition)) + 
  geom_violin(scale='width',draw_quantiles = c(0.5),adjust=2)+geom_boxplot(width=0.15,outlier.shape = NA)+stat_summary(fun=mean, geom="point", shape=20, size=3, color="black", fill="black")+
  labs(title="major_ZGA_noncoding_gene_arrest",x="type", y = "log(tpm+0.1)")+ theme_classic()+scale_fill_brewer(palette="Set3")+scale_y_log10()#+ylim(-1,1)##+stat_compare_means(comparisons = my_comparisons) # Add pairwise comparisons p-value
pdf("major_ZGA_arrest.pdf",width=12,height = 6)
print(p)
dev.off()

new.data = read.csv("./minor_ZGA_arrest.csv",check.names = F)
rownames(new.data) <- new.data$gene
my_comparisons <- list( c("8C_R1","2PN_1"),c("8C_R1","2PN_2"),c("8C_R1","2PN_3"),c("8C_R1","2PN_4"),c("8C_R1","2PN_5"),c("8C_R1","2PN_6"),
                        c("8C_R1","2PN_7"),c("8C_R1","2PN_8"),c("8C_R1","2PN_9"),c("8C_R1","2PN_10"),
                        c("8C_R1","3PN_1"),c("8C_R1","3PN_2"),c("8C_R1","3PN_3"),c("8C_R1","3PN_4"),
                        c("8C_R2","2PN_1"),c("8C_R2","2PN_2"),c("8C_R2","2PN_3"),c("8C_R2","2PN_4"),c("8C_R2","2PN_5"),c("8C_R2","2PN_6"),
                        c("8C_R2","2PN_7"),c("8C_R2","2PN_8"),c("8C_R2","2PN_9"),c("8C_R2","2PN_10"),
                        c("8C_R2","3PN_1"),c("8C_R2","3PN_2"),c("8C_R2","3PN_3"),c("8C_R2","3PN_4"))
t=new.data[,-1]
tc=gather(t,key="condition",value = "tpm")
tc$tpm=as.numeric(tc$tpm)
tc$tpm_t=tc$tpm+0.1
tc$logtpm=log(tc$tpm_t,10)
tc$condition = factor(tc$condition, levels = c("8C_R1","8C_R2","2PN_1","2PN_2","2PN_3","2PN_4","2PN_5","2PN_6","2PN_7","2PN_8","2PN_9","2PN_10",
                                               "3PN_1","3PN_2","3PN_3","3PN_4"))
p=ggplot(tc, aes(x=condition, y=tpm_t, fill=condition)) + 
  geom_violin(scale='width',draw_quantiles = c(0.5),adjust=2)+geom_boxplot(width=0.15,outlier.shape = NA)+stat_summary(fun=mean, geom="point", shape=20, size=3, color="black", fill="black")+
  labs(title="major_ZGA_noncoding_gene_arrest",x="type", y = "log(tpm+0.1)")+ theme_classic()+scale_fill_brewer(palette="Set3")+scale_y_log10()#+ylim(-1,1)##+stat_compare_means(comparisons = my_comparisons) # Add pairwise comparisons p-value
pdf("major_ZGA_arrest.pdf",width=12,height = 6)
print(p)
dev.off()
