--Spatial aggregates
begin tran
-- Starts a transaction to group the following operations so they can be rolled back later.

create table tblGeom
(GXY geometry,
Description varchar(20),
IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(5,1))
-- Creates a table named tblGeom with three columns:
-- GXY of type geometry to store spatial data,
-- Description as a varchar(20) to describe the geometry,
-- IDtblGeom as an identity primary key starting from 5.

insert into tblGeom
VALUES (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First line'),
(geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second line'),
(geometry::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'),
(geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
(geometry::STGeomFromText('POLYGON ((5 2, 7 2, 7 4, 5 4, 5 2))', 0), 'Second Polygon'),
(geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle')
-- Inserts six rows into tblGeom with different types of geometries:
-- Linestrings, multiline string, polygons, and a circular string with descriptions.

select * from tblGeom
-- Selects all rows and columns from tblGeom to display inserted spatial data.

SELECT * FROM tblGeom
where GXY.Filter(geometry::Parse('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))')) = 1
-- Selects rows where the spatial filter returns 1 (true) for geometries that might intersect or are relevant 
-- to the polygon defined by the Filter method with a polygon shape.

UNION ALL
SELECT geometry::STGeomFromText('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))', 0), 'Filter', 0
-- Unions all with a new row consisting of the polygon used in the filter and description 'Filter' with ID 0.

declare @i as geometry
-- Declares a variable @i of type geometry to store a spatial aggregate.

select @i = geometry::UnionAggregate(GXY)
from tblGeom
-- Assigns to @i the union of all geometries in tblGeom, merging all into one combined shape.

Select @i as CombinedShapes
-- Selects the combined geometry stored in @i, showing the union of all geometries.

declare @j as geometry
-- Declares another geometry variable @j.

select @j = geometry::CollectionAggregate(GXY)
from tblGeom
-- Assigns to @j a collection aggregate of all geometries, combining them into a geometry collection (without merging).

select @j
-- Selects and displays the geometry collection stored in @j.

Select @i as CombinedShapes
-- Again selects the combined union shape stored in @i for display.

--union all
select geometry::EnvelopeAggregate(GXY) as Envelope from tblGeom
-- Selects the envelope aggregate (minimum bounding rectangle) of all geometries in tblGeom.
-- This line is commented out.

--union all
select geometry::ConvexHullAggregate(GXY) as Envelope from tblGeom
-- Selects the convex hull aggregate that encloses all geometries with the smallest convex polygon.

ROLLBACK TRAN
-- Rolls back the transaction, undoing all changes made during the transaction so nothing is permanently saved.
