% --- 1. Setup: Load an image and add Gaussian noise ---
originalImage = im2double(imread('cameraman.tif'));
noiseSigma = 0.04;
noisyImage = imnoise(originalImage, 'gaussian', 0, noiseSigma^2);

figure('Name', 'Gaussian Noise Denoising Comparison');
subplot(1, 5, 1); imshow(originalImage); title('Original Image');
subplot(1, 5, 2); imshow(noisyImage); title('Noisy Image');

% --- 2. Traditional Filters (Mean, Median, Gaussian) ---
% Use a 3x3 window for Mean and Median filters
windowSize = 3; 

% 2a. Mean (Averaging) Filter
meanFiltered = imfilter(noisyImage, fspecial('average', [windowSize windowSize]), 'replicate');
subplot(1, 5, 3); imshow(meanFiltered); title('Mean Filter (3x3)');

% 2b. Median Filter
medianFiltered = medfilt2(noisyImage, [windowSize windowSize]);
subplot(1, 5, 4); imshow(medianFiltered); title('Median Filter (3x3)');

% 2c. Gaussian Blur Filter
% Define a standard deviation for the Gaussian kernel
gaussianSigma = 1.0; 
gaussianFiltered = imgaussfilt(noisyImage, gaussianSigma);
subplot(1, 5, 5); imshow(gaussianFiltered); title('Gaussian Filter (Sigma 1)');

% NOTE: The original code's DnCNN (AI Filter) section has been REMOVED 
% to focus on the required traditional filters.

% --- 3. Quantitative Evaluation (MSE, PSNR, and SSIM) ---
% Note: MSE is calculated as the mean squared difference between images.
% Note: psnr() function calculates MSE internally: PSNR = 10*log10(1/MSE) 
% for normalized double images.

% Function to calculate MSE:
calculateMSE = @(I1, I2) mean((I1(:) - I2(:)).^2);

% Calculate metrics for the Noisy Image
mseNoisy = calculateMSE(noisyImage, originalImage);
psnrNoisy = psnr(noisyImage, originalImage);
ssimNoisy = ssim(noisyImage, originalImage);

% Calculate metrics for the Mean Filter
mseMean = calculateMSE(meanFiltered, originalImage);
psnrMean = psnr(meanFiltered, originalImage);
ssimMean = ssim(meanFiltered, originalImage);

% Calculate metrics for the Median Filter
mseMedian = calculateMSE(medianFiltered, originalImage);
psnrMedian = psnr(medianFiltered, originalImage);
ssimMedian = ssim(medianFiltered, originalImage);

% Calculate metrics for the Gaussian Filter
mseGaussian = calculateMSE(gaussianFiltered, originalImage);
psnrGaussian = psnr(gaussianFiltered, originalImage);
ssimGaussian = ssim(gaussianFiltered, originalImage);


% Display the metrics
fprintf('\n--- Image Quality Metrics Comparison ---\n');
fprintf('Method | MSE (x10^-3) | PSNR (dB) | SSIM\n');
fprintf('----------------------|--------------|-----------|----------\n');
fprintf('Noisy Image | %10.4f | %8.4f | %8.4f\n', mseNoisy*1000, psnrNoisy, ssimNoisy);
fprintf('Mean Filter | %10.4f | %8.4f | %8.4f\n', mseMean*1000, psnrMean, ssimMean);
fprintf('Median Filter | %10.4f | %8.4f | %8.4f\n', mseMedian*1000, psnrMedian, ssimMedian);
fprintf('Gaussian Filter | %10.4f | %8.4f | %8.4f\n', mseGaussian*1000, psnrGaussian, ssimGaussian);