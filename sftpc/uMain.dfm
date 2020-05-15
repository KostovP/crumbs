object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'NFR SFTP Client'
  ClientHeight = 490
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 3
      Top = 3
      Width = 95
      Height = 21
      Caption = 'server address'
    end
    object Label2: TLabel
      Left = 247
      Top = 0
      Width = 29
      Height = 21
      Caption = 'port'
    end
    object Label3: TLabel
      Left = 3
      Top = 62
      Width = 28
      Height = 21
      Caption = 'user'
    end
    object Label4: TLabel
      Left = 155
      Top = 62
      Width = 29
      Height = 21
      Caption = 'pass'
    end
    object Label5: TLabel
      Left = 3
      Top = 121
      Width = 69
      Height = 21
      Caption = 'remote dir'
    end
    object editServer: TEdit
      Left = 3
      Top = 27
      Width = 238
      Height = 29
      TabOrder = 0
    end
    object editPort: TEdit
      Left = 247
      Top = 27
      Width = 54
      Height = 29
      TabOrder = 1
      Text = '22'
    end
    object editUser: TEdit
      Left = 3
      Top = 86
      Width = 146
      Height = 29
      TabOrder = 2
    end
    object editPass: TEdit
      Left = 155
      Top = 86
      Width = 146
      Height = 29
      TabOrder = 3
    end
    object memoLog: TMemo
      AlignWithMargins = True
      Left = 313
      Top = 3
      Width = 329
      Height = 171
      TabStop = False
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'System'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 5
      OnChange = memoLogChange
      ExplicitLeft = 316
      ExplicitTop = 0
      ExplicitHeight = 221
    end
    object editRemoteDir: TEdit
      Left = 3
      Top = 145
      Width = 298
      Height = 29
      TabOrder = 4
    end
  end
  object lbContents: TListBox
    AlignWithMargins = True
    Left = 3
    Top = 227
    Width = 639
    Height = 260
    Align = alClient
    ItemHeight = 21
    TabOrder = 2
    ExplicitLeft = 100
    ExplicitTop = 385
    ExplicitWidth = 121
    ExplicitHeight = 97
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 180
    Width = 639
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 200
    ExplicitTop = 328
    ExplicitWidth = 185
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 219
      Top = 3
      Width = 3
      Height = 35
      Align = alLeft
    end
    object btnConnect: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 102
      Height = 35
      Align = alLeft
      Caption = 'connect'
      TabOrder = 0
      OnClick = btnConnectClick
      ExplicitTop = 13
      ExplicitHeight = 28
    end
    object btnDisconnect: TButton
      AlignWithMargins = True
      Left = 111
      Top = 3
      Width = 102
      Height = 35
      Align = alLeft
      Caption = 'disconnect'
      TabOrder = 1
      OnClick = btnDisconnectClick
      ExplicitTop = 13
      ExplicitHeight = 28
    end
    object btnGet: TButton
      AlignWithMargins = True
      Left = 228
      Top = 3
      Width = 102
      Height = 35
      Align = alLeft
      Caption = 'GET'
      TabOrder = 2
      OnClick = btnGetClick
      ExplicitLeft = 459
      ExplicitTop = 19
    end
    object btnPut: TButton
      AlignWithMargins = True
      Left = 336
      Top = 3
      Width = 102
      Height = 35
      Align = alLeft
      Caption = 'PUT'
      TabOrder = 3
      OnClick = btnPutClick
      ExplicitLeft = 495
      ExplicitTop = -9
    end
  end
  object SD: TFileSaveDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 468
    Top = 172
  end
  object OD: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Left = 532
    Top = 172
  end
end
