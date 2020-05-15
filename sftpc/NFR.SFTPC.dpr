program NFR.SFTPC;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  libssh2 in 'libssh2\libssh2.pas',
  libssh2_publickey in 'libssh2\libssh2_publickey.pas',
  libssh2_sftp in 'libssh2\libssh2_sftp.pas',
  uMySFTPClient in 'libssh2\uMySFTPClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

