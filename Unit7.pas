unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, sPanel, StdCtrls, sLabel, acPNG;

type
  TForm7 = class(TForm)
    shp1: TShape;
    shp2: TShape;
    img7: TImage;
    sLabel1: TsLabel;
    Label8: TLabel;
    Label3: TLabel;
    Image3: TImage;
    edt2: TEdit;
    edt1: TEdit;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sPanel7: TsPanel;
    sPanel8: TsPanel;
    sPanel9: TsPanel;
    sPanel10: TsPanel;
    sPanel5: TsPanel;
    sPanel11: TsPanel;
    sPanel6: TsPanel;
    sPanel12: TsPanel;
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    procedure sPanel8Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit6, Unit3, Unit1;

{$R *.dfm}

procedure TForm7.sPanel8Click(Sender: TObject);
begin
ADOTable1.Refresh;
ADOTable1.First;
while not ADOTable1.Eof do
begin
if(edt1.Text=ADOTable1['Usekasir']) and (edt2.Text=ADOTable1['Pwkasir']) then
begin
  Form6.show;
  form7.Hide;
  Application.MessageBox('Yeay udah Masuk!','Yeay!', MB_OK+MB_ICONINFORMATION);
  edt1.Text:='Password';
  edt2.Text:='Username';
Exit;
end;
ADOTable1.Next;
if(edt1.Text=ADOTable1['Usekasir']) and (edt2.Text=ADOTable1['Pwkasir']) then
begin
  Form6.show;
  form7.Hide;
  Application.MessageBox('Yeay udah Masuk!','Yeay!', MB_OK+MB_ICONINFORMATION);
  edt1.Text:='Password';
  edt2.Text:='Username';
Exit;
end;
if ADOTable1.Eof then
begin
  Application.MessageBox('Aduh salah nih password nya :D','Maaf ya', MB_OK+MB_ICONERROR);
  edt1.Text:='Password';
  edt2.Text:='Username';
edt1.SetFocus;
end;
end;
end;

procedure TForm7.img7Click(Sender: TObject);
begin
form7.close;
form1.Shape3.Brush.Color := $00FE8B18;
form1.Shape2.Brush.Color := $00FE8B18;
form1.Shape1.Brush.Color := $00FE8B18;
end;

end.
