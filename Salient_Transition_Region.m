function STR = Salient_Transition_Region(TR)
    %(1) Retifica as Regioes de Transicoes localicadas nos cantos da imagem
    TR( [1:10 end-10:end],:) = 0;
    TR(:, [1:10 end-10:end]) = 0;
    
    %(2) usa numeros diferentes para rotular as regioes conectadas
    bw_TR = bwlabel(TR);
    
    %(3) calcula o numero de pixel de cada regiao conectada
    n = max(max(bw_TR));
    maximo = 0;
    for i = 1 : n
        soma = sum(sum(bw_TR == i));
        if (soma > maximo)
            maximo = soma;
            ind_max = i;
        end
    end
    
    %(4) Define Regiao de Transicao com maior numero de pixels conectados 
    % como Regiao de Transicao Saliente
    STR = bw_TR == ind_max;
end