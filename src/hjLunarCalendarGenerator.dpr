program hjLunarCalendarGenerator;

uses
  ExceptionLog,
  Forms,
  Main in 'Main.pas' {Form2},
  MainController in 'lib\MainController.pas',
  hjLunarDateConverter in 'lib\hjLunarDateConverter.pas',
  CommonType in 'lib\CommonType.pas',
  LunarCalendarDataGenerate in 'lib\LunarCalendarDataGenerate.pas',
  CalendarDataGenerate in 'lib\CalendarDataGenerate.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
