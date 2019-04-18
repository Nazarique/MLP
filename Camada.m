classdef Camada
   properties
      wSinapses
      wAnterior
      qNeuro
      Funcao 
      dFuncao
      Ysaida
      derivadaY
      
   end
   methods  
      function obj = Camada(v ,f, x)% construtor
          obj.qNeuro = v;
          obj.Funcao = f;
          obj.dFuncao = f;
          obj.wSinapses = Pesos([obj.qNeuro], x);
          obj.wAnterior = obj.wSinapses;
      end
      function y = Saida(x, obj)
          y = Funcoes([obj.Funcao], Somatorio(x, [obj.wSinapses]), 'f');
          y = [Bias(y), y];
      end
      function dy = Derivada(x, obj)
          dy = Funcoes([obj.dFuncao] , Somatorio(x, [obj.wSinapses]), 'd');
      end 	  
      function w = AlterarPesos(x, obj,delta, taxa)
          w = Aprender([obj.wSinapses], [obj.wAnterior],  taxa, delta, x);
    end
  end 
end
