library(gplots)
library(pheatmap)
df=read.csv("./common_down_MLT2A1_arrest_8C.csv",header=T,check.names=F)
rownames(df) <- df$TE
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)
test <- df[apply(df, 1, function(df) sd(df)!=0),]
p1=pheatmap(test,
            show_rownames = T,
            show_colnames = T,
            cluster_cols = F,
            cluster_rows=F,
            fontsize_row=5,
            fontsize_col = 11,
            width=4,
            main="common_down_MLT2A1_arrest_8C(n=159)",
            height=9,
            scale = "row",
            angle_col=90, 
            color =colorRampPalette(c("#5786BD","#FFFFFF","#DF4633"))(100),
            filename = "common_down_MLT2A1_arrest_8C.pdf",
            clustering_distance_rows = 'euclidean', 
            clustering_method = 'ward.D2')