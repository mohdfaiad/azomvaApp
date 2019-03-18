unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.MultiView, FMX.StdCtrls, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.Layouts, FMX.Ani, FMX.Effects,
  FMX.Filter.Effects, System.ImageList, FMX.ImgList, FMX.Platform,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.DBScope,
  System.Rtti, System.Bindings.Outputs, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, FMX.TabControl, FMX.Gestures, System.Threading,
  System.PushNotification,
  System.Notification,
  FMX.ScrollBox, FMX.Memo,
  IdURI, IdHTTP, System.IOUtils,
  Inifiles, FMX.Header,
  System.Messaging, FireDAC.Stan.Async, FireDAC.DApt,
  NotificationOffersFR, FMX.LoadingIndicator,
  DataModule, IPPeerClient, REST.Backend.PushTypes, System.JSON,
  REST.Backend.BindSource, REST.Backend.PushDevice, FrameStand,
  // App Frames
  User2ListFR, MyAppsFR, MyContractsFR
{$IFDEF ANDROID}
    , DW.PushClient,
  // System.Android.Service,
  // FMX.DialogService,
  // Androidapi.JNI.PlayServices,
  // Androidapi.JNI.Telephony,
  // System.Android.Notification,
  FMX.PushNotification.Android,
  Grijjy.RemotePush.Receiver,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Net,
  Androidapi.JNI.Provider
{$ENDIF ANDROID}
{$IFDEF IOS}
    , FMX.PushNotification.IOS
{$ENDIF};

type
  TMainForm = class(TForm)
    ActionList1: TActionList;
    AuthAction: TAction;
    RectangleNonAuth: TRectangle;
    RectangleProfile: TRectangle;
    ButtonAddApp: TButton;
    ButtonUserNotifications: TButton;
    ButtonMyApps: TButton;
    ActionAppAdding: TAction;
    ActionMyApps: TAction;
    ActionUserArea: TAction;
    RESTRequestVersioning: TRESTRequest;
    RESTResponseVersioning: TRESTResponse;
    TimerVersioning: TTimer;
    BindingsList1: TBindingsList;
    TabControl1: TTabControl;
    TabItemMain: TTabItem;
    TabItemMyApps: TTabItem;
    TabItemUserArea: TTabItem;
    TabItemMyOffers: TTabItem;
    RectangleBannerApps: TRectangle;
    GestureManager1: TGestureManager;
    ActiontabSliderRight: TAction;
    ActiontabSliderLeft: TAction;
    ChangeTabActionRight: TChangeTabAction;
    ChangeTabActionLeft: TChangeTabAction;
    StyleBookMainForm: TStyleBook;
    ButtonSettings: TButton;
    RectangleApps: TRectangle;
    LabelTotalAppsCount: TLabel;
    ButtonSignOut: TButton;
    ActionSignOut: TAction;
    RESTRequestSignOut: TRESTRequest;
    RESTResponseSignOut: TRESTResponse;
    TextMainPageText: TText;
    RESTResponseDataSetAdapterInit: TRESTResponseDataSetAdapter;
    FDMemTableInit: TFDMemTable;
    PreloaderRectangle: TRectangle;
    ImageList1: TImageList;
    RectangleMainHeader: TRectangle;
    ButtonMasterView: TButton;
    ActionUserNotifications: TAction;
    BindSourceDB2: TBindSourceDB;
    LabelApps: TLabel;
    MultiView1: TMultiView;
    ButtonAppAdding: TButton;
    RESTRequestDeviceToken: TRESTRequest;
    NotificationCenter1: TNotificationCenter;
    RESTResponseDataSetAdapterAuth: TRESTResponseDataSetAdapter;
    FDMemTableAuth: TFDMemTable;
    FDMemTableAuthid: TWideStringField;
    FDMemTableAuthuser_type_id: TWideStringField;
    FDMemTableAuthuser_status_id: TWideStringField;
    FDMemTableAuthfname: TWideStringField;
    FDMemTableAuthlname: TWideStringField;
    FDMemTableAuthphone: TWideStringField;
    FDMemTableAuthemail: TWideStringField;
    FDMemTableAuthcreate_date: TWideStringField;
    FDMemTableAuthmodify_date: TWideStringField;
    FDMemTableAuthregipaddr: TWideStringField;
    FDMemTableAuthsesskey: TWideStringField;
    FDMemTableAuthloginstatus: TWideStringField;
    FDMemTableAuthisSetLocations: TWideStringField;
    ActionRegGanmcxadebeli: TAction;
    LabelFullName: TLabel;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    TabItemMyContracts: TTabItem;
    ButtonAmzomvelebi: TButton;
    ButtonUserArea: TButton;
    ButtonAppsList: TButton;
    ButtonGanmcxReg: TButton;
    ButtonAuth: TButton;
    ButtonContracts: TButton;
    ActionMyContracts: TAction;
    ImageLogo: TImage;
    RESTResponseDSAInitUser: TRESTResponseDataSetAdapter;
    FDMemTableInitUser: TFDMemTable;
    ActionAppsList: TAction;
    RectangleAppsCount: TRectangle;
    ImageListRed: TImageList;
    Line1: TLine;
    RectangleAuthReg: TRectangle;
    RectangleRegGanmcxadeblis: TRectangle;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Label3: TLabel;
    RectangleUserArea: TRectangle;
    Image1: TImage;
    HorzScrollBox1: THorzScrollBox;
    RectangleService2: TRectangle;
    Image5: TImage;
    Label4: TLabel;
    RectangleService6: TRectangle;
    Image6: TImage;
    Label5: TLabel;
    RectangleService5: TRectangle;
    Image8: TImage;
    Label7: TLabel;
    LabelDetails: TLabel;
    Image9: TImage;
    ImageAzomva: TImage;
    ImageServicesIcon: TImage;
    VertScrollBox1: TVertScrollBox;
    RectangleText: TRectangle;
    RectangleMain: TRectangle;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    RectangleHowItWork: TRectangle;
    RectangleInfo: TRectangle;
    LabelInfoTitle: TLabel;
    FDMemTableServices: TFDMemTable;
    RESTResponseDataSetAdapterservices: TRESTResponseDataSetAdapter;
    FDMemTableServicesid: TWideStringField;
    FDMemTableServicestitle: TWideStringField;
    FDMemTableServicescontent: TWideStringField;
    FDMemTableServicesmeta_keywords: TWideStringField;
    FDMemTableServicesmeta_description: TWideStringField;
    FDMemTableServicescreate_date: TWideStringField;
    FDMemTableServicesmodify_date: TWideStringField;
    ActionService1: TAction;
    ActionService3: TAction;
    ActionService2: TAction;
    TextInfo: TText;
    InfoButtonAddApp: TButton;
    VertScrollBox2: TVertScrollBox;
    FloatAnimationInfoDialog: TFloatAnimation;
    Rectangle4BottomMargin: TRectangle;
    FDMemTableHowItWorks: TFDMemTable;
    RESTResponseDataSetAHowItWorks: TRESTResponseDataSetAdapter;
    FDMemTableHowItWorksid: TWideStringField;
    FDMemTableHowItWorkstitle: TWideStringField;
    FDMemTableHowItWorkscontent: TWideStringField;
    FDMemTableHowItWorksmeta_keywords: TWideStringField;
    FDMemTableHowItWorksmeta_description: TWideStringField;
    FDMemTableHowItWorkscreate_date: TWideStringField;
    FDMemTableHowItWorksmodify_date: TWideStringField;
    FDMemTableInittotal_apps_count: TWideStringField;
    FDMemTableInitweek_apps_count: TWideStringField;
    FDMemTableInitusers2count: TWideStringField;
    FDMemTableInitapp_name: TWideStringField;
    FDMemTableInitAzomva_GCMAppID: TWideStringField;
    FDMemTableInitAzomva_Legacy_server_key: TWideStringField;
    FDMemTableInitaction: TWideStringField;
    FDMemTableInitmsg: TWideStringField;
    ButtonAbout: TButton;
    RESTRequestMyAppsCount: TRESTRequest;
    RESTRespMyAppsCount: TRESTResponse;
    RESTResponseDataSetMyAppsCount: TRESTResponseDataSetAdapter;
    FDMemTableMyAppsCount: TFDMemTable;
    FDMemTableMyAppsCountTotalAppsCount: TWideStringField;
    FDMemTableMyAppsCountMyAppsCount: TWideStringField;
    RectangleService7: TRectangle;
    Image4: TImage;
    Label2: TLabel;
    RectangleService8: TRectangle;
    Image7: TImage;
    Label6: TLabel;
    RectangleMyAppsPleaseLogin: TRectangle;
    RectangleMyOffersPleaseLogin: TRectangle;
    RectangleMyContractsPleaseLogin: TRectangle;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    VertScrollBoxProfile: TVertScrollBox;
    RectProfileContent: TRectangle;
    Line2: TLine;
    Rectangle1: TRectangle;
    ShadowEffect7: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect8: TShadowEffect;
    TimerVersioningOpenTable: TTimer;
    FDMemTableInitUserid: TWideStringField;
    FDMemTableInitUseruser_type_id: TWideStringField;
    FDMemTableInitUseruser_status_id: TWideStringField;
    FDMemTableInitUserrating: TWideStringField;
    FDMemTableInitUserfull_name: TWideStringField;
    FDMemTableInitUserphone: TWideStringField;
    FDMemTableInitUseremail: TWideStringField;
    FDMemTableInitUsercreate_date: TWideStringField;
    FDMemTableInitUsermodify_date: TWideStringField;
    FDMemTableInitUserregipaddr: TWideStringField;
    FDMemTableInitUsersesskey: TWideStringField;
    FDMemTableInitUserloginstatus: TWideStringField;
    FDMemTableInitUserisSetLocations: TWideStringField;
    FDMemTableInitUserMyAppsCount: TWideStringField;
    FDMemTableInitUserMyContractsCount: TWideStringField;
    FDMemTableInitUsernotifications: TWideStringField;
    PushEvents1: TPushEvents;
    SpeedButtonAddApp: TSpeedButton;
    FrameStandMyApps: TFrameStand;
    FrameStandNotifications: TFrameStand;
    ShadowEffect1: TShadowEffect;
    FrameStandContracts: TFrameStand;
    CircleAddButton: TCircle;
    procedure AuthActionExecute(Sender: TObject);
    procedure ActionAppAddingExecute(Sender: TObject);
    procedure ActionMyAppsExecute(Sender: TObject);
    procedure ActionUserAreaExecute(Sender: TObject);
    procedure TimerVersioningTimer(Sender: TObject);
    procedure ActionSignOutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NotificationCenter1ReceiveLocalNotification(Sender: TObject;
      ANotification: TNotification);
    procedure ActionRegGanmcxadebeliExecute(Sender: TObject);
    procedure ButtonUserAreaClick(Sender: TObject);
    procedure ButtonAppsListClick(Sender: TObject);
    procedure ActionMyContractsExecute(Sender: TObject);
    procedure ActionAppsListExecute(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure RectangleAuthRegClick(Sender: TObject);
    procedure RectangleRegGanmcxadeblisClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure LabelAppsClick(Sender: TObject);
    procedure ActionService1Execute(Sender: TObject);
    procedure ActionService2Execute(Sender: TObject);
    procedure ActionService3Execute(Sender: TObject);
    procedure InfoButtonAddAppClick(Sender: TObject);
    procedure RESTRequestVersioningHTTPProtocolError
      (Sender: TCustomRESTRequest);
    procedure TextMainPageTextTap(Sender: TObject; const Point: TPointF);
    procedure ActionUserNotificationsExecute(Sender: TObject);
    procedure Image8Tap(Sender: TObject; const Point: TPointF);
    procedure Image5Tap(Sender: TObject; const Point: TPointF);
    procedure Image7Tap(Sender: TObject; const Point: TPointF);
    procedure Image4Tap(Sender: TObject; const Point: TPointF);
    procedure Image6Tap(Sender: TObject; const Point: TPointF);
    procedure Label7Tap(Sender: TObject; const Point: TPointF);
    procedure Label4Tap(Sender: TObject; const Point: TPointF);
    procedure Label6Tap(Sender: TObject; const Point: TPointF);
    procedure Label2Tap(Sender: TObject; const Point: TPointF);
    procedure Label5Tap(Sender: TObject; const Point: TPointF);
    procedure RectangleAppsTap(Sender: TObject; const Point: TPointF);
    procedure RectangleBannerAppsTap(Sender: TObject; const Point: TPointF);
    procedure LabelTotalAppsCountTap(Sender: TObject; const Point: TPointF);
    procedure TextInfoTap(Sender: TObject; const Point: TPointF);
    procedure LabelInfoTitleTap(Sender: TObject; const Point: TPointF);
    procedure RectangleHowItWorkTap(Sender: TObject; const Point: TPointF);
    procedure RectangleAppsClick(Sender: TObject);
    procedure RESTRequestVersioningAfterExecute(Sender: TCustomRESTRequest);
    procedure TimerVersioningOpenTableTimer(Sender: TObject);
    procedure ButtonMainAddAppTap(Sender: TObject; const Point: TPointF);
    procedure SpeedButtonAddAppClick(Sender: TObject);
    // procedure DoReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);
    // procedure DoServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
  private
    VMyAppsFrame: TFrameInfo<TMyAppsFrame>;
    VNotificationOffersFrame: TFrameInfo<TNotificationOffersFrame>;
    VMyContractsFrame: TFrameInfo<TMyContractsFrame>;
{$IFDEF ANDROID or IOS}
    procedure PushClientChangeHandler(Sender: TObject;
      AChange: TPushService.TChanges);
    procedure PushClientReceiveNotificationHandler(Sender: TObject;
      const ANotification: TPushServiceNotification);

    // procedure ServiceAppStart;
    // function isServiceStarted: Boolean;
{$ENDIF ANDROID}
    procedure userAuthData;
    // function isServiceStarted: Boolean;
    function getDeviceID: string;
    procedure OnRegistrationError(Sender: TObject; const Error: string);
    procedure initNotificationReceiver;
    procedure loadFrames;
    { Private declarations }
  public
    { Public declarations }
{$IFDEF ANDROID or IOS}
    FPushClient: TPushClient;
    PushService: TPushService;
    ServiceConnection: TPushServiceConnection;
    procedure notificationAlert(p_notification_id, p_ApplicationIconBadgeNumber
      : integer);
{$ENDIF}
    procedure userAuthUI;
    procedure showConnectionIsOffline;
    procedure reloadAppsCount;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

uses
  auth, UserArea, AppList,
  UserNotifications, AppDetails,
  UserGanmcxadebeliReg, AddApps, MyContracts, User2Review, HelperUnit
  // ,FMX.StatusBar
{$IFDEF ANDROID}
    , FMX.FontGlyphs.Android
{$ENDIF}
    , AppListV2;

procedure TMainForm.loadFrames;
begin
  // TMyAppsFrame
  VMyAppsFrame := FrameStandMyApps.New<TMyAppsFrame>(TabItemMyApps,
    'bluestand');
  VMyAppsFrame.Show();
  VMyAppsFrame.Frame.initFrame;

  // TNotificationOffersFrame
  VNotificationOffersFrame :=
    FrameStandNotifications.New<TNotificationOffersFrame>(TabItemMyOffers,
    'bluestand');
  VNotificationOffersFrame.Show();
  VNotificationOffersFrame.Frame.initFrame;

  // TabItemMyContracts
  VMyContractsFrame := FrameStandContracts.New<TMyContractsFrame>
    (TabItemMyContracts, 'bluestand');
  VMyContractsFrame.Show();
  VMyContractsFrame.Frame.initFrame;

  RectangleMyAppsPleaseLogin.Visible := False;
  RectangleMyOffersPleaseLogin.Visible := False;
  RectangleMyContractsPleaseLogin.Visible := False;
end;

procedure TMainForm.reloadAppsCount;
var
  aTask: ITask;
begin
  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestMyAppsCount.Params.Clear;
      RESTRequestMyAppsCount.AddParameter('sesskey', DModule.sesskey);
      RESTRequestMyAppsCount.AddParameter('user_id', DModule.id.ToString);
      RESTRequestMyAppsCount.Execute;
      TThread.Queue(nil,
        procedure
        begin
          DModule.MyAppsCount := FDMemTableMyAppsCount.FieldByName
            ('MyAppsCount').AsInteger;
          TabItemMyApps.Text := DModule.MyAppsCount.ToString;
          self.LabelTotalAppsCount.Text := FDMemTableMyAppsCount.FieldByName
            ('TotalAppsCount').AsString;
          self.ButtonMyApps.Text := '(' + DModule.MyAppsCount.ToString +
            ') ჩემი განცხადებები';
          TabItemMyApps.Text := DModule.MyAppsCount.ToString;
          DModule.updateCurrentUserField('MyAppsCount',
            DModule.MyAppsCount.ToString);
        end);
    end);
  aTask.Start;
  // MyAppsFrame1.initFrame;
end;

procedure TMainForm.userAuthUI;
begin
  DModule.FDTableCurrentUser.Active := True;
  self.RectangleNonAuth.Visible := False;
  LabelFullName.Text := DModule.full_name;
  ButtonUserNotifications.Text := '(' + DModule.FDTableCurrentUser.FieldByName
    ('notifications').AsString + ') შეტყობინებები';
  ButtonContracts.Text := '(' + DModule.FDTableCurrentUser.FieldByName
    ('MyContractsCount').AsString + ') ჩემი შეთანხმებები';
  ButtonMyApps.Text := '(' + DModule.FDTableCurrentUser.FieldByName
    ('MyAppsCount').AsString + ') ჩემი განცხადებები';
  TabItemMyApps.Text := DModule.FDTableCurrentUser.FieldByName
    ('MyAppsCount').AsString;
  TabItemMyContracts.Text := DModule.FDTableCurrentUser.FieldByName
    ('MyContractsCount').AsString;
  self.RectangleProfile.Visible := True;
  ButtonGanmcxReg.Visible := False;
  ButtonAuth.Visible := False;
  TabItemMyApps.Visible := True;
  TabItemMyOffers.Visible := True;
  // MyAppsFrame1.initFrame;
  // Load all frames wich depended on user Auth
  self.loadFrames;

  if DModule.sesskey.IsEmpty = True then
  begin
    TabItemMyApps.StyleLookup := 'TabItemMainPage';
    TabItemMyOffers.StyleLookup := 'TabItemMainPage';
    TabItemMyContracts.StyleLookup := 'TabItemMainPage';
  end
  else
  begin
    TabItemMyApps.StyleLookup := 'TabItemMainPageNumbers';
    TabItemMyOffers.StyleLookup := 'TabItemMainPageNumbers';
    TabItemMyContracts.StyleLookup := 'TabItemMainPageNumbers';
  end;

  self.PreloaderRectangle.Visible := False;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  // Set home page text value
  self.TextMainPageText.Text := DModule.getPagesText(1);
end;

procedure TMainForm.TimerVersioningOpenTableTimer(Sender: TObject);
begin
  TTimer(Sender).Enabled := False;
  if FDMemTableInit.Active = True then
  begin
    LabelTotalAppsCount.Text := FDMemTableInit.FieldByName
      ('total_apps_count').AsString;
    TabItemMyApps.Text := FDMemTableInitUser.FieldByName('MyAppsCount')
      .AsString;
    self.userAuthData;
  end;
end;

procedure TMainForm.TimerVersioningTimer(Sender: TObject);
var
  Msg, token, phone, email: string;
  Action: integer;
  aTask: ITask;
begin
  TTimer(Sender).Enabled := False;
  RESTRequestVersioning.Params.Clear;
  RESTRequestVersioning.AddParameter('version', DModule.currentVersion);
  if DModule.FDConnectionMain.Connected then
  begin
    DModule.FDTableCurrentUser.Active := True;
    if DModule.FDTableCurrentUser.RecordCount > 0 then
    begin
      token := DModule.FDTableCurrentUser.FieldByName('token').AsString;
      phone := DModule.FDTableCurrentUser.FieldByName('phone').AsString;
      email := DModule.FDTableCurrentUser.FieldByName('email').AsString;

      RESTRequestVersioning.AddParameter('op', 'login_with_hash');
      RESTRequestVersioning.AddParameter('hash', token);
      RESTRequestVersioning.AddParameter('phone', phone);
      RESTRequestVersioning.AddParameter('email', email);
    end;
  end;
  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestVersioning.Execute;
    end);
  aTask.Start;

  { Action := FDMemTableInit.FieldByName('action').AsInteger;
    Msg := FDMemTableInit.FieldByName('msg').AsString;
    if Action = 1 then
    begin
    ShowMessage(Msg);
    self.Close;
    end;
    // ----------------------------------------------------------------
    // Load Amzomvelebi
    // User2ListFrame1.initFrame;

    if FDMemTableInitUser.FieldByName('loginstatus').AsInteger = 1 then
    begin
    DModule.id := FDMemTableInitUser.FieldByName('id').AsInteger;
    DModule.full_name := FDMemTableInitUser.FieldByName('full_name').AsString;
    DModule.phone := FDMemTableInitUser.FieldByName('phone').AsString;
    DModule.email := FDMemTableInitUser.FieldByName('email').AsString;
    DModule.sesskey := FDMemTableInitUser.FieldByName('sesskey').AsString;
    DModule.notifications := FDMemTableInitUser.FieldByName('notifications').AsInteger;
    DModule.MyContractsCount := FDMemTableInitUser.FieldByName('MyContractsCount').AsInteger;
    DModule.MyAppsCount := FDMemTableInitUser.FieldByName('MyAppsCount').AsInteger;
    DModule.Azomva_GCMAppID := FDMemTableInit.FieldByName('Azomva_GCMAppID').AsString;
    DModule.Azomva_Legacy_server_key := FDMemTableInit.FieldByName('Azomva_Legacy_server_key').AsString;
    self.initNotificationReceiver;
    self.DoAuthenticate;
    end;
    // ----------------------------------------------------------------
    self.PreloaderRectangle.Visible := False; }
end;

procedure TMainForm.initNotificationReceiver;
begin
{$IF DEFINED(iOS) or DEFINED(ANDROID)}
  FPushClient := TPushClient.Create;
  FPushClient.GCMAppID := DModule.Azomva_GCMAppID;
  FPushClient.ServerKey := DModule.Azomva_Legacy_server_key;
  FPushClient.BundleID := ''; // cFCMBundleID;
  FPushClient.UseSandbox := True; // Change this to False for production use!
  FPushClient.OnChange := PushClientChangeHandler;
  FPushClient.OnReceiveNotification := PushClientReceiveNotificationHandler;
  FPushClient.OnRegistrationError := self.OnRegistrationError;
  FPushClient.Active := True;
  // LabelApps.Text := FPushClient.Active.ToString;
{$ENDIF}
{$IFDEF ANDROID}
  // PushService := TPushServiceManager.Instance.GetServiceByName(TPushService.TServiceNames.GCM);
  // get your AppID in your tab "Cloud Message" on Firebase Console
  // PushService.AppProps[TPushService.TAppPropNames.GCMAppID] := DModule.Azomva_GCMAppID;
  //
  // ServiceConnection := TPushServiceConnection.Create(PushService);
  //
  // ServiceConnection.OnChange := DoServiceConnectionChange;
  // ServiceConnection.OnReceiveNotification := DoReceiveNotificationEvent;
  //
  // in RAD Studio XE10.2.3 you DONT should use the "main thread" to start one service in background
  // then, use one "task" for that. Always!
  //
  TTask.Run(
    procedure
    begin
      // ServiceConnection.Active := True; // on Berlin, this was possible! On Tokyo DONT!
    end);
{$ENDIF}
end;

procedure TMainForm.userAuthData;
var
  Msg: string;
  Action: integer;
begin
  Action := FDMemTableInit.FieldByName('action').AsInteger;
  Msg := FDMemTableInit.FieldByName('msg').AsString;
  if Action = 1 then
  begin
    ShowMessage(Msg);
    self.Close;
  end;

  // Load Amzomvelebi
  // User2ListFrame1.initFrame;

  if FDMemTableInitUser.FieldByName('loginstatus').AsInteger = 1 then
  begin
    DModule.id := FDMemTableInitUser.FieldByName('id').AsInteger;
    DModule.full_name := FDMemTableInitUser.FieldByName('full_name').AsString;
    DModule.phone := FDMemTableInitUser.FieldByName('phone').AsString;
    DModule.email := FDMemTableInitUser.FieldByName('email').AsString;
    DModule.sesskey := FDMemTableInitUser.FieldByName('sesskey').AsString;
    DModule.notifications := FDMemTableInitUser.FieldByName('notifications')
      .AsInteger;
    DModule.MyContractsCount := FDMemTableInitUser.FieldByName
      ('MyContractsCount').AsInteger;
    DModule.MyAppsCount := FDMemTableInitUser.FieldByName('MyAppsCount')
      .AsInteger;
    DModule.Azomva_GCMAppID := FDMemTableInit.FieldByName
      ('Azomva_GCMAppID').AsString;
    DModule.Azomva_Legacy_server_key := FDMemTableInit.FieldByName
      ('Azomva_Legacy_server_key').AsString;
    self.initNotificationReceiver;
    self.userAuthUI;
  end;
end;

procedure TMainForm.RESTRequestVersioningAfterExecute
  (Sender: TCustomRESTRequest);
begin
  TimerVersioningOpenTable.Enabled := True;
end;

procedure TMainForm.RESTRequestVersioningHTTPProtocolError
  (Sender: TCustomRESTRequest);
begin
  self.showConnectionIsOffline;
end;

procedure TMainForm.OnRegistrationError(Sender: TObject; const Error: string);
begin
  ShowMessage(Error);
end;
{$IFDEF ANDROID or IOS}

procedure TMainForm.PushClientReceiveNotificationHandler(Sender: TObject;
const ANotification: TPushServiceNotification);
var
  v_notification_id: integer;
  notRec: TNotificationRec;

begin
  v_notification_id := ANotification.JSON.GetValue('id').Value.Replace('"', '')
    .ToInteger;
  with DModule.FDTableNotifications do
  begin
    Open('notifications');
    Insert;
    FieldByName('user_id').AsString := ANotification.JSON.GetValue('user_id')
      .Value.Replace('"', '');
    FieldByName('app_id').AsString := ANotification.JSON.GetValue('app_id')
      .Value.Replace('"', '');
    FieldByName('offer_user_id').AsString := ANotification.JSON.GetValue
      ('offer_user_id').Value.Replace('"', '');
    FieldByName('app_offer_id').AsString := ANotification.JSON.GetValue
      ('app_offer_id').Value.Replace('"', '');
    FieldByName('notification_id').AsString := v_notification_id.ToString;
    FieldByName('notification_type_id').AsString :=
      ANotification.JSON.GetValue('notification_type_id')
      .Value.Replace('"', '');
    FieldByName('formAction').AsString := ANotification.JSON.GetValue
      ('formAction').Value.Replace('"', '');
    FieldByName('title').AsString := ANotification.JSON.GetValue('title')
      .Value.Replace('"', '');
    FieldByName('description').AsString := ANotification.JSON.GetValue
      ('description').Value.Replace('"', '');
    FieldByName('create_date').AsString := ANotification.JSON.GetValue
      ('create_date').Value.Replace('"', '');
    FieldByName('is_read').AsInteger := 0;
    Post;
  end;
  DModule.FDTableNotifications.Last;
  self.notificationAlert(v_notification_id, 0);
  { notRec.id := DModule.FDTableNotifications.FieldByName('id').AsInteger;
    notRec.user_id := ANotification.JSON.GetValue('user_id').Value.Replace('"', '').ToInteger;
    notRec.app_id := ANotification.JSON.GetValue('app_id').Value.Replace('"', '').ToInteger;
    notRec.offer_user_id := ANotification.JSON.GetValue('offer_user_id').Value.Replace('"', '').ToInteger;
    notRec.app_offer_id := ANotification.JSON.GetValue('app_offer_id').Value.Replace('"', '').ToInteger;
    notRec.notification_id := ANotification.JSON.GetValue('notification_id').Value.Replace('"', '').ToInteger;
    notRec.notification_type_id := ANotification.JSON.GetValue('notification_type_id').Value.Replace('"', '')
    .ToInteger;
    notRec.formAction := ANotification.JSON.GetValue('formAction').Value.Replace('"', '');
    notRec.title := ANotification.JSON.GetValue('title').Value.Replace('"', '');
    notRec.description := ANotification.JSON.GetValue('description').Value.Replace('"', '');
    notRec.create_date := ANotification.JSON.GetValue('create_date').Value.Replace('"', '');
    notRec.ApplicationIconBadgeNumber := 0;
    self.notificationAlert(notRec); }
end;
{$ENDIF}
{$IFDEF ANDROID or IOS}

procedure TMainForm.notificationAlert(p_notification_id,
  p_ApplicationIconBadgeNumber: integer);
var
  MyNotification: TNotification;
  notification_name: String;
begin
  MyNotification := NotificationCenter1.CreateNotification;
  try

    DModule.FDTableNotifications.Active := True;
    DModule.FDTableNotifications.Filtered := False;
    DModule.FDTableNotifications.Filter := 'id=' + p_notification_id.ToString;
    DModule.FDTableNotifications.Filtered := True;

    notification_name := DModule.FDTableNotifications.FieldByName('id').AsString
      + '_' + DModule.FDTableNotifications.FieldByName('app_id').AsString + '_'
      + DModule.FDTableNotifications.FieldByName('formAction').AsString;
    MyNotification.Name := notification_name;
    MyNotification.title := DModule.FDTableNotifications.FieldByName
      ('title').AsString;
    MyNotification.AlertBody := DModule.FDTableNotifications.FieldByName
      ('description').AsString;
    MyNotification.EnableSound := True;
    MyNotification.Number := p_ApplicationIconBadgeNumber;
    MyNotification.HasAction := True;
    MyNotification.AlertAction := 'Launch';
    NotificationCenter1.PresentNotification(MyNotification);
    NotificationCenter1.ApplicationIconBadgeNumber :=
      p_ApplicationIconBadgeNumber;
  finally
    MyNotification.DisposeOf;
  end;
end;
{$ENDIF}

procedure TMainForm.NotificationCenter1ReceiveLocalNotification(Sender: TObject;
ANotification: TNotification);
var
  Splitted: TArray<String>;
  v_id, v_app_id, v_formAction: String;
begin
  // On notification click event
  Splitted := ANotification.Name.Split(['_']);
  v_id := Splitted[0];
  v_app_id := Splitted[1];
  v_formAction := Splitted[2];

  self.NotificationCenter1.CancelNotification(ANotification.Name);
  if v_formAction = 'TAppDetailForm' then
  begin
    with TAppDetailForm.Create(Application) do
    begin
      initForm(v_app_id.ToInteger, True);
    end;
  end;
end;
{$IFDEF ANDROID or IOS}

procedure TMainForm.PushClientChangeHandler(Sender: TObject;
AChange: TPushService.TChanges);
var
  aTask: ITask;
begin
  if TPushService.TChange.DeviceToken in AChange then
  begin
    aTask := TTask.Create(
      procedure()
      begin
        RESTRequestDeviceToken.Params.Clear;
        RESTRequestDeviceToken.AddParameter('deviceid', self.getDeviceID);
        RESTRequestDeviceToken.AddParameter('devicetoken',
          TIdURI.ParamsEncode(FPushClient.DeviceToken));
        RESTRequestDeviceToken.AddParameter('sesskey', DModule.sesskey);
        RESTRequestDeviceToken.AddParameter('user_id', DModule.id.ToString);
        RESTRequestDeviceToken.Execute;
      end);
    aTask.Start;
  end;
end;
{$ENDIF}

procedure TMainForm.FormDestroy(Sender: TObject);
begin
{$IFDEF ANDROID or IOS}
  if Assigned(self.FPushClient) then
    self.FPushClient.Free;
{$ENDIF}
end;

procedure TMainForm.ActionRegGanmcxadebeliExecute(Sender: TObject);
begin
  // განმცხადებლის რეგისტრაცია
  with TGanmcxadeblisRegForm.Create(Application) do
  begin
    initForm;
  end;
end;

procedure TMainForm.ActionAppAddingExecute(Sender: TObject);
begin
  self.MultiView1.HideMaster;
  if Assigned(FormAddApps) then
    FormAddApps.Free;
  with TFormAddApps.Create(Application) do
  begin
    initForm;
  end;
end;

procedure TMainForm.ActionAppsListExecute(Sender: TObject);
begin
  if Assigned(AppListFormV2) then
    AppListFormV2.Free;

  with TAppListFormV2.Create(Application) do
  begin
    initForm;
  end;
end;

procedure TMainForm.ActionMyAppsExecute(Sender: TObject);
begin
  if Assigned(AppListFormV2) then
    AppListFormV2.Free;
  with TAppListFormV2.Create(Application) do
  begin
    initForm(True);
  end;
end;

procedure TMainForm.ActionMyContractsExecute(Sender: TObject);
begin
  if Assigned(MyContractsForm) then
    MyContractsForm.Free;
  with TMyContractsForm.Create(Application) do
  begin
    initForm;
  end;
end;

procedure TMainForm.ActionService1Execute(Sender: TObject);
begin
  // მიწის ნაკვეთის აზომვა
  LabelInfoTitle.Text := DModule.getPagesTitle(5);
  TextInfo.Text := DModule.getPagesText(5);
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.ActionService2Execute(Sender: TObject);
begin
  // ტოპონახაზი
  LabelInfoTitle.Text := DModule.getPagesTitle(6);
  TextInfo.Text := DModule.getPagesText(6);
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.ActionService3Execute(Sender: TObject);
begin
  // შიდა აზომვითი ნახაზი
  LabelInfoTitle.Text := DModule.getPagesTitle(7);
  TextInfo.Text := DModule.getPagesText(7);
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.ActionSignOutExecute(Sender: TObject);
begin
  TimerVersioning.Enabled := False;
  RESTRequestSignOut.Params.Clear;
  RESTRequestSignOut.AddParameter('sesskey', DModule.sesskey);
  RESTRequestSignOut.AddParameter('user_id', DModule.id.ToString);
  RESTRequestSignOut.ExecuteAsync(
    procedure
    begin
      RectangleProfile.Visible := False;
      RectangleNonAuth.Visible := True;
      DModule.SignOut;
    end);
end;

procedure TMainForm.ActionUserAreaExecute(Sender: TObject);
begin
  if Assigned(UserAreaForm) then
    UserAreaForm.initForm
  else
  begin
    with TUserAreaForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.ActionUserNotificationsExecute(Sender: TObject);
begin
  if Assigned(UserNotificationsForm) then
    UserNotificationsForm.initForm
  else
  begin
    with TUserNotificationsForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TMainForm.AuthActionExecute(Sender: TObject);
begin
  if Assigned(authForm) then
    authForm.Free;
  with TauthForm.Create(Application) do
  begin
    initForm;
  end;
end;

procedure TMainForm.ButtonUserAreaClick(Sender: TObject);
begin
  TabControl1.ActiveTab := TabItemUserArea;
  self.MultiView1.HideMaster;
end;

// Add application
procedure TMainForm.ButtonMainAddAppTap(Sender: TObject; const Point: TPointF);
begin
  ActionAppAdding.Execute;
end;

// Add application
procedure TMainForm.InfoButtonAddAppClick(Sender: TObject);
begin
  ActionAppAdding.Execute;
end;

// Applications list form
procedure TMainForm.ButtonAppsListClick(Sender: TObject);
begin
  self.MultiView1.HideMaster;
  ActionAppsList.Execute;
end;

// Applications list form
procedure TMainForm.RectangleAppsClick(Sender: TObject);
begin
  ActionAppsList.Execute;
end;

// Applications list form
procedure TMainForm.RectangleAppsTap(Sender: TObject; const Point: TPointF);
begin
  ActionAppsList.Execute;
end;

procedure TMainForm.RectangleAuthRegClick(Sender: TObject);
begin
  AuthAction.Execute;
end;

procedure TMainForm.RectangleBannerAppsTap(Sender: TObject;
const Point: TPointF);
begin
  ActionAppsList.Execute;
end;

procedure TMainForm.RectangleHowItWorkTap(Sender: TObject;
const Point: TPointF);
begin
  TRectangle(Sender).Visible := False;
end;

procedure TMainForm.RectangleRegGanmcxadeblisClick(Sender: TObject);
begin
  ActionRegGanmcxadebeli.Execute;
end;

procedure TMainForm.TabControl1Change(Sender: TObject);
begin
{$IFDEF ANDROID or IOS}
  if DModule.sesskey.IsEmpty = True then
  begin
    TabItemMyApps.StyleLookup := 'TabItemMainPage';
    TabItemMyOffers.StyleLookup := 'TabItemMainPage';
    TabItemMyContracts.StyleLookup := 'TabItemMainPage';
  end
  else
  begin
    TabItemMyApps.StyleLookup := 'TabItemMainPageNumbers';
    TabItemMyOffers.StyleLookup := 'TabItemMainPageNumbers';
    TabItemMyContracts.StyleLookup := 'TabItemMainPageNumbers';
  end;

  if TabControl1.ActiveTab = TabItemMain then
  begin
    TabItemMain.ImageIndex := 0;
    TabItemUserArea.ImageIndex := 9;
    TabItemMyContracts.ImageIndex := 29;
    TabItemMyApps.ImageIndex := 13;
    TabItemMyOffers.ImageIndex := 14;
  end
  else if TabControl1.ActiveTab = TabItemUserArea then
  begin
    TabItemMain.ImageIndex := 10;
    TabItemUserArea.ImageIndex := 1;
    TabItemMyContracts.ImageIndex := 29;
    TabItemMyApps.ImageIndex := 13;
    TabItemMyOffers.ImageIndex := 14;
  end
  else if TabControl1.ActiveTab = TabItemMyContracts then
  begin
    TabItemMain.ImageIndex := 10;
    TabItemUserArea.ImageIndex := 9;
    TabItemMyContracts.ImageIndex := 30;
    TabItemMyApps.ImageIndex := 13;
    TabItemMyOffers.ImageIndex := 14;
    if DModule.sesskey.IsEmpty = True then
      TabItemMyContracts.StyleLookup := 'TabItemMainPage'
    else
      TabItemMyContracts.StyleLookup := 'TabItemMainPageNumbersActive';
  end
  else if TabControl1.ActiveTab = TabItemMyApps then
  begin
    TabItemMain.ImageIndex := 10;
    TabItemUserArea.ImageIndex := 9;
    TabItemMyContracts.ImageIndex := 29;
    TabItemMyApps.ImageIndex := 12;
    TabItemMyOffers.ImageIndex := 14;

    if DModule.sesskey.IsEmpty = True then
      TabItemMyApps.StyleLookup := 'TabItemMainPage'
    else
      TabItemMyApps.StyleLookup := 'TabItemMainPageNumbersActive';
  end
  else if TabControl1.ActiveTab = TabItemMyOffers then
  begin
    TabItemMain.ImageIndex := 10;
    TabItemUserArea.ImageIndex := 9;
    TabItemMyContracts.ImageIndex := 29;
    TabItemMyApps.ImageIndex := 13;
    TabItemMyOffers.ImageIndex := 15;
    if DModule.sesskey.IsEmpty = True then
      TabItemMyOffers.StyleLookup := 'TabItemMainPage'
    else
      TabItemMyOffers.StyleLookup := 'TabItemMainPageNumbersActive';
  end;
{$ENDIF}
end;

procedure TMainForm.TextInfoTap(Sender: TObject; const Point: TPointF);
begin
  RectangleHowItWork.Visible := False;
end;

procedure TMainForm.TextMainPageTextTap(Sender: TObject; const Point: TPointF);
begin
  LabelInfoTitle.Text := FDMemTableHowItWorks.FieldByName('title').AsString;
  TextInfo.Text := FDMemTableHowItWorks.FieldByName('content').AsString;
  RectangleHowItWork.Visible := True;
end;

procedure TMainForm.showConnectionIsOffline;
begin
  { FMXLoadingTotalAppsCount.Enabled := False;
    FMXLoadingTotalAppsCount.Visible := False;
    FMXLoadingTotalAppsCount.Enabled := False;
    FMXLoadingTotalAppsCount.Visible := False; }
end;

procedure TMainForm.SpeedButtonAddAppClick(Sender: TObject);
begin
  ActionAppAdding.Execute;
end;

function TMainForm.getDeviceID: string;
{ var
  obj: JObject;
  tm: JTelephonyManager;
  identifier: String;
  HelperUnit: THelperUnit; }
begin
  { HelperUnit := THelperUnit.Create;

    HelperUnit.AndroidCheckAndRequestStatePermission;

    obj := TANdroidHelper.Context.getSystemService
    (TJContext.JavaClass.TELEPHONY_SERVICE);
    if obj <> nil then
    begin
    tm := TJTelephonyManager.Wrap((obj as ILocalObject).GetObjectID);
    if tm <> nil then
    identifier := JStringToString(tm.getDeviceID);
    end;
    if identifier = '' then
    identifier := JStringToString(TJSettings_Secure.JavaClass.getString
    (TANdroidHelper.Activity.getContentResolver,
    TJSettings_Secure.JavaClass.ANDROID_ID));
    Result := identifier; }
  Result := 'depricated';
end;

procedure TMainForm.Image2Click(Sender: TObject);
begin
  AuthAction.Execute;
end;

procedure TMainForm.Image3Click(Sender: TObject);
begin
  ActionRegGanmcxadebeli.Execute;
end;

procedure TMainForm.Image4Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService2.Execute;
end;

procedure TMainForm.Image5Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService1.Execute;
end;

procedure TMainForm.Image6Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService2.Execute;
end;

procedure TMainForm.Image7Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService2.Execute;
end;

procedure TMainForm.Image8Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService3.Execute;
end;

procedure TMainForm.Label1Click(Sender: TObject);
begin
  AuthAction.Execute;
end;

procedure TMainForm.Label2Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService2.Execute;
end;

procedure TMainForm.Label3Click(Sender: TObject);
begin
  ActionRegGanmcxadebeli.Execute;
end;

procedure TMainForm.Label4Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService1.Execute;
end;

procedure TMainForm.Label5Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService2.Execute;
end;

procedure TMainForm.Label6Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService2.Execute;
end;

procedure TMainForm.Label7Tap(Sender: TObject; const Point: TPointF);
begin
  ActionService3.Execute;
end;

procedure TMainForm.LabelAppsClick(Sender: TObject);
begin
  ActionAppsList.Execute;
end;

procedure TMainForm.LabelInfoTitleTap(Sender: TObject; const Point: TPointF);
begin
  RectangleHowItWork.Visible := False;
end;

procedure TMainForm.LabelTotalAppsCountTap(Sender: TObject;
const Point: TPointF);
begin
  ActionAppsList.Execute;
end;

{ procedure TMainForm.DoReceiveNotificationEvent(Sender: TObject; const ServiceNotification: TPushServiceNotification);
  var
  title: String;
  begin
  title := ServiceNotification.DataObject.GetValue('title').Value;
  end; }

{ procedure TMainForm.DoServiceConnectionChange(Sender: TObject; PushChanges: TPushService.TChanges);
  var
  Device_token: string;
  begin
  if TPushService.TChange.DeviceToken in PushChanges then
  Device_token := PushService.DeviceTokenValue[TPushService.TDeviceTokenNames.DeviceToken];
  end; }
{
  procedure RenderingSetupCallback(const Sender, Context: TObject;
  var ColorBits, DepthBits: integer; var Stencil: Boolean;
  var Multisamples: integer);
  begin
  // Override OpenGL rendering setup to use custom values.
  ColorBits := 16; // default is 24
  DepthBits := 0; // default is 24
  Stencil := False; // default is True
  Multisamples := 0; // default depends on TForm.Quality or TForm3D.Multisample
  end;

  procedure RegisterRenderingSetup;
  var
  SetupService: IFMXRenderingSetupService;
  begin
  if TPlatformServices.Current.SupportsPlatformService
  (IFMXRenderingSetupService, IInterface(SetupService)) then
  SetupService.Subscribe(RenderingSetupCallback);
  // There is also SetupService.Unsubscribe, which removes the hook.
  end;
}
initialization

TAndroidHelper.Activity.getWindow.clearFlags
  (TJWindowManager_LayoutParams.JavaClass.FLAG_TRANSLUCENT_STATUS);
TAndroidHelper.Activity.getWindow.addFlags
  (TJWindowManager_LayoutParams.JavaClass.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
TAndroidHelper.Activity.getWindow.setStatusBarColor(TAlphaColor($FFFF3434));
// TmyWindow.Init;

{ TThread.Queue(nil,
  procedure
  begin
  end); }

end.
