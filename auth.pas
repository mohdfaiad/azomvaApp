unit auth;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.TabControl, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, FMX.Ani, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, System.Rtti, IdURI,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.DBScope, // REST.JSON,
  System.Threading,
  Inifiles,
  System.IOUtils, FMX.Layouts, FMX.LoadingIndicator, Header, FireDAC.Stan.Async,
  FireDAC.DApt
{$IFDEF ANDROID}
    , Androidapi.JNI.Accounts,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI
{$ENDIF ANDROID}
    ;

type
  TauthForm = class(TForm)
    EditAuthEmail: TEdit;
    EditAuthPassword: TEdit;
    RectangleAuth: TRectangle;
    RESTRequestReg: TRESTRequest;
    RESTResponseReg: TRESTResponse;
    RESTRequestAuth: TRESTRequest;
    RESTResponseAuth: TRESTResponse;
    RESTResponseDataSetAdapterAuth: TRESTResponseDataSetAdapter;
    FDMemTableAuth: TFDMemTable;
    FloatAnimationEmailAuth: TFloatAnimation;
    Timer1: TTimer;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    RectanglePreloader: TRectangle;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    Image1: TImage;
    HeaderFrame1: THeaderFrame;
    FloatAnimationPassAuth: TFloatAnimation;
    StyleBookLoginForm: TStyleBook;
    ButtonLogin: TButton;
    RectanglePRecovery: TRectangle;
    ButtonGetActivationCode: TButton;
    FMXLoadingIndicatorActivationCode: TFMXLoadingIndicator;
    EditActivationCode: TEdit;
    ButtonSetActivationCode: TButton;
    Image3: TImage;
    EditPhoneNumberForActivation: TEdit;
    Image2: TImage;
    FloatAnimation1: TFloatAnimation;
    Image4: TImage;
    ButtonForgotPassword: TButton;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    FMXLoadingIndicatorLogin: TFMXLoadingIndicator;
    RESTRequestPRecovery: TRESTRequest;
    RESTResponsePRecovery: TRESTResponse;
    RESTResponseLoginPRecovery: TRESTResponse;
    RESTAdapterLoginPRecovery: TRESTResponseDataSetAdapter;
    FDMemTableLoginPRecovery: TFDMemTable;
    FDMemTableLoginPRecoveryid: TWideStringField;
    FDMemTableLoginPRecoveryuser_type_id: TWideStringField;
    FDMemTableLoginPRecoveryuser_status_id: TWideStringField;
    FDMemTableLoginPRecoveryfull_name: TWideStringField;
    FDMemTableLoginPRecoveryphone: TWideStringField;
    FDMemTableLoginPRecoveryemail: TWideStringField;
    FDMemTableLoginPRecoverycreate_date: TWideStringField;
    FDMemTableLoginPRecoverymodify_date: TWideStringField;
    FDMemTableLoginPRecoveryregipaddr: TWideStringField;
    FDMemTableLoginPRecoverysesskey: TWideStringField;
    FDMemTableLoginPRecoveryloginstatus: TWideStringField;
    FDMemTableLoginPRecoveryisSetLocations: TWideStringField;
    FDMemTableLoginPRecoverynotifications: TWideStringField;
    RESTRequestLoginPRecovery: TRESTRequest;
    FMXLoadingIndicatorSetActCode: TFMXLoadingIndicator;
    FDMemTableAuthid: TWideStringField;
    FDMemTableAuthuser_type_id: TWideStringField;
    FDMemTableAuthuser_status_id: TWideStringField;
    FDMemTableAuthrating: TWideStringField;
    FDMemTableAuthfull_name: TWideStringField;
    FDMemTableAuthphone: TWideStringField;
    FDMemTableAuthemail: TWideStringField;
    FDMemTableAuthcreate_date: TWideStringField;
    FDMemTableAuthmodify_date: TWideStringField;
    FDMemTableAuthregipaddr: TWideStringField;
    FDMemTableAuthsesskey: TWideStringField;
    FDMemTableAuthloginstatus: TWideStringField;
    FDMemTableAuthnotifications: TWideStringField;
    FDMemTableAuthAzomva_GCMAppID: TWideStringField;
    FDMemTableAuthAzomva_Legacy_server_key: TWideStringField;
    FDMemTableAuthMyContractsCount: TWideStringField;
    FDMemTableAuthMyAppsCount: TWideStringField;
    procedure Timer1Timer(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ButtonLoginClick(Sender: TObject);
    procedure ButtonForgotPasswordClick(Sender: TObject);
    procedure ButtonGetActivationCodeClick(Sender: TObject);
    procedure ButtonSetActivationCodeClick(Sender: TObject);
    procedure RESTRequestAuthAfterExecute(Sender: TCustomRESTRequest);
    procedure FloatAnimationEmailAuthFinish(Sender: TObject);
    procedure FloatAnimationPassAuthFinish(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
  private
    function checkEmailPass(EmailAddress, password, op: string): Boolean;
    procedure AuthHttpRequest(p_AuthEmail, p_AuthPassword: string);
    procedure deleteUser;
    procedure insertUser(p_params: TStringList);
    // function GetAccountEmails(const AccountType: String): TArray<String>;
    { Private declarations }
  public
    { Public declarations }
    closeAfterReg: Boolean;
    isConsole: Boolean;
    v_KeyboardVisible: Boolean;
    procedure initForm;
    function consoleAuth(p_AuthEmail, p_AuthPassword: string): Boolean;
  end;

var
  authForm: TauthForm;

implementation

{$R *.fmx}

uses DataModule, HelperUnit, Main, SetNewPassword;

procedure TauthForm.initForm;
const
  AccountType = 'com.azomva';
var
  AccountNames: TArray<String>;
  AccountLoopCounter: integer;

  helper: THelperUnit;
begin
  self.v_KeyboardVisible := False;
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  self.Show;
{$IFDEF DEBUG}
  { AccountNames := self.GetAccountEmails(AccountType);
    ListBox1.Items.Clear;
    ListBox1.Items.Add('test');
    for AccountLoopCounter := Low(AccountNames) to High(AccountNames) do
    ListBox1.Items.Add(AccountNames[AccountLoopCounter]); }
{$ENDIF}
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

procedure TauthForm.RESTRequestAuthAfterExecute(Sender: TCustomRESTRequest);
begin
  RectanglePreloader.Visible := False;
end;

procedure TauthForm.Timer1Timer(Sender: TObject);
begin
  FloatAnimationEmailAuth.Enabled := False;
  FloatAnimationPassAuth.Enabled := False;
  EditAuthEmail.FontColor := TAlphaColors.Grey;
end;

procedure TauthForm.ButtonForgotPasswordClick(Sender: TObject);
begin
  RectanglePRecovery.Visible := True;
end;

procedure TauthForm.Button4Click(Sender: TObject);
begin
  self.RectanglePRecovery.Visible := False;
end;

procedure TauthForm.ButtonGetActivationCodeClick(Sender: TObject);
begin
  if EditPhoneNumberForActivation.Text.Length = 9 then
  begin
    FMXLoadingIndicatorActivationCode.Visible := True;
    RESTRequestPRecovery.Params.Clear;
    RESTRequestPRecovery.AddParameter('code',
      EditPhoneNumberForActivation.Text);
    RESTRequestPRecovery.ExecuteAsync(
      procedure
      begin
        TThread.Queue(nil,
          procedure
          begin
            FMXLoadingIndicatorActivationCode.Visible := False;
          end);
        if RESTResponsePRecovery.Status.Success then
        begin
          TThread.Queue(nil,
            procedure
            begin
              ShowMessage(RESTResponsePRecovery.Content);
            end);
        end
        else
        begin
          TThread.Queue(nil,
            procedure
            begin
              ShowMessage('მოთხოვნის შესრულების დროს დაფიქსირდა შეცდომა!');
            end);
        end;
      end);
  end
  else
  begin
    ShowMessage('გთხოვთ მიუთითოთ 9 ნიშნა მობილური ტელეფონის ნომერი!');
  end;
end;

procedure TauthForm.ButtonSetActivationCodeClick(Sender: TObject);
begin
  FMXLoadingIndicatorActivationCode.Visible := True;
  RESTRequestPRecovery.Params.Clear;
  RESTRequestPRecovery.AddParameter('code', EditPhoneNumberForActivation.Text);
  RESTRequestPRecovery.ExecuteAsync(
    procedure
    begin
      if RESTResponsePRecovery.Status.Success then
      begin
        TThread.Queue(nil,
          procedure
          begin
            FMXLoadingIndicatorSetActCode.Visible := False;
            self.isConsole := True;
          end);
      end
      else
      begin
        TThread.Queue(nil,
          procedure
          begin
            FMXLoadingIndicatorSetActCode.Visible := False;
            ShowMessage('მოთხოვნის შესრულების დროს დაფიქსირდა შეცდომა!');
          end);
      end;
    end);
end;

function TauthForm.checkEmailPass(EmailAddress, password, op: string): Boolean;
// var HelperUnit: THelperUnit;
begin
  // HelperUnit := THelperUnit.Create;
  if self.EditAuthEmail.Text.Length < 6 then
  begin
    FloatAnimationEmailAuth.Enabled := True;
    Timer1.Enabled := True;
    self.RectanglePreloader.Visible := False;
    Result := False;
  end;
  if self.EditAuthPassword.Text.Length < 3 then
  begin
    FloatAnimationPassAuth.Enabled := True;
    self.RectanglePreloader.Visible := False;
    Result := False;
  end;
  if (self.EditAuthEmail.Text.Length > 6) and
    (self.EditAuthPassword.Text.Length >= 3) then
    Result := True;
end;

procedure TauthForm.ButtonLoginClick(Sender: TObject);
var
  v_params: TStringList;
begin
  if self.checkEmailPass(EditAuthEmail.Text, EditAuthPassword.Text, 'signin') = False
  then
    exit;
  TButton(Sender).Text := 'იტვირთება...';
  if self.consoleAuth(EditAuthEmail.Text, EditAuthPassword.Text) = True then
  begin
    if DModule.FDConnectionMain.Connected then
    begin
      DModule.FDTableCurrentUser.Active := True;
      self.deleteUser;
      v_params := TStringList.Create;
      v_params.Add(FDMemTableAuth.FieldByName('full_name').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('phone').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('email').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('sesskey').AsString);
      v_params.Add(DateTimeToStr(Now));
      v_params.Add(FDMemTableAuth.FieldByName('Azomva_Legacy_server_key')
        .AsString);
      v_params.Add(FDMemTableAuth.FieldByName('Azomva_GCMAppID').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('MyContractsCount').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('MyAppsCount').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('notifications').AsString);
      self.insertUser(v_params);
      MainForm.userAuthUI;
      FMXLoadingIndicatorLogin.Visible := False;
      FMXLoadingIndicatorLogin.Enabled := False;
    end;
    self.Close;
  end
  else
  begin
    TButton(Sender).Text := 'ავტორიზაცია';
    ShowMessage('ელ.ფოსტა ან პაროლი არ არის სწორი!');
  end;
end;

procedure TauthForm.deleteUser;
begin
  with DModule.FDQueryCustom do
  begin
    SQL.Clear;
    SQL.Add('delete from ' + DModule.SQLiteDBName + '.current_user');
    ExecSQL;
  end;
  DModule.FDTableCurrentUser.Refresh;
end;

procedure TauthForm.insertUser(p_params: TStringList);
var
  i: integer;
begin
  with DModule.FDQueryCustom do
  begin
    SQL.Clear;
    SQL.Add('insert into ' + DModule.SQLiteDBName + '.current_user ');
    SQL.Add('(full_name,phone,email,token,created,Legacy_server_key,GCMAppID,MyContractsCount,MyAppsCount,notifications)');
    SQL.Add('values');
    SQL.Add('("' + p_params.Strings[0] + '","' + p_params.Strings[1] + '","' +
      p_params.Strings[2] + '","' + p_params.Strings[3] + '","' +
      p_params.Strings[4] + '","' + p_params.Strings[5] + '","' +
      p_params.Strings[6] + '","' + p_params.Strings[7] + '","' +
      p_params.Strings[8] + '","' + p_params.Strings[9] + '")');
    ExecSQL;
  end;
  DModule.FDTableCurrentUser.Refresh;
end;

procedure TauthForm.AuthHttpRequest(p_AuthEmail, p_AuthPassword: string);
begin
  RESTRequestAuth.Params.Clear;
  RESTRequestAuth.AddParameter('email', p_AuthEmail);
  RESTRequestAuth.AddParameter('password', p_AuthPassword);
  RESTRequestAuth.AddParameter('op', 'login');
  RESTRequestAuth.Execute;
end;

function TauthForm.consoleAuth(p_AuthEmail, p_AuthPassword: string): Boolean;
var
  v_params: TStringList;
begin
  self.AuthHttpRequest(p_AuthEmail, p_AuthPassword);
  if FDMemTableAuth.FieldByName('loginstatus').AsInteger = 1 then
  begin
    if DModule.FDConnectionMain.Connected then
    begin
      DModule.FDTableCurrentUser.Active := True;
      self.deleteUser;
      v_params := TStringList.Create;
      v_params.Add(FDMemTableAuth.FieldByName('full_name').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('phone').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('email').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('sesskey').AsString);
      v_params.Add(DateTimeToStr(Now));
      v_params.Add(FDMemTableAuth.FieldByName('Azomva_Legacy_server_key')
        .AsString);
      v_params.Add(FDMemTableAuth.FieldByName('Azomva_GCMAppID').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('MyContractsCount').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('MyAppsCount').AsString);
      v_params.Add(FDMemTableAuth.FieldByName('notifications').AsString);
      self.insertUser(v_params);
    end;
    DModule.id := FDMemTableAuth.FieldByName('id').AsInteger;
    DModule.full_name := FDMemTableAuth.FieldByName('full_name').AsString;
    DModule.phone := FDMemTableAuth.FieldByName('phone').AsString;
    DModule.email := FDMemTableAuth.FieldByName('email').AsString;
    DModule.sesskey := FDMemTableAuth.FieldByName('sesskey').AsString;
    DModule.notifications := FDMemTableAuth.FieldByName('notifications')
      .AsInteger;
    DModule.MyContractsCount := FDMemTableAuth.FieldByName('MyContractsCount')
      .AsInteger;
    DModule.MyAppsCount := FDMemTableAuth.FieldByName('MyAppsCount').AsInteger;
    DModule.Azomva_GCMAppID := FDMemTableAuth.FieldByName
      ('Azomva_GCMAppID').AsString;
    DModule.Azomva_Legacy_server_key := FDMemTableAuth.FieldByName
      ('Azomva_Legacy_server_key').AsString;
    MainForm.userAuthUI;
    Result := True;
  end
  else
    Result := False;
end;

procedure TauthForm.FloatAnimationEmailAuthFinish(Sender: TObject);
begin
  EditAuthEmail.Position.X := 15;
end;

procedure TauthForm.FloatAnimationPassAuthFinish(Sender: TObject);
begin
  EditAuthPassword.Position.X := 15;
end;

procedure TauthForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TauthForm.FormCreate(Sender: TObject);
begin
  self.closeAfterReg := False;
end;

procedure TauthForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
Shift: TShiftState);
begin
  if self.v_KeyboardVisible = False then
    if Key = 137 then
      self.Close;
end;

procedure TauthForm.FormVirtualKeyboardHidden(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  self.v_KeyboardVisible := False;
end;

procedure TauthForm.FormVirtualKeyboardShown(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  self.v_KeyboardVisible := True;
end;

procedure TauthForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  if RectanglePRecovery.Visible = True then
    RectanglePRecovery.Visible := False
  else
    self.Close;
end;

end.
