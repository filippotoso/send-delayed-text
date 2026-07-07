unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    btnSend: TButton;
    Timer: TTimer;
    Memo: TMemo;
    udDelay: TUpDown;
    edDelay: TLabeledEdit;
    procedure TimerTimer(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure udDelayClick(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{$POINTERMATH ON}
procedure SendKeys(const S: String);
var
  InputEvents: PInput;
  I, J: Integer;
begin
  if S = '' then Exit;
  GetMem(InputEvents, SizeOf(TInput) * (Length(S) * 2));
  try
    J := 0;
    for I := 1 to Length(S) do
    begin
      InputEvents[J].Itype := INPUT_KEYBOARD;
      InputEvents[J].ki.wVk := 0;
      InputEvents[J].ki.wScan := Ord(S[I]);
      InputEvents[J].ki.dwFlags := KEYEVENTF_UNICODE;
      InputEvents[J].ki.time := 0;
      InputEvents[J].ki.dwExtraInfo := 0;
      Inc(J);
      InputEvents[J].Itype := INPUT_KEYBOARD;
      InputEvents[J].ki.wVk := 0;
      InputEvents[J].ki.wScan := Ord(S[I]);
      InputEvents[J].ki.dwFlags := KEYEVENTF_UNICODE or KEYEVENTF_KEYUP;
      InputEvents[J].ki.time := 0;
      InputEvents[J].ki.dwExtraInfo := 0;
      Inc(J);
    end;
    SendInput(J, InputEvents[0], SizeOf(TInput));
  finally
    FreeMem(InputEvents);
  end;
end;

procedure TMainForm.btnSendClick(Sender: TObject);
begin
Timer.Enabled:=True;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
Timer.Enabled := False;
SendKeys(Memo.Text);
end;

procedure TMainForm.udDelayClick(Sender: TObject; Button: TUDBtnType);
begin
Timer.Interval:=udDelay.Position * 1000;
end;

end.
