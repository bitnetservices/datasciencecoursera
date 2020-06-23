add2 <- function(x , y ){
    x + y
}

above10 <- function(v){
  use<- v > 10
  v[use]
}

aboven <- function(v, n = 10){
  use<-v>n
  v[use]
}


aboven(1:20, 19)

aboven(1:20)
