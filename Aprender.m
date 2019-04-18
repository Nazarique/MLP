function [w] = Aprender(w , w0, t, delta, x)
% x - Entrada de dados no neuronio
% w - pesos sinapticos do neuronio
% delta - diferença da saida do neuronio com sataxa de aprendizagemSomatorio das entradas vezes a entrada
    a = 0.5; %taxa de mometum
     w = w+a*(w-w0)+t*(delta'*x);
end
