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
  private

  public
    counter : Integer;
  end;

var
  Form1: TForm1;
  separator : String = {$IFDEF MSWINDOWS} '\'; {$ELSE} '/'; {$ENDIF}
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Nd, Np, r, Nz, Nc, V, M: Integer;
Bopt, p, t2, T : Double;
f:System.Text;

begin
  M := StrToInt(Edit1.Text);
  V := StrToInt(Edit2.Text);
  Nd := 8;
  Np := 6;
  r := 8;
  Nz := 3;
  Nc := 14;
  p := 0.00001;
  Bopt := Nc/2+Sqrt(Power(Nc, 2)/4 - (Nc/(r*Ln(1-p))));
  t2 := (r*(Bopt + Nd + Np)) / V*Power(1-p, r*(Bopt + Nz));
  T := Round(M/Bopt) * t2;
  //ShowMessage(FloatToStr(T));

  Memo1.Lines.Add(IntToStr(counter) + ' iteration. Message length is: ' + IntToStr(M) + '. Transmission speed: ' + IntToStr(V) +#13+#10
  + 'Protocol BSC. ' + 'Optimal block: ' + FloatToStr(SimpleRoundTo(Bopt, -3)) + '. Transmission time: ' + FloatToStr(SimpleRoundTo(t2, -3)) + '.' +#13+#10
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
    MessageDlg('Не удалось сохранить', mtError, [mbOk], 0);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var Nd, Np, r, Nz, Nc, V, M: Integer;
Bopt, p, t2, T : Double;
f:System.Text;

begin
  M := StrToInt(Edit1.Text);
  V := StrToInt(Edit2.Text);
  Nd := 3;
  Np := 1;
  r := 11;
  Nz := 3;
  Nc := 4;
  p := 0.00001;
  Bopt := Nc/2+Sqrt(Power(Nc, 2)/4 - (Nc/(r*Ln(1-p))));
  t2 := (r*(Bopt + Nd + Np)) / V*Power(1-p, r*(Bopt + Nz));
  T := Round(M/Bopt) * t2;

  Memo1.Lines.Add(IntToStr(counter) + ' iteration. Message length is: ' + IntToStr(M) + '. Transmission speed: ' + IntToStr(V) +#13+#10
  + 'Protocol АП-70. ' + 'Optimal block: ' + FloatToStr(SimpleRoundTo(Bopt, -3)) + '. Transmission time: ' + FloatToStr(SimpleRoundTo(t2, -3)) + '.' +#13+#10
  + 'Average message transmission time: ' + FloatToStr(SimpleRoundTo(T, -3)) + '.' +#13+#10+#13+#10);
  Series1.AddXY(M, T);
  Inc(counter);
  if not DirectoryExists('save') then
    CreateDir('save');
  Chart1.SaveToBitmapFile(GetCurrentDir + separator + 'save' + separator + 'АП-70.bmp');
  Chart1.SaveToMetafile(GetCurrentDir + separator + 'save' + separator + 'АП-70.wmf');
  try
    AssignFile(f, GetCurrentDir + separator + 'save' + separator + 'АП-70.rtf');
    Rewrite(f);
    WriteLn(f, Memo1.Text);
    CloseFile(f);
  except
    MessageDlg('Не удалось сохранить', mtError, [mbOk], 0);
  end;
end;

end.

