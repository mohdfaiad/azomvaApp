unit NotificationOffersFR;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client,
  Data.Bind.ObjectScope, FMX.Controls.Presentation, FMX.Layouts,
  FMX.LoadingIndicator, FMX.Objects, FMX.ListView;

type
  TNotificationOffersFrame = class(TFrame)
    ListViewNotifications: TListView;
    RectanglePreloader: TRectangle;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    LabelNotFound: TLabel;
    RESTRequestNotifications: TRESTRequest;
    RESTResponseNotifications: TRESTResponse;
    RESTResponseDataSetAdapterNotifications: TRESTResponseDataSetAdapter;
    FDMemTableNotifications: TFDMemTable;
    FDMemTableNotificationsid: TWideStringField;
    FDMemTableNotificationsapp_id: TWideStringField;
    FDMemTableNotificationsuser_id: TWideStringField;
    FDMemTableNotificationsoffer_user_id: TWideStringField;
    FDMemTableNotificationsoffer_full_name: TWideStringField;
    FDMemTableNotificationsnotification_type_id: TWideStringField;
    FDMemTableNotificationstitle: TWideStringField;
    FDMemTableNotificationsdescription: TWideStringField;
    FDMemTableNotificationsfire_time: TWideStringField;
    FDMemTableNotificationsexecuted: TWideStringField;
    FDMemTableNotificationsaction_id: TWideStringField;
    FDMemTableNotificationscreate_date: TWideStringField;
    FDMemTableNotificationsexecuted_date: TWideStringField;
    FDMemTableNotificationsnotification_type_name: TWideStringField;
    FDMemTableNotificationsformAction: TWideStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure ListViewNotificationsPullRefresh(Sender: TObject);
    procedure ListViewNotificationsItemClick(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initFrame;
  end;

implementation

{$R *.fmx}

uses DataModule, Main, AppDetails;

{ TNotificationOffersFrame }

procedure TNotificationOffersFrame.initFrame;
begin
  RESTRequestNotifications.Params.Clear;
  if not DModule.sesskey.IsEmpty then
  begin
    RESTRequestNotifications.AddParameter('sesskey', DModule.sesskey);
    RESTRequestNotifications.AddParameter('user_id', DModule.id.ToString);
    RESTRequestNotifications.AddParameter('notification_type_id', '1');
    RESTRequestNotifications.ExecuteAsync(
      procedure
      begin
        TThread.Queue(nil,
          procedure
          begin
            if FDMemTableNotifications.RecordCount = 0 then
              LabelNotFound.Visible := True
            else
              LabelNotFound.Visible := False;
            // Home page tabs value
            MainForm.TabItemMyOffers.Text := FDMemTableNotifications.RecordCount.ToString;
          end);
      end);
  end;
end;

procedure TNotificationOffersFrame.ListViewNotificationsItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if self.FDMemTableNotifications.FieldByName('formAction').AsString = 'TAppDetailForm' then
  begin
    if self.FDMemTableNotifications.FieldByName('app_id').AsInteger > 0 then
    begin
      with TAppDetailForm.Create(Application) do
      begin
        initForm(self.FDMemTableNotifications.FieldByName('app_id').AsInteger, True);
      end;
    end;
  end;
end;

procedure TNotificationOffersFrame.ListViewNotificationsPullRefresh(Sender: TObject);
begin
  ListViewNotifications.PullRefreshWait := True;
  self.initFrame;
  ListViewNotifications.PullRefreshWait := False;
end;

end.


