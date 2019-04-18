function [w] = Pesos(m,x)
%m - quantidade de neur�nios, x - quantidade de entradas por neur�nios
%w - Matriz pesos, onde as linhas s�o os os neur�nios, e as colunas s�o pesos de cada neur�nio
%w0 w1 w2 - Neur�nio 1
%w0 w1 w2 - Neur�nio 2
%w0 w1 w2 - Neur�nio m
    w = rand(m,x);
end
