unit TempMailDemo.UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.Memo.Types, FMX.Memo, FMX.ScrollBox, FMX.Grid;

type
  TFormMain = class(TForm)
    LblMailID: TLabel;
    EdtMailID: TEdit;
    LblOneMailID: TLabel;
    EdtOneMailID: TEdit;
    LblSourceMailID: TLabel;
    EdtSourceMailID: TEdit;
    BtnGetAtchmntsMailID: TButton;
    BtnGetOneMailID: TButton;
    BtnGetSrcMailID: TButton;
    ToolBarTop: TToolBar;
    LblTop: TLabel;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    StyleBook1: TStyleBook;
    procedure BtnGetSrcMailIDClick(Sender: TObject);
    procedure BtnGetAtchmntsMailIDClick(Sender: TObject);
    procedure BtnGetOneMailIDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  System.Net.HttpClient, System.Net.HttpClientComponent;

procedure TFormMain.BtnGetAtchmntsMailIDClick(Sender: TObject);
var
  HTTP: TNetHTTPClient;
  Response: IHTTPResponse;
begin
  HTTP := TNetHTTPClient.Create(nil);

  try
    Response := HTTP.Get('https://api.apilayer.com/temp_mail/atchmnts/id/'
      + EdtMailID.Text
      + '&apikey=VsjX2wQb7AO7Cy4lje2dn5NDVY61bi6H');

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;
end;

procedure TFormMain.BtnGetOneMailIDClick(Sender: TObject);
var
  HTTP: TNetHTTPClient;
  Response: IHTTPResponse;
begin
  HTTP := TNetHTTPClient.Create(nil);

  try
    Response := HTTP.Get('https://api.apilayer.com/temp_mail/one_mail/id/'
      + EdtOneMailID.Text
      + '&apikey=VsjX2wQb7AO7Cy4lje2dn5NDVY61bi6H');

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;
end;

procedure TFormMain.BtnGetSrcMailIDClick(Sender: TObject);
var
  HTTP: TNetHTTPClient;
  Response: IHTTPResponse;
begin
  HTTP := TNetHTTPClient.Create(nil);

  try
    Response := HTTP.Get('https://api.apilayer.com/temp_mail/source/id/'
      + EdtSourceMailID.Text
      + '&apikey=VsjX2wQb7AO7Cy4lje2dn5NDVY61bi6H');

    Memo1.Lines.Add(Response.ContentAsString);
  finally
    HTTP.Free;
  end;
end;

end.
