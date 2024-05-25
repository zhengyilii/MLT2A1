df=read.csv("./DUX4OE_up_MLT2A1_embryo.csv",header=T,check.names = F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

library(ComplexHeatmap)
library(circlize)
df <- df[apply(df, 1, function(df) sd(df)!=0),]

df_scaled <- t(scale(t(df)))

col_fun_1 = colorRamp2(c(-2, 0, 2.5), c("#5786BD","#ffffff","#DF4633"))

genes <- c("MLT2A1_dup161",
           "MLT2A1_dup2477",
           "MLT2A1_dup287",
           "MLT2A1_dup2911",
           "MLT2A1_dup346",
           "MLT2A1_dup1692",
           "MLT2A1_dup418",
           "MLT2A1_dup1053",
           "MLT2A1_dup2893",
           "MLT2A1_dup349",
           "MLT2A1_dup2089",
           "MLT2A1_dup1730",
           "MLT2A1_dup3014",
           "MLT2A1_dup872",
           "MLT2A1_dup2322",
           "MLT2A1_dup1948",
           "MLT2A1_dup537",
           "MLT2A1_dup1323",
           "MLT2A1_dup787",
           "MLT2A1_dup3401"
)
genes <- as.data.frame(genes)
index <- which(rownames(df_scaled) %in% genes$genes)
labs <- rownames(df_scaled)[index]

p1=Heatmap(df_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun_1,clustering_method_rows = "complete")+ rowAnnotation(link = anno_mark(at = index, 
                                                                                                                                                    labels = labs, labels_gp = gpar(fontsize = 10)))
pdf(file="./DUX4OE_up_MLT2A1_embryo.pdf",width =5,height =8)

draw(p1)
dev.off()
