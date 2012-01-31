program hjLunarCalendarGenerator;

uses
  Forms,
  CalendarCommons in 'caldata\CalendarCommons.pas',
  CalendarDataGenerator in 'caldata\CalendarDataGenerator.pas',
  CalendarDataSaver in 'caldata\CalendarDataSaver.pas',
  CalendarDataSaverToICS in 'caldata\CalendarDataSaverToICS.pas',
  LunarCalendarDataGenerator in 'caldata\LunarCalendarDataGenerator.pas',
  hjLunarDateConverter in 'lib\hjLunarDateConverter.pas',
  hjLunarDateType in 'lib\hjLunarDateType.pas',
  MakeCalendarController in 'ctrl\MakeCalendarController.pas',
  SpecifiedDateController in 'ctrl\SpecifiedDateController.pas',
  CalendarData in 'model\CalendarData.pas',
  MainForm in 'form\MainForm.pas' {frmMain},
  SpecifiedForm in 'form\SpecifiedForm.pas' {frmSpecified},
  SpecifiedData in 'model\SpecifiedData.pas',
  SpecifiedDataSaver in 'specified\SpecifiedDataSaver.pas',
  SpecifiedDataSaverToIni in 'specified\SpecifiedDataSaverToIni.pas',
  SpecifiedDataLoader in 'specified\SpecifiedDataLoader.pas',
  SpecifiedDataLoaderFromIni in 'specified\SpecifiedDataLoaderFromIni.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Lunar Calendar Generator';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
