USE BUDT702_Project_0503_10;


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