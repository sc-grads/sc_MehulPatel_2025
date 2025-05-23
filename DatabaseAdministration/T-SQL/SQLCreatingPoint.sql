BEGIN TRAN
-- Start a transaction so changes can be rolled back later for testing or safety

CREATE TABLE tblGeom
(
  GXY geometry,
  -- Create a column GXY to store spatial data of type geometry

  Description varchar(30),
  -- Create a column Description to store a short text description

  IDtblGeom int CONSTRAINT PK_tblGeom PRIMARY KEY IDENTITY(1,1)
  -- Create an identity primary key column IDtblGeom that auto-increments starting at 1
)
INSERT INTO tblGeom
VALUES
  (geometry::STGeomFromText('POINT (3 4)', 0), 'First point'),
  -- Insert a point geometry created from text 'POINT (3 4)' with SRID 0 and description 'First point'

  (geometry::STGeomFromText('POINT (3 5)', 0), 'Second point'),
  -- Insert another point geometry 'POINT (3 5)' with description 'Second point'

  (geometry::Point(4, 6, 0), 'Third Point'),
  -- Insert a point geometry using the Point() method directly with coordinates (4,6) and SRID 0

  (geometry::STGeomFromText('MULTIPOINT ((1 2), (2 3), (3 4))', 0), 'Three Points')
  -- Insert a multipoint geometry consisting of three points and description 'Three Points'

Select * from tblGeom
-- Retrieve all rows from the tblGeom table to view inserted geometry data

ROLLBACK TRAN
-- Roll back the transaction, undoing all inserts and table creation (no permanent changes)
