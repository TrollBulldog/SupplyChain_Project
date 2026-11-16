/* =========================================================
   Project: Supply Chain Inventory Health & Capital Optimization
   File: sql_queries.sql
   Database: SQLite
   Description: Core queries used to extract business insights 
                for the Power BI Dashboard.
   ========================================================= */

-- ---------------------------------------------------------
-- Query 1: Identify Top 20 Slow-Moving SKUs by Capital Occupation
-- Purpose: Used for the Bar Chart in the dashboard to highlight 
--          items with Turnover Days > 365 that tie up the most capital.
-- ---------------------------------------------------------
SELECT 
    product_name,
    category_id,
    ROUND(total_stock_value, 2) AS capital_tied_up,
    total_stock,
    total_sold_qty,
    ROUND(turnover_days, 0) AS turnover_days
FROM 
    turnover_analysis
WHERE 
    turnover_days > 365
ORDER BY 
    total_stock_value DESC
LIMIT 20;


-- ---------------------------------------------------------
-- Query 2: Aggregate Inventory Health Metrics by Product Category
-- Purpose: Analyze average turnover days and total capital per category.
--          Helps business users prioritize which category to optimize first.
-- ---------------------------------------------------------
SELECT 
    category_id,
    COUNT(product_id) AS total_skus,
    SUM(total_stock_value) AS total_category_capital,
    ROUND(AVG(turnover_days), 0) AS avg_turnover_days
FROM 
    turnover_analysis
WHERE 
    turnover_days IS NOT NULL
GROUP BY 
    category_id
ORDER BY 
    avg_turnover_days DESC;


-- ---------------------------------------------------------
-- Query 3: Identify Anomalies (High Sales but High Inventory)
-- Purpose: Find outliers in the top-right quadrant of the scatter plot 
--          (over-purchasing or inaccurate safety stock settings).
-- ---------------------------------------------------------
SELECT 
    product_name,
    total_sold_qty,
    total_stock,
    ROUND(turnover_days, 0) AS turnover_days
FROM 
    turnover_analysis
WHERE 
    total_sold_qty > (SELECT AVG(total_sold_qty) FROM turnover_analysis)
    AND total_stock > (SELECT AVG(total_stock) FROM turnover_analysis)
ORDER BY 
    total_stock DESC
LIMIT 10;


-- ---------------------------------------------------------
-- Query 4: Calculate the overall percentage of Capital Tied-up 
--          in Slow-Moving Inventory
-- Purpose: For the executive summary KPI. "X% of our money is stuck."
-- ---------------------------------------------------------
SELECT 
    ROUND(SUM(CASE WHEN turnover_days > 365 THEN total_stock_value ELSE 0 END), 2) AS slow_moving_capital,
    ROUND(SUM(total_stock_value), 2) AS total_capital,
    ROUND((SUM(CASE WHEN turnover_days > 365 THEN total_stock_value ELSE 0 END) / SUM(total_stock_value)) * 100, 2) AS slow_moving_percentage
FROM 
    turnover_analysis;