function [xTreino, xTeste, xVal, dTreino, dTeste, dVal] = amostraRand(x, d)
    s = size(x,1);
    qtA = round(0.7*s); %qt de Amostras treinamento
    qtT = round(0.15*s); %qt de amostras Testes
    qtV = round(0.15*s); %qt de amostras Validação
    o = randperm(s); % muda a ordem das entradas de forma aleatoria
    x = x(o,:); %atribui os valores  com ordem diferente a variaveis iniciais
    d = d(o,:);
    xTreino = x(1:qtA,:);
    xTeste = x(qtA+1:qtT+qtA,:);
    xVal = x(s-qtV+1:end,:);
    dTreino = d(1:qtA,:);
    dTeste = d(qtA+1:qtT+qtA,:);
    dVal = d(s-qtV+1:end,:);
end