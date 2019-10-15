%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary

% Email:mahimachaudhary966@gmail.com
A = load('/Users/mahimachaudhary/Downloads/wine.mat').A;
A(find(A(:,14) == 3),:) = [];
y= A(:,14);
for n= 1:10 % run for degree n = 1:10 
dim= ((2*n)+1)+(n*(n-1)/2); % calculate the number of terms in polynomial of degree n
features = [A(:,5),A(:,10)]
format long      
%generating design matrix d from features
m = fullfact([(n+1) (n+1) ])-1 % function that helps in making model matrix that in turn helps in design matrix https://www.mathworks.com/help/stats/fullfact.html
m(sum(m,2)>n,:) = []; %model matrix
d= x2fx(features,m); % design matrix https://www.mathworks.com/help/stats/x2fx.html
size(m)
d

x_dag = (inv((transpose(d)) * (d)))* (transpose(d)); %psuedo inverse matrix
w= x_dag*y; % least square weights

a = sym('x',[1 2]) % defining a funtion for 2 variables

% making the polynomial function with the least square weights
syms f(x1, x2 )
f(x1,x2)= w(1)
for i = 2:dim
    
    f(x1,x2) = f(x1,x2)+  w(i)* a(1,1).^m(i,1) * a(1,2).^m(i,2);
end
%plotting the data
f1min = min(A(:,5))
f1max = max(A(:,5))
f2min = min(A(:,10))
f2max = max(A(:,10))

figure(1)

scatter3(A(:,5),A(:,10),A(:,14))
hold on 

fsurf(f, [f1min f1max f2min f2max])
xlabel('Magnesium Intensity')
ylabel('Color Intensity')
zlabel('Y')
title(sprintf('Data and Best Fitting Exponential Curve'))
legend('True Data','Predicted Data', 'Fitted Curve')
hold off


   
   
