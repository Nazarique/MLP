 function [mlp] = MLP(v ,f , x, d)
   
 
    p = 10.^-8; %precisao
    t = 0.01;%taxa
    epocaMax = 5000;
    maxTestes = 10;
    
    time1 = clock(); %INICIO DA REDE
    x = Normalizar(x); 
    x = [Bias(x), x];% insere o Bias na entrada
    [xTreino] = amostraRand(x, d); %mistura as amostras
    v = [v size(d,2)];% adicion a camada de saida na configuração da rede
    
for testeN=1:maxTestes
    clc;
    f
    v
    testeN
    for i=1:size(v,2)% Cria a todas camadas da rede
        if (i==1)
            c(1) = Camada(v(i), f, size(x,2));% Inicializa o contrutor de camadas
        else
            c(i) = Camada(v(i) , f, c(i-1).qNeuro+1);
        end
    end
    
         
        ExisteErro = 1; %variavel que impede loop infinito 
		epoca = 0;% qtdd de vezes que a rede treinou 
		Erro = 1;
		ErroAnterior = 0;
        ErroValMenor = 1;       
        
    while (ExisteErro > 0)
            [xTreino, xTeste, xVal, dTreino, dTeste, dVal] = amostraRand(x, d); %mistura as amostras
            epoca = epoca + 1; % atribuindo valor a epoca
            ExisteErro = 0; % impedido loop infinito 
            
        if(abs(Erro - ErroAnterior) > p)% compara se a diferença de erro é maior que a precisao
            ErroAnterior=Erro;
            ExisteErro = ExisteErro+1;

        %foward

        c = foward(xTreino, c, 't');

        %back propagation
        k = size(c,2);
        while (k >= 1) % back propagation faz alteralÃ§Ãµes nos pesos usando as suas derivadas, sÃ³ que realiza tal processo da camada final atÃ© a inicial 
            if (k == size(c, 2))% para o primeiro delta usamos os valores "d" que sÃ£o os valores corretos, fazemos correÃ§Ã£o dos pesos Sinapticos 
                delta = (dTreino - c(k).Ysaida(:,2:end)).*c(k).derivadaY;% formula usada ( d - y )*dy 
            else
                delta = delta*c(k+1).wSinapses(:,2:end).*c(k).derivadaY;
            end
            w = c(k).wSinapses;
            if (k == 1)
                 c(k).wSinapses = AlterarPesos(xTreino, c(k), delta, t); % a primiera camada tem como entrada os valores "x"   
            else
                 c(k).wSinapses = AlterarPesos(c(k-1).Ysaida, c(k), delta, t);% funcao se encontra em "Camada.m"
            end
            c(k).wAnterior = w;
            k = k-1;

        end
        Erro = ErroQuadMed(dTreino, c(end).Ysaida(:,2:end));
        
        if (epoca > epocaMax)
            ExisteErro = 0;
         end
        %validação 
            c = foward(xVal, c, 'v');
            ErroVal = ErroQuadMed(dVal, c(end).Ysaida(:,2:end));
        
         if(ErroVal < ErroValMenor)
            ErroValMenor = ErroVal;
            epocaIdeal = epoca;
            
            for i=1:size(c,2) 
                wIdeal(i) = Sinapses(c(i).wSinapses,c(i).Funcao, i);
            end
         end
        end
    end
    %teste
            AcertosVal(testeN) = teste(xVal, dVal, c);
            AcertosTeste(testeN) = teste(xTeste, dTeste, c);
            ErrosTreino(testeN) = Erro;
            ErrosVal(testeN) = ErroVal;
end
time2 = clock(); %TERMINO DA REDE
mlp.epocaMax = epoca;
mlp.epocaIdeal = epocaIdeal;
mlp.arranjo = v;
mlp.Camadas = wIdeal;
mlp.TaxaAcertosTeste = AcertosTeste;
mlp.TaxaAcertosVal = AcertosVal;
mlp.ErrosTreino = sum(ErrosTreino)/maxTestes;
mlp.ErrosVal = sum(ErrosVal)/maxTestes;
mlp.Time = time2-time1;
end

    

	