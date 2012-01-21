program hjLunarCalendarGenerator;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  MainController in 'lib\MainController.pas',
  hjLunarDateConverter in 'lib\hjLunarDateConverter.pas',
  CalendarCommons in 'lib\CalendarCommons.pas',
  LunarCalendarDataGenerator in 'lib\LunarCalendarDataGenerator.pas',
  CalendarDataGenerator in 'lib\CalendarDataGenerator.pas',
  hjLunarDateType in 'lib\hjLunarDateType.pas',
  CalendarDataSaver in 'lib\CalendarDataSaver.pas',
  CalendarDataSaverToICS in 'lib\CalendarDataSaverToICS.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
