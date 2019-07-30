#image_segmentation
Implementação em MATLAB do método descrito no artigo "Robust single-object image segmentation based on salient transition region"
Essa é uma implementação bem fiel do método de seguimentação de imagem de objeto unico descrito no artigo citado acima.

Autor do código: Paulo Henrique de Oliveira Gomes

Data: julho de 2019

Email: phdeoliveiragomes@gmail.com

Basta rodar o arquivo RUN.m para ver o resultado para uma imagem. 
Caso queira mudar a imagem basta escolher uma dentre as presentes na pasta "imagens" e mudar a variavel "nome" para o nome da imagem (sem extensão).

As seguintes variaveis:
w = 0 ;        % [0, 0,1, 0,2, 0,3, 0,4, 0,5, 0,6, 0,7, 0,8, 0,9, 1]
N_size = 3 ;   % [3, 5, 7, 9, 11, 13, 15]
alfa = 0,05 ;  % [0,01, 0,02, 0,03, 0,04, 0,05, 0,06, 0,07, 0,08, 0,09, 0,1]
beta = 0,1 ;   % [0,1, 0,2, 0,3, 0,4, 0,5]
Podem assumir quaisquer dos valores dentro dos colchetes. para obter uma melhor segmentação de uma imagem em específico basta
alterar tais parâmetros.
Recomento ler o PDF do artigo para melhor entendimento do método.
