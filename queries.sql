CREATE DATABASE IF NOT EXISTS nba_analysis;
USE nba_analysis;

DROP TABLE IF EXISTS nba_team_financials;
CREATE TABLE nba_team_financials (
    team VARCHAR(50),
    payroll VARCHAR(50),
    revenue VARCHAR(50),
    valuation VARCHAR(50),
    wins INT,
    losses INT,
    win_pct VARCHAR(50),
    playoff_result VARCHAR(50)
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'data/nba_team_financials.csv'
INTO TABLE nba_team_financials
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DELETE FROM nba_team_financials WHERE team = 'Team';

ALTER TABLE nba_team_financials
ADD COLUMN payroll_num BIGINT,
ADD COLUMN revenue_num BIGINT,
ADD COLUMN valuation_num DECIMAL(15,2),
ADD COLUMN win_pct_num DECIMAL(5,2);

UPDATE nba_team_financials
SET payroll_num = CAST(REPLACE(REPLACE(payroll, '$', ''), ',', '') AS UNSIGNED),
    revenue_num = CAST(REPLACE(REPLACE(revenue, '$', ''), ',', '') AS UNSIGNED),
    valuation_num = CAST(REPLACE(REPLACE(valuation, '$', ''), ',', '') AS DECIMAL(15,2)),
    win_pct_num = CAST(REPLACE(win_pct, '%', '') AS DECIMAL(5,2));

ALTER TABLE nba_team_financials
DROP COLUMN payroll,
DROP COLUMN revenue,
DROP COLUMN valuation,
DROP COLUMN win_pct;

ALTER TABLE nba_team_financials
RENAME COLUMN payroll_num TO payroll,
RENAME COLUMN revenue_num TO revenue,
RENAME COLUMN valuation_num TO valuation,
RENAME COLUMN win_pct_num TO win_pct;

CREATE INDEX idx_playoff_result ON nba_team_financials(playoff_result);

SELECT team, payroll, wins, win_pct 
FROM nba_team_financials 
WHERE CAST(REPLACE(win_pct, '%', '') AS DECIMAL(5,2)) > 50.0 
ORDER BY (revenue - payroll) DESC;

SELECT 
    ROUND(
        (COUNT(*) * SUM(payroll * win_pct) - SUM(payroll) * SUM(win_pct)) / 
        SQRT(
            (COUNT(*) * SUM(payroll * payroll) - POW(SUM(payroll), 2)) * 
            (COUNT(*) * SUM(win_pct * win_pct) - POW(SUM(win_pct), 2))
        ), 
    4) AS win_pct_payroll_correlation
FROM nba_team_financials;
