% Derivada da função logística [gl]=dLogistica(b,u)
% Através da derivada da função logística, gl é a derivada, b o coeficiente
% e u é a entrada da função.
function [y]=dLogistica(u)
    b = 1;
    y = (b.*exp((-b.*u)))./((1+exp((-b.*u))).^2);
end
