% MATLAB Code: Image Processing Operations

%% Read and Display Images
% Read grayscale image and display it
img = imread('MathWorks Images\boston_haze.jpg');
imshow(img);

%% Convert Indexed Images into RGB Images
% Read indexed image and colormap
[A, map] = imread('MathWorks Images\Orion Images\OrionNebula5.png');

% Inspect the variables A and map
whos A map;

% Explanation:
% A: Indexed image, a 2D matrix where each element represents an index into the colormap.
% map: Colormap, a matrix where each row specifies an RGB triplet (i.e., the red, green, and blue components of a color).

%% Inspecting Pixel Value in a Color Image
% Read color image
img2 = imread("George VI Ice Shelf\1_SnowPoolsBefore_20180113_md-2048px.jpg");

% Display the size of the image
size(img2);

% Extract and display the value of a pixel (1,1) in the first channel
x = img2(1, 1, 1); % Pixel at position (1, 1) in channel 1
double(x);         % Convert the pixel value to double for more precision

% Display the full image
imshow(img2);

%% Use imtool for Image Inspection
imtool(img2);

%% Inspecting Another Image
img3 = imread('MathWorks Images\PuzzleBadLighting.jpg');
size(img3);

% Inspect the value of a specific pixel
img3(604, 411, :);

% Use imtool for detailed inspection
imtool(img3);

%% Convert Color Image to Grayscale
img4_color = imread('MathWorks Images\half moon.JPG');
imshow(img4_color);

% Convert color image to grayscale
img4_gray = rgb2gray(img4_color);
imshow(img4_gray);

% Display a specific region of the grayscale image
imshow(img4_gray(20:90, 40:150));

%% Apply Power Operation to Grayscale Image
% This operation brightens the image by raising the pixel values to a power
imshow(img4_gray.^2.5);  % Brighten the image by raising pixel values to the power of 2.5

% Note: If you encounter an error like "Integers can only be raised to positive integral powers",
% it is likely due to the image being in an integer type (e.g., uint8). To avoid this, use double:
imshow(double(img4_gray).^2.5);

%% Averaging Multiple Images
% Load multiple images into the images cell array
img1 = imread('MathWorks Images\Orion Images\OrionNebula1.png');
img2 = imread('MathWorks Images\Orion Images\OrionNebula2.png');
img3 = imread('MathWorks Images\Orion Images\OrionNebula3.png');
img4 = imread('MathWorks Images\Orion Images\OrionNebula4.png');
img5 = imread('MathWorks Images\Orion Images\OrionNebula5.png');

% Store images in a cell array
images = {img1, img2, img3, img4, img5};

% Display sizes of all images
for i = 1:length(images)
    disp(size(images{i}));  % Display size of each image
end   

% Compute the average of the images (both int8 and double)
avg_image_int8 = (img1 + img2 + img3 + img4 + img5) / 5;
avg_image_double = (im2double(img1) + im2double(img2) + im2double(img3) + im2double(img4) + im2double(img5)) / 5;

% Display both averaged images
figure;
subplot(1, 2, 1);
imshow(avg_image_int8); % Display averaged int8 image
title('Average Image (int8)');

subplot(1, 2, 2);
imshow(avg_image_double); % Display averaged double image
title('Average Image (double)');

%% Resize and Rotate Images
% Resize and rotate the first image
img1 = images{1};           % First image from the cell array
img2 = imresize(img1, 0.75); % Resized image (75% of original size)
img3 = imresize(img1, [2000, 2500]); % Resized image to 2000x2500
img4 = imrotate(img1, -30); % Rotated image by -30 degrees

% Display all images in a montage
montage({img1, img2, img3, img4}); % Show all images side by side

