unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure calculate();
    procedure displayContent();
  private
    { Private declarations }
  public
    fileName : String;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GetCheckSum(FileName: string): DWORD;
var
  F: file of DWORD;
  P: Pointer;
  Fsize: DWORD;
  Buffer: array[0..500] of DWORD;
begin
  FileMode := 0;
  AssignFile(F, FileName);
  Reset(F);
  Seek(F, FileSize(F) div 2);
  Fsize := FileSize(F) - 1 - FilePos(F);
  if Fsize > 500 then
    Fsize := 500;
  BlockRead(F, Buffer, Fsize);
  Close(F);
  P := @Buffer;
  asm
     xor eax, eax
     xor ecx, ecx
     mov edi , p
     @again:
       add eax, [edi + 4*ecx]
       inc ecx
       cmp ecx, fsize
     jl @again
     mov @result, eax
  end;
end;

procedure TForm1.calculate();
begin
  if not (fileName = '') then
    if FileExists(fileName) then
      Edit1.Text := IntToStr(GetCheckSum(fileName))
    else ShowMessage('File does not exist')
  else ShowMessage('File does not exist');
end;

procedure TForm1.displayContent();
begin
  if not (fileName = '') then
    if FileExists(fileName) then
      Memo1.Lines.LoadFromFile(fileName)
    else ShowMessage('File does not exist')
  else ShowMessage('File does not exist');
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  calculate();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  fileName := OpenDialog1.FileName;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  displayContent();
end;

end.

