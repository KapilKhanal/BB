% Entrada de dados para an�lise de temperatura pelo
% m�todo dos elementos de contorno (linear)
%
%   Autor: Frederico Louren�o
%   Data de cria��o junho de 1999 
%   Revis�o 0.0
%

% Matriz para defini��o de pontos 

PONTOS  = [1   0   0 
          2   5   0 
          3   5   3 
			 4   20  3
          5   20  6
          6   5   6 
			 7   5  10
			 8   0  10];
          
% Segmentos que definem a geometria
%  SEGMENTOS=[No do segmento, No do ponto inicial, No do ponto final,
%                                                  Raio] 
% Raio do segmento: > 0 -> O centro � � esquerda do segmento (do ponto
%                          inicial para o ponto final) 
%                   < 0 -> O centro � � direita do segmento (do ponto
%                          inicial para o ponto final)
%                   = 0 -> O segmento � uma linha reta

SEGMENTOS = [1 1 2 0
	 	   2 2 3 0
         3 3 4 0
			4 4 5 0
			5 5 6 0
         6 6 7 0
			7 7 8 0
			8 8 1 0];

% Matriz para defini��o da malha

% MALHA =[numero do segmento, numero de elementos no segmento]

MALHA = [1  6 
	       2  6 
          3  10
			 4  2
			 5  10
			 6  6
			 7  6
   		 8  6];

% Condi��es de contorno nos segmentos
  % CCSeg=[no do segmento, tipo da CDC, valor da CDC]
  % tipo da CDC = 0 => a temperatura � conhecida
  % tipo da CDC = 1 => O fluxo � conhecido
  
 CCSeg=[1 1 0
    2 1 0
    3 1 10
    4 1 10
    5 1 10
    6 1 0
    7 1 0
    8 0 100];

% Condutividade T�rmica do material

k = 1;		% [W/m.K]
% fc = fonte de calor concentrada
% fc = [valor da fonte, coordenada x da fonte, coordenada y da fonte];
fc=[-1 .5 .5]; 

% Defini��o dos pontos internos
NPX=14;
NPY=18;