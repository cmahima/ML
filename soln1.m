%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary

% Email:mahimachaudhary966@gmail.com
fileData = load("/Users/mahimachaudhary/Downloads/wine.mat"); % load file
wineMatrix= fileData.A
 
wineMatrix(wineMatrix(:,14)==3,:)=[]; % removing column with wine label 3

 
alcohol= wineMatrix(:,1);% extracting alchohol
malic_acid= wineMatrix(:,2);% extracting malic acid
class= wineMatrix(:,14);
gscatter(alcohol,malic_acid,class)% making scatter plot
 
 
