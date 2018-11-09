unit appDetailsFR;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, System.ImageList, FMX.ImgList, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.ObjectScope, Header,
  FMX.Objects, FMX.ScrollBox, FMX.Memo, FMX.Layouts, FMX.LoadingIndicator,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListView, FMX.TabControl,
  System.Threading, IdURI, FMX.Effects;

type
  TAppDetailsFrame = class(TFrame)
    RectangleMain: TRectangle;
    TabControl1: TTabControl;
    TabItemDetails: TTabItem;
    ListViewAppDetails: TListView;
    LabelDetails: TLabel;
    Image2: TImage;
    TabItemOffer: TTabItem;
    ListViewOffers: TListView;
    LabelNotFound: TLabel;
    Label2: TLabel;
    Image4: TImage;
    TabItemProperties: TTabItem;
    ListViewProperties: TListView;
    Label3: TLabel;
    Image5: TImage;
    TabItemOwner: TTabItem;
    ListViewAmzomveli: TListView;
    Label1: TLabel;
    Image3: TImage;
    RectangleChoose: TRectangle;
    RectangleBody: TRectangle;
    ButtonApprove: TButton;
    FMXLoadingIndicatorApproved: TFMXLoadingIndicator;
    ButtonCancel: TButton;
    offererUserNameLabel: TLabel;
    LabelPrice: TLabel;
    Image1: TImage;
    RectangleCancel: TRectangle;
    RectangleCancelBody: TRectangle;
    Button1: TButton;
    FMXLoadingIndicator2: TFMXLoadingIndicator;
    Label4: TLabel;
    MemoCancelBody: TMemo;
    Line1: TLine;
    RectanglePreloader: TRectangle;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    StyleBookAppDetails: TStyleBook;
    RESTRequestApp: TRESTRequest;
    RESTResponseApp: TRESTResponse;
    RESTResponseDataSetAdapterApp: TRESTResponseDataSetAdapter;
    FDMemTableApp: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListCToFAppDetails: TLinkListControlToField;
    LinkListCToFOffer: TLinkListControlToField;
    LinkListCToFProperties: TLinkListControlToField;
    LinkListCToFAmzomveli: TLinkListControlToField;
    RESTResponseDataSetAdapterBids: TRESTResponseDataSetAdapter;
    FDMemTableBids: TFDMemTable;
    FDMemTableBidsid: TWideStringField;
    FDMemTableBidsuser_id: TWideStringField;
    FDMemTableBidsapp_id: TWideStringField;
    FDMemTableBidsoffered_price: TWideStringField;
    FDMemTableBidsstart_date: TWideStringField;
    FDMemTableBidsoffer_description: TWideStringField;
    FDMemTableBidscreate_date: TWideStringField;
    FDMemTableBidsipaddr: TWideStringField;
    FDMemTableBidsuser: TWideStringField;
    FDMemTableBidsuser_rating: TWideStringField;
    FDMemTableBidsapproved_id: TWideStringField;
    FDMemTableBidsapproved_on_time: TWideStringField;
    FDMemTableBidsapproved_note: TWideStringField;
    FDMemTableBidsapproved: TWideStringField;
    FDMemTableBidsapproved_icon: TWideStringField;
    BindSourceDB2: TBindSourceDB;
    RESTResponseDataSetAdapterRequiz: TRESTResponseDataSetAdapter;
    FDMemTableapp_property_requisites: TFDMemTable;
    FDMemTableapp_property_requisitesid: TWideStringField;
    FDMemTableapp_property_requisitesapp_id: TWideStringField;
    FDMemTableapp_property_requisitesapp_property_type_id: TWideStringField;
    FDMemTableapp_property_requisitesapp_property_type_name: TWideStringField;
    FDMemTableapp_property_requisiteslocation_id: TWideStringField;
    FDMemTableapp_property_requisiteslocation_address: TWideStringField;
    FDMemTableapp_property_requisitesaddress: TWideStringField;
    FDMemTableapp_property_requisitescadcode: TWideStringField;
    FDMemTableapp_property_requisitesarea: TWideStringField;
    FDMemTableapp_property_requisiteslon_lat: TWideStringField;
    FDMemTableapp_property_requisitesservice_types: TWideStringField;
    FDMemTableapp_property_requisitesapp_user_param: TWideStringField;
    BindSourceDB3: TBindSourceDB;
    FDMemTableAmzomveli: TFDMemTable;
    FDMemTableAmzomveliid: TWideStringField;
    FDMemTableAmzomveliuser_type_id: TWideStringField;
    FDMemTableAmzomveliuser_status_id: TWideStringField;
    FDMemTableAmzomvelirating: TWideStringField;
    FDMemTableAmzomvelifull_name: TWideStringField;
    FDMemTableAmzomveliphone: TWideStringField;
    FDMemTableAmzomveliemail: TWideStringField;
    FDMemTableAmzomvelicreate_date: TWideStringField;
    FDMemTableAmzomvelimodify_date: TWideStringField;
    FDMemTableAmzomveliregipaddr: TWideStringField;
    FDMemTableAmzomvelicontact_info: TWideStringField;
    RESTResponseDataSetAdapterAmzomveli: TRESTResponseDataSetAdapter;
    BindSourceDB4: TBindSourceDB;
    ImageListIcons: TImageList;
    RESTResponseApproveds: TRESTResponse;
    RESTRequestApproveds: TRESTRequest;
    ImageListStars: TImageList;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    Line5: TLine;
    Line6: TLine;
    ShadowEffect5: TShadowEffect;
    FDMemTableAppid: TWideStringField;
    FDMemTableAppuser_id: TWideStringField;
    FDMemTableAppdeadlineby_user: TWideStringField;
    FDMemTableAppexecute_days: TWideStringField;
    FDMemTableAppimageIndex: TWideStringField;
    FDMemTableAppusername: TWideStringField;
    FDMemTableAppnote: TWideStringField;
    FDMemTableAppstatus_name: TWideStringField;
    FDMemTableAppstatus_color: TWideStringField;
    FDMemTableAppstatus_progress: TWideStringField;
    FDMemTableAppapp_status_id: TWideStringField;
    FDMemTableAppnotification_on_email: TWideStringField;
    FDMemTableAppnotification_on_device: TWideStringField;
    FDMemTableAppcreate_date: TWideStringField;
    FDMemTableApplocation_id: TWideStringField;
    FDMemTableAppbidscount: TWideStringField;
    FDMemTableApplocation_name: TWideStringField;
    FDMemTableAppcanbid: TWideStringField;
    FDMemTableAppis_my_app: TWideStringField;
    FDMemTableAppregion: TWideStringField;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    procedure ButtonApproveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ListViewAmzomveliPullRefresh(Sender: TObject);
    procedure ListViewAmzomveliUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewOffersItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewOffersPullRefresh(Sender: TObject);
    procedure ListViewOffersUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewPropertiesPullRefresh(Sender: TObject);
    procedure RESTRequestAppAfterExecute(Sender: TCustomRESTRequest);
    procedure FDMemTableBidsBeforeScroll(DataSet: TDataSet);
    procedure ListViewAppDetailsUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewPropertiesUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
  private
    function getBitmapFromResource(const AResourceName: String): TBitmap;
    { Private declarations }
  public
    { Public declarations }
    app_id: Integer;
    is_owner: Boolean;
    aTask: ITask;
    procedure initFrame(papp_id: Integer; is_owner: Boolean = false);
  end;

var
  AppDetailsFrame: TAppDetailsFrame;

implementation

{$R *.fmx}

uses DataModule;

{ TAppDetailsFrame }

procedure TAppDetailsFrame.ButtonApproveClick(Sender: TObject);
var
  aTask: ITask;
begin
  aTask := TTask.Create(
    procedure()
    begin
      FMXLoadingIndicatorApproved.Visible := True;
      Self.RESTRequestApproveds.Params.Clear;
      RESTRequestApproveds.AddParameter('sesskey', DModule.sesskey);
      RESTRequestApproveds.AddParameter('user_id', DModule.id.ToString);
      RESTRequestApproveds.AddParameter('app_id', Self.app_id.ToString);
      RESTRequestApproveds.AddParameter('app_offer_id', Self.FDMemTableBids.FieldByName('id').AsString);
      RESTRequestApproveds.AddParameter('note', TIdURI.ParamsEncode('text here is depricated!'));
      Self.RESTRequestApproveds.Execute;
      FMXLoadingIndicatorApproved.Visible := false;
      RectangleChoose.Visible := false;
      TThread.Queue(nil,
        procedure
        begin
          Self.initFrame(Self.app_id, Self.is_owner);
          ShowMessage(RESTResponseApproveds.Content);
        end);
    end);
  aTask.Start;
end;

procedure TAppDetailsFrame.ButtonCancelClick(Sender: TObject);
begin
  RectangleChoose.Visible := false;
end;

procedure TAppDetailsFrame.FDMemTableBidsBeforeScroll(DataSet: TDataSet);
begin
  offererUserNameLabel.Text := DataSet.FieldByName('user').AsString;
  LabelPrice.Text := DataSet.FieldByName('offered_price').AsString + '₾';
end;

procedure TAppDetailsFrame.initFrame(papp_id: Integer; is_owner: Boolean = false);
var
  aTask: ITask;
begin
  Self.is_owner := is_owner;
  TabItemOffer.Visible := is_owner;
  TabItemOwner.Visible := false;
  Self.app_id := papp_id;
  // RectanglePreloader.Visible := True;
  aTask := TTask.Create(
    procedure()
    var
      offered_price: string;
    begin
      RESTRequestApp.Params.Clear;
      RESTRequestApp.AddParameter('app_id', Self.app_id.ToString);
      if not DModule.sesskey.IsEmpty then
      begin
        RESTRequestApp.AddParameter('sesskey', DModule.sesskey);
        RESTRequestApp.AddParameter('user_id', DModule.id.ToString);
        if is_owner = True then
        begin
          RESTRequestApp.AddParameter('op', 'showamzomveliinfo');
          // TabControl1.ActiveTab := TabItemOwner;
        end
        else
          TThread.Queue(nil,
            procedure
            begin
              TabControl1.ActiveTab := TabItemDetails;
            end);
      end
      else
      begin
        TThread.Queue(nil,
          procedure
          begin
            TabItemOffer.Visible := false;
          end);
      end;
      RESTRequestApp.Execute;
      offered_price := FDMemTableBids.FieldByName('offered_price').AsString;
      TThread.Queue(nil,
        procedure
        begin
          LabelPrice.Text := offered_price + '₾';
        end);
      if FDMemTableApp.Active = True then
        if FDMemTableApp.FieldByName('is_my_app').AsInteger = 1 then
        begin
          TThread.Queue(nil,
            procedure
            begin
              TabItemOffer.Visible := True;
            end);
        end;
      if FDMemTableBids.RecordCount > 0 then
        TThread.Queue(nil,
          procedure
          begin
            LabelNotFound.Visible := false;
          end);
    end);
  aTask.Start;
end;

procedure TAppDetailsFrame.ListViewAmzomveliPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initFrame(Self.app_id, Self.is_owner);
end;

procedure TAppDetailsFrame.ListViewAmzomveliUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  TListItemImage(AItem.Objects.FindDrawable('PhoneImage')).ImageIndex := 6;
  TListItemImage(AItem.Objects.FindDrawable('EmailImage')).ImageIndex := 7;
  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).ImageIndex :=
    TListItemText(AItem.Objects.FindDrawable('TextStars')).Text.ToInteger;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG1')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG2')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG3')).ImageIndex := 8;
end;

procedure TAppDetailsFrame.ListViewAppDetailsUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  // Grey line background
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');
end;

procedure TAppDetailsFrame.ListViewOffersItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if FDMemTableBids.FieldByName('approved_id').AsInteger > 0 then
    RectangleCancel.Visible := True
  else
    RectangleChoose.Visible := True;
end;

procedure TAppDetailsFrame.ListViewOffersPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initFrame(Self.app_id, Self.is_owner);
end;

procedure TAppDetailsFrame.ListViewOffersUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  if TListItemText(AItem.Objects.FindDrawable('approved')).Text = 'დადასტურებულია' then
  begin
    TListItemImage(AItem.Objects.FindDrawable('ImageCheckBox')).ImageIndex := 9;
    TListItemText(AItem.Objects.FindDrawable('approved')).TextColor := TAlphaColorRec.Green;
  end
  else
  begin
    TListItemImage(AItem.Objects.FindDrawable('ImageCheckBox')).ImageIndex := 10;
    TListItemText(AItem.Objects.FindDrawable('approved')).TextColor := TAlphaColorRec.Red;
  end;
  // ImageOfferPrice
  TListItemImage(AItem.Objects.FindDrawable('ImageOfferPrice')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageOfferPrice')).Bitmap := Self.getBitmapFromResource('OfferPriceBG');
  // Bottom grey background
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBackground')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBackground')).Bitmap :=
    DModule.getBitmapFromResource('OfferBottomBackground');

  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).ImageIndex :=
    TListItemText(AItem.Objects.FindDrawable('TextStars')).Text.ToInteger;
end;

function TAppDetailsFrame.getBitmapFromResource(const AResourceName: String): TBitmap;
var
  Stream: TResourceStream;
begin
  Result := TBitmap.Create;
  Stream := TResourceStream.Create(HInstance, AResourceName, RT_RCDATA);
  try
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TAppDetailsFrame.ListViewPropertiesPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initFrame(Self.app_id, Self.is_owner);
end;

procedure TAppDetailsFrame.ListViewPropertiesUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  // Grey line background
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).Bitmap := DModule.getBitmapFromResource('AppDetails_line');
end;

procedure TAppDetailsFrame.RESTRequestAppAfterExecute(Sender: TCustomRESTRequest);
begin
  Self.RectanglePreloader.Visible := false;
  Self.ListViewOffers.PullRefreshWait := false;
  Self.ListViewAppDetails.PullRefreshWait := false;
  Self.ListViewProperties.PullRefreshWait := false;
  Self.ListViewAmzomveli.PullRefreshWait := false;
  if FDMemTableAmzomveli.RecordCount > 0 then
  begin
    TabItemOwner.Visible := Self.is_owner;
  end;
  if Self.is_owner = True then
  begin
    // If offers not exists
    if FDMemTableBids.RecordCount = 0 then
      LabelNotFound.Visible := True
    else
      LabelNotFound.Visible := false;
  end;
end;

end.
