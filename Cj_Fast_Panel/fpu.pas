unit fpu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DarkThreadTimer, Buttons, ExtCtrls, Menus, Mask, XPMan,shellapi;

type
  TForm1 = class(TForm)
    DarkThreadTimer1: TDarkThreadTimer;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    XPManifest1: TXPManifest;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure DarkThreadTimer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LoadItems;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.DarkThreadTimer1Timer(Sender: TObject);
var
j:cardinal;
begin
if form2.Showing then exit;
if (mouse.CursorPos.X>=screen.WorkAreaWidth-1)and
   (mouse.CursorPos.Y>screen.Height div 2)then
   if form1.Left<>screen.WorkAreaWidth-width then
   begin
        form1.Left:=screen.Width-width;
        show;
        setwindowpos(handle,HWND_TOPMOST,0,0,0,0,swp_nomove or swp_nosize);
   end;
if mouse.CursorPos.X<screen.Width-width then
if form1.Left<>screen.Width then
   begin
        form1.Left:=screen.Width;
        hide;
   end;
if iswindowvisible(handle)then label1.Caption:=timetostr(time);
for j:=0  to self.ComponentCount-1 do
    if components[j]is TSpeedButton then
       with TSpeedButton(components[j]) do
       begin
            case helpcontext of
            1:enabled:=getdrivetype(pchar(helpkeyword))<>1 or 0;
            2:enabled:=directoryexists(helpkeyword);
            3:enabled:=fileexists(helpkeyword);
            end;
       end;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
s:string;
begin
width:=38+16;
left:=screen.Width;
button1.Left:=width-button1.Width-8;
button2.Left:=8;
application.HintPause:=0;

s:=extractfilepath(application.ExeName)+'elements.fpf';
if fileexists(s)then
   form2.data.Lines.LoadFromFile(s);
loaditems;
showwindow(application.Handle,sw_hide);
end;

procedure TForm1.LoadItems;
var
j:cardinal;
w:integer;
s:string;
i:TIcon;
ic:word;
b:TBitmap;
begin
w:=30;
for j:=0  to form2.data.Lines.Count-1 do
begin
     s:=form2.data.Lines[j];
     with TSpeedButton.Create(self) do
     begin
          parent:=scrollbox1;
          width:=38;
          height:=38;
          left:=8;
          top:=w;
          w:=w+height+8;
          showhint:=true;
          if copy(s,0,pos('{',s)-1)='д'then
             begin
                  helpcontext:=1;
                  s:=copy(s,pos('{',s)+1,length(s));
                  helpkeyword:=copy(s,0,pos('}',s)-1);
                  s:=copy(s,pos('}',s)+1,length(s));
                  hint:=copy(s,0,pos('}',s)-1);
                  s:=copy(s,pos('}',s)+1,length(s));
             end;
          if copy(s,0,pos('{',s)-1)='п'then
             begin
                  helpcontext:=2;
                  s:=copy(s,pos('{',s)+1,length(s));
                  helpkeyword:=copy(s,0,pos('}',s)-1);
                  s:=copy(s,pos('}',s)+1,length(s));
                  hint:=copy(s,0,pos('}',s)-1);
                  s:=copy(s,pos('}',s)+1,length(s));
             end;
          if copy(s,0,pos('{',s)-1)='ф'then
             begin
                  helpcontext:=3;
                  s:=copy(s,pos('{',s)+1,length(s));
                  helpkeyword:=copy(s,0,pos('}',s)-1);
                  s:=copy(s,pos('}',s)+1,length(s));
                  hint:=copy(s,0,pos('}',s)-1);
                  s:='5'
             end;
                  case strtoint(s)of
                  1:glyph:=image1.Picture.Bitmap;
                  2:glyph:=image2.Picture.Bitmap;
                  3:glyph:=image3.Picture.Bitmap;
                  4:glyph:=image4.Picture.Bitmap;
                  5: begin
                          i:=TICon.Create;
                          b:=TBitmap.Create;
                          i.Handle:=ExtractAssociatedIcon(HINSTANCE,pchar(helpkeyword),ic);
                          b.Width:=32;
                          b.Height:=32;
                          b.Transparent:=true;
                          b.Canvas.Draw(0,0,i);
                          glyph:=b;
                          b.Free;
                          i.Free;
                     end;
                  end;
          onclick:=self.Button3Click;
     end;
end;
w:=w+16;
label1.Left:=6;
label1.Top:=w-label1.Height-5;
if w>screen.WorkAreaHeight div 2 then
begin
     w:=screen.WorkAreaHeight div 2;
     width:=38+16;
end else width:=38+26;
height:=w;
top:=screen.WorkAreaHeight-height;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form2.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
with TSpeedButton(sender)do
begin
     case HelpContext of
     1,2:shellexecute(0,nil,'explorer.exe',pchar(helpkeyword),nil,sw_show);
     3:shellexecute(0,nil,pchar(helpkeyword),nil,nil,sw_show);
     end;
end;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if messagedlg('Закрыть?',mtConfirmation,[mbYes,mbNo],0)=mrNo then canclose:=false;
end;

end.
