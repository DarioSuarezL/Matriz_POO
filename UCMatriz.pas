unit UCMatriz;

interface
  Uses SysUtils;
  Const MaxF=1024; MaxC=1024;

    Type
    Matriz = class
      Private
      NumF,NumC:word;
      Elements: Array [1..MaxF,1..MaxC] of Real;

      Public
      Procedure Redimensionar(nF,nC:word);
      Function CantFil():word;
      Function CantCol():word;
      Function GetElement(f,c:word):real;
      Procedure ModElement(f,c:word; e:real);
      Procedure AddFil();
      Procedure AddCol();
      Procedure DelFil(f:word);
      Procedure DelCol(c:word);
      Function Simetrica():boolean;
      procedure Intercambiar(f1,c1,f2,c2:word);
      Function Sarrus():real;
      Procedure Examen;
{***************Series***************}
      Procedure SerieA();
      Procedure SerieB();
      Procedure SerieFibonacci();

    end;

implementation

{ Matriz }

procedure Matriz.AddCol;
begin
  Inc(NumC);
end;

procedure Matriz.AddFil();
begin
  Inc(NumF);
end;

function Matriz.CantCol: word;
begin
  Result:=NumC;
end;

function Matriz.CantFil: word;
begin
  Result:=NumF;
end;


function Matriz.GetElement(f, c: word): real;
begin
  if ((f>0)and(f<=NumF))and((c>0)and(c<=NumC)) then begin
    Result:=Elements[f,c];
  end else raise Exception.Create('Fuera de Rango');
end;

procedure Matriz.DelCol(c: word);
var i,j:word;
begin
  if (c>0)and(c<=NumC) then begin
    for j := c to NumC-1 do
      for i := 1 to NumF do
      Elements[i,j]:=elements[i,j+1];
    dec(NumC);
  end else raise Exception.Create('Fuera de Rango');
end;

procedure Matriz.DelFil(f:word);
var i,j:word;
begin
  if (f>0)and(f<=NumF) then begin
    for i := f to NumF-1 do
      for j := 1 to NumC do
        Elements[i,j]:=elements[i+1,j];
    dec(NumF);
  end else raise Exception.Create('Fuera de Rango');
end;



procedure Matriz.Examen;
var col,fil,fsalto,fs: integer;
paco:boolean;
begin
 for col := 1 to NumC do begin
   for fil := 1 to NumF do begin
     fsalto:=NumF div 2;
     repeat
     paco :=false;
      for fs := 1 to NumF+fsalto do begin
        if Elements[fs,col]<elements[fs+fsalto,col] then begin
          intercambiar(fs,col,fs+fsalto,col);
          paco:=true;
        end;
        if paco=true then begin
          fsalto:=fsalto div 2;
        end;
      end;
     until fsalto<=0 ;
   end;
 end;

end;

procedure Matriz.Intercambiar(f1,c1,f2,c2:word);
var
Aux:real;
begin
 if (f1>0) and  (c1>0) and (f2>0) and (c2>0) then
  Begin
   Aux:= elements[f1,c1];
   elements[f1,c1]:=elements[f2,c2];
   elements[f2,c2]:=Aux;
  End
   Else raise Exception.Create('Error, inserte una posicion mayor a cero');

end;

function Matriz.Sarrus: real;
begin
  if (NumF=NumC) then begin
    if (NumF>0)and(NumF<=3) then begin
      case NumF of
        1: result:=elements[1,1];
        2: Begin
          Result:=elements[1,1]*elements[2,2]-elements[1,2]*elements[2,1]
        End;
        3: begin
          Result:=elements[1,1]*elements[2,2]*elements[3,3]+elements[2,1]*elements[3,2]*elements[1,3]+elements[3,1]*elements[1,2]*elements[2,3]-(elements[1,3]*elements[2,2]*elements[3,1]+elements[2,3]*elements[3,2]*elements[1,1]+elements[3,3]*elements[1,2]*elements[2,1]);
        end;
      end;
    end else raise Exception.Create('Su matriz es superior a 3x3, intente con otro método');
  end else raise Exception.Create('Su matriz no es cuadrada, por lo tanto no tiene determinante');


end;

procedure Matriz.ModElement(f,c:word; e: real);
begin
  if ((f>0)and(f<=NumF))and((c>0)and(c<=NumC)) then begin
    Elements[f,c]:=e;
  end else raise Exception.Create('Fuera de Rango');
end;

procedure Matriz.Redimensionar(nF, nC: word);
begin
  NumF:=nF;  NumC:=nC;
end;

procedure Matriz.SerieA;
var i,j,ini:word;
begin
ini:=1;
  for j := 1 to NumC do begin
    for i := 1 to NumF do begin
      elements[i,j]:=ini;
      ini:=1+ini;
    end;
  end;
end;

procedure Matriz.SerieB;
var i,j,ini,jump:word;
begin
ini:=2; jump:=2;
  for i := NumF downto 1 do begin
    for j := NumC downto 1 do begin
      elements[i,j]:=ini;
      ini:=ini+jump;
      inc(jump);
    end;
  end;
end;

procedure Matriz.SerieFibonacci;
var i,j:word;  flag:boolean;
a,b,c:word;
begin
a:=0; b:=1; c:=0;
flag:=true;
    for i := NumC downto 1 do begin
    if flag=true then begin
      for j :=NumF downto 1 do begin
        elements[j,i]:=c;
        a:=b+c;
        b:=c;
        c:=a;
      end;
     flag:=false;
    end else begin
      for j := 1 to NumF do begin
        elements[j,i]:=c;
        a:=b+c;
        b:=c;
        c:=a;
      end;
      flag:=true;
    end;
  end;
end;


function Matriz.Simetrica: boolean;
var i,j:word; paco:boolean;
begin
paco:=true;
 if (numF>0)and(numC>0)and(numF=numC) then begin
  for i := 1 to numF-1 do begin
    for j := i+1 to numC do begin
      if elements[i,j]<>elements[j,i] then paco:=false;
    end;
  end;
    result:=paco;
 end else raise Exception.Create('La matriz no es simétrica');

end;

end.
