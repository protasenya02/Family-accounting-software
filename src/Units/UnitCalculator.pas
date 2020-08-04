unit UnitCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmCalculator = class(TForm)
    editVvodNumber: TEdit;
    pnlCalculator: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl6: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl0: TPanel;
    pnlPoint: TPanel;
    pnlDelit: TPanel;
    pnlUmnozit: TPanel;
    pnlPlus: TPanel;
    pnlMinus: TPanel;
    pnlRovno: TPanel;
    pnlDelete: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure pnl1Click(Sender: TObject);
    procedure pnl3Click(Sender: TObject);
    procedure pnl4Click(Sender: TObject);
    procedure pnl5Click(Sender: TObject);
    procedure pnl6Click(Sender: TObject);
    procedure pnl9Click(Sender: TObject);
    procedure pnl8Click(Sender: TObject);
    procedure pnl7Click(Sender: TObject);
    procedure pnl0Click(Sender: TObject);
    procedure pnlPointClick(Sender: TObject);
    procedure pnl2Click(Sender: TObject);
    procedure pnlDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlDelitClick(Sender: TObject);
    procedure pnlPlusClick(Sender: TObject);
    procedure pnlUmnozitClick(Sender: TObject);
    procedure pnlMinusClick(Sender: TObject);
    procedure pnlRovnoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculator: TfrmCalculator;
  kod: char;
  x, y, z: real;

implementation

{$R *.dfm}

Uses UnitMain;

procedure TfrmCalculator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.pnlCalculatorBtn.BevelOuter := bvRaised;
  frmCalculator.Top := 570;
  frmCalculator.Left := 2000;
  editVvodNumber.Text := '';
end;

procedure TfrmCalculator.FormCreate(Sender: TObject);
var
  s: string;
  a, b, c, i, p: integer;
  op: char;
begin
  frmCalculator.Top := 570;
  frmCalculator.Left := 2000;
  editVvodNumber.Text := '';
end;

procedure TfrmCalculator.pnl0Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '0';
end;

procedure TfrmCalculator.pnl1Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '1';
end;

procedure TfrmCalculator.pnl2Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '2';
end;

procedure TfrmCalculator.pnl3Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '3';
end;

procedure TfrmCalculator.pnl4Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '4';
end;

procedure TfrmCalculator.pnl5Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '5';
end;

procedure TfrmCalculator.pnl6Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '6';
end;

procedure TfrmCalculator.pnl7Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '7';
end;

procedure TfrmCalculator.pnl8Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '8';
end;

procedure TfrmCalculator.pnl9Click(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '9';
end;

procedure TfrmCalculator.pnlDeleteClick(Sender: TObject);
begin
  editVvodNumber.Clear;
end;

procedure TfrmCalculator.pnlDelitClick(Sender: TObject);
begin
  if editVvodNumber.Text <> '' then
    x := strtofloat(editVvodNumber.Text);
  kod := '/';
  editVvodNumber.Clear;
end;

procedure TfrmCalculator.pnlMinusClick(Sender: TObject);
begin
  if editVvodNumber.Text <> '' then
    x := strtofloat(editVvodNumber.Text);
  kod := '-';
  editVvodNumber.Clear;
end;

procedure TfrmCalculator.pnlPlusClick(Sender: TObject);
begin
  if editVvodNumber.Text <> '' then
    x := strtofloat(editVvodNumber.Text);
  kod := '+';
  editVvodNumber.Clear;
end;

procedure TfrmCalculator.pnlPointClick(Sender: TObject);
begin
  editVvodNumber.Text := editVvodNumber.Text + '.';
end;

procedure TfrmCalculator.pnlRovnoClick(Sender: TObject);
begin
  if editVvodNumber.Text <> '' then
    y := strtofloat(editVvodNumber.Text);
  // в переменную y кладем editVvodNumber.text
  case kod of
    '+':
      z := x + y;
    '-':
      z := x - y;
    '*':
      z := x * y;
    '/':
      z := x / y
  end;
  editVvodNumber.Text := floattostr(z);
  // вывод в поле editVvodNumber значение переменной  z
end;

procedure TfrmCalculator.pnlUmnozitClick(Sender: TObject);
begin
  if editVvodNumber.Text <> '' then
    x := strtofloat(editVvodNumber.Text);
  kod := '*';
  editVvodNumber.Clear;
end;
end.
