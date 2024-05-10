library(plyr)
library(tidyverse)
library(readxl)

data3=read.csv("./chirp_FC2_nosate_barplot.csv")
data3$TE = factor(data3$TE, levels = c("LINE","LTR","SINE","noTE"))
p3 <- ggplot(data3,aes(x=condition,y=percentage,fill=TE))+
  geom_bar(stat = 'identity',width = 0.5,colour='black')
p3
p4 <- p3+labs(x='Condition',y='Percentage')+
  theme(axis.title = element_text(size=12),
        axis.text = element_text(size=11))+
  scale_y_continuous(breaks=seq(0,100,25),
                     labels=c('0','25%','50%','75%','100%'))+theme_classic()+scale_fill_brewer(palette="Spectral")

p4
pdf("chirp_FC2_p0.05_region_TE.pdf",width=10,height = 8)
print(p4)
dev.off()