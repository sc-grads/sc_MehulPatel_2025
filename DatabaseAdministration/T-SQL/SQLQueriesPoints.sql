begin tran
-- Start a transaction to group subsequent operations

create table tblGeom
(
  GXY geometry,
  -- Create a column GXY to store spatial geometry data

  Description varchar(20),
  -- Create a column Description to hold text descriptions (up to 20 chars)

  IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1)
  -- Create an identity primary key column that auto-increments starting at 1
)

insert into tblGeom
VALUES 
  (geometry::STGeomFromText('POINT (3 4)', 0), 'First point'),
  -- Insert a geometry point created from WKT text 'POINT (3 4)' with SRID 0

  (geometry::STGeomFromText('POINT (3 5)', 0), 'Second point'),
  -- Insert another point geometry 'POINT (3 5)'

  (geometry::Point(4, 6, 0), 'Third Point'),
  -- Insert a point using the Point(x,y,srid) method with coordinates (4,6)

  (geometry::STGeomFromText('MULTIPOINT ((1 2), (2 3), (3 4))', 0), 'Three Points')
  -- Insert a multipoint geometry consisting of three points

SELECT * from tblGeom
-- Retrieve all rows and their geometries to see the data

select 
  IDtblGeom, 
  GXY.STGeometryType() as MyType,
  -- Get the geometry type (e.g., Point, MultiPoint)

  GXY.STStartPoint().ToString() as StartingPoint,
  -- Get the start point of the geometry as text (usually relevant for lines)

  GXY.STEndPoint().ToString() as EndingPoint,
  -- Get the end point of the geometry as text

  GXY.STPointN(1).ToString() as FirstPoint,
  -- Get the first point of the geometry (1-based index)

  GXY.STPointN(2).ToString() as SecondPoint,
  -- Get the second point of the geometry if exists

  GXY.STPointN(1).STX as FirstPointX,
  -- Get the X coordinate of the first point

  GXY.STPointN(1).STY as FirstPointY,
  -- Get the Y coordinate of the first point

  GXY.STNumPoints() as NumberPoints
  -- Get the total number of points in the geometry

from tblGeom

DECLARE @g as geometry
-- Declare a variable @g of type geometry

DECLARE @h as geometry
-- Declare another variable @h of type geometry

select @g = GXY from tblGeom where IDtblGeom = 1
-- Assign the geometry from row with ID 1 to variable @g

select @h = GXY from tblGeom where IDtblGeom = 3
-- Assign the geometry from row with ID 3 to variable @h

select @g.STDistance(@h) as MyDistance
-- Calculate and return the shortest distance between geometries @g and @h

ROLLBACK TRAN
-- Roll back all changes made in this transaction (undo table creation and inserts)
