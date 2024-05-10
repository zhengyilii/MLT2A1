library(ComplexHeatmap)
library(circlize)

df=read.csv("./embryo_MLT2A1_RNAseq_log10.csv",header=T)
rownames(df) <- df$TE
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

dh=read.csv("./embryo_MLT2A1_ATAC_log10.csv",header=T,check.names=F)
rownames(dh) <- dh$TE
dh <- dh[,2:length(colnames(dh))]
dh <- as.matrix(dh)

col_fun=c("#ffffff","#DF4633","#8B1A1A")

p1=Heatmap(df,row_names_gp = gpar(fontsize = 15),show_row_names = F,column_title = "embyro_TE_RNA",
           ,column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,cluster_rows=TRUE,col=col_fun,clustering_method_rows = "complete")
p2=Heatmap(dh,row_names_gp = gpar(fontsize = 15),show_row_names = F,column_title = "embyro_TE_ATAC",
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,cluster_rows=FALSE,col=col_fun)


pdf(file="./embryo_top50TE_RNA_ATAC_t.pdf",width = 10,height = 14)
draw(p1+p2)
dev.off()
