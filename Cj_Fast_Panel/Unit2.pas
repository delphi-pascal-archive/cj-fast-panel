unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask;

type
  TForm2 = class(TForm)
    data: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  prev:string;

implementation

uses fpu;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
data.Lines.SaveToFile(extractfilepath(application.ExeName)+'elements.fpf');
close;
form1.LoadItems;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
data.Text:=prev;
close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
prev:=data.Text;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
showmessage('Fast Panel by Чуклинов Евгений ака Cj');
end;

end.
