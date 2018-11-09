unit MyContracts;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Header,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Layouts,
  FMX.LoadingIndicator, FMX.Objects, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.ImageList, FMX.ImgList, Data.Bind.DBScope, System.Rtti,
  System.Bindings.Outputs, System.Threading,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TMyContractsForm = class(TForm)
    HeaderFrame1: THeaderFrame;
    RectanglePreloader: TRectangle;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    ListViewMyContracts: TListView;
    BindSourceDB1: TBindSourceDB;
    RESTRequestContracts: TRESTRequest;
    RESTResponseContracts: TRESTResponse;
    RESTResponseDataSetAdapterContracts: TRESTResponseDataSetAdapter;
    FDMemTableContracts: TFDMemTable;
    FDMemTableContractsapp_id: TWideStringField;
    FDMemTableContractsamzomveli_id: TWideStringField;
    FDMemTableContractsganmcxadebeli_id: TWideStringField;
    FDMemTableContractsganmcxadebeli_name: TWideStringField;
    FDMemTableContractsoffered_price: TWideStringField;
    FDMemTableContractsoffer_description: TWideStringField;
    FDMemTableContractscreate_date: TWideStringField;
    FDMemTableContractsimageindex: TWideStringField;
    ImageList1: TImageList;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    RectangleStatusBar: TRectangle;
    LabelStatusBar: TLabel;
    LabelNotFound: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HeaderFrame1ButtonBackClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ListViewMyContractsItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure ListViewMyContractsPullRefresh(Sender: TObject);
  private
    procedure MainHttpRequest;
    { Private declarations }
  public
    { Public declarations }
    procedure initForm;
  end;

var
  MyContractsForm: TMyContractsForm;

implementation

{$R *.fmx}

uses DataModule, AppDetails;
{ TMyContractsForm }

procedure TMyContractsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TMyContractsForm.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 137 then
    self.Close;
end;

procedure TMyContractsForm.HeaderFrame1ButtonBackClick(Sender: TObject);
begin
  self.Close;
end;

procedure TMyContractsForm.initForm;
begin
  self.show;
  self.LabelStatusBar.Text := DModule.statusBarTitle;
  self.RectangleStatusBar.Opacity := DModule.statusBarOpacity;
  HeaderFrame1.LabelAppName.Text := 'ჩემი შეთანხმებების სია';
  self.MainHttpRequest;
end;

procedure TMyContractsForm.MainHttpRequest;
begin
  RectanglePreloader.Visible := True;
  RESTRequestContracts.Params.Clear;
  if not DModule.sesskey.IsEmpty then
  begin
    RESTRequestContracts.AddParameter('user_id', DModule.id.ToString);
    RESTRequestContracts.AddParameter('sesskey', DModule.sesskey);
  end
  else
    self.Close;
  self.RESTRequestContracts.ExecuteAsync(
    procedure
    begin
      RectanglePreloader.Visible := False;
      self.ListViewMyContracts.PullRefreshWait := False;
      if RESTResponseContracts.Status.Success then
      begin
        if FDMemTableContracts.RecordCount = 0 then
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

procedure TMyContractsForm.ListViewMyContractsItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  v_app_id: integer;
begin
  v_app_id := self.FDMemTableContracts.FieldByName('app_id').AsInteger;
  with TAppDetailForm.Create(Application) do
  begin
    initForm(v_app_id, True);
  end;
end;

procedure TMyContractsForm.ListViewMyContractsPullRefresh(Sender: TObject);
begin
  self.ListViewMyContracts.PullRefreshWait := True;
  self.MainHttpRequest;
end;

end.
