unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  uMySFTPClient;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    editServer: TEdit;
    Label1: TLabel;
    editPort: TEdit;
    Label2: TLabel;
    editUser: TEdit;
    Label3: TLabel;
    editPass: TEdit;
    Label4: TLabel;
    memoLog: TMemo;
    editRemoteDir: TEdit;
    Label5: TLabel;
    lbContents: TListBox;
    Panel2: TPanel;
    btnConnect: TButton;
    btnDisconnect: TButton;
    Bevel1: TBevel;
    btnGet: TButton;
    btnPut: TButton;
    SD: TFileSaveDialog;
    OD: TFileOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure btnPutClick(Sender: TObject);
    procedure memoLogChange(Sender: TObject);
  private
    function GetRemoteDir: String;
    function ConnCheck: Boolean;
    procedure ConnBrowse;
  public
    fSFTP: TSFTPClient;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if fSFTP.Connected then
      fSFTP.Disconnect;

    fSFTP.UserName := editUser.Text;
    fSFTP.Password := editPass.Text;
    fSFTP.Host := editServer.Text;
    fSFTP.Port := StrToIntDef(editPort.Text, 22);
    fSFTP.IPVersion := IPv4;
    fSFTP.AuthModes := [amTryAll];

    try
      fSFTP.Connect(Self.GetRemoteDir);
      memoLog.Lines.Add('connected');
    except
      on E:Exception do
      begin
        memoLog.Lines.Add('Error @ connect: ' + E.Message);
        exit;
      end;
    end;

    Self.ConnBrowse;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.btnDisconnectClick(Sender: TObject);
begin
  if fSFTP.Connected then
  begin
    fSFTP.Disconnect;
    memoLog.Lines.Add('disconnected');
    memoLog.Lines.Add('=======================');
  end;
  lbContents.Clear;
end;

procedure TfrmMain.btnGetClick(Sender: TObject);
var
  fs: TFileStream;
begin
  if not Self.ConnCheck then
    exit;

  if lbContents.ItemIndex = -1 then
  begin
    memoLog.Lines.Add('no file selection');
    exit;
  end;

  SD.FileName := lbContents.Items[lbContents.ItemIndex];
  if SD.Execute then
  begin
    Screen.Cursor := crHourGlass;
    fs := TFileStream.Create(SD.Files[0], fmCreate);
    try
      memoLog.Lines.Add('downloading...');
      fSFTP.Get(lbContents.Items[lbContents.ItemIndex], fs, false);
      memoLog.Lines.Add('ok');
    finally
      fs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMain.btnPutClick(Sender: TObject);
var
  fs: TFileStream;
begin
  if not Self.ConnCheck then
    exit;


  if OD.Execute then
  begin
    Screen.Cursor := crHourGlass;
    fs := TFileStream.Create(OD.Files[0], fmOpenRead);
    try
      memoLog.Lines.Add('uploading...');
      fSFTP.Put(fs, ExtractFileName(OD.Files[0]), true);
      Self.ConnBrowse;
      memoLog.Lines.Add('ok');
    finally
      fs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmMain.ConnBrowse;
var
  i: Integer;
begin
  if not Self.ConnCheck then
    exit;

  fSFTP.List();

  lbContents.Clear;
  for i := 0 to fSFTP.DirectoryItems.Count - 1 do
    lbContents.AddItem(fSFTP.DirectoryItems.Items[i].FileName, nil);
end;

function TfrmMain.ConnCheck: Boolean;
begin
  if not fSFTP.Connected then
  begin
    memoLog.Lines.Add('not connected');
    exit(false);
  end;

  result := true;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  fSFTP := TSFTPClient.Create(nil);
  //fSFTP.OnTransferProgress
  //fSFTP.OnAuthFailed
  //fSFTP.OnCantChangeStartDir
end;

function TfrmMain.GetRemoteDir: String;
begin
  if not String(editRemoteDir.Text).IsEmpty then
    result := editRemoteDir.Text else
    result := '.';
end;

procedure TfrmMain.memoLogChange(Sender: TObject);
begin
  SendMessage(memoLog.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
end;

end.

