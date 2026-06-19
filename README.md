# Sales-Data--Analyst-Lab-week3
Advanced SQL database auditing and business intelligence analysis on the Chinook relational database using Microsoft SQL Server (T-SQL).
# Week 3: Corporate Database Auditing, Trend Analysis, & Window Metrics

## 📌 Project Overview
This project contains production-grade SQL scripts executed against two distinct database schemas—the **Chinook Media Store** relational model and a global **B2B Sales E-Commerce dataset**—using Microsoft SQL Server (T-SQL). The analysis focuses on transforming transactional lines into structured business intelligence reporting layers while maintaining strict data types and server optimization.

---

## 🛠️ Technical Skill Matrix
* **Database Management:** Microsoft SQL Server (SSMS) & T-SQL
* **Aggregations & Filters:** `GROUP BY`, multi-conditional `WHERE`, post-aggregation `HAVING` filters
* **Relational Logic:** String concatenation, `INNER JOIN`, and dynamic baseline subqueries
* **Analytical Engineering:** Window framing (`RANK() OVER`, `ROW_NUMBER()`, and row-continuous continuous running totals)
* **Performance Optimization:** B-Tree indexing on active grouping columns verified via system catalog views (`sys.indexes`)

---

## 📊 Strategic Business Discoveries

### 🎵 1. Chinook Music Database
* **Geographic Revenue Engine:** Isolated the **United States** as the absolute commercial anchor, generating **$523.06 across 91 orders**. Smaller international footprints (Portugal, India, Chile) drop off immediately when passing a `$100` gross transaction threshold.
* **Customer Lifetime Value (LTV):** Utilized `PARTITION BY Country` window blocks to surface local VIP customers (e.g., **Luís Gonçalves** leading Brazil at `$39.62`) without data dilution from dominant markets.
* **Transaction Architecture:** High-value receipts peak in the $20–$26 variance window, identifying that top-tier customers acquire pre-arranged album bundles over isolated tracks.

### 🚗 2. Global B2B Sales Transactions Dataset
* **Core Product Class Anchor:** Identified **Classic Cars** as the major revenue powerhouse for the enterprise, driving an outsized **$3,919,615.66** in gross value across 967 separate order lines—more than doubling the performance of **Vintage Cars** ($1,903,150.84).
* **Enterprise Whales:** Isolated **Euro Shopping Channel** as the ultimate contract profile, locking in a massive lifetime value of **$912,294.11** across **259 distinct order line checkouts**.
* **Data Cleansing & Framing:** Implemented explicit date-type conversions (`CAST(ORDERDATE AS DATETIME)`) to parse chronological trend blocks and applied tie-breaking window framing parameters to avoid blocky increments in running totals.

---

## 📁 Repository Deliverables
* `/Scripts/`: Houses clean, modular `.sql` syntax blocks built using capital key command syntax rules.
* `/Documentation/`: Contains publication-ready executive summarized PDFs mapping what each query achieves, why it serves business operations, and exact on-screen observations.
