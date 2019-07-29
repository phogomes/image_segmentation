function BT = Refining_image_thresholding(I,STR,T_max)
    %(1) Obtenha o resultado de limiar de imagem 
    Bt = I > T_max;
    
    %(2) operacao de reversao
    [row,col] = size(I);
    no = sum(sum(Bt));
    n = row*col;
    nb = n-no;
    if no > nb
        Bt = ~Bt;
    end
    
    %(3) Rotule cada regiao de objeto conectada com um numero exclusivo em 
    Bt_label = bwlabel(Bt);
    
    %(4) Calcule o numero de pixels interceptados entre cada regiao de objeto 
    % conectada e a regiao de transicao saliente
    n = max(max(Bt_label));
    for i = 1 : n
        Bt_i = Bt_label == i;
        if sum(sum(STR .* Bt_i)) == 0
            Bt_label(Bt_label == i) = 0;
        end
    end
    %(5) Pegue o refinado BT como resultado final de segmentacao do metodo proposto.
    BT = uint8(Bt_label*255);
end