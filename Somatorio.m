function [u] = Somatorio(x,w) 
% x - Entrada de dados no neuronio
% w - pesos sinapticos do neuronio
% u - Somatorio das entradas vezes a entrada
    u = x*w';
end