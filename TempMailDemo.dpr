program TempMailDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  TempMailDemo.UnitMain in 'TempMailDemo.UnitMain.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
