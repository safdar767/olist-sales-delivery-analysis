# E-commerce Sales and Delivery Analysis (Olist)

An end-to-end data analysis project: raw CSV files → cleaning in Python → analysis in PostgreSQL → interactive Power BI dashboard.

## Business Problem

Which product categories and states drive revenue, and how do late deliveries affect customer reviews?

## Dataset

[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle). Orders from 2016 to 2018. Only delivered orders are analysed (about 96,000 orders). Revenue is in Brazilian Real (R$) and is the sum of item prices, without freight.

The raw CSV files are not included in this repository. Download them from Kaggle (link above).

## Tools

- **Python** (pandas, SQLAlchemy, matplotlib, seaborn) for cleaning and feature creation
- **PostgreSQL** for analysis with SQL (CTEs, window functions, CASE, HAVING)
- **Power BI** (DAX measures, slicers) for the dashboard
- **Git and GitHub** for version control

## Process

1. Loaded 8 source tables and merged 7 of them into one fact table at order-item level (a separate payments table was loaded as well).
2. Kept only delivered orders and created delivery features: `delivery_days`, `delay_days`, `is_late` and `delay_bucket`.
3. Removed duplicate reviews (kept the latest per order) and translated product categories to English.
4. Loaded the data into PostgreSQL and answered 10 business questions with SQL (see the `sql/` folder).
5. Built a 2-page Power BI dashboard with DAX measures for revenue, orders, average review and late delivery %.

## Key Insights

1. **Late delivery hurts reviews.** Orders delivered on time or early have an average review of **4.21**. Orders delivered 8+ days late average only **1.70**.
2. **Some states have much worse delivery.** Overall late delivery is **6.77%**, but it is **21.4% in AL**, **17.4% in MA** and **15.2% in SE**.
3. **Revenue is concentrated.** The state of **SP alone brings 38.3%** of total revenue.
4. **Top 3 categories** (health_beauty, watches_gifts, bed_bath_table) together bring **25.9%** of revenue.
5. **Very low repeat purchase.** **97%** of customers bought only once.
6. Among categories with 500+ orders, the lowest rated are **office_furniture (3.52)**, **bed_bath_table (3.92)** and **furniture_decor (3.95)**.

## Recommendations

- Improve logistics and delivery partners in high-delay states (AL, MA, SE).
- Warn or review sellers with a high late delivery rate.
- Run repeat-purchase campaigns (follow-up offers, loyalty rewards) to improve retention.
- Reduce dependence on a single state by marketing in other regions.

## Dashboard

**Page 1: Sales Overview**

![Sales Overview](images/dashboard_overview.png)

**Page 2: Delivery and Reviews**

![Delivery and Reviews](images/dashboard_delivery.png)

## Project Structure

```
├── analysis.ipynb        # Data loading, cleaning, feature creation, load to PostgreSQL
├── sql/
│   └── (11 query files)  # one SQL file per query
├── powerbi/
│   └── olist_dashboard.pbix
├── images/               # Dashboard screenshots
└── README.md
```

## How to Run

1. Download the dataset from Kaggle and place the CSV files in the same folder as `analysis.ipynb`.
2. Install the libraries: `pip install pandas numpy sqlalchemy psycopg2-binary matplotlib seaborn`
3. Create a PostgreSQL database named `ecommerce_db`.
4. Run `analysis.ipynb` (it asks for your PostgreSQL password when connecting).
5. Run the queries from the `sql/` folder in pgAdmin.
6. Open `powerbi/olist_dashboard.pbix` in Power BI Desktop. If the data source path is different on your computer, update it in *Transform data → Data source settings*.

## Notes and Limitations

- The dataset has very little data for 2016 and the end of 2018, so the monthly trend uses Jan 2017 to Aug 2018.
- The "unknown" category contains products with a missing category name in the source data.

## Author

**Md Safdar Hossain**
GitHub: [safdar767](https://github.com/safdar767)
Portfolio: [md-safdar-hossain.netlify.app](https://md-safdar-hossain.netlify.app)
