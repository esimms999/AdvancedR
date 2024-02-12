# ---- 2.1 Q1 ----
# Set the seed as stated in the Introduction
set.seed(1014)

df <- data.frame(runif(3), runif(3))
names(df) <- c(1, 2)
df$"3" <- df$"1" + df$"2"

# ---- 2.1 Q2 ----
x <- runif(1e1)
y <- list(x, x, x)
utils::object.size(y)

# ---- 2.1 Q3 ----
a <- c(1, 5, 3, 2)
b <- a
b[[1]] <- 10

# ---- 2.2 ----
x <- c(1, 2, 3)
y <- x
lobstr::obj_addr(x)
lobstr::obj_addr(y)

# ---- 2.2.1.1 ----
a <- 1:10
b <- a
c <- b
d <- 1:10
lobstr::obj_addr(a)
lobstr::obj_addr(b)
lobstr::obj_addr(c)
lobstr::obj_addr(d)

# ---- 2.2.1.2 ----
mean
base::mean
get("mean")
evalq(mean)
match.fun("mean")
lobstr::obj_addr(mean)
lobstr::obj_addr(base::mean)
lobstr::obj_addr(get("mean"))
lobstr::obj_addr(evalq(mean))
lobstr::obj_addr(match.fun("mean"))

# ---- 2.2.1.3 ----
# check.names=FALSE

# ---- 2.2.1.4 ----

# ---- 2.2.1.5 ----
# Leading. is OK if not followed by a number

# ---- 2.3.1 ----
x <- c(1, 2, 3)
cat(tracemem(x), "\n")

y <- x
y[[3]] <- 4L

y[[3]] <- 5L

untracemem(x)


# ---- 2.3.2 ----
f <- function(a) {
  a
}

x <- c(1, 2, 3)
cat(tracemem(x), "\n")
#> <0x7fe1121693a8>

z <- f(x)
# there's no copy here!

untracemem(x)

# ---- 2.3.3 ----
l1 <- list(1, 2, 3)
l2 <- l1
l2[[3]] <- 4

lobstr::ref(l1, l2)

# ---- 2.3.4 ----
d1 <- data.frame(x = c(1, 5, 6), y = c(2, 4, 3))
d2 <- d1
d2[, 2] <- d2[, 2] * 2
d3 <- d1
d3[1, ] <- d3[1, ] * 3
lobstr::ref(d1)
lobstr::ref(d2)
lobstr::ref(d3)

# ---- 2.3.5 ----
x <- c("a", "a", "abc", "d")
lobstr::ref(x, character = TRUE)
