program hjLunarCalendarGenerator;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  CalendarCommons in 'library\CalendarCommons.pas',
  CalendarDataGenerator in 'library\CalendarDataGenerator.pas',
  CalendarDataSaver in 'library\CalendarDataSaver.pas',
  CalendarDataSaverToICS in 'library\CalendarDataSaverToICS.pas',
  LunarCalendarDataGenerator in 'library\LunarCalendarDataGenerator.pas',
  hjLunarDateConverter in 'core\hjLunarDateConverter.pas',
  hjLunarDateType in 'core\hjLunarDateType.pas',
  MainController in 'controller\MainController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
