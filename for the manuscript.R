#this script is for finding common genes between various groups
#and finding exclusive genes of NR vs ND+BAF treatment

#uploading gene sets:

#for lysosomal gene set:
list_lysosome<-c(#lysosome related genes, The Human Lysosome Gene Database - hLGDB (http://lysosome.unipg.it/))

  
#for cytoskeleton gene set:
list_cyto<-c(#cytoskeleton related genes, Human Gene Set: CYTOSKELETON (https://www.gsea-msigdb.org/gsea/msigdb/cards/CYTOSKELETON))
    
  
#for lysosomal gene set:
list_EMT<-c(#for EMT related genes, EMTome (http://www.emtome.org/))
    
#uploading genes from experimental groups:
  
#list_2 stands for NR as control and ND as treatment
#list_3 stands for NR as control and NR+BAF as treatment
#list_4 stands for NR as control and ND+BAF as treatment
#list_8 stands for ND as control and ND+BAF as treatment
###
  
#up_down stands for the genes p_adj<.01, and (logFC2>1 or logFC2<-1)

#
list_2_up_down<-c(#gene list)
list_3_up_down<-c(#gene list)
list_4_up_down<-c(#gene list)
list_8_up_down<-c(#gene list)
  
  
#finding common EMT, lysosomal and cytoskeletal genes between experimental groups:  

#finding the common lysosomal genes among DGE sets of the experimental groups:
lyso_2 <- intersect(list_2_up_down, list_lysosome)
lyso_3 <- intersect(list_3_up_down, list_lysosome)
lyso_4 <- intersect(list_4_up_down, list_lysosome)
lyso_8 <- intersect(list_8_up_down, list_lysosome)


#finding the common cytoskeletal genes among DGE sets of the experimental groups:
cyto_2 <- intersect(list_2_up_down, list_cyto)
cyto_3 <- intersect(list_3_up_down, list_cyto)
cyto_4 <- intersect(list_4_up_down, list_cyto)
cyto_8 <- intersect(list_8_up_down, list_cyto)

#finding the common EMT genes among DGE sets of the experimental groups:
EMT_2 <- intersect(list_2_up_down, list_EMT)
EMT_3 <- intersect(list_3_up_down, list_EMT)
EMT_4 <- intersect(list_4_up_down, list_EMT)
EMT_8 <- intersect(list_8_up_down, list_EMT)



# for finding number of cytoskeletal and lysosomal genes:
# the 'EMT' word in the following code should be replaced via::
#'lyso' for lyososomal intersections of the genes
#'cyto' for cytoskeletal intersections of the genes

#number of EMT genes that are found in lists: 
num_EMT_2<- length(EMT_2)
num_EMT_3<- length(EMT_3)
num_EMT_4<- length(EMT_4)
num_EMT_8<- length(EMT_8)


#printing number of EMT genes that are found in lists 
cat("Number of shared elements:", num_EMT_2, "\n")
cat("Number of shared elements:", num_EMT_3, "\n")
cat("Number of shared elements:", num_EMT_4, "\n")
cat("Number of shared elements:", num_EMT_8, "\n")


#printing names of EMT genes that are found in lists 
cat("Names of shared elements:", paste(EMT_2, collapse = ", "), "\n")
cat("Names of shared elements:", paste(EMT_3, collapse = ", "), "\n")
cat("Names of shared elements:", paste(EMT_4, collapse = ", "), "\n")
cat("Names of shared elements:", paste(EMT_8, collapse = ", "), "\n")

#finding common genes between groups is finished.

#the following code is for exclusive genes that are found in NR vs ND+BAF: 
#but not found in NR vs NR+BAF, and NR vs ND, and ND vs ND+BAF:


#finding genes unique to list_4 and not found in list_2
unique_to_list_4_from_2 <- setdiff(list_4_up_down, list_2_up_down)

#number of genes unique to list_4 and not found in list_2
num_to_list_4_from_2 <- length(unique_to_list_4_from_2)


#printing the number and names of genes unique to list_4 not found in list_2
cat("Number of elements unique to list_4:", num_to_list_4_from_2, "\n")
cat("Elements unique to list_4:", paste(unique_to_list_4_from_2, collapse = ", "), "\n")

#
#finding genes unique to unique_to_list_4_from_2 and not found in list_3
unique_to_list_4_from_2and3 <- setdiff(unique_to_list_4_from_2, list_3_up_down)

#number of genes unique to list_4 and not found in list_2
num_to_list_4_from_2and3 <- length(unique_to_list_4_from_2and3)


#printing the number and names of genes unique to list_4 not found in list_2
cat("Number of elements unique to list_4:", num_to_list_4_from_2and3, "\n")
cat("Elements unique to list_4:", paste(unique_to_list_4_from_2and3, collapse = ", "), "\n")

##


#finding genes unique to unique_to_list_4_from_2and3 and not found in list_8
unique_to_list_4_from_2and3and8 <- setdiff(unique_to_list_4_from_2and3, list_8_up_down)

#number of genes unique to list_4 and not found in list_2
num_to_list_4_from_2and3and8 <- length(unique_to_list_4_from_2and3and8)


#printing the number and names of genes unique to list_4 not found in list_2
cat("Number of elements unique to list_4:", num_to_list_4_from_2and3and8, "\n")

#the following genes are representing the BAF effect on starvation condition only:
#the exclusive genes for ND+BAF and not found in other BAF treatments and starvation:
cat("Elements unique to list_4:", paste(unique_to_list_4_from_2and3and8, collapse = ", "), "\n")

#for finding cytoskeletal genes that are found in exclusive genes in ND+BAF:

cyto_unique_to_list_4_from_2and3and8 <- intersect(unique_to_list_4_from_2and3and8, list_cyto)
num_cyto_unique_to_list_4_from_2and3and8 <- length(cyto_unique_to_list_4_from_2and3and8 )
cat("Number of shared elements:", num_cyto_unique_to_list_4_from_2and3and8 , "\n")
cat("Names of shared elements:", paste(cyto_unique_to_list_4_from_2and3and8 , collapse = ", "), "\n")
#for finding EMT genes that are found in exclusive genes in ND+BAF, in the code above, the word 'cyto' should be replaced via 'EMT'
#for finding lysosomal genes that are found in exclusive genes in ND+BAF, in the code above, the word 'cyto' should be replaced via 'lyso'

-------------
