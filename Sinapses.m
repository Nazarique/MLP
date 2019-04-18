classdef Sinapses
   properties
      Pesos
      Funcao 
      Posicao
   end
   methods 
       function aux = Sinapses(w, f, n)
           aux.Pesos = w;
           aux.Funcao = f;
           aux.Posicao = n;
       end
   end
end