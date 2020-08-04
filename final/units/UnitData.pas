unit UnitData;

interface

const
  ConstDataManipulateTop = 570;
  ConstDataManipulateLeft = 1400;

  sgCategorySpendPlan: array [1 .. 14] of string = ('Продукты', 'Алкоголь',
    'Квартира', 'Мобильная связь, интернет', 'ЖКХ', 'Образование',
    'Кредит, долг', 'Одежда', 'Проезд', 'Красота', 'Здоровье', 'Путешествия',
    'Автомобиль', 'Другое');
  sgCategoryEarnPlan: array [1 .. 6] of string = ('Заработная плата',
    'Стипендия', 'Пенсия', 'Сдача в аренду недвижимости', 'Взял в долг',
    'Доход от других источников');

type // запись с категориями расходов
  TMoneySpend = record
    Products: integer;
    Alcohol: integer;
    Clothes: integer;
    Flat: integer;
    Health: integer;
    Internet: integer;
    Beauty: integer;
    DriveAway: integer; // проезд
    Education: integer;
    Journey: integer;
    JKH: integer; // ЖКХ
    Car: integer;
    Credit: integer;
    Another: integer;
  end;

  // запись доходов
  TMoneyEarn = record
    ZP: integer; // зарплата
    Grant: integer; // стипедния
    Rent: integer; // сдача аренды в недвижимость
    Debt: integer; // взял долг
    Compensation: integer; // пенсия
    AnotherMoney: integer; // доход от других источников
  end;

  TBill = record // счета
    BillName: string[20];
    Valuta: string[20];
  end;

  TPlan = record // поле для хранения планируемых расходов/ доходов по месяцам
    Spend: TMoneySpend;
    Earn: TMoneyEarn;
  end;

  TUser = record // запись пользователей
    Name, Surname, Lastname: string[40]; // ФИО пользователя
    MoneySpend: TMoneySpend; // расходы
    MoneyEarn: TMoneyEarn; // доходы
    Bill: array [0 .. 9] of TBill;
    Plan: Array [1 .. 12, 2000 .. 2050] of TPlan;
  end;

var
  UserInfoFile: file of TUser; // файл для записи пользователей
  ArrayOfUsers: array of TUser; // массив записей
  USD, RUB: real;
  // флаги
  fMoneyEarn, fMoneySpend, fBill, fSort, fReport, fPlanSpend,
    fPlanEarn: Boolean;

implementation
end.
