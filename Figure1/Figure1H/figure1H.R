library(gplots)
library(pheatmap)
df=read.csv("./embryo_exp_2A1_arrest_embryo.csv",header=T,check.names=F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)
test <- df[apply(df, 1, function(df) sd(df)!=0),]
p1=pheatmap(test,
            show_rownames = F,
            show_colnames = T,
            cluster_cols = F,
            cluster_rows=F,
            fontsize_row=7,
            fontsize_col = 11,
            width=3.8,
            main="embryo_exp_2A1_arrest_embryo(n=1629)",
            height=7,
            scale = "row",
            angle_col=90, 
            color =colorRampPalette(c("#5786BD","#FFFFFF","#DF4633"))(100),
            filename = "embryo_exp_2A1_arrest_embryo_order.pdf",
            clustering_distance_rows = 'euclidean', 
            clustering_method = 'ward.D2')