# Youth Political Participation and Democracy in Europe

### A Comparative Analysis of Young Adults and Older Adults Using European Social Survey Round 11

## Project Overview

This project examines differences in political participation between young adults aged 18–29 and adults aged 30 and above. Using the European Social Survey (ESS) Round 11 Integrated Dataset, the analysis explores political interest, voting behaviour, trust in politicians, direct political engagement, and online political activity.

The project combines data cleaning, SQL queries, Python-based analysis, and Power BI visualisation to investigate patterns of political engagement across participating survey countries.

## Research Questions

- How does political interest differ between young and older adults?
- How does reported voting behaviour vary across the two age groups?
- Are there differences in trust in politicians?
- How frequently do respondents contact politicians directly?
- Is online political activity more common among younger adults?

## Dataset

- **Source:** European Social Survey (ESS)
- **Round:** 11
- **Edition:** Integrated Dataset, Edition 4.2
- **Survey period:** 2023/24
- **Original dataset:** 50,116 respondent records
- **Respondents in the two age groups:** 48,659

The analysis compares young adults (18–29) with older adults (30+). Weighted descriptive summaries use the dataset's `Analysis_Weight` variable.

Official data portal: https://www.europeansocialsurvey.org/data-portal

## Tools and Technologies

- **Microsoft Excel:** Data cleaning, organisation, and documentation
- **SQL:** Data queries and grouped comparisons
- **Python:** Data validation and weighted descriptive analysis using Pandas and NumPy
- **Matplotlib and Seaborn:** Statistical visualisation
- **Microsoft Power BI:** Interactive dashboard and visual comparisons

## Repository Structure

| Folder | Contents |
|---|---|
| `01_Raw_Data` | Source dataset information and raw data, where permitted |
| `02_Excel` | Cleaned workbook and data organisation |
| `03_SQL` | SQL analysis queries |
| `04_Python` | Python notebook and analysis outputs |
| `05_PowerBI` | Power BI dashboard |
| `06_Report` | Complete project report |
| `07_References` | Data sources and references |
| `08_Final` | Final summaries and analysis outputs |

## Key Findings

The weighted descriptive analysis indicates that:

- Older adults reported higher levels of political interest than young adults.
- The proportion reporting that they voted in the last national election was higher among older adults; voting eligibility is important when interpreting this comparison.
- Young adults had a slightly higher weighted mean trust score for politicians, although the difference was modest.
- Older adults were more likely to report contacting politicians directly.
- Young adults were more likely to report online political activity.

These findings are descriptive. They do not establish causation or demonstrate statistical significance.

## Methodology

The project involved selecting relevant variables, preparing age groups, converting coded responses into readable categories, checking missing values, and calculating descriptive summaries.

Categorical outcomes were summarised as weighted percentages within age groups. Trust in politicians was analysed using weighted mean scores on a 0–10 scale.

## Limitations

- The analysis is descriptive and does not establish causal relationships.
- Valid sample sizes differ across outcomes because of missing responses.
- The analysis pools participating survey countries and does not fully investigate country-level differences.
- The weighting procedure should be interpreted in accordance with the official ESS documentation.

## Project Report

The complete report is available in `06_Report`.

## Author

**Suhail Alam Mansoori**  
B.A. (Hons.) Political Science  
University of Delhi

