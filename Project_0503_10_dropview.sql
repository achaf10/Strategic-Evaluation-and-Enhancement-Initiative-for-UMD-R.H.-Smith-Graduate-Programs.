USE BUDT702_Project_0503_10;

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