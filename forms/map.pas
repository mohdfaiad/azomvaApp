unit map;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Maps,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, System.ImageList,
  FMX.ImgList
{$IFDEF ANDROID}
    , FMX.Helpers.Android,
  Androidapi.Helpers,
  Androidapi.JNI.Widget
{$ENDIF ANDROID};

type
  TmapViewForm = class(TForm)
    MapViewAddress: TMapView;
    ButtonSetCoords: TButton;
    Line1: TLine;
    Line2: TLine;
    Circle1: TCircle;
    StyleBookMap: TStyleBook;
    ImageListMap: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonSetCoordsClick(Sender: TObject);
    procedure MapViewAddressMapClick(const Position: TMapCoordinate);
  private
    { Private declarations }
  public
    { Public declarations }
    Descr: TMapMarkerDescriptor;
    marker: TMapMarker;
    MyPosition: TMapCoordinate;
    procedure initForm;
  end;

var
  mapViewForm: TmapViewForm;

implementation

{$R *.fmx}

uses Main, DataModule, Header, HelperUnit;
{ TmapViewForm }

procedure TmapViewForm.ButtonSetCoordsClick(Sender: TObject);
begin
  ShowMessage(MapViewAddress.Location.Longitude.ToString + ',' + MapViewAddress.Location.Latitude.ToString);
  // ShowMessage(MapView1.BoundsRect.Longitude.ToString + ',' + MapView1.BoundsRect.Location.Latitude.ToString);
  self.Close;
end;

procedure TmapViewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TmapViewForm.initForm;
var
  helper: THelperUnit;
begin
  self.show;
{$IFDEF ANDROID}
  if TOSVersion.Major >= 6 then // Check(6)
  begin
    helper := THelperUnit.Create;
    try
      helper.AndroidCheckAndRequestLocationPermission;
    finally
      helper.Free;
    end;
  end;
{$ENDIF}
  MapViewAddress.show;
end;

procedure TmapViewForm.MapViewAddressMapClick(const Position: TMapCoordinate);
begin
  DModule.MyPosition := Position;
  Descr := TMapMarkerDescriptor.Create(Position, 'არჩეული ადგილი');
  Descr.Icon := MainForm.ImageList1.Bitmap(TSizeF.Create(256, 256), 5);
  Descr.Draggable := True;
  MapViewAddress.AddMarker(Descr);
end;

end.
