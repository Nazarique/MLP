function [y]=dTangenthip(I) % derivada da tangente hiperbolica
    b = 1;
    y = sech(b.*I).^2;
end