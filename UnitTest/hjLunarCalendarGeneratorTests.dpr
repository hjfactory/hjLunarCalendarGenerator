program hjLunarCalendarGeneratorTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  ExceptionLog,
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestCalendarDataSaverToICS in 'TestCalendarDataSaverToICS.pas',
  CalendarCommons in '..\src\caldata\CalendarCommons.pas',
  CalendarDataGenerator in '..\src\caldata\CalendarDataGenerator.pas',
  CalendarDataSaver in '..\src\caldata\CalendarDataSaver.pas',
  CalendarDataSaverToICS in '..\src\caldata\CalendarDataSaverToICS.pas',
  LunarCalendarDataGenerator in '..\src\caldata\LunarCalendarDataGenerator.pas',
  hjLunarDateConverter in '..\src\lib\hjLunarDateConverter.pas',
  hjLunarDateType in '..\src\lib\hjLunarDateType.pas',
  CalendarData in '..\src\model\CalendarData.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

