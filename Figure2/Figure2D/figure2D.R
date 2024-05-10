library(plyr)
library(tidyverse)
library(readxl)

data3=read.csv("./8C_DUX_fusion_TE.csv")
p3 <- ggplot(data3,aes(x=cell,y=percentage,fill=TE))+
  geom_bar(stat = 'identity',width = 0.5,colour='black')
p3
p4 <- p3+labs(x='Condition',y='Percentage')+
  theme(axis.title = element_text(size=12),
        axis.text = element_text(size=11))+
  scale_y_continuous(breaks=seq(0,100,25),
                     labels=c('0','25%','50%','75%','100%'))+theme_classic()
p4

pdf("8C_DUX4_fusion_TE_barplot.pdf",width=8,height = 6)
print(p4)
dev.off()