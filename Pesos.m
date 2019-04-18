function [w] = Pesos(m,x)
%m - quantidade de neurônios, x - quantidade de entradas por neurônios
%w - Matriz pesos, onde as linhas são os os neurônios, e as colunas são pesos de cada neurônio
%w0 w1 w2 - Neurônio 1
%w0 w1 w2 - Neurônio 2
%w0 w1 w2 - Neurônio m
    w = rand(m,x);
end
