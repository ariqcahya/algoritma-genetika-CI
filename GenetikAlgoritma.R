## Implementasi Genetik Algoritma (GA)
# One-Dimensional Function
f <- function(x)abs(x)+cos(x)
curve(f,-20,20)
fitness <- function(x)-f(x)
GA <- ga(type="real-valued",fitness=fitness, min=-20, max=20)
summary(GA)
plot(GA)
curve(f,-20,20)
abline(v=GA@solution, lty=3)

# Two-Dimension Function
Rastrigin <- function(x1,x2){
  20+x1^2+x2^2-10*(cos(2*pi*x1)+cos(2*pi*x2))
}
x1<-x2<-seq(-5.12,5.12, by = 0.1)
f <-outer(x1,x2,Rastrigin)
persp3D(x1,x2,f,theta=50,phi=20)
filled.contour(x1,x2,f,color.palette = jet.colors)
GA <- ga(type="real-valued", fitness=function(x)-Rastrigin(x[1],x[2]), min=c(-5.12,-5.12),
          max=c(5.12,5.12), popSize=50, maxiter=100)
summary(GA)
plot(GA)

# Tugas Ujian Pak Yandra Max f(x1,x1)
fungsi <- function(x1,x2){
  10.4 + x1*(sin(3*pi*x1)) + x2*(sin(13*pi*x2))
}
x1 <-seq(-2.0,15.5)
x2 <-seq(3.27,8.75)
fout <- outer(x1,x2,fungsi)
persp3D(x1,x2,fout,theta = 50,phi = 20)
filled.contour(x1,x2,fout,color.palette = jet.colors)
ProsesGA <- ga(type = "real-valued", fitness = function(x)-fungsi(x[1],x[2]), min = c(-2.0,3.27),
         max = c(15.5,8.75), popSize = 50, maxiter = 100)
summary(ProsesGA)
plot(ProsesGA)
