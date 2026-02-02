# Marketplace Performance & Risk Analytics

## Overview
This project demonstrates an end-to-end marketplace analytics workflow, transforming raw
eCommerce transaction data into executive-ready insights across revenue performance, SKU
concentration, pricing risk, and operational health.

The goal is to simulate how a Marketplace / Business Intelligence Analyst supports leadership
decisions using SQL, Python, Power BI, and Excel — moving from raw data to actionable insights.

---

## Business Questions Addressed
- Which SKUs and product categories drive the majority of marketplace revenue?
- How concentrated is revenue across the catalog?
- Are there early indicators of pricing pressure or demand slowdown?
- Which operational metrics signal potential fulfillment or SLA risks?
- How can leadership monitor marketplace performance through executive dashboards?

---

## Data & Tools

### Data Source
- Public eCommerce transaction dataset (order-level retail data)

### Tech Stack
- **Python**: Data cleaning, feature engineering, business insights
- **SQL (SQLite)**: KPI aggregation, marketplace performance analysis
- **Power BI**: Executive dashboards and visual analytics
- **Excel**: KPI exports for stakeholder reporting

---

## Project Architecture
marketplace-analytics-dashboard/
├── data/
│ ├── raw/
│ │ └── Online Retail.xlsx
│ └── processed/
│ ├── online_retail_cleaned.csv
│ └── exports/
│ ├── kpi_marketplace_performance.xlsx
│ ├── sku_deep_dive.xlsx
│ └── operational_risk_metrics.xlsx
├── notebooks/
│ ├── 01_data_cleaning_and_features.ipynb
│ ├── 02_load_to_sqlite.ipynb
│ ├── 03_run_kpis_export_csv.ipynb
│ └── 04_business_insights.ipynb
├── sql/
│ ├── 01_create_tables.sql
│ ├── 02_kpi_marketplace_performance.sql
│ ├── 03_sku_brand_channel_deep_dive.sql
│ ├── 04_operational_risk_metrics.sql
│ ├── 05_pricing_margin_analysis.sql
│ └── 06_executive_alerts.sql
├── dashboards/
│ └── screenshots/
├── README.md
└── requirements.txt

---

## Analytics Workflow

### 1. Data Cleaning & Feature Engineering (Python)
- Removed cancelled and invalid transactions
- Standardized date fields and created time-based features
- Calculated revenue at order and SKU levels
- Exported clean datasets for reproducible analysis

### 2. Marketplace KPI Aggregation (SQL)
- Revenue, order volume, and SKU-level KPIs
- SKU, brand, and channel performance deep dives
- Pricing and margin proxy analysis
- Operational risk and demand volatility metrics

### 3. Business Insights (Python)
- Revenue concentration analysis (Pareto-style)
- Seasonality and demand trend analysis
- Identification of high-revenue SKUs with declining volume

### 4. Executive Reporting (Power BI & Excel)
- Executive dashboards for marketplace monitoring
- Clean KPI exports for leadership and cross-functional teams

---

## Key Insights
- Marketplace revenue is highly concentrated, with a small subset of SKUs driving a
  disproportionate share of total revenue.
- Clear seasonality patterns are observed, with demand peaking during specific periods.
- Several high-revenue SKUs show declining unit volumes, indicating potential pricing or
  demand-side risk.
- Operational metrics reveal demand volatility that could impact fulfillment SLAs if
  not proactively managed.

---

## Executive Dashboards
Power BI dashboards include:
- **Executive Overview**: Revenue, orders, and demand trends
- **SKU Performance**: Top and underperforming SKUs
- **Operational Risk**: Volatility and early risk indicators

Dashboard screenshots are available in:

---

## Interview Talking Point
> “I built an end-to-end marketplace analytics project using real eCommerce transaction data.
> I cleaned and engineered features in Python, aggregated KPIs using SQL, and built executive
> Power BI dashboards to track revenue performance, SKU concentration, pricing risk, and
> operational health. The project focuses on turning raw data into decision-ready insights
> for marketplace leadership.”

---

## Future Enhancements
- Automated data refresh and scheduling
- Demand and revenue forecasting models
- Expanded pricing analysis with cost data
- Alerting framework for operational risk thresholds

---

## Author
**Subham Mangi**  
Marketplace Analytics | Business Intelligence | Data Analytics
