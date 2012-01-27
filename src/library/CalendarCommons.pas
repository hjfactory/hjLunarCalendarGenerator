unit CalendarCommons;

interface

uses
  SysUtils, hjLunarDateType;

type
  TLunarDaysDisplayType = (lddt5, lddt10, lddt15, lddtKor);

  TCalendarData = class(TObject)
  private
    FSolarDate: TSolarDateRec;
    FLunarDate: TLunarDateRec;
    FDescription: string;
    FSummary: string;
    FUID: string;
    FCreated: TDateTime;
  public
    function SetData(ASolarDate: TSolarDateRec; ALunarDate: TLunarDateRec; ASummary, ADescription: string): TCalendarData;

    property UID: string read FUID;
    property Solar: TSolarDateRec read FSolarDate;
    property Lunar: TLunarDateRec read FLunarDate;
    property Summary: string read FSummary;
    property Description: string read FDescription;
    property Created: TDateTime read FCreated;
  end;


implementation

{ TCalendarData }

function TCalendarData.SetData(ASolarDate: TSolarDateRec;
  ALunarDate: TLunarDateRec; ASummary, ADescription: string): TCalendarData;
begin
  FCreated := Now;

  FSolarDate    := ASolarDate;
  FLunarDate    := ALunarDate;
  FSummary      := ASummary;
  FDescription  := ADescription;

  Result := Self;
end;

end.
