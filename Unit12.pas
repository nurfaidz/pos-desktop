unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, frxpngimage, acPNG,
  ExtCtrls, sPanel, sLabel;

type
  TForm12 = class(TForm)
    sPanel2: TsPanel;
    Shape1: TShape;
    Label2: TLabel;
    Image2: TImage;
    sPanel3: TsPanel;
    Image3: TImage;
    sPanel1: TsPanel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    pnl5: TPanel;
    pnl4: TPanel;
    pnl7: TPanel;
    sPanel4: TsPanel;
    editcari: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbpesanan: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Shape2: TShape;
    sLabel1: TsLabel;
    GroupBox4: TGroupBox;
    sLabel3: TsLabel;
    Label6: TLabel;
    sPanel6: TsPanel;
    sPanel10: TsPanel;
    GroupBox5: TGroupBox;
    sLabel4: TsLabel;
    Label7: TLabel;
    sPanel7: TsPanel;
    sPanel11: TsPanel;
    DataSource1: TDataSource;
    Panel2: TPanel;
    sPanel8: TsPanel;
    sPanel9: TsPanel;
    Panel1: TPanel;
    lblnopesanan: TLabel;
    lblnomeja: TLabel;
    lblpemesan: TLabel;
    lblmakan: TLabel;
    lblbmakan: TLabel;
    lblminum: TLabel;
    lblbminum: TLabel;
    procedure Image3Click(Sender: TObject);
    procedure sPanel9Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure dbpesananCellClick(Column: TColumn);
    procedure sPanel8Click(Sender: TObject);
    procedure editcariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit1, Unit6, Unit4;

{$R *.dfm}

procedure TForm12.Image3Click(Sender: TObject);
begin
if
(MessageDlg('Udah mau keluar?', mtConfirmation,[mbYes,mbNo],0)=mryes) then begin
form1.Show;
form1.Shape3.Brush.Color := $00FE8B18;
form1.Shape2.Brush.Color := $00FE8B18;
form1.Shape1.Brush.Color := $00FE8B18;
begin
form12.Close;
end;
end;
end;

procedure TForm12.sPanel9Click(Sender: TObject);
begin
if Length(lblnopesanan.Caption) < 1 then
begin
MessageDlg('Pilih salah satu data pada DBGRID!',mtWarning,[mbOK],0);
Exit;
end;
with ADOQuery1 do
begin
SQL.Clear;
SQL.Text :=
' UPDATE pesanan SET ' +
' nopesanan = ' + QuotedStr(lblnopesanan.Caption) + ' , ' +
' nama_pemesan = ' + QuotedStr(lblpemesan.Caption) + ' , ' +
' no_meja = '  + QuotedStr(lblnomeja.Caption) + ' , ' +
' makanan = ' + QuotedStr(lblmakan.Caption) + ' , ' +
' minuman = ' + QuotedStr(lblminum.Caption) + ' , ' +
' jumlah_makan = ' + QuotedStr(lblbmakan.Caption) + ' , ' +
' jumlah_minum = ' + QuotedStr(lblbminum.Caption) + ' , ' +
' tgl = ' + '#' + DateToStr(now) + '#' + ' , ' +
' status = ' + QuotedStr('Proses Bayar') +
' WHERE nopesanan = ' + QuotedStr(lblnopesanan.Caption);
ExecSQL;
lblnopesanan.Caption:='';
lblpemesan.Caption:='';
lblnomeja.Caption:='';
lblminum.Caption:='';
lblmakan.Caption:='';
lblbmakan.Caption:='';
lblbminum.Caption:='';
MessageDlg('Segera masak dan antarkan ke pelanggan!', mtInformation,[mbOK],0);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select nopesanan, nama_pemesan, no_meja, makanan, minuman, jumlah_makan, jumlah_minum, status from pesanan where status = ' + QuotedStr('menunggu'));
  ADOQuery1.Open;
form6.ADOQuery1.Refresh;
form6.dbpesanan.Refresh;
end;
end;

procedure TForm12.Panel1Click(Sender: TObject);
begin
ADOQuery1.Refresh;
dbpesanan.Refresh;
end;

procedure TForm12.dbpesananCellClick(Column: TColumn);
begin
lblnopesanan.Caption := dbpesanan.Fields[0].AsString;
lblpemesan.Caption := dbpesanan.Fields[1].AsString;
lblnomeja.Caption := dbpesanan.Fields[2].AsString;
lblmakan.Caption := dbpesanan.Fields[3].AsString;
lblminum.Caption := dbpesanan.Fields[4].AsString;
lblbmakan.Caption := dbpesanan.Fields[5].AsString;
lblbminum.Caption := dbpesanan.Fields[6].AsString;
end;

procedure TForm12.sPanel8Click(Sender: TObject);
begin
with ADOQuery1 do
begin
Active := False;
SQL.Clear;
SQL.Text :=
' SELECT * FROM PESANAN WHERE NOPESANAN LIKE ' +
QuotedStr('%' + editcari.Text + '%');
Active := True;
end;
end;

procedure TForm12.editcariChange(Sender: TObject);
begin
with ADOQuery1 do
begin
Active := False;
SQL.Clear;
SQL.Text :=
' SELECT * FROM PESANAN WHERE NOPESANAN LIKE ' +
QuotedStr('%' + editcari.Text + '%');
Active := True;
end;
end;

end.
