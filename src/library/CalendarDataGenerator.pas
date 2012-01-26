unit CalendarDataGenerator;

interface

uses
  hjLunarDateType, hjLunarDateConverter, CalendarCommons;

type
  // 달력데이터를 만들기 위한 정보
  TCalendarSource = class(TObject)
  public
    procedure First; virtual; abstract;
    procedure Next; virtual; abstract;
    function HasNext: Boolean; virtual; abstract;
  end;

  TCalendarDataGenerator = class(TObject)
  protected
    FStartOfRange: Word;
    FEndOfRange: Word;

    FCalendarData: TCalendarData;
    FCalendarSource: TCalendarSource;
    FLunarDateConvertor: ThjLunarDateConverter;

    procedure Initialize; virtual; abstract;
  public
    constructor Create(ASource: TCalendarSource; AStartOfRange, AEndOfRange: Word);
    destructor Destroy; override;

    function Next: TCalendarData; virtual; abstract;

    property StartOfRange: Word read FStartOfRange;
    property EndOfRange: Word read FEndOfRange;
  end;

implementation


{ TCalendarDataGenerate }

constructor TCalendarDataGenerator.Create(ASource: TCalendarSource; AStartOfRange, AEndOfRange: Word);
begin
  FCalendarData   := TCalendarData.Create;
  FCalendarSource := ASource;

  FStartOfRange := AStartOfRange;
  FEndOfRange   := AEndOfRange;

  Initialize;
end;

destructor TCalendarDataGenerator.Destroy;
begin
  FCalendarData.Free;

  inherited;
end;

end.
