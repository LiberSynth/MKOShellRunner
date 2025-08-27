unit uShellRunnerTask;

interface

uses
  { VCL }
  Winapi.ShellAPI, Winapi.Windows,
  { Common }
  Common.uInterfaces, Common.uCustomTasks,
  { S }
  uConsts;

type

  TShellRunnerTask = class(TCustomTask)

  protected

    function GetName: WideString; override; safecall;
    function GetCaption: WideString; override; safecall;
    function GetDescription: WideString; override; safecall;
    function GetParamsHelpText: WideString; override; safecall;
    function ValidateParams(const _Params: IMKOTaskParams): LongBool; override; safecall;
    function StartTask(const _Params: IMKOTaskParams): IMKOTaskInstance; override; safecall;

  end;

  TShellRunnerTaskInstance = class(TCustomMKOTaskInstance)

  protected

    procedure Execute(const _OutputIntf: IMKOTaskOutput); override; safecall;
    procedure Init(const _OutputIntf: IMKOTaskOutput); override;

  end;

implementation

{ TShellRunnerTask }

function TShellRunnerTask.GetName: WideString;
begin
  Result := SC_SHELL_RUNNER_TASK_NAME;
end;

function TShellRunnerTask.GetCaption: WideString;
begin
  Result := SC_SHELL_RUNNER_TASK_CAPTION
end;

function TShellRunnerTask.GetDescription: WideString;
begin
  Result := SC_SHELL_RUNNER_TASK_DESCRIPTION;
end;

function TShellRunnerTask.GetParamsHelpText: WideString;
begin
  Result := SC_SHELL_RUNNER_TASK_PARAMS_HELP_TEXT
end;

function TShellRunnerTask.ValidateParams(const _Params: IMKOTaskParams): LongBool;
begin
end;

function TShellRunnerTask.StartTask(const _Params: IMKOTaskParams): IMKOTaskInstance;
begin
  Result := TShellRunnerTaskInstance.Create(_Params);
end;

{ TShellRunnerTaskInstance }

procedure TShellRunnerTaskInstance.Execute(const _OutputIntf: IMKOTaskOutput);
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  ExecuteFile, ParamString, StartInString: string;
begin

  inherited Execute(_OutputIntf);

  ExecuteFile := Params[0]; //'C:\Windows\System32\calc.exe';

  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);

  with SEInfo do
  begin

    fMask := SEE_MASK_NOCLOSEPROCESS;
    lpFile := PChar(ExecuteFile);
    {ParamString can contain theapplication parameters.}
    // lpParameters := PChar(ParamString);
    {StartInString specifies thename of the working
    directory.If ommited, the current
    directory is used.}
    // lpDirectory := PChar(StartInString);
    nShow := SW_SHOWNORMAL;

  end;

  if ShellExecuteEx(@SEInfo) then

    repeat

      Sleep(50);
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);

    until (ExitCode <> STILL_ACTIVE) or Terminated;

end;

procedure TShellRunnerTaskInstance.Init(const _OutputIntf: IMKOTaskOutput);
begin
  inherited Init(_OutputIntf);
end;

end.
