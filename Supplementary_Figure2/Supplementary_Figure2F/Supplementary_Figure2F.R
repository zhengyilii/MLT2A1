library(ComplexHeatmap)
library(circlize)
df=read.csv("./8C_fused_2A1_transcirpt_rpkm.csv",header=T,check.names = F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

df <- df[apply(df, 1, function(df) sd(df)!=0),]
df_scaled <- t(scale(t(df)))
col_fun=c("#5786BD","#ffffff","#DF4633")

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
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun,clustering_method_rows = "complete")+ rowAnnotation(link = anno_mark(at = index, 
                                                                                                                                                         labels = labs, labels_gp = gpar(fontsize = 10)))
pdf(file="./8C_fused_2A1_transcirpt_rpkm_dotplot.pdf",width =5,height =8)
draw(p1)
dev.off()

df=read.csv("./toti_like_fused_2A1_transcript_rpkm.csv",header=T,check.names = F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

df <- df[apply(df, 1, function(df) sd(df)!=0),]
df_scaled <- t(scale(t(df)))
col_fun=c("#5786BD","#ffffff","#DF4633")

genes <- c("dup3061",
           "dup1947",
           "dup2974",
           "dup3449",
           "dup3711",
           "dup3643",
           "dup107",
           "dup1747",
           "dup2674",
           "dup1054",
           "dup3062",
           "dup2831",
           "dup108",
           "dup1893",
           "dup2477",
           "dup1323",
           "dup3088",
           "dup775",
           "dup493",
           "dup2319",
           "dup3402",
           "dup161"
)
genes <- as.data.frame(genes)
index <- which(rownames(df_scaled) %in% genes$genes)
labs <- rownames(df_scaled)[index]

p1=Heatmap(df_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun,clustering_method_rows = "complete")+ rowAnnotation(link = anno_mark(at = index, 
                                                                                                                                                          labels = labs, labels_gp = gpar(fontsize = 10)))
pdf(file="./toti_like_fused_2A1_transcirpt_rpkm_dotplot.pdf",width =5,height =8)
draw(p1)
dev.off()

