library MKOShellRunner;

uses
  System.SysUtils,
  System.Classes,
  Common.uConsts in '..\..\MKOCommon\Utils\Common.uConsts.pas',
  Common.uInterfaces in '..\..\MKOCommon\TaskManager\Common.uInterfaces.pas',
  Common.uCustomTasks in '..\..\MKOCommon\TaskManager\Common.uCustomTasks.pas',
  uConsts in 'Common\uConsts.pas',
  uShellRunnerTask in 'Tasks\uShellRunnerTask.pas';

{$R *.res}

procedure MKOTaskLibraryMarker;
begin
end;

procedure InitLibrary(MKOTaskLibrary: IMKOTaskLibrary); safecall;
begin
  MKOTaskLibrary.RegisterTask(TShellRunnerTask.Create);
end;

procedure FinLibrary; safecall;
begin
end;

exports

  MKOTaskLibraryMarker,
  InitLibrary,
  FinLibrary;

begin
end.
