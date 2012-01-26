unit CalendarCommons;

interface

uses
  hjLunarDateType;

const
//  // Invalid range error code
//  ERROR_INVALID_RANGE_START = 10011;
//  ERROR_INVALID_RANGE_END   = 10012;
//  ERROR_INVALID_RANGE_YEAR  = 10020;
//  ERROR_INVALID_RANGE_MONTH = 10030;
//  ERROR_INVALID_RANGE_DAY   = 10040;
//
  LUNARDAYS_DISPTYPE_5DAY    = 110;  // 1, 5, 10, 15, 20, 25, 29(30)
  LUNARDAYS_DISPTYPE_10DAY   = 120;  // 1, 10, 20, 29(30)
  LUNARDAYS_DISPTYPE_15DAY   = 130;  // 1, 15, 29(30)
  LUNARDAYS_DISPTYPE_KOR     = 200;  // 정월, 보름, 그믐
//
//  // 99 is last day
//  Days5Day: array[0..5] of Word = (1, 5, 10, 20, 25, 99);
//  Days10Day: array[0..3] of Word = (1, 10, 20, 99);
//  Days15Day: array[0..2] of Word = (1, 15, 99);
//  DaysKor: array[0..2] of Word = (1, 15, 99);
//

type
  TLunarDaysDisplayType = (lddt5, lddt10, lddt15, lddtKor);

  TCalendarData = class(TObject)
  private
    FSolarDate: TSolarDateRec;
    FLunarDate: TLunarDateRec;
    FDescription: string;
    FSummary: string;
  public
    function SetData(ASolarDate: TSolarDateRec; ALunarDate: TLunarDateRec; ASummary, ADescription: string): TCalendarData;

    property Solar: TSolarDateRec read FSolarDate;
    property Lunar: TLunarDateRec read FLunarDate;
    property Summary: string read FSummary;
    property Description: string read FDescription;
  end;


implementation

{ TCalendarData }

function TCalendarData.SetData(ASolarDate: TSolarDateRec;
  ALunarDate: TLunarDateRec; ASummary, ADescription: string): TCalendarData;
begin
  FSolarDate    := ASolarDate;
  FLunarDate    := ALunarDate;
  FSummary      := ASummary;
  FDescription  := ADescription;

  Result := Self;
end;

end.
