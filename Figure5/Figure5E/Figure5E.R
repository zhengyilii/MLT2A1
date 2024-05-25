df=read.csv("./major_ZGA_MLT2A1_4CKD_log.csv",header=T,check.names=F)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

dh=read.csv("./major_ZGA_MLT2A1_8CKD_log.csv",header=T,check.names=F)
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
genes <- c("H2AZ1",
           "DUXA",
           "MBD3L2",
           "LEUTX",
           "ZSCAN4",
           "H3Y1",
           "PRAMEF4",
           "PRAMEF6",
           "PRAMEF11",
           "TPRX1",
           "KLF17",
           "PRAMEF19"
)
genes <- as.data.frame(genes)
index <- which(rownames(dh_scaled) %in% genes$genes)
labs <- rownames(dh_scaled)[index]

p1=Heatmap(df_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           ,column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun,clustering_method_rows = "ward.D2")
p2=Heatmap(dh_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,cluster_rows = FALSE,col=col_fun)+ rowAnnotation(link = anno_mark(at = index, 
                                                                                                                                           labels = labs, labels_gp = gpar(fontsize = 10)))

pdf(file="./major_ZGA_MLT2A1_4CKD_8CKD.pdf",width =5,height =8)
