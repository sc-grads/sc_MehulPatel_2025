--Querying LINESTRINGs, POLYGONs and CIRCULARSTRINGs
begin tran
-- Start a transaction to group the operations together

create table tblGeom
(
  GXY geometry,
  -- Column to store spatial data of type geometry

  Description varchar(20),
  -- Column to store description text up to 20 characters

  IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1)
  -- Primary key column with identity starting from 5
)

insert into tblGeom
VALUES 
  (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First line'),
  -- Insert a LINESTRING geometry with points (1,1) to (5,5)

  (geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second line'),
  -- Insert another LINESTRING with multiple points forming a path

  (geometry::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'),
  -- Insert a MULTILINESTRING consisting of two LINESTRING segments

  (geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
  -- Insert a POLYGON defined by a closed ring of points

  (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')
  -- Insert a CIRCULARSTRING representing a circular arc (closed circle)

SELECT * FROM tblGeom
-- Retrieve all rows from the geometry table to display the inserted geometries

select 
  IDtblGeom, 
  GXY.STGeometryType() as MyType,
  -- Returns the type of geometry as text (e.g., LINESTRING, POLYGON)

  GXY.STStartPoint().ToString() as StartingPoint,
  -- Returns the first point of the geometry as a string

  GXY.STEndPoint().ToString() as EndingPoint,
  -- Returns the last point of the geometry as a string

  GXY.STPointN(1).ToString() as FirstPoint,
  -- Returns the first point (index 1) of the geometry as a string

  GXY.STPointN(2).ToString() as SecondPoint,
  -- Returns the second point (index 2) of the geometry as a string

  GXY.STPointN(1).STX as FirstPointX,
  -- Returns the X coordinate of the first point

  GXY.STPointN(1).STY as FirstPointY,
  -- Returns the Y coordinate of the first point

  GXY.STBoundary().ToString() as Boundary,
  -- Returns the boundary of the geometry (e.g., edges of polygon) as a geometry string

  GXY.STLength() as MyLength,
  -- Returns the length or perimeter of the geometry (for lines and polygons)

  GXY.STNumPoints() as NumberPoints
  -- Returns the total number of points in the geometry
from tblGeom

DECLARE @g as geometry
-- Declare a variable of type geometry to hold a spatial object

select @g = GXY from tblGeom where IDtblGeom = 5
-- Assign the geometry object with IDtblGeom = 5 (the circle) to variable @g

select 
  IDtblGeom, 
  GXY.STIntersection(@g).ToString() as Intersection,
  -- Calculate and return the spatial intersection of each geometry with @g as a string

  GXY.STDistance(@g) as DistanceFromFirstLine
  -- Calculate and return the shortest distance between each geometry and @g
from tblGeom

select 
  GXY.STUnion(@g), 
  Description
  -- Compute the spatial union of each geometry with @g and select the description

from tblGeom
where IDtblGeom = 8
-- Filter for geometry with IDtblGeom = 8 (note: this row might not exist in this data)

rollback tran
-- Undo all changes done in this transaction; no data is permanently saved
