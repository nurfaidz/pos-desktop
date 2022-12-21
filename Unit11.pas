unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, acPNG, ExtCtrls, sPanel, DB, ADODB,
  frxClass, frxDBSet, RpCon, RpConDS, RpDefine, RpRave;

type
  TForm11 = class(TForm)
    GroupBox1: TGroupBox;
    DBbahan: TDBGrid;
    sPanel1: TsPanel;
    img7: TImage;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E1id: TEdit;
    E2nama: TEdit;
    E3stok: TEdit;
    E4harga: TEdit;
    lbl1: TLabel;
    ubahbahan: TPanel;
    simpanbahan: TPanel;
    hapusbahan: TPanel;
    cetakbahan: TsPanel;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure img7Click(Sender: TObject);
    procedure DBbahanCellClick(Column: TColumn);
    procedure simpanbahanClick(Sender: TObject);
    procedure ubahbahanClick(Sender: TObject);
    procedure hapusbahanClick(Sender: TObject);
    procedure cetakbahanClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm11.img7Click(Sender: TObject);
begin
form11.Close;
 form3.shp1.Brush.Color := $00FE8B18;
 form3.shp2.Brush.Color := $00FE8B18;
 form3.shp3.Brush.Color := $00FE8B18;
 form3.shp4.Brush.Color := $00FE8B18;
 form3.shp5.Brush.Color := $00FE8B18;
end;

procedure TForm11.DBbahanCellClick(Column: TColumn);
begin
E1id.Text :=DBbahan.Fields[0].AsString;
E2nama.Text := DBbahan.Fields[1].AsString;
E3stok.Text := DBbahan.Fields[2].AsString;
E4harga.Text := DBbahan.Fields[3].AsString;
end;

procedure TForm11.simpanbahanClick(Sender: TObject);
begin
ADOTable1.Append;
ADOTable1['idbahan']:=E1id.Text;
ADOTable1['namabahan']:=E2nama.Text;
ADOTable1['stok']:=E3stok.Text;
ADOTable1['perharga']:= E4harga.Text;
ADOTable1.post;
E1id.Clear;
E2nama.Clear;
E3stok.Clear;
E4harga.Clear;
ADOTable1.Refresh;
Application.MessageBox('Yeay berhasil dimasukin!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm11.ubahbahanClick(Sender: TObject);
begin
ADOTable1.Edit;
ADOTable1['idbahan']:=E1id.Text;
ADOTable1['namabahan']:=E2nama.Text;
ADOTable1['stok']:=E3stok.Text;
ADOTable1['perharga']:= E4harga.Text;
ADOTable1.post;
E1id.Clear;
E2nama.Clear;
E3stok.Clear;
E4harga.Clear;
ADOTable1.Refresh;
Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);
end;

procedure TForm11.hapusbahanClick(Sender: TObject);
begin
if
(MessageDlg('Hapus nih? Beneran??', mtConfirmation,[mbYes,mbNo],0)=mryes) then
ADOTable1.Delete;
Application.MessageBox('Yeay!Sudah dihapus kok','Sukses', MB_OK+MB_ICONINFORMATION);
ADOTable1.Refresh;
end;

procedure TForm11.cetakbahanClick(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
