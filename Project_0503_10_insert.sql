USE BUDT702_Project_0503_10;

-- Insert Values in Progam Table
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P101', 'MBA Full-Time', 'MBA', 2, 90000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P102', 'Business Analytics', 'MS', 1, 62000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P103', 'Executive MBA', 'MBA', 1.5, 70000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P104', 'Business Administration', 'PhD', 4, 30000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P105', 'Finance', 'MS', 1, 60500);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P106', 'Supply Chain Management', 'MS', 1.5, 62500);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P107', 'Information Systems', 'MS', 2, 62000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P108', 'Accounting', 'MS', 1.5, 62000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P109', 'Quantitative Finance', 'MS', 2, 72500);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P110', 'Marketing Analytics', 'MS', 1.5, 62000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P111', 'Management Studies', 'MS Online', 1, 25000);
INSERT INTO Program (prgId, prgName, prgType, prgDuration, prgTuition) VALUES ('P112', 'MBA', 'MBA Online', 2, 91000);

SELECT * FROM Program

-- Insert Values in Publication Table
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB01', 'Bloomberg', 'https://www.bloomberg.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB02', 'Economist', 'https://www.economist.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB03', 'US News', 'https://www.usnews.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB04', 'Forbes', 'https://www.forbes.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB05', 'Financial Times', 'https://www.ft.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB06', 'Business Insider', 'https://www.businessinsider.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB07', 'The Wall Street Journal', 'https://www.wsj.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB08', 'Princeton Review', 'https://www.princetonreview.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB09', 'Poets and Quants', 'https://poetsandquants.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB10', 'AACSB International', 'https://www.aacsb.edu');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB11', 'Eduniversal Business School Ranking', 'https://www.eduniversal-ranking.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB12', 'Academic Ranking of World Universities (ARWU)', 'https://www.shanghairanking.com');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB13', 'Center for World University Rankings (CWUR)', 'https://cwur.org');
INSERT INTO Publication (pubId, pubName, pubURL) VALUES ('PB14', 'Global MBA Rankings (CEO Magazine)', 'https://ceo-mag.com');

SELECT * FROM Publication

-- Insert Values in RankingFactors Table
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF01', '90%', '95%', 100000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF02', '85%', '90%', 90000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF03', '92%', '88%', 110000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF04', '80%', '93%', 85000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF05', '88%', '91%', 95000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF06', '93%', '89%', 105000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF07', '87%', '92%', 98000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF08', '91%', '93%', 102000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF09', '83%', '89%', 98000);
INSERT INTO RankingFactors (rfsFactorIndex, rfsGradRate, rfsEmpRate, rfsAvgSalary) VALUES ('RF10', '96%', '87%', 93000);

SELECT * FROM RankingFactors

-- Insert Values in Rank Table
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R001', 2023, 'P104', 9);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R002', 2023, 'P101', 16);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R003', 2020, 'P104', 1);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R004', 2022, 'P108', 19);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R005', 2023, 'P112', 17);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R006', 2021, 'P104', 3);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R007', 2022, 'P101', 17);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R008', 2018, 'P101', 20);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R009', 2019, 'P108', 1);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R010', 2020, 'P102', 11);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R011', 2020, 'P103', 1);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R012', 2022, 'P104', 18);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R013', 2018, 'P105', 18);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R014', 2023, 'P112', 5);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R015', 2020, 'P109', 17);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R016', 2020, 'P109', 15);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R017', 2022, 'P104', 17);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R018', 2022, 'P111', 15);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R019', 2019, 'P110', 17);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R020', 2022, 'P108', 16);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R021', 2023, 'P107', 3);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R022', 2018, 'P110', 4);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R023', 2018, 'P110', 20);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R024', 2019, 'P101', 8);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R025', 2019, 'P103', 2);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R026', 2021, 'P108', 14);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R027', 2019, 'P107', 16);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R028', 2018, 'P102', 16);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R029', 2021, 'P108', 18);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R030', 2020, 'P105', 16);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R031', 2023, 'P105', 11);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R032', 2023, 'P111', 1);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R033', 2019, 'P111', 13);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R034', 2021, 'P106', 16);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R035', 2021, 'P107', 1);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R036', 2018, 'P105', 7);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R037', 2018, 'P103', 13);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R038', 2022, 'P111', 14);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R039', 2020, 'P106', 11);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R040', 2019, 'P101', 17);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R041', 2020, 'P112', 5);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R042', 2022, 'P110', 14);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R043', 2023, 'P109', 7);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R044', 2019, 'P111', 10);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R045', 2020, 'P109', 11);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R046', 2021, 'P110', 8);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R047', 2023, 'P109', 12);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R048', 2018, 'P104', 9);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R049', 2021, 'P112', 19);
INSERT INTO [Rank] (rankId, rankYear, prgId, rankPosition) VALUES ('R050', 2019, 'P108', 10);

SELECT * FROM [Rank]

-- Insert values in Give Table
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB08', 'RF01', 'R001');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB07', 'RF08', 'R002');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB14', 'RF06', 'R003');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB14', 'RF05', 'R004');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB01', 'RF04', 'R005');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF06', 'R006');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB04', 'RF08', 'R007');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB13', 'RF07', 'R008');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF08', 'R009');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF08', 'R010');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB13', 'RF06', 'R011');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB09', 'RF05', 'R012');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB08', 'RF07', 'R013');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB03', 'RF07', 'R014');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB07', 'RF04', 'R015');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB02', 'RF02', 'R016');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB03', 'RF04', 'R017');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB04', 'RF10', 'R018');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB04', 'RF03', 'R019');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB02', 'RF09', 'R020');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB09', 'RF02', 'R021');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF04', 'R022');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB01', 'RF01', 'R023');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB08', 'RF04', 'R024');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB03', 'RF06', 'R025');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF01', 'R026');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB12', 'RF04', 'R027');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB13', 'RF01', 'R028');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB10', 'RF03', 'R029');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB06', 'RF06', 'R030');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB14', 'RF02', 'R031');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF02', 'R032');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB10', 'RF08', 'R033');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB03', 'RF06', 'R034');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB06', 'RF08', 'R035');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB13', 'RF09', 'R036');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB06', 'RF07', 'R037');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB10', 'RF06', 'R038');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB10', 'RF04', 'R039');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB08', 'RF09', 'R040');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF03', 'R041');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB04', 'RF03', 'R042');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB05', 'RF03', 'R043');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB09', 'RF09', 'R044');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB09', 'RF10', 'R045');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB03', 'RF01', 'R046');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB12', 'RF07', 'R047');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB09', 'RF02', 'R048');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB11', 'RF09', 'R049');
INSERT INTO Give (pubId, rfsFactorIndex, rankId) VALUES ('PB02', 'RF10', 'R050');

SELECT * FROM Give