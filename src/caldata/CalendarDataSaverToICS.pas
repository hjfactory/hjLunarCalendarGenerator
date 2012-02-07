unit CalendarDataSaverToICS;

interface

uses
  Windows, Classes, SysUtils,
  CalendarData, CalendarDataSaver;

type
  TCalendarSaverToICS = class(TCalendarDataSaver)
  public
    constructor Create(APath: string); override;
    destructor Destroy; override;

    procedure BeginSave; override;
    procedure EndSave; override;
    procedure AddData(AData: TCalendarData); override;
  end;

implementation

uses
  DateUtils;

{ TCalendarSaverToICS }

constructor TCalendarSaverToICS.Create(APath: string);
begin
  inherited;

end;

destructor TCalendarSaverToICS.Destroy;
begin
  OutputDebugString(PChar('TCalendarSaverToICS.Destroy'));

  inherited Destroy;
end;

procedure TCalendarSaverToICS.BeginSave;
  function GetFilenameNoExt(APath: string): string;
  var
    I: Integer;
  begin
    Result := ExtractFileName(APath);
    I := LastDelimiter('.', Result);
    if I > 0 then
      Result := Copy(Result, 1, I-1);
  end;
var
  W: Word;
begin
  // Unicode file
  W := MakeWord($FF, $FE);
  FFileStream.Write(W, SizeOf(Word));

  // icalendar object begin
  WriteData('BEGIN:VCALENDAR');

  // Calendar Properties
  WriteData('PRODID:-//hjFactory//hjLunarCalendarGenertor 1.0//KO');  // 제조사 // 제품명
  WriteData('VERSION:2.0');
  WriteData('METHOD:PUBLISH');

  // VTIMEZONE 컴포넌트
  WriteData('BEGIN:VTIMEZONE');
  WriteData('TZID:Asia/Seoul');
  WriteData('X-LIC-LOCATION:Asia/Seoul');
  WriteData('BEGIN:STANDARD');
  WriteData('TZOFFSETFROM:+0900');
  WriteData('TZOFFSETTO:+0900');
  WriteData('TZNAME:KST');
  WriteData('DTSTART:19700101T000000Z');
  WriteData('END:STANDARD');
  WriteData('END:VTIMEZONE');
end;

procedure TCalendarSaverToICS.EndSave;
begin
  // icalendar object end
  WriteData('END:VCALENDAR');
end;

procedure TCalendarSaverToICS.AddData(AData: TCalendarData);
  function GetDateFormat(AYear, AMonth, ADay: Word): string;
  begin
    Result := FormatDateTime('YYYYMMDD', EncodeDate(AYear, AMonth, ADay));
  end;
  function GetNextDayDateFormat(AYear, AMonth, ADay: Word): string;
  begin
    Result := FormatDateTime('YYYYMMDD', IncDay(EncodeDate(AYear, AMonth, ADay)));
  end;
begin

  WriteData('BEGIN:VEVENT');
  WriteData('DTSTART;VALUE=DATE:' + GetDateFormat(AData.Solar.Year, AData.Solar.Month, AData.Solar.Day));
  WriteData('DTEND;VALUE=DATE:' + GetNextDayDateFormat(AData.Solar.Year, AData.Solar.Month, AData.Solar.Day));
//  WriteData('RRULE:FREQ=WEEKLY;BYDAY=MO');
//  WriteData('UID:egqsuskb0abkc5is1o9airk6qo@google.com');
  WriteData('CREATED:' + FormatDateTime('YYYYMMDD''T''HHNNSS', AData.Created));
  WriteData('DESCRIPTION:');
  WriteData('LAST-MODIFIED:'+ FormatDateTime('YYYYMMDD''T''HHNNSS', AData.Created));
  WriteData('LOCATION:');
  WriteData('SEQUENCE:0');
  WriteData('STATUS:CONFIRMED');
  WriteData('SUMMARY:' + AData.Summary);
  WriteData('TRANSP:TRANSPARENT');
  WriteData('END:VEVENT');
//
//  OutputDebugString(PChar(Format('S: %d-%d-%d, L: %d-%d-%d, Summary: %s', [
//      AData.Solar.Year
//    , AData.Solar.Month
//    , AData.Solar.Day
//    , AData.Lunar.Year
//    , AData.Lunar.Month
//    , AData.Lunar.Day
//    , AData.Summary
//  ])));
end;

end.
