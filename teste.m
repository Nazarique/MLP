function [acertos] = teste(x, d, obj)        
   c = foward(x, obj, 'v');
   y = Sinal(c(end).Ysaida(:,2:end));
   y = Definicao(y);
   d = Definicao(d);
   acertos = find(~(d-y));
   acertos = sum(size(acertos, 1))/size(d,1);
end