%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary

% Student Number: 216725962

% Email:mahimachaudhary966@gmail.com
A = load('/Users/mahimachaudhary/Downloads/wine.mat').A;
A(find(A(:,14) == 3),:) = [];
y= A(:,14);
y_pred = zeros(130:1)
n=1
for n= 1:10
    
dim= ((2*n)+1)+(n*(n-1)/2);
dim
features = [A(:,5),A(:,10)]

format long      
%generating design matrix d from features
m = fullfact([(n+1) (n+1) ])-1
m(sum(m,2)>n,:) = [];
d= x2fx(features,m); % design matrix https://www.mathworks.com/help/stats/x2fx.html
d
x_dag = (inv((transpose(d)) * (d)))* (transpose(d)); % psuedo inverse
x_dag;
w= x_dag*y; %least square weights

y_pred = d*w;

 ERM(n) = (1/130)*sum((y - y_pred).^2) %finding ERM for n=10
  
end

%plotting
figure(3)

plot(1:10, ERM)
ylim([0 1])
xlabel('n')
ylabel('Error')
title('ERM')
    
    