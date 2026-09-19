# 💊 Pharma Healthcare Analytics | SQL & Power BI

## 📊 Project Overview

**Pharma Pulse** is an end-to-end healthcare and pharmaceutical analytics project developed using **MySQL and Microsoft Power BI**.

The project analyzes large-scale healthcare and pharmaceutical datasets to identify trends and generate actionable insights across:

- Disease burden and DALYs
- Pharmaceutical company financial performance
- Drug approvals and innovation
- Clinical trial performance
- Biotech funding and investment activity

The analysis combines **SQL-based data exploration and transformation** with an interactive **Power BI dashboard** to provide a comprehensive view of the pharmaceutical and healthcare landscape.

---

## 🎯 Project Objectives

The primary objectives of this project are to:

- Analyze disease burden across regions and years
- Evaluate pharmaceutical company revenue and R&D performance
- Track drug approval trends across therapy areas
- Analyze blockbuster and mega-blockbuster drugs
- Evaluate clinical trial success and failure patterns
- Analyze biotech funding and investment trends
- Develop meaningful KPIs for healthcare and pharmaceutical analytics
- Transform raw data into interactive business intelligence dashboards

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **MySQL** | Data querying, transformation and analysis |
| **Power BI** | Interactive dashboards and data visualization |
| **SQL** | Data extraction, aggregation and analytical queries |
| **DAX** | KPI calculations and analytical measures |
| **Power Query** | Data preparation and transformation |
| **GitHub** | Project documentation and version control |

---

## 🗂️ Dataset Overview

The project consists of five major datasets:

### 1. Disease Burden
Contains information related to:

- Year
- Region
- Disease
- DALYs
- Global DALYs

### 2. Pharma Companies Financials
Contains pharmaceutical company performance data including:

- Company
- Country
- Segment
- Revenue
- Operating Margin
- Operating Income
- R&D Spending
- Pipeline Size

### 3. Drug Approvals
Contains information about approved drugs including:

- Approval Date
- Drug Name
- Sponsor Company
- Drug Type
- Therapy Area
- Estimated Peak Sales
- Blockbuster Status
- Mega-Blockbuster Status

### 4. Biotech Funding
Contains investment and acquisition information including:

- Deal Date
- Deal Type
- Investors/Acquirers
- Target Company
- Deal Value
- Mega-Deal Status

### 5. Clinical Trials
Contains clinical trial information including:

- Trial ID
- Completion Date
- Sponsor
- Therapy Area
- Trial Phase
- Enrollment
- Duration
- Outcome
- Success/Failure Status
- Estimated Stock Impact

---

## 🧮 Key KPIs

The Power BI dashboard includes several analytical KPIs.

### Healthcare Indicators

- Total DALYs
- Average Global DALYs
- Total Regions
- Total Diseases

### Pharmaceutical Performance

- Total Revenue
- Total R&D Spend
- Total Operating Income
- Average Operating Margin
- Total Pipeline

### Drug Innovation

- Total Drug Approvals
- Blockbuster Drugs
- Mega-Blockbuster Drugs
- Average Estimated Peak Sales

### Clinical Trials

- Total Clinical Trials
- Successful Trials
- Failed Trials
- Trial Success Rate
- Average Trial Enrollment
- Average Trial Duration

### Biotech Funding

- Total Funding Value
- Total Deals
- Average Deal Value
- Mega Deals

---

# 📈 Power BI Dashboard

The project contains a multi-page interactive Power BI dashboard titled:

## **PHARMA PULSE**
### *A 360° View of Healthcare, Innovation & Industry Performance*

### Dashboard Pages

#### 1. Executive Overview
Provides a high-level overview of the pharmaceutical and healthcare industry through:

- Executive KPIs
- Disease burden trends
- Drug approval trends
- Clinical trial performance
- Biotech investment trends

#### 2. Disease Intelligence
Analyzes:

- Disease burden over time
- Disease-wise DALYs
- Regional disease burden
- Disease and region comparisons
- Regional trends

#### 3. Drug Innovation
Analyzes:

- Drug approval trends
- Therapy-area distribution
- Blockbuster drugs
- Mega-blockbuster drugs
- Estimated peak sales

#### 4. Clinical Trial Intelligence
Analyzes:

- Clinical trials by therapy area
- Success rates
- Trial phases
- Successful vs failed trials
- Enrollment and trial duration

#### 5. Pharma Performance
Analyzes:

- Company revenue
- R&D spending
- Operating income
- Operating margins
- Pipeline size
- Revenue vs R&D investment

#### 6. Biotech Funding
Analyzes:

- Funding trends
- Deal activity
- Deal types
- Funding value
- Mega deals

---

## 🔍 SQL Analysis

MySQL was used for data exploration and analytical processing.

Key SQL techniques used include:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `CASE WHEN`
- Aggregate functions
- Subqueries
- Common analytical queries
- Views
- Conditional aggregation
- Trend analysis
- KPI calculations

SQL views were also created to simplify analytical reporting and Power BI integration.

---

## 📊 Power BI & DAX

Power BI was used to convert the processed datasets into an interactive business intelligence solution.

### Visualization techniques

- KPI Cards
- Line Charts
- Bar Charts
- Column Charts
- Donut Charts
- Scatter Plots
- Matrix Tables
- Slicers
- Interactive Filters

### DAX

DAX measures were created for metrics such as:
```DAX
Total Drug Approvals =
COUNTROWS(drug_approvals)

```DAX
Total Drug Approvals =
COUNTROWS(drug_approvals)
