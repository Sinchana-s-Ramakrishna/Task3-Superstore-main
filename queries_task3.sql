-- View first 5 rows of dataset
SELECT * FROM superstore_dataset LIMIT 5;

-- Rename column if needed
ALTER TABLE superstore_dataset RENAME COLUMN "OldColumnName" TO "NewColumnName";

-- Create sales_summary table
CREATE TABLE sales_summary AS
SELECT 
    Category,
    SubCategory,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Avg_Discount
FROM superstore_dataset
GROUP BY Category, SubCategory;

-- View summary table
SELECT * FROM sales_summary;

-- Optional: Top 10 products by sales
SELECT ProductName, SUM(Sales) AS Total_Sales
FROM superstore_dataset
GROUP BY ProductName
ORDER BY Total_Sales DESC
LIMIT 10;
