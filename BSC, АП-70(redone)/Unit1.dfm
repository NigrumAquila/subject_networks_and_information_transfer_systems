object Form1: TForm1
  Left = 1260
  Top = 633
  Width = 665
  Height = 393
  Caption = 'Form1'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 185
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Enter message length'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 8
    Top = 73
    Width = 185
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Enter baud rate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Button1: TButton
    Left = 8
    Top = 144
    Width = 185
    Height = 41
    Caption = 'Calculate BSC'
    TabOrder = 0
    OnClick = Button1Click
  end
  object PageControl1: TPageControl
    Left = 200
    Top = 8
    Width = 441
    Height = 337
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Memo'
      object Memo1: TMemo
        Left = 0
        Top = 8
        Width = 433
        Height = 297
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Chart'
      ImageIndex = 1
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 433
        Height = 306
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          '')
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMaximum = False
        BottomAxis.AutomaticMinimum = False
        BottomAxis.Maximum = 2000.000000000000000000
        BottomAxis.Title.Caption = 'Message length'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 100.000000000000000000
        LeftAxis.Title.Caption = 'Time '
        TabOrder = 0
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
  end
  object Edit1: TEdit
    Left = 8
    Top = 48
    Width = 185
    Height = 21
    TabOrder = 2
    Text = '1000'
  end
  object Edit2: TEdit
    Left = 8
    Top = 112
    Width = 185
    Height = 21
    TabOrder = 3
    Text = '1000'
  end
  object Button2: TButton
    Left = 8
    Top = 192
    Width = 185
    Height = 41
    Caption = 'Calculate '#1040#1055'-70'
    TabOrder = 4
    OnClick = Button2Click
  end
end
