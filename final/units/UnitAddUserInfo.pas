unit UnitAddUserInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TfrmAddUserInfo = class(TForm)
    editName: TEdit;
    editSurname: TEdit;
    editLastname: TEdit;
    pnlDontAdd: TPanel;
    rgBills: TRadioGroup;
    editMyBill: TEdit;
    rgValuta: TRadioGroup;
    gbValutCourse: TGroupBox;
    lbUSD: TLabel;
    lbRYB: TLabel;
    editUSD: TEdit;
    editRUB: TEdit;
    pnlAddUserBtn2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure pnlAddUserBtn2Click(Sender: TObject);
    procedure pnlDontAddClick(Sender: TObject);
    procedure editNameClick(Sender: TObject);
    procedure editSurnameClick(Sender: TObject);
    procedure editLastnameClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rgBillsClick(Sender: TObject);
    procedure editMyBillClick(Sender: TObject);

  private
    { Private declarations }
    procedure SetEditStyle;
    function IsBillExist(BillName: string; j: integer): boolean;
    function IsUserExit(Name, Surname, Lastname: string): boolean;
    procedure AddUser;
    procedure AddBill;

  public
    { Public declarations }
  end;

var
  frmAddUserInfo: TfrmAddUserInfo;

implementation

uses UnitData,
  UnitMain;

{$R *.dfm}

// ----------------------------------------------------------------
// ��������� ��� ��������� ����� ����� �����
procedure TfrmAddUserInfo.SetEditStyle;
begin
  editName.Font.Color := clGray;
  editName.Text := '���';
  editSurname.Font.Color := clGray;
  editSurname.Text := '�������';
  editLastname.Font.Color := clGray;
  editLastname.Text := '��������';
end;
// ��� ����� �����
procedure TfrmAddUserInfo.editNameClick(Sender: TObject);
begin
  editName.Clear;
  editName.Font.Color := clBlack;
end;
// ���� ����� �������
procedure TfrmAddUserInfo.editLastnameClick(Sender: TObject);
begin
  editLastname.Clear;
  editLastname.Font.Color := clBlack;
end;
// ���� ����� ���������
procedure TfrmAddUserInfo.editSurnameClick(Sender: TObject);
begin
  editSurname.Clear;
  editSurname.Font.Color := clBlack;
end;
// ���� ����� �����
procedure TfrmAddUserInfo.editMyBillClick(Sender: TObject);
begin
  editMyBill.Clear;
  editMyBill.Font.Color := clBlack;
end;
// ��������� ������� ������   "������"
procedure TfrmAddUserInfo.pnlDontAddClick(Sender: TObject);
begin
  pnlDontAdd.BevelOuter := bvLowered;
  frmAddUserInfo.Close;
end;
// ��������� ��������/�������� ���� ����� ������
procedure TfrmAddUserInfo.rgBillsClick(Sender: TObject);
begin
  if rgBills.ItemIndex = 3 then
  begin
    editMyBill.Visible := true;
    editMyBill.Clear;
    editMyBill.SetFocus;
  end
  else
    editMyBill.Visible := false;
end;

// ----------------------------------------------------------------
// ��������� �������� �����
procedure TfrmAddUserInfo.FormCreate(Sender: TObject);
begin
  // ������ � ����� ���������
  frmAddUserInfo.Top := ConstDataManipulateTop;
  frmAddUserInfo.Left := ConstDataManipulateLeft;
  SetEditStyle;
  // ���� ����� ���
  editName.Top := 80;
  editName.Left := 180;
  editName.Width := 360;
  editName.Height := 180;
  // ���� ����� �������
  editSurname.Top := 170;
  editSurname.Left := 180;
  editSurname.Width := 360;
  editSurname.Height := 180;
  // ���� ����� ��������
  editLastname.Top := 260;
  editLastname.Left := 180;
  editLastname.Width := 360;
  editLastname.Height := 180;
  // ������ �����
  rgBills.Top := 50;
  rgBills.Left := 20;
  rgBills.Width := 350;
  rgBills.Height := 300;
  // ���� ����� �����
  editMyBill.Width := 350;
  // ������ ������
  rgValuta.Top := 50;
  rgValuta.Left := 400;
  rgValuta.Width := 300;
  rgValuta.Height := 210;
  // ���� �����
  gbValutCourse.Top := 280;
  gbValutCourse.Left := 400;
  gbValutCourse.Width := 300;
  gbValutCourse.Height := 139;
  editUSD.Text := FloatToStr(USD);
  editRUB.Text := FloatToStr(RUB);
end;
// ��������� �������� �����
procedure TfrmAddUserInfo.FormShow(Sender: TObject);
begin
  if fBill then // �������� ����
  begin
    frmAddUserInfo.Caption := '���������� �����';
    // ������� ����������
    rgBills.Visible := true;
    rgValuta.Visible := true;
    gbValutCourse.Visible := true;
    // ��������� ����������
    editName.Visible := false;
    editSurname.Visible := false;
    editLastname.Visible := false;
    // ������ � ��������� �����/������
    frmAddUserInfo.Height := 650;
    // ������ ��������
    pnlAddUserBtn2.Top := 470;
    pnlAddUserBtn2.Left := 120;
    // ������ ������
    pnlDontAdd.Top := 470;
    pnlDontAdd.Left := 380;
  end
  else // �������� ������������
  begin
    frmAddUserInfo.Caption := '���������� ������������';
    // ������� �����������
    editName.Visible := true;
    editSurname.Visible := true;
    editLastname.Visible := true;
    // ��������� ����������
    rgBills.Visible := false;
    rgValuta.Visible := false;
    gbValutCourse.Visible := false;
    // ������ ��������
    pnlAddUserBtn2.Top := 380;
    pnlAddUserBtn2.Left := 140;
    // ������ ������
    pnlDontAdd.Top := 380;
    pnlDontAdd.Left := 400;
    // ������ � ��������� �����/������
    frmAddUserInfo.Height := 600;
  end;
end;

// ----------------------------------------------------------------
// ��������� ���������� ������ ������������ ��� �����
procedure TfrmAddUserInfo.pnlAddUserBtn2Click(Sender: TObject);
begin
  // ������ ������� ������
  pnlAddUserBtn2.BevelOuter := bvLowered;
  if not(fBill) then
  AddUser   // ���� ������������
    else
    AddBill;     // ���� �����
end;

// ���������� ������������
procedure TfrmAddUserInfo.AddUser;
var
  N: integer;
  Name, Surname, Lastname: string;
begin
  // �������� �� ����
  Name := editName.Text;
  Surname := editSurname.Text;
  Lastname := editLastname.Text;
  if not(IsUserExit(Name, Surname, Lastname)) then
  begin
    if ((Name <> '���') and (Surname <> '�������') and (Lastname <> '��������'))
      and ((Pos(' ', Name) = 0) and (Pos(' ', Surname) = 0) and
      (Pos(' ', Lastname) = 0)) and
      ((length(Name) > 0) and (length(Surname) > 0) and (length(Lastname) > 0))
    then
    begin
      SetLength(ArrayOfUsers, length(ArrayOfUsers) + 1);
      // ���������� ������� ������� �� 1
      N := length(ArrayOfUsers);
      ArrayOfUsers[N - 1].Name := editName.Text; // ���������� ��� � ������
      ArrayOfUsers[N - 1].Surname := editSurname.Text;
      ArrayOfUsers[N - 1].Lastname := editLastname.Text;

      // ����������  � �������� �  ����������
      FrmMain.listboxUsers.Items.Add(editName.Text + ' ' + editSurname.Text +
        ' ' + editLastname.Text);
      FrmMain.cbUsers.Items.Add(editName.Text + ' ' + editSurname.Text);
      FrmMain.cbUsersReport.Items.Add(editName.Text + ' ' + editSurname.Text);
      SaveChanges; // ������ � ����
      frmAddUserInfo.Close;
    end
    else
    begin
      ShowMessage('�� ����� �������� ��������, ���������� ��� ���!');
      pnlAddUserBtn2.BevelOuter := bvRaised;
    end;
  end
  else
  begin
    ShowMessage('������ ������������ ��� ����������');
    SetEditStyle;
  end;
end;
// ��������� ������� ���������� ��� � �������
function TfrmAddUserInfo.IsUserExit(Name, Surname, Lastname: string): boolean;
var
  i: integer;
begin
  for i := 0 to length(ArrayOfUsers) - 1 do
  begin
    if (ArrayOfUsers[i].Name = Name) and (ArrayOfUsers[i].Surname = Surname) and
      (ArrayOfUsers[i].Lastname = Lastname) then
      result := true
    else
      result := false;
  end;
end;
// ��������� ���������� �����
procedure TfrmAddUserInfo.AddBill;
var
  NumbOfBills, NumbOfExistBill, j, UserIndex: integer;
  SelectedBillName: string;
  fFound, fAdd: boolean;
begin
  fAdd := false;
  if (rgBills.ItemIndex >= 0) and (rgValuta.ItemIndex >= 0) then
  begin
    NumbOfBills := 0;
    NumbOfExistBill := 1;
    UserIndex := FrmMain.listboxUsers.ItemIndex;
    // ������� ���������� ������ � ������������
    while (ArrayOfUsers[UserIndex].Bill[NumbOfBills].BillName <> '') and
      (NumbOfBills <= 9) do
    begin
      inc(NumbOfBills);
    end;

    if (NumbOfBills <= 9) then
    begin
      if (rgBills.ItemIndex = 3) then
      begin
        SelectedBillName := editMyBill.Text;
        if (Pos(' ', SelectedBillName) > 0) or (length(SelectedBillName) = 0)
        then
          ShowMessage('������������ ����!')
        else
        begin
          fFound := false;
          for j := 0 to NumbOfBills - 1 do
          begin
            if (IsBillExist(SelectedBillName, j)) then
              fFound := true;
          end;

          if not(fFound) then
          begin
            ArrayOfUsers[UserIndex].Bill[NumbOfBills].BillName :=
              editMyBill.Text;
            fAdd := true;
          end
          else
          begin
            ShowMessage('����� ���� ��� ����������!');
            frmAddUserInfo.Close;
          end;
        end;

      end
      else
      begin
        SelectedBillName := rgBills.Items[rgBills.ItemIndex] + ' ' + '(' +
          inttostr(NumbOfExistBill) + ')';
        for j := 0 to NumbOfBills - 1 do
        begin
          if IsBillExist(SelectedBillName, j) then
          begin
            inc(NumbOfExistBill);
            SelectedBillName := rgBills.Items[rgBills.ItemIndex] + ' ' + '(' +
              inttostr(NumbOfExistBill) + ')';;
          end;
        end;
        ArrayOfUsers[UserIndex].Bill[NumbOfBills].BillName := SelectedBillName;
        fAdd := true;
      end;

      if fAdd then
      begin
        // ���������� ������ �����
        ArrayOfUsers[UserIndex].Bill[NumbOfBills].Valuta :=
          rgValuta.Items[rgValuta.ItemIndex];
        // ������� ������� ������
        FrmMain.sgUsersBills.RowCount := 1;
        // ���������� � ������� ������
        LoadUsersBills(FrmMain.sgUsersBills);
        ShowMessage('���� ��������!');
      end;
    end
    else
    begin
      ShowMessage('������������ ���������� ������ 10.');
      frmAddUserInfo.Close;
    end;
  end
  else
    ShowMessage('�� ��� ������ �������!');
  rgBills.ItemIndex := -1;
  rgValuta.ItemIndex := -1;
  editMyBill.Visible := false;
  pnlAddUserBtn2.BevelOuter := bvRaised;
end;
// �������� ������� ���������� ����� � �������
function TfrmAddUserInfo.IsBillExist(BillName: string; j: integer): boolean;
var
  i: integer;
begin
  if BillName = ArrayOfUsers[FrmMain.listboxUsers.ItemIndex].Bill[j].BillName
  then
    result := true
  else
    result := false;
end;

// ----------------------------------------------------------------
// ��������� �������� �����
procedure TfrmAddUserInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetEditStyle;
  pnlAddUserBtn2.BevelOuter := bvRaised;
  pnlDontAdd.BevelOuter := bvRaised;
  FrmMain.pnlAddUserBtn.BevelOuter := bvRaised;
  FrmMain.pnlAddBill.BevelOuter := bvRaised;
  rgBills.ItemIndex := -1;
  rgValuta.ItemIndex := -1;
  editMyBill.Visible := false;
  pnlAddUserBtn2.SetFocus;
end;
end.
