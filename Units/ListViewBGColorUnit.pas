unit ListViewBGColorUnit;

interface

uses FMX.Objects, FMX.Graphics, FMX.ListView.Types, Generics.Collections,
  System.UITypes, FMX.ImgList;

type
  TListViewBGColorUnit = class(TListItemObject)
  private
    FColorIndex: integer;
    procedure setColorIndex(colorIndex: integer);

  public
    constructor Create(const AOwner: TListItem); override;
    destructor Destroy; override;
    procedure Render(const Canvas: TCanvas; const DrawItemIndex: integer;
      const DrawStates: TListItemDrawStates;
      const Resources: TListItemStyleResources;
      const Params: TListItemDrawable.TParams;
      const SubPassNo: integer = 0); override;
    property colorIndex: integer read FColorIndex write setColorIndex;
  end;

implementation

{ TListViewBGColorUnit }

constructor TListViewBGColorUnit.Create(const AOwner: TListItem);
begin
  inherited;

end;

destructor TListViewBGColorUnit.Destroy;
begin
  inherited;
end;

procedure TListViewBGColorUnit.Render(const Canvas: TCanvas;
  const DrawItemIndex: integer; const DrawStates: TListItemDrawStates;
  const Resources: TListItemStyleResources;
  const Params: TListItemDrawable.TParams; const SubPassNo: integer);
begin
  inherited;
  case self.FColorIndex of
    1:
      begin
        Canvas.Fill.color := Resources.HeaderTextColor;
      end;
    2:
      begin
        Canvas.Fill.color := Resources.PullRefreshStrokeColor;
      end;
  end;

  // Canvas.Clear();
end;

procedure TListViewBGColorUnit.setColorIndex(colorIndex: integer);
begin
  self.FColorIndex := colorIndex;
end;

end.
