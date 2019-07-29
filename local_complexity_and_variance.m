function [Lc,Lv] = local_complexity_and_variance(IG,w)
    m = 2*w+1;
    IG = padarray(IG,[w w],'replicate','both');
    [row,col] = size(IG);
    Lc = zeros(row,col);
    Lv = zeros(row,col);
    for i = 1+w : row-w
        for j = 1+w : col-w
            % calcula a complexidade local de acordo com a formula 1 e 2
            Lc(i,j) = length( unique(IG(i-w:i+w, j-w:j+w)) );
            
            % calcula a variancia local de acordo com a formula 3
            f = IG(i-w:i+w, j-w:j+w);
            f_media = mean(mean(f));
            soma = sum(sum( (f-f_media).^2 ));
            Lv(i,j) = soma/(m^2-1);
        end
    end
    Lc = Lc(1+w:row-w, 1+w:col-w);
    Lv = Lv(1+w:row-w, 1+w:col-w);
end