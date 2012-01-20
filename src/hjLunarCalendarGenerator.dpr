program hjLunarCalendarGenerator;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  MainController in 'lib\MainController.pas',
  hjLunarDateConverter in 'lib\hjLunarDateConverter.pas',
  CommonType in 'lib\CommonType.pas',
  LunarCalendarDataGenerate in 'lib\LunarCalendarDataGenerate.pas',
  CalendarDataGenerate in 'lib\CalendarDataGenerate.pas',
  hjLunarDateType in 'lib\hjLunarDateType.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
