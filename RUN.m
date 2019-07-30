%{
Implementação do metodo proposto no artigo:
"Robust single-object image segmentation based on salienttransition region"
Autores: Zuoyong Li, Guanghai Liu, David Zhang e YongXu
Publicado em: Pattern Recognition  2016

Autor do código: Paulo Henrique de Oliveira Gomes
email: phdeoliveiragomes@gmail.com
%}
close all, clear, clc

%% Definir parametros
w = 0;        % [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]
N_size = 3;   % [3, 5, 7, 9, 11, 13, 15]
alpha = 0.05; % [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1]
beta = 0.1;   % [0.1, 0.2, 0.3, 0.4, 0.5]

%% Carrega os dados e o ground truth
CurrentPath = pwd;
addpath(genpath(strcat(CurrentPath, '/imagens')));
files = dir('imagens');

k = 1;      % numero da imagem que vc quer de 1 até 10
I = imread(files((k*2)+1).name);
B0 = imread(files((k*2)+2).name);

%% Extracao da Regiao de Transicao
TR = Transition_Region(I,N_size,alpha,w);

%% Extracao saliente da Regiao de Transicao
STR = Salient_Transition_Region(TR);

%% Limite de imagem
T_max = image_thresholding(I,TR,STR,beta);

%% Refinando o resultado de limiar de imagem
BT = Refining_image_thresholding(I,STR,T_max);

%% Exibir resultados
imshow(BT);

%% Metrica de avaliacao
BT = BT > 0;
B0 = B0 > 0;
ME = 1 - [ sum(sum(B0 .* BT)) + sum(sum(~B0 .* ~BT)) ] / [ sum(sum(B0)) + sum(sum(~B0)) ];
