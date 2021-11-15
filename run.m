clear ; close all; clc

fprintf('Loading data ...\n');
data = load('inputTrainingSet.txt');
X = data(:, 2:3);
y = data(:, 5);
m = length(y);
fprintf('10 Contoh Data Pertama dari Dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('\n \n');

prompt = 'Masukkan Luas Tanah untuk diprediksi : ';
luas_tanah = input(prompt);

prompt = 'Masukkan Luas Bangunan untuk diprediksi : ';
luas_bangunan = input(prompt);

prompt = 'Masukkan Jumlah Kamar Mandi untuk diprediksi : ';
jumlah_kamar_mandi = input(prompt);

prompt = 'Masukkan Jumlah Kamar Tidur untuk diprediksi : ';
jumlah_kamar_tidur = input(prompt);

prompt = 'Masukkan Harga untuk diprediksi : ';
harga = input(prompt);

prompt = 'Tahun Iklan : ';
tahun_iklan = input(prompt);

fprintf('Program dipause. Press enter untuk melanjutkan.\n');
pause;

fprintf('\n');
fprintf('Proses Normalisasi Fitur ...\n');

[X mu sigma] = featureNormalize(X);

X = [ones(m, 1) X];

fprintf('\n');
fprintf('Proses Gradient Descent ...\n');

alpha = 0.01;
num_iters = 400;
 
theta = zeros(3, 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Iterasi');
ylabel('Nilai J');

fprintf('\n');
fprintf('Hasil Theta dari Gradient Descent : \n');
fprintf(' %f \n', theta);
fprintf('\n');

normalizedSquareFeet = (luas_tanah - mu) / sigma;
normalizedNumberOfBedrooms = (jumlah_kamar_mandi - mu) / sigma;

normalizedInput = [1, normalizedSquareFeet, normalizedNumberOfBedrooms];
estimatePriceUsingGradientDescent = normalizedInput * theta; 

fprintf(['Prediksi Estimasi Harga Dengan GradientDescent dari %f (m2) luas bangunan dan %f kamar mandi' ...
         '(dengan gradient descent):\n Rp. %f\n'], luas_tanah,jumlah_kamar_mandi,estimatePriceUsingGradientDescent);

fprintf('Program dipause. Press enter untuk melanjutkan.\n');
pause;

fprintf('\n');
fprintf('Memperbaiki dengan Normal Equations ...\n');

data = csvread('inputTrainingSet.txt');
X = data(:, 2:3);
y = data(:, 5);
m = length(y);

X = [ones(m, 1) X];

theta = normalEquation(X, y); 

fprintf('\n');
fprintf('Hasil Theta dari Normal Equations : \n');
fprintf(' %f \n', theta);
fprintf('\n');


price = [1, luas_tanah, jumlah_kamar_mandi] * theta; 

fprintf(['Prediksi Estimasi Harga Dengan Normal Equations dari %f (m2) luas bangunan dan %f kamar mandi' ...
         '(dengan normal equation):\n Rp. %f\n'], luas_tanah,jumlah_kamar_mandi,price);

