unit SetNewPassword;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Edit,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client, FMX.Layouts,
  FMX.LoadingIndicator, Header;

type
  TsetNewPasswordForm = class(TForm)
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    EditNewPassC: TEdit;
    EditNewPass: TEdit;
    ButtonSetNewPassword: TButton;
    StyleBookUserArea: TStyleBook;
    Image4: TImage;
    RESTRequestSetNewPass: TRESTRequest;
    RESTResponseSetNewPass: TRESTResponse;
    FMXLoadingIndicatorSetNewPass: TFMXLoadingIndicator;
    HeaderFrame1: THeaderFrame;
    procedure ButtonSetNewPasswordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure HeaderFrame1ButtonBackKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    function equalPassword(pass1, pass2: string): boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure initForm(p_user_id: integer);
  end;

var
  setNewPasswordForm: TsetNewPasswordForm;

implementation

{$R *.fmx}

uses DataModule, Main;

{ TsetNewPasswordForm }

procedure TsetNewPasswordForm.ButtonSetNewPasswordClick(Sender: TObject);
begin

  if self.equalPassword(EditNewPass.Text, EditNewPassC.Text) = false then
  begin
    ShowMessage('პაროლის გამეორება არ ემთხვევა ერთმანეთს');
  end
  else if EditNewPass.Text.Length < 6 then
  begin
    ShowMessage('პაროლი უნდა შედგებოდეს მინიმუმ 6 სიმბოლოსგან');
  end
  else
  begin
    FMXLoadingIndicatorSetNewPass.Visible := True;
    RESTRequestSetNewPass.Params.Clear;
    RESTRequestSetNewPass.AddParameter('newpassword', EditNewPass.Text);
    RESTRequestSetNewPass.AddParameter('newpassword', EditNewPassC.Text);
    RESTRequestSetNewPass.AddParameter('sesskey', DModule.sesskey);
    RESTRequestSetNewPass.ExecuteAsync(
      procedure
      begin
        if RESTResponseSetNewPass.Status.Success then
        begin
          setNewPasswordForm.FMXLoadingIndicatorSetNewPass.Visible := false;
          MainForm.userAuthUI;
          setNewPasswordForm.Close;
        end
        else
        begin
          setNewPasswordForm.FMXLoadingIndicatorSetNewPass.Visible := false;
          ShowMessage('მოთხოვნის შესრულების დროს დაფიქსირდა შეცდომა!');
        end;
      end, True, True);
  end;
end;

procedure TsetNewPasswordForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.Free;
end;

procedure TsetNewPasswordForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  HeaderFrame1.ButtonBackClick(Sender);
end;

procedure TsetNewPasswordForm.HeaderFrame1ButtonBackKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
Shift: TShiftState);
begin
  if Key = 137 then
    self.Close;
end;

procedure TsetNewPasswordForm.initForm(p_user_id: integer);
begin
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  HeaderFrame1.LabelAppName.Text := 'შეიყვანეთ ახალი პაროლი';
end;

function TsetNewPasswordForm.equalPassword(pass1, pass2: string): boolean;
begin
  if pass1.Equals(pass2) then
  begin
    Result := True;
  end
  else
  begin
    Result := false;
  end;
end;

end.
