#count win case, lose case, draw case
#DRAW 1, #WIN 2, #LOSE 3
#temp <- dataset
#1000, 1000, 1000
dataset <- read.csv(file.path('datasets', 'Dataset_Numeric.csv'))
lst1 <- which(dataset$result == "draw") #1013 #13
lst2 <- which(dataset$result == "win") #1943 #943
lst3 <- which(dataset$result == "lose") #1203 #203
lst1_1 <- lst1[1:1000]
lst1_2 <- lst1[1001:1013]
lst2_1 <- lst2[1:1000]
lst2_2 <- lst2[1001:1943]
lst3_1 <- lst3[1:1000]
lst3_2 <- lst3[1001:1203]
n_rows <- c(lst1_1, lst2_1, lst3_1)
n_rows_remain <- c(lst1_2, lst2_2, lst3_2)
n_rows <- as.numeric(levels(factor(n_rows)))
n_rows_remain <- as.numeric(levels(factor(n_rows_remain)))
dataset <- dataset[n_rows, ]

########################################################################
dataset <- read.csv(file.path('datasets', 'Dataset_Numeric.csv'))
#dataset <- read.csv(file.path('datasets', 'rawdata', 'match_info.csv'))
#drop draw ทิ้ง
lst1 <- which(dataset$result == "draw")
dataset <- dataset[-lst1, ]
lst2 <- which(dataset$result == "win") #1943 #1943-1200 = 743
lst3 <- which(dataset$result == "lose") #1203 #3
lst2_1 <- lst2[1:1200]
lst2_2 <- lst2[1200:(1943-1200)]
lst3_1 <- lst3[1:1200]
lst3_2 <- lst3[1201:1203]
n_rows <- c(lst2_1, lst3_1)
n_rows_remain <- c(lst2_2, lst3_2)
n_rows <- as.numeric(levels(factor(n_rows)))
n_rows_remain <- as.numeric(levels(factor(n_rows_remain)))
dataset <- dataset[n_rows, ]
#screen เหลือ 1200

