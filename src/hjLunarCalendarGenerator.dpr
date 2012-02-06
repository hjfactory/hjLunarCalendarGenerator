program hjLunarCalendarGenerator;

uses
  ExceptionLog,
  Forms,
  CalendarCommons in 'caldata\CalendarCommons.pas',
  CalendarDataGenerator in 'caldata\CalendarDataGenerator.pas',
  CalendarDataSaver in 'caldata\CalendarDataSaver.pas',
  CalendarDataSaverToICS in 'caldata\CalendarDataSaverToICS.pas',
  LunarCalendarDataGenerator in 'caldata\LunarCalendarDataGenerator.pas',
  hjLunarDateConverter in 'lib\hjLunarDateConverter.pas',
  hjLunarDateType in 'lib\hjLunarDateType.pas',
  MakeCalendarController in 'ctrl\MakeCalendarController.pas',
  SpecifiedDataController in 'ctrl\SpecifiedDataController.pas',
  CalendarData in 'model\CalendarData.pas',
  MainForm in 'form\MainForm.pas' {frmMain},
  SpecifiedForm in 'form\SpecifiedForm.pas' {frmSpecified},
  SpecifiedData in 'model\SpecifiedData.pas',
  SpecifiedDataFile in 'specified\SpecifiedDataFile.pas',
  SpecifiedDataFileToIni in 'specified\SpecifiedDataFileToIni.pas',
  Environment in 'common\Environment.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Lunar Calendar Generator';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
