{
  1, 음력 양력 변경
  2, 달력 생성
  3, 기념일 관리 기능
}

unit MainController;

interface

uses
  hjLunarDateType, hjLunarDateConverter, Classes, Windows, SysUtils,
  CalendarCommons, CalendarDataGenerator, CalendarDataSaver;

type
  TMainController = class(TObject)
  private
    FLunDataConv: ThjLunarDateConverter;
//    FCalDataGen: TCalendarDataGenerate;
    procedure MakeCalendar(AGenerator: TCalendarDataGenerator; ASaver: TCalendarDataSaver);
  public
    constructor Create;
    destructor Destroy; override;

    function SolarToLunar(ADate: TSolarDateRec): TLunarDateRec;
    function LunarToSolar(ADate: TLunarDateRec): TSolarDateRec;

    function MakeLunarCalendar(AStartOfRange, AEndOfRange: Word; ADispDays: TDispDaySet; APath: string): Boolean;
  end;

implementation

uses
  LunarCalendarDataGenerator,
  CalendarDataSaverToICS;

{ TMainController }

constructor TMainController.Create;
begin
  FLunDataConv := ThjLunarDateConverter.Create;
//  FCalDataGen
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

procedure TMainController.MakeCalendar(AGenerator: TCalendarDataGenerator; ASaver: TCalendarDataSaver);
var
  Data: TCalendarData;
begin
  Data := AGenerator.Next;

  while Assigned(Data) do
  begin
    ASaver.AddData(Data);

    AGenerator.Next;
  end;
end;

function TMainController.MakeLunarCalendar(AStartOfRange, AEndOfRange: Word; ADispDays: TDispDaySet; APath: string): Boolean;
var
  Source: TLunarCalendarSource;
  Generator: TLunarCalendarDataGenerator;
  Saver: TCalendarSaverToICS;
begin
  Result := False;

  Source    := TLunarCalendarSource.Create(ADispDays);
  Generator := TLunarCalendarDataGenerator.Create(Source, AStartOfRange, AendOfRange);
  Saver     := TCalendarSaverToICS.Create(APath);
  try
    MakeCalendar(Generator, Saver);

    Result := True;
  finally
    Source.Free;
    Generator.Free;
    Saver.Free;
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

end.
