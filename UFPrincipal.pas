unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.Grids, UCMatriz;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    StringGrid1: TStringGrid;
    Mtodos1: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Edit4: TEdit;
    Cantidaddefilas1: TMenuItem;
    Cantidaddecolumna1: TMenuItem;
    Obtenerelemento1: TMenuItem;
    Modificarelemento1: TMenuItem;
    Aadirfila1: TMenuItem;
    Aadircolumna1: TMenuItem;
    Eliminarfila1: TMenuItem;
    Eliminarcolumna1: TMenuItem;
    Cargarmatrices1: TMenuItem;
    Series1: TMenuItem;
    A1: TMenuItem;
    B1: TMenuItem;
    Sarrus1: TMenuItem;
    Examen1: TMenuItem;
    Fibonacci1: TMenuItem;
    Examenfinal1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cargarmatrices1Click(Sender: TObject);
    procedure Cantidaddefilas1Click(Sender: TObject);
    procedure Cantidaddecolumna1Click(Sender: TObject);
    procedure Obtenerelemento1Click(Sender: TObject);
    procedure Modificarelemento1Click(Sender: TObject);
    procedure Aadirfila1Click(Sender: TObject);
    procedure Aadircolumna1Click(Sender: TObject);
    procedure Eliminarfila1Click(Sender: TObject);
    procedure Eliminarcolumna1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure Sarrus1Click(Sender: TObject);
    procedure Fibonacci1Click(Sender: TObject);
    procedure Examenfinal1Click(Sender: TObject);
  private
    { Private declarations }
    mat:Matriz;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.A1Click(Sender: TObject);
var i,j:word;
begin
mat.SerieA;
  for i := 1 to mat.Cantfil do
    for j := 1 to mat.Cantcol do
      stringgrid1.Cells[j-1, i-1]:=floattostr(mat.GetElement(i,j));
end;

procedure TForm1.Aadircolumna1Click(Sender: TObject);
begin
mat.AddCol;
stringgrid1.ColCount:=mat.CantCol;
end;

procedure TForm1.Aadirfila1Click(Sender: TObject);
begin
mat.AddFil;
stringgrid1.RowCount:=mat.CantFil;
end;

procedure TForm1.B1Click(Sender: TObject);
var i,j:word;
begin
mat.SerieB;
  for i := 1 to mat.Cantfil do
    for j := 1 to mat.Cantcol do
      stringgrid1.Cells[j-1, i-1]:=floattostr(mat.GetElement(i,j));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
mat.Redimensionar(strtoint(edit2.Text),strtoint(edit3.Text));
stringgrid1.ColCount:=mat.CantCol;  //columnas
stringgrid1.RowCount:=mat.CantFil;  //filas
end;

procedure TForm1.Cantidaddecolumna1Click(Sender: TObject);
begin
edit1.text:=inttostr(mat.CantCol);
end;

procedure TForm1.Cantidaddefilas1Click(Sender: TObject);
begin
edit1.Text:=inttostr(mat.CantFil);
end;

procedure TForm1.Cargarmatrices1Click(Sender: TObject);
var i,j:word;
begin
for i := 1 to mat.CantFil do begin
  for j := 1 to mat.CantCol do begin
    mat.ModElement(i,j,strtofloat(Stringgrid1.Cells[j-1,i-1]));
  end;
end;
end;



procedure TForm1.Eliminarcolumna1Click(Sender: TObject);
var i,j:word;
begin
mat.DelCol(strtoint(edit3.Text));
Stringgrid1.RowCount:=mat.CantFil;
Stringgrid1.ColCount:=mat.CantCol;
  for i := 1 to mat.CantFil do
    for j := 1 to mat.CantCol do
      stringgrid1.Cells[j-1, i-1]:=floattostr(mat.GetElement(i,j));
end;

procedure TForm1.Eliminarfila1Click(Sender: TObject);
var i,j:word;
begin
mat.DelFil(strtoint(edit2.Text));
Stringgrid1.RowCount:=mat.CantFil;
Stringgrid1.ColCount:=mat.CantCol;
  for i := 1 to mat.CantFil do
    for j := 1 to mat.CantCol do
      stringgrid1.Cells[j-1, i-1]:=floattostr(mat.GetElement(i,j));
end;

procedure TForm1.Examenfinal1Click(Sender: TObject);
var i,j:integer;
begin
mat.Examen;
  for i := 1 to mat.CantFil do
    for j := 1 to mat.CantCol do
      stringgrid1.Cells[j-1, i-1]:=floattostr(mat.GetElement(i,j));
end;

procedure TForm1.Fibonacci1Click(Sender: TObject);
var i,j:word;
begin
mat.SerieFibonacci;
  for i := 1 to mat.CantFil do
    for j := 1 to mat.CantCol do
      stringgrid1.Cells[j-1, i-1]:=floattostr(mat.GetElement(i,j));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
mat:=matriz.Create;
end;

procedure TForm1.Modificarelemento1Click(Sender: TObject);
var i,j:word;
begin
mat.ModElement(strtoint(edit2.Text),strtoint(edit3.Text),strtofloat(edit4.Text));
Stringgrid1.RowCount:=mat.CantFil;
Stringgrid1.ColCount:=mat.CantCol;
  for i := 1 to mat.CantFil do
    for j := 1 to mat.CantCol do
      stringgrid1.Cells[j-1, i-1]:=floattostr(mat.GetElement(i,j));
end;

procedure TForm1.Obtenerelemento1Click(Sender: TObject);
begin
edit1.Text:=floattostr(mat.GetElement(strtoint(edit2.Text),strtoint(edit3.Text)));
end;

procedure TForm1.Sarrus1Click(Sender: TObject);
var i,j:word;
begin
edit1.Text:=floattostr(mat.Sarrus);
end;

end.
