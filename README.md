# SupplyChain_Project
Inventory bloat and tied-up working capital are persistent challenges in supply chain management. This project aims to transform raw, unstructured transactional data into actionable business intelligence.
# Supply Chain Inventory Health & Capital Optimization
> An end-to-end data analytics project (PoC) utilizing Python, SQL, and Power BI to identify slow-moving inventory and optimize working capital.

## 📌 Project Overview
Inventory bloat is a critical issue in supply chain management that ties up valuable working capital. This project aims to transform raw, relational transactional data into actionable business intelligence. By defining a quantifiable metric (`Inventory Turnover Days > 365`), this analysis identifies the top capital-occupying slow-moving SKUs. 

The final output is an interactive Power BI dashboard acting as a Proof of Concept (PoC), enabling business users to monitor inventory health and make data-driven clearance decisions.

## 🛠️ Tech Stack & Tools
*   **Data Processing:** Python (Pandas, NumPy)
*   **Database / Querying:** SQL (SQLite)
*   **Data Visualization:** Power BI (DAX, Dashboard Design)
*   **Documentation:** Markdown, PDF

## 📊 Dashboard Preview
![Supply Chain Dashboard](dashboard.png)
*(The dashboard provides a Top-Down view: KPI cards on the right, a risk matrix scatter plot in the center, and the Top 20 slow-moving offenders on the left.)*

## 🚀 Methodology
1.  **Data Cleaning & Engineering (Python):** Merged multi-table fact and dimension data. Handled missing values, removed negative stock anomalies, and calculated core metrics including Total Stock Value and Turnover Days.
2.  **Business Querying (SQL):** Imported the cleaned dataset into a relational database. Executed complex `JOIN` and `GROUP BY` queries to isolate slow-moving inventory and aggregate metrics by category.
3.  **Visualization (Power BI):** Designed a dynamic dashboard with cross-filtering capabilities to track capital occupation and identify over-purchasing anomalies via a Sales vs. Stock scatter plot.

## 💡 Key Business Insights
*   **Capital Concentration:** A Pareto principle (80/20 rule) is evident. The Top 20 slow-moving SKUs (predominantly high-value appliances) account for a disproportionately large share of tied-up capital.
*   **Over-purchasing Anomalies:** The scatter plot reveals outliers in the top-right quadrant (high sales, extremely high stock), indicating over-procurement or inaccurate safety stock settings.
*   **Long-tail Inventory:** Over 5,000 SKUs have a turnover period exceeding one year, creating significant cumulative warehouse holding costs.

## 📁 Repository Structure
*   `data_pipeline.py`: Python script for data cleaning, feature engineering, and metric calculation.
*   `queries.sql`: SQL queries used for business logic extraction (Top N offenders, category aggregations).
*   `dashboard.png`: High-resolution screenshot of the Power BI dashboard.
*   `analysis_report.pdf`: Detailed English business report with methodology and strategic recommendations.
## 🎯 Next Steps (AI Product Roadmap)
Current dashboards are *descriptive* (what happened). The next logical step is to build a *predictive* model. By utilizing the cleaned features from this project, an AI model (e.g., Time-Series Forecasting) could predict sales velocity, moving the system from a reactive reporting tool to a **proactive smart replenishment AI Agent**.
