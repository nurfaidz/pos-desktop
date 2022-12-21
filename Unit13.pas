unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, sPanel, StdCtrls, sLabel, acPNG;

type
  TForm13 = class(TForm)
    Image3: TImage;
    shp1: TShape;
    shp2: TShape;
    img7: TImage;
    sLabel1: TsLabel;
    Label8: TLabel;
    Label3: TLabel;
    edt2: TEdit;
    edt1: TEdit;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sPanel7: TsPanel;
    sPanel9: TsPanel;
    sPanel10: TsPanel;
    sPanel5: TsPanel;
    sPanel11: TsPanel;
    sPanel6: TsPanel;
    sPanel12: TsPanel;
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    procedure img7Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Unit12, Unit1;

{$R *.dfm}

procedure TForm13.img7Click(Sender: TObject);
begin
form13.Close;
form1 .Shape3.Brush.Color := $00FE8B18;
form1.Shape2.Brush.Color := $00FE8B18;
form1.Shape1.Brush.Color := $00FE8B18;
end;

procedure TForm13.Panel1Click(Sender: TObject);
begin
begin
with ADOQuery1 do begin
  Close;
  SQL.Clear;
  SQL.Add('select * from lkoki where usekoki='+QuotedStr(edt2.Text));
  Open;
end;
if ADOQuery1.RecordCount=0 then
  Application.MessageBox('Kok Kosong Sih Username dan Passwordnya','Maaf ya', MB_OK+MB_ICONERROR)
else
begin
  if ADOQuery1.FieldByName('pwkoki').AsString<>edt1.text then
  Application.MessageBox('Pastikan Password atau Username benar ya','Maaf ya', MB_OK+MB_ICONERROR)
else
begin
  form13.Hide;
  Form12.Show;
  Application.MessageBox('Yeay udah Masuk!','Yeay!', MB_OK+MB_ICONINFORMATION);
  end
end;
end;
end;

end.
