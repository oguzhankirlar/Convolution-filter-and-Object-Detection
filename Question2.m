RGB = imread('cigarette.png');
cigaretteImage = rgb2gray(RGB)

RGB1 = imread('jokerimage.png');
jokerImage= rgb2gray(RGB1)

RGB2 = imread('flower.png');
flowerImage = rgb2gray(RGB2)

cigarettePoints = detectSURFFeatures(cigaretteImage);
jokerPoints = detectSURFFeatures(jokerImage);

[cigaretteFeatures, cigarettePoints] = extractFeatures(cigaretteImage, cigarettePoints);
[jokerFeatures, jokerPoints] = extractFeatures(jokerImage, jokerPoints);

cigarettePairs = matchFeatures(cigaretteFeatures, jokerFeatures);
matchedCigarettePoints = cigarettePoints(cigarettePairs(:, 1), :);
matchedJokerPoints = jokerPoints(cigarettePairs(:, 2), :);

[tform, inlierCigarettePoints, inlierJokerPoints] = ...
    estimateGeometricTransform(matchedCigarettePoints, matchedJokerPoints, 'affine');

boxPolygon = [1, 1;...                           
        size(cigaretteImage, 2), 1;...                 
        size(cigaretteImage, 2), size(cigaretteImage, 1);... 
        1, size(cigaretteImage, 1);...                
        1, 1];                   
    
newBoxPolygon = transformPointsForward(tform, boxPolygon);

nflower = imresize(flowerImage,[newBoxPolygon(2,1)-newBoxPolygon(1,1)+1 newBoxPolygon(3,2)-newBoxPolygon(2,2)])

jokerImage(newBoxPolygon(1,1):newBoxPolygon(2,1), newBoxPolygon(2,2):newBoxPolygon(3,2)) = nflower;

figure;
imshow(jokerImage);

rgbImage = ind2rgb(jokerImage, colormap);
figure;
imshow(rgbImage);


