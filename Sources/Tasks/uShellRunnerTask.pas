unit uShellRunnerTask;

interface

uses
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
begin
  inherited Execute(_OutputIntf);
end;

procedure TShellRunnerTaskInstance.Init(const _OutputIntf: IMKOTaskOutput);
begin
  inherited Init(_OutputIntf);
end;

end.
