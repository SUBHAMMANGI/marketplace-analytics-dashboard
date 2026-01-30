# Marketplace Performance Dashboard (SQL, Python, Power BI, Excel)

## Overview
End-to-end marketplace analytics project to monitor sales performance, conversion/traffic proxies, pricing effectiveness, and operational risk signals. The pipeline cleans raw transactions, loads curated data into SQLite, generates KPI extracts via SQL, and powers Power BI dashboards for executive reporting.

## Resume-Aligned Scope (Exact)
### Marketplace Performance Dashboard | SQL, Power BI, Excel
- Developed dashboards used by business teams to monitor sales, conversion, and traffic metrics at SKU, brand, and channel levels, enabling comparative analysis across product categories.
- Delivered actionable insights on pricing effectiveness and performance gaps to support merchandising and promotional decisions across channels.

### Competitive & Category Analysis | Python, Excel, Tableau
- Conducted competitive benchmarking using pricing, ratings, and assortment data to evaluate marketplace positioning and identify growth opportunities.
- Created visual reports highlighting category trends and performance gaps to inform strategic planning.

### Operational Metrics & Risk Analysis | SQL, Power BI
- Tracked operational KPIs including order completion rates, delivery performance, and customer engagement metrics to identify potential SLA risks.
- Supported root-cause analysis for performance disruptions by correlating operational data with marketplace trends.

## Data
See `data/README.md` for dataset instructions and reproducibility steps.

## How to Run (Reproducible)
1. Place raw dataset at: `data/raw/Online Retail.xlsx`
2. Run notebooks in order:
   - `notebooks/01_data_cleaning_and_features.ipynb`
   - `notebooks/02_load_to_sqlite.ipynb`
   - `notebooks/03_run_kpis_export_csv.ipynb`
   - `notebooks/04_business_insights.ipynb`
3. Open Power BI file (or rebuild visuals using exports in `data/processed/exports/`)

## Dashboards
Screenshots: `dashboards/screenshots/`

## Key Insights
- Revenue concentration exists with a small subset of SKUs driving a disproportionate share of sales.
- Demand shows seasonality patterns that can inform inventory and promotional timing.
- Pricing signals highlight SKUs with high revenue but weaker unit velocity, indicating possible pricing or assortment risks.
