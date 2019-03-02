unit MyContractsFR;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Controls.Presentation,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.DBScope;

type
  TMyContractsFrame = class(TFrame)
    RESTRequestMyContracts: TRESTRequest;
    RESTResponseMyContracts: TRESTResponse;
    RESTResponseDSAMyContracts: TRESTResponseDataSetAdapter;
    FDMemTableMyContracts: TFDMemTable;
    ListViewMyContracts: TListView;
    LabelNotFound: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    FDMemTableMyContractsapp_id: TWideStringField;
    FDMemTableMyContractsamzomveli_id: TWideStringField;
    FDMemTableMyContractsganmcxadebeli_id: TWideStringField;
    FDMemTableMyContractsganmcxadebeli_name: TWideStringField;
    FDMemTableMyContractsoffered_price: TWideStringField;
    FDMemTableMyContractsoffer_description: TWideStringField;
    FDMemTableMyContractscreate_date: TWideStringField;
    FDMemTableMyContractsimageindex: TWideStringField;
    LinkListControlToField1: TLinkListControlToField;
    procedure ListViewMyContractsItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListViewMyContractsPullRefresh(Sender: TObject);
    procedure ListViewMyContractsUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initFrame;
  end;

implementation

{$R *.fmx}

uses DataModule, Main, AppDetails;
{ TMyContractsFrame }

procedure TMyContractsFrame.initFrame;
begin
  RESTRequestMyContracts.Params.Clear;
  if not DModule.sesskey.IsEmpty then
  begin
    RESTRequestMyContracts.AddParameter('sesskey', DModule.sesskey);
    RESTRequestMyContracts.AddParameter('user_id', DModule.id.ToString);
    RESTRequestMyContracts.ExecuteAsync(
      procedure
      begin
        TThread.Queue(nil,
          procedure
          begin
            if FDMemTableMyContracts.RecordCount = 0 then
              LabelNotFound.Visible := True
            else
              LabelNotFound.Visible := False;
            // Home page tabs value
            MainForm.TabItemMyContracts.Text :=
              FDMemTableMyContracts.RecordCount.ToString;
          end);
      end);
  end;
end;

procedure TMyContractsFrame.ListViewMyContractsItemClick(const Sender: TObject;
const AItem: TListViewItem);
var
  v_app_id: integer;
begin
  v_app_id := self.FDMemTableMyContracts.FieldByName('app_id').AsInteger;
  with TAppDetailForm.Create(Application) do
  begin
    initForm(v_app_id, True);
  end;
end;

procedure TMyContractsFrame.ListViewMyContractsPullRefresh(Sender: TObject);
begin
  self.initFrame;
  self.ListViewMyContracts.PullRefreshWait := True;
end;

procedure TMyContractsFrame.ListViewMyContractsUpdateObjects
  (const Sender: TObject; const AItem: TListViewItem);
begin
  // contractsImage
  TListItemImage(AItem.Objects.FindDrawable('contractsImage'))
    .OwnsBitmap := True;
  TListItemImage(AItem.Objects.FindDrawable('contractsImage')).Bitmap :=
    DModule.getBitmapFromResource('contractsImage');
end;

end.
