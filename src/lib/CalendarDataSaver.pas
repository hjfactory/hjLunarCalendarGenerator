unit CalendarDataSaver;

interface

uses
  CalendarCommons;

type
  TCalendarDataSaver = class(TObject)
  public
    constructor Create(APath: string);
    destructor Destroy; override;

    procedure AddData(AData: TCalendarData);
  end;

implementation

{ TCalendarDataSaver }

procedure TCalendarDataSaver.AddData(AData: TCalendarData);
begin

end;

constructor TCalendarDataSaver.Create(APath: string);
begin

end;

destructor TCalendarDataSaver.Destroy;
begin

  inherited;
end;

end.
