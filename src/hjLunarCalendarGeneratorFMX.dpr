program hjLunarCalendarGeneratorFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMXMainForm in 'form\FMXMainForm.pas' {Form1},
  CalendarCommons in 'caldata\CalendarCommons.pas',
  CalendarDataGenerator in 'caldata\CalendarDataGenerator.pas',
  CalendarDataSaver in 'caldata\CalendarDataSaver.pas',
  CalendarDataSaverToICS in 'caldata\CalendarDataSaverToICS.pas',
  LunarCalendarDataGenerator in 'caldata\LunarCalendarDataGenerator.pas',
  SpecifiedCalendarDataGenerator in 'caldata\SpecifiedCalendarDataGenerator.pas',
  Environment in 'common\Environment.pas',
  MakeCalendarController in 'ctrl\MakeCalendarController.pas',
  SpecifiedDataController in 'ctrl\SpecifiedDataController.pas',
  hjLunarDateConverter in 'lib\hjLunarDateConverter.pas',
  hjLunarDateType in 'lib\hjLunarDateType.pas',
  CalendarData in 'model\CalendarData.pas',
  SpecifiedData in 'model\SpecifiedData.pas',
  SpecifiedDataFile in 'specified\SpecifiedDataFile.pas',
  SpecifiedDataFileToIni in 'specified\SpecifiedDataFileToIni.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
