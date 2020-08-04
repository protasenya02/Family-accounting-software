unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, DateUtils,
  Vcl.Imaging.pngimage, IdBaseComponent, IdNetworkCalculator, Vcl.Grids,
  Vcl.Buttons, Vcl.ButtonGroup, Vcl.CategoryButtons, Vcl.Samples.Gauges,
  Vcl.Samples.Spin;

type
  TfrmMain = class(TForm)
    pnlMainMenu: TPanel; // кнопка отчет
    pnlMoneySpend: TPanel;
    pnlTopMenu: TPanel;
    pnlAddBtn: TPanel; // кнопка изменить
    pnlDeleteBtn: TPanel; // кнопка удалить
    imgAdd: TImage; // кратинка изменить
    imgDelete: TImage; // картинка удалить

    // --------------------------
    // управление пользователями
    listboxUsers: TListBox;
    pnlAddUserBtn: TPanel;
    pnlDeleteUserBtn: TPanel;
    sgMoneySpendTable: TStringGrid;
    lbDateName: TLabel;
    lbUserName: TLabel;
    cbFilterForDate: TCheckBox;
    cbUsers: TComboBox;
    dtDateMoneySpend: TDateTimePicker;
    lbUsers: TLabel;
    pnlMoneyEarn: TPanel;
    sgMoneyEarnTable: TStringGrid;
    lblBillsName: TLabel;
    sgUsersBills: TStringGrid;
    pnlAddBill: TPanel;
    pnlHelp: TPanel;
    pnlHelpBtns: TPanel;
    About: TPanel;
    features: TPanel;
    AboutSpend: TPanel;
    AboutEarn: TPanel;
    AboutUsersBills: TPanel;
    lbSpendEarn1: TLabel;
    imgSpendEarn: TImage;
    memoAbout: TMemo;
    memoFeatures: TMemo;
    memoSpendEarn: TMemo;
    memoUserBill: TMemo;
    pnlReport: TPanel;
    lbReportType: TLabel;
    paintboxReport: TPaintBox;
    cbReport: TComboBox;
    cbUsersReport: TComboBox;
    sgReportTable: TStringGrid;
    pnlUsersBtn: TPanel;
    pnlPlans: TPanel;
    sgPlanSpend: TStringGrid;
    lbPlanYear: TLabel;
    cbMonth: TComboBox;
    editYear: TSpinEdit;
    pnlAddPlanSpend: TPanel;
    pnlAddPlanEarn: TPanel;
    lbPlanSpend: TLabel;
    lbPlanEarn: TLabel;
    sgPlanEarn: TStringGrid;
    pnlCalculatorBtn: TPanel;
    imgCalculator: TImage;

    procedure FormCreate(Sender: TObject);
    procedure pnlUsersBtnClick(Sender: TObject);
    procedure pnlCalculatorBtnClick(Sender: TObject);
    procedure pnlAddBtnClick(Sender: TObject);
    procedure pnlDeleteBtnClick(Sender: TObject);
    procedure pnlAddUserBtnClick(Sender: TObject);
    procedure pnlMoneySpendClick(Sender: TObject);
    procedure pnlDeleteUserBtnClick(Sender: TObject);
    procedure cbUsersSelect(Sender: TObject);
    procedure sgMoneySpendTableSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbFilterForDateClick(Sender: TObject);
    procedure pnlMoneyEarnClick(Sender: TObject);
    procedure pnlAddBillClick(Sender: TObject);
    procedure pnlHelpClick(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure featuresClick(Sender: TObject);
    procedure AboutSpendClick(Sender: TObject);
    procedure AboutEarnClick(Sender: TObject);
    procedure AboutUsersBillsClick(Sender: TObject);
    procedure sgMoneyEarnTableSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure listboxUsersClick(Sender: TObject);
    procedure pnlReportClick(Sender: TObject);
    procedure paintboxReportPaint(Sender: TObject);
    procedure cbReportSelect(Sender: TObject);
    procedure sgReportTableDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlPlansClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure pnlAddPlanSpendClick(Sender: TObject);
    procedure cbUsersReportSelect(Sender: TObject);
    procedure cbMonthSelect(Sender: TObject);
    procedure editYearChange(Sender: TObject);
    procedure pnlAddPlanEarnClick(Sender: TObject);

  private
    procedure LoadUsers;
    // процедуры видимости компонентов и эффекта нажатия кнопки
    procedure MoneySpendVisible(Value: Boolean);
    procedure UsersVisible(Value: Boolean);
    procedure MoneyEarnVisible(Value: Boolean);
    procedure HelpVisible(Value: Boolean);
    procedure AboutVisible(Value: Boolean);
    procedure FeaturesVisible(Value: Boolean);
    procedure UserBillVisible(Value: Boolean);
    procedure AboutSpendVisible(Value: Boolean);
    procedure PlansVisible(Value: Boolean);
    procedure ReportVisible(Value: Boolean);

    // процедуры для таблиц
    procedure FilterGridForDate(StringGrid: TStringGrid);
    procedure DelRow(StringGrid: TStringGrid);
    function IsCellSelected(StringGrid: TStringGrid; X, Y: Longint): Boolean;
    procedure SortGrid(SrtingGrid: TStringGrid; Column: Integer; Row: Integer);
    procedure SortGridForUser(StringGrid: TStringGrid);
    procedure DeletUserFromTable(StringGrid: TStringGrid; UserIndex: Integer);

    procedure LoadGridForOneDay(var StringGrid: TStringGrid; UserIndex: Integer;
      Category: array of string);
    procedure LoadGridForOneWeek(var StringGrid: TStringGrid;
      UserIndex: Integer; Category: array of string);
    procedure LoadReportGridMoneyEarn(var AllMoney: Integer;
      UserIndex: Integer);
    procedure LoadReportGridMoneySpend(var AllMoney: Integer;
      UserIndex: Integer);
    procedure DeleteMoneySpendFromArray(i: Integer);
    procedure DeleteMoneyEarnFromArray(i: Integer);
    procedure LoadFactPlan(UserIndex: Integer);
    procedure LoadGridForMonth(var StringGrid: TStringGrid; UserIndex: Integer;
      Category: array of string; MyDate: TDateTime);
    procedure DeleteMoney(StringGrid: TStringGrid; TableNumb: Integer);

    // подсчет денег
    function SumAllForOneUsersBill(StringGrid: TStringGrid; BillName: string;
      UserName: string): Integer;
    function SearchMoneyForToday(StringGrid: TStringGrid; UserIndex: Integer;
      Category: string): Integer;
    procedure CountPlanMinusFact(StringGrid: TStringGrid);
    function SearchMoneyForMonth(var StringGrid: TStringGrid;
      UserIndex: Integer; Category: string; MyDate: TDateTime): Integer;
    function SearchMoneyForWeek(StringGrid: TStringGrid; UserIndex: Integer;
      Category: string): Integer;

    // отрисовка диаграммы
    procedure sector(clr: TColor; angle1, angle2: real);
    procedure DrawAllMoneyEarnForAllTime(var AllMoney: Integer;
      UserIndex: Integer; kind: Integer);
    procedure DrawAllMoneySpendForAllTime(var AllMoney: Integer;
      UserIndex: Integer; kind: Integer);
    procedure ClearDiagram(PaintBox: TPaintBox);

    { Private declarations }
  public

    { Public declarations }
  end;

procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
procedure LoadStringGrid(StringGrid: TStringGrid; sgNumber: Integer;
  const FileName: TFileName);
procedure LoadUsersBills(StringGrid: TStringGrid);
function SumAllMoneySpend(UserNumb: Integer): Integer;
function SumAllMoneyEarn(UserNumb: Integer): Integer;
function CountProcent(var AllMoney: Integer; Category: Integer): real;
procedure GridClean(Sender: TObject);
procedure LoadPlanSpend(UserIndex: Integer; Month: Integer; Year: Integer);
procedure LoadPlanEarn(UserIndex: Integer; Month: Integer; Year: Integer);
procedure SaveChanges;

var
  frmMain: TfrmMain;

implementation

Uses
  UnitCalculator,
  UnitAddMoney,
  UnitData,
  UnitAddUserInfo;

{$R *.dfm}

// ------------------------------------------------------------------
// процедуры видимости компонентов
procedure TfrmMain.MoneySpendVisible(Value: Boolean);
begin
  // видимость компонентов
  sgMoneySpendTable.Visible := Value;
  lbDateName.Visible := Value;
  dtDateMoneySpend.Visible := Value;
  cbFilterForDate.Visible := Value;
  sgMoneySpendTable.Visible := Value;
  // эффект нажатия
  if Value then
    pnlMoneySpend.BevelOuter := bvLowered
  else
    pnlMoneySpend.BevelOuter := bvRaised;
end;

procedure TfrmMain.UsersVisible(Value: Boolean);
begin
  // видимость компонентов
  lblBillsName.Visible := Value;
  listboxUsers.Visible := Value;
  lbUsers.Visible := Value;
  pnlAddUserBtn.Visible := Value;
  pnlDeleteUserBtn.Visible := Value;
  pnlAddBill.Visible := Value;
  sgUsersBills.Visible := Value;
  pnlAddBill.Visible := Value;
  // эффект нажатия
  if Value then
    pnlUsersBtn.BevelOuter := bvLowered
  else
    pnlUsersBtn.BevelOuter := bvRaised;
end;

procedure TfrmMain.MoneyEarnVisible(Value: Boolean);
begin
  // видимость компонентов
  sgMoneyEarnTable.Visible := Value;
  // эффект нажатия
  if Value then
    pnlMoneyEarn.BevelOuter := bvLowered
  else
    pnlMoneyEarn.BevelOuter := bvRaised;
end;

procedure TfrmMain.HelpVisible(Value: Boolean);
begin
  pnlHelpBtns.Visible := Value;
  // эффект нажатия
  if Value then
    pnlHelp.BevelOuter := bvLowered
  else
    pnlHelp.BevelOuter := bvRaised;
end;

procedure TfrmMain.AboutVisible(Value: Boolean);
begin
  memoAbout.Visible := Value;
  // эффект нажатия
  if Value then
    About.BevelOuter := bvLowered
  else
    About.BevelOuter := bvRaised;
end;

procedure TfrmMain.FeaturesVisible(Value: Boolean);
begin
  memoFeatures.Visible := Value;
  // эффект нажатия
  if Value then
    features.BevelOuter := bvLowered
  else
    features.BevelOuter := bvRaised;
end;

procedure TfrmMain.UserBillVisible(Value: Boolean);
begin
  memoUserBill.Visible := Value;
  // эффект нажатия
  if Value then
    AboutUsersBills.BevelOuter := bvLowered
  else
    AboutUsersBills.BevelOuter := bvRaised;
end;

procedure TfrmMain.AboutSpendVisible(Value: Boolean);
begin
  lbSpendEarn1.Visible := Value;
  imgSpendEarn.Visible := Value;
  memoSpendEarn.Visible := Value;
  // эффект нажатия
  if Value then
    AboutSpend.BevelOuter := bvLowered
  else
    AboutSpend.BevelOuter := bvRaised;
end;

procedure TfrmMain.ReportVisible(Value: Boolean);
begin
  cbReport.Visible := Value;
  lbReportType.Visible := Value;
  cbUsersReport.Visible := Value;
  sgReportTable.Visible := Value;
  // эффект нажатия
  if Value then
    pnlReport.BevelOuter := bvLowered
  else
    pnlReport.BevelOuter := bvRaised;
end;

procedure TfrmMain.PlansVisible(Value: Boolean);
begin
  sgPlanSpend.Visible := Value;
  lbPlanYear.Visible := Value;
  cbMonth.Visible := Value;
  editYear.Visible := Value;
  pnlAddPlanSpend.Visible := Value;
  pnlAddPlanEarn.Visible := Value;
  lbPlanSpend.Visible := Value;
  lbPlanEarn.Visible := Value;
  sgPlanEarn.Visible := Value;
  // эффект нажатия
  if Value then
    pnlPlans.BevelOuter := bvLowered
  else
    pnlPlans.BevelOuter := bvRaised;
end;


// ------------------------------------------------------------------
// процедуры обработки нажатий в кнопок меню меню
procedure TfrmMain.AboutUsersBillsClick(Sender: TObject);
begin
  UserBillVisible(true);
  AboutSpendVisible(false);
  AboutVisible(false);
  FeaturesVisible(false);
  AboutEarn.BevelOuter := bvRaised;
  AboutSpend.BevelOuter := bvRaised;
  // пользователи, счета
  memoUserBill.Top := 50;
  memoUserBill.Left := 570;
end;

procedure TfrmMain.AboutEarnClick(Sender: TObject);
begin
  AboutSpendVisible(true);
  AboutEarn.BevelOuter := bvLowered;
  AboutSpend.BevelOuter := bvRaised;
  lbSpendEarn1.Caption :=
    'Для добавления, удаления доходов  используйте соотвествующие кнопки:';
  FeaturesVisible(false);
  AboutVisible(false);
  UserBillVisible(false);
end;

procedure TfrmMain.AboutSpendClick(Sender: TObject);
begin
  FeaturesVisible(false);
  AboutVisible(false);
  UserBillVisible(false);
  imgSpendEarn.Visible := true;
  AboutEarn.BevelOuter := bvRaised;
  AboutSpendVisible(true);
  lbSpendEarn1.Caption :=
    'Для добавления, удаления расходов  используйте соотвествующие кнопки:';
  lbSpendEarn1.Visible := true;
end;

procedure TfrmMain.featuresClick(Sender: TObject);
var
  i: Integer;
begin
  // эффект нажатия
  AboutVisible(false);
  lbSpendEarn1.Visible := false;
  AboutSpendVisible(false);
  UserBillVisible(false);
  FeaturesVisible(true);
  // основные возможности
  memoFeatures.Top := 50;
  memoFeatures.Left := 570;
  memoFeatures.Height := 1500;
  memoFeatures.Width := 800;
end;

procedure TfrmMain.pnlMoneyEarnClick(Sender: TObject);
begin
  fMoneyEarn := true;
  fMoneySpend := false;
  fPlanSpend := false;
  fPlanEarn := false;
  // видимые компоненты
  MoneyEarnVisible(true);
  pnlAddBtn.Visible := true;
  pnlDeleteBtn.Visible := true;
  cbUsers.Visible := true;
  lbUserName.Visible := true;
  // невидимые компоненты
  ReportVisible(false);
  UsersVisible(false);
  MoneySpendVisible(false);
  HelpVisible(false);
  PlansVisible(false);

  dtDateMoneySpend.Visible := true;
  lbDateName.Visible := true;
  cbFilterForDate.Visible := true;
end;


procedure TfrmMain.pnlMoneySpendClick(Sender: TObject); // расходы
begin
  fMoneySpend := true;
  fMoneyEarn := false;
  fPlanSpend := false;
  fPlanEarn := false;

  // видимые компоненты
  MoneySpendVisible(true);
  pnlAddBtn.Visible := true;
  pnlDeleteBtn.Visible := true;
  lbUserName.Visible := true;
  cbUsers.Visible := true;

  // невидимые компоненты
  UsersVisible(false);
  MoneyEarnVisible(false);
  HelpVisible(false);
  ReportVisible(false);
  PlansVisible(false);
  // диаграмма очистка
  ClearDiagram(paintboxReport);
end;

procedure TfrmMain.pnlPlansClick(Sender: TObject);
var
  i: Integer;
  SearchDate: TDateTime;
  MyMonth, UserIndex, SumMoney, AllForMonth, MonthIndex, MyYear, Month,
    Year: Integer;
  YearNumb, MonthNumb, DayNumb: Word;
  UserName: string;
begin
  // флаги для модальной формы
  fPlanSpend := false;
  fMoneyEarn := false;
  fMoneySpend := false;
  fPlanEarn := false;
  // невидимые компоненты
  UsersVisible(false);
  MoneySpendVisible(false);
  MoneyEarnVisible(false);
  HelpVisible(false);
  ReportVisible(false);
  cbUsers.Visible := false;
  pnlAddBtn.Visible := false;
  pnlDeleteBtn.Visible := false;
  // видимые комноненты
  PlansVisible(true);
  cbUsersReport.Visible := true;
  lbUserName.Visible := true;
  lbReportType.Visible := true;
  lbReportType.Left := 1150;
  lbReportType.Caption := 'Месяц:';
  sgPlanSpend.RowCount := 15; // кол-во строк в таблице планов расходов
  sgPlanEarn.RowCount := 7; // кол-во строк в таблице планов доходов

  // заполнение шапок таблиц
  for i := 1 to sgPlanSpend.RowCount - 1 do // категории расходов
  begin
    sgPlanSpend.cells[1, i] := sgCategorySpendPlan[i];
  end;
  for i := 1 to sgPlanEarn.RowCount - 1 do // категорий доходов
  begin
    sgPlanEarn.cells[1, i] := sgCategoryEarnPlan[i];
  end;

  // установка текущего месяца
  DecodeDate(now, YearNumb, MonthNumb, DayNumb);
  cbMonth.ItemIndex := MonthNumb - 1;
  lbPlanSpend.Caption := 'План расдохов:' + ' ' + cbMonth.Text;
  lbPlanEarn.Caption := 'План доходов:' + ' ' + cbMonth.Text;
  // установка текущего года
  editYear.Value := YearNumb;
  // месяц для поиска
  MyMonth := cbMonth.ItemIndex + 1;
  MyYear := editYear.Value;
  SearchDate := EncodeDate(MyYear, MyMonth, 5);
  Month := frmMain.cbMonth.ItemIndex + 1;
  Year := frmMain.editYear.Value;
  for i := 0 to (sgPlanSpend.RowCount - 1) do
  begin
    sgPlanSpend.cells[2, i + 1] := editYear.Text; // год
    sgPlanSpend.cells[3, i + 1] := cbMonth.Text; // месяц
  end;
  for i := 0 to (sgPlanEarn.RowCount - 1) do
  begin
    sgPlanEarn.cells[2, i + 1] := editYear.Text; // год
    sgPlanEarn.cells[3, i + 1] := cbMonth.Text; // месяц
  end;

  if length(ArrayOfUsers) > 0 then
  begin
    UserIndex := cbUsersReport.ItemIndex;
    UserName := cbUsersReport.Items[cbUsersReport.ItemIndex];
    // заполенение таблиц
    // ПЛАН РАСХОДОВ
    for i := 0 to (sgPlanSpend.RowCount - 1) do
      sgPlanSpend.cells[0, i + 1] := UserName; // пользователь
    // ПЛАН ДОХОДОВ
    for i := 0 to (sgPlanEarn.RowCount - 1) do
      sgPlanEarn.cells[0, i + 1] := UserName; // пользователь

    // заполнение Расход/Доход (план)
    LoadPlanSpend(UserIndex, Month, Year);
    LoadPlanEarn(UserIndex, Month, Year);
    // заполнение Расход/Доход ( факт)
    LoadFactPlan(UserIndex);
    // подсчет и заполнение ПЛАН- ФАКТ
    CountPlanMinusFact(sgPlanSpend);
    CountPlanMinusFact(sgPlanEarn);
  end;
  // диаграмма очистка
  ClearDiagram(paintboxReport);
end;



procedure TfrmMain.pnlReportClick(Sender: TObject);
begin
  fReport := true;
  // видимые компоненты
  ReportVisible(true);
  lbReportType.Caption := 'Тип отчета:';
  lbUserName.Visible := true;
  // невидимые компоненты
  UsersVisible(false);
  MoneyEarnVisible(false);
  HelpVisible(false);
  MoneySpendVisible(false);
  PlansVisible(false);
  pnlAddBtn.Visible := false;
  pnlDeleteBtn.Visible := false;
  paintboxReport.Invalidate;
  cbReport.ItemIndex := 0;
  cbReportSelect(cbReport);

  if cbUsersReport.Items.Count > 0 then
    cbUsersReport.ItemIndex := 0
  else
    cbUsersReport.ItemIndex := -1;
  // диаграмма
  paintboxReport.Width := 450;
  paintboxReport.Height := 450;
  // снятие выделения с первой ячейки
  GridClean(sgReportTable);
end;


procedure TfrmMain.pnlUsersBtnClick(Sender: TObject); // пользователи
begin
  // очистка таблицы счетов
  sgUsersBills.RowCount := 1;
  if listboxUsers.Items.Count > 0 then
  begin
    listboxUsers.ItemIndex := 0;
    listboxUsersClick(listboxUsers);
  end;
  // Видимые компоненты
  UsersVisible(true);
  // Нeвидимые компоненты
  MoneySpendVisible(false);
  MoneyEarnVisible(false);
  HelpVisible(false);
  ReportVisible(false);
  PlansVisible(false);
  pnlAddBtn.Visible := false;
  pnlDeleteBtn.Visible := false;
  cbUsers.Visible := false;
  lbUserName.Visible := false;
  // диаграмма очистка
  ClearDiagram(paintboxReport);
end;

procedure TfrmMain.pnlAddUserBtnClick(Sender: TObject); // добавить пользователя
var
  i: Integer;
begin
  pnlAddUserBtn.BevelOuter := bvLowered;
  for i := 0 to listboxUsers.Items.Count - 1 do
    listboxUsers.Selected[i] := false;
  fBill := false;
  frmAddUserInfo.ShowModal;
end;

procedure TfrmMain.AboutClick(Sender: TObject);
begin
  AboutVisible(true);
  FeaturesVisible(false);
  lbSpendEarn1.Visible := false;
  AboutSpendVisible(false);
  UserBillVisible(false);
end;
//  добавить счет
procedure TfrmMain.pnlAddBillClick(Sender: TObject);
var
  i: Integer;
begin
  if (listboxUsers.Items.Count > 0) then
  // проверка наличия пользователей в списке
  begin
    for i := 0 to listboxUsers.Count - 1 do // проверка выбран ли пользователь
    begin
      if listboxUsers.Selected[i] then
      begin
        fBill := true;
        pnlAddBill.BevelOuter := bvLowered;
        frmAddUserInfo.ShowModal; // открытие модальной формы добавления счета
      end;
    end;
  end
  else // список пользователей пустой
    Showmessage('Список пользователей пуст. Добавьте пользователя!');
end;

// открытие формы добавления расходов/доходов  по клику
procedure TfrmMain.pnlAddBtnClick(Sender: TObject);
var
  i: byte;
begin
  fSort := false;
  // очистка комбобокса с именами пользователей т.к. могут остаться значения предыдущего открытия
  frmAddMoney.cbUsersModalUnit.Items.Clear;

  // добавление пользователей в комбобокс
  for i := 1 to length(ArrayOfUsers) do
  begin
    frmAddMoney.cbUsersModalUnit.Items.Add(ArrayOfUsers[i - 1].Name + ' ' +
      ArrayOfUsers[i - 1].Surname + ' ' + ArrayOfUsers[i - 1].Lastname);
  end;

  sgReportTable.RowCount := 1;

  // установка начального значения в комбобоксе
  if (frmAddMoney.cbUsersModalUnit.Items.Count > 0) then
    // если есть пользователи, то показывает первого
    frmAddMoney.cbUsersModalUnit.ItemIndex := 0
  else
    frmAddMoney.cbUsersModalUnit.ItemIndex := -1; // иначе ничего не выбрано

  // очистка комбобокса с наз. счетов т.к. могут остаться значения предыдущего открытия
  frmAddMoney.cbUserBills.Clear;

  // если пользователи есть, то добавление счетов выбранного пользователя
  if length(ArrayOfUsers) > 0 then
  begin
    i := 0;
    while (ArrayOfUsers[frmAddMoney.cbUsersModalUnit.ItemIndex].Bill[i]
      .BillName <> '') do
    begin
      frmAddMoney.cbUserBills.Items.Add
        (ArrayOfUsers[frmAddMoney.cbUsersModalUnit.ItemIndex].Bill[i].BillName);
      inc(i);
    end;
    // если у пользователя есть счета, то показывает название певрого счета и валюту
    if frmAddMoney.cbUserBills.Items.Count > 0 then
    begin
      with frmAddMoney do
      begin
        cbUserBills.ItemIndex := 0;
        editValuta.Text := ArrayOfUsers[frmAddMoney.cbUsersModalUnit.ItemIndex]
          .Bill[cbUserBills.ItemIndex].Valuta;
      end;
    end;
    // если форма не открыта, то открываем
    if not(frmAddMoney.Visible) then
    begin
      pnlAddBtn.BevelOuter := bvLowered; // изменение кнопки-->нажата
      frmAddMoney.ShowModal; // открытие формы
    end
    else // если открыта, то закрываем
    begin
      pnlAddBtn.BevelOuter := bvRaised; // изменение кнопки-->не нажата
      frmAddMoney.Close // закрытие формы
    end;
  end
  else
    Showmessage('Список пользователей пуст. Добавьте пользователя!');
end;
// добавление плана дохода
procedure TfrmMain.pnlAddPlanEarnClick(Sender: TObject);
begin
  fPlanEarn := true;
  fPlanSpend := false;

  if length(ArrayOfUsers) > 0 then
  begin
    // если форма не открыта, то открываем
    if not(frmAddMoney.Visible) then
    begin
      pnlAddPlanEarn.BevelOuter := bvLowered; // изменение кнопки-->нажата
      frmAddMoney.ShowModal; // открытие формы
    end
    else // если открыта, то закрываем
    begin
      pnlAddPlanEarn.BevelOuter := bvRaised; // изменение кнопки-->не нажата
      frmAddMoney.Close // закрытие формы
    end;
  end
  else
    Showmessage('Добавьте пользователя!');
end;
// Добавлкник плана
procedure TfrmMain.pnlAddPlanSpendClick(Sender: TObject);
begin
  fPlanSpend := true;
  fPlanEarn := false;
  if length(ArrayOfUsers) > 0 then
  begin
    // если форма не открыта, то открываем
    if not(frmAddMoney.Visible) then
    begin
      pnlAddPlanSpend.BevelOuter := bvLowered; // изменение кнопки-->нажата
      frmAddMoney.ShowModal; // открытие формы
    end
    else // если открыта, то закрываем
    begin
      pnlAddPlanSpend.BevelOuter := bvRaised; // изменение кнопки-->не нажата
      frmAddMoney.Close // закрытие формы
    end;
  end
  else
    Showmessage('Добавьте пользователя!');
end;
// процедура открытия калькулятора по клику на кнопку
procedure TfrmMain.pnlCalculatorBtnClick(Sender: TObject);
begin
  if not(frmCalculator.Visible) then
  begin
    frmCalculator.Show;
    pnlCalculatorBtn.BevelOuter := bvLowered;
  end
  else
  begin
    frmCalculator.Close;
    pnlCalculatorBtn.BevelOuter := bvRaised;
  end;
end;
// процедура удаления расходов/доходов
procedure TfrmMain.pnlDeleteBtnClick(Sender: TObject);
var
  UserName: string;
begin
  if fMoneySpend then // расходы
  begin
    DeleteMoney(sgMoneySpendTable, 1);
  end;
  if fMoneyEarn then // доходы
  begin
    DeleteMoney(sgMoneyEarnTable, 2);
  end;
end;

// ------------------------------------------------------------------
// процедура создания главной формы, инициализация переменных
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sgReportTable.RowCount := 1;
  SaveChanges;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
const
  sgCaptionBills: array [0 .. 2] of string = ('Название', 'Ед.изм', 'Остаток');
  cbReportname: array [0 .. 10] of string = ('Расходы за день',
    'Расходы за неделю', 'Расходы за текущий месяц', 'Расходы за прошлый месяц',
    'Расходы за все время', 'Доходы за день', 'Доходы за неделю',
    'Доходы за текущий месяц', 'Доходы за прошлый месяц', 'Доходы за все время',
    'Доход минус расход');
  sgReportName: array [0 .. 2] of string = ('', 'Категория', 'Сумма');
var
  i: byte;
  j, k, m: byte;
  Rect: TRect;
begin
  // создание/ открытие файла с информацией о пользователях
  AssignFile(UserInfoFile, './User''s info.txt');
  if not(FileExists('./User''s info.txt')) then
  begin
    Rewrite(UserInfoFile);
    CloseFile(UserInfoFile);
  end;

  SetLength(ArrayOfUsers, 0); // инициализации длины массива
  LoadUsers; // загрузка данных пользователей из файла в массив
  LoadStringGrid(sgMoneySpendTable, 1, './Money spend info.txt');
  // загрузка данных из файла в таблицу расходов
  LoadStringGrid(sgMoneyEarnTable, 2, './Money earn info.txt');
  // загрузка данных из файла в таблицу доходов
  LoadStringGrid(sgPlanSpend, 3, './Plan Spend info.txt');
  // загрузка данных из файла в таблицу планов расходов
  LoadStringGrid(sgPlanEarn, 4, './Plan Earn info.txt');
  // загрузка данных из файла в таблицу планов доходов

  for i := 1 to length(ArrayOfUsers) do
  begin
    listboxUsers.Items.Add(ArrayOfUsers[i - 1].Name + ' ' + ArrayOfUsers[i - 1]
      .Surname + ' ' + ArrayOfUsers[i - 1].Lastname);
    cbUsers.Items.Add(ArrayOfUsers[i - 1].Name + ' ' + ArrayOfUsers
      [i - 1].Surname);
    cbUsersReport.Items.Add(ArrayOfUsers[i - 1].Name + ' ' + ArrayOfUsers
      [i - 1].Surname);
  end;

  with sgUsersBills do
  begin
    // присвоение названия ячеек
    for k := 0 to 2 do
    begin
      cells[k, 0] := sgCaptionBills[k];
    end;
  end;

  if cbUsersReport.Items.Count > 0 then
  begin
    cbUsersReport.ItemIndex := 0;
    cbUsers.ItemIndex := 0;
  end
  else
  begin
    cbUsersReport.ItemIndex := -1;
    cbUsers.ItemIndex := 0;
  end;

  // присвоение названия ячеек таблице отчета
  for i := 0 to (sgReportTable.ColCount - 1) do
  begin
    sgReportTable.cells[i, 0] := sgReportName[i];
  end;

  USD := 2.403;
  RUB := 0.03;

  // заполнения комбобокса "Тип отчета"
  for m := 0 to length(cbReportname) - 1 do
  begin
    cbReport.Items.Add(cbReportname[m]);
  end;

  // Установка в календари текущего времени
  dtDateMoneySpend.Date := now;
  // clndrMonth.Date := now;
  fSort := true;
  fMoneyEarn := true;
  fMoneySpend := false;
  fPlanSpend := false;
  fPlanEarn := false;
  MoneyEarnVisible(true);
  cbUsers.Visible := true;
  lbUserName.Visible := true;
  dtDateMoneySpend.Visible := true;
  lbDateName.Visible := true;
  cbFilterForDate.Visible := true;
  // ----------------------------------
  // размеры и координаты появления форм
  // панель верхнего меню
  pnlTopMenu.Width := 2500;
  pnlTopMenu.Height := 100;
  // кнопка добавить
  pnlAddBtn.Top := 17;
  pnlAddBtn.Left := 570;
  imgAdd.Top := 12;
  imgAdd.Left := 9;
  // кнопка удалить
  pnlDeleteBtn.Top := 17;
  pnlDeleteBtn.Left := 770;
  imgDelete.Top := 12;
  imgDelete.Left := 9;
  // календарь маленький
  dtDateMoneySpend.Left := 1200;
  dtDateMoneySpend.Top := 120;
  // кпнока калькулятора
  pnlCalculatorBtn.Top := 17;
  pnlCalculatorBtn.Left := 1750;
  imgCalculator.Top := 4;
  imgCalculator.Left := 17;
  // таблица доходов
  sgMoneyEarnTable.Left := 520;
  sgMoneyEarnTable.Top := 190;
  sgMoneyEarnTable.Width := 1400;
  sgMoneyEarnTable.Height := 930;
  sgMoneyEarnTable.ColWidths[0] := 390; // ширина валюты
  sgMoneyEarnTable.ColWidths[5] := 150; // ширина валюты
  sgMoneyEarnTable.ColWidths[2] := 270; // ширина счет
  sgMoneyEarnTable.ColWidths[3] := 190; // ширина даты
  // комбобокс пользователей
  cbUsers.Top := 120;
  cbUsers.Left := 740;
  // надпись "Пользователь"
  lbUserName.Left := 520;
  lbUserName.Top := 130;
  lbUsers.Left := 520;
  lbUsers.Top := 130;
  // надпись "дата"
  lbDateName.Left := 1100;
  lbDateName.Top := 130;
  // таблица расходов
  sgMoneySpendTable.Left := 520;
  sgMoneySpendTable.Top := 190;
  sgMoneySpendTable.Width := 1400;
  sgMoneySpendTable.Height := 930;
  sgMoneySpendTable.ColWidths[0] := 390; // ширина валюты
  sgMoneySpendTable.ColWidths[5] := 150; // ширина валюты
  sgMoneySpendTable.ColWidths[2] := 270; // ширина счет
  sgMoneySpendTable.ColWidths[3] := 190; // ширина даты
  // надпись "фильторвать"
  cbFilterForDate.Left := 1450;
  cbFilterForDate.Top := 120;
  // надпись "Счета пользователя"
  lblBillsName.Left := 520;
  lblBillsName.Top := 584;
  // все пользователи список
  listboxUsers.Width := 800;
  listboxUsers.Height := 400;
  listboxUsers.Left := 520;
  listboxUsers.Top := 170;
  // счета пользователей  таблица
  sgUsersBills.Width := 800;
  sgUsersBills.ColWidths[0] := 400; // название счета
  sgUsersBills.ColWidths[1] := 200; // валюта
  sgUsersBills.ColWidths[2] := 200; // отстаток
  sgUsersBills.Height := 540;
  sgUsersBills.Left := 520;
  sgUsersBills.Top := 630;
  // кнопка добавить пользователя
  pnlAddUserBtn.Width := 280;
  pnlAddUserBtn.Height := 70;
  pnlAddUserBtn.Top := 17;
  pnlAddUserBtn.Left := 530;
  // кнопка удалить пользователя
  pnlDeleteUserBtn.Width := 280;
  pnlDeleteUserBtn.Height := 70;
  pnlDeleteUserBtn.Top := 17;
  pnlDeleteUserBtn.Left := 826;
  // добавить план  расхода
  pnlAddPlanSpend.Width := 280;
  pnlAddPlanSpend.Height := 70;
  pnlAddPlanSpend.Top := 17;
  pnlAddPlanSpend.Left := 530;
  // добавить план дохода
  pnlAddPlanEarn.Width := 280;
  pnlAddPlanEarn.Height := 70;
  pnlAddPlanEarn.Top := 17;
  pnlAddPlanEarn.Left := 826;
  // план расходов
  lbPlanSpend.Left := 520;
  lbPlanSpend.Top := 180;
  // план доходов
  lbPlanEarn.Left := 520;
  lbPlanEarn.Top := 770;

  // кнопка добавить счет
  pnlAddBill.Width := 280;
  pnlAddBill.Height := 70;
  pnlAddBill.Top := 17;
  pnlAddBill.Left := 1120;
  // тип отчета
  lbReportType.Top := 130;
  lbReportType.Left := 1190;
  // комбобокс "тип отчета"
  cbReport.Top := 120;
  cbReport.Left := 1370;
  cbUsersReport.Top := 120;
  cbUsersReport.Left := 740;
  // ----------------------------------
  // помощь
  // панель
  pnlHelpBtns.Top := 140;
  pnlHelpBtns.Left := 500;
  // о программе
  memoAbout.Top := 50;
  memoAbout.Left := 570;
  // раздел расходы
  lbSpendEarn1.Top := 50;
  lbSpendEarn1.Left := 570;
  imgSpendEarn.Top := 130;
  imgSpendEarn.Left := 660;
  memoSpendEarn.Top := 230;
  memoSpendEarn.Left := 570;
  // таблица планов расхода
  sgPlanSpend.Left := 520;
  sgPlanSpend.Top := 230;
  sgPlanSpend.Width := 1400;
  sgPlanSpend.Height := 520;
  sgPlanSpend.ColWidths[0] := 290; // ширина пользователь
  sgPlanSpend.ColWidths[1] := 390; // ширина категория
  sgPlanSpend.ColWidths[2] := 100; // ширина год
  sgPlanSpend.ColWidths[3] := 140; // ширина месяц
  sgPlanSpend.ColWidths[4] := 230; // ширина расход (план)
  sgPlanSpend.ColWidths[5] := 230; // ширина расход ( факт)
  sgPlanSpend.ColWidths[6] := 230; // ширина разница
  lbPlanYear.Top := 130;
  lbPlanYear.Left := 1480;
  // таблица планов доходов
  sgPlanEarn.Left := 520;
  sgPlanEarn.Top := 820;
  sgPlanEarn.Width := 1400;
  sgPlanEarn.Height := 333;
  sgPlanEarn.ColWidths[0] := 290; // ширина пользователь
  sgPlanEarn.ColWidths[1] := 390; // ширина категория
  sgPlanEarn.ColWidths[2] := 100; // ширина год
  sgPlanEarn.ColWidths[3] := 140; // ширина месяц
  sgPlanEarn.ColWidths[4] := 230; // ширина расход (план)
  sgPlanEarn.ColWidths[5] := 230; // ширина расход ( факт)
  sgPlanEarn.ColWidths[6] := 230; // ширина разница
  // таблица отчета
  sgReportTable.Left := 520;
  sgReportTable.Top := 300;
  sgReportTable.Width := 680;
  sgReportTable.Height := 400;
  sgReportTable.ColWidths[0] := 100;
  sgReportTable.ColWidths[1] := 400;
  // комбобокс месяц
  cbMonth.Top := 120;
  cbMonth.Left := 1260;
  // год
  editYear.Top := 120;
  editYear.Left := 1550;
  // диаграмма очистка
  ClearDiagram(paintboxReport);
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  // увеличение длинны панели при изменении размеров главной формы
  pnlTopMenu.Width := 1000 * (ClientWidth div 700);
end;


// ------------------------------------------------------------------
// процедуры ТАБЛИЦ  расходов, доходов
//процедура для фильтрации таблиц доходов/ расходов по дате
procedure TfrmMain.FilterGridForDate(StringGrid: TStringGrid);
var
  i, j: Integer;
  TrueDateIndex: Integer;
  FalseDateCount: Integer;
begin
  if cbFilterForDate.Checked = true then
  begin
    TrueDateIndex := 0;
    FalseDateCount := 0;

    for i := 1 to StringGrid.RowCount - 1 do
    begin
      if dtDateMoneySpend.Date = StrToDate(StringGrid.cells[3, i]) then
      begin
        if StringGrid.cells[3, i - 1] = '' then
        begin
          for j := 0 to 6 do
          begin
            StringGrid.cells[j, TrueDateIndex + 1] := StringGrid.cells[j, i];
          end;
          StringGrid.Rows[i].Clear;
          inc(TrueDateIndex);
        end
        else
          TrueDateIndex := i;
      end
      else
      begin
        StringGrid.Rows[i].Clear;
        inc(FalseDateCount);
      end;
    end;
    StringGrid.RowCount := StringGrid.RowCount - FalseDateCount;
  end;
end;

procedure TfrmMain.SortGrid(SrtingGrid: TStringGrid; Column: Integer;
  Row: Integer); // сортировка таблицы расходов по столбцам
var
  i, j: Integer;
  tmpRow: string;
  Swap: Boolean;
begin
  // сортируем по возрастанию
  for i := 1 to SrtingGrid.RowCount - 1 do
  begin
    for j := i + 1 to SrtingGrid.RowCount - 1 do
    begin
      Swap := false;
      case Column of
        0, 1, 2, 4, 5: // сортировка строк (ФИО, категория, счет, Валюта)
          begin
            if SrtingGrid.cells[Column, i] > SrtingGrid.cells[Column, j] then
            begin // обмен ячеек в столбце
              Swap := true;
            end;
          end;
        6: // сортировка по сумме
          begin
            if strtoint(SrtingGrid.cells[Column, i]) >
              strtoint(SrtingGrid.cells[Column, j]) then
            begin // обмен ячеек в столбце
              Swap := true;
            end;
          end;

        3: // сортировка по дате
          begin
            if StrToDateTime(SrtingGrid.cells[Column, i]) >
              StrToDateTime(SrtingGrid.cells[Column, j]) then
            begin // обмен ячеек в столбце
              Swap := true;
            end;
          end;

      end;
      if Swap then
      begin
        tmpRow := SrtingGrid.Rows[i].Text;
        SrtingGrid.Rows[i].Text := SrtingGrid.Rows[j].Text;
        SrtingGrid.Rows[j].Text := tmpRow;
      end;
    end;
  end;
end;

// процедуры сортировки таблицы доходов/расходов для выбранного столбца
procedure TfrmMain.sgMoneyEarnTableSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow < 1) and fSort then // проверка нажатия на ячейки с названиями полей
  begin
    SortGrid(sgMoneyEarnTable, ACol, ARow); // сортировка для выбранного столбца
  end;
end;

procedure TfrmMain.sgMoneySpendTableSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow < 1) and fSort then // проверка нажатия на ячейки с названиями полей
  begin
    SortGrid(sgMoneySpendTable, ACol, ARow);
    // сортировка для выбранного столбца
  end;
end;
// процедура раскраски ячеек в соотвествии с категорией
procedure TfrmMain.sgReportTableDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  // закрашивание первой колонны
  if (ACol = 0) then
  begin
    case cbReport.ItemIndex of
      0, 1, 2, 3, 4:
        begin
          case ARow of
            1:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(116, 36, 244);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            2:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(238, 130, 238);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            3:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 192, 203);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            4:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(147, 112, 219);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            5:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 20, 147);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            6:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(0, 191, 255);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            7:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(0, 0, 255);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            8:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(0, 255, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            9:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(0, 128, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            10:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 215, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            11:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 165, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            12:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 0, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            13:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(30, 144, 255);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            14:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(0, 255, 255);
                sgReportTable.Canvas.FillRect(Rect);
              end;
          end;
        end;
      5, 6, 7, 8, 9:
        begin
          case ARow of
            1:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(127, 255, 212);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            2:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(0, 191, 255);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            3:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 0, 255);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            4:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 215, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            5:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 69, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            6:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(147, 112, 219);
                sgReportTable.Canvas.FillRect(Rect);
              end;
          end;
        end;

      10:
        begin
          case ARow of
            1:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(255, 215, 0);
                sgReportTable.Canvas.FillRect(Rect);
              end;
            2:
              begin
                sgReportTable.Canvas.Brush.Color := Rgb(0, 191, 255);
                sgReportTable.Canvas.FillRect(Rect);
              end;
          end
        end;
    end;
  end;
end;

// загрузка данных о расходах из файла в таблицу расходов
procedure LoadStringGrid(StringGrid: TStringGrid; sgNumber: Integer;
  const FileName: TFileName);
const
  sgCaptionSpend: array [0 .. 6] of string = ('Категория расходов',
    'Пользователь', 'Списать со счета', 'Дата', 'Примечание', 'Валюта',
    'Сумма');
  sgCaptionEarn: array [0 .. 6] of string = ('Источник доходов', 'Пользователь',
    'На счет', 'Дата', 'Примечание', 'Валюта', 'Сумма');
  sgPlanSpendName: array [0 .. 6] of string = ('Пользователь', 'Категория',
    'Год', 'Месяц', 'Расход(План)', 'Расход(Факт)', 'Разница');
  sgPlanEarnName: array [0 .. 6] of string = ('Пользователь', 'Источник', 'Год',
    'Месяц', 'Доход(План)', 'Доход(Факт)', 'Разница');
var
  f: TextFile;
  Temp, i, k, j: Integer;
  strTemp: String;
begin
  AssignFile(f, FileName);
  if not(FileExists(FileName)) then // создание файла
  begin
    Rewrite(f);
    // заполнение шапки таблиц
    with StringGrid do
    begin
      for j := 0 to ColCount - 1 do
      begin
        case sgNumber of
          1:
            cells[j, 0] := sgCaptionSpend[j]; // названия столбцов в таблице
          2:
            cells[j, 0] := sgCaptionEarn[j]; // доходы
          3:
            cells[j, 0] := sgPlanSpendName[j]; // планы расходы
          4:
            cells[j, 0] := sgPlanEarnName[j]; // план доходы
        end;
      end;
    end;
    CloseFile(f);
    SaveStringGrid(StringGrid, FileName);
  end
  else
  begin
    Reset(f); // открытие файла
    with StringGrid do
    begin
      // получение кол-ва столбцов
      Readln(f, Temp);
      ColCount := Temp;
      // получение кол-ва строк
      Readln(f, Temp);
      RowCount := Temp;
      // цикл по всем ячейкам и заполнение их
      for i := 0 to ColCount - 1 do
        for k := 0 to RowCount - 1 do
        begin
          Readln(f, strTemp);
          cells[i, k] := strTemp;
        end;
    end;
    CloseFile(f);
  end;
end;

// сохранение данных из таблицы расходов в файл
procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f: TextFile;
  i, k: Integer;
begin
  AssignFile(f, FileName);
  Rewrite(f);
  with StringGrid do
  begin
    // запись кол-ва столбцов/строк
    Writeln(f, ColCount);
    Writeln(f, RowCount);
    // цикл по всем ячейкам
    for i := 0 to ColCount - 1 do
      for k := 0 to RowCount - 1 do
        Writeln(f, cells[i, k]);
  end;
  CloseFile(f);
end;

// процедура сохнаения изменений -->> добавление нового пользователя в файл
procedure SaveChanges;
var
  i: byte;
begin
  Rewrite(UserInfoFile); // открытие файла для записи
  for i := 1 to length(ArrayOfUsers) do
  begin
    write(UserInfoFile, ArrayOfUsers[i - 1]);
  end;
  CloseFile(UserInfoFile); // закрытие файла
end;

// загрузка плана расходов в таблицу
procedure LoadPlanSpend(UserIndex: Integer; Month: Integer; Year: Integer);
begin
  if length(ArrayOfUsers) > 0 then
  begin
    with frmMain.sgPlanSpend do
    begin
      cells[4, 1] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Products);
      cells[4, 2] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Alcohol);
      cells[4, 3] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Flat);
      cells[4, 4] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Internet);
      cells[4, 5] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.JKH);
      cells[4, 6] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Education);
      cells[4, 7] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Credit);
      cells[4, 8] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Clothes);
      cells[4, 9] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.DriveAway);
      cells[4, 10] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Beauty);
      cells[4, 11] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Health);
      cells[4, 12] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Journey);
      cells[4, 13] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Car);
      cells[4, 14] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Spend.Another);
    end;
  end;
end;

procedure LoadPlanEarn(UserIndex: Integer; Month: Integer; Year: Integer);
begin
  if length(ArrayOfUsers) > 0 then
  begin
    with frmMain.sgPlanEarn do
    begin
      cells[4, 1] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Earn.ZP);
      cells[4, 2] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Earn.Grant);
      cells[4, 3] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Earn.Compensation);
      cells[4, 4] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Earn.Rent);
      cells[4, 5] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Earn.Debt);
      cells[4, 6] := IntToStr(ArrayOfUsers[UserIndex].Plan[Month,
        Year].Earn.AnotherMoney);
    end;
  end;
end;

//
// ФАКТ-ПЛАН
procedure TfrmMain.CountPlanMinusFact(StringGrid: TStringGrid);
var
  i: Integer;
begin
  if length(ArrayOfUsers) > 0 then
  begin
    for i := 1 to StringGrid.RowCount - 1 do
    begin
      with StringGrid do
      begin
        cells[6, i] := IntToStr(strtoint(cells[4, i]) - strtoint(cells[5, i]));
      end;
    end;
  end;
end;

  procedure TfrmMain.ClearDiagram(PaintBox: TPaintBox);
begin
  paintboxReport.Width := 0;
  paintboxReport.Height := 0;
end;



procedure TfrmMain.cbFilterForDateClick(Sender: TObject);
begin
  cbUsers.ItemIndex := 0;
  if fMoneySpend then
  begin
    // загрузка данных из файла в таблицу расходов
    LoadStringGrid(sgMoneySpendTable, 1, './Money spend info.txt');
    FilterGridForDate(sgMoneySpendTable);
  end;

  if fMoneyEarn then
  begin
    // загрузка данных из файла в таблицу расходов
    LoadStringGrid(sgMoneyEarnTable, 2, './Money earn info.txt');
    FilterGridForDate(sgMoneyEarnTable);
  end;
end;

procedure TfrmMain.cbMonthSelect(Sender: TObject);
var
  i, UserIndex, Month, MyYear, Year, SumMoney: Integer;
begin
  for i := 0 to (sgPlanSpend.RowCount - 1) do
  begin
    sgPlanSpend.cells[3, i + 1] := cbMonth.Text; // месяц
  end;
  for i := 0 to (sgPlanEarn.RowCount - 1) do
  begin
    sgPlanEarn.cells[3, i + 1] := cbMonth.Text; // месяц
  end;
  Month := frmMain.cbMonth.ItemIndex + 1;
  Year := editYear.Value;
  lbPlanSpend.Caption := 'План расдохов:' + ' ' + cbMonth.Text;
  lbPlanEarn.Caption := 'План доходов:' + ' ' + cbMonth.Text;
  UserIndex := cbUsersReport.ItemIndex;
  // заполнение Расход/Доход (план)
  LoadPlanSpend(UserIndex, Month, Year);
  LoadPlanEarn(UserIndex, Month, Year);
  // заполнение Расход/Доход ( факт)
  LoadFactPlan(UserIndex);
  // подсчет и заполнение ПЛАН- ФАКТ
  CountPlanMinusFact(sgPlanSpend);
  CountPlanMinusFact(sgPlanEarn);
end;

procedure TfrmMain.LoadFactPlan(UserIndex: Integer);
var
  SearchDate: TDateTime;
  MyMonth, SumMoney, AllForMonth, MonthIndex, MyYear, Month, Year: Integer;
  YearNumb, MonthNumb, DayNumb, i: Word;
begin
  // установка текущего месяца
  DecodeDate(now, YearNumb, MonthNumb, DayNumb);

  // месяц для поиска
  MyMonth := cbMonth.ItemIndex + 1;
  MyYear := editYear.Value;
  SearchDate := EncodeDate(MyYear, MyMonth, 5);
  if length(ArrayOfUsers) > 0 then
  begin
    for i := 1 to (sgPlanSpend.RowCount - 1) do
    begin
      SumMoney := 0;
      SumMoney := SearchMoneyForMonth(sgMoneySpendTable, UserIndex,
        sgCategorySpendPlan[i], SearchDate);
      sgPlanSpend.cells[5, i] := IntToStr(SumMoney);
    end;
    for i := 1 to (sgPlanEarn.RowCount - 1) do
    begin
      SumMoney := 0;
      SumMoney := SearchMoneyForMonth(sgMoneyEarnTable, UserIndex,
        sgCategoryEarnPlan[i], SearchDate);
      sgPlanEarn.cells[5, i] := IntToStr(SumMoney);
    end;

  end;
end;

procedure TfrmMain.cbReportSelect(Sender: TObject);
const
  sgCategoryEarn: array [1 .. 7] of string = ('Заработная плата', 'Стипендия',
    'Пенсия', 'Сдача в аренду недвижимости', 'Взял в долг',
    'Доход от других источников', 'ИТОГ:(BYR)');
  sgCategorySpend: array [1 .. 15] of string = ('Продукты', 'Алкоголь',
    'Квартира', 'Мобильная связь, интернет', 'ЖКХ', 'Образование',
    'Кредит, долг', 'Одежда', 'Проезд', 'Красота', 'Здоровье', 'Путешествия',
    'Автомобиль', 'Другое', 'ИТОГ:(BYR)');
  sgCategoryErnMinusSpend: array [1 .. 3] of string = ('Доход', 'Расход',
    'ИТОГ:(BYR)');
var
  i: Integer;
begin
  paintboxReport.Width := 450;
  paintboxReport.Height := 450;
  Case cbReport.ItemIndex of
    // расходы
    0, 1, 2, 3, 4:
      begin
        with sgReportTable do
        begin
          RowCount := 16;
          Height := 789;
          // заполнение категорий расходов
          for i := 1 to 15 do
          begin
            cells[1, i] := sgCategorySpend[i];
          end;
        end;
        // перерерисовка таблицы
        sgReportTable.Refresh;
      end;

    // доходы
    5, 6, 7, 8, 9:
      begin
        with sgReportTable do
        begin
          RowCount := 8;
          Height := 396;
          // заполнение категорий доходов
          for i := 1 to 7 do
          begin
            cells[1, i] := sgCategoryEarn[i];
          end;
        end;
        // перерерисовка таблицы
        sgReportTable.Refresh;
      End;

    // Доход минус расход
    10:
      begin
        with sgReportTable do
        begin
          RowCount := 4;
          Height := 200;
          // заполнение категорий доходов
          for i := 1 to 3 do
          begin
            cells[1, i] := sgCategoryErnMinusSpend[i];
          end;
        end;
        // перерерисовка таблицы
        sgReportTable.Refresh;
      end;
  end;
  // перерисовка диаграммы
  paintboxReport.Invalidate;
end;

procedure TfrmMain.cbUsersReportSelect(Sender: TObject);
var
  i, UserIndex, Month, Year: Integer;
  UserName: string;
begin
  UserIndex := cbUsersReport.ItemIndex;
  Month := frmMain.cbMonth.ItemIndex + 1;
  Year := editYear.Value;
  UserName := cbUsersReport.Items[cbUsersReport.ItemIndex];

  for i := 0 to (sgPlanSpend.RowCount - 1) do
  begin
    sgPlanSpend.cells[0, i + 1].Empty;
    sgPlanSpend.cells[0, i + 1] := UserName; // пользователь
  end;
  for i := 0 to (sgPlanEarn.RowCount - 1) do
  begin
    sgPlanEarn.cells[0, i + 1].Empty;
    sgPlanEarn.cells[0, i + 1] := UserName; // пользователь
  end;
  // заполнение Расход/Доход (план)
  LoadPlanSpend(UserIndex, Month, Year);
  LoadPlanEarn(UserIndex, Month, Year);
  // заполнение Расход/Доход ( факт)
  LoadFactPlan(UserIndex);
  // подсчет и заполнение ПЛАН- ФАКТ
  CountPlanMinusFact(sgPlanSpend);
  CountPlanMinusFact(sgPlanEarn);
end;

procedure TfrmMain.cbUsersSelect(Sender: TObject);
begin
  if fMoneySpend then // таблица расходов
  begin
    // загрузка данных из файла в таблицу расходов
    LoadStringGrid(sgMoneySpendTable, 1, './Money spend info.txt');
    SortGridForUser(sgMoneySpendTable);
    cbFilterForDate.Checked := false;
  end;
  if fMoneyEarn then // таблица доходов
  begin
    // загрузка данных из файла в таблицу доходов
    LoadStringGrid(sgMoneyEarnTable, 2, './Money earn info.txt');
    SortGridForUser(sgMoneyEarnTable);
    cbFilterForDate.Checked := false;
  end;
end;

procedure TfrmMain.SortGridForUser(StringGrid: TStringGrid);
var
  UserIndex, i, j: byte;
  TrueUserIndex: Integer; // нужные пользователи
  FalseUsersCount: Integer; // кол-во удаленных строк
  RowLength: Integer;

begin
  RowLength := StringGrid.RowCount;
  UserIndex := cbUsers.ItemIndex;
  TrueUserIndex := 0;
  FalseUsersCount := 0;

  if (UserIndex > 0) then
  begin
    for i := 1 to RowLength - 1 do
    begin
      if cbUsers.Text = StringGrid.cells[1, i] then
      begin
        if StringGrid.cells[1, i - 1] = '' then
        begin
          for j := 0 to 6 do
          begin
            StringGrid.cells[j, TrueUserIndex + 1] := StringGrid.cells[j, i];
          end;
          StringGrid.Rows[i].Clear;
          inc(TrueUserIndex);
        end
        else
          TrueUserIndex := i;
      end
      else
      begin
        StringGrid.Rows[i].Clear;
        inc(FalseUsersCount);
      end;
    end;
    StringGrid.RowCount := StringGrid.RowCount - FalseUsersCount;
  end;

end;

// ------------------------------------------------------------------
// процедуры верхнего меню


procedure TfrmMain.DeleteMoney(StringGrid: TStringGrid; TableNumb: Integer);
var
  i: Integer;
begin
  for i := 1 to StringGrid.RowCount - 1 do
  begin
    if IsCellSelected(StringGrid, 0, i) then
    begin
      if TableNumb = 1 then
        DeleteMoneySpendFromArray(i)
      else
        DeleteMoneyEarnFromArray(i);
      DelRow(StringGrid);
    end;
  end;
  if TableNumb = 1 then
    SaveStringGrid(sgMoneySpendTable, './Money spend info.txt')
  else
    SaveStringGrid(sgMoneyEarnTable, './Money earn info.txt');
end;

procedure TfrmMain.DeleteMoneySpendFromArray(i: Integer);
var
  k, j: Integer;
  UserName: string;
begin
  for j := 0 to length(ArrayOfUsers) - 1 do
  begin
    UserName := ArrayOfUsers[j].Name + ' ' + ArrayOfUsers[j].Surname;
    with sgMoneySpendTable do
    begin
      if cells[1, i] = UserName then
      begin
        for k := 1 to length(sgCategorySpendPlan) do
        begin
          if cells[0, i] = sgCategorySpendPlan[k] then
            case k of
              1:
                ArrayOfUsers[j].MoneySpend.Products :=
                  ArrayOfUsers[j].MoneySpend.Products - strtoint(cells[6, i]);
              2:
                ArrayOfUsers[j].MoneySpend.Alcohol :=
                  ArrayOfUsers[j].MoneySpend.Alcohol - strtoint(cells[6, i]);
              3:
                ArrayOfUsers[j].MoneySpend.Flat :=
                  ArrayOfUsers[j].MoneySpend.Flat - strtoint(cells[6, i]);
              4:
                ArrayOfUsers[j].MoneySpend.Internet :=
                  ArrayOfUsers[j].MoneySpend.Internet - strtoint(cells[6, i]);
              5:
                ArrayOfUsers[j].MoneySpend.JKH := ArrayOfUsers[j].MoneySpend.JKH
                  - strtoint(cells[6, i]);
              6:
                ArrayOfUsers[j].MoneySpend.Education :=
                  ArrayOfUsers[j].MoneySpend.Education - strtoint(cells[6, i]);
              7:
                ArrayOfUsers[j].MoneySpend.Credit :=
                  ArrayOfUsers[j].MoneySpend.Credit - strtoint(cells[6, i]);
              8:
                ArrayOfUsers[j].MoneySpend.Clothes :=
                  ArrayOfUsers[j].MoneySpend.Clothes - strtoint(cells[6, i]);
              9:
                ArrayOfUsers[j].MoneySpend.DriveAway :=
                  ArrayOfUsers[j].MoneySpend.DriveAway - strtoint(cells[6, i]);
              10:
                ArrayOfUsers[j].MoneySpend.Beauty :=
                  ArrayOfUsers[j].MoneySpend.Beauty - strtoint(cells[6, i]);
              11:
                ArrayOfUsers[j].MoneySpend.Health :=
                  ArrayOfUsers[j].MoneySpend.Health - strtoint(cells[6, i]);
              12:
                ArrayOfUsers[j].MoneySpend.Journey :=
                  ArrayOfUsers[j].MoneySpend.Journey - strtoint(cells[6, i]);
              13:
                ArrayOfUsers[j].MoneySpend.Car := ArrayOfUsers[j].MoneySpend.Car
                  - strtoint(cells[6, i]);
              14:
                ArrayOfUsers[j].MoneySpend.Another :=
                  ArrayOfUsers[j].MoneySpend.Another - strtoint(cells[6, i]);
            end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.DeleteMoneyEarnFromArray(i: Integer);
var
  k, j: Integer;
  UserName: string;
begin
  for j := 0 to length(ArrayOfUsers) - 1 do
  begin
    UserName := ArrayOfUsers[j].Name + ' ' + ArrayOfUsers[j].Surname;
    with sgMoneyEarnTable do
    begin
      if cells[1, i] = UserName then
      begin
        for k := 1 to length(sgCategoryEarnPlan) do
        begin
          if cells[0, i] = sgCategoryEarnPlan[k] then
            case k of
              1:
                ArrayOfUsers[j].MoneyEarn.ZP := ArrayOfUsers[j].MoneyEarn.ZP -
                  strtoint(cells[6, i]);
              2:
                ArrayOfUsers[j].MoneyEarn.Grant :=
                  ArrayOfUsers[j].MoneyEarn.Grant - strtoint(cells[6, i]);
              3:
                ArrayOfUsers[j].MoneyEarn.Compensation :=
                  ArrayOfUsers[j].MoneyEarn.Compensation -
                  strtoint(cells[6, i]);
              4:
                ArrayOfUsers[j].MoneyEarn.Rent := ArrayOfUsers[j].MoneyEarn.Rent
                  - strtoint(cells[6, i]);
              5:
                ArrayOfUsers[j].MoneyEarn.Debt := ArrayOfUsers[j].MoneyEarn.Debt
                  - strtoint(cells[6, i]);
              6:
                ArrayOfUsers[j].MoneyEarn.AnotherMoney :=
                  ArrayOfUsers[j].MoneyEarn.AnotherMoney -
                  strtoint(cells[6, i]);
            end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.pnlDeleteUserBtnClick(Sender: TObject);
var
  i, j: Integer;
  UserIndex: Integer;
begin
  if length(ArrayOfUsers) > 0 then
  begin
    // проверка выбран ли пользователь
    for j := 0 to listboxUsers.Count - 1 do
    begin
      if listboxUsers.Selected[j] then
      begin
        // индекс выбранного пользователя
        UserIndex := listboxUsers.ItemIndex;
        // удаление пользователя из массива
        for i := UserIndex to length(ArrayOfUsers) - 2 do
        begin
          ArrayOfUsers[i] := ArrayOfUsers[i + 1];
        end;
      end;
    end;

    // изменение длины массива
    SetLength(ArrayOfUsers, length(ArrayOfUsers) - 1);
    // удаление из таблицы расходов/доходов
    DeletUserFromTable(sgMoneySpendTable, UserIndex);
    DeletUserFromTable(sgMoneyEarnTable, UserIndex);
    // удаление из комбобоксов
    cbUsers.Items.Delete(UserIndex + 1);
    cbUsersReport.Items.Delete(UserIndex);
    frmAddMoney.cbUsersModalUnit.Items.Delete(UserIndex);
    // удаление выделенного пользователя из листбокса пользователей
    listboxUsers.DeleteSelected;
    // очистка таблицы счетов
    sgUsersBills.RowCount := 1;
    // очистка таблиц планов
    for i := 1 to sgPlanSpend.RowCount - 1 do
      sgPlanSpend.Rows[i].Clear;
    for i := 1 to sgPlanEarn.RowCount - 1 do
      sgPlanEarn.Rows[i].Clear;

    // сохранение изменений в таблицах  расходов/доходов
    SaveStringGrid(sgMoneySpendTable, './Money spend info.txt');
    SaveStringGrid(sgMoneyEarnTable, './Money earn info.txt');
    // перезаписываю пользователей в файл с учетом удаленного
    SaveChanges;

  end;
end;

procedure TfrmMain.DeletUserFromTable(StringGrid: TStringGrid;
  UserIndex: Integer);
var
  i: Integer;
begin
  // UserIndex:= listboxUsers.ItemIndex;
  i := 1;
  // цикл пока по всем строкам таблицы
  while i <= StringGrid.RowCount - 1 do
  begin
    // если яейка с именем пользователя совпадает с выбранным для удаления пользователем
    if StringGrid.cells[1, i] = cbUsers.Items[UserIndex + 1] then
    begin
      // выделение всей строки
      StringGrid.Selection := TGridRect(Rect(0, i, 6, i));
      // удаление выделенной строки
      DelRow(StringGrid);
      dec(i);
    end;
    inc(i);
  end;
end;

procedure TfrmMain.pnlHelpClick(Sender: TObject);
begin

  // диаграмма очистка
  ClearDiagram(paintboxReport);
  // видимые компоненты
  HelpVisible(true);
  AboutVisible(true);
  // невидимые комопненты
  lbUserName.Visible := false;
  UsersVisible(false);
  MoneySpendVisible(false);
  MoneyEarnVisible(false);
  ReportVisible(false);
  PlansVisible(false);
  FeaturesVisible(false);
  UserBillVisible(false);
  AboutSpendVisible(false);
  AboutEarn.BevelOuter := bvRaised;

  cbUsers.Visible := false;
  pnlAddBtn.Visible := false;
  pnlDeleteBtn.Visible := false;
end;

// процедура загрузки данных пользователей из файла в динамический массив
procedure TfrmMain.LoadUsers;
var
  i: byte;
begin
  Reset(UserInfoFile); // открытие файла для чтения
  i := 0;
  while not(eof(UserInfoFile)) do
  begin
    seek(UserInfoFile, i); // определение позиции в файле для чтения
    SetLength(ArrayOfUsers, length(ArrayOfUsers) + 1);
    // увеличение длины массива
    read(UserInfoFile, ArrayOfUsers[i]); // запись данныe в массив из файла
    inc(i);
  end;
  CloseFile(UserInfoFile); // закрытие файла
end;

// процедура проверки выделенной ячейки таблицы
function TfrmMain.IsCellSelected(StringGrid: TStringGrid;
  X, Y: Longint): Boolean;
begin
  Result := false;
  try
    if (X >= StringGrid.Selection.Left) and (X <= StringGrid.Selection.Right)
      and (Y >= StringGrid.Selection.Top) and (Y <= StringGrid.Selection.Bottom)
    then
      Result := true;
  except
  end;
end;

procedure TfrmMain.listboxUsersClick(Sender: TObject);
var
  i, j: Integer;
  UserName: string;
  BillName: string;
  sumSpend, sumEarn: Integer;
begin
  // очистка таблицы счетов
  sgUsersBills.RowCount := 1;
  // загрузка данных в таблицу счетов
  with frmAddUserInfo do
    LoadUsersBills(sgUsersBills);
  // присвоение переменной Имя Пользователя
  UserName := ArrayOfUsers[listboxUsers.ItemIndex].Name + ' ' + ArrayOfUsers
    [listboxUsers.ItemIndex].Surname;
  i := 0;
  while (ArrayOfUsers[listboxUsers.ItemIndex].Bill[i].BillName <> '') and
    (i <= 9) do
  begin
    // присвоение переменной Название счета
    BillName := ArrayOfUsers[listboxUsers.ItemIndex].Bill[i].BillName;
    sumSpend := SumAllForOneUsersBill(sgMoneySpendTable, BillName, UserName);
    // расход
    sumEarn := SumAllForOneUsersBill(sgMoneyEarnTable, BillName, UserName);
    // доход
    // запись в таблицу счетов в колонну остаток
    sgUsersBills.cells[2, i + 1] := IntToStr(sumEarn - sumSpend);
    // Доход-Расход
    inc(i);
  end;
end;

// ------------------------------------------------------------------
// функция нахождения суммы дохода/ расхода для определенного пользователя и счета
function TfrmMain.SumAllForOneUsersBill(StringGrid: TStringGrid;
  BillName: string; UserName: string): Integer;
var
  i: Integer;
  sum: Integer;
  cellBill, cellSum, cellUserName: Integer;
begin
  // инициализация суммы
  sum := 0;
  // 3 столбец - название счета
  cellBill := 2;
  // 7 столбец - сумма
  cellSum := 6;
  // 2 столбец- название пользователя
  cellUserName := 1;

  // загрузка таблицы
  for i := 1 to StringGrid.RowCount - 1 do
  begin
    if (StringGrid.cells[cellUserName, i] = UserName) and
      (StringGrid.cells[cellBill, i] = BillName) then
    begin
      sum := sum + strtoint(StringGrid.cells[cellSum, i]);
    end;
  end;
  // возврашаю значение суммы
  Result := sum;
end;

// процедура удаления строки
procedure TfrmMain.DelRow(StringGrid: TStringGrid);
var
  n: Integer;
begin
  // Если осталась одна строка, операцию удаления не выполнять
  if (StringGrid.RowCount = 1) then
    exit;
  // Сдвиг строки вверх, начиная со строки, содержащей выделенную
  for n := StringGrid.Row to StringGrid.RowCount - 2 do
  begin
    StringGrid.Rows[n] := StringGrid.Rows[n + 1];
  end;
  // Удаление последней строки таблицы
  StringGrid.RowCount := StringGrid.RowCount - 1;
end;

// процедура загрузки счетов пользователей в таблицу
procedure LoadUsersBills(StringGrid: TStringGrid);
var
  i: Integer;
begin
  i := 0;
  while (ArrayOfUsers[frmMain.listboxUsers.ItemIndex].Bill[i].BillName <> '')
    and (i <= 9) do
  begin
    StringGrid.RowCount := StringGrid.RowCount + 1;
    StringGrid.cells[0, i + 1] := ArrayOfUsers[frmMain.listboxUsers.ItemIndex]
      .Bill[i].BillName;
    StringGrid.cells[1, i + 1] := ArrayOfUsers[frmMain.listboxUsers.ItemIndex]
      .Bill[i].Valuta;
    StringGrid.cells[2, i + 1] := IntToStr(0);;
    inc(i);
  end;
end;

// функция подсчета общей суммы всех расходов для 1 пользователя
function SumAllMoneySpend(UserNumb: Integer): Integer;
var
  sum: Integer;
begin
  sum := 0;
  with ArrayOfUsers[UserNumb].MoneySpend do
  begin
    sum := (Products + Alcohol + Clothes + Flat + Health + Internet + Beauty +
      DriveAway + Education + Journey + JKH + Car + Credit + Another);
  end;
  Result := sum;
end;

// функция подсчета общей суммы всех доходов для 1 пользователя
function SumAllMoneyEarn(UserNumb: Integer): Integer;
var
  sum: Integer;
begin
  sum := 0;
  with ArrayOfUsers[UserNumb].MoneyEarn do
  begin
    sum := (ZP + Grant + Rent + Debt + Compensation + AnotherMoney);
  end;
  Result := sum;
end;

// функция подсчета процента категории от общей суммы
function CountProcent(var AllMoney: Integer; Category: Integer): real;
begin
  Result := (Category / AllMoney) * 2 * pi;
end;

// ------------------------------------------------------------
// процедура отрисовки сектора диаграммы
procedure TfrmMain.sector(clr: TColor; angle1, angle2: real);
Var
  x1, x2, y1, y2: Integer;
begin
  // очистка цвета кисти
  if (angle1 <> angle2) then
  begin
    paintboxReport.Canvas.Brush.Color := clr;
    x1 := trunc(cos(angle1) * paintboxReport.Width / 2 +
      paintboxReport.Width / 2);
    y1 := paintboxReport.Height - trunc(sin(angle1) * paintboxReport.Height / 2
      + paintboxReport.Height / 2);
    x2 := trunc(cos(angle2) * paintboxReport.Width / 2 +
      paintboxReport.Width / 2);
    y2 := paintboxReport.Height - trunc(sin(angle2) * paintboxReport.Height / 2
      + paintboxReport.Height / 2);
    // рисует сектор окружности
    paintboxReport.Canvas.Pie(0, 0, paintboxReport.Width, paintboxReport.Height,
      x1, y1, x2, y2);
  end;
end;

// процедуры рисования диаграммы
procedure TfrmMain.paintboxReportPaint(Sender: TObject);
const
  sgCategorySpend: array [0 .. 14] of string = ('Продукты', 'Алкоголь',
    'Квартира', 'Мобильная связь, интернет', 'ЖКХ', 'Образование',
    'Кредит, долг', 'Одежда', 'Проезд', 'Красота', 'Здоровье', 'Путешествия',
    'Автомобиль', 'Другое', 'ИТОГ:');
  sgCategoryEarn: array [1 .. 7] of string = ('Заработная плата', 'Стипендия',
    'Пенсия', 'Сдача в аренду недвижимости', 'Взял в долг',
    'Доход от других источников', 'ИТОГ:');
  sgCategoryErnMinusSpend: array [1 .. 2] of string = ('Доход', 'Расход');
var
  AllMoneySpend, AllMoneyEarn, AllMoney: Integer;
  i: Integer;
  procentEarn, procentSpend, Temp: real;
  SumMoney: Integer;
  CurrentDate, LastMonth: TDateTime;
begin
  if (length(ArrayOfUsers) > 0) then
  begin
    AllMoneyEarn := 0;
    AllMoneySpend := 0;
    AllMoney := 0;
    i := cbUsersReport.ItemIndex;
    // подсчет дохода за все время для 1 пользователя
    AllMoneyEarn := SumAllMoneyEarn(i);
    AllMoneySpend := SumAllMoneySpend(i);

    case cbReport.ItemIndex of
      0:
        begin
          // расходы за день
          LoadGridForOneDay(sgMoneySpendTable, i, sgCategorySpend);
          AllMoney := strtoint(sgReportTable.cells[2, 15]);
          DrawAllMoneySpendForAllTime(AllMoney, i, 2);
        end;

      1:
        begin
          // расходы за неделю
          LoadGridForOneWeek(sgMoneySpendTable, i, sgCategorySpend);
          AllMoney := strtoint(sgReportTable.cells[2, 15]);
          DrawAllMoneySpendForAllTime(AllMoney, i, 2);
        end;

      2:
        begin
          // расходы за месяц ( текущий)
          CurrentDate := Date;
          LoadGridForMonth(sgMoneySpendTable, i, sgCategorySpend, CurrentDate);
          AllMoney := strtoint(sgReportTable.cells[2, 15]);
          DrawAllMoneySpendForAllTime(AllMoney, i, 2);
        end;
      3:
        begin
          // расходы за месяц ( прошлый)
          CurrentDate := Date;
          LastMonth := IncMonth(CurrentDate, -1);
          LoadGridForMonth(sgMoneySpendTable, i, sgCategorySpend, LastMonth);
          AllMoney := strtoint(sgReportTable.cells[2, 15]);
          DrawAllMoneySpendForAllTime(AllMoney, i, 2);
        end;

      4:
        begin
          // расход за все время
          DrawAllMoneySpendForAllTime(AllMoneySpend, i, 1);
          // отрисовка диаграммы
          LoadReportGridMoneySpend(AllMoneySpend, i);
          // загрузка данных в таблицу
        end;

      5:
        begin
          // доходы за день
          LoadGridForOneDay(sgMoneyEarnTable, i, sgCategoryEarn);
          AllMoney := strtoint(sgReportTable.cells[2, 7]);
          DrawAllMoneyEarnForAllTime(AllMoney, i, 2);
        end;

      6:

        begin
          // доходы за неделю
          LoadGridForOneWeek(sgMoneyEarnTable, i, sgCategoryEarn);
          AllMoney := strtoint(sgReportTable.cells[2, 7]);
          DrawAllMoneyEarnForAllTime(AllMoney, i, 2);
        end;
      7:
        begin
          // доходы за месяц ( текущий)
          CurrentDate := Date;
          LoadGridForMonth(sgMoneyEarnTable, i, sgCategoryEarn, CurrentDate);
          AllMoney := strtoint(sgReportTable.cells[2, 7]);
          DrawAllMoneyEarnForAllTime(AllMoney, i, 2);
        end;

      8:
        begin
          // доходы за месяц ( прошлый)
          CurrentDate := Date;
          LastMonth := IncMonth(CurrentDate, -1);
          LoadGridForMonth(sgMoneyEarnTable, i, sgCategoryEarn, LastMonth);
          AllMoney := strtoint(sgReportTable.cells[2, 7]);
          DrawAllMoneyEarnForAllTime(AllMoney, i, 2);
        end;

      9:
        begin
          // доход за все время
          DrawAllMoneyEarnForAllTime(AllMoneyEarn, i, 1); // отрисовка диаграммы
          LoadReportGridMoneyEarn(AllMoneyEarn, i); // загрузка данных в таблицу
        end;

      10:
        begin
          // доход минус расход
          AllMoney := AllMoneyEarn + AllMoneySpend;
          // подсчет процентов
          procentEarn := CountProcent(AllMoney, AllMoneyEarn);
          procentSpend := CountProcent(AllMoney, AllMoneySpend);
          Temp := 0;
          // отрисовка секторов исходя из проценов( градусов угла)
          sector(Rgb(255, 215, 0), 0, Temp + procentEarn);
          Temp := Temp + procentEarn;
          sector(Rgb(0, 191, 255), Temp, Temp + procentSpend);
          with sgReportTable do
          begin
            cells[2, 1] := IntToStr(AllMoneyEarn);
            cells[2, 2] := IntToStr(AllMoneySpend);
            cells[2, 3] := IntToStr(AllMoneyEarn - AllMoneySpend);
          end;
        end;
    end;
  end;
end;

procedure TfrmMain.LoadGridForOneDay(var StringGrid: TStringGrid;
  UserIndex: Integer; Category: array of string);
var
  AllForDay, j, SumMoney: Integer;
begin
  // инициализация переменной для суммы всех расходов за день
  AllForDay := 0;
  // добавлениие расходов за день в таблицу отчета по категориям
  for j := 0 to (length(Category)) - 1 do
  begin
    SumMoney := 0;
    SumMoney := SearchMoneyForToday(StringGrid, UserIndex, Category[j]);
    AllForDay := AllForDay + SumMoney;
    sgReportTable.cells[2, j + 1] := IntToStr(SumMoney);
  end;
  sgReportTable.cells[2, length(Category)] := IntToStr(AllForDay);
end;

// процедуры загрузки всех доходов/расходов в таблицу отчета
procedure TfrmMain.LoadReportGridMoneyEarn(var AllMoney: Integer;
  UserIndex: Integer);
begin
  with sgReportTable do
  begin
    cells[2, 1] := IntToStr(ArrayOfUsers[UserIndex].MoneyEarn.ZP);
    cells[2, 2] := IntToStr(ArrayOfUsers[UserIndex].MoneyEarn.Grant);
    cells[2, 3] := IntToStr(ArrayOfUsers[UserIndex].MoneyEarn.Compensation);
    cells[2, 4] := IntToStr(ArrayOfUsers[UserIndex].MoneyEarn.Rent);
    cells[2, 5] := IntToStr(ArrayOfUsers[UserIndex].MoneyEarn.Debt);
    cells[2, 6] := IntToStr(ArrayOfUsers[UserIndex].MoneyEarn.AnotherMoney);
    cells[2, 7] := IntToStr(AllMoney);
  end;
end;

procedure TfrmMain.LoadReportGridMoneySpend(var AllMoney: Integer;
  UserIndex: Integer);
begin
  with sgReportTable do
  begin
    cells[2, 1] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Products);
    cells[2, 2] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Alcohol);
    cells[2, 3] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Flat);
    cells[2, 4] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Internet);
    cells[2, 5] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.JKH);
    cells[2, 6] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Education);
    cells[2, 7] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Credit);
    cells[2, 8] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Clothes);
    cells[2, 9] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.DriveAway);
    cells[2, 10] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Beauty);
    cells[2, 11] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Health);
    cells[2, 12] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Journey);
    cells[2, 13] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Car);
    cells[2, 14] := IntToStr(ArrayOfUsers[UserIndex].MoneySpend.Another);
    cells[2, 15] := IntToStr(AllMoney);
  end;
end;

// функция отрисовки всех доходов пользователя за все время по категориям
procedure TfrmMain.DrawAllMoneyEarnForAllTime(var AllMoney: Integer;
  UserIndex: Integer; kind: Integer);
var
  procentZp, procentGrant, procentRent, procentDebt, procentCompensation,
    procentAnotherMoney: real;
  Temp: real;
begin
  procentZp := 0;
  procentGrant := 0;
  procentRent := 0;
  procentDebt := 0;
  procentCompensation := 0;
  procentAnotherMoney := 0;

  if AllMoney > 0 then
  // подсчет процента категории от общего дохода = градус сектора
  // kind = выбор - считаю по массиву или таблице
  begin
    case kind of
      1:
        begin
          // зарпалата
          procentZp := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneyEarn.ZP);
          // стипендия
          procentGrant := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneyEarn.Grant);
          // пенсия
          procentCompensation := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneyEarn.Compensation);
          // сдача в аренду
          procentRent := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneyEarn.Rent);
          // взял в долг
          procentDebt := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneyEarn.Debt);
          // другое
          procentAnotherMoney := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneyEarn.AnotherMoney);
        end;
      2:
        begin
          // зарпалата
          procentZp := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 1]));
          // стипендия
          procentGrant := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 2]));
          // пенсия
          procentCompensation := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 3]));
          // сдача в аренду
          procentRent := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 4]));
          // взял в долг
          procentDebt := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 5]));
          // другое
          procentAnotherMoney := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 6]));
        end;
    end;

    Temp := 0;
    // отрисовка секторов исходя из проценов( градусов угла)
    // зп    ( голубой)
    sector(Rgb(127, 255, 212), 0, Temp + procentZp);
    Temp := Temp + procentZp;
    // стипендия ( синий)
    sector(Rgb(0, 191, 255), Temp, Temp + procentGrant);
    Temp := Temp + procentGrant;
    // пенсия    ( розовый)
    sector(Rgb(255, 0, 255), Temp, Temp + procentCompensation);
    Temp := Temp + procentCompensation;
    // аренда
    sector(Rgb(255, 215, 0), Temp, Temp + procentRent);
    Temp := Temp + procentRent;
    // долг    ( ораньжевый)
    sector(Rgb(255, 69, 0), Temp, Temp + procentDebt);
    Temp := Temp + procentDebt;
    // другоe  ( феолетовый)
    sector(Rgb(147, 112, 219), Temp, Temp + procentAnotherMoney);
  end
  else
    sector(Rgb(255, 255, 255), 0, 2 * pi);
end;

// фукнция поиска доходов/расходов по текущ. дате и нахождение их суммы
function TfrmMain.SearchMoneyForToday(StringGrid: TStringGrid;
  UserIndex: Integer; Category: string): Integer;
var
  i, sum: Integer;
  UserName: string;
  CurrentDate: TDateTime;
  ConvertIndex: real;
begin
  sum := 0;
  // установка текущей даты
  CurrentDate := Date;
  // имя фамилия искомого пользователя
  UserName := (ArrayOfUsers[UserIndex].Name + ' ' + ArrayOfUsers
    [UserIndex].Surname);
  // цикл по всей таблице
  for i := 1 to StringGrid.RowCount - 1 do
  begin
    with StringGrid do
    begin
      // поиск нужного пользователя и категории и даты
      if (cells[1, i] = UserName) and (cells[0, i] = Category) and
        (StrToDate(cells[3, i]) = CurrentDate) then
      begin
        if cells[5, i] = 'USD' then
        begin
          ConvertIndex := 2.40;
        end
        else
        begin
          if cells[5, i] = 'RUB' then
            ConvertIndex := 0.034
          else
            ConvertIndex := 1;
        end;
        sum := sum + round(strtoint(cells[6, i]) * ConvertIndex);
      end;
    end;
  end;
  Result := sum;
end;

// фукнция поиска доходов/расходов по текущ. дате и нахождение их суммы
function TfrmMain.SearchMoneyForWeek(StringGrid: TStringGrid;
  UserIndex: Integer; Category: string): Integer;
var
  i, sum: Integer;
  UserName: string;
  ConvertIndex: real;
  CurrentDate, StartDate, FinishDate, TableDate: TDateTime;
begin
  // сумма
  sum := 0;

  // установка текущей даты
  CurrentDate := Date;
  case DayOfTheWeek(CurrentDate) of
    1:
      begin
        StartDate := CurrentDate;
        FinishDate := IncDay(CurrentDate, 6);
      end;
    2:
      begin
        StartDate := IncDay(CurrentDate, -1);
        FinishDate := IncDay(CurrentDate, 5);
      end;
    3:
      begin
        StartDate := IncDay(CurrentDate, -2);
        FinishDate := IncDay(CurrentDate, 4);
      end;
    4:
      begin
        StartDate := IncDay(CurrentDate, -3);
        FinishDate := IncDay(CurrentDate, 3);
      end;
    5:
      begin
        StartDate := IncDay(CurrentDate, -5);
        FinishDate := IncDay(CurrentDate, 2);
      end;
    6:
      begin
        StartDate := IncDay(CurrentDate, -6);
        FinishDate := IncDay(CurrentDate, 1);
      end;
    7:
      begin
        StartDate := IncDay(CurrentDate, -7);
        FinishDate := CurrentDate;
      end;
  end;

  // имя фамилия искомого пользователя
  UserName := (ArrayOfUsers[UserIndex].Name + ' ' + ArrayOfUsers
    [UserIndex].Surname);
  // цикл по всей таблице
  for i := 1 to StringGrid.RowCount - 1 do
  begin
    with StringGrid do
    begin
      TableDate := StrToDate(cells[3, i]);
      // поиск нужного пользователя и категории и даты
      if (cells[1, i] = UserName) and (cells[0, i] = Category) and
        (TableDate <= FinishDate) and (TableDate >= StartDate) then
      begin
        if cells[5, i] = 'USD' then
        begin
          ConvertIndex := 2.40;
        end
        else
        begin
          if cells[5, i] = 'RUB' then
            ConvertIndex := 0.034
          else
            ConvertIndex := 1;
        end;
        sum := sum + round(strtoint(cells[6, i]) * ConvertIndex);
      end;
    end;
  end;
  Result := sum;
end;

procedure TfrmMain.LoadGridForOneWeek(var StringGrid: TStringGrid;
  UserIndex: Integer; Category: array of string);
var
  AllForWeek, j, SumMoney: Integer;
begin
  // инициализация переменной для суммы всех расходов за неделю
  AllForWeek := 0;
  // добавлениие расходов за день в таблицу отчета по категориям
  for j := 0 to (length(Category)) - 1 do
  begin
    SumMoney := 0;
    SumMoney := SearchMoneyForWeek(StringGrid, UserIndex, Category[j]);
    AllForWeek := AllForWeek + SumMoney;
    sgReportTable.cells[2, j + 1] := IntToStr(SumMoney);
  end;
  sgReportTable.cells[2, length(Category)] := IntToStr(AllForWeek);
end;

procedure TfrmMain.LoadGridForMonth(var StringGrid: TStringGrid;
  UserIndex: Integer; Category: array of string; MyDate: TDateTime);
var
  AllForMonth, j, SumMoney: Integer;
begin
  // инициализация переменной для суммы всех расходов за месяц
  AllForMonth := 0;
  // добавлениие расходов за день в таблицу отчета по категориям
  for j := 0 to (length(Category)) - 1 do
  begin
    SumMoney := 0;
    SumMoney := SearchMoneyForMonth(StringGrid, UserIndex, Category[j], MyDate);
    AllForMonth := AllForMonth + SumMoney;
    sgReportTable.cells[2, j + 1] := IntToStr(SumMoney);
  end;
  sgReportTable.cells[2, length(Category)] := IntToStr(AllForMonth);
end;

function TfrmMain.SearchMoneyForMonth(var StringGrid: TStringGrid;
  UserIndex: Integer; Category: string; MyDate: TDateTime): Integer;
var
  StartDate, FinishDate, TableDate: TDateTime;
  MyYear, MyMonth, myDay, i: Word;
  UserName: string;
  ConvertIndex: real;
  sum, DayCount: Integer;
begin
  DayCount := 0;
  DecodeDate(MyDate, MyYear, MyMonth, myDay);

  // вычисление кол-ва дней в месяце
  case MyMonth of
    1, 3, 5, 7, 8, 10, 12: // 31 день
      begin
        DayCount := 30;
      end;
    4, 6, 9, 11: // 30 дней
      begin
        DayCount := 31;
      end;
    2: // февраль
      begin
        if MyYear div 4 = 0 then
          DayCount := 28
        else
          DayCount := 27;
      end;
  end;

  // вычисление первого и последнего дня искомого месяца
  StartDate := EncodeDate(MyYear, MyMonth, 1);
  FinishDate := IncDay(StartDate, DayCount);
  sum := 0;
  // имя фамилия искомого пользователя
  UserName := (ArrayOfUsers[UserIndex].Name + ' ' + ArrayOfUsers
    [UserIndex].Surname);
  // цикл по всей таблице
  for i := 1 to StringGrid.RowCount - 1 do
  begin
    with StringGrid do
    begin
      TableDate := StrToDate(cells[3, i]);
      // поиск нужного пользователя и категории и даты
      if (cells[1, i] = UserName) and (cells[0, i] = Category) and
        (TableDate < FinishDate) and (TableDate > StartDate) then
      begin
        if cells[5, i] = 'USD' then
        begin
          ConvertIndex := 2.40;
        end
        else
        begin
          if cells[5, i] = 'RUB' then
            ConvertIndex := 0.034
          else
            ConvertIndex := 1;
        end;
        sum := sum + round(strtoint(cells[6, i]) * ConvertIndex);
      end;
    end;
  end;
  Result := sum;
end;

// функция отрисовки всех расходов пользователя за все время по категориям
procedure TfrmMain.DrawAllMoneySpendForAllTime(var AllMoney: Integer;
  UserIndex: Integer; kind: Integer);
var
  procentProducts, procentAlcohol, procentClothes, procentFlat, procentHealth,
    procentInternet, procentBeauty, procentDriveAway, procentEducation,
    procentJourney, procentJKH, procentCar, procentCredit, procentAnother: real;
  Temp: real;
begin
   procentProducts:=0;
   procentAlcohol:=0;
   procentClothes:=0;
   procentFlat:=0;
   procentHealth:=0;
   procentInternet:=0;
   procentBeauty:=0;
   procentDriveAway:=0;
   procentEducation:=0;
   procentJourney:=0;
   procentJKH:=0;
   procentCar:=0;
   procentCredit:=0;
   procentAnother:=0;

  if AllMoney > 0 then
  begin
    case kind of
      1:
        begin
          // подсчет процента категории от общего дохода = градус сектора
          // продукты
          procentProducts := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Products);
          // алкоголь
          procentAlcohol := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Alcohol);
          // одежда
          procentClothes := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Clothes);
          // квартира
          procentFlat := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Flat);
          // здоровье
          procentHealth := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Health);
          // интернет, моб. связь
          procentInternet := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Internet);
          // красота
          procentBeauty := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Beauty);
          // проезд
          procentDriveAway := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.DriveAway);
          // образование
          procentEducation := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Education);
          // путешествие
          procentJourney := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Journey);
          // ЖКХ
          procentJKH := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.JKH);
          // машина
          procentCar := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Car);
          // кредит
          procentCredit := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Credit);
          // другое
          procentAnother := CountProcent(AllMoney,
            ArrayOfUsers[UserIndex].MoneySpend.Another);
        end;
      2:
        begin
          // продукты
          procentProducts := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 1]));
          // алкоголь
          procentAlcohol := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 2]));
          // квартира
          procentFlat := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 3]));
          // интернет, моб. связь
          procentInternet := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 4]));
          // ЖКХ
          procentJKH := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 5]));
          // образование
          procentEducation := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 6]));
          // кредит
          procentCredit := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 7]));
          // одежда
          procentClothes := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 8]));
          // проезд
          procentDriveAway := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 9]));
          // красота
          procentBeauty := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 10]));
          // здоровье
          procentHealth := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 11]));
          // путешествие
          procentJourney := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 12]));
          // машина
          procentCar := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 13]));
          // другое
          procentAnother := CountProcent(AllMoney,
            strtoint(sgReportTable.cells[2, 14]));
        end;

    end;

    Temp := 0;
    // отрисовка секторов исходя из проценов( градусов угла)
    // продукты  ( фиолетовый темный)
    sector(Rgb(116, 36, 244), 0, Temp + procentProducts);
    Temp := Temp + procentProducts;
    // алкоголь    ( светло-фиолетовый)
    sector(Rgb(238, 130, 238), Temp, Temp + procentAlcohol);
    Temp := Temp + procentAlcohol;
    // квартира    ( розовый)
    sector(Rgb(255, 192, 203), Temp, Temp + procentFlat);
    Temp := Temp + procentFlat;
    // интернет, моб. связь ( феолетовый)
    sector(Rgb(147, 112, 219), Temp, Temp + procentInternet);
    Temp := Temp + procentInternet;
    // ЖКХ   (насыщенно розовый)
    sector(Rgb(255, 20, 147), Temp, Temp + procentJKH);
    Temp := Temp + procentJKH;
    // образование  ( голубой)
    sector(Rgb(0, 191, 255), Temp, Temp + procentEducation);
    Temp := Temp + procentEducation;
    // кредит     ( синий)
    sector(Rgb(0, 0, 255), Temp, Temp + procentCredit);
    Temp := Temp + procentCredit;
    // одежда   ( зеленый)
    sector(Rgb(0, 255, 0), Temp, Temp + procentClothes);
    Temp := Temp + procentClothes;
    // проезд   ( темно-зеленый)
    sector(Rgb(0, 128, 0), Temp, Temp + procentDriveAway);
    Temp := Temp + procentDriveAway;
    // красота   ( желтый)
    sector(Rgb(255, 215, 0), Temp, Temp + procentBeauty);
    Temp := Temp + procentBeauty;
    // здоровье  ( ораньжевый)
    sector(Rgb(255, 165, 0), Temp, Temp + procentHealth);
    Temp := Temp + procentHealth;
    // путешествие (  красный)
    sector(Rgb(255, 0, 0), Temp, Temp + procentJourney);
    Temp := Temp + procentJourney;
    // машина  ( синий)
    sector(Rgb(30, 144, 255), Temp, Temp + procentCar);
    Temp := Temp + procentCar;
    // другое  ( светло-голубой)
    sector(Rgb(0, 255, 255), Temp, Temp + procentAnother);
  end
  else
    sector(Rgb(255, 255, 255), 0, 2 * pi);
end;

procedure TfrmMain.editYearChange(Sender: TObject);
var
  i, UserIndex, Month, Year: Integer;
begin
  // заполнение года
  for i := 0 to (sgPlanSpend.RowCount - 1) do
  begin
    sgPlanSpend.cells[2, i + 1] := editYear.Text;
  end;
  for i := 0 to (sgPlanEarn.RowCount - 1) do
  begin
    sgPlanEarn.cells[2, i + 1] := editYear.Text;
  end;
  UserIndex := cbUsersReport.ItemIndex;
  Month := frmMain.cbMonth.ItemIndex + 1;
  Year := editYear.Value;
  // заполнение Расход/Доход (план)
  LoadPlanSpend(UserIndex, Month, Year);
  LoadPlanEarn(UserIndex, Month, Year);
  // заполнение Расход/Доход ( факт)
  LoadFactPlan(UserIndex);
  // подсчет и заполнение ПЛАН- ФАКТ
  CountPlanMinusFact(sgPlanSpend);
  CountPlanMinusFact(sgPlanEarn);
end;

procedure GridClean(Sender: TObject);
var
  hGridRect: TGridRect;
begin
  hGridRect.Top := -1;
  hGridRect.Left := -1;
  hGridRect.Right := -1;
  hGridRect.Bottom := -1;
  (Sender as TStringGrid).Selection := hGridRect;
end;

end.
