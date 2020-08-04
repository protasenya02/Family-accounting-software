unit UnitData;

interface

const
  ConstDataManipulateTop = 570;
  ConstDataManipulateLeft = 1400;

  sgCategorySpendPlan: array [1 .. 14] of string = ('��������', '��������',
    '��������', '��������� �����, ��������', '���', '�����������',
    '������, ����', '������', '������', '�������', '��������', '�����������',
    '����������', '������');
  sgCategoryEarnPlan: array [1 .. 6] of string = ('���������� �����',
    '���������', '������', '����� � ������ ������������', '���� � ����',
    '����� �� ������ ����������');

type // ������ � ����������� ��������
  TMoneySpend = record
    Products: integer;
    Alcohol: integer;
    Clothes: integer;
    Flat: integer;
    Health: integer;
    Internet: integer;
    Beauty: integer;
    DriveAway: integer; // ������
    Education: integer;
    Journey: integer;
    JKH: integer; // ���
    Car: integer;
    Credit: integer;
    Another: integer;
  end;

  // ������ �������
  TMoneyEarn = record
    ZP: integer; // ��������
    Grant: integer; // ���������
    Rent: integer; // ����� ������ � ������������
    Debt: integer; // ���� ����
    Compensation: integer; // ������
    AnotherMoney: integer; // ����� �� ������ ����������
  end;

  TBill = record // �����
    BillName: string[20];
    Valuta: string[20];
  end;

  TPlan = record // ���� ��� �������� ����������� ��������/ ������� �� �������
    Spend: TMoneySpend;
    Earn: TMoneyEarn;
  end;

  TUser = record // ������ �������������
    Name, Surname, Lastname: string[40]; // ��� ������������
    MoneySpend: TMoneySpend; // �������
    MoneyEarn: TMoneyEarn; // ������
    Bill: array [0 .. 9] of TBill;
    Plan: Array [1 .. 12, 2000 .. 2050] of TPlan;
  end;

var
  UserInfoFile: file of TUser; // ���� ��� ������ �������������
  ArrayOfUsers: array of TUser; // ������ �������
  USD, RUB: real;
  // �����
  fMoneyEarn, fMoneySpend, fBill, fSort, fReport, fPlanSpend,
    fPlanEarn: Boolean;

implementation
end.
