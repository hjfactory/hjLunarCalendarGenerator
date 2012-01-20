{
  1, 음력 양력 변경
  2, 달력 생성
  3, 기념일 관리 기능
}

unit MainController;

interface

uses
  hjLunarDateType, hjLunarDateConverter, Classes, Windows, SysUtils,
  CalendarDataGenerate;

type
  TMainController = class(TObject)
  private
    FLunDataConv: ThjLunarDateConverter;
    FCalendarDataGenerator: TCalendarDataGenerate;
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
  FLunDataConv := ThjLunarDateConverter.Create;
end;

destructor TMainController.Destroy;
begin
  FLunDataConv.Free;

  inherited;
end;

function TMainController.LunarToSolar(ADate: TLunarDateRec): TSolarDateRec;
begin
  try
    Result := FLunDataConv.LunarToSolar(ADate);
  except
    raise
  end;
end;

function TMainController.SolarToLunar(ADate: TSolarDateRec): TLunarDateRec;
begin
  try
    Result := FLunDataConv.SolarToLunar(ADate);
  except
    raise
  end;
end;

procedure TMainController.test(A, B, C: Word);
begin
//  with TCalendarDataGenerate.Create();
end;

end.
