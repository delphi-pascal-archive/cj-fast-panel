program fp;

uses
  Forms,
  fpu in 'fpu.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Windows;

{$R *.res}

function Running: boolean;
begin
 CreateSemaphore(nil, 10, 20, 'FastPanel_running');
 if getlasterror = error_already_exists
 then result:=true
 else result:=false;
end;

begin
if running then exit;
  Application.Initialize;
  Application.ShowMainForm:=false;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.                      
