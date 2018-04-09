% Entrada de dados para an�lise de temperatura pelo
% m�todo dos elementos de contorno (linear)

% Matriz para defini��o de pontos da geometria 

PONTOS  = [1   0   0 
          2   5   0 
          3   5   5 
			 4   0   5  
          5   2   1 
          6   1   1
 			 7   1   2
          8   2   2
			 9   4   1
			 10  3   1
			 11  3   2
			 12  4   2
			 13  2   3
			 14  1   3
			 15  1   4
          16  2   4
          17  4   3
          18  3   3
			 19  3   4
			 20  4   4];
          
% Segmentos que definem a geometria
%  SEGMENTOS=[No do segmento, No do ponto inicial, No do ponto final,
%                                                  Raio] 
% Raio do segmento: > 0 -> O centro � � esquerda do segmento (do ponto
%                          inicial para o ponto final) 
%                   < 0 -> O centro � � direita do segmento (do ponto
%                          inicial para o ponto final)
%                   = 0 -> O segmento � uma linha reta

SEGMENTOS = [ 1 1 2 0
	 	    2 2 3 0
          3 3 4 0
		    4 4 1 0
  			 5 5 6 0
          6 6 7 0
			 7 7 8 0
          8 8 5 0
          9 9 10 0
          10 10 11 0
          11 11 12 0
          12 12 9 0
          13 13 14 0
          14 14 15 0
          15 15 16 0
          16 16 13 0
          17 17 18 0
          18 18 19 0
          19 19 20 0
          20 20 17 0];

% Matriz para defini��o da malha

% MALHA =[numero do segmento, numero de elementos no segmento]

MALHA = [1  9
	       2  9 
          3  9
	      4  9
          5  4
          6  4
          7  4
          8  4 
          9  4 
          10 4 
          11 4 
          12 4 
          13 4 
          14 4 
          15 4 
          16 4 
          17 4 
          18 4 
          19 4 
          20 4 ];

   % Condi��es de contorno nos segmentos
  % CCSeg=[no do segmento, tipo da CDC, valor da CDC]
  % tipo da CDC = 0 => a temperatura � conhecida
  % tipo da CDC = 1 => O fluxo � conhecido
 CCSeg=[1 1 0
    2 0 0
    3 1 4
    4 0 10
    5 1 0
    6 1 0
    7 1 0
    8 1 0
    9 1 0
    10 1 0
    11 1 0
    12 1 0
    13 1 0
    14 1 0
    15 1 0
    16 1 0
    17 1 0
    18 1 0
    19 1 0
    20 1 0];
          

% Condutividade T�rmica do material

k = 1;			% [W/m.K]

% fc = fonte de calor concentrada
% fc = [valor da fonte, coordenada x da fonte, coordenada y da fonte];
fc=[-1 .5 .5]; 

% Defini��o dos pontos internos
NPX=14;
NPY=14;