unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, ComCtrls, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Chart1: TChart;
    Series1: TLineSeries;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure getAverageTime(Nd, Np, r, Nz , Nc:Integer);
    procedure getResult(algName : String);
  private

  public
    counter, M, V : Integer;
    Bopt, t2, T : Double;
    algName : String;
  end;

var
  Form1: TForm1;
  separator : String = {$IFDEF MSWINDOWS} '\'; {$ELSE} '/'; {$ENDIF}
  p : Double = 0.00001;

implementation

{$R *.dfm}

procedure TForm1.getAverageTime(Nd, Np, r, Nz , Nc:Integer);
begin

  M := StrToInt(Edit1.Text);
  V := StrToInt(Edit2.Text);
  Bopt := Nc/2+Sqrt(Power(Nc, 2)/4 - (Nc/(r*Ln(1-p))));
  t2 := (r*(Bopt + Nd + Np)) / V*Power(1-p, r*(Bopt + Nz));
  T := Round(M/Bopt) * t2;
end;

procedure TForm1.getResult(algName : String);
var f:System.Text;
begin
  Memo1.Lines.Add(IntToStr(counter) + ' iteration. Message length: ' + IntToStr(M) + '. Transmission speed: ' + IntToStr(V) +#13+#10
  + 'Protocol ' + algName + '. ' + 'Optimal block: ' + FloatToStr(SimpleRoundTo(Bopt, -3)) + '. Transmission time: ' + FloatToStr(SimpleRoundTo(t2, -3)) + '.' +#13+#10
  + 'Average message transmission time: ' + FloatToStr(SimpleRoundTo(T, -3)) + '.' +#13+#10+#13+#10);
  Series1.AddXY(M, T);
  Inc(counter);
  if not DirectoryExists('save') then
    CreateDir('save');
  Chart1.SaveToBitmapFile(GetCurrentDir + separator + 'save' + separator + 'BSC.bmp');
  Chart1.SaveToMetafile(GetCurrentDir + separator + 'save' + separator + 'BSC.wmf');
  try
    AssignFile(f, GetCurrentDir + separator + 'save' + separator + 'BSC.rtf');
    Rewrite(f);
    WriteLn(f, Memo1.Text);
    CloseFile(f);
  except
    MessageDlg('Failed to save', mtError, [mbOk], 0);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var Nd, Np, r, Nz, Nc: Integer;
begin
  Nd := 8;
  Np := 6;
  r := 8;
  Nz := 3;
  Nc := 14;
  algName := 'BSC';
  getAverageTime(Nd, Np, r, Nz, Nc);
  getResult(algName);
end;

procedure TForm1.Button2Click(Sender: TObject);
var Nd, Np, r, Nz, Nc: Integer;
begin
  Nd := 3;
  Np := 1;
  r := 11;
  Nz := 3;
  Nc := 4;
  algName := '¿œ-70';
  getAverageTime(Nd, Np, r, Nz, Nc);
  getResult(algName);
end;

end.

