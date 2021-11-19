clear all, clc


Gs=tf(1.4701, [0.325 1]);  T=0.0325;
Mp=4.33;  ts=2.5;  ksi=0.707; ess=0.0672;  % asim - yerlesme zamani - rampa hatasi katsayisi



%% 
[gspay, gspayda]=tfdata(Gs, 'v');
Gz=c2d(Gs, T)
[zpay, zpayda]=tfdata(Gz, 'v');

%% 2. dereceden ornek sistem


wn=4/(ksi*ts);   %  %2 kriterine gore omega_n

% kontrol kutuplari
s1=-ksi*wn+(wn*sqrt(1-(ksi^2)))*i
z1=exp(s1*T)

%% ( parametrik denklemler ile )

kv=1/ess;  % hiz hata katsayisi
gz=( polyval(zpay, 1) )/( polyval(zpayda, 1) );    % Gz(1) 
Ki=(kv*T)/gz

gz1_genlik=abs(z1);  % z1 in genligi
b=angle(z1);  % z1 in acisi(rad)
gpz1=( polyval(zpay, z1) )/( polyval(zpayda, z1) );
gpz1_genlik=abs(gz);   % Gz(z1) in genligi
a=angle(gpz1);    % Gz(z1) in acisi(rad)

d1=(Ki*sin(b))/(gz1_genlik-(2*cos(b))+(1/gz1_genlik));
d2=sin(a)/gpz1_genlik;
Kd=(gz1_genlik/sin(b))*(d1+d2)

p1=cos(a)/gpz1_genlik;

p2=(gz1_genlik-cos(b))/((gz1_genlik^2)-(2*gz1_genlik*cos(b))+1);

p3=((-gz1_genlik*sin(a))+(cos(b)*sin(a)))/(gpz1_genlik*sin(b));
Kp=-p1-(2*Ki*gz1_genlik*p2)+p3

