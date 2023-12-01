function backEMF(D)
% init 
%mu = [15;-0.44]; % true init
mu = [0;-1];
P = 1000*eye(2);

Q= diag([0.1, 0.001]);
R = 0.016*eye(2);

T=length(D.isal);
% parametry
Dt = 0.000125;
parametry_pohonu
a = (1-Rs/Ls*Dt);
b = Fmag/Ls*Dt;
c = Dt/Ls; c=c/3;

% EKF - A is constant
A = [1 0; Dt 1];
% TODO - the rest of it....

yp=zeros(2,1);


%%%%%%%%%%%%%% estimation
ea = D.isal(2:end) - a*D.isal(1:end-1)-c*D.usa(1:end-1);
eb = D.isbe(2:end) - a*D.isbe(1:end-1)-c*D.usb(1:end-1);
som =sign( D.omega(1:end-1));
Eth = atan2(som.*ea,-som.*eb);

figure(1);
subplot(2,1,1)
plot(D.omega);
hold on;

subplot(2,1,2)
hold off
plot(D.theta);
hold on;
plot(Eth,'.r');
