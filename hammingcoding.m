clear
clc
%% coding
K=input('���������Է����������,�� [5 2] \n K=');
G=input('���������ɾ���G,\n G=');
%eg G=[1,0,0,0,1,1,1;0,1,0,0,1,1,0;0,0,1,0,1,0,1;0,0,0,1,0,1,1];
k=K(2);
n=K(1);
r=n-k;
m=input('�������贫����Ϣm,\n m=');
%eg m=[1 0 1 0]
l=length(m);
if(mod(l,k))
   disp('�������Ϣ����');
else
    ge=l/k;
%����������ת���ɾ���m
temp1=[];
for i=1:ge
    temp1(i,:)=m(k*(i-1)+1:i*k);
end
m=temp1;
%��У�����H
c=mod(m*G,2);   A=G(:,k+1:n);
H=[A',eye(r)];
disp('У�����');H
disp('�������');c
end
disp('�ûس�������');   pause
%% decoding
y=input('�����������y,\n y=');
temp2=[];
for i=1:ge
    temp2(i,:)=y(1,n*(i-1)+1:i*n);
end
y=temp2
s=mod(y*H',2);
if s==0
    disp('�����޴�');
end

for i=1:n
    if s==H(:,i)'
        y(i)=mod(y(i)+1,2);
        disp('У����');s
    end
end
disp('��������Ϊ:');y
disp('��Ϣ����Ϊ:');y(1:k)

% e=s*pinv(H');
% e=floor(e*2);
% cc=mod(y+e,2);
% sc=cc(:,1:2);
% disp('���ͼ��'); e
% disp('����ֵ'); cc
% disp('��������'); sc
