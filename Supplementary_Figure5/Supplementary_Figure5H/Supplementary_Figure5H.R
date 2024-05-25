df=read.csv("./DUXASO_down_FC4_major_4CASO_log10.csv",header=T,check.names = F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

dh=read.csv("./DUXASO_down_FC4_minor_4CASO_log10.csv",header=T,check.names=F)
rownames(dh) <- dh$gene
dh <- dh[,2:length(colnames(dh))]
dh <- as.matrix(dh)

library(ComplexHeatmap)
library(circlize)
df <- df[apply(df, 1, function(df) sd(df)!=0),]

dh <- dh[apply(dh, 1, function(dh) sd(dh)!=0),]

df_scaled <- t(scale(t(df)))

dh_scaled <- t(scale(t(dh)))

col_fun=c("#5786BD","#ffffff","#DF4633")

p1=Heatmap(df_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun,clustering_method_rows = "ward.D2")
p2=Heatmap(dh_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun,clustering_method_rows = "ward.D2")
pdf(file="./DUXASO_down_FC4_major_4CASO_log10.pdf",width =5,height =8)
draw(p1)
dev.off()

pdf(file="./DUXASO_down_FC4_minor_4CASO_log10.pdf",width =5,height =8)
draw(p2)
dev.off()
