# Lab-7-Traditional-vs-AI-Gaussian-Filters-is-due

Quantitative Evaluation Summary 📈
The final quantitative analysis, based on Mean-Square Error (MSE), Peak Signal-to-Noise Ratio (PSNR), and Structural Similarity Index (SSIM), confirms the visual performance of the filters.

Metrics Overview
Noisy Image: The image containing just the Gaussian noise provides the baseline metrics (e.g., PSNR of (Insert Noisy PSNR dB) and SSIM of (Insert Noisy SSIM).

Mean Filter: This filter typically performs the worst in terms of fidelity, resulting in the highest MSE (Insert Mean MSE) and the lowest PSNR (Insert Mean PSNR dB) and SSIM (Insert Mean SSIM) values among the filtered images, indicating significant loss of detail due to over-smoothing.

Median Filter: 
The Median filter often shows strong performance, yielding a low MSE (Insert Median MSE) and competitive PSNR (Insert Median PSNR dB) and SSIM (Insert Median SSIM). This demonstrates its ability to smooth the noise while effectively preserving structural edges.

Gaussian Filter: As a filter specifically designed for Gaussian noise, it consistently yields excellent results, often achieving the lowest MSE (Insert Gaussian MSE) and the highest PSNR (Insert Gaussian PSNR dB) and SSIM (Insert Gaussian SSIM) values among the three.

Conclusion
The Gaussian Filter and the Median Filter are the most effective traditional methods for this noise type, as they consistently produce the best PSNR and SSIM scores, signifying the highest image quality and structural similarity to the original image after denoising.

![images]()
