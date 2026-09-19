CREATE DATABASE pharma_healthcare_analytics;
USE pharma_healthcare_analytics;

CREATE TABLE disease_burden (
    year INT,
    region VARCHAR(100),
    disease VARCHAR(150),
    dalys_millions DECIMAL(10,2),
    global_dalys_millions DECIMAL(10,2)
);

CREATE TABLE pharma_companies_financials (
    year INT,
    company_name VARCHAR(150),
    ticker VARCHAR(20),
    country_iso3 VARCHAR(10),
    segment VARCHAR(100),
    revenue_usd_bn DECIMAL(12,2),
    operating_margin_pct DECIMAL(8,2),
    operating_income_usd_bn DECIMAL(12,2),
    rd_spend_usd_bn DECIMAL(12,2),
    pipeline_size_est INT
);

CREATE TABLE drug_approvals (
    approval_id VARCHAR(30),
    approval_date DATE,
    year INT,
    drug_name VARCHAR(150),
    sponsor_company VARCHAR(150),
    drug_type VARCHAR(100),
    therapy_area VARCHAR(100),
    peak_sales_usd_bn_est DECIMAL(12,2),
    is_blockbuster BOOLEAN,
    is_mega_blockbuster BOOLEAN,
    description TEXT,
    is_real_headline BOOLEAN
);

CREATE TABLE biotech_funding (
    deal_id VARCHAR(30),
    date DATE,
    year INT,
    deal_type VARCHAR(100),
    acquirer_or_investors VARCHAR(150),
    target_or_company VARCHAR(150),
    value_usd_bn DECIMAL(12,3),
    description TEXT,
    is_megadeal BOOLEAN,
    is_real_headline BOOLEAN
);

CREATE TABLE clinical_trials (
    trial_id VARCHAR(50),
    completion_date DATE,
    year INT,
    sponsor VARCHAR(150),
    therapy_area VARCHAR(100),
    phase VARCHAR(50),
    enrollment_n INT,
    duration_months INT,
    outcome VARCHAR(200),
    is_success BOOLEAN,
    is_failure BOOLEAN,
    estimated_stock_impact_pct DECIMAL(8,2)
);

SELECT COUNT(*) AS total_records
FROM disease_burden;

SELECT
    COUNT(*) AS total_rows,
    SUM(year IS NULL) AS missing_year,
    SUM(region IS NULL) AS missing_region,
    SUM(disease IS NULL) AS missing_disease,
    SUM(dalys_millions IS NULL) AS missing_dalys
FROM disease_burden;

SELECT
    year,
    region,
    disease,
    COUNT(*) AS duplicate_count
FROM disease_burden
GROUP BY year, region, disease
HAVING COUNT(*) > 1;

SELECT
    year,
    SUM(dalys_millions) AS total_dalys
FROM disease_burden
GROUP BY year
ORDER BY year;

SELECT
    disease,
    SUM(dalys_millions) AS total_dalys
FROM disease_burden
GROUP BY disease
ORDER BY total_dalys DESC;

SELECT
    region,
    SUM(dalys_millions) AS total_dalys
FROM disease_burden
GROUP BY region
ORDER BY total_dalys DESC;

SELECT
    company_name,
    SUM(revenue_usd_bn) AS total_revenue
FROM pharma_companies_financials
GROUP BY company_name
ORDER BY total_revenue DESC;

SELECT
    company_name,
    SUM(rd_spend_usd_bn) AS total_rd_spend
FROM pharma_companies_financials
GROUP BY company_name
ORDER BY total_rd_spend DESC;

SELECT
    company_name,
    AVG(operating_margin_pct) AS avg_operating_margin
FROM pharma_companies_financials
GROUP BY company_name
ORDER BY avg_operating_margin DESC;

SELECT
    company_name,
    AVG(pipeline_size_est) AS avg_pipeline_size
FROM pharma_companies_financials
GROUP BY company_name
ORDER BY avg_pipeline_size DESC;

SELECT
    year,
    COUNT(*) AS total_approvals
FROM drug_approvals
GROUP BY year
ORDER BY year;

SELECT
    therapy_area,
    COUNT(*) AS total_approvals
FROM drug_approvals
GROUP BY therapy_area
ORDER BY total_approvals DESC;

SELECT
    COUNT(*) AS blockbuster_drugs
FROM drug_approvals
WHERE is_blockbuster = 1;

SELECT
    COUNT(*) AS mega_blockbuster_drugs
FROM drug_approvals
WHERE is_mega_blockbuster = 1;

SELECT
    phase,
    COUNT(*) AS total_trials
FROM clinical_trials
GROUP BY phase
ORDER BY total_trials DESC;

SELECT
    COUNT(*) AS total_trials,
    SUM(is_success) AS successful_trials,
    ROUND(
        SUM(is_success) * 100.0 / COUNT(*),
        2
    ) AS success_rate_pct
FROM clinical_trials;

SELECT
    therapy_area,
    COUNT(*) AS total_trials,
    SUM(is_success) AS successful_trials,
    ROUND(
        SUM(is_success) * 100.0 / COUNT(*),
        2
    ) AS success_rate_pct
FROM clinical_trials
GROUP BY therapy_area
ORDER BY success_rate_pct DESC;

SELECT
    year,
    SUM(value_usd_bn) AS total_funding
FROM biotech_funding
GROUP BY year
ORDER BY year;

SELECT
    deal_type,
    COUNT(*) AS total_deals,
    SUM(value_usd_bn) AS total_value
FROM biotech_funding
GROUP BY deal_type
ORDER BY total_value DESC;

SELECT
    COUNT(*) AS mega_deals,
    SUM(value_usd_bn) AS mega_deal_value
FROM biotech_funding
WHERE is_megadeal = 1;

CREATE DATABASE pharma_healthcare_analytics;

USE pharma_healthcare_analytics;

SELECT DATABASE();
SHOW TABLES;

SELECT COUNT(*) AS row_count
FROM disease_burden;

SELECT COUNT(*) AS row_count
FROM pharma_companies_financials;

SELECT COUNT(*) AS row_count
FROM drug_approvals;

SELECT COUNT(*) AS row_count
FROM biotech_funding;

SELECT COUNT(*) AS row_count
FROM clinical_trials;

SELECT *
FROM disease_burden
LIMIT 10;

SELECT *
FROM pharma_companies_financials
LIMIT 10;

SELECT *
FROM drug_approvals
LIMIT 10;

SELECT *
FROM biotech_funding
LIMIT 10;

SELECT *
FROM clinical_trials
LIMIT 10;

SELECT
    COUNT(*) AS total_rows,
    SUM(year IS NULL) AS missing_year,
    SUM(region IS NULL) AS missing_region,
    SUM(disease IS NULL) AS missing_disease,
    SUM(dalys_millions IS NULL) AS missing_dalys,
    SUM(global_dalys_millions IS NULL) AS missing_global_dalys
FROM disease_burden;

SELECT
    COUNT(*) AS total_rows,
    SUM(year IS NULL) AS missing_year,
    SUM(company_name IS NULL) AS missing_company,
    SUM(ticker IS NULL) AS missing_ticker,
    SUM(country_iso3 IS NULL) AS missing_country,
    SUM(segment IS NULL) AS missing_segment,
    SUM(revenue_usd_bn IS NULL) AS missing_revenue,
    SUM(operating_margin_pct IS NULL) AS missing_margin,
    SUM(operating_income_usd_bn IS NULL) AS missing_operating_income,
    SUM(rd_spend_usd_bn IS NULL) AS missing_rd,
    SUM(pipeline_size_est IS NULL) AS missing_pipeline
FROM pharma_companies_financials;

SELECT
    COUNT(*) AS total_rows,
    SUM(approval_id IS NULL) AS missing_approval_id,
    SUM(approval_date IS NULL) AS missing_date,
    SUM(year IS NULL) AS missing_year,
    SUM(drug_name IS NULL) AS missing_drug,
    SUM(sponsor_company IS NULL) AS missing_sponsor,
    SUM(drug_type IS NULL) AS missing_drug_type,
    SUM(therapy_area IS NULL) AS missing_therapy,
    SUM(peak_sales_usd_bn_est IS NULL) AS missing_peak_sales
FROM drug_approvals;

SELECT
    COUNT(*) AS total_rows,
    SUM(deal_id IS NULL) AS missing_deal_id,
    SUM(date IS NULL) AS missing_date,
    SUM(year IS NULL) AS missing_year,
    SUM(deal_type IS NULL) AS missing_deal_type,
    SUM(acquirer_or_investors IS NULL) AS missing_investor,
    SUM(target_or_company IS NULL) AS missing_target,
    SUM(value_usd_bn IS NULL) AS missing_value
FROM biotech_funding;

SELECT
    COUNT(*) AS total_rows,
    SUM(trial_id IS NULL) AS missing_trial_id,
    SUM(completion_date IS NULL) AS missing_date,
    SUM(year IS NULL) AS missing_year,
    SUM(sponsor IS NULL) AS missing_sponsor,
    SUM(therapy_area IS NULL) AS missing_therapy,
    SUM(phase IS NULL) AS missing_phase,
    SUM(enrollment_n IS NULL) AS missing_enrollment,
    SUM(duration_months IS NULL) AS missing_duration,
    SUM(outcome IS NULL) AS missing_outcome
FROM clinical_trials;

SELECT
    COUNT(*) AS total_rows,
    SUM(trial_id IS NULL) AS missing_trial_id,
    SUM(completion_date IS NULL) AS missing_date,
    SUM(year IS NULL) AS missing_year,
    SUM(sponsor IS NULL) AS missing_sponsor,
    SUM(therapy_area IS NULL) AS missing_therapy,
    SUM(phase IS NULL) AS missing_phase,
    SUM(enrollment_n IS NULL) AS missing_enrollment,
    SUM(duration_months IS NULL) AS missing_duration,
    SUM(outcome IS NULL) AS missing_outcome
FROM clinical_trials;

SELECT
    year,
    region,
    disease,
    COUNT(*) AS duplicate_count
FROM disease_burden
GROUP BY year, region, disease
HAVING COUNT(*) > 1;

SELECT
    approval_id,
    COUNT(*) AS duplicate_count
FROM drug_approvals
GROUP BY approval_id
HAVING COUNT(*) > 1;

SELECT
    trial_id,
    COUNT(*) AS duplicate_count
FROM clinical_trials
GROUP BY trial_id
HAVING COUNT(*) > 1;

SELECT
    deal_id,
    COUNT(*) AS duplicate_count
FROM biotech_funding
GROUP BY deal_id
HAVING COUNT(*) > 1;

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM disease_burden;

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM pharma_companies_financials;

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM drug_approvals;

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM biotech_funding;

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM clinical_trials;

SELECT
    year,
    ROUND(SUM(dalys_millions), 2) AS total_dalys_millions
FROM disease_burden
GROUP BY year
ORDER BY year;

SELECT
    disease,
    ROUND(SUM(dalys_millions), 2) AS total_dalys_millions
FROM disease_burden
GROUP BY disease
ORDER BY total_dalys_millions DESC;

SELECT
    region,
    ROUND(SUM(dalys_millions), 2) AS total_dalys_millions
FROM disease_burden
GROUP BY region
ORDER BY total_dalys_millions DESC;

SELECT
    company_name,
    ROUND(SUM(revenue_usd_bn), 2) AS total_revenue_usd_bn
FROM pharma_companies_financials
GROUP BY company_name
ORDER BY total_revenue_usd_bn DESC;

SELECT
    company_name,
    ROUND(SUM(rd_spend_usd_bn), 2) AS total_rd_spend_usd_bn
FROM pharma_companies_financials
GROUP BY company_name
ORDER BY total_rd_spend_usd_bn DESC;

SELECT
    therapy_area,
    COUNT(*) AS total_approvals
FROM drug_approvals
GROUP BY therapy_area
ORDER BY total_approvals DESC;

SELECT
    phase,
    COUNT(*) AS total_trials
FROM clinical_trials
GROUP BY phase
ORDER BY total_trials DESC;

SELECT
    COUNT(*) AS total_trials,
    SUM(is_success) AS successful_trials,
    ROUND(
        SUM(is_success) * 100.0 / COUNT(*),
        2
    ) AS success_rate_pct
FROM clinical_trials;

SELECT
    therapy_area,
    COUNT(*) AS total_trials,
    SUM(is_success) AS successful_trials,
    ROUND(
        SUM(is_success) * 100.0 / COUNT(*),
        2
    ) AS success_rate_pct
FROM clinical_trials
GROUP BY therapy_area
ORDER BY success_rate_pct DESC;

SELECT
    year,
    COUNT(*) AS total_deals,
    ROUND(SUM(value_usd_bn), 3) AS total_deal_value_usd_bn
FROM biotech_funding
GROUP BY year
ORDER BY year;

CREATE VIEW vw_pharma_company_performance AS
SELECT
    company_name,
    SUM(revenue_usd_bn) AS total_revenue,
    SUM(rd_spend_usd_bn) AS total_rd_spend,
    AVG(operating_margin_pct) AS avg_operating_margin,
    AVG(pipeline_size_est) AS avg_pipeline_size
FROM pharma_companies_financials
GROUP BY company_name;

SELECT *
FROM vw_pharma_company_performance
ORDER BY total_revenue DESC;

SELECT 'disease_burden' AS table_name, COUNT(*) AS row_count
FROM disease_burden

UNION ALL

SELECT 'pharma_companies_financials', COUNT(*)
FROM pharma_companies_financials

UNION ALL

SELECT 'drug_approvals', COUNT(*)
FROM drug_approvals

UNION ALL

SELECT 'biotech_funding', COUNT(*)
FROM biotech_funding

UNION ALL

SELECT 'clinical_trials', COUNT(*)
FROM clinical_trials;

SELECT
    COUNT(*) AS total_rows,
    SUM(year IS NULL) AS missing_year,
    SUM(region IS NULL) AS missing_region,
    SUM(disease IS NULL) AS missing_disease,
    SUM(dalys_millions IS NULL) AS missing_dalys
FROM disease_burden;

SELECT
    COUNT(*) AS total_rows,
    SUM(year IS NULL) AS missing_year,
    SUM(company_name IS NULL) AS missing_company,
    SUM(revenue_usd_bn IS NULL) AS missing_revenue,
    SUM(rd_spend_usd_bn IS NULL) AS missing_rd,
    SUM(pipeline_size_est IS NULL) AS missing_pipeline
FROM pharma_companies_financials;

SELECT
    COUNT(*) AS total_rows,
    SUM(approval_id IS NULL) AS missing_id,
    SUM(approval_date IS NULL) AS missing_date,
    SUM(drug_name IS NULL) AS missing_drug,
    SUM(sponsor_company IS NULL) AS missing_sponsor,
    SUM(therapy_area IS NULL) AS missing_therapy
FROM drug_approvals;

SELECT
    COUNT(*) AS total_rows,
    SUM(deal_id IS NULL) AS missing_id,
    SUM(date IS NULL) AS missing_date,
    SUM(deal_type IS NULL) AS missing_type,
    SUM(value_usd_bn IS NULL) AS missing_value
FROM biotech_funding;

SELECT
    COUNT(*) AS total_rows,
    SUM(trial_id IS NULL) AS missing_id,
    SUM(completion_date IS NULL) AS missing_date,
    SUM(sponsor IS NULL) AS missing_sponsor,
    SUM(therapy_area IS NULL) AS missing_therapy,
    SUM(phase IS NULL) AS missing_phase,
    SUM(outcome IS NULL) AS missing_outcome
FROM clinical_trials;

SELECT
    year,
    region,
    disease,
    COUNT(*) AS duplicate_count
FROM disease_burden
GROUP BY year, region, disease
HAVING COUNT(*) > 1;

SELECT
    approval_id,
    COUNT(*) AS duplicate_count
FROM drug_approvals
GROUP BY approval_id
HAVING COUNT(*) > 1;

SELECT
    trial_id,
    COUNT(*) AS duplicate_count
FROM clinical_trials
GROUP BY trial_id
HAVING COUNT(*) > 1;

SELECT
    deal_id,
    COUNT(*) AS duplicate_count
FROM biotech_funding
GROUP BY deal_id
HAVING COUNT(*) > 1;

SELECT *
FROM disease_burden
WHERE dalys_millions < 0
   OR global_dalys_millions < 0;
   
   SELECT *
FROM pharma_companies_financials
WHERE revenue_usd_bn < 0
   OR rd_spend_usd_bn < 0;
   
   SELECT *
FROM clinical_trials
WHERE enrollment_n < 0
   OR duration_months < 0;
   
   SELECT *
FROM biotech_funding
WHERE value_usd_bn < 0;

SELECT DISTINCT therapy_area
FROM drug_approvals
ORDER BY therapy_area;

SELECT DISTINCT therapy_area
FROM clinical_trials
ORDER BY therapy_area;

SELECT DISTINCT phase
FROM clinical_trials
ORDER BY phase;

SELECT DISTINCT deal_type
FROM biotech_funding
ORDER BY deal_type;

SELECT DISTINCT segment
FROM pharma_companies_financials
ORDER BY segment;

CREATE OR REPLACE VIEW vw_disease_burden_trend AS
SELECT
    year,
    SUM(dalys_millions) AS total_dalys_millions
FROM disease_burden
GROUP BY year;

SELECT *
FROM vw_disease_burden_trend
ORDER BY year;

CREATE OR REPLACE VIEW vw_disease_burden_by_disease AS
SELECT
    disease,
    SUM(dalys_millions) AS total_dalys_millions
FROM disease_burden
GROUP BY disease;

SELECT *
FROM vw_disease_burden_by_disease
ORDER BY total_dalys_millions DESC;

CREATE OR REPLACE VIEW vw_disease_burden_by_region AS
SELECT
    region,
    SUM(dalys_millions) AS total_dalys_millions
FROM disease_burden
GROUP BY region;

CREATE OR REPLACE VIEW vw_pharma_company_performance AS
SELECT
    company_name,
    SUM(revenue_usd_bn) AS total_revenue_usd_bn,
    SUM(rd_spend_usd_bn) AS total_rd_spend_usd_bn,
    AVG(operating_margin_pct) AS avg_operating_margin_pct,
    AVG(pipeline_size_est) AS avg_pipeline_size
FROM pharma_companies_financials
GROUP BY company_name;

SELECT *
FROM vw_pharma_company_performance
ORDER BY total_revenue_usd_bn DESC;

CREATE OR REPLACE VIEW vw_drug_approvals_by_therapy AS
SELECT
    therapy_area,
    COUNT(*) AS total_approvals,
    SUM(is_blockbuster) AS blockbuster_drugs,
    SUM(is_mega_blockbuster) AS mega_blockbuster_drugs
FROM drug_approvals
GROUP BY therapy_area;

SELECT *
FROM vw_drug_approvals_by_therapy
ORDER BY total_approvals DESC;

CREATE OR REPLACE VIEW vw_clinical_trial_performance AS
SELECT
    therapy_area,
    COUNT(*) AS total_trials,
    SUM(is_success) AS successful_trials,
    SUM(is_failure) AS failed_trials,
    ROUND(
        SUM(is_success) * 100.0 / COUNT(*),
        2
    ) AS success_rate_pct
FROM clinical_trials
GROUP BY therapy_area;

SELECT *
FROM vw_clinical_trial_performance
ORDER BY success_rate_pct DESC;

CREATE OR REPLACE VIEW vw_biotech_funding_trend AS
SELECT
    year,
    COUNT(*) AS total_deals,
    SUM(value_usd_bn) AS total_deal_value_usd_bn,
    SUM(is_megadeal) AS mega_deals
FROM biotech_funding
GROUP BY year;

SELECT *
FROM vw_biotech_funding_trend
ORDER BY year;

CREATE OR REPLACE VIEW vw_executive_metrics AS

SELECT
    'Disease Burden' AS metric_category,
    'Total DALYs' AS metric_name,
    ROUND(SUM(dalys_millions), 2) AS metric_value
FROM disease_burden

UNION ALL

SELECT
    'Pharma',
    'Total Revenue',
    ROUND(SUM(revenue_usd_bn), 2)
FROM pharma_companies_financials

UNION ALL

SELECT
    'Pharma',
    'Total R&D Spend',
    ROUND(SUM(rd_spend_usd_bn), 2)
FROM pharma_companies_financials

UNION ALL

SELECT
    'Drug Development',
    'Total Drug Approvals',
    COUNT(*)
FROM drug_approvals

UNION ALL

SELECT
    'Clinical Trials',
    'Total Trials',
    COUNT(*)
FROM clinical_trials

UNION ALL

SELECT
    'Biotech Investment',
    'Total Deal Value',
    ROUND(SUM(value_usd_bn), 2)
FROM biotech_funding;

SELECT *
FROM vw_executive_metrics;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';
