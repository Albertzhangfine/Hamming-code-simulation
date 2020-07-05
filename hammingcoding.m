clear
clc
%% coding
K=input('请输入线性分组码的类型,如 [5 2] \n K=');
G=input('请输入生成矩阵G,\n G=');
%eg G=[1,0,0,0,1,1,1;0,1,0,0,1,1,0;0,0,1,0,1,0,1;0,0,0,1,0,1,1];
k=K(2);
n=K(1);
r=n-k;
m=input('请输入需传送信息m,\n m=');
%eg m=[1 0 1 0]
l=length(m);
if(mod(l,k))
   disp('输入的信息有误');
else
    ge=l/k;
%将输入序列转化成矩阵m
temp1=[];
for i=1:ge
    temp1(i,:)=m(k*(i-1)+1:i*k);
end
m=temp1;
%求校验矩阵H
c=mod(m*G,2);   A=G(:,k+1:n);
H=[A',eye(r)];
disp('校验矩阵');H
disp('编码矩阵');c
end
disp('敲回车键继续');   pause
%% decoding
y=input('输入接收序列y,\n y=');
temp2=[];
for i=1:ge
    temp2(i,:)=y(1,n*(i-1)+1:i*n);
end
y=temp2
s=mod(y*H',2);
if s==0
    disp('码字无错');
end

for i=1:n
    if s==H(:,i)'
        y(i)=mod(y(i)+1,2);
        disp('校正子');s
    end
end
disp('编码译码为:');y
disp('信息译码为:');y(1:k)

% e=s*pinv(H');
% e=floor(e*2);
% cc=mod(y+e,2);
% sc=cc(:,1:2);
% disp('差错图样'); e
% disp('估计值'); cc
% disp('译码序列'); sc
