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
  protected
    procedure First; virtual; abstract;
    function Next: Boolean; virtual; abstract;
    function Day: Word; virtual; abstract;
  end;

  TCalendarDataGenerate = class(TObject)
  protected
    FStartOfRange: Word;
    FEndOfRange: Word;

    FCalendarData: TCalendarData;
    FCalendarSource: TCalendarSource;
    FLunarDateConvertor: ThjLunarDateConverter;

    procedure Initialize; virtual;
  public
    constructor Create(ASource: TCalendarSource; AStartOfRange, AEndOfRange: Word);
    destructor Destroy; override;

    function Next: TCalendarData; virtual; abstract;

    property StartOfRange: Word read FStartOfRange;
    property EndOfRange: Word read FEndOfRange;
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

constructor TCalendarDataGenerate.Create(ASource: TCalendarSource; AStartOfRange, AEndOfRange: Word);
begin
  FCalendarData   := TCalendarData.Create;
  FCalendarSource := ASource;

  FStartOfRange := AStartOfRange;
  FEndOfRange   := AEndOfRange;
end;

destructor TCalendarDataGenerate.Destroy;
begin
  FCalendarData.Free;

  inherited;
end;

procedure TCalendarDataGenerate.Initialize;
begin

end;

end.
