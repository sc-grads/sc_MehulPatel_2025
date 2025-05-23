begin tran
-- Start a new transaction

create table tblGeog
(
  GXY geography,
  -- Column to store spatial data using the geography data type (ellipsoidal, lat/long coordinates)

  Description varchar(30),
  -- Description column for naming the geography features

  IDtblGeog int CONSTRAINT PK_tblGeog PRIMARY KEY IDENTITY(1,1)
  -- Primary key with auto-increment starting at 1
)

insert into tblGeog
VALUES 
  (geography::STGeomFromText('POINT (-73.993492 40.750525)', 4326), 'Madison Square Gardens, NY'),
  -- Insert a geography point representing Madison Square Gardens (longitude, latitude) with SRID 4326 (WGS 84)

  (geography::STGeomFromText('POINT (-0.177452 51.500905)', 4326), 'Royal Albert Hall, London'),
  -- Insert another point for Royal Albert Hall in London

  (geography::STGeomFromText('LINESTRING (-73.993492 40.750525, -0.177452 51.500905)', 4326), 'Connection')
  -- Insert a LINESTRING geography connecting the two points above

select * from tblGeog
-- Select all rows from tblGeog to display inserted geography data

DECLARE @g as geography
-- Declare a variable @g of type geography to hold a geography instance

select @g = GXY from tblGeog where IDtblGeog = 1
-- Assign to @g the geography value from the row with IDtblGeog = 1 (Madison Square Gardens point)

select 
  IDtblGeog, 
  GXY.STGeometryType() as MyType,
  -- Get the type of geometry (e.g., Point, LineString)

  GXY.STStartPoint().ToString() as StartingPoint,
  -- Get the starting point of the geography object as text (for points, same as the point)

  GXY.STEndPoint().ToString() as EndingPoint,
  -- Get the end point of the geography object as text (same as start for points)

  GXY.STPointN(1).ToString() as FirstPoint,
  -- Get the first point of the geography object as text

  GXY.STPointN(2).ToString() as SecondPoint,
  -- Get the second point of the geography object (null for single points)

  GXY.STLength() as MyLength,
  -- Calculate the length of the geography object (distance in meters for lines)

  GXY.STIntersection(@g).ToString() as Intersection,
  -- Calculate the intersection of each geography object with @g as a geography instance

  GXY.STNumPoints() as NumberPoints,
  -- Return the number of points in the geography object

  GXY.STDistance(@g) as DistanceFromFirstLine
  -- Calculate the shortest distance between each geography object and @g

from tblGeog
-- Perform the above selects on all rows in tblGeog

DECLARE @h as geography
-- Declare another geography variable @h

select @g = GXY from tblGeog where IDtblGeog = 1
-- Assign again @g with geography for IDtblGeog=1 (Madison Square Gardens point)

select @h = GXY from tblGeog where IDtblGeog = 2
-- Assign @h with geography for IDtblGeog=2 (Royal Albert Hall point)

select @g.STDistance(@h) as MyDistance
-- Calculate the distance in meters between @g and @h (Madison Square Gardens to Royal Albert Hall)

select GXY.STUnion(@g)
from tblGeog
where IDtblGeog = 2
-- Calculate the spatial union of the geography object at IDtblGeog=2 with @g (combines shapes)

ROLLBACK TRAN
-- Roll back all changes made during this transaction (undo inserts, table creation)

select * from sys.spatial_reference_systems
-- Query system view to list all spatial reference systems available in SQL Server
