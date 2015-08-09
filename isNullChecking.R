df1 <- data.frame(cat_1 = character(0), cat_2 = character(0), cat_3 = character(), item_id = character(), count = numeric(0))
df2 <- top10Before0

df2[1:10,]
rbind(df1, df2[1:10,])

df1 <- NULL
print(nrow(df1))

if (is.null(df1)){
  print("I am null")
}
exist