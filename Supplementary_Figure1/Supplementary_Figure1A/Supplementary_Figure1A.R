library(gplots)
library(pheatmap)

df=read.csv("./major_ZGA_arrest_embryo_log10.csv",header=T,check.names=F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)
test <- df[apply(df, 1, function(df) sd(df)!=0),]
p1=pheatmap(test,
            show_rownames = F,
            show_colnames = T,
            cluster_cols = F,
            cluster_rows=T,
            fontsize_row=7,
            fontsize_col = 11,
            width=3.8,
            main="major_ZGA_arrest_embryo_log10(n=1299)",
            height=7,
            scale = "row",
            angle_col=90, 
            color =colorRampPalette(c("#5786BD","#FFFFFF","#DF4633"))(100),
            filename = "major_ZGA_arrest_embryo_log10_test.pdf",
            clustering_distance_rows = 'euclidean', 
            clustering_method = 'ward.D2')

df=read.csv("./minor_ZGA_arrest_embryo_log10.csv",header=T,check.names=F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)
test <- df[apply(df, 1, function(df) sd(df)!=0),]
p1=pheatmap(test,
            show_rownames = F,
            show_colnames = T,
            cluster_cols = F,
            cluster_rows=T,
            fontsize_row=7,
            fontsize_col = 11,
            width=3.8,
            main="minor_ZGA_arrest_embryo_log10(n=2202)",
            height=7,
            scale = "row",
            angle_col=90, 
            color =colorRampPalette(c("#5786BD","#FFFFFF","#DF4633"))(100),
            filename = "minor_ZGA_arrest_embryo_log10_test.pdf",
            clustering_distance_rows = 'euclidean', 
            clustering_method = 'ward.D2')