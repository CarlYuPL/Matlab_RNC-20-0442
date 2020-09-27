clc;
clear all;

A=[-1 1;1 -1]; 
[M N]=size(A);

K=[-5 -2;-1 -6];
k=[-4 -2;-1 -5];



T=20;

H=1000; %numbers of the sampling path trajectories


%%%%%The state response with stepsize=0.01s and sampleperiod=0.01s%%%%%
stepsize=0.01;           %stepsize of ARTM
sampleperiod=0.01;       %sampling period
pi=expm(A*sampleperiod);
proportion=stepsize/sampleperiod*100-0.001;

for h=1:H
    RNC_M;
    sim('RNC_S');
    
    EExact1(:,h) = Exact(:,1);
    EExact2(:,h) = Exact(:,2);

    figure(1)
    plot(TT,Exact(:,1),'g-','LineWidth',1);hold on
    plot(TT,Exact(:,2),'c-','LineWidth',1);hold on
end

    [y z]=size(TT);
    EExactx1=zeros(y,z);
    EExactx2=zeros(y,z);

for h=1:H
    EExactx1 = EExactx1 + EExact1(:,h);
    EExactx2 = EExactx2 + EExact2(:,h);
end


EExactx1 = EExactx1/H;
EExactx2 = EExactx2/H;

figure(1)
plot(TT,EExactx1(:,1),'b-','LineWidth',1.5);hold on
plot(TT,EExactx2(:,1),'r-','LineWidth',1.5);hold off

xlabel('t/s');
ylabel('z(t)');
axis([0 10 -5 5]);




%%%%%The state response with stepsize=0.01s and sampleperiod=0.04s%%%%%
stepsize=0.01;           %近似模型计算步长
sampleperiod=0.04;       %采样周期
pi=expm(A*sampleperiod);
proportion=stepsize/sampleperiod*100-0.001;

EExactx1=zeros(y,z);
EExactx2=zeros(y,z);

for h=1:H
    RNC_M;
    sim('RNC_S');
    
    EExact1(:,h) = Exact(:,1);
    EExact2(:,h) = Exact(:,2);

    figure(2)
    plot(TT,Exact(:,1),'g-','LineWidth',1);hold on
    plot(TT,Exact(:,2),'c-','LineWidth',1);hold on
end
for h=1:H
    EExactx1 = EExactx1 + EExact1(:,h);
    EExactx2 = EExactx2 + EExact2(:,h);
end


EExactx1 = EExactx1/H;
EExactx2 = EExactx2/H;

figure(2)
plot(TT,EExactx1(:,1),'b-','LineWidth',1.5);hold on
plot(TT,EExactx2(:,1),'r-','LineWidth',1.5);hold off

xlabel('t/s');
ylabel('z(t)');
axis([0 10 -5 5]);






%%%%%The state response with stepsize=0.04s and sampleperiod=0.04s%%%%%
stepsize=0.04;           
sampleperiod=0.04;       
pi=expm(A*sampleperiod);
proportion=stepsize/sampleperiod*100-0.001;

EExactx1=zeros(y,z);
EExactx2=zeros(y,z);

for h=1:H
    RNC_M;
    sim('RNC_S');
    
    EExact1(:,h) = Exact(:,1);
    EExact2(:,h) = Exact(:,2);

    figure(4)
    plot(TT,Exact(:,1),'g-','LineWidth',1);hold on
    plot(TT,Exact(:,2),'c-','LineWidth',1);hold on
end
for h=1:H
    EExactx1 = EExactx1 + EExact1(:,h);
    EExactx2 = EExactx2 + EExact2(:,h);
end


EExactx1 = EExactx1/H;
EExactx2 = EExactx2/H;

figure(4)
plot(TT,EExactx1(:,1),'b-','LineWidth',1.5);hold on
plot(TT,EExactx2(:,1),'r-','LineWidth',1.5);hold off

xlabel('t/s');
ylabel('z(t)');
axis([0 10 -5 5]);