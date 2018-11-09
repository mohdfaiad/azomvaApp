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
  FMX.LoadingIndicator, Header, System.ImageList, FMX.ImgList;

type
  TAppDetailForm = class(TForm)
    RectanglePreloader: TRectangle;
    RESTRequestApp: TRESTRequest;
    RESTResponseApp: TRESTResponse;
    RESTResponseDataSetAdapterApp: TRESTResponseDataSetAdapter;
    FDMemTableApp: TFDMemTable;
    RectangleMain: TRectangle;
    TabControl1: TTabControl;
    TabItemDetails: TTabItem;
    TabItemOffer: TTabItem;
    ListViewAppDetails: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListCToFAppDetails: TLinkListControlToField;
    ListViewOffers: TListView;
    RESTResponseDataSetAdapterBids: TRESTResponseDataSetAdapter;
    FDMemTableBids: TFDMemTable;
    BindSourceDB2: TBindSourceDB;
    LinkListCToFOffer: TLinkListControlToField;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    RESTResponseDataSetAdapterRequiz: TRESTResponseDataSetAdapter;
    FDMemTableapp_property_requisites: TFDMemTable;
    TabItemProperties: TTabItem;
    ListViewProperties: TListView;
    BindSourceDB3: TBindSourceDB;
    LinkListCToFProperties: TLinkListControlToField;
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
    FDMemTableAppid: TWideStringField;
    FDMemTableAppuser_id: TWideStringField;
    FDMemTableAppcreate_date: TWideStringField;
    FDMemTableAppdeadlineby_user: TWideStringField;
    FDMemTableAppimageIndex: TWideStringField;
    FDMemTableAppusername: TWideStringField;
    FDMemTableAppnote: TWideStringField;
    FDMemTableAppstatus_name: TWideStringField;
    FDMemTableAppstatus_color: TWideStringField;
    FDMemTableAppstatus_progress: TWideStringField;
    FDMemTableAppapp_status_id: TWideStringField;
    FDMemTableAppnotification_on_email: TWideStringField;
    FDMemTableAppnotification_on_device: TWideStringField;
    FDMemTableAppbidscount: TWideStringField;
    TabItemOwner: TTabItem;
    FDMemTableAmzomveli: TFDMemTable;
    RESTResponseDataSetAdapterAmzomveli: TRESTResponseDataSetAdapter;
    ListViewAmzomveli: TListView;
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
    LinkListCToFAmzomveli: TLinkListControlToField;
    HeaderFrame1: THeaderFrame;
    ImageListIcons: TImageList;
    LabelDetails: TLabel;
    Image2: TImage;
    StyleBookAppDetails: TStyleBook;
    RESTResponseApproveds: TRESTResponse;
    RESTRequestApproveds: TRESTRequest;
    RectangleChoose: TRectangle;
    RectangleBody: TRectangle;
    ButtonApprove: TButton;
    ButtonCancel: TButton;
    LabelName: TLabel;
    LabelPrice: TLabel;
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
    RectangleCancel: TRectangle;
    RectangleCancelBody: TRectangle;
    Button1: TButton;
    FMXLoadingIndicator2: TFMXLoadingIndicator;
    Label4: TLabel;
    MemoCancelBody: TMemo;
    Line1: TLine;
    LabelNotFound: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonBackClick(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ListViewOffersItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ButtonApproveClick(Sender: TObject);
    procedure ListViewAmzomveliUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewOffersPullRefresh(Sender: TObject);
    procedure ListViewAppDetailsPullRefresh(Sender: TObject);
    procedure ListViewAmzomveliPullRefresh(Sender: TObject);
    procedure ListViewPropertiesPullRefresh(Sender: TObject);
    procedure ListViewOffersUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ButtonCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TAppDetailForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    Self.Close;
end;

procedure TAppDetailForm.Button1Click(Sender: TObject);
begin
  // MemoCancelBody.Text
end;

procedure TAppDetailForm.ButtonApproveClick(Sender: TObject);
begin
  FMXLoadingIndicatorApproved.Visible := True;
  Self.RESTRequestApproveds.Params.Clear;
  RESTRequestApproveds.AddParameter('sesskey', DModule.sesskey);
  RESTRequestApproveds.AddParameter('user_id', DModule.id.ToString);
  RESTRequestApproveds.AddParameter('app_id', Self.app_id.ToString);
  RESTRequestApproveds.AddParameter('app_offer_id', Self.FDMemTableBids.FieldByName('id').AsString);
  RESTRequestApproveds.AddParameter('note', TIdURI.ParamsEncode('text here is depricated!'));
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
            offered_price := FDMemTableBids.FieldByName('offered_price').AsString;
            LabelPrice.Text := offered_price + '₾';
          end);
      end;
    end);
  aTask.Start;
end;

procedure TAppDetailForm.ListViewAmzomveliPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

procedure TAppDetailForm.ListViewAmzomveliUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  TListItemImage(AItem.Objects.FindDrawable('PhoneImage')).ImageIndex := 6;
  TListItemImage(AItem.Objects.FindDrawable('EmailImage')).ImageIndex := 7;
  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).ImageIndex :=
    TListItemText(AItem.Objects.FindDrawable('TextStars')).Text.ToInteger;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG1')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG2')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG3')).ImageIndex := 8;

  // ListItemImage(AItem.Objects.FindDrawable('ImageBottomBG'))
  // .Bitmap.Assign(ImageListStars.Source.Items[8].MultiResBitmap.Bitmaps[1]);
  { ListItemImage(AItem.Objects.FindDrawable('ImageBottomBG')).BeginUpdate;
    TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG')).Bitmap :=
    TBitmap.Create(1500, 100);
    TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG'))
    .Bitmap.Canvas.ClearRect(TRectF.Create(0, 0, 500, 45),
    TAlphaColor($FFE7E7E7));
    TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG')).EndUpdate; }
end;

procedure TAppDetailForm.ListViewAppDetailsPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

procedure TAppDetailForm.ListViewOffersItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  if FDMemTableBids.FieldByName('approved_id').AsInteger > 0 then
    RectangleCancel.Visible := True
  else
    RectangleChoose.Visible := True;
end;

procedure TAppDetailForm.ListViewOffersPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

procedure TAppDetailForm.ListViewOffersUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
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

  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).ImageIndex :=
    TListItemText(AItem.Objects.FindDrawable('TextStars')).Text.ToInteger;
end;

procedure TAppDetailForm.ListViewPropertiesPullRefresh(Sender: TObject);
begin
  Self.ListViewOffers.PullRefreshWait := True;
  Self.ListViewAppDetails.PullRefreshWait := True;
  Self.ListViewProperties.PullRefreshWait := True;
  Self.ListViewAmzomveli.PullRefreshWait := True;
  initForm(Self.app_id, Self.is_owner);
end;

end.
