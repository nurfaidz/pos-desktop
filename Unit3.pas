unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, acPNG, StdCtrls, frxpngimage, sLabel, DB,
  ADODB, frxClass, frxDBSet;

type
  TForm3 = class(TForm)
    Label8: TLabel;
    Label1: TLabel;
    Image1: TImage;
    sPanel2: TsPanel;
    Shape1: TShape;
    Image2: TImage;
    sPanel3: TsPanel;
    Image3: TImage;
    shp1: TShape;
    sLabel1: TsLabel;
    shp2: TShape;
    shp4: TShape;
    shp5: TShape;
    shp6: TShape;
    sLabel2: TsLabel;
    shp3: TShape;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    qrypesanan: TADOQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    ADOConnection1: TADOConnection;
    procedure sPanel4Click(Sender: TObject);
    procedure sPanel7Click(Sender: TObject);
    procedure sPanel8Click(Sender: TObject);
    procedure sPanel6Click(Sender: TObject);
    procedure sPanel9Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure sLabel1Click(Sender: TObject);
    procedure sLabel2Click(Sender: TObject);
    procedure sLabel3Click(Sender: TObject);
    procedure sLabel4Click(Sender: TObject);
    procedure sLabel5Click(Sender: TObject);
    procedure sLabel6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit5, Unit8, Unit9, Unit10, Unit11, Unit1;

{$R *.dfm}

procedure TForm3.sPanel4Click(Sender: TObject);
begin
form5.show;
end;

procedure TForm3.sPanel7Click(Sender: TObject);
begin
form8.show;
end;

procedure TForm3.sPanel8Click(Sender: TObject);
begin
form9.show;
end;

procedure TForm3.sPanel6Click(Sender: TObject);
begin
form10.show;
end;

procedure TForm3.sPanel9Click(Sender: TObject);
begin
form11.show;
end;

procedure TForm3.Image3Click(Sender: TObject);
begin
if
(MessageDlg('Udah mau keluar?', mtConfirmation,[mbYes,mbNo],0)=mryes) then begin
form1.Show;
form1.Shape3.Brush.Color := $00FE8B18;
form1.Shape2.Brush.Color := $00FE8B18;
form1.Shape1.Brush.Color := $00FE8B18;
begin
form3.Close;
end;
end;
end;


procedure TForm3.sLabel1Click(Sender: TObject);
begin
 form5.show;
 shp1.Brush.Color := $00414141;
 shp2.Brush.Color := $00FE8B18;
 shp3.Brush.Color := $00FE8B18;
 shp4.Brush.Color := $00FE8B18;
 shp5.Brush.Color := $00FE8B18;

end;

procedure TForm3.sLabel2Click(Sender: TObject);
begin
 form10.show;
 shp1.Brush.Color := $00FE8B18;
 shp2.Brush.Color := $00414141;
 shp3.Brush.Color := $00FE8B18;
 shp4.Brush.Color := $00FE8B18;
 shp5.Brush.Color := $00FE8B18;
end;

procedure TForm3.sLabel3Click(Sender: TObject);
begin
 form8.show;
 shp1.Brush.Color := $00FE8B18;
 shp2.Brush.Color := $00FE8B18;
 shp3.Brush.Color := $00414141;
 shp4.Brush.Color := $00FE8B18;
 shp5.Brush.Color := $00FE8B18;
end;

procedure TForm3.sLabel4Click(Sender: TObject);
begin
 form9.show;
 shp1.Brush.Color := $00FE8B18;
 shp2.Brush.Color := $00FE8B18;
 shp3.Brush.Color := $00FE8B18;
 shp4.Brush.Color := $00414141;
 shp5.Brush.Color := $00FE8B18;
end;

procedure TForm3.sLabel5Click(Sender: TObject);
begin
 form11.show;
 shp1.Brush.Color := $00FE8B18;
 shp2.Brush.Color := $00FE8B18;
 shp3.Brush.Color := $00FE8B18;
 shp4.Brush.Color := $00FE8B18;
 shp5.Brush.Color := $00414141;
end;

procedure TForm3.sLabel6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
