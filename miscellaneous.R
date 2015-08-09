text <- "dayElasped0000"
library(stringr)
digits <- str_sub(text,-4,-1 )
str_c(c("top10/top10day", digits), collapse = "")


writeTop10 <- function(filename){
  library(stringr)
  library(dplyr)
  for (i in seq_along(filename)){
    con <- file(filename[i], 'r')
    df <- read.table(con, sep = "\t", col.names = c("cat_1", "cat_2", "cat_3", "item_id", "date", "daysElasped"),
                     colClasses = c("character", "character", "character",
                                    "character", "character", "numeric"))
    close(con)
    
    df1 <- df %>%
      select(cat_1, cat_2, cat_3, item_id) %>%
      mutate(count = 1)
    
    
    digits <- str_sub(filename[i],-4,-1 )
    outFileName <- str_c(c("004-dailyTop10/top10day", digits), collapse = "")
    
    con <- file(outFileName, 'w')
    write.table(df1, con, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)
    close(con)
  }
}

getwd()
list.files("003-renamedFiles/")
filename <- sprintf("%s%s", "003-renamedFiles/", list.files("003-renamedFiles/"))
filename
writeTop10(filename)
filename[3]
