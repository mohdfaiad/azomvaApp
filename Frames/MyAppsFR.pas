unit MyAppsFR;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.DBScope, System.ImageList, FMX.ImgList,
  System.Threading;

type
  TMyAppsFrame = class(TFrame)
    ListViewMyApps: TListView;
    RESTRequestApps: TRESTRequest;
    RESTResponseApps: TRESTResponse;
    RESTResponseDataSetAdapterApps: TRESTResponseDataSetAdapter;
    FDMemTableApps: TFDMemTable;
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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    ImageListAppList: TImageList;
    LinkListControlToField1: TLinkListControlToField;
    procedure ListViewMyAppsUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewMyAppsItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
      const ItemObject: TListItemDrawable);
    procedure RESTRequestAppsAfterExecute(Sender: TCustomRESTRequest);
  private
    procedure reloadItems(sort_field, sort: String);
    { Private declarations }
  public
    { Public declarations }
    procedure initFrame;
  end;

implementation

{$R *.fmx}

uses DataModule, AppDetails, Main;

procedure TMyAppsFrame.initFrame;
begin
  if not DModule.sesskey.IsEmpty then
  begin
    self.reloadItems('id', 'desc');
  end;
end;

procedure TMyAppsFrame.ListViewMyAppsItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
  id, v_height: Integer;
begin
  if (ItemObject is TListItemText) or (ItemObject is TListItemImage) then
  begin
    v_height := TListItemText(ListViewMyApps.Selected.View.FindDrawable('v_app_property_requisites_count'))
      .Text.ToInteger * 35;
    if (ItemObject.Name = 'app_property_requisites_count') or (ItemObject.Name = 'ArrowIcon') then
    begin
      if ListViewMyApps.Selected.Height = 150 then
      begin
        ListViewMyApps.Selected.Height := v_height + 150;
        TListItem(ListViewMyApps.Selected).View.FindDrawable('details').Visible := True;
        TListItem(ListViewMyApps.Selected).View.FindDrawable('details').Height := v_height;
        TListItemImage(ListViewMyApps.Selected.View.FindDrawable('ArrowIcon')).ImageIndex := 3;
      end
      else
      begin
        ListViewMyApps.Selected.Height := 150;
        TListItem(ListViewMyApps.Selected).View.FindDrawable('details').Visible := False;
        TListItemImage(ListViewMyApps.Selected.View.FindDrawable('ArrowIcon')).ImageIndex := 2;
      end;
    end
    else
    begin
      id := self.FDMemTableApps.FieldByName('id').AsInteger;
      with TAppDetailForm.Create(Application) do
      begin
        initForm(id, True);
      end;
    end;
  end;
end;

procedure TMyAppsFrame.ListViewMyAppsUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
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
  TListItemImage(AItem.Objects.FindDrawable('ImageID')).Bitmap := DModule.getBitmapFromResource('AppListImageID');

  // BlottomBlock
  TListItemImage(AItem.Objects.FindDrawable('BlottomBlock')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('BlottomBlock')).Bitmap := DModule.getBitmapFromResource('BlottomBlock');

  // DetailsBackground
  TListItemImage(AItem.Objects.FindDrawable('DetailsBackground')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('DetailsBackground')).Bitmap := DModule.getBitmapFromResource('DetailsBackground');

  // Top BG
  TListItemImage(AItem.Objects.FindDrawable('ImageTopBG')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageTopBG')).Bitmap := DModule.getBitmapFromResource('ItemSpaceBG');

  // Bottom BG
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG')).OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG')).Bitmap := DModule.getBitmapFromResource('ItemSpaceBG');

end;

procedure TMyAppsFrame.reloadItems(sort_field, sort: String);
var
  aTask: ITask;
begin
  aTask := TTask.Create(
    procedure()
    begin
      RESTRequestApps.Params.Clear;
      if not DModule.sesskey.IsEmpty then
      begin
        RESTRequestApps.AddParameter('sesskey', DModule.sesskey);
        RESTRequestApps.AddParameter('user_id', DModule.id.ToString);
        RESTRequestApps.AddParameter('op', 'onlymyapps');
      end;
      RESTRequestApps.AddParameter('sort_field', sort_field);
      RESTRequestApps.AddParameter('sort', sort);
      RESTRequestApps.Execute;
      TThread.Queue(nil,
        procedure
        begin
          mainForm.TabItemMyApps.Text := self.FDMemTableApps.RecordCount.ToString;
        end);
    end);
  aTask.Start;
end;

procedure TMyAppsFrame.RESTRequestAppsAfterExecute(Sender: TCustomRESTRequest);
begin
  self.ListViewMyApps.PullRefreshWait := False;
end;

end.
