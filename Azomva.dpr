program Azomva;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  appDetailsFR in 'Frames\appDetailsFR.pas' {AppDetailsFrame: TFrame},
  AddAppRequizitesFR in 'Frames\AddAppRequizitesFR.pas' {AddAppRequizitesFrame: TFrame},
  Header in 'Frames\Header.pas' {HeaderFrame: TFrame},
  MyAppsFR in 'Frames\MyAppsFR.pas' {MyAppsFrame: TFrame},
  MyOffersFR in 'Frames\MyOffersFR.pas' {myOffersFrame: TFrame},
  NotificationOffersFR in 'Frames\NotificationOffersFR.pas' {NotificationOffersFrame: TFrame},
  User2ListFR in 'Frames\User2ListFR.pas' {User2ListFrame: TFrame},
  AddApps in 'forms\AddApps.pas' {FormAddApps},
  AppDetails in 'forms\AppDetails.pas' {AppDetailForm},
  AppDetailsContainer in 'forms\AppDetailsContainer.pas' {AppDetailFormC},
  AppList in 'forms\AppList.pas' {AppListForm},
  BidsByApp in 'forms\BidsByApp.pas' {BidsByAppForm},
  map in 'forms\map.pas' {mapViewForm},
  MyContracts in 'forms\MyContracts.pas' {MyContractsForm},
  SetNewPassword in 'forms\SetNewPassword.pas' {setNewPasswordForm},
  User1Review in 'forms\User1Review.pas' {User1ReviewForm},
  User2Review in 'forms\User2Review.pas' {User2ReviewForm},
  UserArea in 'forms\UserArea.pas' {UserAreaForm},
  UserGanmcxadebeliReg in 'forms\UserGanmcxadebeliReg.pas' {GanmcxadeblisRegForm},
  UserNotifications in 'forms\UserNotifications.pas' {UserNotificationsForm},
  HelperUnit in 'HelperUnit.pas',
  Main in 'Main.pas' {MainForm},
  DataModule in 'DataModule.pas' {DModule: TDataModule},
  {$IFDEF ANDROID or IOS}
  SharedVariables in 'Lib\PushNotifications-master\SharedVariables.pas',
  {$ENDIF }
  auth in 'auth.pas' {authForm},
  Grijjy.RemotePush.Receiver in 'Lib\GrijjyFoundation-master\Grijjy.RemotePush.Receiver.pas',
  AppListV2 in 'forms\AppListV2.pas' {AppListFormV2},
  MyContractsFR in 'Frames\MyContractsFR.pas' {MyContractsFrame: TFrame},
  DW.PushClient in 'lib\PushNotifications-master\DW.PushClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDModule, DModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;

end.
