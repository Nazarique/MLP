function [ y ] = Funcoes(f, u ,i)

    if(i=='f')
        switch f
            case 't'
                y = Tangentehip(u);
            case 'l'
                y = Logistica(u);
        end
    end
    if(i=='d')
        switch f
            case 't'
                y = dTangentehip(u);
            case 'l'
                y = dLogistica(u);
        end
    end
end

