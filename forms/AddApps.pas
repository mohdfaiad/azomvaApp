unit AddApps;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.Objects,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  REST.Response.Adapter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.ListBox, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Memo, FMX.Layouts, FMX.TabControl, System.Threading, FMX.Types, IdURI,
  FMX.Ani, FMX.LoadingIndicator, Header, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Actions,
  FMX.ActnList, FMX.TMSBaseControl, FMX.TMSDateTimeEdit,
  REST.Types, System.ImageList, FMX.ImgList, FMX.Effects;

type
  TFormAddApps = class(TForm)
    ButtonFinishAdding: TButton;
    PreloaderRectangle: TRectangle;
    BindingsList1: TBindingsList;
    EditCadcode: TEdit;
    EditArea: TEdit;
    EditAddress: TEdit;
    RESTRequestAddApp: TRESTRequest;
    RESTResponseAddApp: TRESTResponse;
    ComboBoxLocation: TComboBox;
    SpeedButton1: TSpeedButton;
    TabControlMain: TTabControl;
    TabItemGeneral: TTabItem;
    TabItemRequizites: TTabItem;
    TabItemFinish: TTabItem;
    ButtonNextStep1: TButton;
    ButtonNextStep2: TButton;
    LabelAdditComment: TLabel;
    MemoNote: TMemo;
    RESTResponseDataSetAdapterAddApp: TRESTResponseDataSetAdapter;
    FDMemTableAddApp: TFDMemTable;
    FDMemTableAddAppstatus: TWideStringField;
    FDMemTableAddAppmsg: TWideStringField;
    TabItemAppOwner: TTabItem;
    ButtonNextStep3: TButton;
    EditUserParamsFullname: TEdit;
    EditUserParamsPhone: TEdit;
    EditUserParamsEmail: TEdit;
    CheckBoxDeviceNotifications: TCheckBox;
    CheckBoxEmailNotifications: TCheckBox;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    RadioButtonVada1: TRadioButton;
    RadioButtonVada3: TRadioButton;
    RadioButtonVada2: TRadioButton;
    CheckBoxUserParams: TCheckBox;
    LinkControlToPropertyEnabled: TLinkControlToProperty;
    LinkControlToPropertyEnabled2: TLinkControlToProperty;
    LinkControlToPropertyEnabled3: TLinkControlToProperty;
    HeaderFrame1: THeaderFrame;
    ListBoxServiceTypes: TListBox;
    RectDialogFinishApp: TRectangle;
    ButtonAppReCreate: TButton;
    ButtonFinishDIalogClose: TButton;
    TextFinishText: TText;
    RectangleFinishMain: TRectangle;
    ActionListAddApp: TActionList;
    ActionAddApp: TAction;
    ComboBoxApp_property_types: TComboBox;
    FDMemTableTMPApp: TFDMemTable;
    FDMemTableTMPAppid: TWideStringField;
    FDMemTableTMPAppcreate_date: TWideStringField;
    FDMemTableTMPAppdeadlineby_user: TWideStringField;
    FDMemTableTMPAppnote: TWideStringField;
    FDMemTablePropRequz: TFDMemTable;
    FDMemTableApp_service_typesMem: TFDMemTable;
    FDMemTableApp_service_typesMemtitle: TStringField;
    FDMemTableAppOwner: TFDMemTable;
    FDMemTablePropRequzapp_property_type_name: TStringField;
    FDMemTablePropRequzcadcode: TStringField;
    FDMemTablePropRequzarea: TStringField;
    FDMemTablePropRequzlocation_id: TIntegerField;
    FDMemTablePropRequzaddress: TStringField;
    FDMemTableAppOwnerfull_name: TStringField;
    FDMemTableAppOwneremail: TStringField;
    FDMemTableAppOwnerphone: TStringField;
    FDMemTableTMPAppEmailNotifications: TIntegerField;
    FDMemTableTMPAppDeviceNotifications: TIntegerField;
    FDMemTableApp: TFDMemTable;
    FDMemTableAppid: TWideStringField;
    FDMemTableAppuser_id: TWideStringField;
    FDMemTableAppapp_service_type_name: TWideStringField;
    FDMemTableAppapp_property_type_name: TWideStringField;
    FDMemTableAppcreate_date: TWideStringField;
    FDMemTableAppdeadlineby_user: TWideStringField;
    FDMemTableAppimageIndex: TWideStringField;
    FDMemTableAppusername: TWideStringField;
    FDMemTableAppnote: TWideStringField;
    FDMemTableAppaddress: TWideStringField;
    FDMemTableApparea: TWideStringField;
    FDMemTableAppcadcode: TWideStringField;
    FDMemTableApplocation_id: TWideStringField;
    FDMemTableApplocation_name: TWideStringField;
    FDMemTableApplon_lat: TWideStringField;
    FDMemTableAppstatus_name: TWideStringField;
    FDMemTableAppstatus_color: TWideStringField;
    FDMemTableAppstatus_progress: TWideStringField;
    FDMemTableAppapp_status_id: TWideStringField;
    FDMemTableApplocation_address: TWideStringField;
    BindSourceDBApp: TBindSourceDB;
    FDMemTablePropRequzapp_property_type_id: TIntegerField;
    FDMemTablePropRequzfull_name: TStringField;
    FDMemTablePropRequzemail: TStringField;
    FDMemTablePropRequzphone: TStringField;
    FDMemTablePropRequzapp_service_types: TWideStringField;
    TMSFMXDateTimeEdit1: TTMSFMXDateTimeEdit;
    LabelOfferFinishDateTime: TLabel;
    RectangleRadioGroup: TRectangle;
    LabelNaxazisMomzadebisVada: TLabel;
    StyleBookAddApps: TStyleBook;
    RectangleVada1: TRectangle;
    RectangleVada2: TRectangle;
    RectangleVada3: TRectangle;
    Label1Dge: TLabel;
    Label4Dge: TLabel;
    Label7Dge: TLabel;
    Label4: TLabel;
    Image1: TImage;
    LabelFinish: TLabel;
    ImageFinishIcon: TImage;
    ImageOfferFinishDateTime: TImage;
    ImageNaxazisMomzadebisVada: TImage;
    RectangleInfo: TRectangle;
    Image2: TImage;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    ComboBoxLocationChildren: TComboBox;
    BindSourceDB1: TBindSourceDB;
    FMXLoadingLocChildren: TFMXLoadingIndicator;
    FDMemTableAppapp_property_requisites_count: TIntegerField;
    ImageListAppList: TImageList;
    VertScrollBoxGeneralTab: TVertScrollBox;
    VertScrollBoxRequizitesTab: TVertScrollBox;
    VertScrollBoxAppOwne: TVertScrollBox;
    VertScrollBoxFinish: TVertScrollBox;
    FMXLoadingPreloader: TFMXLoadingIndicator;
    RectanglePropertyRequizites: TRectangle;
    LinkListControlToField2: TLinkListControlToField;
    BindSourceDB4: TBindSourceDB;
    BindSourceDB5: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB6: TBindSourceDB;
    LinkListControlToField5: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField3: TLinkListControlToField;
    Label1: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Image4: TImage;
    Rectangle1: TRectangle;
    ListViewAppsList: TListView;
    LabelNotFound: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonFinishAddingClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ButtonNextStep1Click(Sender: TObject);
    procedure ButtonNextStep2Click(Sender: TObject);
    procedure ButtonNextStep3Click(Sender: TObject);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure ActionAddAppExecute(Sender: TObject);
    procedure ButtonFinishDIalogCloseClick(Sender: TObject);
    procedure ButtonAppReCreateClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure ListBoxServiceTypesItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ListViewAppsListUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure RESTRequestListsAfterExecute(Sender: TCustomRESTRequest);
    procedure EditCadcodeEnter(Sender: TObject);
    procedure EditCadcodeExit(Sender: TObject);
    procedure EditAreaExit(Sender: TObject);
    procedure EditAreaEnter(Sender: TObject);
    procedure EditAddressEnter(Sender: TObject);
    procedure EditAddressExit(Sender: TObject);
    procedure MemoNoteEnter(Sender: TObject);
    procedure MemoNoteExit(Sender: TObject);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure TabControlMainChange(Sender: TObject);
  private
  var
    v_initialized: Boolean;
    V_App_service_types: String;
    v_global_location_id: integer;
    v_KeyboardVisible: Boolean;
    v_StepNumber: integer;
    procedure fillListViewWithOneRecord;
    { Private declarations }
  public
    { Public declarations }
    procedure initForm;
  end;

var
  FormAddApps: TFormAddApps;

implementation

{$R *.fmx}

uses Main, DataModule, map, auth, UserGanmcxadebeliReg;

{ TFormAddApps }

procedure TFormAddApps.initForm;
var
  aTask: ITask;
begin
  self.v_initialized := False;
  self.v_KeyboardVisible := False;
  self.v_StepNumber := 0;
  self.Show;
  self.RectangleFinishMain.Height := Screen.Height + (Screen.Height / 2);
  self.RectDialogFinishApp.Height := Screen.Height + (Screen.Height / 2);
  self.RectanglePropertyRequizites.Height := Screen.Height +
    (Screen.Height / 2);

  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  TMSFMXDateTimeEdit1.DateTime := (Now() + 1) + EncodeTime(21, 00, 00, 0);
  TMSFMXDateTimeEdit1.TimeFormat := 'hh:nn:ss';
  TMSFMXDateTimeEdit1.DateFormat := 'dd-mm-yyyy';

  DModule.FDTableApp_service_types.Active := True;

  self.TextFinishText.Text := DModule.getPagesText(2);

  self.EditUserParamsFullname.Text := DModule.full_name;
  self.EditUserParamsEmail.Text := DModule.email;
  if DModule.phone.Length > 0 then
    self.EditUserParamsPhone.Text := DModule.phone;
  if DModule.sesskey.IsEmpty then
  begin
    CheckBoxUserParams.IsChecked := True;
  end
  else
  begin
    CheckBoxUserParams.IsChecked := False;
  end;

  self.EditUserParamsFullname.Enabled := False;
  self.EditUserParamsEmail.Enabled := False;
  self.EditUserParamsPhone.Enabled := False;
end;

procedure TFormAddApps.ListBoxServiceTypesItemClick(const Sender
  : TCustomListBox; const Item: TListBoxItem);
begin
  if Item.IsChecked = False then
  begin
    Item.IsChecked := True;
    // Item.TextSettings.FontColor := TAlphaColor($FFFF3434);
    Item.StyleLookup := 'MylistboxitemstyleActive';
    Item.UpdateEffects;
  end
  else
  begin
    Item.IsChecked := False;
    Item.StyleLookup := 'Mylistboxitemstyle';
    // Item.TextSettings.FontColor := TAlphaColor($FF898989);
    Item.UpdateEffects;
  end;
end;

procedure TFormAddApps.ListViewAppsListUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // LBItemLine 1
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine1')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine1')).Bitmap :=
    DModule.getBitmapFromResource('LBItemLine');
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine1')).PlaceOffset.X :=
    TListItemText(AItem.Objects.FindDrawable('TextLocation')).PlaceOffset.X;
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine1')).PlaceOffset.Y :=
    TListItemText(AItem.Objects.FindDrawable('TextLocation')).PlaceOffset.Y;

  // LBItemLine 2
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine2')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine2')).Bitmap :=
    DModule.getBitmapFromResource('LBItemLine');
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine2')).PlaceOffset.X :=
    TListItemText(AItem.Objects.FindDrawable('TextPropType')).PlaceOffset.X;
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine2')).PlaceOffset.Y :=
    TListItemText(AItem.Objects.FindDrawable('TextPropType')).PlaceOffset.Y;

  // LBItemLine 3
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine3')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine3')).Bitmap :=
    DModule.getBitmapFromResource('LBItemLine');
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine3')).PlaceOffset.X :=
    TListItemText(AItem.Objects.FindDrawable('TextArea')).PlaceOffset.X;
  TListItemImage(AItem.Objects.FindDrawable('LBItemLine3')).PlaceOffset.Y :=
    TListItemText(AItem.Objects.FindDrawable('TextArea')).PlaceOffset.Y;
end;

procedure TFormAddApps.MemoNoteEnter(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 380);
end;

procedure TFormAddApps.MemoNoteExit(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 0);
end;

procedure TFormAddApps.RESTRequestListsAfterExecute(Sender: TCustomRESTRequest);
begin
  // PreloaderRectangle.Visible := False;
end;

// 1 step of wizzard
procedure TFormAddApps.ButtonNextStep1Click(Sender: TObject);
var
  Item, v_id, v_where_string: string;
  I, V_IsChecked: integer;
begin
  V_App_service_types := '';
  v_where_string := '';
  FDMemTableApp_service_typesMem.Open;
  V_IsChecked := 0;
  for I := 0 to ListBoxServiceTypes.Items.Count - 1 do
  begin
    if ListBoxServiceTypes.ListItems[I].IsChecked = True then
    begin
      V_IsChecked := V_IsChecked + 1;
      if v_where_string.Length > 0 then
        v_where_string := v_where_string + ' or id=' +
          ListBoxServiceTypes.ListItems[I].ItemData.Detail
      else
      begin
        v_id := ListBoxServiceTypes.ListItems[I].Index.ToString;
        if v_id.ToInteger > 0 then
        begin
          v_where_string := 'id=' + v_id;
        end;
      end;

      Item := TIdURI.ParamsEncode(ListBoxServiceTypes.Items.Strings[I]);
      V_App_service_types := V_App_service_types + Item + '|';
    end;
  end;

  // Active List_property_types dataset
  DModule.FDTableList_property_types.Active := True;
  DModule.FDTableList_property_types.Filtered := False;
  DModule.FDTableList_property_types.Filter := v_where_string;
  DModule.FDTableList_property_types.Filtered := True;

  // Active locations dataset
  DModule.FDTableLocation.Active := True;
  DModule.FDTableLocation.Filtered := False;
  DModule.FDTableLocation.Filter := 'pid=0';
  DModule.FDTableLocation.Filtered := True;

  V_App_service_types := V_App_service_types.Remove
    (V_App_service_types.Length - 1);
  if V_IsChecked > 0 then
  begin
    { FMXLoadingPreloader.Visible := True;
      RESTRequestApp_property_types.Params.Clear;
      RESTRequestApp_property_types.AddParameter('app_service_types',
      V_App_service_types);
      RESTRequestApp_property_types.Execute; }
    // PreloaderRectangle.Visible := False;
    FMXLoadingPreloader.Visible := False;
    TabItemRequizites.Enabled := True;
    TabControlMain.ActiveTab := TabItemRequizites;
    TabItemGeneral.Enabled := False;
  end
  else
  begin
    ShowMessage('გთხოვთ მონიშნოთ მინიმუმ ერთი მომსახურების ტიპი');
  end;
end;

// 2 step of wizzard
procedure TFormAddApps.ButtonNextStep2Click(Sender: TObject);
begin
  { if EditCadcode.Text.IsEmpty = True then  //optional
    begin
    ShowMessage('გთხოვთ შეავსოთ უძრავი ქონების საკადასტრო კოდი');
    exit;
    end; }
  if EditArea.Text.IsEmpty = True then
  begin
    ShowMessage('გთხოვთ შეავსოთ უძრავი ქონების ფართობი');
    exit;
  end;
  if EditAddress.Text.IsEmpty = True then
  begin
    ShowMessage('გთხოვთ შეავსოთ უძრავი ქონების მისამართი');
    exit;
  end;
  TabItemRequizites.Enabled := False;
  TabItemAppOwner.Enabled := True;
  TabControlMain.ActiveTab := TabItemAppOwner;
end;

procedure TFormAddApps.ButtonFinishAddingClick(Sender: TObject);
begin
  // განცხადების დამატება
  if DModule.sesskey.IsEmpty = True then
  begin
    with TGanmcxadeblisRegForm.Create(Application) do
    begin
      closeAfterReg := True;
      initForm;
    end;
  end
  else
  begin
    ActionAddApp.Execute;
  end;
end;

// 5 step of wizzard
procedure TFormAddApps.ActionAddAppExecute(Sender: TObject);
var
  I: integer;
  aTask: ITask;
begin
  FMXLoadingPreloader.Visible := True;
  // PreloaderRectangle.Visible := True;
  aTask := TTask.Create(
    procedure()
    var
      status: integer;
      msg: string;
    begin
      RESTRequestAddApp.Params.Clear;
      // ავტორიზაციის პარამეტრები
      RESTRequestAddApp.Params.AddItem('sesskey', DModule.sesskey);
      RESTRequestAddApp.Params.AddItem('user_id', DModule.id.ToString);
      // ძირითადი ინფორმაციის პარამეტრები
      with RESTRequestAddApp.Params.AddItem do
      begin
        name := 'notification_on_device';
        if CheckBoxDeviceNotifications.IsChecked = True then
          Value := '1'
        else
          Value := '0';
      end;
      with RESTRequestAddApp.Params.AddItem do
      begin
        name := 'notification_on_email';
        if CheckBoxEmailNotifications.IsChecked = True then
          Value := '1'
        else
          Value := '0';
      end;
      with RESTRequestAddApp.Params.AddItem do
      begin
        name := 'execute_days';
        if RadioButtonVada1.IsChecked = True then
          Value := '1'
        else if RadioButtonVada2.IsChecked = True then
          Value := '4'
        else if RadioButtonVada3.IsChecked = True then
          Value := '7'
        else
          Value := '0';
      end;
      with RESTRequestAddApp.Params.AddItem do
      begin
        name := 'note';
        Value := TIdURI.ParamsEncode(MemoNote.Text);
      end;
      RESTRequestAddApp.AddParameter('location_id',
        self.v_global_location_id.ToString);
      RESTRequestAddApp.AddParameter('deadlineby_user',
        DateTimeToStr(TMSFMXDateTimeEdit1.DateTime));

      // მომსახურების ტიპები
      FDMemTableApp_service_typesMem.First;
      while not FDMemTableApp_service_typesMem.Eof do
      begin
        RESTRequestAddApp.Params.AddItem('app_service_types[]',
          FDMemTableApp_service_typesMem.FieldByName('title').AsString);
        FDMemTableApp_service_typesMem.Next;
      end;

      // ქონების რეკვიზიტები
      I := 0;
      FDMemTablePropRequz.First;
      while not FDMemTablePropRequz.Eof do
      begin
        RESTRequestAddApp.Params.AddItem('PropRequz[' + I.ToString +
          '][app_service_types]',
          FDMemTablePropRequz.FieldByName('app_service_types').AsString);
        RESTRequestAddApp.Params.AddItem('PropRequz[' + I.ToString +
          '][app_property_type_id]',
          FDMemTablePropRequz.FieldByName('app_property_type_id').AsString);
        RESTRequestAddApp.Params.AddItem('PropRequz[' + I.ToString +
          '][cadcode]', FDMemTablePropRequz.FieldByName('cadcode').AsString);
        RESTRequestAddApp.Params.AddItem('PropRequz[' + I.ToString + '][area]',
          FDMemTablePropRequz.FieldByName('area').AsString);
        RESTRequestAddApp.Params.AddItem('PropRequz[' + I.ToString +
          '][location_id]', self.v_global_location_id.ToString);
        RESTRequestAddApp.Params.AddItem('PropRequz[' + I.ToString +
          '][address]', FDMemTablePropRequz.FieldByName('address').AsString);
        {
          RESTRequestAddApp.Params.AddItem('lon_lat', TIdURI.ParamsEncode(DModule.MyPosition.Latitude.ToString + ',' +
          DModule.MyPosition.Longitude.ToString));
        }

        with RESTRequestAddApp.Params.AddItem do
        begin
          name := 'PropRequz[' + I.ToString + '][full_name]';
          Value := FDMemTablePropRequz.FieldByName('full_name').AsString;
        end;
        with RESTRequestAddApp.Params.AddItem do
        begin
          name := 'PropRequz[' + I.ToString + '][phone]';
          Value := FDMemTablePropRequz.FieldByName('phone').AsString;
        end;
        with RESTRequestAddApp.Params.AddItem do
        begin
          name := 'PropRequz[' + I.ToString + '][email]';
          Value := FDMemTablePropRequz.FieldByName('email').AsString;
        end;

        I := I + 1;
        FDMemTablePropRequz.Next;
      end;
      // დამკვეთის რეკვიზიტები
      RESTRequestAddApp.Execute;
      status := FDMemTableAddApp.FieldByName('status').AsInteger;
      msg := FDMemTableAddApp.FieldByName('msg').AsString;
      FMXLoadingPreloader.Visible := False;
      if status = 1 then
      begin
        MainForm.reloadAppsCount;
        TThread.Queue(nil,
          procedure
          begin
            ShowMessage(msg);
          end);
        self.Close;
      end
      else
        MemoNote.Text := RESTResponseAddApp.Content;
    end);
  aTask.Start;
end;

procedure TFormAddApps.fillListViewWithOneRecord;
begin
  // set listview item
  FDMemTablePropRequz.Open;
  FDMemTablePropRequz.Insert;
  FDMemTablePropRequz.FieldByName('app_service_types').AsString :=
    V_App_service_types;
  FDMemTablePropRequz.FieldByName('app_property_type_id').AsInteger :=
    DModule.FDTableList_property_types.FieldByName('id').AsInteger;
  FDMemTablePropRequz.FieldByName('app_property_type_name').AsString :=
    DModule.FDTableList_property_types.FieldByName('title').AsString;
  FDMemTablePropRequz.FieldByName('cadcode').AsString := EditCadcode.Text;
  FDMemTablePropRequz.FieldByName('area').AsString := EditArea.Text;
  self.v_global_location_id := DModule.FDTableLocationChildren.FieldByName('id')
    .AsInteger;
  FDMemTablePropRequz.FieldByName('location_id').AsInteger :=
    self.v_global_location_id;
  FDMemTablePropRequz.FieldByName('address').AsString :=
    TIdURI.ParamsEncode(EditAddress.Text);

  if self.CheckBoxUserParams.IsChecked = True then
  begin
    FDMemTablePropRequz.FieldByName('full_name').AsString :=
      TIdURI.ParamsEncode(EditUserParamsFullname.Text);
    FDMemTablePropRequz.FieldByName('email').AsString :=
      TIdURI.ParamsEncode(EditUserParamsEmail.Text);
    FDMemTablePropRequz.FieldByName('phone').AsString :=
      TIdURI.ParamsEncode(EditUserParamsPhone.Text);
  end
  else
  begin
    FDMemTablePropRequz.FieldByName('full_name').AsString :=
      TIdURI.ParamsEncode(DModule.full_name);
    FDMemTablePropRequz.FieldByName('email').AsString :=
      TIdURI.ParamsEncode(DModule.email);
    FDMemTablePropRequz.FieldByName('phone').AsString :=
      TIdURI.ParamsEncode(DModule.phone);
  end;

  FDMemTablePropRequz.Post;

  V_App_service_types := '';

  FDMemTableApp.Open;
  if FDMemTableApp.RecordCount = 0 then
  begin
    with FDMemTableApp do
    begin
      Insert;
      FieldByName('create_date').AsDateTime := Now();
      FieldByName('app_property_type_name').AsString :=
        DModule.FDTableList_property_types.FieldByName('title').AsString;
      FieldByName('location_address').AsString :=
        DModule.FDTableLocation.FieldByName('title').AsString;
      FieldByName('area').AsString := EditArea.Text;
      FieldByName('address').AsString := EditAddress.Text;
      Post;
    end;
  end
  else
  begin
    with FDMemTableApp do
    begin
      Edit;
      FieldByName('app_property_type_name').AsString :=
        FieldByName('app_property_type_name').AsString + ', ' +
        DModule.FDTableList_property_types.FieldByName('title').AsString;
      FieldByName('area').AsString := FieldByName('area').AsString + ', ' +
        EditArea.Text;
      FieldByName('address').AsString := FieldByName('address').AsString + ', '
        + EditAddress.Text;
      Post;
    end;
  end;
  // HeaderFrame1.LabelAppName.Text := FDMemTableApp.RecordCount.ToString;
end;

procedure TFormAddApps.ButtonNextStep3Click(Sender: TObject);
begin
  TabItemAppOwner.Enabled := True;
  TabItemFinish.Enabled := True;
  TabControlMain.ActiveTab := TabItemFinish;
  self.fillListViewWithOneRecord;
end;

procedure TFormAddApps.ButtonFinishDIalogCloseClick(Sender: TObject);
begin
  // ActionAddApp.Execute;
  RectDialogFinishApp.Visible := False;
end;

procedure TFormAddApps.ButtonAppReCreateClick(Sender: TObject);
var
  I: integer;
begin
  DModule.FDTableList_property_types.First;
  EditCadcode.Text := '';
  EditArea.Text := '';
  EditAddress.Text := '';
  ComboBoxLocation.Enabled := False;
  ComboBoxLocationChildren.Enabled := False;
  for I := 0 to ListBoxServiceTypes.Items.Count - 1 do
  begin
    ListBoxServiceTypes.ListItems[I].IsChecked := False;
  end;
  TabItemGeneral.Enabled := True;
  TabControlMain.ActiveTab := TabItemGeneral;
end;

// 4 step of wizzard
procedure TFormAddApps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TFormAddApps.FormKeyUp(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if self.v_KeyboardVisible = False then
    if (Key = 137) and (self.v_StepNumber = 0) then
      self.Close;
end;

procedure TFormAddApps.FormVirtualKeyboardHidden(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  self.v_KeyboardVisible := False;
end;

procedure TFormAddApps.FormVirtualKeyboardShown(Sender: TObject;
KeyboardVisible: Boolean; const Bounds: TRect);
begin
  self.v_KeyboardVisible := True;
end;

procedure TFormAddApps.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  if TabControlMain.ActiveTab = TabItemGeneral then
    self.Close
  else if TabControlMain.ActiveTab = TabItemRequizites then
  begin
    TabItemGeneral.Enabled := True;
    TabControlMain.ActiveTab := TabItemGeneral;
  end
  else if TabControlMain.ActiveTab = TabItemAppOwner then
  begin
    TabItemRequizites.Enabled := True;
    TabControlMain.ActiveTab := TabItemRequizites;
  end
  else if TabControlMain.ActiveTab = TabItemFinish then
  begin
    TabItemAppOwner.Enabled := True;
    TabControlMain.ActiveTab := TabItemAppOwner;
  end;
end;

procedure TFormAddApps.EditCadcodeEnter(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 230);
  // VertScrollBoxRequizitesTab.AnimateFloat('ViewportPosition.X', 245, 0.5, FMX.Types.TAnimationType.InOut);
end;

procedure TFormAddApps.EditAreaEnter(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 295);
end;

procedure TFormAddApps.EditAddressEnter(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 350);
end;

procedure TFormAddApps.EditAddressExit(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 0);
end;

procedure TFormAddApps.EditAreaExit(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 0);
end;

procedure TFormAddApps.EditCadcodeExit(Sender: TObject);
begin
  VertScrollBoxRequizitesTab.ViewportPosition :=
    PointF(VertScrollBoxRequizitesTab.ViewportPosition.X, 0);
end;

procedure TFormAddApps.SpeedButton1Click(Sender: TObject);
begin
  if Assigned(mapViewForm) then
    mapViewForm.Show
  else
  begin
    with TmapViewForm.Create(Application) do
    begin
      initForm;
    end;
  end;
end;

procedure TFormAddApps.TabControlMainChange(Sender: TObject);
begin
  self.v_StepNumber := TTabControl(Sender).ActiveTab.Index;
  if TTabControl(Sender).ActiveTab = TabItemFinish then
  begin
    // ListViewAppsList.Height:=ListViewAppsList.Height *
  end;
end;

end.
