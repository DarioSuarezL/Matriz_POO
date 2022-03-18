object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Formulario'
  ClientHeight = 500
  ClientWidth = 773
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 520
    Top = 26
    Width = 50
    Height = 16
    Caption = 'Salidas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 66
    Width = 66
    Height = 16
    Caption = 'Columnas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 26
    Width = 32
    Height = 16
    Caption = 'Filas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 114
    Width = 64
    Height = 16
    Caption = 'Elemento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 140
    Width = 757
    Height = 352
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 576
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 86
    Top = 25
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 86
    Top = 65
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 157
    Top = 39
    Width = 113
    Height = 25
    Caption = 'Redimensionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 86
    Top = 113
    Width = 65
    Height = 21
    TabOrder = 5
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Mtodos1: TMenuItem
      Caption = 'M'#233'todos'
      object Cargarmatrices1: TMenuItem
        Caption = 'Cargar matriz'
        OnClick = Cargarmatrices1Click
      end
      object Cantidaddefilas1: TMenuItem
        Caption = 'Cantidad de filas'
        OnClick = Cantidaddefilas1Click
      end
      object Cantidaddecolumna1: TMenuItem
        Caption = 'Cantidad de columna'
        OnClick = Cantidaddecolumna1Click
      end
      object Obtenerelemento1: TMenuItem
        Caption = 'Obtener elemento'
        OnClick = Obtenerelemento1Click
      end
      object Modificarelemento1: TMenuItem
        Caption = 'Modificar elemento'
        OnClick = Modificarelemento1Click
      end
      object Aadirfila1: TMenuItem
        Caption = 'A'#241'adir fila'
        OnClick = Aadirfila1Click
      end
      object Aadircolumna1: TMenuItem
        Caption = 'A'#241'adir columna'
        OnClick = Aadircolumna1Click
      end
      object Eliminarfila1: TMenuItem
        Caption = 'Eliminar fila (nro. fil)'
        OnClick = Eliminarfila1Click
      end
      object Eliminarcolumna1: TMenuItem
        Caption = 'Eliminar columna (nro. col)'
        OnClick = Eliminarcolumna1Click
      end
      object Sarrus1: TMenuItem
        Caption = 'Sarrus'
        OnClick = Sarrus1Click
      end
    end
    object Series1: TMenuItem
      Caption = 'Series'
      object A1: TMenuItem
        Caption = 'A'
        OnClick = A1Click
      end
      object B1: TMenuItem
        Caption = 'B'
        OnClick = B1Click
      end
    end
    object Examen1: TMenuItem
      Caption = 'Examen'
      object Fibonacci1: TMenuItem
        Caption = 'Fibonacci'
        OnClick = Fibonacci1Click
      end
      object Examenfinal1: TMenuItem
        Caption = 'Examen final'
        OnClick = Examenfinal1Click
      end
    end
  end
end
