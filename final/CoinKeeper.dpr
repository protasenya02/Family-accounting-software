program CoinKeeper;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {frmMain},
  UnitCalculator in 'UnitCalculator.pas' {frmCalculator},
  UnitAddMoney in 'UnitAddMoney.pas' {frmAddMoney},
  UnitData in 'UnitData.pas',
  UnitAddUserInfo in 'UnitAddUserInfo.pas' {frmAddUserInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCalculator, frmCalculator);
  Application.CreateForm(TfrmAddMoney, frmAddMoney);
  Application.CreateForm(TfrmAddUserInfo, frmAddUserInfo);
  Application.Run;
end.
