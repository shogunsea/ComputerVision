%Noise filtering demo
%Created by Octavia Camps
%Fall 2007

%clean all

clear all
close all
imtool close all

% Create a 8 bit 256x256 image with gray levels 64 and 128

%
G = [64 * ones(256,128,'uint8') ,128 * ones(256,128,'uint8')];

% Show the image

figure

%%%%%%%%%%%%%%%%%%%% imtool vs figure??, 

imtool(G)

% Plot the histogram

imhist(G)

% Converting to double ...

% im2double scales between 0 and 1

Gd1 = im2double(G);


% double does not scale

Gd2 = double(G);

%%%%%%%%%% differences between the two?

% Adding uncorrelated 0 mean, sigma = 3 gaussian noise

% Note: variance = sigma * sigma

% Using imnoise: images are normalized between 0 and 1

s = 3/255;

Gn1 = imnoise(G,'gaussian',0, s*s);

% Check mean & std

mean(double(Gn1))%%%%%%%%% what will change after calling double on a variable that has alredy been doublised?(Gn1 = im2double(G))
%%%%%% just the calculation, won't be used?

std(double(Gn1))%%%%  So.... this two functions should print 0 and 3.?

% Using randn

N = 3 * randn(size(Gd2));

Gd2n = Gd2 + N;%%%%%% additive noise? why multiple by 3?

surf(120:140,120:140,Gd2n(120:140,120:140))  %%% plot the edge??

Gn2 = uint8(Gd2n);

% Check mean & std

mean(double(Gn2))

std(double(Gn2))

% Show image

imtool(Gn1)

% Show histogram

imhist(Gn1)

% Cleaning noise

h3 = 1/9 * ones(3,3);

Gn3 = imfilter(Gn1,h3, 'replicate');

imhist(Gn3)

imtool(Gn3)

h5 = 1/25 * ones(5,5);

Gn5 = imfilter(Gn1,h5,'replicate');
%%

imtool (Gn5)


% Salt & Pepper

Gsp = imnoise(G, 'salt & pepper', 0.1);

imtool(Gsp)

Gsp3 = imfilter(Gsp,h3,'replicate');

imtool(Gsp3)


Gsp3m = medfilt2(Gsp,[3,3]);

imtool(Gsp3m)

Gsp5 = imfilter(Gsp,h5,'replicate');

imtool(Gsp5)

Gsp5m = medfilt2(Gsp,[5,5]);

imtool(Gsp5m)







