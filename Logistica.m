%  Na função logística, usa-se [g]=Logistica(b,u)
% g é o valor de saída, b é o valor do coeficiente da função e u é a
% variável com os valores a ser passado pela função.

function [y]=Logistica(u)
    b = 1;
    y = 1./(1.+exp(-b.*u)); % função logística
end