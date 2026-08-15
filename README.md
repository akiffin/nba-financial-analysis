# NBA Team Financial & Performance Analysis (2025-26)

![CI](https://github.com/akiffin/nba-financial-analysis/actions/workflows/ci.yml/badge.svg)

Analyzed the relationship between player payroll, revenue, and on-court performance across all 30 NBA teams. Built a weighted efficiency model in Excel and supported the analysis with MySQL queries.

## Key Question
Do teams that spend more on payroll actually win more — and generate better financial returns?

## Methodology
Created a composite **Overall Efficiency Score** using four weighted metrics:

| Metric                        | Weight | Direction          |
|-------------------------------|--------|--------------------|
| Wins per $1M of Payroll       | 30%    | Higher is better   |
| Revenue-to-Payroll Ratio      | 30%    | Higher is better   |
| Revenue per Win               | 15%    | Higher is better   |
| Win Percentage                | 25%    | Higher is better   |

## Main Findings
- **Los Angeles Lakers** ranked #1 overall — strong across both financial and competitive metrics.
- **Oklahoma City Thunder** led the league in Win % (78%) and Wins per $1M of payroll.
- **Washington Wizards** ranked last despite one of the highest payrolls ($232M) — clear case of high spending with poor conversion into wins.
- Higher payroll showed only a weak relationship with winning (correlation ≈ 0.17).

## Tools Used
- **Excel**: Financial model, weighted ranking system, and dashboard
- **MySQL**: Data cleaning, indexing, correlation analysis, and operating margin calculations
- **Data Sources**: Spotrac (payroll), Forbes (revenue & valuation), ESPN (records)

## Project Structure
- `nba team financials.xlsx` — Full Excel model (Data, Calculations, Rankings, Dashboard)
- `queries.sql` — MySQL setup, cleaning, and analytics queries
- `data/nba_team_financials.csv` — Raw dataset used in the SQL pipeline
