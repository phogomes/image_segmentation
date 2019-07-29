function TR = Transition_Region(I,N_size,alpha,w)
    % Calcula a complexidade e a variancia locais
    dim = floor(N_size/2);
    [Lc,Lv] = local_complexity_and_variance(I,dim);

    % Normaliza a complexidade e variancia locais
    NLc = (Lc - min(min(Lc))) / (max(max(Lc)) - min(min(Lc)));
    NLv = (Lv - min(min(Lv))) / (max(max(Lv)) - min(min(Lv)));

    % sitetiza as duas matrizes em um descritor de regiao de transicao
    NLCV = w * NLc + (1-w) * NLv;

    %(1) transforma o descritor de regiao de transicao em um vetor linha e 
    % o classifica em ordem decrescente
    SNLCV = reshape(NLCV,1,[]);
    SNLCV = sort(SNLCV,'descend');

    %(2) seleciona os alpha*n maiores valores para definir a Regiao de Transicao
    n = size(SNLCV,2); 
    ponto_corte = SNLCV(ceil(n*alpha));

    % Define matriz de rotulos de Regiao de Transicao
    TR = NLCV > ponto_corte;
end