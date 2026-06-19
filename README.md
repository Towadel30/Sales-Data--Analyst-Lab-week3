# Sales-Data--Analyst-Lab-week3
Advanced SQL database auditing and business intelligence analysis on the Chinook relational database using Microsoft SQL Server (T-SQL).

## 📌 Project Overview
This database engineering project handles a comprehensive audit of a global  Sales dataset** using Microsoft SQL Server (T-SQL) inside SQL Server Management Studio (SSMS). The objective is to evaluate transactional performance, extract product distribution velocities, isolate top enterprise customer anchors, and implement advanced window functions over time-series logs.

---

## 🛠️ Technical Skill Matrix
* **Database Management:** Microsoft SQL Server (SSMS) & T-SQL script writing
* **Data Auditing:** Table property discovery via system commands (`sp_columns`)
* **Aggregations & Sub-filtering:** Multi-column aggregations (`SUM`, `AVG`, `COUNT`) paired with categorical `GROUP BY` layers
* **Analytical Engineering:** Window function framing using partitioned variables (`RANK() OVER`, `ROW_NUMBER()`) and continuous row-by-row cumulative running totals
* **Data Formatting:** Dynamic typecasting (`CAST(ORDERDATE AS DATETIME)`) to ensure string variables evaluate accurately as chronological system timestamps

---

## 📊 Strategic Business Discoveries

### 🚗 1. Product Line Velocity & Powerhouses
* **The Revenue Engine:** `Classic Cars` functions as the absolute core asset powerhouse for the business, generating an outsized **$3,919,615.66** in gross cumulative revenue across **967 unique order lines**.
* **Comparative Performance:** Classic auto miniatures completely dominate more than half of the company's entire sales portfolio, outperforming the second-place category—`Vintage Cars` ($1,903,150.84)—by over **2x**.

### 👤 2. Enterprise Whales & Account Concentration
* **Contract Dominance:** A deep frequency analysis isolates **Euro Shopping Channel** as the ultimate enterprise whale client, contributing a massive **$912,294.
