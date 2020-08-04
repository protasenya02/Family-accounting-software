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
// процедуры для установки стиля полей ввода
procedure TfrmAddUserInfo.SetEditStyle;
begin
  editName.Font.Color := clGray;
  editName.Text := 'Имя';
  editSurname.Font.Color := clGray;
  editSurname.Text := 'Фамилия';
  editLastname.Font.Color := clGray;
  editLastname.Text := 'Отчество';
end;
// пол ввода имени
procedure TfrmAddUserInfo.editNameClick(Sender: TObject);
begin
  editName.Clear;
  editName.Font.Color := clBlack;
end;
// поле ввода Фамилия
procedure TfrmAddUserInfo.editLastnameClick(Sender: TObject);
begin
  editLastname.Clear;
  editLastname.Font.Color := clBlack;
end;
// поле ввода Отчетства
procedure TfrmAddUserInfo.editSurnameClick(Sender: TObject);
begin
  editSurname.Clear;
  editSurname.Font.Color := clBlack;
end;
// поле ввода счета
procedure TfrmAddUserInfo.editMyBillClick(Sender: TObject);
begin
  editMyBill.Clear;
  editMyBill.Font.Color := clBlack;
end;
// обработка нажатия кнопки   "отмена"
procedure TfrmAddUserInfo.pnlDontAddClick(Sender: TObject);
begin
  pnlDontAdd.BevelOuter := bvLowered;
  frmAddUserInfo.Close;
end;
// процедура открытия/закрытия поля ввода счетаа
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
// процедура создания формы
procedure TfrmAddUserInfo.FormCreate(Sender: TObject);
begin
  // размер и место появления
  frmAddUserInfo.Top := ConstDataManipulateTop;
  frmAddUserInfo.Left := ConstDataManipulateLeft;
  SetEditStyle;
  // поле ввода Имя
  editName.Top := 80;
  editName.Left := 180;
  editName.Width := 360;
  editName.Height := 180;
  // поле ввода Фамилия
  editSurname.Top := 170;
  editSurname.Left := 180;
  editSurname.Width := 360;
  editSurname.Height := 180;
  // поле ввода Отчество
  editLastname.Top := 260;
  editLastname.Left := 180;
  editLastname.Width := 360;
  editLastname.Height := 180;
  // панель счета
  rgBills.Top := 50;
  rgBills.Left := 20;
  rgBills.Width := 350;
  rgBills.Height := 300;
  // поле ввода счета
  editMyBill.Width := 350;
  // панель валюты
  rgValuta.Top := 50;
  rgValuta.Left := 400;
  rgValuta.Width := 300;
  rgValuta.Height := 210;
  // курс валют
  gbValutCourse.Top := 280;
  gbValutCourse.Left := 400;
  gbValutCourse.Width := 300;
  gbValutCourse.Height := 139;
  editUSD.Text := FloatToStr(USD);
  editRUB.Text := FloatToStr(RUB);
end;
// процедура открытия формы
procedure TfrmAddUserInfo.FormShow(Sender: TObject);
begin
  if fBill then // добавить счет
  begin
    frmAddUserInfo.Caption := 'Добавление счета';
    // видимые компоненты
    rgBills.Visible := true;
    rgValuta.Visible := true;
    gbValutCourse.Visible := true;
    // невидимые компоненты
    editName.Visible := false;
    editSurname.Visible := false;
    editLastname.Visible := false;
    // рармер и положение формы/кнопок
    frmAddUserInfo.Height := 650;
    // кнопка добавить
    pnlAddUserBtn2.Top := 470;
    pnlAddUserBtn2.Left := 120;
    // кнопка отмена
    pnlDontAdd.Top := 470;
    pnlDontAdd.Left := 380;
  end
  else // добавить пользователя
  begin
    frmAddUserInfo.Caption := 'Добавление пользователя';
    // видимые компноненты
    editName.Visible := true;
    editSurname.Visible := true;
    editLastname.Visible := true;
    // невидимые компоненты
    rgBills.Visible := false;
    rgValuta.Visible := false;
    gbValutCourse.Visible := false;
    // кнопка добавить
    pnlAddUserBtn2.Top := 380;
    pnlAddUserBtn2.Left := 140;
    // кнопка отмена
    pnlDontAdd.Top := 380;
    pnlDontAdd.Left := 400;
    // рармер и положение формы/кнопок
    frmAddUserInfo.Height := 600;
  end;
end;

// ----------------------------------------------------------------
// процедура добавления нового пользователя или счета
procedure TfrmAddUserInfo.pnlAddUserBtn2Click(Sender: TObject);
begin
  // эффект нажатой кнопки
  pnlAddUserBtn2.BevelOuter := bvLowered;
  if not(fBill) then
  AddUser   // ввод пользователя
    else
    AddBill;     // ввод счета
end;

// добавление пользователя
procedure TfrmAddUserInfo.AddUser;
var
  N: integer;
  Name, Surname, Lastname: string;
begin
  // проверка на ввод
  Name := editName.Text;
  Surname := editSurname.Text;
  Lastname := editLastname.Text;
  if not(IsUserExit(Name, Surname, Lastname)) then
  begin
    if ((Name <> 'Имя') and (Surname <> 'Фамилия') and (Lastname <> 'Отчество'))
      and ((Pos(' ', Name) = 0) and (Pos(' ', Surname) = 0) and
      (Pos(' ', Lastname) = 0)) and
      ((length(Name) > 0) and (length(Surname) > 0) and (length(Lastname) > 0))
    then
    begin
      SetLength(ArrayOfUsers, length(ArrayOfUsers) + 1);
      // учеличение размера массива на 1
      N := length(ArrayOfUsers);
      ArrayOfUsers[N - 1].Name := editName.Text; // добавление ФИО в массив
      ArrayOfUsers[N - 1].Surname := editSurname.Text;
      ArrayOfUsers[N - 1].Lastname := editLastname.Text;

      // добавление  в листбокс и  комбобоксы
      FrmMain.listboxUsers.Items.Add(editName.Text + ' ' + editSurname.Text +
        ' ' + editLastname.Text);
      FrmMain.cbUsers.Items.Add(editName.Text + ' ' + editSurname.Text);
      FrmMain.cbUsersReport.Items.Add(editName.Text + ' ' + editSurname.Text);
      SaveChanges; // запись в файл
      frmAddUserInfo.Close;
    end
    else
    begin
      ShowMessage('Вы ввели неверное значение, попробуйте еще раз!');
      pnlAddUserBtn2.BevelOuter := bvRaised;
    end;
  end
  else
  begin
    ShowMessage('Данный пользователь уже существует');
    SetEditStyle;
  end;
end;
// проверкаа наличия введенного ФИО в массиве
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
// процедура добавления счета
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
    // подсчет количества счетов у пользователя
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
          ShowMessage('Некорректный ввод!')
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
            ShowMessage('Такой счет уже существует!');
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
        // добавление валюты счета
        ArrayOfUsers[UserIndex].Bill[NumbOfBills].Valuta :=
          rgValuta.Items[rgValuta.ItemIndex];
        // очистка таблицы счетов
        FrmMain.sgUsersBills.RowCount := 1;
        // добавление в таблицу счетов
        LoadUsersBills(FrmMain.sgUsersBills);
        ShowMessage('Счет добавлен!');
      end;
    end
    else
    begin
      ShowMessage('Максимальное количество счетов 10.');
      frmAddUserInfo.Close;
    end;
  end
  else
    ShowMessage('Не все пункты выбраны!');
  rgBills.ItemIndex := -1;
  rgValuta.ItemIndex := -1;
  editMyBill.Visible := false;
  pnlAddUserBtn2.BevelOuter := bvRaised;
end;
// проверка наличия введенного счета в массиве
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
// процедура закрытия формы
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
