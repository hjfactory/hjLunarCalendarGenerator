unit SpecifiedData;

interface

uses
  Classes;

type
  TSpecifiedData = class(TObject)
  private
    FID: string;
    FMonth: Word;
    FDay: Word;
    FSummury: string;
  public
    constructor Create(const AID: string; const AMonth, ADay: Word;
      const ASummury: string);

    property ID: string read FID write FID;
    property Month: Word read FMonth write FMonth;
    property Day: Word read FDay write FDay;
    property Summury: string read FSummury write FSummury;
  end;

  TSpecifiedDataList = class(TObject)
  private
    FList: TStringList;
    function Get(Index: Integer): TSpecifiedData;
    function GetID(Index: Integer): string;
  public
    constructor Create;
    destructor Destroy; override;

    function AppendData(const AMonth, ADay: Word; const ASummury: string): TSpecifiedData; overload;
    function AppendData(AData: TSpecifiedData): TSpecifiedData; overload;
    procedure DeleteData(ID: string); overload;
    procedure DeleteData(Index: Integer); overload;

    property ID[Index: Integer]: string read GetID;
    property Items[Index: Integer]: TSpecifiedData read Get; default;
  end;

implementation

const
  SPECIFIED_ID_LEN = 20;

function RandomString(Size: Integer = 20): string;
const
  SEED = '0123456789abcdefghijklmnopqrstuvwxyz';
begin
  Randomize;

  Result := '';
  repeat
    Result := Result + SEED[Random(Length(SEED))];
  until (Length(Result) = Size);
end;

{ TSpecifiedData }

constructor TSpecifiedData.Create(const AID: string; const AMonth, ADay: Word;
  const ASummury: string);
begin
  FID       := AID;
  FMonth    := AMonth;
  FDay      := ADay;
  FSummury  := ASummury;
end;

{ TSpecifiedList }

constructor TSpecifiedDataList.Create;
begin
  FList := TStringList.Create;
end;

destructor TSpecifiedDataList.Destroy;
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
    FList.Objects[FList.Count - 1].Free;
  FList.Free;

  inherited;
end;

function TSpecifiedDataList.AppendData(const AMonth, ADay: Word; const ASummury: string): TSpecifiedData;
begin
  Result := TSpecifiedData.Create(RandomString, AMonth, ADay, ASummury);

  FList.AddObject(Result.ID, Result);
end;

function TSpecifiedDataList.AppendData(AData: TSpecifiedData): TSpecifiedData;
begin
  Result := AData;
  if Result.ID = '' then
    Result.ID := RandomString;

  FList.AddObject(Result.ID, Result);
end;

procedure TSpecifiedDataList.DeleteData(ID: string);
begin
  DeleteData(FList.IndexOf(ID));
end;

procedure TSpecifiedDataList.DeleteData(Index: Integer);
begin
  if Index > -1 then
  begin
    FList.Objects[Index].Free;
    FList.Delete(Index);
  end;
end;

function TSpecifiedDataList.Get(Index: Integer): TSpecifiedData;
begin
  Result := nil;
  if Index in [0..FList.count-1] then
    Result := TSpecifiedData(FList.Objects[Index]);
end;

function TSpecifiedDataList.GetID(Index: Integer): string;
begin
  Result := '';
  if Index in [0..FList.count-1] then
    Result := FList[Index];
end;

end.
