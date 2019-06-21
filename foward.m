function [c] = foward(x, c, i)
switch i
    case 't'
    for j=1:size(c,2)% Calcula a saida e derivada de cada camada e as armazena dentro do obj.camada
                if (j == 1)% para a primiera camada temos como as entradas os valores de X ou os dados que vão ser inseridos
                     c(j).Ysaida = Saida(x, c(j)); % funcao se encontra em "Camada.m"
                     c(j).derivadaY = Derivada(x, c(j));% funcao se encontra em "Camada.m"
                else
                     c(j).Ysaida = Saida(c(j-1).Ysaida, c(j));% para as camadas seguintes suas entradas vão ser a saida das camadas anteriores 
                     c(j).derivadaY = Derivada(c(j-1).Ysaida, c(j));
                end
    end
    case 'v'
        for j=1:size(c,2)% Calcula a saida e derivada de cada camada e as armazena dentro do obj.camada

                if (j == 1)% para a primiera camada temos como as entradas os valores de X ou os dados que vão ser inseridos
                     c(j).Ysaida = Saida(x, c(j)); % funcao se encontra em "Camada.m"
                else
                     c(j).Ysaida = Saida(c(j-1).Ysaida, c(j));% para as camadas seguintes suas entradas vão ser a saida das camadas anteriores 
                end
        end
end