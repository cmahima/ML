%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary


% Email:mahimachaudhary966@gmail.com
A = load('/Users/mahimachaudhary/Downloads/wine.mat').A;
A(find(A(:,14) == 3),:) = [];
y= A(:,14);
y_pred = zeros(130:1);
n=10;
j=1;
l = 1; %regularization parameter
%Running loop for 20 times for random values of lambda
%lambda=l in this program
for i= 1:20    
    lam(i)=l;
dim= ((2*n)+1)+(n*(n-1)/2); %this variable stores the total possible terms in a polynomial of degree 'n' with 2 variables
features = [A(:,5),A(:,10)];
 %random values of lambda
format long      
%generating design matrix d from features
m = fullfact([(n+1) (n+1) ])-1; %this funtion helps to make the model matrix that helps to make design matrix
m(sum(m,2)>n,:) = []; % removing terms from model matrix that are of degree>n
d= x2fx(features,m) % design matrix https://www.mathworks.com/help/stats/x2fx.html
l*eye(dim)
x_dag = (inv((transpose(d)) * (d) + l* eye(dim)))* (transpose(d)); %x dagger being calculated with the regularization term lambda(l)
w= x_dag*y; % w least squares 


y_pred = d*w;
 ERM3(i) = (1/130)*sum((y - y_pred).^2) + (1/130)* l * sumabs(w);% predicted regularized error
 l = l/2;
end
 format long  
%end
figure(4)
%Colors = rgb('red','green','blue');
plot(lam, ERM3)
set(gca,'xdir','reverse')
hold on
hold off
xlabel('lambda')
ylabel('Regularized Error')
title('ERM')
legend( 'ERM3(Q3)')
