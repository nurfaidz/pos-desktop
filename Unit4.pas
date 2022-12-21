unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, sLabel, acPNG, ExtCtrls,
  sPanel, frxpngimage, ComCtrls, sUpDown, sGroupBox;

type
  TForm4 = class(TForm)
    sPanel3: TsPanel;
    sPanel2: TsPanel;
    Shape1: TShape;
    Label2: TLabel;
    Image2: TImage;
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    lbl2: TLabel;
    pnl4: TPanel;
    E1pesan: TEdit;
    pnl5: TPanel;
    E2nomeja: TEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    sLabel3: TsLabel;
    Label3: TLabel;
    sPanel6: TsPanel;
    sPanel8: TsPanel;
    sPanel10: TsPanel;
    Ebanyakminum: TEdit;
    GroupBox4: TGroupBox;
    sLabel2: TsLabel;
    Label1: TLabel;
    sPanel5: TsPanel;
    sPanel9: TsPanel;
    sPanel11: TsPanel;
    Ebanyakmakan: TEdit;
    ADOConnection1: TADOConnection;
    ADOmakan: TADOTable;
    sourcemakan: TDataSource;
    sourceminum: TDataSource;
    ADOminum: TADOTable;
    ADOpesanan: TADOTable;
    sourcepesan: TDataSource;
    Image3: TImage;
    Shape2: TShape;
    sLabel4: TsLabel;
    qrymakan: TADOQuery;
    qryminum: TADOQuery;
    qrypesan: TADOQuery;
    Panel1: TPanel;
    Enofaktur: TEdit;
    Label4: TLabel;
    GroupBox5: TGroupBox;
    sPanel4: TsPanel;
    Panel2: TPanel;
    sPanel13: TsPanel;
    sPanel14: TsPanel;
    sGroupBox1: TsGroupBox;
    sGroupBox2: TsGroupBox;
    sGroupBox3: TsGroupBox;
    GroupBox6: TGroupBox;
    lblmakanan: TLabel;
    lblhmakan: TLabel;
    lblminuman: TLabel;
    lblhminum: TLabel;
    lbltotal: TLabel;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Image3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure sPanel14Click(Sender: TObject);
    procedure sPanel13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1, Unit12, Unit6;

{$R *.dfm}

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
 lblmakanan.Caption:=DBGrid1.DataSource.DataSet['nama_makan'];
 lblhmakan.Caption:=DBGrid1.DataSource.DataSet['harga_makan'];
end;

procedure TForm4.DBGrid2CellClick(Column: TColumn);
begin
 lblminuman.Caption:=DBGrid2.DataSource.DataSet['nama_minum'];
 lblhminum.Caption:=DBGrid2.DataSource.DataSet['harga_minum'];
end;

procedure TForm4.Image3Click(Sender: TObject);
begin
if
(MessageDlg('Udah mau keluar?', mtConfirmation,[mbYes,mbNo],0)=mryes) then begin
form1.Show;
form1.Shape3.Brush.Color := $00FE8B18;
form1.Shape2.Brush.Color := $00FE8B18;
form1.Shape1.Brush.Color := $00FE8B18;
begin
form4.Close;
end;
end;
end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
lblmakanan.Caption := DBGrid1.Fields[0].AsString;
lblhmakan.Caption := DBGrid1.Fields[1].AsString;
end;

procedure TForm4.DBGrid2DblClick(Sender: TObject);
begin
lblminuman.Caption := DBGrid1.Fields[0].AsString;
lblhminum.Caption := DBGrid1.Fields[1].AsString;
end;

procedure TForm4.sPanel14Click(Sender: TObject);
var
jmakan, jminum, hmakan, hminum, totalharga : integer;
begin
jmakan := StrToInt(Ebanyakmakan.Text);
jminum := StrToInt(Ebanyakminum.Text);
hmakan := StrToInt(lblhmakan.Caption);
hminum := StrToInt(lblhminum.Caption);
totalharga := (jmakan*hmakan)+(jminum*hminum);
lbltotal.Caption := IntToStr(totalharga);
end;

procedure TForm4.sPanel13Click(Sender: TObject);
begin
if Length (lbltotal.Caption) < 1 then
begin
MessageDlg('Cek Terlebih Dahulu ya', mtInformation, [mbOK], 0);
exit;
end;

  if Length (Enofaktur.Text) < 1 then
  begin
    MessageDlg('Field No Pesanan Tidak boleh Kosong!', mtWarning, [mbOk],0);
    Exit;
  end;

  with qrypesan do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM pesanan WHERE nopesanan = '+ QuotedStr(Enofaktur.Text);
    Active := True;

    if qrypesan.RecordCount > 0 then
    begin
      MessageDlg('Terjadi duplikasi No Pesanan. Silahkan ganti dengan yang baru!', mtError, [mbOK], 0);
      Enofaktur.Clear;
      Enofaktur.SetFocus;
      Exit;
    end;
  end;

with qrypesan do
begin
SQL.Clear;
SQL.Text :=
' INSERT INTO pesanan(nopesanan,nama_pemesan,no_meja,makanan,minuman,jumlah_makan,jumlah_minum,harga_makan,harga_minum,total,tgl,status) VALUES (' + QuotedStr(Enofaktur.Text) +' , ' + QuotedStr(E1pesan.Text) + ' , ' + QuotedStr(E2nomeja.Text) + ' , ' + QuotedStr(lblmakanan.Caption) + ' , ' + QuotedStr(lblminuman.Caption) + ' , ' + QuotedStr(Ebanyakmakan.Text) + ' , ' + QuotedStr(Ebanyakminum.text) + ' , ' + QuotedStr(lblhmakan.Caption) + ' , ' + QuotedStr(lblhminum.Caption) + ' , ' + QuotedStr(lbltotal.Caption) + ' , ' + '#' + DateToStr(now) + '#' + ' , ' + QuotedStr('Menunggu') + ')';
ExecSQL;
Enofaktur.Clear;
E1pesan.Clear;
E2nomeja.Clear;
lblminuman.Caption :='';
lblmakanan.Caption:='';
lbltotal.Caption:='';
lblhmakan.Caption:='';
lblhminum.Caption:='';
Ebanyakmakan.Text :='1';
Ebanyakminum.Text :='1';
form6.ADOQuery1.Refresh;
form6.dbpesanan.Refresh;
Form12.dbpesanan.Refresh;
Form12.ADOQuery1.Refresh;
MessageDlg('Sudah berhasil memesan', mtInformation,[mbOK],0);
  Form12.ADOQuery1.SQL.Clear;
  Form12.ADOQuery1.SQL.Add('select nopesanan, nama_pemesan, no_meja, makanan, minuman, jumlah_makan, jumlah_minum, status from pesanan where status = ' + QuotedStr('menunggu'));
  Form12.ADOQuery1.Open;
end;
end;

end.
