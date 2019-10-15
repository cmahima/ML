%% Assignment -1 EECS 4404/5327

% Name: Mahima Chaudhary

% Email:mahimachaudhary966@gmail.com
winetemp = load("/Users/mahimachaudhary/Downloads/wine.mat")
winemat = cell2mat(struct2cell(winetemp))
winemat(winemat(:,14)==3,:)=[]
x = winemat(:,5) %magnesium
y = winemat(:,10) %colour intensity
z = winemat(:,11) %hue
labels = winemat(:, 14)
figure(5)


figure
for i = 1:130
    if labels(i) == 1
        plot3(x(i),y(i),z(i),'r.')
        hold on
    else
        plot3(x(i),y(i),z(i),'b.')
        hold on
    end
    
end




%plot 3 TODO

xlabel('Magnesium Intensity')
ylabel('Color Intensity')
zlabel('Hue')
%scatter3(x,y,z)
