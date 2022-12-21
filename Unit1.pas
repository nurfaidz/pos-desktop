unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, acPNG, StdCtrls, frxpngimage, sLabel;

type
  TForm1 = class(TForm)
    Label8: TLabel;
    Label1: TLabel;
    Image1: TImage;
    sPanel3: TsPanel;
    sPanel2: TsPanel;
    Image2: TImage;
    Image3: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    procedure sPanel6Click(Sender: TObject);
    procedure sPanel4Click(Sender: TObject);
    procedure sPanel7Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure sPanel8Click(Sender: TObject);
    procedure sLabel3Click(Sender: TObject);
    procedure sLabel4Click(Sender: TObject);
    procedure sLabel2Click(Sender: TObject);
    procedure sLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit4, Unit7, Unit11, Unit12, Unit13;

{$R *.dfm}

procedure TForm1.sPanel6Click(Sender: TObject);
begin
form2.show;
end;

procedure TForm1.sPanel4Click(Sender: TObject);
begin
form4.show;
end;

procedure TForm1.sPanel7Click(Sender: TObject);
begin
form7.show;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
if
(MessageDlg('Udah mau keluar?', mtConfirmation,[mbYes,mbNo],0)=mryes) then
Application.Terminate;
end;

procedure TForm1.sPanel8Click(Sender: TObject);
begin
form12.show;
end;

procedure TForm1.sLabel3Click(Sender: TObject);
begin
form7.show;
Shape3.Brush.Color := $00FE8B18;
Shape2.Brush.Color := $00414141;
Shape1.Brush.Color := $00FE8B18;
end;

procedure TForm1.sLabel4Click(Sender: TObject);
begin
form13.show;
Shape3.Brush.Color := $00FE8B18;
Shape2.Brush.Color := $00FE8B18;
Shape1.Brush.Color := $00414141;
end;

procedure TForm1.sLabel2Click(Sender: TObject);
begin
form2.show;
Shape3.Brush.Color := $00414141;
Shape2.Brush.Color := $00FE8B18;
Shape1.Brush.Color := $00FE8B18;
end;

procedure TForm1.sLabel1Click(Sender: TObject);
begin
form4.show;
end;

end.
