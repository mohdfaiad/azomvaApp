unit AppDetails;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Threading,
  FMX.Controls.Presentation, System.PushNotification, FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.DBScope, FMX.DateTimeCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Edit, IdURI,
  FMX.Ani, FMX.ListView, FMX.TabControl, FMX.Bind.GenData, FMX.Layouts,
  FMX.LoadingIndicator, Header, System.ImageList, FMX.ImgList, FMX.Effects;

type
  TAppDetailForm = class(TForm)
    RectanglePreloader: TRectangle;
    RESTRequestApp: TRESTRequest;
    RESTResponseApp: TRESTResponse;
    RESTResponseDataSetAdapterApp: TRESTResponseDataSetAdapter;
    FDMemTableApp: TFDMemTable;
    RectangleMain: TRectangle;
    TabControl1: TTabControl;
    TabItemDetails1: TTabItem;
    TabItemOffer1: TTabItem;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    ListViewOffers1: TListView;
    RESTResponseDataSetAdapterBids: TRESTResponseDataSetAdapter;
    FDMemTableBids: TFDMemTable;
    BindSourceDB2: TBindSourceDB;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    RESTResponseDataSetAdapterRequiz: TRESTResponseDataSetAdapter;
    FDMemTableapp_property_requisites: TFDMemTable;
    TabItemProperties1: TTabItem;
    ListViewProperties1: TListView;
    BindSourceDB3: TBindSourceDB;
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
    TabItemOwner1: TTabItem;
    FDMemTableAmzomveli: TFDMemTable;
    RESTResponseDataSetAdapterAmzomveli: TRESTResponseDataSetAdapter;
    ListViewAmzomveli1: TListView;
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
    BindSourceDB4: TBindSourceDB;
    HeaderFrame1: THeaderFrame;
    ImageListIcons: TImageList;
    LabelDetails: TLabel;
    Image2: TImage;
    StyleBookAppDetails: TStyleBook;
    RESTResponseApproveds: TRESTResponse;
    RESTRequestApproveds: TRESTRequest;
    RectangleChoose1: TRectangle;
    RectangleBody1: TRectangle;
    ButtonApprove: TButton;
    ButtonCancel: TButton;
    LabelName1: TLabel;
    LabelPrice1: TLabel;
    Image1: TImage;
    FMXLoadingIndicatorApproved: TFMXLoadingIndicator;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    ImageListStars: TImageList;
    Label1: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Image4: TImage;
    Label3: TLabel;
    Image5: TImage;
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
    RectangleCancel1: TRectangle;
    RectangleCancelBody1: TRectangle;
    Button1: TButton;
    FMXLoadingIndicator2: TFMXLoadingIndicator;
    Label4: TLabel;
    MemoCancelBody1: TMemo;
    Line1: TLine;
    LabelNotFound: TLabel;
    RectangleAppDetails: TRectangle;
    TabControl2: TTabControl;
    TabItemDetails: TTabItem;
    ListViewAppDetails: TListView;
    ShadowEffect4: TShadowEffect;
    Label5: TLabel;
    Image6: TImage;
    TabItemOffer: TTabItem;
    ListViewOffers: TListView;
    Label6: TLabel;
    ShadowEffect2: TShadowEffect;
    Label7: TLabel;
    Image7: TImage;
    TabItemProperties: TTabItem;
    ListViewProperties: TListView;
    ShadowEffect1: TShadowEffect;
    Label8: TLabel;
    Image8: TImage;
    TabItemOwner: TTabItem;
    ListViewAmzomveli: TListView;
    ShadowEffect3: TShadowEffect;
    Label9: TLabel;
    Image9: TImage;
    RectangleCancel: TRectangle;
    RectangleCancelBody: TRectangle;
    Button2: TButton;
    FMXLoadingIndicator3: TFMXLoadingIndicator;
    Label10: TLabel;
    MemoCancelBody: TMemo;
    Line2: TLine;
    RectangleChoose: TRectangle;
    RectangleBody: TRectangle;
    Button3: TButton;
    FMXLoadingIndicator4: TFMXLoadingIndicator;
    Button4: TButton;
    offererUserNameLabel: TLabel;
    LabelPrice: TLabel;
    Image10: TImage;
    LinkListControlToFieldAppDetails: TLinkListControlToField;
    LinkListControlToFieldOffers: TLinkListControlToField;
    LinkListControlToFieldProperties: TLinkListControlToField;
    LinkListControlToFieldAmzomveli: TLinkListControlToField;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonBackClick(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListViewOffers1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ButtonApproveClick(Sender: TObject);
    procedure ListViewAmzomveli1UpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewOffers1PullRefresh(Sender: TObject);
    procedure ListViewAppDetailsPullRefresh(Sender: TObject);
    procedure ListViewAmzomveli1PullRefresh(Sender: TObject);
    procedure ListViewProperties1PullRefresh(Sender: TObject);
    procedure ListViewOffers1UpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ButtonCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListViewAppDetailsUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewPropertiesUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
    app_id: Integer;
    is_owner: Boolean;
    aTask: ITask;
    procedure initForm(papp_id: Integer; is_owner: Boolean = false);
  end;

var
  AppDetailForm: TAppDetailForm;

implementation

{$R *.fmx}

uses DataModule, Main, AddApps;

procedure TAppDetailForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TAppDetailForm.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    Self.Close;
end;

procedure TAppDetailForm.Button1Click(Sender: TObject);
begin
  // MemoCancelBody.Text
end;

procedure TAppDetailForm.Button3Click(Sender: TObject);
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
      RESTRequestApproveds.AddParameter('app_offer_id',
        Self.FDMemTableBids.FieldByName('id').AsString);
      RESTRequestApproveds.AddParameter('note',
        TIdURI.ParamsEncode('text here is depricated!'));
      Self.RESTRequestApproveds.Execute;
      FMXLoadingIndicatorApproved.Visible := false;
      RectangleChoose.Visible := false;
      TThread.Queue(nil,
        procedure
        begin
          // Self.initFrame(Self.app_id, Self.is_owner);
          ShowMessage(RESTResponseApproveds.Content);
        end);
    end);
  aTask.Start;
end;

procedure TAppDetailForm.Button4Click(Sender: TObject);
begin
  RectangleChoose.Visible := false;
end;

procedure TAppDetailForm.ButtonApproveClick(Sender: TObject);
begin
  FMXLoadingIndicatorApproved.Visible := True;
  Self.RESTRequestApproveds.Params.Clear;
  RESTRequestApproveds.AddParameter('sesskey', DModule.sesskey);
  RESTRequestApproveds.AddParameter('user_id', DModule.id.ToString);
  RESTRequestApproveds.AddParameter('app_id', Self.app_id.ToString);
  RESTRequestApproveds.AddParameter('app_offer_id',
    Self.FDMemTableBids.FieldByName('id').AsString);
  RESTRequestApproveds.AddParameter('note',
    TIdURI.ParamsEncode('text here is depricated!'));
  Self.RESTRequestApproveds.ExecuteAsync(
    procedure
    begin
      TThread.Queue(nil,
        procedure
        begin
          FMXLoadingIndicatorApproved.Visible := false;
          RectangleChoose.Visible := false;
          ShowMessage(RESTResponseApproveds.Content);
        end);
    end);
end;

procedure TAppDetailForm.ButtonBackClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TAppDetailForm.ButtonCancelClick(Sender: TObject);
begin
  RectangleChoose.Visible := false;
end;

procedure TAppDetailForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TAppDetailForm.initForm(papp_id: Integer; is_owner: Boolean = false);
var
  aTask: ITask;
begin
  Self.LabelStatusBar.Text := DModule.statusBarTitle;
  Self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  Self.is_owner := is_owner;
  TabItemOffer.Visible := is_owner;
  TabItemOwner.Visible := false;
  Self.app_id := papp_id;
  HeaderFrame1.LabelAppName.Text := 'განცხადება N ' + papp_id.ToString;
  Self.Show;
  RectanglePreloader.Visible := True;
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
        TThread.Queue(nil,
          procedure
          begin
            if is_owner = True then
            begin
              RESTRequestApp.AddParameter('op', 'showamzomveliinfo');
              if FDMemTableBids.RecordCount > 0 then
                TabControl1.ActiveTab := TabItemOwner;
            end
            else
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
      TThread.Queue(nil,
        procedure
        begin
          Self.RectanglePreloader.Visible := false;
          Self.ListViewOffers.PullRefreshWait := false;
          Self.ListViewAppDetails.PullRefreshWait := false;
          Self.ListViewProperties.PullRefreshWait := false;
          Self.ListViewAmzomveli.PullRefreshWait := false;
        end);

      if FDMemTableAmzomveli.RecordCount > 0 then
      begin
        TThread.Queue(nil,
          procedure
          begin
            TabItemOwner.Visible := Self.is_owner;
          end);
        // If offers not exists
        if FDMemTableBids.RecordCount = 0 then
          TThread.Queue(nil,
            procedure
            begin
              LabelNotFound.Visible := True
            end)
        else
          TThread.Queue(nil,
            procedure
            begin
              LabelNotFound.Visible := false;
            end);
        TThread.Queue(nil,
          procedure
          begin
            offered_price := FDMemTableBids.FieldByName
              ('offered_price').AsString;
            LabelPrice.Text := offered_price + '₾';
          end);
      end;
    end);
  aTask.Start;
end;

procedure TAppDetailForm.ListViewAmzomveli1PullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

procedure TAppDetailForm.ListViewAmzomveli1UpdateObjects(const Sender: TObject;
const AItem: TListViewItem);
begin
  TListItemImage(AItem.Objects.FindDrawable('PhoneImage')).ImageIndex := 6;
  TListItemImage(AItem.Objects.FindDrawable('EmailImage')).ImageIndex := 7;
  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).ImageIndex :=
    TListItemText(AItem.Objects.FindDrawable('TextStars')).Text.ToInteger;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG1')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG2')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG3')).ImageIndex := 8;
end;

procedure TAppDetailForm.ListViewAppDetailsPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

procedure TAppDetailForm.ListViewAppDetailsUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  // Grey line background
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');
end;

procedure TAppDetailForm.ListViewOffers1ItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  if FDMemTableBids.FieldByName('approved_id').AsInteger > 0 then
    RectangleCancel.Visible := True
  else
    RectangleChoose.Visible := True;
end;

procedure TAppDetailForm.ListViewOffers1PullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

procedure TAppDetailForm.ListViewOffers1UpdateObjects(const Sender: TObject;
const AItem: TListViewItem);
var
  StarName: String;
  StarNumber: Integer;
begin
  if TListItemText(AItem.Objects.FindDrawable('approved')).Text = 'დადასტურებულია'
  then
  begin
    TListItemImage(AItem.Objects.FindDrawable('ImageCheckBox')).ImageIndex := 9;
    TListItemText(AItem.Objects.FindDrawable('approved')).TextColor :=
      TAlphaColorRec.Green;
  end
  else
  begin
    TListItemImage(AItem.Objects.FindDrawable('ImageCheckBox'))
      .ImageIndex := 10;
    TListItemText(AItem.Objects.FindDrawable('approved')).TextColor :=
      TAlphaColorRec.Red;
  end;
  // ImageOfferPrice
  TListItemImage(AItem.Objects.FindDrawable('ImageOfferPrice'))
    .OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageOfferPrice')).Bitmap :=
    DModule.getBitmapFromResource('OfferPriceBG');

  // Bottom grey background
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBackground'))
    .OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBackground')).Bitmap :=
    DModule.getBitmapFromResource('OfferBottomBackground');

  // Rating Stars
  StarNumber := TListItemText(AItem.Objects.FindDrawable('TextStars'))
    .Text.ToInteger;
  case StarNumber of
    0:
      StarName := '0star';
    1:
      StarName := '1star';
    2:
      StarName := '2star';
    3:
      StarName := '3star';
    4:
      StarName := '4star';
    5:
      StarName := '5star';
  end;

  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).Bitmap :=
    DModule.getBitmapFromResource(StarName);

  // TListItemImage(AItem.Objects.FindDrawable('ImageStars')).ImageIndex := TListItemText(AItem.Objects.FindDrawable('TextStars')).Text.ToInteger;
end;

procedure TAppDetailForm.ListViewProperties1PullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

procedure TAppDetailForm.ListViewPropertiesUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  // Grey line background
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine1')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine2')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine3')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');

  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageLine4')).Bitmap :=
    DModule.getBitmapFromResource('AppDetails_line');
end;

end.
