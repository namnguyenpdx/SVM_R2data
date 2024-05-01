clc;
clear all;

% A=load('DataSetR2.txt'); %Read the dataset to a matrix
% X=A(:,1:2); %x is the first two colums of the matrix
% y=A(:,3);%Get the y with label 1 or -1
%m=size(A,1);

[X, y]=gendata(200,200);
X=X';

m=size(X,1);


w=[0 0];
b=0;

%Choose a starting point
c=4000; %Penalty parameter
for i=1:1000
    sub1=[0 0]; %Computing a subgradient
    sub2=0;
    for t=1:m
        if y(t)*(w'*X(t,:)+b)<1
        sub1=sub1+c/m*(-y(t)*X(t,:))+w;
        sub2=sub2+c/m*(-y(t));
        else
            sub1=sub1+w;
            sub2=sub2+0;
        end
    end
    w=w-1/i*sub1;
    b=b-1/i*sub2;
end
for k=1:m
    if y(k)==-1
    plot(X(k,1), X(k,2), '*');
        hold on
    end
    hold on
    if y(k)==1
                plot(X(k,1), X(k,2), 'r*');
        hold on
    end
end
f=@(u) -w(1)/w(2)*u-b/w(2);
t=-5:0.1:5;
y=f(t);
plot(t,y,'*');
w


        
        