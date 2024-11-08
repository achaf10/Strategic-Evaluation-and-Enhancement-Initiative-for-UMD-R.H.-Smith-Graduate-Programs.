USE BUDT702_Project_0503_10;

-- Drop Tables if ExistS
DROP TABLE IF EXISTS Give;
DROP TABLE IF EXISTS [Rank];
DROP TABLE IF EXISTS RankingFactors;
DROP TABLE IF EXISTS Publication;
DROP TABLE IF EXISTS Program;

-- Create Program Table
CREATE TABLE [Program] (
    prgId CHAR(10) NOT NULL,
    prgName NVARCHAR(255),
    prgType NVARCHAR(100),
    prgDuration FLOAT,
    prgTuition DECIMAL(19, 2),
    CONSTRAINT pk_Program_prgId PRIMARY KEY (prgId)
);

-- Create Publication Table
CREATE TABLE [Publication] (
    pubId CHAR(10) NOT NULL,
    pubName NVARCHAR(255),
    pubURL NVARCHAR(255),
    CONSTRAINT pk_Publication_pubId PRIMARY KEY (pubId)
);

-- Create RankingFactors Table
CREATE TABLE [RankingFactors] (
    rfsFactorIndex CHAR(10) NOT NULL,
    rfsGradRate CHAR(10),
    rfsEmpRate CHAR(10),
    rfsAvgSalary DECIMAL(19, 2),
    CONSTRAINT pk_RankingFactors_rfsFactorIndex PRIMARY KEY (rfsFactorIndex)
);

-- Create Rank Table
CREATE TABLE [Rank] (
	rankId CHAR(4) NOT NULL,
    rankYear CHAR(4),
    prgId CHAR(10),
    rankPosition INT,
    CONSTRAINT pk_Rank PRIMARY KEY (rankId),
    CONSTRAINT fk_RankProgram FOREIGN KEY (prgId) REFERENCES [Program] (prgId)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Assuming the Rank table is already created with the composite primary key
-- We reference all parts of the composite primary key in the foreign key definition in the Give table
CREATE TABLE [Give] (
    pubId CHAR(10) NOT NULL,
    rfsFactorIndex CHAR(10) NOT NULL,
    rankId CHAR(4) NOT NULL,
    CONSTRAINT PK_Give PRIMARY KEY (pubId, rfsFactorIndex, rankId),
    CONSTRAINT FK_GivePublication FOREIGN KEY (pubId) REFERENCES [Publication] (pubId)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_GiveRankingFactors FOREIGN KEY (rfsFactorIndex) REFERENCES [RankingFactors] (rfsFactorIndex)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_GiveRank FOREIGN KEY (rankId) REFERENCES [Rank] (rankId)
        ON DELETE NO ACTION ON UPDATE NO ACTION-- Changed to NO ACTION to avoid cycles/multiple cascade paths
);

-- Insert Values in Tables
INSERT INTO Program select * from Program1;
INSERT INTO Publication select * from Publication1;
INSERT INTO RankingFactors select * from RankingFactors1;
INSERT INTO [Rank] select * from Rank1;
INSERT INTO Give select * from Give1;

-- Print the Tables
SELECT * FROM PROGRAM;
SELECT * FROM Publication;
SELECT * FROM RankingFactors;
SELECT * FROM [Rank];
SELECT * FROM Give;


-- Drop existing views if they exist
IF OBJECT_ID('Top5RankedPrograms', 'V') IS NOT NULL DROP VIEW Top5RankedPrograms;
GO
IF OBJECT_ID('RankingChanges', 'V') IS NOT NULL DROP VIEW RankingChanges;
GO
IF OBJECT_ID('AvgRankingFactorsTopPrograms', 'V') IS NOT NULL DROP VIEW AvgRankingFactorsTopPrograms;
GO
IF OBJECT_ID('ProgramAvgRankAndTop10Appearances', 'V') IS NOT NULL DROP VIEW ProgramAvgRankAndTop10Appearances;
GO
IF OBJECT_ID('UMDProgramsRankingAcrossPublications', 'V') IS NOT NULL DROP VIEW UMDProgramsRankingAcrossPublications;
GO

-- 1. What are the top 5 ranked UMD graduate programs over the past 5 years?
-- This question aims to identify the highest-ranked programs based on historical data.

-- View for Top 5 Ranked Programs
CREATE VIEW Top5RankedPrograms AS
SELECT TOP 5 prgName AS 'Program Name', AVG(rankPosition) as [Average Rank]
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