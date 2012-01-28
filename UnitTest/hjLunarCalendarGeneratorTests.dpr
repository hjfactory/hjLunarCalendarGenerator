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
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestCalendarDataSaverToICS in 'TestCalendarDataSaverToICS.pas',
  CalendarCommons in '..\src\library\CalendarCommons.pas',
  CalendarDataGenerator in '..\src\library\CalendarDataGenerator.pas',
  CalendarDataSaver in '..\src\library\CalendarDataSaver.pas',
  CalendarDataSaverToICS in '..\src\library\CalendarDataSaverToICS.pas',
  LunarCalendarDataGenerator in '..\src\library\LunarCalendarDataGenerator.pas',
  hjLunarDateConverter in '..\src\core\hjLunarDateConverter.pas',
  hjLunarDateType in '..\src\core\hjLunarDateType.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

