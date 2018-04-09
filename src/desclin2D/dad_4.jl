% Entrada de dados para an�lise de temperatura pelo
% m�todo dos elementos de contorno (linear)
%
%   Autor: Frederico Louren�o
%   Data de cria��o junho de 1999 
%   Revis�o 0.0
%

% Matriz para defini��o de pontos 

PONTOS  = [1    0   0 
          2   10   0 
          3   10  10 
			 4    0  10
          5    7   4
          6    4   4
			 7    4   6
			 8    7.5   6];
          
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
			4 4 1 0
			5 5 6 0
         6 6 7 0
			7 7 8 0
			8 8 5 0];

% Matriz para defini��o da malha

% MALHA =[numero do segmento, numero de elementos no segmento]

MALHA = [1  8 
	       2  8 
          3  8
			 4  8
			 5  6
			 6  6
			 7  6
   		 8  6];

   % Condi��es de contorno nos segmentos
  % CCSeg=[no do segmento, tipo da CDC, valor da CDC]
  % tipo da CDC = 0 => a temperatura � conhecida
  % tipo da CDC = 1 => O fluxo � conhecido
 CCSeg=[1 1 0
    2 0 0
    3 1 0
    4 0 50
    5 1 -50
    6 1 -10
    7 1 -10
    8 1 -30];

% Condutividade T�rmica do material

k = 1;		% [W/m.K]

% fc = fonte de calor concentrada
% fc = [valor da fonte, coordenada x da fonte, coordenada y da fonte];
fc=[-1 .5 .5]; 

% Defini��o dos pontos internos
NPX=14;
NPY=14;