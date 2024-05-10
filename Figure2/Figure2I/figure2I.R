df=read.csv("./DUXOE_up_major_ZGA_DUXOEASO.csv",header=T)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

dh=read.csv("./DUXOE_up_major_ZGA_embryo.csv",header=T,check.names=F)
rownames(dh) <- dh$gene
dh <- dh[,2:length(colnames(dh))]
dh <- as.matrix(dh)

dc=read.csv("./DUXOE_up_major_ZGA_sh161_sh2477.csv",header=T,check.names=F)
rownames(dc) <- dc$gene
dc <- dc[,2:length(colnames(dc))]
dc <- as.matrix(dc)

library(ComplexHeatmap)
library(circlize)
df <- df[apply(df, 1, function(df) sd(df)!=0),]

dh <- dh[apply(dh, 1, function(dh) sd(dh)!=0),]

dc <- dc[apply(dc, 1, function(dc) sd(dc)!=0),]

df_scaled <- t(scale(t(df)))

dh_scaled <- t(scale(t(dh)))

dc_scaled <- t(scale(t(dc)))

col_fun_1 = colorRamp2(c(-2, 0, 2.5), c("#5786BD","#ffffff","#DF4633"))

col_fun_2= colorRamp2(c(-2, 0, 2), c("#5786BD","#ffffff","#DF4633"))

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
index <- which(rownames(dc_scaled) %in% genes$genes)
labs <- rownames(dc_scaled)[index]

p1=Heatmap(df_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           ,column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun_2,clustering_method_rows = "complete")
p2=Heatmap(dh_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,cluster_rows = FALSE,col=col_fun_1)
p3=Heatmap(dc_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun_2,cluster_rows = FALSE)+ rowAnnotation(link = anno_mark(at = index, 
                                                                                                                                             labels = labs, labels_gp = gpar(fontsize = 10)))
pdf(file="./DUXOE_up_major_ZGA_DUXOEASO_embryo_sh161_2477.pdf",width =5,height =8)
draw(p1+p2+p3)
dev.off()

df=read.csv("./DUXOE_up_minor_ZGA_DUXOEASO.csv",header=T)
rownames(df) <- df$gene
df <- df[,2:length(colnames(df))]
df <- as.matrix(df)

dh=read.csv("./DUXOE_up_minor_ZGA_embryo.csv",header=T,check.names=F)
rownames(dh) <- dh$gene
dh <- dh[,2:length(colnames(dh))]
dh <- as.matrix(dh)

dc=read.csv("./DUXOE_up_minor_ZGA_sh161_sh2477.csv",header=T,check.names=F)
rownames(dc) <- dc$gene
dc <- dc[,2:length(colnames(dc))]
dc <- as.matrix(dc)

df <- df[apply(df, 1, function(df) sd(df)!=0),]

dh <- dh[apply(dh, 1, function(dh) sd(dh)!=0),]

dc <- dc[apply(dc, 1, function(dc) sd(dc)!=0),]

df_scaled <- t(scale(t(df)))

dh_scaled <- t(scale(t(dh)))

dc_scaled <- t(scale(t(dc)))

col_fun_1 = colorRamp2(c(-2, 0, 2.5), c("#5786BD","#ffffff","#DF4633"))

col_fun_2= colorRamp2(c(-2, 0, 2), c("#5786BD","#ffffff","#DF4633"))

genes <- c("KDM4E",
           "PRAMEF12",
           "DUXB",
           "ZSCAN5C",
           "PRAMEF1",
           "TRIM43",
           "TRIM43B",
           "PRAMEF14",
           "SGCG",
           "TRIM49",
           "RFPL1",
           "MBD3L3"
)
genes <- as.data.frame(genes)
index <- which(rownames(dc_scaled) %in% genes$genes)
labs <- rownames(dc_scaled)[index]

p1=Heatmap(df_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           ,column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun_2,clustering_method_rows = "complete")
p2=Heatmap(dh_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,cluster_rows = FALSE,col=col_fun_1)
p3=Heatmap(dc_scaled,row_names_gp = gpar(fontsize = 15),show_row_names = F,
           column_names_gp = gpar(fontsize = 15),cluster_columns = FALSE,col=col_fun_2,cluster_rows = FALSE)+ rowAnnotation(link = anno_mark(at = index, 
                                                                                                                                             labels = labs, labels_gp = gpar(fontsize = 10)))
pdf(file="./DUXOE_up_minor_ZGA_DUXOEASO_embryo_sh161_2477.pdf",width =5,height =8)
draw(p1+p2+p3)
dev.off()



