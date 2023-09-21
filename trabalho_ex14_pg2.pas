Program trabalho_ex14_pg2;
uses crt;
type vet=array[1..3] of integer;
var 
	escolha: string;
procedure calculaTempo(var horas, minutos: vet);
begin
	if (horas[1] > horas[2]) then
		horas[3]:= 24-(horas[1]-horas[2])
	else
		horas[3]:= horas[2]-horas[1];
	if (minutos[1] > minutos[2]) then
	begin
		minutos[3]:= 60-(minutos[1]-minutos[2]);
		horas[3]:= horas[3]-1;
	end
	else
		minutos[3]:= minutos[2]-minutos[1];
	if (minutos[3] <= 60) then
	begin
		horas[3]:= horas[3] + minutos[3] div 60;
		minutos[3]:= minutos[3] - 60*(minutos[3] div 60);
	end;
	if (horas[1] = horas[2]) and (minutos[1] = minutos [2]) then
	begin
		horas[3]:= 24; minutos[3]:= 0;
	end;
end;
procedure processaTempo();
var 
	tempoHrs, tempoMins: vet;
begin
	repeat
		writeln('que horas (apenas horas completas) o jogo começou?');
		read(tempoHrs[1]);
	until (tempoHrs[1] >= 0) and (tempoHrs[1] <= 23);
	repeat
		writeln('em que minutos (apenas minutos completos) o jogo começou?');
		read(tempoMins[1]);
	until (tempoMins[1] >= 0) and (tempoMins[1] <= 59);
	repeat
		writeln('que horas (apenas horas completas) o jogo terminou?');
		read(tempoHrs[2]);
	until (tempoHrs[2] >= 0) and (tempoHrs[2] <= 24);
	repeat
		writeln('em que minutos (apenas minutos completos) o jogo terminou?');
		read(tempoMins[2]);
	until (tempoMins[2] >= 0) and (tempoMins[2] <= 59);
	calculaTempo(tempoHrs, tempoMins);
	writeln('o jogo durou ', tempoHrs[3], ':', tempoMins[3]);
end;
procedure escolheEscolha(charEscolhido: string);
begin
	if (escolha = '1') then
		processaTempo();
	writeln('tecle qualquer tecla para prosseguir');
end;
//principal
Begin
  repeat
	writeln('para calcular o tempo de duração de um jogo -- tecle 1');
  	writeln('para finalizar o programa -- tecle 0');
  	escolha:= readKey;
  	clrscr;
  	if (escolha <> '0') then
  	begin
	  	escolheEscolha(escolha);
	  	repeat until keyPressed;
	  	while (keyPressed) do readKey;
	  	clrscr;
  	end;
  until escolha = '0';
End.
