USE BUDT702_Project_0503_10;
GO

-- 1. What are the top 5 ranked UMD graduate programs over the past 5 years?
-- This question aims to identify the highest-ranked programs based on historical data.

-- View for Top 5 Ranked Programs
CREATE VIEW Top5RankedPrograms AS
SELECT TOP 5 prgName AS 'Program Name', 
	AVG(rankPosition) as [Average Rank]
FROM Program
JOIN [Rank] ON Program.prgId = [Rank].prgId
WHERE rankYear BETWEEN YEAR(GETDATE()) - 5 AND YEAR(GETDATE())
GROUP BY prgName
ORDER BY [Average Rank] ASC;
GO
SELECT * FROM Top5RankedPrograms;
GO

-- 2. How have the rankings of UMD graduate programs changed relative to their peers over the past 5 years?
-- This question seeks to analyze the trend and changes in rankings over time.

-- View for Ranking Changes Over Time
CREATE VIEW RankingChanges AS
SELECT 
    prgName AS 'Program Name', 
    pubName AS 'Publication Name', 
    rankYear AS 'Rank Year', 
    rankPosition AS 'Rank Position'
FROM 
    Program
JOIN 
    [Rank] ON Program.prgId = [Rank].prgId
JOIN 
    Give ON [Rank].rankId = Give.rankId
JOIN 
    [Publication] ON Give.pubId = Publication.pubId
WHERE 
    rankYear BETWEEN YEAR(GETDATE()) - 5 AND YEAR(GETDATE())
GROUP BY 
    prgName, pubName, rankYear, rankPosition;
GO
SELECT * FROM RankingChanges ORDER BY [Program Name], [Rank Year];
GO


-- 3. What are the average ranking factors for the top-ranked UMD graduate programs?
-- This aims to understand what factors contribute to higher rankings for top programs.

-- View for Average Ranking Factors for Top Programs
CREATE VIEW AvgRankingFactorsTopPrograms AS
SELECT 
    prgName, 
    AVG(CAST(REPLACE(rfsGradRate, '%', '') AS FLOAT)) as [Averageg Graduation Rate], 
    AVG(CAST(REPLACE(rfsEmpRate, '%', '') AS FLOAT)) as [Average Employement Rate], 
    CAST(AVG(rfsAvgSalary) AS DECIMAL(19, 2)) as [Average Salary]
FROM 
    Program
JOIN 
    [Rank] ON Program.prgId = [Rank].prgId
JOIN 
    Give ON [Rank].rankId = Give.rankId
JOIN 
    RankingFactors ON Give.rfsFactorIndex = RankingFactors.rfsFactorIndex
WHERE 
    rankPosition <= 5 AND rankYear BETWEEN YEAR(GETDATE()) - 5 AND YEAR(GETDATE())
GROUP BY 
    prgName;
GO
SELECT * FROM AvgRankingFactorsTopPrograms;
GO

-- 4. Analyze UMD graduate programs' average rankings and frequency of top 10 appearances in the last 5 years.
-- This query evaluates UMD graduate programs' average rankings and top 10 appearances over the past 5 years.

-- View for Program AvgRank And Top10 Appearances
CREATE VIEW ProgramAvgRankAndTop10Appearances AS
SELECT 
    prgName AS 'Program Name',
    AVG(rankPosition) AS 'Average Rank',
    COUNT(CASE WHEN rankPosition <= 10 THEN 1 ELSE NULL END) AS 'Top 10 Appearances'
FROM 
    Program
JOIN 
    [Rank] ON Program.prgId = [Rank].prgId
WHERE 
    rankYear BETWEEN YEAR(GETDATE()) - 5 AND YEAR(GETDATE())
GROUP BY 
    prgName;
GO
SELECT * FROM ProgramAvgRankAndTop10Appearances;
GO


-- 5. How do various publications rank UMD's graduate programs over the last 5 years, and how frequently do these programs appear in these rankings?
-- This view helps in identifying which publications rank UMD programs higher or lower, aiding in targeted outreach and relationship building.

-- View for Ranking Data of UMD Programs Across Publications Over 5 Years
CREATE VIEW UMDProgramsRankingAcrossPublications AS
SELECT 
    Program.prgName AS 'Program Name', 
    Publication.pubName AS 'Publication Name', 
    AVG([Rank].rankPosition) AS 'Average Rank',
    COUNT(*) AS 'Number of Rankings'
FROM 
    Program
JOIN 
    [Rank] ON Program.prgId = [Rank].prgId
JOIN 
    Give ON [Rank].rankId = Give.rankId
JOIN 
    Publication ON Give.pubId = Publication.pubId
WHERE 
    [Rank].rankYear BETWEEN YEAR(GETDATE()) - 5 AND YEAR(GETDATE())
GROUP BY 
    Program.prgName, Publication.pubName;
GO
SELECT * FROM UMDProgramsRankingAcrossPublications
ORDER BY [Program Name], [Average Rank];
GO
