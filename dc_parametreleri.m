clear all
clc
r=1.5
f=4900
p=65000;
E=650;

Vyuk=2*sqrt(2)/pi*E
Iyuk=sqrt(p/r)

cosfi=p/(Vyuk*Iyuk)
fi=acos(cosfi)
lc=(tan(fi)*r-1)/(2*pi*f*f)
