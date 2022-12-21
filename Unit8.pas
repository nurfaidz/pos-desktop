unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, DB, ADODB, Grids, DBGrids, DBCtrls, sGroupBox,
  StdCtrls, sComboBox, ComCtrls, ExtCtrls, acPNG, sPanel;

type
  TForm8 = class(TForm)
    sPanel1: TsPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    img7: TImage;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    img9: TImage;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pnl10: TPanel;
    shp1: TShape;
    Image1: TImage;
    pnl7: TPanel;
    pnl6: TPanel;
    DateTimePicker1: TDateTimePicker;
    pnl4: TPanel;
    Edit1: TEdit;
    pnl5: TPanel;
    Edit2: TEdit;
    edt2: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    sPanel4: TsPanel;
    sPanel5: TsPanel;
    sPanel6: TsPanel;
    sPanel2: TsPanel;
    sComboBox1: TsComboBox;
    sComboBox2: TsComboBox;
    sGroupBox1: TsGroupBox;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    sPanel3: TsPanel;
    procedure sPanel2Click(Sender: TObject);
    procedure sPanel6Click(Sender: TObject);
    procedure sPanel5Click(Sender: TObject);
    procedure sPanel4Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sPanel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm8.sPanel2Click(Sender: TObject);
var
lokasi: string;
begin
if OpenPictureDialog1.Execute then
 lokasi:=OpenPictureDialog1.FileName;
 Image1.Picture.LoadFromFile(lokasi);
end;

procedure TForm8.sPanel6Click(Sender: TObject);
var
lokasi: string;
begin
ADOTable1.Append;
ADOTable1['ID']:= Edit1.Text;
ADOTable1['nama']:= Edit2.Text;
ADOTable1['alamat'] := Edit3.Text;
ADOTable1['tgllahir']:= DateTimePicker1.Time;
ADOTable1['bagian']:= sComboBox1.Text;
ADOTable1['jkl']:= sCombobox2.Text;
ADOTable1['foto']:=lokasi;
ADOTable1.post;
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
sComboBox1.Text :='Pilih---';
sComboBox2.Text :='Pilih---';
ADOTable1.Refresh;

Application.MessageBox('Yeay berhasil dimasukin!','Sukses', MB_OK+MB_ICONINFORMATION);

end;

procedure TForm8.sPanel5Click(Sender: TObject);
var
lokasi: string;
begin
ADOTable1.Edit;
ADOTable1['ID']:= Edit1.Text;
ADOTable1['nama']:= Edit2.Text;
ADOTable1['tgllahir']:= DateTimePicker1.Time;
ADOTable1['bagian'] :=sComboBox1.Text;
ADOTable1['alamat']:= Edit3.Text;
ADOTable1['jkl']:= sComboBox2.Text;
ADOTable1['foto']:=lokasi;
ADOTable1.post;
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
sComboBox1.Text :='Pilih---';
sComboBox2.Text :='Pilih---';
ADOTable1.Refresh;

Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);

end;

procedure TForm8.sPanel4Click(Sender: TObject);
begin
if
(MessageDlg('Hapus nih? Beneran??', mtConfirmation,[mbYes,mbNo],0)=mryes) then
ADOTable1.Delete;
Application.MessageBox('Yeay!Sudah dihapus kok','Sukses', MB_OK+MB_ICONINFORMATION);
ADOTable1.Refresh;
end;

procedure TForm8.img7Click(Sender: TObject);
begin
form8.Close;
 form3.shp1.Brush.Color := $00FE8B18;
 form3.shp2.Brush.Color := $00FE8B18;
 form3.shp3.Brush.Color := $00FE8B18;
 form3.shp4.Brush.Color := $00FE8B18;
 form3.shp5.Brush.Color := $00FE8B18;
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
edit1.Text := dbgrid1.Fields[0].AsString;
edit2.Text := dbgrid1.Fields[1].AsString;
Edit3.Text := DBGrid1.Fields[6].AsString;
sComboBox1.Text := DBGrid1.Fields[3].AsString;
sComboBox2.Text := DBGrid1.Fields[4].AsString;
end;

procedure TForm8.sPanel3Click(Sender: TObject);
begin
 if not ADOTable1.Locate('ID',edt2.Text,[])=true then
  ShowMessage ('Datanya ga ada nih!');
  edt2.Text:='Cari Yuk!';
end;

end.
