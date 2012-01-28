unit hjLunarDateType;

interface

type
  TSolarDateRec = record
    Year, Month, Day: Word;
  end;

  TLunarDateRec = record
    Year, Month, Day: Word;
    IsLeapMonth: Boolean;
  end;

  function DateRec(AYear, AMonth, ADay: Word): TSolarDateRec; overload;
  function DateRec(AYear, AMonth, ADay: Word; AIsLeapMonth: Boolean): TLunarDateRec; overload;

implementation

function DateRec(AYear, AMonth, ADay: Word): TSolarDateRec;
begin
  Result.Year   := AYear;
  Result.Month  := AMonth;
  Result.Day    := ADay;
end;

function DateRec(AYear, AMonth, ADay: Word; AIsLeapMonth: Boolean): TLunarDateRec;
begin
  Result.Year         := AYear;
  Result.Month        := AMonth;
  Result.Day          := ADay;
  Result.IsLeapMonth  := AIsLeapMonth;
end;

end.
