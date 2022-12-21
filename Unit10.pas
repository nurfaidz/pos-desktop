unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, acPNG, StdCtrls, sGroupBox, DB, ADODB, Grids,
  DBGrids, sLabel;

type
  TForm10 = class(TForm)
    sPanel1: TsPanel;
    img7: TImage;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    koki: TsPanel;
    gbkoki: TsGroupBox;
    DBkoki: TDBGrid;
    Pn6koki: TPanel;
    pn7koki: TPanel;
    sourcekoki: TDataSource;
    ADOkoki: TADOTable;
    konek: TADOConnection;
    E2koki: TEdit;
    E3koki: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    simpankoki: TPanel;
    hapuskoki: TPanel;
    ubahkoki: TPanel;
    kasir: TPanel;
    gbkasir: TsGroupBox;
    DBkasir: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    E2kasir: TEdit;
    E3kasir: TEdit;
    ubahkasir: TPanel;
    simpankasir: TPanel;
    hapuskasir: TPanel;
    ADOkasir: TADOTable;
    sourcekasir: TDataSource;
    ADOsistem: TADOTable;
    sourcesistem: TDataSource;
    Sistem: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    sGroupBox1: TsGroupBox;
    DBsistem: TDBGrid;
    Panel2: TPanel;
    E1sistem: TEdit;
    Panel8: TPanel;
    E2sistem: TEdit;
    ubahsistem: TPanel;
    simpansistem: TPanel;
    hapusistem: TPanel;
    penutup: TPanel;
    Label9: TLabel;
    Image3: TImage;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    procedure img7Click(Sender: TObject);
    procedure simpankokiClick(Sender: TObject);
    procedure ubahkokiClick(Sender: TObject);
    procedure hapuskokiClick(Sender: TObject);
    procedure DBkokiCellClick(Column: TColumn);
    procedure Panel4Click(Sender: TObject);
    procedure ubahkasirClick(Sender: TObject);
    procedure simpankasirClick(Sender: TObject);
    procedure hapuskasirClick(Sender: TObject);
    procedure DBkasirCellClick(Column: TColumn);
    procedure Panel3Click(Sender: TObject);
    procedure ubahsistemClick(Sender: TObject);
    procedure simpansistemClick(Sender: TObject);
    procedure hapusistemClick(Sender: TObject);
    procedure DBsistemCellClick(Column: TColumn);
    procedure Panel1Click(Sender: TObject);
    procedure sLabel1Click(Sender: TObject);
    procedure sLabel2Click(Sender: TObject);
    procedure sLabel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm10.img7Click(Sender: TObject);
begin
form10.Close;
 form3.shp1.Brush.Color := $00FE8B18;
 form3.shp2.Brush.Color := $00FE8B18;
 form3.shp3.Brush.Color := $00FE8B18;
 form3.shp4.Brush.Color := $00FE8B18;
 form3.shp5.Brush.Color := $00FE8B18;
end;

procedure TForm10.simpankokiClick(Sender: TObject);
begin
ADOkoki.Append;
ADOkoki['usekoki']:=E2koki.Text;
ADOkoki['pwkoki']:=E3koki.Text;
ADOkoki.post;
E2koki.Clear;
E3koki.Clear;
ADOkoki.Refresh;
Application.MessageBox('Yeay berhasil dimasukin!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm10.ubahkokiClick(Sender: TObject);
begin
ADOkoki.Edit;
ADOkoki['usekoki']:=E2koki.Text;
ADOkoki['pwkoki']:=E3koki.Text;
ADOkoki.post;
E2koki.Clear;
E3koki.Clear;
ADOkoki.Refresh;
Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm10.hapuskokiClick(Sender: TObject);
begin
if
(MessageDlg('Hapus nih? Beneran??', mtConfirmation,[mbYes,mbNo],0)=mryes) then
ADOkoki.Delete;
Application.MessageBox('Yeay!Sudah dihapus kok','Sukses', MB_OK+MB_ICONINFORMATION);
ADOkoki.Refresh;
end;

procedure TForm10.DBkokiCellClick(Column: TColumn);
begin
E2koki.Text := DBkoki.Fields[0].AsString;
E3koki.Text := DBkoki.Fields[1].AsString;
end;

procedure TForm10.Panel4Click(Sender: TObject);
begin
koki.Visible := true;
kasir.Visible :=false;
Sistem.Visible :=false;
penutup.Visible := false;
end;

procedure TForm10.ubahkasirClick(Sender: TObject);
begin
ADOkasir.Edit;
ADOkasir['usekasir']:=E2kasir.Text;
ADOkasir['pwkasir']:=E3kasir.Text;
ADOkasir.post;
E2kasir.Clear;
E3kasir.Clear;
ADOkoki.Refresh;
Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm10.simpankasirClick(Sender: TObject);
begin
ADOkasir.Append;
ADOkasir['usekasir']:=E2kasir.Text;
ADOkasir['pwkasir']:=E3kasir.Text;
ADOkasir.post;
E2kasir.Clear;
E3kasir.Clear;
ADOkasir.Refresh;
Application.MessageBox('Yeay berhasil dimasukin!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm10.hapuskasirClick(Sender: TObject);
begin
if
(MessageDlg('Hapus nih? Beneran??', mtConfirmation,[mbYes,mbNo],0)=mryes) then
ADOkasir.Delete;
Application.MessageBox('Yeay!Sudah dihapus kok','Sukses', MB_OK+MB_ICONINFORMATION);
ADOkasir.Refresh;
end;

procedure TForm10.DBkasirCellClick(Column: TColumn);
begin
E2kasir.Text := DBkasir.Fields[0].AsString;
E3kasir.Text := DBkasir.Fields[1].AsString;
end;

procedure TForm10.Panel3Click(Sender: TObject);
begin
kasir.Visible := true;
koki.Visible :=false;
Sistem.Visible := false;
penutup.Visible := false;
end;

procedure TForm10.ubahsistemClick(Sender: TObject);
begin
ADOsistem.Edit;
ADOsistem['username']:=E1sistem.Text;
ADOsistem['password']:=E2sistem.Text;
ADOsistem.post;
E1sistem.Clear;
E2sistem.Clear;
ADOsistem.Refresh;
Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm10.simpansistemClick(Sender: TObject);
begin
ADOsistem.Append;
ADOsistem['username']:=E1sistem.Text;
ADOsistem['password']:=E2sistem.Text;
ADOsistem.post;
E1sistem.Clear;
E2sistem.Clear;
ADOsistem.Refresh;
Application.MessageBox('Yeay berhasil dimasukin!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm10.hapusistemClick(Sender: TObject);
begin
if
(MessageDlg('Hapus nih? Beneran??', mtConfirmation,[mbYes,mbNo],0)=mryes) then
ADOsistem.Delete;
Application.MessageBox('Yeay!Sudah dihapus kok','Sukses', MB_OK+MB_ICONINFORMATION);
ADOsistem.Refresh;
end;

procedure TForm10.DBsistemCellClick(Column: TColumn);
begin
E1sistem.Text := DBsistem.Fields[0].AsString;
E2sistem.Text := DBsistem.Fields[1].AsString;
end;

procedure TForm10.Panel1Click(Sender: TObject);
begin
koki.Visible := false;
kasir.Visible := false;
penutup.Visible := false;
Sistem.Visible := true;
end;

procedure TForm10.sLabel1Click(Sender: TObject);
begin
shp1.Brush.Color := $00422D2B;
shp2.Brush.Color := $00FE8B18;
shp3.Brush.Color := $00FE8B18;
koki.Visible := true;
kasir.Visible :=false;
Sistem.Visible :=false;
penutup.Visible := false;
end;

procedure TForm10.sLabel2Click(Sender: TObject);
begin
shp1.Brush.Color := $00FE8B18;
shp2.Brush.Color := $00422D2B;
shp3.Brush.Color := $00FE8B18;
koki.Visible := false;
kasir.Visible := false;
penutup.Visible := false;
Sistem.Visible := true;
end;

procedure TForm10.sLabel3Click(Sender: TObject);
begin
shp1.Brush.Color := $00FE8B18;
shp2.Brush.Color := $00FE8B18;
shp3.Brush.Color := $00422D2B;
kasir.Visible := true;
koki.Visible :=false;
Sistem.Visible := false;
penutup.Visible := false;
end;

end.
