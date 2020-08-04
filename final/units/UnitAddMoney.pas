unit UnitAddMoney;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.WinXPickers, Vcl.Grids;

type
  TfrmAddMoney = class(TForm)
    lbUserName: TLabel;
    cbUsersModalUnit: TComboBox;
    gbCategory: TGroupBox;
    lblNameOfCategory: TLabel;
    editSumSpend: TEdit;
    gbDate: TGroupBox;
    btnAdd: TBitBtn;
    btnProducts: TSpeedButton;
    btnAlcohol: TSpeedButton;
    btnFlat: TSpeedButton;
    btnClothes: TSpeedButton;
    btnDriweAway: TSpeedButton;
    btnBeauty: TSpeedButton;
    btnHealth: TSpeedButton;
    btnInternet: TSpeedButton;
    btnJKH: TSpeedButton;
    btnJourney: TSpeedButton;
    btnCredit: TSpeedButton;
    btnAnother: TSpeedButton;
    btnEducation: TSpeedButton;
    btnCar: TSpeedButton;
    dtCalendar: TDateTimePicker;
    btnZP: TSpeedButton;
    gbMoneySource: TGroupBox;
    btnGrant: TSpeedButton;
    btnCompensation: TSpeedButton;
    btnAnotherMoney: TSpeedButton;
    btnRent: TSpeedButton;
    btnDebt: TSpeedButton;
    lblNameOfSource: TLabel;
    cbUserBills: TComboBox;
    gbBills: TGroupBox;
    gbNotes: TGroupBox;
    editNotes: TEdit;
    gbValuta: TGroupBox;
    editValuta: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProductsClick(Sender: TObject);
    procedure btnAlcoholClick(Sender: TObject);
    procedure btnFlatClick(Sender: TObject);
    procedure editSumSpendKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnInternetClick(Sender: TObject);
    procedure btnJKHClick(Sender: TObject);
    procedure btnEducationClick(Sender: TObject);
    procedure btnCreditClick(Sender: TObject);
    procedure btnClothesClick(Sender: TObject);
    procedure btnDriweAwayClick(Sender: TObject);
    procedure btnBeautyClick(Sender: TObject);
    procedure btnHealthClick(Sender: TObject);
    procedure btnJourneyClick(Sender: TObject);
    procedure btnCarClick(Sender: TObject);
    procedure btnAnotherClick(Sender: TObject);
    procedure editSumSpendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnZPClick(Sender: TObject);
    procedure btnGrantClick(Sender: TObject);
    procedure btnCompensationClick(Sender: TObject);
    procedure btnAnotherMoneyClick(Sender: TObject);
    procedure btnRentClick(Sender: TObject);
    procedure btnDebtClick(Sender: TObject);
    procedure cbUsersModalUnitChange(Sender: TObject);
    procedure cbUserBillsChange(Sender: TObject);

  private
    procedure SetFocusOn;
    procedure NameOfCategorySet;
    procedure NameOfSourceSet;
    procedure AddInfoToSpendTable(var BtnNumber: byte);
    procedure AddInfoTоEarnTable(var BtnNumber: byte);
    procedure AddPlanMoney;
    procedure AddMoneySpendEarn;

    { Private declarations }
  public
    { Public declarations }
  end;

const
  NameOfCategorys: array [1 .. 20] of string = ('Продукты', 'Алкоголь',
    'Квартира', 'Мобильная связь, интернет', 'ЖКХ', 'Образование',
    'Кредит, долг', 'Одежда', 'Проезд', 'Красота', 'Здоровье', 'Путешествия',
    'Автомобиль', 'Другое', 'Заработная плата', 'Стипендия', 'Пенсия',
    'Сдача в аренду недвижимости', 'Взял в долг', 'Доход от других источников');

var
  frmAddMoney: TfrmAddMoney;
  BtnNumber: byte; // номер кнопки категории
  BtnWasCliked: boolean;

implementation

Uses UnitMain,
  UnitData, UnitAddUserInfo;
{$R *.dfm}
// ----------------------------------------------------------------
// процедуры установки цвета и надписи в поле сумма платежа
procedure TfrmAddMoney.SetFocusOn;
begin
  editSumSpend.Font.Color := clBlack;
  editSumSpend.Clear;
  editSumSpend.SetFocus;
end;

// ----------------------------------------------------------------
// процедуры обработки кнопок категорий
procedure TfrmAddMoney.btnProductsClick(Sender: TObject);
begin
  BtnNumber := 1;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnRentClick(Sender: TObject);
begin
  BtnNumber := 18;
  NameOfSourceSet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnZPClick(Sender: TObject);
begin
  BtnNumber := 15;
  NameOfSourceSet;
  SetFocusOn;
end;


procedure TfrmAddMoney.btnAlcoholClick(Sender: TObject);
begin
  BtnNumber := 2;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnAnotherClick(Sender: TObject);
begin
  BtnNumber := 14;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnAnotherMoneyClick(Sender: TObject);
begin
  BtnNumber := 20;
  NameOfSourceSet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnBeautyClick(Sender: TObject);
begin
  BtnNumber := 10;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnCarClick(Sender: TObject);
begin
  BtnNumber := 13;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnClothesClick(Sender: TObject);
begin
  BtnNumber := 8;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnCompensationClick(Sender: TObject);
begin
  BtnNumber := 17;
  NameOfSourceSet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnCreditClick(Sender: TObject);
begin
  BtnNumber := 7;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnDebtClick(Sender: TObject);
begin
  BtnNumber := 19;
  NameOfSourceSet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnDriweAwayClick(Sender: TObject);
begin
  BtnNumber := 9;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnEducationClick(Sender: TObject);
begin
  BtnNumber := 6;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnFlatClick(Sender: TObject);
begin
  BtnNumber := 3;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnGrantClick(Sender: TObject);
begin
  BtnNumber := 16;
  NameOfSourceSet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnHealthClick(Sender: TObject);
begin
  BtnNumber := 11;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnInternetClick(Sender: TObject);
begin
  BtnNumber := 4;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnJKHClick(Sender: TObject);
begin
  BtnNumber := 5;
  NameOfCategorySet;
  SetFocusOn;
end;

procedure TfrmAddMoney.btnJourneyClick(Sender: TObject);
begin
  BtnNumber := 12;
  NameOfCategorySet;
  SetFocusOn;
end;

// ----------------------------------------------------------------
// изменение названия валюты при изменении счета
procedure TfrmAddMoney.cbUserBillsChange(Sender: TObject);
begin
  editValuta.Text := ArrayOfUsers[frmAddMoney.cbUsersModalUnit.ItemIndex].Bill
   [cbUserBills.ItemIndex].Valuta;
end;
// изменение названия категории расхода при клике на кнопку
procedure TfrmAddMoney.NameOfCategorySet;
var
  i: integer;
begin
  for i := 1 to 14 do
  begin
    if BtnNumber = i then
      lblNameOfCategory.Caption := NameOfCategorys[i];
  end;
  BtnWasCliked := True;
end;
// изменение названия источника дохода при клике на кнопку
procedure TfrmAddMoney.NameOfSourceSet;
var
  i: integer;
begin
  for i := 15 to 20 do
  begin
    if BtnNumber = i then
      lblNameOfSource.Caption := NameOfCategorys[i];
  end;
  BtnWasCliked := True;
end;

// ----------------------------------------------------------------
// заполнение выпадающего списка счетов при изм. пользователя
procedure TfrmAddMoney.cbUsersModalUnitChange(Sender: TObject);
var
  i: integer;
begin
  cbUserBills.Clear;
  if Length(ArrayOfUsers) > 0 then
  begin
    i := 0;
    while (ArrayOfUsers[cbUsersModalUnit.ItemIndex].Bill[i].BillName <> '') do
    begin
      cbUserBills.Items.Add(ArrayOfUsers[cbUsersModalUnit.ItemIndex].Bill[i]
        .BillName);
      inc(i);
    end;
    if frmAddMoney.cbUserBills.Items.Count > 0 then
    cbUserBills.ItemIndex := 0;
    editValuta.Text := ArrayOfUsers[frmAddMoney.cbUsersModalUnit.ItemIndex].Bill
    [cbUserBills.ItemIndex].Valuta;
  end;
  SetFocusOn;
end;

// ----------------------------------------------------------------
// процедура создания формы
procedure TfrmAddMoney.FormCreate(Sender: TObject);
var
  i: integer;
begin
  // инициализация номера кнопки
  BtnNumber := 0;
  dtCalendar.Date := now;
  // расположение компонентов
  gbBills.Top := 450;
  gbDate.Top := 450;
  editSumSpend.Top := 600;
  btnAdd.Top := 700;
  // название категории
  lblNameOfCategory.Caption := 'Категория';
  lblNameOfSource.Caption := 'Источник дохода';
end;
// процедура показа формы
procedure TfrmAddMoney.FormShow(Sender: TObject);
begin
  if (fMoneySpend) then     // расходы
  begin
    frmAddMoney.Caption := 'Расходы (добавление)';
    // видимые компоненты
    cbUsersModalUnit.Visible := True;
    SetFocusOn;
    editSumSpend.SetFocus;
    gbCategory.Visible := True;
    gbCategory.Top := 90;
    lbUserName.Visible := True;
    gbBills.Visible := True;
    gbValuta.Visible := True;
    gbNotes.Visible := True;
    gbDate.Visible := True;
    // невидимые компоненты
    gbMoneySource.Visible := false;
    // расположение компнонентов
    gbBills.Top := 450;
    gbDate.Top := 450;
    editSumSpend.Top := 750;
    btnAdd.Top := 850;
    gbNotes.Top := 570;
    gbValuta.Top := 570;
    frmAddMoney.Height := 1000;
    // определение положение формы при открытии
    frmAddMoney.Top := ConstDataManipulateTop;
    frmAddMoney.Left := ConstDataManipulateLeft;
  end;

  if (fMoneyEarn) then    // доходы
  begin
    frmAddMoney.Caption := 'Доходы (добавление)';
    // видимые компоненты
    SetFocusOn;
    editSumSpend.SetFocus;
    gbMoneySource.Visible := True;
    cbUsersModalUnit.Visible := True;
    lbUserName.Visible := True;
    gbBills.Visible := True;
    gbValuta.Visible := True;
    gbNotes.Visible := True;
    gbDate.Visible := True;
    // невидимые компоненты
    gbCategory.Visible := false;
    // расположение компнонентов
    gbBills.Top := 400;
    gbDate.Top := 400;
    editSumSpend.Top := 700;
    gbNotes.Top := 527;
    gbValuta.Top := 527;
    btnAdd.Top := 800;
    frmAddMoney.Height := 1000;
    // определение положение формы при открытии
    frmAddMoney.Top := ConstDataManipulateTop;
    frmAddMoney.Left := ConstDataManipulateLeft;
  end;

  if fPlanSpend then       // планы расходов
  begin
    frmAddMoney.Caption := 'План (расходы)';
    // видимые компоненты
    gbCategory.Visible := True;
    SetFocusOn;
    // невидимые компоненты
    cbUsersModalUnit.Visible := false;
    gbMoneySource.Visible := false;
    lbUserName.Visible := false;
    gbBills.Visible := false;
    gbValuta.Visible := false;
    gbNotes.Visible := false;
    gbDate.Visible := false;
    // расположение компнонентов
    gbCategory.Top := 35;
    gbBills.Top := 450;
    gbDate.Top := 450;
    editSumSpend.Top := 450;
    btnAdd.Top := 550;
    gbNotes.Top := 570;
    gbValuta.Top := 570;
    frmAddMoney.Height := 800;
    // определение положение формы при открытии
    frmAddMoney.Top := ConstDataManipulateTop;
    frmAddMoney.Left := ConstDataManipulateLeft;
  end;

  if fPlanEarn then      // планы доходов
  begin
    frmAddMoney.Caption := 'План (доходы)';
    SetFocusOn;
    // видимые компоненты
    gbMoneySource.Visible := True;
    // невидимые компоненты
    cbUsersModalUnit.Visible := false;
    gbCategory.Visible := false;
    lbUserName.Visible := false;
    gbBills.Visible := false;
    gbValuta.Visible := false;
    gbNotes.Visible := false;
    gbDate.Visible := false;
    // расположение компнонентов
    gbCategory.Top := 35;
    gbBills.Top := 450;
    gbDate.Top := 450;
    editSumSpend.Top := 450;
    btnAdd.Top := 550;
    gbNotes.Top := 570;
    gbValuta.Top := 570;
    frmAddMoney.Height := 800;
    // определение положение формы при открытии
    frmAddMoney.Top := ConstDataManipulateTop;
    frmAddMoney.Left := ConstDataManipulateLeft;
  end;
end;

// ----------------------------------------------------------------
// ввод ссумы платежа
procedure TfrmAddMoney.editSumSpendClick(Sender: TObject);
begin
  SetFocusOn;
end;
// проверка ввода ( только цифры и backspace)
procedure TfrmAddMoney.editSumSpendKeyPress(Sender: TObject; var Key: Char);
begin
  // разрешен ввод цифр,точки/ запятой, backspace
  if not(Key in ['0' .. '9']) and not(Key in [#8]) then
    Key := #0;
end;

// ----------------------------------------------------------------
// добавление расхода в таблицу расходов
procedure TfrmAddMoney.AddInfoToSpendTable(var BtnNumber: byte);
var
  i: byte;
begin
  FrmMain.cbUsers.ItemIndex := 0;
  FrmMain.cbUsersSelect(FrmMain.cbUsers);
  // увеличение количества строк в таблице расходов
  FrmMain.sgMoneySpendTable.RowCount := FrmMain.sgMoneySpendTable.RowCount + 1;

  with FrmMain.sgMoneySpendTable do
  begin
    cells[0, FrmMain.sgMoneySpendTable.RowCount - 1] :=
      NameOfCategorys[BtnNumber]; // категория
    cells[1, FrmMain.sgMoneySpendTable.RowCount - 1] :=
      ArrayOfUsers[cbUsersModalUnit.ItemIndex].Name + ' ' + ArrayOfUsers
      [cbUsersModalUnit.ItemIndex].Surname; // пользователь
    cells[2, FrmMain.sgMoneySpendTable.RowCount - 1] :=
      cbUserBills.Items[cbUserBills.ItemIndex];
    cells[3, FrmMain.sgMoneySpendTable.RowCount - 1] :=
      DateToStr(dtCalendar.Date);
    cells[4, FrmMain.sgMoneySpendTable.RowCount - 1] := editNotes.Text;
    cells[5, FrmMain.sgMoneySpendTable.RowCount - 1] :=
      ArrayOfUsers[cbUsersModalUnit.ItemIndex].Bill
      [cbUserBills.ItemIndex].Valuta;
    cells[6, FrmMain.sgMoneySpendTable.RowCount - 1] :=
      IntToStr(StrToInt(editSumSpend.Text));
  end;

  // сохранение данных из таблицы расходов в файл
  with FrmMain do
  SaveStringGrid(sgMoneySpendTable, './Money spend info.txt');
  ShowMessage('Платеж добавлен!');
end;

// добавление дохода в таблицу доходов
procedure TfrmAddMoney.AddInfoTоEarnTable(var BtnNumber: byte);
var
  i: integer;
begin
  FrmMain.cbUsers.ItemIndex := 0;
  FrmMain.cbUsersSelect(FrmMain.cbUsers);
  // увеличение количества строк в таблице доходов
  FrmMain.sgMoneyEarnTable.RowCount := FrmMain.sgMoneyEarnTable.RowCount + 1;

  with FrmMain.sgMoneyEarnTable do
  begin
    cells[0, FrmMain.sgMoneyEarnTable.RowCount - 1] :=
      NameOfCategorys[BtnNumber]; // категория
    cells[1, FrmMain.sgMoneyEarnTable.RowCount - 1] :=
      ArrayOfUsers[cbUsersModalUnit.ItemIndex].Name + ' ' + ArrayOfUsers
      [cbUsersModalUnit.ItemIndex].Surname; // пользователь
    cells[2, FrmMain.sgMoneyEarnTable.RowCount - 1] := cbUserBills.Items
      [cbUserBills.ItemIndex];
    cells[3, FrmMain.sgMoneyEarnTable.RowCount - 1] :=
      DateToStr(dtCalendar.Date);
    cells[4, FrmMain.sgMoneyEarnTable.RowCount - 1] := editNotes.Text;
    cells[5, FrmMain.sgMoneyEarnTable.RowCount - 1] :=
      ArrayOfUsers[cbUsersModalUnit.ItemIndex].Bill
      [cbUserBills.ItemIndex].Valuta;
    cells[6, FrmMain.sgMoneyEarnTable.RowCount - 1] :=
      IntToStr(StrToInt(editSumSpend.Text));
  end;

  // сохранение данных из таблицы расходов в файл
  with FrmMain do
    SaveStringGrid(sgMoneyEarnTable, './Money earn info.txt');
  ShowMessage('Платеж добавлен!');
end;

// обработка нажатия кнопки "добавить"
procedure TfrmAddMoney.btnAddClick(Sender: TObject);
var
  fAdd: boolean;
begin
  fAdd := false;
  // проверка ввода
  if (fPlanSpend) or (fPlanEarn) then   // планы
  begin
    if BtnWasCliked = false then
      ShowMessage('Выберите категорию!')
    else
    begin
      if (Length(editSumSpend.Text) = 0) then
        ShowMessage('Введите сумму плана!')
      else
        AddPlanMoney;
    end;
  end
  else                   // доходы/расходы
  begin
    if cbUserBills.Items.Count > 0 then
    begin
      if (Length(editSumSpend.Text) = 0) then
      begin
        ShowMessage('Введите сумму платежа!');
      end
      else
      begin
        // проверка выбрана ли категория
        if BtnWasCliked = false then
          ShowMessage('Выберите категорию!')
        else
          fAdd := True;
      end;
    end
    else
    begin
      ShowMessage('Добавьте счет!');
      frmAddMoney.Close;
    end;
    if fAdd then
      AddMoneySpendEarn;
  end;
  editNotes.Clear;
  SetFocusOn;
end;


// ввод доходов/расходов
procedure TfrmAddMoney.AddMoneySpendEarn;
var
  fAdd: boolean;
  UserIndex, BillIndex, Sum: integer;
  ValutConvert: double;
begin
  Sum := 0;
  ValutConvert := 1;
  // индекс пользователя
  UserIndex := cbUsersModalUnit.ItemIndex;
  BillIndex := cbUserBills.ItemIndex;

  // исхояд из валюты счета, выбираю переменную для конвертации в BYR
  if ArrayOfUsers[UserIndex].Bill[BillIndex].Valuta = 'USD' then
    ValutConvert := 2.403
  else
  begin
    if ArrayOfUsers[UserIndex].Bill[BillIndex].Valuta = 'RUB' then
      ValutConvert := 0.03;
  end;

  // введенная сумма
  Sum := round(StrToFloat(editSumSpend.Text) * ValutConvert);

  // выбор по категории
  case BtnNumber of
    1:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Products := ArrayOfUsers[UserIndex]
          .MoneySpend.Products + Sum;
      end;
    2:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Alcohol := ArrayOfUsers[UserIndex]
          .MoneySpend.Alcohol + Sum;
      end;
    3:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Flat := ArrayOfUsers[UserIndex]
          .MoneySpend.Flat + Sum;
      end;
    4:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Internet := ArrayOfUsers[UserIndex]
          .MoneySpend.Internet + Sum;
      end;
    5:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.JKH := ArrayOfUsers[UserIndex]
          .MoneySpend.JKH + Sum;
      end;
    6:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Education := ArrayOfUsers[UserIndex]
          .MoneySpend.Education + Sum;
      end;
    7:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Credit := ArrayOfUsers[UserIndex]
          .MoneySpend.Credit + Sum;
      end;
    8:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Clothes := ArrayOfUsers[UserIndex]
          .MoneySpend.Clothes + Sum;
      end;
    9:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.DriveAway := ArrayOfUsers[UserIndex]
          .MoneySpend.DriveAway + Sum;
      end;
    10:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Beauty := ArrayOfUsers[UserIndex]
          .MoneySpend.Beauty + Sum;
      end;
    11:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Health := ArrayOfUsers[UserIndex]
          .MoneySpend.Health + Sum;
      end;
    12:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Journey := ArrayOfUsers[UserIndex]
          .MoneySpend.Journey + Sum;
      end;
    13:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Car := ArrayOfUsers[UserIndex]
          .MoneySpend.Car + Sum;
      end;
    14:
      begin
        ArrayOfUsers[UserIndex].MoneySpend.Another := ArrayOfUsers[UserIndex]
          .MoneySpend.Another + Sum;
      end;
    15:
      begin
        ArrayOfUsers[UserIndex].MoneyEarn.ZP := ArrayOfUsers[UserIndex]
          .MoneyEarn.ZP + Sum;
      end;
    16:
      begin
        ArrayOfUsers[UserIndex].MoneyEarn.Grant := ArrayOfUsers[UserIndex]
          .MoneyEarn.Grant + Sum;
      end;
    17:
      begin
        ArrayOfUsers[UserIndex].MoneyEarn.Compensation :=
          ArrayOfUsers[UserIndex].MoneyEarn.Compensation + Sum;
      end;
    18:
      begin
        ArrayOfUsers[UserIndex].MoneyEarn.Rent := ArrayOfUsers[UserIndex]
          .MoneyEarn.Rent + Sum;
      end;
    19:
      begin
        ArrayOfUsers[UserIndex].MoneyEarn.Debt := ArrayOfUsers[UserIndex]
          .MoneyEarn.Debt + Sum;
      end;
    20:
      begin
        ArrayOfUsers[UserIndex].MoneyEarn.AnotherMoney :=
          ArrayOfUsers[UserIndex].MoneyEarn.AnotherMoney + Sum;
      end;
  end;

  if BtnNumber in [1 .. 14] then
    AddInfoToSpendTable(BtnNumber)
  else
    AddInfoTоEarnTable(BtnNumber);
end;

// ввод планов
procedure TfrmAddMoney.AddPlanMoney;
var
  fAdd: boolean;
  UserIndex, BillIndex, Sum, Month, Year: integer;
begin
  Sum := StrToInt(editSumSpend.Text);
  UserIndex := FrmMain.cbUsersReport.ItemIndex;
  Month := FrmMain.cbMonth.ItemIndex + 1;
  Year := FrmMain.editYear.Value;

  case BtnNumber of
    1:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Products := Sum;
      end;
    2:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Alcohol := Sum;
      end;
    3:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Flat := Sum;
      end;
    4:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Internet := Sum;
      end;
    5:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.JKH := Sum;
      end;
    6:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Education := Sum;
      end;
    7:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Credit := Sum;
      end;
    8:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Clothes := Sum;
      end;
    9:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.DriveAway := Sum;
      end;
    10:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Beauty := Sum;
      end;
    11:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Health := Sum;
      end;
    12:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Journey := Sum;
      end;
    13:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Car := Sum;
      end;
    14:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Spend.Another := Sum;
      end;

    15:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Earn.ZP := Sum;
      end;
    16:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Earn.Grant := Sum;
      end;
    17:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Earn.Compensation := Sum;
      end;
    18:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Earn.Rent := Sum;
      end;
    19:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Earn.Debt := Sum;
      end;
    20:
      begin
        ArrayOfUsers[UserIndex].Plan[Month, Year].Earn.AnotherMoney := Sum;
      end;
  end;
  // сохранение изменений данных пользователей в файл
  if BtnNumber in [1 .. 14] then
  begin
    LoadPlanSpend(UserIndex, Month, Year);
    ShowMessage('План  расхода добавлен!');
  end
  else
  begin
    LoadPlanEarn(UserIndex, Month, Year);
    ShowMessage('План  дохода добавлен!');
  end;

  editSumSpend.Font.Color := clGray;
  editSumSpend.Text := 'Сумма (BYR)';
  ActiveControl := nil;
end;

// ----------------------------------------------------------------
// процедура закрытия формы
procedure TfrmAddMoney.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmMain.pnlAddBtn.BevelOuter := bvRaised;
  FrmMain.pnlAddPlanSpend.BevelOuter := bvRaised;
  FrmMain.pnlAddPlanEarn.BevelOuter := bvRaised;
  editNotes.Clear;
  fSort := True;
  btnAdd.SetFocus;
end;
end.
