--Defining LINESTRINGs, POLYGONs and CIRCULARSTRINGs
begin tran
-- Start a transaction to group all the following operations

create table tblGeom
(
  GXY geometry,
  -- Define a column 'GXY' to hold geometry spatial data

  Description varchar(20),
  -- Define a column 'Description' to store text descriptions (max 20 chars)

  IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1)
  -- Define a primary key column 'IDtblGeom' with auto-increment starting at 5
)

insert into tblGeom
VALUES
  (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First line'),
  -- Insert a LINESTRING geometry from Well-Known Text (WKT) with points (1,1) to (5,5)

  (geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second line'),
  -- Insert another LINESTRING with multiple points forming a path

  (geometry::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'),
  -- Insert a MULTILINESTRING, which is a collection of multiple LINESTRINGs

  (geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
  -- Insert a POLYGON defined by a closed ring of points (the last point repeats the first)

  (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')
  -- Insert a CIRCULARSTRING representing a circular arc made up of points forming a circle

SELECT * FROM tblGeom
-- Select and display all rows from the table to view inserted geometries

rollback tran
-- Undo all changes in the transaction, so no permanent changes are saved
