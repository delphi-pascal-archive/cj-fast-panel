object Form2: TForm2
  Left = 782
  Top = 243
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
  ClientHeight = 290
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object data: TMemo
    Left = 8
    Top = 8
    Width = 329
    Height = 241
    Lines.Strings = (
      #1076'{C:\}'#1044#1080#1089#1082' C}1'
      #1076'{E:\}'#1050#1086#1084#1087#1072#1082#1090'}2'
      #1076'{F:\}'#1060#1083#1077#1096#1082#1072'}4'
      #1076'{G:\}'#1060#1083#1077#1096#1082#1072'}4'
      #1087'{C:\WINDOWS\}'#1055#1072#1087#1082#1072' Windows}3'
      #1092'{C:\WINDOWS\Explorer.exe}'#1055#1088#1086#1074#1086#1076#1085#1080#1082'}'
      #1092'{C:\WINDOWS\system32\taskmgr.exe}'#1044#1080#1089#1087#1077#1090#1095#1077#1088' '#1079#1072#1076#1072#1095'}')
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Button1: TButton
    Left = 8
    Top = 256
    Width = 105
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 256
    Width = 105
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 120
    Top = 256
    Width = 105
    Height = 25
    Caption = #1048#1085#1092#1072
    TabOrder = 3
    OnClick = Button3Click
  end
end
