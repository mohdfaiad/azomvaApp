unit UserGanmcxadebeliReg;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Header,
  FMX.StdCtrls, FMX.Ani,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, System.Threading, IdURI, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope,
  FMX.Layouts, FMX.LoadingIndicator, Inifiles, System.IOUtils;

type
  TGanmcxadeblisRegForm = class(TForm)
    HeaderFrame1: THeaderFrame;
    CPasswordEdit: TEdit;
    EmailEdit: TEdit;
    FloatAnimationEmailReg: TFloatAnimation;
    FullNameEdit: TEdit;
    PasswordEdit: TEdit;
    PhoneEdit: TEdit;
    RegButton: TButton;
    RESTRequestReg: TRESTRequest;
    RESTResponseReg: TRESTResponse;
    RectanglePreloader: TRectangle;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    ButtonConfirmation: TButton;
    LabelConfirmation: TLabel;
    RectangleConfirmation: TRectangle;
    EditConfirmation: TEdit;
    RESTRequestActivation: TRESTRequest;
    RESTResponseActivation: TRESTResponse;
    RectangleAuthIn: TRectangle;
    EditAuthEmail: TEdit;
    FloatAnimationEmailAuth: TFloatAnimation;
    EditAuthPassword: TEdit;
    ButtonAuth: TButton;
    Image1: TImage;
    ButtonCloseAuth: TButton;
    Button1: TButton;
    StyleBookEditButtons: TStyleBook;
    ImageSignUp: TImage;
    RectangleAuth: TRectangle;
    FloatAnimationPassAuth: TFloatAnimation;
    TimerWrongEmailOrPass: TTimer;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    VertScrollBoxMain: TVertScrollBox;
    FMXLoadingIndicatorLogin: TFMXLoadingIndicator;
    RESTResponseDataSetAdapterReg: TRESTResponseDataSetAdapter;
    FDMemTableReg: TFDMemTable;
    FDMemTableRegstatus: TWideStringField;
    FDMemTableRegmsg: TWideStringField;
    FMXLoadingIndicatorReg: TFMXLoadingIndicator;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    procedure RegButtonClick(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure ButtonConfirmationClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonAuthClick(Sender: TObject);
    procedure ButtonCloseAuthClick(Sender: TObject);
    procedure Label1Tap(Sender: TObject; const Point: TPointF);
    procedure Button1Click(Sender: TObject);
    procedure TimerWrongEmailOrPassTimer(Sender: TObject);
    procedure FullNameEditEnter(Sender: TObject);
    procedure FloatAnimationEmailAuthFinish(Sender: TObject);
    procedure FloatAnimationPassAuthFinish(Sender: TObject);
    procedure PhoneEditEnter(Sender: TObject);
    procedure EmailEditEnter(Sender: TObject);
    procedure PasswordEditEnter(Sender: TObject);
    procedure CPasswordEditEnter(Sender: TObject);
    procedure FullNameEditExit(Sender: TObject);
    procedure EmailEditExit(Sender: TObject);
    procedure PhoneEditExit(Sender: TObject);
    procedure PasswordEditExit(Sender: TObject);
    procedure CPasswordEditExit(Sender: TObject);
  private
    function equalPassword(pass1, pass2: string): boolean;
    function checkEmailPass(EmailAddress, password, op: string): boolean;
    { Private declarations }
  public
    { Public declarations }
    closeAfterReg: boolean;
    procedure initForm;
  end;

var
  GanmcxadeblisRegForm: TGanmcxadeblisRegForm;

implementation

{$R *.fmx}

uses Main, DataModule, auth, HelperUnit;
{ TForm1 }

procedure TGanmcxadeblisRegForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TGanmcxadeblisRegForm.initForm;
var
  vauthForm: TauthForm;
  helper: THelperUnit;
begin
  self.Show;
  self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.HeaderFrame1.LabelAppName.Text := 'განმცხადებლის რეგისტრაცია';
{$IFDEF ANDROID}
  { if TOSVersion.Major >= 6 then // Check(6)
    begin
    helper := THelperUnit.Create;
    try
    helper.AndroidCheckAndRequestStoragePermission;
    finally
    helper.Free;
    end;
    end; }
{$ENDIF}
end;

procedure TGanmcxadeblisRegForm.Label1Tap(Sender: TObject; const Point: TPointF);
begin
  RectangleAuth.Visible := True;
end;

procedure TGanmcxadeblisRegForm.Button1Click(Sender: TObject);
begin
  RectangleAuth.Visible := True;
end;

procedure TGanmcxadeblisRegForm.ButtonAuthClick(Sender: TObject);
var
  vauthForm: TauthForm;
  aTask: ITask;
begin
  vauthForm := TauthForm.Create(Application);
  try
    if self.checkEmailPass(EditAuthEmail.Text, EditAuthPassword.Text, 'signin') = False then
      exit;
    FMXLoadingIndicatorLogin.Visible := True;
    // aTask := TTask.Create(
    // procedure()
    // begin
    if vauthForm.consoleAuth(EditAuthEmail.Text, EditAuthPassword.Text) = True then
    begin
      FMXLoadingIndicatorLogin.Visible := False;
      TThread.Queue(nil,
        procedure
        begin
          ShowMessage('ავტორიზაციამ ჩაიარა წარმატებით');
        end);
      self.Close;
    end
    else
    begin
      FMXLoadingIndicatorLogin.Visible := False;
      TThread.Queue(nil,
        procedure
        begin
          ShowMessage('ელ-ფოსტა ან პაროლი არ არის სწორი!');
        end);
    end;
    // end);
    // aTask.Start;
  finally
    vauthForm.Free;
  end;
end;

function TGanmcxadeblisRegForm.checkEmailPass(EmailAddress, password, op: string): boolean;
// var HelperUnit: THelperUnit;
begin
  // HelperUnit := THelperUnit.Create;
  Result := False;
  if self.EditAuthEmail.Text.Length < 6 then
  begin
    FloatAnimationEmailAuth.Enabled := True;
    TimerWrongEmailOrPass.Enabled := True;
    self.RectanglePreloader.Visible := False;
    Result := False;
  end;
  if self.EditAuthPassword.Text.Length < 3 then
  begin
    FloatAnimationPassAuth.Enabled := True;
    self.RectanglePreloader.Visible := False;
    Result := False;
  end;
  if (self.EditAuthEmail.Text.Length > 6) and (self.EditAuthPassword.Text.Length >= 3) then
    Result := True;
end;

procedure TGanmcxadeblisRegForm.ButtonCloseAuthClick(Sender: TObject);
begin
  RectangleAuth.Visible := False;
end;

procedure TGanmcxadeblisRegForm.ButtonConfirmationClick(Sender: TObject);
begin
  if ButtonConfirmation.Tag = 0 then
  begin
    EditConfirmation.CanFocus := True;
    ButtonConfirmation.Text := 'დადასტურება';
    ButtonConfirmation.Tag := 1;
  end
  else if ButtonConfirmation.Tag = 1 then
  begin
    ButtonConfirmation.Text := 'იტვირთება...';
    ButtonConfirmation.Tag := 2;
    RESTRequestActivation.Execute;
    { if EditConfirmation.Text = '1234' then
      begin
      ShowMessage('აქტივაციამ ჩაიარა წარმატებით');
      self.Close;
      end; }
  end;
end;

function TGanmcxadeblisRegForm.equalPassword(pass1, pass2: string): boolean;
begin
  if pass1.Equals(pass2) then
  begin
    Result := True;
  end
  else
  begin
    PasswordEdit.FontColor := TAlphaColors.Red;
    Result := False;
  end;
end;

procedure TGanmcxadeblisRegForm.FloatAnimationEmailAuthFinish(Sender: TObject);
begin
  EditAuthEmail.Position.X := 10;
end;

procedure TGanmcxadeblisRegForm.FloatAnimationPassAuthFinish(Sender: TObject);
begin
  EditAuthPassword.Position.X := 10;
end;

procedure TGanmcxadeblisRegForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TGanmcxadeblisRegForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    self.Close;
end;

procedure TGanmcxadeblisRegForm.FullNameEditExit(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 0);
end;

procedure TGanmcxadeblisRegForm.EmailEditExit(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 0);
end;

procedure TGanmcxadeblisRegForm.PhoneEditExit(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 0);
end;

procedure TGanmcxadeblisRegForm.PasswordEditExit(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 0);
end;

procedure TGanmcxadeblisRegForm.CPasswordEditExit(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 0);
end;

// -------------FullName position-------------
procedure TGanmcxadeblisRegForm.FullNameEditEnter(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 90);
end;

// -------------Email position-------------
procedure TGanmcxadeblisRegForm.EmailEditEnter(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 150);
end;

// -------------Phone position-------------
procedure TGanmcxadeblisRegForm.PhoneEditEnter(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 215);
end;

// -------------Password position-------------
procedure TGanmcxadeblisRegForm.PasswordEditEnter(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 275);
end;

// -------------CPassword position-------------
procedure TGanmcxadeblisRegForm.CPasswordEditEnter(Sender: TObject);
begin
  VertScrollBoxMain.ViewportPosition := PointF(VertScrollBoxMain.ViewportPosition.X, 335);
end;

procedure TGanmcxadeblisRegForm.RegButtonClick(Sender: TObject);
var
  password: string;
  aTask: ITask;
begin
  if self.equalPassword(PasswordEdit.Text, CPasswordEdit.Text) = True then
    password := PasswordEdit.Text
  else
  begin
    ShowMessage('პაროლის ველები არ მეთხვევა ერთმანეთს');
    exit;
  end;

  if PhoneEdit.Text.Length < 9 then
  begin
    ShowMessage('გთხოვთ შეიყვანოთ ტელეფონის ნომერი');
    exit;
  end;
  self.FMXLoadingIndicatorReg.Visible := True;
  self.FMXLoadingIndicatorReg.Enabled := True;
  aTask := TTask.Create(
    procedure()
    var
      status: integer;
      msg: string;
      vauthForm: TauthForm;
      auth: boolean;
    begin
      RESTRequestReg.Params.Clear;
      RESTRequestReg.AddParameter('user_type_id', '1');
      RESTRequestReg.AddParameter('full_name', TIdURI.ParamsEncode(FullNameEdit.Text));
      RESTRequestReg.AddParameter('email', TIdURI.ParamsEncode(EmailEdit.Text));
      RESTRequestReg.AddParameter('phone', PhoneEdit.Text);
      RESTRequestReg.AddParameter('password', password);
      RESTRequestReg.Execute;
      self.FMXLoadingIndicatorReg.Visible := False;
      self.FMXLoadingIndicatorReg.Enabled := False;
      status := FDMemTableReg.FieldByName('status').AsInteger;
      msg := FDMemTableReg.FieldByName('msg').AsString;
      if status = 1 then
      begin
        TThread.Queue(nil,
          procedure
          begin
            ShowMessage(msg);
          end);
        vauthForm := TauthForm.Create(Application);
        try
          auth := vauthForm.consoleAuth(EditAuthEmail.Text, EditAuthPassword.Text);
        finally
          vauthForm.Free;
        end;
        if auth = True then
          self.Close;
      end
      else if status = 0 then
      begin
        ShowMessage(msg);
      end
      else if status = 3 then
      begin
        // RectangleConfirmation.Visible := True;
        LabelConfirmation.Text := msg;
      end;
    end);
  aTask.Start;
end;

procedure TGanmcxadeblisRegForm.TimerWrongEmailOrPassTimer(Sender: TObject);
begin
  FloatAnimationEmailAuth.Enabled := False;
  FloatAnimationPassAuth.Enabled := False;
  EditAuthEmail.FontColor := TAlphaColors.Grey;
end;

end.
