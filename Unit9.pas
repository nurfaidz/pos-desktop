unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, sPanel, DBCtrls, sGroupBox, StdCtrls, DB,
  Grids, DBGrids, ADODB, sLabel;

type
  TForm9 = class(TForm)
    sPanel1: TsPanel;
    pnl2: TPanel;
    img7: TImage;
    sPanel4: TsPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    img9: TImage;
    lbl3: TLabel;
    lbl2: TLabel;
    Label2: TLabel;
    pnl4: TPanel;
    Edit1: TEdit;
    pnl5: TPanel;
    Edit2: TEdit;
    edt2: TEdit;
    Panel2: TPanel;
    sPanel5: TsPanel;
    sPanel6: TsPanel;
    sPanel7: TsPanel;
    sGroupBox1: TsGroupBox;
    DBNavigator1: TDBNavigator;
    Panel3: TPanel;
    Edit3: TEdit;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    ADOTable2: TADOTable;
    sPanel8: TsPanel;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Edit4: TEdit;
    Panel4: TPanel;
    Edit5: TEdit;
    Edit6: TEdit;
    sGroupBox2: TsGroupBox;
    DBNavigator2: TDBNavigator;
    Panel7: TPanel;
    Edit7: TEdit;
    Panel5: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid3: TDBGrid;
    shp1: TShape;
    sLabel1: TsLabel;
    shp2: TShape;
    sLabel2: TsLabel;
    Panel6: TPanel;
    Panel8: TPanel;
    procedure sPanel2Click(Sender: TObject);
    procedure img7Click(Sender: TObject);
    procedure sPanel6Click(Sender: TObject);
    procedure sPanel5Click(Sender: TObject);
    procedure sPanel7Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure sPanel3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure sLabel1Click(Sender: TObject);
    procedure sLabel2Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit4, Unit3;

{$R *.dfm}

procedure TForm9.sPanel2Click(Sender: TObject);
begin
sPanel4.Visible := true;
sPanel8.Visible := false;

end;

procedure TForm9.img7Click(Sender: TObject);
begin
form9.close;
 form3.shp1.Brush.Color := $00FE8B18;
 form3.shp2.Brush.Color := $00FE8B18;
 form3.shp3.Brush.Color := $00FE8B18;
 form3.shp4.Brush.Color := $00FE8B18;
 form3.shp5.Brush.Color := $00FE8B18;
end;


procedure TForm9.sPanel6Click(Sender: TObject);
begin
ADOTable1.Edit;
ADOTable1['Id_makan']:= Edit1.Text;
ADOTable1['nama_makan']:= Edit2.Text;
ADOTable1['harga_makan']:= Edit3.Text;
ADOTable1.post;
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
ADOTable1.Refresh;
Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);
form4.qrymakan.Refresh;
form4.DBGrid1.Refresh;
end;

procedure TForm9.sPanel5Click(Sender: TObject);
begin
if
(MessageDlg('Hapus nih? Beneran??', mtConfirmation,[mbYes,mbNo],0)=mryes) then
ADOTable1.Delete;
Application.MessageBox('Yeay!Sudah dihapus kok','Sukses', MB_OK+MB_ICONINFORMATION);
ADOTable1.Refresh;
form4.qrymakan.Refresh;
form4.DBGrid1.Refresh;
end;

procedure TForm9.sPanel7Click(Sender: TObject);
begin
ADOTable1.Append;
ADOTable1['Id_makan']:= Edit1.Text;
ADOTable1['nama_makan']:= Edit2.Text;
ADOTable1['harga_makan']:= Edit3.Text;
ADOTable1.post;
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
ADOTable1.Refresh;
Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);
form4.qrymakan.Refresh;
form4.DBGrid1.Refresh;
end;

procedure TForm9.DBGrid1CellClick(Column: TColumn);
begin
edit1.Text := dbgrid1.Fields[0].AsString;
edit2.Text := dbgrid1.Fields[1].AsString;
Edit3.Text := DBGrid1.Fields[2].AsString;
end;

procedure TForm9.sPanel3Click(Sender: TObject);
begin
sPanel8.Visible := true;
sPanel4.Visible := false;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
ADOTable2.Append;
ADOTable2['id_minum']:=Edit4.Text;
ADOTable2['nama_minum']:=Edit5.Text;
ADOTable2['harga_minum']:=Edit7.Text;
ADOTable2.post;
Edit4.Clear;
Edit5.Clear;
Edit7.Clear;
ADOTable2.Refresh;
Application.MessageBox('Yeay berhasil dimasukin!','Sukses', MB_OK+MB_ICONINFORMATION);
form4.qryminum.Refresh;
form4.DBGrid2.Refresh;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
ADOTable2.Edit;
ADOTable2['id_minum']:=Edit4.Text;
ADOTable2['nama_minum']:=Edit5.Text;
ADOTable2['harga_minum']:=Edit7.Text;
ADOTable2.post;
Edit4.Clear;
Edit5.Clear;
Edit7.Clear;
ADOTable2.Refresh;
Application.MessageBox('Yeay berhasil diubah!','Sukses', MB_OK+MB_ICONINFORMATION);
form4.qryminum.Refresh;
form4.DBGrid2.Refresh;
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
if
(MessageDlg('Hapus nih? Beneran??', mtConfirmation,[mbYes,mbNo],0)=mryes) then
ADOTable2.Delete;
Application.MessageBox('Yeay!Sudah dihapus kok','Sukses', MB_OK+MB_ICONINFORMATION);
ADOTable2.Refresh;
form4.qryminum.Refresh;
form4.DBGrid2.Refresh;
end;

procedure TForm9.DBGrid3CellClick(Column: TColumn);
begin
edit4.Text := dbgrid3.Fields[0].AsString;
edit5.Text := dbgrid3.Fields[1].AsString;
Edit7.Text := DBGrid3.Fields[2].AsString;
end;

procedure TForm9.sLabel1Click(Sender: TObject);
begin
shp1.Brush.Color := $00414141;
shp2.Brush.Color := $00969696;
sPanel4.Visible := true;
sPanel8.Visible := false;
end;

procedure TForm9.sLabel2Click(Sender: TObject);
begin
shp1.Brush.Color := $00969696;
shp2.Brush.Color := $00414141;
sPanel8.Visible := true;
sPanel4.Visible := false;
end;

procedure TForm9.Panel6Click(Sender: TObject);
begin
 if not ADOTable2.Locate('id_minum',Edit6.Text,[])=true then
  ShowMessage ('Datanya ga ada nih!');
  Edit6.Text:='Cari Yuk!';
end;

procedure TForm9.Panel8Click(Sender: TObject);
begin
 if not ADOTable1.Locate('id_makan',edt2.Text,[])=true then
  ShowMessage ('Datanya ga ada nih!');
  edt2.Text:='Cari Yuk!';
end;

end.
 