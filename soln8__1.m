A = load('/Users/mahimachaudhary/Downloads/wine.mat').A;
A(find(A(:,14) == 3),:) = [];
magnesium= A(:,5);
colorIntensity= A(:,10);
% input samples
X=[magnesium'; colorIntensity'; ones(1,130)];
labels=A(:,14);
for i = 1:130
 if(labels(i) == 1)
 Y(i) = -1;
 else
 Y(i) = 1;
 end
end
x1 = A(:,5)
x2 = A(:,10)
classes = A(:,14);
% Plot first class
scatter(x1(classes == 1), x2(classes == 1), 150, 'b', '*')
% Plot second class.
hold on;
scatter(x1(classes == 2), x2(classes == 2), 130, 'r', '*')
hold on
% init weigth vector
w=[-1 -1 -1]';
% call perceptron
wtag=perceptron(X,Y,w)
% predict
wtag
ytag=wtag'*X
w0=wtag(1); w1=wtag(2); w2=wtag(3);
x2=(w0/w1)*x1 - (w2/w1);
plot(x1,x2);
% plot prediction over origianl data
hold on
function [w] = perceptron(X,Y,w_init)
 w = w_init;
 for iteration = 1 : 10000 
      for i = 1 : size(X,2)
 if sign(w'*X(:,i)) ~= Y(i)
 w = w + X(:,i) * Y(i);
 end
 end
 sum(sign(w'*X)~=Y)/size(X,2);
 end
end
