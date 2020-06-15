example <- matrix(c(1,2,3,4,5,6,7,8), nrow=4, ncol=2)

install.packages("ggplot2")
install.packages("devtools")
help()
help(package="ggplot2")
browseVignettes("ggplot2")
install.packages("KernSmooth")
library("KernSmooth")
install.packages("rmarkdown")

## base system packages - 
##  utils, stats, datasets, graphics, grDevices, grid, methods, tools, parallel, compiler, splines, tcltk, stats4

## recommend pacakges - 
##  boot, class, cluster, codetools, foreign, KernSmooth, lattice, mgcv, rpart, nime, survival, MASS, spatial, nnet, Matrix


x <- c(0.1, 0.2)
b <- c(TRUE, FALSE, TRUE)
b1 <- c(T, F, F)
s <- c("x", "y")
i <- c(2+0L, 2+4L)
sq <- 1:20


## coercion
z <- c(0.9, "a") ##mixing objects 
z <- c(F, 1)				## numeric
z <- c("b", F)				##character

##explicit coercion
l <- 0:20
as.logical(l)
as.numeric(l)
as.character(l) ## nonsensical coercion results in NAS



##lists
l <- list(1, "a", "xyz", T, 0L, 1i + 4i, 5+5L, 0:20)
l						## index is always 1 not 0 unlike other programming
l[6]					##explicit printing of element
l[1]; l[2]				##explicit multi element printing on same line


##matrix 
m <- matrix(nrow = 3, ncol = 2)
dim(m) 			## first number is rows, second one is column
attributes(m)

m <- matrix(1:6, nrow=3, ncol=2)			## they are constructed by columns, and populated as below 
m


#using dim
m<-1:10
dim(m) <- c(5,2)			## take the vector and assign to underline dimensions
m

##factor aka enumerators
f <- factor(c("yes", "no", "yes", "yes", "no"))
table(f)
unclass(f)


##missing values
is.na(l)
is.nan(f)


## dataframe
df <-  data.frame(foo = 1:4, bar = c(T, T, F, F), ff = 5:8)
nrow(df)
ncol(df)

## names assignment to vector, list, matrix
names(x) <- c("col1", "col2","col3")


## reading data
read.table()  ##args: file, header, sep, colClasses: vector, nrows, comment.char, skip, stringAsFactors 
read.csv()

## dput - create a single obect (serialised)
y <- data.frame(a = 1, b = "lol")
dput(y)
dput(y, file = "y.R")
new.y <- dget("y.R")  ## deserialize()
new.y



##dump - creates muliple objects
dump(c("y", "x"), file="dump.R")
source("dump.R")


## interfacing through
file
gzip
bzfile
url


str(file)
##description = filename
## open = r, w, a
##      = rb, wb, ab, in binary mode for windows

con <- file("student.csv",open= "r")
data <- read.csv(con)
data 

con <- gzip("somefile.gz")
gzdata <- readLines(con, 10) 
gzdata

con <- url("https://jaggiz.wordpress.com")
urldata <- readLines(con) 
head(urldata)

## subsetting  - on how to extract data from objects
##    [ ]       returns object of same class
##    [[ ]]     list or dataframe with index number
##    $         extract list or dataframe elements by name

al <- c("a", 'b', 'c', 'd', 'e', 'f', 'f', 'a')
al
al[al > 'a']  ##lexical graph
al[al < 'f']  ##another example

al[al > 'a']
ex <- al > 'a'  ##logical index
ex
al[ex]          ##get the difference similar to al[al > 'a']


## Subsetting in list 
se <- list(col1 = 1:4, col2= 0.1)
se
se$col1
se[1]
se['col1']
se[['col1']]
se['col1'][1]


se <- list(col1 = 1:4, col2= 0.1, col3 = "3rd col")
name <- 'col1'
se[[name]]


m <- matrix(1:6, 3, 2)
m
m[1, 2]
m[1, , drop=FALSE]


## partial matching 
mat <- list(aadvark = 1:5)
mat$a
mat[['aadvark']]


## removing missing values
mv <- c(1, 2, NA, NA, 5)
bad <- is.na(mv)
mv[!bad]

x <- c(1, 2, NA, NA, 5)
y <- c('1', '2', NA, '4', '5')
good <- complete.cases(x, y)
good
x[good]
y[good]


## vectorised operations
x <- 1:4; y <- 6:9 
x+y
x>2
x>=2
y==8
x*y
x/y

## vectorized matrix operations
x <-matrix(1:4, 2, 2); y <-matrix(rep(10, 4), 2, 2)
x*y
x/y
x %*% y


## SWIRL 
install.packages("swirl")
packageVersion("swirl")
library(swirl)
install_from_swirl("R Programming")
swirl()


x <- c(1,3, 5) 
y <- c(3, 2, 10)
class(cbind(x, y))

x <- 1:4  
y <- 2:3
x+y


x <- c(17, 14, 4, 5, 13, 12, 10)
x[x ==4]> 10
x

getwd()
hwdf <- read.csv('C:/work/practice/coursera/the data science toolbox/r programming/quiz/dataset/hw1_data.csv')
hwdf[47,]
table(is.na(hwdf['Ozone']))
sapply(hwdf, function(x) sum(is.na(x)))
summary(hwdf['Ozone'])
solar<- hwdf[hwdf$Ozone >31 & hwdf$Temp>90,]
solar
summary(solar)

temp<- hwdf[hwdf$Month ==6,]
summary(temp)


ozone<- hwdf[hwdf$Month ==5,]
summary(ozone)
