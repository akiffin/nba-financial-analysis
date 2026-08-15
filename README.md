# NBA Financial Analysis
![CI](https://github.com/akiffin/nba-financial-analysis/actions/workflows/ci.yml/badge.svg)

This project tracks NBA team spending and wins using MySQL.

## Project Structure

* `queries.sql`: Sets up the database, cleans data, adds indexes, and runs the analytics.

## Data Pipeline & Methods

* **Ingestion**: Imports team data into MySQL.
* **Data Cleaning**: Removes dollar and percentage signs to turn text into numbers.
* **Indexing**: Organizes data to speed up searches.
* **Analytics**: Calculates profit margins and tests if spending more money creates more wins.
