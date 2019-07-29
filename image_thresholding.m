function T_max = image_thresholding(I,TR,STR,beta)
    %(1) Calcule a media do nivel de cinza, Tm, de todos os pixels nas
    % regioes de transicao
    Tm = sum(sum( uint8(TR).*I )) / sum(sum(TR));
    %(2) Calcule o nivel de cinza inferior t1 e superior t2
    omega = std2(I);
    t1 = Tm - beta * omega;
    t2 = Tm + beta * omega;
    %(3) Define o intervalo R de t1 ate t2
    R = [floor(t1):floor(t2)];
    [row,col] = size(I);
    %(1) Para um determinado nível de cinza t em R 
    Nt_max = 0;
    for t = R
        Bt = I>t;
        no = sum(sum(Bt));
        n = row*col;
        nb = n-no;
        %(2) Execute uma operacao de reversao em B t usando o seguinte criterio
        if no > nb
            Bt = ~Bt;
        end
        %(3)Calcule o numero de pixels interseccionados entre o objeto em B 
        % t e a regiao de transicao saliente STR 
        Nt = sum(sum((Bt .* STR)));
        %(4) Defina o limiar de segmentacao como o maximo Nt
        if Nt_max < Nt
            T_max = t;
        end
    end
end