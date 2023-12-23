% this Matlab file contains the program for the critical manifold (and its
% 2-D projection), fold curves, projection curves, folded node, and strong
% canards shown in Figures 2 and 3 of the paper "The Dynamics Underlying
% Pseudo-Plateau Bursting in a Pituitary Cell Model", the Journal of
% Mathematical Neuroscience. 2011, 1:12, (DOI:10.1186/2190-8567-1-12). There
% are two data sets read in, for the singular periodic orbit and for the
% strong canard in Fig. 3b. Parameter values are gBK=0.4 gk=4.
[c,V]=meshgrid(0.26:0.01:0.31,-72.8:0.1:15);
vm=-20,sm=12;
minf=1./(1+exp((vm-V)./sm));
%plot(V,minf)
vf=-20;sf=56/10;
finf=1./(1+exp((vf-V)./sf));
ks=0.5;
sinf=c.^2./(c.^2 + ks.^2);
plot(c,sinf)
gca = 2; gk=4; gbk= 0.4; gsk= 1.7; vca= 50; vk= -75;
n=-1./gk.*(gca.*minf.*((V-vca)./(V-vk))+ gsk.*sinf +  gbk.*finf);
diffminf=diff(minf);
difffinf=diff(finf);
r = [0.5 0.5 0];       %# start
w = [.6  0.2 .7];    %# middle
b = [0 0.4 .7];       %# end
c1 = zeros(32,3); c2 = zeros(32,3);
for i=1:3
    c1(:,i) = linspace(r(i), w(i), 32);
    c2(:,i) = linspace(w(i), b(i), 32);
end

cc = [c1(1:end-1,:);c2];
colormap(cc)
%colormap hsv
%colormap cool
%colormap(hsv(50))
beta = .57;
brighten(beta);
surf(n,c,V,'EdgeColor','none')
axis([-0.03 0.26 0.26 0.309 -74 15])
hold on
[c,c]=meshgrid(0.26:0.01:0.31 ,0.26:0.01:0.31);
V= c-61.03205205-c;
PV= c+8.806733059-c;
natLowerFoldcurves = 0.1259131837-.425.*c.^2./(c.^2+.25);
lowercurve=plot3(natLowerFoldcurves,c,V);
Plowercurve=plot3(natLowerFoldcurves,c,PV);
set(lowercurve,'Color','red','LineWidth',1.0)
set(Plowercurve,'Color','blue','LineWidth',1.0)
V= c-22.80265742-c;
PUV= c-72.09940433-c;
natupperFoldcurves=0.2704116085-0.425.*c.^2./(c.^2+.25);
uppercurve=plot3(natupperFoldcurves,c,V);
Puppercurve=plot3(natupperFoldcurves,c,PUV);
set(uppercurve,'Color','red','LineWidth',1.0)
set(Puppercurve,'Color','blue','LineWidth',1)
FN=plot3(0.1555629220, 0.3042609439, -22.80265742);
set(FN,'marker','o','MarkerSize',7 ,'Color','blue','MarkerFaceColor','blue')
load strongcanarddata.dat
esc=strongcanarddata(:,3);
Vsc=strongcanarddata(:,2);
nsc=strongcanarddata(:,4);
strongcanard=plot3(nsc,esc,Vsc);
set(strongcanard,'Color','green','LineWidth',1.5)
load singularperiodicorbit.dat
esorbit=singularperiodicorbit(:,3);
Vsorbit=singularperiodicorbit(:,2);
nsorbit=singularperiodicorbit(:,4);
sorbit=plot3(nsorbit,esorbit,Vsorbit);
set(sorbit,'Color','black','LineWidth',1.5)
hold off
