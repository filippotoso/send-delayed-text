object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Send Delayed Text'
  ClientHeight = 276
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnSend: TButton
    Left = 8
    Top = 195
    Width = 249
    Height = 73
    Caption = 'Send Delayed Text'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnSendClick
  end
  object Memo: TMemo
    Left = 8
    Top = 8
    Width = 249
    Height = 138
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Fill me!')
    ParentFont = False
    TabOrder = 1
  end
  object udDelay: TUpDown
    Left = 236
    Top = 168
    Width = 24
    Height = 21
    Associate = edDelay
    Min = 1
    Position = 2
    TabOrder = 2
    OnClick = udDelayClick
  end
  object edDelay: TLabeledEdit
    Left = 8
    Top = 168
    Width = 222
    Height = 21
    EditLabel.Width = 88
    EditLabel.Height = 13
    EditLabel.Caption = 'Delay (in seconds)'
    TabOrder = 3
    Text = '2'
  end
  object Timer: TTimer
    Enabled = False
    Interval = 2500
    OnTimer = TimerTimer
    Left = 8
    Top = 56
  end
end
