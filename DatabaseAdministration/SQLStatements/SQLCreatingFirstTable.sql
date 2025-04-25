CREATE TABLE [AdventureWorks2022].[sales].[storenew](
    store_id INT NOT NULL PRIMARY KEY,
    sales INT
)

CREATE TABLE [AdventureWorks2022].[sales].[visits](
    visit_id INT PRIMARY KEY IDENTITY (1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    visited_at DATETIME,
    phone VARCHAR(20),
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES sales.storeNEW(store_id)
) 

SELECT * FROM [AdventureWorks2022].[sales].[visits] 

