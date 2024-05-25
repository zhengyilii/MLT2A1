df=read.csv("./8C_top50_TE_RNA_TPM.csv",header=T,check.names=F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

dh=read.csv("./8C_top50TE_ATAC_RPKM.csv",header=T,check.names=F)
rownames(dh) <- dh$gene
dh <- dh[,2:length(colnames(dh))]
dh <- as.matrix(dh)

library(ComplexHeatmap)
library(circlize)
df <- df[apply(df, 1, function(df) sd(df)!=0),]

dh <- dh[apply(dh, 1, function(dh) sd(dh)!=0),]

df_scaled <- t(scale(t(df)))

dh_scaled <- t(scale(t(dh)))

col_fun_1= colorRamp2(c(-2, 0, 2.5), c("#207A7A","#ffffff","#DF4633"))
col_fun_2= colorRamp2(c(-2, 0, 2), c("#207A7A","#ffffff","#DF4633"))

p1=Heatmap(df_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           ,column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun_1,clustering_method_rows = "ward.D2")
p2=Heatmap(dh_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = T,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,cluster_rows = FALSE,col=col_fun_2)

pdf(file="./8C_top50TE_RNA_ATAC.pdf",width =5,height =8)

draw(p1+p2)
dev.off()
