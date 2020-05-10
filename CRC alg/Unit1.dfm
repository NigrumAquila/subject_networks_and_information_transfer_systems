object Form1: TForm1
  Left = 1450
  Top = 208
  Width = 445
  Height = 449
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 320
    Top = 296
    Width = 105
    Height = 41
    Caption = 'Calculate CRC '
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 352
    Width = 105
    Height = 41
    Caption = 'Select file'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 313
    Height = 409
    TabOrder = 2
  end
  object Button3: TButton
    Left = 320
    Top = 240
    Width = 105
    Height = 41
    Caption = 'Display content to Memo'
    TabOrder = 3
    WordWrap = True
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 312
    Top = 0
    Width = 113
    Height = 21
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 392
    Top = 208
  end
end
