unit MyContractsFR;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Controls.Presentation, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.DBScope;

type
  TMyContractsFrame = class(TFrame)
    RESTRequestMyContracts: TRESTRequest;
    RESTResponseMyContracts: TRESTResponse;
    RESTResponseDSAMyContracts: TRESTResponseDataSetAdapter;
    FDMemTableMyContracts: TFDMemTable;
    ListView1: TListView;
    LabelNotFound: TLabel;
    FDMemTableMyContractsid: TWideStringField;
    FDMemTableMyContractsapp_offer_approved_id: TWideStringField;
    FDMemTableMyContractsoffer_user_id: TWideStringField;
    FDMemTableMyContractsapproved_user_id: TWideStringField;
    FDMemTableMyContractsapp_id: TWideStringField;
    FDMemTableMyContractsoffered_price: TWideStringField;
    FDMemTableMyContractsstart_date: TWideStringField;
    FDMemTableMyContractsoffer_description: TWideStringField;
    FDMemTableMyContractscreate_date: TWideStringField;
    FDMemTableMyContractsipaddr: TWideStringField;
    FDMemTableMyContractsapproved_text: TWideStringField;
    FDMemTableMyContractsapp_status_id: TWideStringField;
    FDMemTableMyContractsapp_owner: TWideStringField;
    FDMemTableMyContractsapp_winer: TWideStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initFrame;
  end;

implementation

{$R *.fmx}

uses DataModule, Main;
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

end.
