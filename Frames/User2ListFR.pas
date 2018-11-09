unit User2ListFR;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Header, FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Layouts, FMX.LoadingIndicator,
  FMX.Controls.Presentation, FMX.Objects,
  Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, FMX.TMSRatingGrid,
  FMX.TMSBaseControl, FMX.TMSGauge,
  FMX.RatingBar, FMX.TMSRating, Data.Bind.GenData, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.DBScope, System.Threading, System.ImageList, FMX.ImgList;

type
  TUser2ListFrame = class(TFrame)
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    RectanglePreloader: TRectangle;
    LabelAppName: TLabel;
    RESTRequestAmzomvelebi: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTableAmzomvelebi: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    RectangleMain: TRectangle;
    Button1: TButton;
    ListViewAmzomveli: TListView;
    LinkListControlToField1: TLinkListControlToField;
    FDMemTableAmzomvelebiid: TWideStringField;
    FDMemTableAmzomvelebiuser_type_id: TWideStringField;
    FDMemTableAmzomvelebiuser_status_id: TWideStringField;
    FDMemTableAmzomvelebirating: TWideStringField;
    FDMemTableAmzomvelebifull_name: TWideStringField;
    FDMemTableAmzomvelebiphone: TWideStringField;
    FDMemTableAmzomvelebiemail: TWideStringField;
    FDMemTableAmzomvelebicreate_date: TWideStringField;
    FDMemTableAmzomvelebimodify_date: TWideStringField;
    FDMemTableAmzomvelebiregipaddr: TWideStringField;
    FDMemTableAmzomvelebicontact_info: TWideStringField;
    ImageListStars: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure ListViewAmzomveliUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initFrame;
  end;

implementation

{$R *.fmx}

uses DataModule, Main;
{ TUser2ReviewFrame }

procedure TUser2ListFrame.Button1Click(Sender: TObject);
begin
  self.Show;
  self.RectanglePreloader.Visible := True;
  self.RESTRequestAmzomvelebi.Params.Clear;
  with RESTRequestAmzomvelebi.Params.AddItem do
  begin
    name := 'sort';
    Value := 'stars';
  end;
  if DModule.sesskey.IsEmpty = False then
  begin
    RESTRequestAmzomvelebi.AddParameter('sesskey', DModule.sesskey);
    RESTRequestAmzomvelebi.AddParameter('user_id', DModule.id.ToString);
  end;
  self.RESTRequestAmzomvelebi.ExecuteAsync(
    procedure
    begin
      self.RectanglePreloader.Visible := False;
    end, True, True);
end;

procedure TUser2ListFrame.initFrame;
begin
  self.Show;
  self.RectanglePreloader.Visible := True;
  self.RESTRequestAmzomvelebi.Params.Clear;
  if DModule.sesskey.IsEmpty = False then
  begin
    RESTRequestAmzomvelebi.AddParameter('sesskey', DModule.sesskey);
    RESTRequestAmzomvelebi.AddParameter('user_id', DModule.id.ToString);
  end;
  self.RESTRequestAmzomvelebi.ExecuteAsync(
    procedure
    begin
      self.RectanglePreloader.Visible := False;
    end);
end;

procedure TUser2ListFrame.ListViewAmzomveliUpdateObjects(const Sender: TObject; const AItem: TListViewItem);
begin
  TListItemImage(AItem.Objects.FindDrawable('PhoneImage')).ImageIndex := 6;
  TListItemImage(AItem.Objects.FindDrawable('EmailImage')).ImageIndex := 7;
  TListItemImage(AItem.Objects.FindDrawable('ImageStars')).ImageIndex :=
    TListItemText(AItem.Objects.FindDrawable('TextStars')).Text.ToInteger;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG1')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG2')).ImageIndex := 8;
  TListItemImage(AItem.Objects.FindDrawable('ImageBottomBG3')).ImageIndex := 8;
end;

end.
