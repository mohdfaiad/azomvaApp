unit AppList;

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
  Header, System.ImageList, FMX.ImgList, appDetailsFR;

type
  TAppListForm = class(TForm)
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
    AppDetailsFrame1: TAppDetailsFrame;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListViewAppsListPullRefresh(Sender: TObject);
    procedure ListViewAppsListItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure ButtonCloseObjectDetailsClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure ListViewAppsListUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure FloatAnimationLADFinish(Sender: TObject);
  private
    loadOnlyMyApps: Boolean;
    procedure reloadItems(sort_field, sort: String);
    procedure appDetailsLayout(p_id: Integer);
    procedure EmbeddForm(AParent: TControl; p_id: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure initForm(loadOnlyMyApps: Boolean = False);
  end;

var
  AppListForm: TAppListForm;

implementation

{$R *.fmx}

uses DataModule, AppDetails, Main;

{ TAppListForm }

// Initialization
procedure TAppListForm.initForm(loadOnlyMyApps: Boolean = False);
var
  aTask: ITask;
begin
  self.Show;
  LayoutAppsDetails.Margins.Left := self.ListViewAppsList.Width;
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

procedure TAppListForm.reloadItems(sort_field, sort: String);
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

procedure TAppListForm.ButtonCloseObjectDetailsClick(Sender: TObject);
begin
  // RectangleObjectsDetails.Visible := False;
end;

procedure TAppListForm.FloatAnimationLADFinish(Sender: TObject);
begin
  FMXLoadingLoadAppDetails.Visible := False;
end;

procedure TAppListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TAppListForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    self.Close;
end;

procedure TAppListForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  if self.LayoutAppsDetails.Margins.Left = 0 then
  begin
    FMXLoadingLoadAppDetails.Visible := True;
    FloatAnimationLAD.StartValue := 0;
    FloatAnimationLAD.StopValue := self.ListViewAppsList.Width;
    FloatAnimationLAD.Start;
    self.HeaderFrame1.LabelAppName.Text := 'განცხადების სია';
  end
  else
  begin
    self.Close;
  end;
end;

procedure TAppListForm.ListViewAppsListItemClickEx(const Sender: TObject; ItemIndex: Integer;
const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
var
  id, v_height: Integer;
begin
  if (ItemObject is TListItemText) or (ItemObject is TListItemImage) then
  begin
    if (ItemObject.Name = 'app_property_requisites_count') or (ItemObject.Name = 'ArrowIcon') or
      (ItemObject.Name = 'SelectedLineRedBG') then
    begin
      v_height := TListItemText(ListViewAppsList.Selected.View.FindDrawable('v_app_property_requisites_count'))
        .Text.ToInteger * 35;
      if ListViewAppsList.Selected.Height = 150 then
      begin
        ListViewAppsList.Selected.Height := v_height + 150;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details').Visible := True;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details').Height := v_height;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('ArrowIcon')).ImageIndex := 3;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('IconCalendar')).ImageIndex := 5;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('SelectedLineRedBG')).Visible := True;

        TListItemText(ListViewAppsList.Selected.View.FindDrawable('create_date')).TextColor := TAlphaColorRec.White;

        TListItemText(ListViewAppsList.Items[ItemIndex].View.FindDrawable('create_date')).TextColor :=
          TAlphaColor($FFFFFF);
      end
      else
      begin
        ListViewAppsList.Selected.Height := 150;
        TListItem(ListViewAppsList.Selected).View.FindDrawable('details').Visible := False;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('ArrowIcon')).ImageIndex := 2;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('IconCalendar')).ImageIndex := 1;
        TListItemImage(ListViewAppsList.Selected.View.FindDrawable('SelectedLineRedBG')).Visible := False;

        TListItemText(ListViewAppsList.Selected.View.FindDrawable('create_date')).TextColor := TAlphaColorRec.Black;
        TListItemText(ListViewAppsList.Selected.View.FindDrawable('app_property_requisites_count')).TextColor :=
          TAlphaColorRec.Black;
      end;
    end
    else
    begin
      id := self.FDMemTableApps.FieldByName('id').AsInteger;
      self.appDetailsLayout(id);
      { with TAppDetailForm.Create(Application) do
        begin
        if self.loadOnlyMyApps = True then
        initForm(id, True)
        else
        initForm(id);
        end; }
    end;
  end;
end;

procedure TAppListForm.appDetailsLayout(p_id: Integer);
begin
  FMXLoadingLoadAppDetails.Visible := True;
  // EmbeddForm(self.RectangleAppDetails, p_id);
  AppDetailsFrame1.initFrame(p_id, self.loadOnlyMyApps);
  self.HeaderFrame1.LabelAppName.Text := 'განცხადება N ' + p_id.ToString;
  // FloatAnimationLAD.StartValue := self.ListViewAppsList.Width;
  FloatAnimationLAD.StopValue := 0;
  FloatAnimationLAD.Start;
end;

procedure TAppListForm.EmbeddForm(AParent: TControl; p_id: Integer);
// var
// FormC: TAppDetailFormC;
begin
  { FormC := TAppDetailFormC.Create(Application);
    try
    FormC.initForm(p_id, self.loadOnlyMyApps);
    while FormC.ChildrenCount > 0 do
    FormC.Children[0].Parent := AParent;
    finally
    FormC.Free;
    end; }
end;

procedure TAppListForm.ListViewAppsListPullRefresh(Sender: TObject);
begin
  self.ListViewAppsList.PullRefreshWait := True;
  self.reloadItems('id', 'desc');
end;

procedure TAppListForm.ListViewAppsListUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  TListItemImage(AItem.Objects.FindDrawable('IconCreateDate')).ImageIndex := 0;
  TListItemImage(AItem.Objects.FindDrawable('IconCalendar')).ImageIndex := 1;
  TListItemImage(AItem.Objects.FindDrawable('ArrowIcon')).ImageIndex := 2;
  TListItemText(AItem.Objects.FindDrawable('location')).Width := ListViewAppsList.Width - 100;

  // ID background
  TListItemImage(AItem.Objects.FindDrawable('ImageID')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageID')).Bitmap := DModule.getBitmapFromResource('AppListImageID');

  // Bottom grey background
  TListItemImage(AItem.Objects.FindDrawable('ImageBottom')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottom')).Bitmap := DModule.getBitmapFromResource('ImageBottom');

  // Bottom grey background
  TListItemImage(AItem.Objects.FindDrawable('ImageGreyLine')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageGreyLine')).Bitmap :=
    DModule.getBitmapFromResource('AppList_middleGreyLine');

end;

end.
