%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary


% Email:mahimachaudhary966@gmail.com

%this code is to plot the perceptron for n=1
%since the code was taking long t run therefore the weight swere learnt
%once and used in this code to plot the graph 

n=1;
A = load('/Users/mahimachaudhary/Downloads/wine.mat').A;
A(find(A(:,14) == 3),:) = [];
%plotting the data
f1min = min(A(:,5))
f1max = max(A(:,5))
f2min = min(A(:,10))
f2max = max(A(:,10))
p1 = [A(:,5),A(:,10)];
m = fullfact([(n+1) (n+1) ])-1 ;%design matrix 
m(sum(m,2)>n,:) = [];
p= x2fx(p1,m);
w = 1.0e+03*[ 3.984300000000000 -0.036500000000000   -0.351675999993797 ];
figure(8)
%sizes = 15 * ones(1,length(x1));
y = A(:,14)
x1 = A(:,5);
x2 = A(:,10);
classes = A(:,14);
% Plot first class
scatter(x1(classes == 1), x2(classes == 1), 150, 'b', '*')
% Plot second class.
hold on;
scatter(x1(classes == 2), x2(classes == 2), 130, 'r', '*')
hold on
%scatter3(A(:,5),A(:,10),A(:,14))
%scatter3(A(:,5),A(:,10),Y_hat_min)
%hold on 
b0= 1.0e+03*-31.213  ;
b1= 1.0e+03*-3.478;
b2= 1.0e+03*0.1770 ;
x2 = -(b0/b2) + (b1/b2)*x1 ;
plot(x1,x2)
hold off
xlabel('x1')
ylabel('x2')
title(sprintf('PLA'))
ypred = p*w.'
error= (1/130)*sum((y - y_pred).^2)


    


