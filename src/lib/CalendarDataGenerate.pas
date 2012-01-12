unit CalendarDataGenerate;

interface

uses
  hjLunarDateConverter;

type
  TCalendarData = class(TObject)
  private
    FSolarDate: TSolarDateRec;
    FLunarDate: TLunarDateRec;
    FDescription: string;
    FSummary: string;
  public
    procedure SetData(ASolarDate: TSolarDateRec; ALunarDate: TLunarDateRec; ASummary, ADescription: string);

    property Solar: TSolarDateRec read FSolarDate;
    property Lunar: TLunarDateRec read FLunarDate;
    property Summary: string read FSummary;
    property Description: string read FDescription;
  end;

  // 달력데이터를 만들기 위한 정보
  TCalendarSource = class(TObject)
  end;

  TCalendarDataGenerate = class(TObject)
  private
    FStartYear: Word;
    FEndYear: Word;
  protected
    FCalendarData: TCalendarData;
    FCalendarSource: TCalendarSource;
    FLunarDateConvertor: ThjLunarDateConverter;
  published
  public
    constructor Create(ASource: TCalendarSource);
    destructor Destroy; override;

    function HasNext: Boolean; virtual; abstract;
    function Next: TCalendarData; virtual; abstract;

    property StartYear: Word read FStartYear write FStartYear;
    property EndYear: Word read FEndYear write FEndYear;
  end;

implementation

{ TCalendarData }

procedure TCalendarData.SetData(ASolarDate: TSolarDateRec;
  ALunarDate: TLunarDateRec; ASummary, ADescription: string);
begin
  FSolarDate    := ASolarDate;
  FLunarDate    := ALunarDate;
  FSummary      := ASummary;
  FDescription  := ADescription;
end;

{ TCalendarDataGenerate }

constructor TCalendarDataGenerate.Create(ASource: TCalendarSource);
begin
  FCalendarData   := TCalendarData.Create;
  FCalendarSource := ASource;
end;

destructor TCalendarDataGenerate.Destroy;
begin
  FCalendarData.Free;

  inherited;
end;

end.
