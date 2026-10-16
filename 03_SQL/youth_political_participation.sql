SELECT COUNT(*) AS total_respondents
FROM survey_data;

DESCRIBE survey_data;

ALTER TABLE survey_data
RENAME COLUMN `ï»¿Country` TO Country;

DESCRIBE survey_data;

SELECT
    Age_Group,
    Political_Interest,
    COUNT(*) AS respondents
FROM survey_data
WHERE Political_Interest IS NOT NULL
GROUP BY Age_Group, Political_Interest
ORDER BY Age_Group, respondents DESC;

SELECT Age_Group, COUNT(*) AS respondents
FROM survey_data
GROUP BY Age_Group;

SELECT
    COUNT(*) AS missing_age_group,
    SUM(Age IS NULL) AS missing_age,
    MIN(Age) AS minimum_age,
    MAX(Age) AS maximum_age
FROM survey_data
WHERE Age_Group IS NULL OR TRIM(Age_Group) = '';

SELECT Age, COUNT(*) AS respondents
FROM survey_data
WHERE Age < 18 OR Age > 29
GROUP BY Age
ORDER BY Age;

SELECT Age, COUNT(*) AS respondents
FROM survey_data
WHERE Age >= 90
GROUP BY Age
ORDER BY Age;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age >= 30 AND Age <= 98 THEN 'Older Adults (30+)'
    END AS age_group,
    COUNT(*) AS respondents
FROM survey_data
WHERE Age BETWEEN 18 AND 98
GROUP BY 1
ORDER BY 1;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    Political_Interest,
    COUNT(*) AS respondents
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Political_Interest IS NOT NULL
  AND TRIM(Political_Interest) <> ''
GROUP BY 1, 2
ORDER BY 1, 3 DESC;

SELECT
    age_group,
    Political_Interest,
    respondents,
    ROUND(
        respondents * 100.0 / group_total,
        2
    ) AS percentage
FROM (
    SELECT
        CASE
            WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
            WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
        END AS age_group,
        Political_Interest,
        COUNT(*) AS respondents,
        SUM(COUNT(*)) OVER (
            PARTITION BY
                CASE
                    WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
                    WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
                END
        ) AS group_total
    FROM survey_data
    WHERE Age BETWEEN 18 AND 98
      AND Political_Interest IS NOT NULL
      AND TRIM(Political_Interest) <> ''
    GROUP BY 1, 2
) AS interest_summary
ORDER BY age_group, percentage DESC;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    Voted_Last_Election,
    COUNT(*) AS respondents,
    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (PARTITION BY
            CASE
                WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
                WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
            END
        ), 2
    ) AS percentage
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Voted_Last_Election IS NOT NULL
  AND TRIM(Voted_Last_Election) <> ''
GROUP BY 1, 2
ORDER BY 1, 4 DESC;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    COUNT(Trust_Politicians) AS valid_responses,
    ROUND(AVG(Trust_Politicians), 2) AS average_trust
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Trust_Politicians BETWEEN 0 AND 10
GROUP BY 1
ORDER BY 1;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    Political_Interest,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY CASE
                WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
                WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
            END
        ), 2
    ) AS percentage
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Political_Interest IS NOT NULL
  AND TRIM(Political_Interest) <> ''
GROUP BY 1, 2
ORDER BY 1, 4 DESC;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    Contacted_Politician,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY CASE
                WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
                WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
            END
        ), 2
    ) AS percentage
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Contacted_Politician IS NOT NULL
  AND TRIM(Contacted_Politician) <> ''
GROUP BY 1, 2
ORDER BY 1, 4 DESC;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    Online_Political_Activity,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY CASE
                WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
                WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
            END
        ), 2
    ) AS percentage
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Online_Political_Activity IS NOT NULL
  AND TRIM(Online_Political_Activity) <> ''
GROUP BY 1, 2
ORDER BY 1, 4 DESC;

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    Voted_Last_Election,
    COUNT(*) AS respondents,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY CASE
                WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
                WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
            END
        ), 2
    ) AS percentage
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Voted_Last_Election IS NOT NULL
  AND TRIM(Voted_Last_Election) <> ''
GROUP BY 1, 2
ORDER BY 1, 4 DESC;
    
SELECT
    Country,
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END AS age_group,
    COUNT(*) AS valid_responses,
    ROUND(AVG(Voted_Last_Election = 'Yes') * 100, 2) AS voting_percentage
FROM survey_data
WHERE Age BETWEEN 18 AND 98
  AND Voted_Last_Election IN ('Yes', 'No')
GROUP BY
    Country,
    CASE
        WHEN Age BETWEEN 18 AND 29 THEN 'Young Adults (18-29)'
        WHEN Age BETWEEN 30 AND 98 THEN 'Older Adults (30+)'
    END
ORDER BY Country, age_group;