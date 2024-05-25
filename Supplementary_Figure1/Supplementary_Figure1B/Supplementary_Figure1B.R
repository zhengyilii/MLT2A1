library(gplots)
library(pheatmap)
df=read.csv("./Common-down-major-ZGA in arrest embryo.csv",header=T,check.names=F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)
test <- df[apply(df, 1, function(df) sd(df)!=0),]
p1=pheatmap(test,
            show_rownames = T,
            show_colnames = T,
            cluster_cols = F,
            cluster_rows=F,
            fontsize_row=7,
            fontsize_col = 11,
            width=4,
            main="Commonly down-regulated major ZGA gene(n=74)",
            height=8,
            scale = "row",
            angle_col=90, 
            color =colorRampPalette(c("#5786BD","#FFFFFF","#DF4633"))(100),
            filename = "Commonly down-regulated major ZGA gene.pdf",
            clustering_distance_rows = 'euclidean', 
            clustering_method = 'ward.D2')