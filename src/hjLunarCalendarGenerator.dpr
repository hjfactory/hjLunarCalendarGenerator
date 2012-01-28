program hjLunarCalendarGenerator;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  CalendarCommons in 'caldata\CalendarCommons.pas',
  CalendarDataGenerator in 'caldata\CalendarDataGenerator.pas',
  CalendarDataSaver in 'caldata\CalendarDataSaver.pas',
  CalendarDataSaverToICS in 'caldata\CalendarDataSaverToICS.pas',
  LunarCalendarDataGenerator in 'caldata\LunarCalendarDataGenerator.pas',
  hjLunarDateConverter in 'lib\hjLunarDateConverter.pas',
  hjLunarDateType in 'lib\hjLunarDateType.pas',
  MakeCalendarController in 'ctrl\MakeCalendarController.pas',
  SpecifiedDateController in 'ctrl\SpecifiedDateController.pas',
  CalendarData in 'model\CalendarData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
