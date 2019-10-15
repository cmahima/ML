%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary

% Student Number: 216725962

% Email:mahimachaudhary966@gmail.com
A = load('/Users/mahimachaudhary/Downloads/wine.mat').A;
A(find(A(:,14) == 3),:) = [];
y= A(:,14);
features = [A(:,5),A(:,10) ,A(:,11)];
n=10
format long
% making design matrix for 3 features
m = fullfact([(n+1) (n+1) (n+1)])-1;
m(sum(m,2)>n,:) = [] %model matrix
d= x2fx(features,m) % design matrix

%finding x dagger with help of design matrix
x_dag = (inv((transpose(d)) * (d)))* (transpose(d));
x_dag;
w= x_dag*y;

%making a vector a for 3 features x1, x2, x3 
a = sym('x',[1 2 3]);
dim= factorial(3+n)/(factorial(n)* factorial(3));

%making polynomial function
syms f(x1, x2, x3 )
f(x1,x2,x3)= w(1);
for i = 2:dim
    
    f(x1,x2,x3) = f(x1,x2,x3)+ w(i)* a(1,1).^m(i,1) * a(1,2).^m(i,2) * a(1,3).^m(i,3);
   
end
f(x1,x2,x3)
 



