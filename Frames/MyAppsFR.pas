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
    ListView1: TListView;
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
    LinkListControlToField1: TLinkListControlToField;
    ImageListAppList: TImageList;
    procedure ListView1UpdateObjects(const Sender: TObject; const AItem: TListViewItem);
    procedure ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
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

procedure TMyAppsFrame.ListView1ItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
  id, v_height: Integer;
begin
  if (ItemObject is TListItemText) or (ItemObject is TListItemImage) then
  begin
    v_height := TListItemText(ListView1.Selected.View.FindDrawable('v_app_property_requisites_count'))
      .Text.ToInteger * 35;
    if (ItemObject.Name = 'app_property_requisites_count') or (ItemObject.Name = 'ArrowIcon') then
    begin
      if ListView1.Selected.Height = 150 then
      begin
        ListView1.Selected.Height := v_height + 150;
        TListItem(ListView1.Selected).View.FindDrawable('details').Visible := True;
        TListItem(ListView1.Selected).View.FindDrawable('details').Height := v_height;
        TListItemImage(ListView1.Selected.View.FindDrawable('ArrowIcon')).ImageIndex := 3;
      end
      else
      begin
        ListView1.Selected.Height := 150;
        TListItem(ListView1.Selected).View.FindDrawable('details').Visible := False;
        TListItemImage(ListView1.Selected.View.FindDrawable('ArrowIcon')).ImageIndex := 2;
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

procedure TMyAppsFrame.ListView1UpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  TListItemImage(AItem.Objects.FindDrawable('IconCreateDate')).ImageIndex := 0;
  TListItemImage(AItem.Objects.FindDrawable('IconCalendar')).ImageIndex := 1;
  TListItemImage(AItem.Objects.FindDrawable('ArrowIcon')).ImageIndex := 2;
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
  self.ListView1.PullRefreshWait := False;
end;

end.
