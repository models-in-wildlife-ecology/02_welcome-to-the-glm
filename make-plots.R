
alpha = 2
beta = 0.6
e <- rnorm(100, 0, 2)

x <- sort(runif(100, 2, 40))
y <- alpha + beta*x + e

df <- data.frame(x = x, y = y)

x1 <- seq(0, 40, 1)
ey <- alpha + beta*x1

library(ggplot2)

# First line plot
png(filename = "lin-eq-plot.png", width = 500, height = 400,
    pointsize = 15)
ggplot() + geom_line(aes(x = x1, y = ey)) + xlab("X") + ylab("Y") +
  annotate(geom = "text", x = 25, y = 10, label = "m = slope = rise/run",
           size = 7) +
  annotate(geom = "text", x = 10, y = 0, label = "b = intercept = y|(x = 0)",
           size = 7)
dev.off()

# Example linear regression plot
png(filename = "lin-plot.png", width = 500, height = 400,
    pointsize = 15)
ggplot(data = df, aes(x = x, y = y)) + geom_point() +
  geom_smooth(method = lm) +
  annotate(geom = "text", x = 10, y = 25, label = "y = 2 + 0.6x + e",
           size = 7)
dev.off()

# Rookery plot
n <- 16
a <- 40
b <- -1.5
sigma2 <- 25

x <- 1:n
eps <- rnorm(n, 0, sqrt(sigma2))

y <- a + b*x + eps
df <- data.frame(x = x, y = y)

# Example linear regression plot
png(filename = "heron-plot.png", width = 500, height = 400,
    pointsize = 15)
ggplot(data = df, aes(x = x, y = y)) + geom_point() +
  geom_smooth(method = lm)
dev.off()

# quadratic plot
x <- sort(runif(100, 0, 5))

alpha <- 10
beta1 <- 2
beta2 <- -0.5

y <- alpha + beta1*x + beta2*(x^2)

png(filename = "quad-plot.png", width = 500, height = 400,
    pointsize = 15)
ggplot() + geom_line(aes(x = x, y = y))
dev.off()
