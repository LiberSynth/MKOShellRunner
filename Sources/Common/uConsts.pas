unit uConsts;

interface

uses
  { Common }
  Common.uConsts;

const

  SC_SHELL_RUNNER_TASK_NAME             = 'ShellRunner';
  SC_SHELL_RUNNER_TASK_CAPTION          = 'Выполнение CLI-команды';
  SC_SHELL_RUNNER_TASK_DESCRIPTION      = 'Функциональность выполнения консольной команды.';
  SC_SHELL_RUNNER_TASK_PARAMS_HELP_TEXT =

      'Параметр 1 - команда' + CRLF +
      'Параметр 2 - параметр 1' + CRLF +
      '...' + CRLF +
      'Параметр n - параметр n - 1' + CRLF;

implementation

end.
