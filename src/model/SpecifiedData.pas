unit SpecifiedData;

interface

uses
  Classes, CalendarCommons;

type
  TSpecifiedData = class(TObject)
  private
    FID: string;
    FMonth: Word;
    FDay: Word;
    FSummury: string;

    function GetDayStr: string;
    function GetKey: string;
  public
    constructor Create; overload;
    constructor Create(const AID: string; const AMonth, ADay: Word;
      const ASummury: string); overload;

    property Key: string read GetKey;
    property ID: string read FID write FID;
    property Month: Word read FMonth write FMonth;
    property Day: Word read FDay write FDay;
    property DayStr: string read GetDayStr;
    property Summury: string read FSummury write FSummury;
  end;

  TSpecifiedDatas = class(TObject)
  private
    FList: TList;
    function Get(Index: Integer): TSpecifiedData;
    function GetCount: Integer;
  protected
    procedure Add(AData: TSpecifiedData);
    procedure Clear;
  public
    constructor Create;
    destructor Destroy; override;

    property Items[Index: Integer]: TSpecifiedData read Get; default;
    property Count: Integer read GetCount;
  end;

  TSpecifiedDataList = class(TObject)
  private
    FDatas: TSpecifiedDatas;
    FList: TStringList;
    function Get(Index: Integer): TSpecifiedData;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    function AppendData(const AMonth, ADay: Word;
      const ASummury: string): TSpecifiedData; overload;
    function AppendData(AData: TSpecifiedData): TSpecifiedData; overload;
    procedure DeleteData(Index: Integer); overload;
    procedure DeleteData(AData: TSpecifiedData); overload;
    function GetDatas(AMonth, ADay: Word): TSpecifiedDatas;

    property Items[Index: Integer]: TSpecifiedData read Get; default;
    property Count: Integer read GetCount;
  end;

implementation

uses
  SysUtils;

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

constructor TSpecifiedData.Create;
begin

end;

constructor TSpecifiedData.Create(const AID: string; const AMonth, ADay: Word;
  const ASummury: string);
begin
  FID := AID;
  FMonth := AMonth;
  FDay := ADay;
  FSummury := ASummury;
end;

function TSpecifiedData.GetKey: string;
begin
  Result := Format('%.2d-%.2d-%s', [FMonth, FDay, FID]);
end;

function TSpecifiedData.GetDayStr: string;
begin
  if FDay = LunarLastDay then
    Result := LunarLastDayStr
  else
    Result := Format('%.2d', [FDay]);
end;

{ TSpecifiedDatas }

constructor TSpecifiedDatas.Create;
begin
  FList := TList.Create;
end;

destructor TSpecifiedDatas.Destroy;
begin
  FList.Free;

  inherited;
end;

procedure TSpecifiedDatas.Add(AData: TSpecifiedData);
begin
  FList.Add(AData);
end;

procedure TSpecifiedDatas.Clear;
begin
  FList.Clear;
end;

function TSpecifiedDatas.Get(Index: Integer): TSpecifiedData;
begin
  Result := nil;
  if FList.Count > Index then
    Result := TSpecifiedData(FList[Index]);
end;

function TSpecifiedDatas.GetCount: Integer;
begin
  Result := FList.Count;
end;

{ TSpecifiedList }

constructor TSpecifiedDataList.Create;
begin
  FList := TStringList.Create;
  FList.Sorted := True;
  FDatas := TSpecifiedDatas.Create;
end;

destructor TSpecifiedDataList.Destroy;
var
  I: Integer;
begin
  for I := FList.Count - 1 downto 0 do
    FList.Objects[I].Free;
  FList.Free;

  FDatas.Free;

  inherited;
end;

function TSpecifiedDataList.AppendData(const AMonth, ADay: Word;
  const ASummury: string): TSpecifiedData;
begin
  Result := TSpecifiedData.Create(RandomString, AMonth, ADay, ASummury);

  AppendData(Result);
end;

function TSpecifiedDataList.AppendData(AData: TSpecifiedData): TSpecifiedData;
begin
  Result := AData;
  if Result.ID = '' then
    Result.ID := RandomString;

  // 일자별로 정렬하기 위해 Key 사용
  FList.AddObject(Result.Key, Result);
end;
//
//procedure TSpecifiedDataList.DeleteData(ID: string);
//begin
//end;

procedure TSpecifiedDataList.DeleteData(AData: TSpecifiedData);
var
  Idx: Integer;
begin
  if FList.Find(AData.Key, Idx) then
    DeleteData(Idx);
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
  if Index in [0 .. FList.Count - 1] then
    Result := TSpecifiedData(FList.Objects[Index]);
end;

function TSpecifiedDataList.GetCount: Integer;
begin
  Result := FList.Count;
end;
//
//function TSpecifiedDataList.GetData(AID: string): TSpecifiedData;
//var
//  Idx: Integer;
//begin
//  Result := nil;
//  if FList.Find(AID, Idx) then
//    Result := TSpecifiedData(FList.Objects[Idx]);
//end;

function TSpecifiedDataList.GetDatas(AMonth, ADay: Word): TSpecifiedDatas;
var
  I: Integer;
  Data: TSpecifiedData;
begin
  Result := FDatas;
  Result.Clear;

  for I := 0 to FList.Count - 1 do
  begin
    Data := TSpecifiedData(FList.Objects[I]);
    if (Data.Month = AMonth) and (Data.Day = ADay) then
    begin
      Result.Add(Data);
    end;
  end;
end;
//
//function TSpecifiedDataList.GetID(Index: Integer): string;
//begin
//  Result := '';
//  if Index in [0 .. FList.Count - 1] then
//    Result := FList[Index];
//end;

end.
