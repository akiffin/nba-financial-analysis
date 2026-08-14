# NBA Financial Analysis

A portfolio project exploring National Basketball Association team financial metrics, payroll efficiencies, and statistical correlations using MySQL.

## Project Structure

* `queries.sql`: Complete SQL pipeline including database initialization, data cleaning, type casting, indexing, and analytical queries.

## Data Pipeline & Methods

* **Ingestion**: Bulk loads structured team financial and performance datasets into MySQL.
* **Data Cleaning**: Strips currency symbols and percentage characters, converting text strings into numeric data types (`BIGINT`, `DECIMAL`, `UNSIGNED`).
* **Indexing**: Implements B-tree indexing on categorical columns to optimize query filtering.
* **Analytics**: Calculates operational margins and evaluates the statistical correlation between team payroll expenditures and win percentages.
