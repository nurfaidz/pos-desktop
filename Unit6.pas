unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, acPNG, ExtCtrls, sPanel,
  frxpngimage, sLabel, frxClass, frxDBSet, sGroupBox;

type
  TForm6 = class(TForm)
    sPanel2: TsPanel;
    Shape1: TShape;
    Label2: TLabel;
    Image2: TImage;
    sPanel3: TsPanel;
    sPanel1: TsPanel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    pnl5: TPanel;
    pnl4: TPanel;
    pnl7: TPanel;
    sPanel4: TsPanel;
    editcari: TEdit;
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbpesanan: TDBGrid;
    Image3: TImage;
    Shape2: TShape;
    sLabel1: TsLabel;
    ADOQuery1: TADOQuery;
    lblnomeja: TLabel;
    lblnopesanan: TLabel;
    lblnamapesanan: TLabel;
    GroupBox4: TGroupBox;
    sLabel3: TsLabel;
    Label3: TLabel;
    sPanel5: TsPanel;
    sPanel9: TsPanel;
    sPanel11: TsPanel;
    GroupBox5: TGroupBox;
    sLabel4: TsLabel;
    Label6: TLabel;
    sPanel6: TsPanel;
    sPanel8: TsPanel;
    sPanel10: TsPanel;
    lblmakanan: TLabel;
    lblbmakan: TLabel;
    lblminuman: TLabel;
    lblbminum: TLabel;
    lblhmakan: TLabel;
    lblhminum: TLabel;
    sGroupBox1: TsGroupBox;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sPanel7: TsPanel;
    sLabel7: TsLabel;
    euang: TEdit;
    lbltotal: TLabel;
    lblkembali: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    sPanel12: TsPanel;
    sPanel13: TsPanel;
    sPanel14: TsPanel;
    Shape4: TShape;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    nota: TADOQuery;
    DataSource2: TDataSource;
    procedure dbpesananCellClick(Column: TColumn);
    procedure Image3Click(Sender: TObject);
    procedure sPanel13Click(Sender: TObject);
    procedure sPanel12Click(Sender: TObject);
    procedure sPanel14Click(Sender: TObject);
    procedure editcariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1, Unit3;

{$R *.dfm}

procedure TForm6.dbpesananCellClick(Column: TColumn);
begin
lblnopesanan.Caption := dbpesanan.Fields[0].AsString;
lblnamapesanan.Caption := dbpesanan.Fields[1].AsString;
lblnomeja.Caption := dbpesanan.Fields[2].AsString;
lblmakanan.Caption := dbpesanan.Fields[3].AsString;
lblminuman.Caption := dbpesanan.Fields[4].AsString;
lblbmakan.Caption := dbpesanan.Fields[5].AsString;
lblbminum.Caption := dbpesanan.Fields[6].AsString;
lblhmakan.Caption := dbpesanan.Fields[7].AsString;
lblhminum.Caption := dbpesanan.Fields[8].AsString;
lbltotal.Caption := dbpesanan.Fields[9].AsString;
end;

procedure TForm6.Image3Click(Sender: TObject);
begin
if
(MessageDlg('Udah mau keluar?', mtConfirmation,[mbYes,mbNo],0)=mryes) then begin
form1.Show;
form1.Shape3.Brush.Color := $00FE8B18;
form1.Shape2.Brush.Color := $00FE8B18;
form1.Shape1.Brush.Color := $00FE8B18;
begin
form6.Close;
end;
end;
end;

procedure TForm6.sPanel13Click(Sender: TObject);
var
bayar, kembalian,total: integer;
begin
if(euang.Text='') then
begin
MessageDlg('Maaf ada data yang ga keisi nih!',mtError,[mbOK],0);
euang.SetFocus;
Exit;
end;

bayar:=StrToInt(euang.Text);
total:=StrToInt(lbltotal.Caption);

kembalian:=bayar-total;
lblkembali.Caption:=IntToStr(kembalian);
end;

procedure TForm6.sPanel12Click(Sender: TObject);
begin
if(lblkembali.Caption='') then
begin
MessageDlg('Hitung dulu dong!',mtError,[mbOK],0);
Exit;
end;
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
' bayar = ' + QuotedStr(euang.Text) + ' , ' +
' kembali = ' + QuotedStr(lblkembali.Caption) + ' , ' +
' tgl = ' + '#' + DateToStr(now) + '#' + ' , ' +
' status = ' + QuotedStr('Selesai') +
' WHERE nopesanan = ' + QuotedStr(lblnopesanan.Caption);
ExecSQL;
euang.Clear;
lblnopesanan.Caption:='';
lblnomeja.Caption:='';
lblnamapesanan.Caption:='';
lblmakanan.Caption:='';
lblminuman.Caption:='';
lblbmakan.Caption:='';
lblbminum.Caption:='';
lblhmakan.Caption:='';
lblhminum.Caption:='';
lbltotal.Caption:='';
lblkembali.Caption:='';
MessageDlg('Selesai Transaksi!', mtInformation,[mbOK],0);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM pesanan where status=' + QuotedStr('Proses Bayar'));
  ADOQuery1.Open;
  form3.qrypesanan.Refresh;
  frxReport1.ShowReport();
  frxReport1.Clear;
  end;
  end;
  end;

procedure TForm6.sPanel14Click(Sender: TObject);
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

procedure TForm6.editcariChange(Sender: TObject);
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
