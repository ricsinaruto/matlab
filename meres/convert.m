%H=tf([1],[0.343*10^(-6) 0.000147 0.021 1]);
Tc =0.0032;
%Ts = pi*Tc/10;
Ts=0.001;

A=[0 1 0; 0 0 1; (-1/Tc^3) (-3/Tc^2) (-3/Tc)];
B=[ 0;0;(1/Tc^3)];

[Ad,Bd]=c2d(A,B,Ts);
