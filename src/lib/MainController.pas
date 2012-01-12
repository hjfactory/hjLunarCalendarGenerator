{
  기념일은 INI파일로 저장한다.
  음력달력 데이터는
}

unit MainController;

interface

uses
  hjLunarDateConverter, Classes, Windows, SysUtils,
  CalendarDataGenerate;

type
  TMainController = class(TObject)
  private
    FLunarCalc: ThjLunarDateConverter;
  public
    constructor Create;
    destructor Destroy; override;

    procedure test(A, B, C: Word);

    function SolarToLunar(ADate: TSolarDateRec): TLunarDateRec;
    function LunarToSolar(ADate: TLunarDateRec): TSolarDateRec;
  end;

implementation

uses
  StrUtils;

{ TMainController }

constructor TMainController.Create;
begin
  FLunarCalc := ThjLunarDateConverter.Create;
end;

destructor TMainController.Destroy;
begin
  FLunarCalc.Free;

  inherited;
end;

function TMainController.LunarToSolar(ADate: TLunarDateRec): TSolarDateRec;
begin

end;

function TMainController.SolarToLunar(ADate: TSolarDateRec): TLunarDateRec;
begin

end;

procedure TMainController.test(A, B, C: Word);
var
  R1: TLunarDateRec;
  R: TSolarDateRec;
  D: TCalendarData;
begin
  try
    R1 :=FLunarCalc.SolarToLunar(DateRec(A, B, C));
    R :=FLunarCalc.LunarToSolar(DateRec(A, B, C, False));
  except
    raise;
  end;

//  D.Solar.Year := 0;

//  OutputDebugString(PChar(Format('%d-%d-%d(%s)', [R.Year, R.Month, R.Day, IfThen(R.IsLeapMonth, '윤', '')])));
  OutputDebugString(PChar(Format('%d-%d-%d', [R.Year, R.Month, R.Day])));
end;

end.
