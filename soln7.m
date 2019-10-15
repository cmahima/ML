%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary

% Student Number: 216725962

% Email:mahimachaudhary966@gmail.com
A = load('/Users/mahimachaudhary/Downloads/wine.mat').A;
A(find(A(:,14) == 3),:) = [];
y= A(:,14);
y_pred = zeros(130:1);
n=2
n= 10
dim= ((2*n)+1)+(n*(n-1)/2);
features = [A(:,5),A(:,10)];
for n = 1:10
format long      
%generating design matrix d from features
m = fullfact([(n+1) (n+1) ])-1
m(sum(m,2)>n,:) = [];
d= x2fx(features,m); % design matrix

x_dag = (inv((transpose(d)) * (d)))* (transpose(d));
x_dag;
w= x_dag*y;

y_pred = d*w;

 ERM1(n)  = (1/130)*sum((y - y_pred).^2);
   % s = s+ ERM(j);
  
end 

for n = 1:10
features1 = [A(:,5),A(:,10) ,A(:,11)];
format long
% making design matrix for 3 features
m1 = fullfact([(n+1) (n+1) (n+1)])-1;
m1(sum(m1,2)>n,:) = []; %model matrix
d1= x2fx(features1,m1); % design matrix

%finding x dagger with help of design matrix
x_dag1 = (inv((transpose(d1)) * (d1)))* (transpose(d1));
x_dag1;
w1= x_dag1*y;

y_pred1 = d1*w1;


ERM2(n)  = (1/130)*sum((y - y_pred1).^2);
end

%Plot to compare
abs_error = abs(ERM1-ERM2)
figure(7)
set(gca,'xtick',0:.1:1)
plot(1:10, ERM1)
hold on
plot(1:10, ERM2)
hold off
ylim([0,1])
xlabel('n')
ylabel('Error')
title('ERM')
legend( 'ERM1(Q3)','ERM2(Q6) ')

