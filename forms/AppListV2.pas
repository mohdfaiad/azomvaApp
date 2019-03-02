unit AppListV2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  REST.Client, Data.Bind.ObjectScope, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope, FMX.StdCtrls, FMX.Objects, FMX.ListView,
  FMX.Controls.Presentation, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Threading,
  FMX.MultiView, FMX.Layouts, FMX.ListBox, FMX.Ani, FMX.LoadingIndicator,
  Header, System.ImageList, FMX.ImgList, appDetailsFR, FMX.Effects,
  FMX.TabControl, FMX.ScrollBox, FMX.Memo, FMX.Edit, FMX.SearchBox,
  FMX.Gestures, System.Actions, FMX.ActnList;

type
  TAppListFormV2 = class(TForm)
    PreloaderRectangle: TRectangle;
    BindSourceDB1: TBindSourceDB;
    FDMemTableApps: TFDMemTable;
    RESTResponseDataSetAdapterApps: TRESTResponseDataSetAdapter;
    RESTResponseApps: TRESTResponse;
    RESTRequestApps: TRESTRequest;
    BindingsList1: TBindingsList;
    RectangleMain: TRectangle;
    RESTRequestLists: TRESTRequest;
    RESTResponseLists: TRESTResponse;
    RESTResponseDataSetAdapterLists: TRESTResponseDataSetAdapter;
    FDMemTableLocations: TFDMemTable;
    FDMemTableLocationsid: TWideStringField;
    FDMemTableLocationspid: TWideStringField;
    FDMemTableLocationstitle: TWideStringField;
    FDMemTableLocationsmap_title: TWideStringField;
    FDMemTableLocationschildren: TWideStringField;
    BindSourceDB2: TBindSourceDB;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    ListViewAppsList: TListView;
    LinkListControlToField1: TLinkListControlToField;
    HeaderFrame1: THeaderFrame;
    StyleBookAppList: TStyleBook;
    ImageListAppList: TImageList;
    FDMemTableAppsid: TWideStringField;
    FDMemTableAppsuser_id: TWideStringField;
    FDMemTableAppsdeadlineby_user: TWideStringField;
    FDMemTableAppsexecute_days: TWideStringField;
    FDMemTableAppsimageIndex: TWideStringField;
    FDMemTableAppsusername: TWideStringField;
    FDMemTableAppsnote: TWideStringField;
    FDMemTableAppsstatus_name: TWideStringField;
    FDMemTableAppsstatus_color: TWideStringField;
    FDMemTableAppsstatus_progress: TWideStringField;
    FDMemTableAppsapp_status_id: TWideStringField;
    FDMemTableAppsnotification_on_email: TWideStringField;
    FDMemTableAppsnotification_on_device: TWideStringField;
    FDMemTableAppscreate_date: TWideStringField;
    FDMemTableAppsapp_property_requisites: TWideStringField;
    FDMemTableAppslocation: TWideStringField;
    FDMemTableAppsarea: TWideStringField;
    FDMemTableAppsapp_property_requisites_count: TWideStringField;
    FDMemTableAppsIconCreateDate: TWideStringField;
    FDMemTableAppsIconCalendar: TWideStringField;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    LabelNotFound: TLabel;
    LayoutAppsDetails: TLayout;
    RectangleAppDetails: TRectangle;
    FloatAnimationLAD: TFloatAnimation;
    FMXLoadingLoadAppDetails: TFMXLoadingIndicator;
    TabControl1: TTabControl;
    TabItemDetails: TTabItem;
    ListViewAppDetails: TListView;
    LabelDetails: TLabel;
    Image2: TImage;
    TabItemOffer: TTabItem;
    ListViewOffers: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Image4: TImage;
    TabItemProperties: TTabItem;
    ListViewProperties: TListView;
    Label3: TLabel;
    Image5: TImage;
    TabItemOwner: TTabItem;
    ListViewAmzomveli: TListView;
    ShadowEffect3: TShadowEffect;
    Label4: TLabel;
    Image3: TImage;
    ImageListIcons: TImageList;
    ImageListStars: TImageList;
    RESTRequestApp: TRESTRequest;
    RESTResponseApp: TRESTResponse;
    RESTResponseDataSetAdapterApp: TRESTResponseDataSetAdapter;
    FDMemTableApp: TFDMemTable;
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
    RESTResponseDataSetAdapterBids: TRESTResponseDataSetAdapter;
    RESTRequestApproveds: TRESTRequest;
    RESTResponseApproveds: TRESTResponse;
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
    RESTResponseDataSetAdapterRequiz: TRESTResponseDataSetAdapter;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    BindSourceDB4: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    BindSourceDB5: TBindSourceDB;
    LinkListControlToField4: TLinkListControlToField;
    BindSourceDB6: TBindSourceDB;
    LinkListControlToField5: TLinkListControlToField;
    RectangleCancel: TRectangle;
    RectangleCancelBody: TRectangle;
    Button1: TButton;
    FMXLoadingIndicator2: TFMXLoadingIndicator;
    Label5: TLabel;
    MemoCancelBody: TMemo;
    Line1: TLine;
    RectangleChoose: TRectangle;
    RectangleBody: TRectangle;
    ButtonApprove: TButton;
    FMXLoadingIndicatorApproved: TFMXLoadingIndicator;
    ButtonCancel: TButton;
    offererUserNameLabel: TLabel;
    LabelPrice: TLabel;
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    edtSearchAppsKeywordEdit: TEdit;
    btnSearch: TButton;
    GestureManager1: TGestureManager;
    ActionListApps: TActionList;
    ActionSlideDownAppDetails: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListViewAppsListPullRefresh(Sender: TObject);
    procedure ListViewAppsListItemClickEx(const Sender: TObject;
      ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure ButtonCloseObjectDetailsClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure ListViewAppsListUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FloatAnimationLADFinish(Sender: TObject);
    procedure ListViewAppDetailsUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewOffersItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewOffersPullRefresh(Sender: TObject);
    procedure ListViewAmzomveliPullRefresh(Sender: TObject);
    procedure ListViewOffersUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewPropertiesUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewAmzomveliUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchAppsKeywordEditKeyUp(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure ActionSlideDownAppDetailsExecute(Sender: TObject);
    procedure RectangleCancelTap(Sender: TObject; const Point: TPointF);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
  private
    app_id: Integer;
    is_owner: Boolean;
    loadOnlyMyApps: Boolean;
    SearchBoxAppsListView: TSearchBox;
    v_KeyboardVisible: Boolean;
    procedure reloadItems(sort_field, sort: String);
    procedure appDetailsLayout(p_id: Integer);
    procedure initDetails(papp_id: Integer);
    procedure ListViewAppsSearchAction(p_keyword: String);
    { Private declarations }
  public
    { Public declarations }
    procedure initForm(loadOnlyMyApps: Boolean = False);
  end;

var
  AppListFormV2: TAppListFormV2;

implementation

{$R *.fmx}

uses DataModule, AppDetails, Main;

{ TAppListForm }

// Initialization
procedure TAppListFormV2.initForm(loadOnlyMyApps: Boolean = False);
var
  aTask: ITask;
  I: Integer;
begin
  self.v_KeyboardVisible := False;
  self.Show;
  if not Assigned(self.SearchBoxAppsListView) then
    for I := 0 to ListViewAppsList.Controls.Count - 1 do
      if ListViewAppsList.Controls[I] is TSearchBox then
      begin
        self.SearchBoxAppsListView := TSearchBox(ListViewAppsList.Controls[I]);
        // self.SearchBoxAppsListView.Visible := False;
        Break;
      End;

  LayoutAppsDetails.Position.Y := self.RectangleMain.Height +
    HeaderFrame1.Height + 150;
  self.FloatAnimationLAD.StartValue := LayoutAppsDetails.Position.Y;
  self.FloatAnimationLAD.StopValue := HeaderFrame1.Height;
  LayoutAppsDetails.Height := self.RectangleMain.Height;

  self.loadOnlyMyApps := loadOnlyMyApps;
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  PreloaderRectangle.Visible := True;
  // Run in another thread
  aTask := TTask.Create(
    procedure()
    begin
      // Lists request
      self.RESTRequestLists.Execute;
      // Apps request
      self.reloadItems('id', 'desc');
    end);
  aTask.Start;
end;

procedure TAppListFormV2.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  if self.LayoutAppsDetails.Position.Y = (HeaderFrame1.Height +
    RectangleStatusBar.Height) then
  begin
    FMXLoadingLoadAppDetails.Visible := True;
    FloatAnimationLAD.StartValue := HeaderFrame1.Height +
      RectangleStatusBar.Height;;
    FloatAnimationLAD.StopValue := self.RectangleMain.Height +
      HeaderFrame1.Height + RectangleStatusBar.Height;
    FloatAnimationLAD.Start;
    self.HeaderFrame1.LabelAppName.Text := 'განცხადების სია';
  end
  else
  begin
    self.Close;
  end;
end;

procedure TAppListFormV2.reloadItems(sort_field, sort: String);
begin
  PreloaderRectangle.Visible := True;
  RESTRequestApps.Params.Clear;
  if not DModule.sesskey.IsEmpty then
  begin
    RESTRequestApps.AddParameter('sesskey', DModule.sesskey);
    RESTRequestApps.AddParameter('user_id', DModule.id.ToString);
    if self.loadOnlyMyApps = True then
      RESTRequestApps.AddParameter('op', 'onlymyapps');
  end;
  RESTRequestApps.AddParameter('sort_field', sort_field);
  RESTRequestApps.AddParameter('sort', sort);
  RESTRequestApps.ExecuteAsync(
    procedure
    begin
      self.ListViewAppsList.PullRefreshWait := False;
      PreloaderRectangle.Visible := False;
      if RESTResponseApps.Status.Success then
      begin
        if FDMemTableApps.RecordCount = 0 then
          LabelNotFound.Visible := True
        else
          LabelNotFound.Visible := False;
      end
      else
      begin
        ShowMessage('მოთხოვნის დამუშავების დროს მოხდა შეცდომა.');
      end;
    end);
end;

procedure TAppListFormV2.btnSearchClick(Sender: TObject);
var
  v_keyword: String;
begin
  v_keyword := edtSearchAppsKeywordEdit.Text;
  self.ListViewAppsSearchAction(v_keyword);
end;

procedure TAppListFormV2.ListViewAppsSearchAction(p_keyword: String);
begin
  if Assigned(self.SearchBoxAppsListView) then
    self.SearchBoxAppsListView.Text := p_keyword;
  // self.SearchBoxAppsListView.Inflate;
end;

procedure TAppListFormV2.edtSearchAppsKeywordEditKeyUp(Sender: TObject;
var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  self.ListViewAppsSearchAction(edtSearchAppsKeywordEdit.Text);
end;

procedure TAppListFormV2.ButtonCloseObjectDetailsClick(Sender: TObject);
begin
  // RectangleObjectsDetails.Visible := False;
end;

procedure TAppListFormV2.FloatAnimationLADFinish(Sender: TObject);
begin
  FMXLoadingLoadAppDetails.Visible := False;
end;

procedure TAppListFormV2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TAppListFormV2.FormKeyUp(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if self.v_KeyboardVisible = False then
    if Key = 137 then
      self.Close;
end;

procedure TAppListFormV2.FormVirtualKeyboardHidden(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  self.v_KeyboardVisible := False;
end;

procedure TAppListFormV2.FormVirtualKeyboardShown(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  self.v_KeyboardVisible := True;
end;

procedure TAppListFormV2.ListViewAppDetailsUpdateObjects(const Sender: TObject;
const AItem: TListViewItem);
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

procedure TAppListFormV2.ListViewAppsListItemClickEx(const Sender: TObject;
ItemIndex: Integer; const LocalClickPos: TPointF;
const ItemObject: TListItemDrawable);
var
  id, v_height, v_detailsHeight: Integer;
begin
  if (ItemObject is TListItemText) or (ItemObject is TListItemImage) then
  begin
    if (ItemObject.Name = 'app_property_requisites_count') or
      (ItemObject.Name = 'BlottomBlock') or
      (ItemObject.Name = 'SelectedLineRedBG') then
    begin
      v_height := 170;
      // TListItemText(ListViewAppsList.Selected.View.FindDrawable('v_app_property_requisites_count')).Text.ToInteger * 150;
      v_detailsHeight := 150;
      if ListViewAppsList.Selected.Height = v_height then
      begin
        ListViewAppsList.Selected.Height := v_height + v_detailsHeight;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details')
          .Visible := True;
        TListItem(ListViewAppsList.Selected).View.FindDrawable
          ('DetailsBackground').Visible := True;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details').Height
          := v_detailsHeight;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('ArrowIcon'))
          .ImageIndex := 3;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable
          ('IconCalendar')).ImageIndex := 5;

        TListItemText(ListViewAppsList.Items[ItemIndex].View.FindDrawable
          ('app_property_requisites_count')).TextColor := TAlphaColorRec.White;
        TListItemText(ListViewAppsList.Items[ItemIndex].View.FindDrawable
          ('create_date')).TextColor := TAlphaColorRec.White;

        // BlottomBlock Red
        TListItemImage(ListViewAppsList.Items[ItemIndex].View.FindDrawable
          ('BlottomBlock')).OwnsBitmap := True;
        TListItemImage(ListViewAppsList.Items[ItemIndex].View.FindDrawable
          ('BlottomBlock')).Bitmap := DModule.getBitmapFromResource
          ('BlottomBlockRed');

      end
      else
      begin
        ListViewAppsList.Selected.Height := v_height;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details')
          .Visible := False;
        TListItem(ListViewAppsList.Selected).View.FindDrawable
          ('DetailsBackground').Visible := False;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('ArrowIcon'))
          .ImageIndex := 2;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable
          ('IconCalendar')).ImageIndex := 1;

        TListItemText(ListViewAppsList.Selected.View.FindDrawable('create_date')
          ).TextColor := TAlphaColorRec.Black;
        TListItemText(ListViewAppsList.Selected.View.FindDrawable
          ('app_property_requisites_count')).TextColor := TAlphaColorRec.Black;

        // BlottomBlock
        TListItemImage(ListViewAppsList.Items[ItemIndex].View.FindDrawable
          ('BlottomBlock')).OwnsBitmap := True;
        TListItemImage(ListViewAppsList.Items[ItemIndex].View.FindDrawable
          ('BlottomBlock')).Bitmap := DModule.getBitmapFromResource
          ('BlottomBlock');
      end;
    end
    else
    begin
      id := self.FDMemTableApps.FieldByName('id').AsInteger;
      self.appDetailsLayout(id);
    end;
  end;
end;

procedure TAppListFormV2.ActionSlideDownAppDetailsExecute(Sender: TObject);
begin
  if self.LayoutAppsDetails.Position.Y = (HeaderFrame1.Height +
    RectangleStatusBar.Height) then
  begin
    FMXLoadingLoadAppDetails.Visible := True;
    FloatAnimationLAD.StartValue := HeaderFrame1.Height +
      RectangleStatusBar.Height;;
    FloatAnimationLAD.StopValue := self.RectangleMain.Height +
      HeaderFrame1.Height + RectangleStatusBar.Height;
    FloatAnimationLAD.Start;
    self.HeaderFrame1.LabelAppName.Text := 'განცხადების სია';
  end
end;

procedure TAppListFormV2.appDetailsLayout(p_id: Integer);
begin
  FMXLoadingLoadAppDetails.Visible := True;
  initDetails(p_id);
  self.HeaderFrame1.LabelAppName.Text := 'განცხადება N ' + p_id.ToString;
  FloatAnimationLAD.StartValue := self.RectangleMain.Height +
    HeaderFrame1.Height + RectangleStatusBar.Height;
  FloatAnimationLAD.StopValue := HeaderFrame1.Height +
    RectangleStatusBar.Height;
  FloatAnimationLAD.Start;
end;

procedure TAppListFormV2.ListViewAppsListPullRefresh(Sender: TObject);
begin
  self.ListViewAppsList.PullRefreshWait := True;
  self.reloadItems('id', 'desc');
end;

procedure TAppListFormV2.ListViewAppsListUpdateObjects(const Sender: TObject;
const AItem: TListViewItem);
var
  v_width: Single;
begin
  TListItemImage(AItem.Objects.FindDrawable('IconCreateDate')).ImageIndex := 0;
  TListItemImage(AItem.Objects.FindDrawable('IconCalendar')).ImageIndex := 1;
  TListItemImage(AItem.Objects.FindDrawable('ArrowIcon')).ImageIndex := 2;
  v_width := self.Width - 110;
  TListItemText(AItem.Objects.FindDrawable('location')).Width := v_width;

  // ID background
  TListItemImage(AItem.Objects.FindDrawable('ImageID')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageID')).Bitmap :=
    DModule.getBitmapFromResource('AppListImageID');

  // BlottomBlock
  TListItemImage(AItem.Objects.FindDrawable('BlottomBlock')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('BlottomBlock')).Bitmap :=
    DModule.getBitmapFromResource('BlottomBlock');

  // DetailsBackground
  TListItemImage(AItem.Objects.FindDrawable('DetailsBackground'))
    .OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('DetailsBackground')).Bitmap :=
    DModule.getBitmapFromResource('DetailsBackground');

  // Top BG
  TListItemImage(AItem.Objects.FindDrawable('ImageTopBG')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageTopBG')).Bitmap :=
    DModule.getBitmapFromResource('ItemSpaceBG');

  // Bottom BG
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG'))
    .OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG')).Bitmap :=
    DModule.getBitmapFromResource('ItemSpaceBG');

end;

procedure TAppListFormV2.ListViewOffersItemClick(const Sender: TObject;
const AItem: TListViewItem);
begin
  if FDMemTableBids.FieldByName('approved_id').AsInteger > 0 then
    RectangleCancel.Visible := True
  else
    RectangleChoose.Visible := True;
end;

procedure TAppListFormV2.ListViewOffersPullRefresh(Sender: TObject);
begin
  self.ListViewOffers.PullRefreshWait := True;
  self.ListViewAppDetails.PullRefreshWait := True;
  self.ListViewProperties.PullRefreshWait := True;
  self.ListViewAmzomveli.PullRefreshWait := True;
  initDetails(self.app_id);
end;

procedure TAppListFormV2.ListViewOffersUpdateObjects(const Sender: TObject;
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

procedure TAppListFormV2.ListViewPropertiesUpdateObjects(const Sender: TObject;
const AItem: TListViewItem);
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

procedure TAppListFormV2.RectangleCancelTap(Sender: TObject;
const Point: TPointF);
begin
  RectangleCancel.Visible := False;
end;

procedure TAppListFormV2.ListViewAmzomveliPullRefresh(Sender: TObject);
begin
  self.ListViewOffers.PullRefreshWait := True;
  self.ListViewAppDetails.PullRefreshWait := True;
  self.ListViewProperties.PullRefreshWait := True;
  self.ListViewAmzomveli.PullRefreshWait := True;
  initDetails(self.app_id);
end;

procedure TAppListFormV2.ListViewAmzomveliUpdateObjects(const Sender: TObject;
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

procedure TAppListFormV2.initDetails(papp_id: Integer);
var
  aTask: ITask;
begin
  TabItemOffer.Visible := is_owner;
  TabItemOwner.Visible := False;
  self.app_id := papp_id;
  // RectanglePreloader.Visible := True;
  aTask := TTask.Create(
    procedure()
    var
      offered_price: string;
      is_my_app: Integer;
    begin
      RESTRequestApp.Params.Clear;
      RESTRequestApp.AddParameter('app_id', self.app_id.ToString);
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
            TabItemOffer.Visible := False;
          end);
      end;
      RESTRequestApp.Execute;
      // offered_price := FDMemTableBids.FieldByName('offered_price').AsString;
      TThread.Queue(nil,
        procedure
        begin
          LabelPrice.Text := FDMemTableBids.FieldByName('offered_price')
            .AsString + '₾';
          ListViewProperties.Height :=
            FDMemTableapp_property_requisites.RecordCount * 340;
        end);
      if FDMemTableApp.Active = True then
      begin
        is_my_app := FDMemTableApp.FieldByName('is_my_app').AsInteger;
        if is_my_app = 1 then
        begin
          TThread.Queue(nil,
            procedure
            begin
              TabItemOffer.Visible := True;
            end);
        end;
      end;
      if FDMemTableBids.RecordCount > 0 then
        TThread.Queue(nil,
          procedure
          begin
            LabelNotFound.Visible := False;
          end);
    end);
  aTask.Start;
end;

end.
