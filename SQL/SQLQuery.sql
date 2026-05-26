CREATE DATABASE DB_ReciclaAqui;
USE DB_ReciclaAqui;

-- =============================================
-- CRIAÇÃO DAS TABELAS DIMENSÃO
-- =============================================

CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY IDENTITY(1000,1),
    Year INT,
    MonthNumber INT,
);

CREATE TABLE DimCompany (
    CompanyKey INT PRIMARY KEY IDENTITY(1,1),
    OrgName VARCHAR(100),
    DepartmentName VARCHAR(100)
);

CREATE TABLE DimMaterial (
    MaterialKey INT PRIMARY KEY IDENTITY(1,1),
    MaterialName VARCHAR(100),
    IsRecyclable BIT
);

CREATE TABLE DimEmissionSource (
    EmissionSourceKey INT PRIMARY KEY IDENTITY(1,1),
    SourceName VARCHAR(100)
);

-- =============================================
-- CRIAÇÃO DAS TABELAS FATO
-- =============================================

CREATE TABLE FactSustainability (
    Sustainability INT IDENTITY(1,1),
    DateKey INT NULL,
    CompanyKey INT NULL,
    MaterialKey INT NULL,
    TotalWasteKg FLOAT,
    RecycledWasteKg FLOAT,
    TotalKWh FLOAT,
    TotalLiters FLOAT,
    TotalPrints INT,
    PlasticKg FLOAT,
    Headcount INT,
    CONSTRAINT PK_FactSustainability PRIMARY KEY (Sustainability),
    CONSTRAINT FK_FactSustainability_Date FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    CONSTRAINT FK_FactSustainability_Company FOREIGN KEY (CompanyKey) REFERENCES DimCompany(CompanyKey),
    CONSTRAINT FK_FactSustainability_Material FOREIGN KEY (MaterialKey) REFERENCES DimMaterial(MaterialKey)
);

CREATE TABLE FactCO2 (
    DateKey INT,
    EmissionSourceKey INT,
    CompanyKey INT,
    CO2Kg FLOAT,
    KmDriven FLOAT,
    TravelersCount FLOAT,
    CONSTRAINT PK_FactCO2 PRIMARY KEY (DateKey, EmissionSourceKey, CompanyKey),
    CONSTRAINT FK_FactCO2_Date FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    CONSTRAINT FK_FactCO2_EmissionSource FOREIGN KEY (EmissionSourceKey) REFERENCES DimEmissionSource(EmissionSourceKey),
    CONSTRAINT FK_FactCO2_Company FOREIGN KEY (CompanyKey) REFERENCES DimCompany(CompanyKey)
);

-- =============================================
-- INSERT'S
-- =============================================

INSERT INTO DimDate (Year, MonthNumber)
VALUES
-- 2021
(2021, 1), (2021, 2), (2021, 3), (2021, 4), (2021, 5), (2021, 6),
(2021, 7), (2021, 8), (2021, 9), (2021, 10), (2021, 11), (2021, 12),

-- 2022
(2022, 1), (2022, 2), (2022, 3), (2022, 4), (2022, 5), (2022, 6),
(2022, 7), (2022, 8), (2022, 9), (2022, 10), (2022, 11), (2022, 12),

-- 2023
(2023, 1), (2023, 2), (2023, 3), (2023, 4), (2023, 5), (2023, 6),
(2023, 7), (2023, 8), (2023, 9), (2023, 10), (2023, 11), (2023, 12),

-- 2024
(2024, 1), (2024, 2), (2024, 3), (2024, 4), (2024, 5), (2024, 6),
(2024, 7), (2024, 8), (2024, 9), (2024, 10), (2024, 11), (2024, 12),

-- 2025
(2025, 1), (2025, 2), (2025, 3), (2025, 4), (2025, 5), (2025, 6),
(2025, 7), (2025, 8), (2025, 9), (2025, 10), (2025, 11), (2025, 12);

INSERT INTO DimDate (Year,MonthNumber) values (2025,null),(2024,null),(2023,null),(2022,null),(2021,null);

INSERT INTO DimCompany (Orgname, DepartmentName) VALUES ('Unimed Federação','GSI'),('Unimed Federação','GRH'),('Unimed Federação','GTI'),('Unimed Federação','SUP'),('Unimed Federação','GCO'),
('Unimed Federação','AI'),('Unimed Federação','GJU'),('Unimed Federação','GCM'),('Unimed Federação','DIR'),('Unimed Federação','GRS'),('Unimed Federação','GPI'),
('Unimed Federação','GFI'),('Unimed Federação','GRC'),('Unimed Federação','GPC'),('Unimed Federação','GSA'),('Unimed BH','Geral');

INSERT INTO DimEmissionSource (SourceName) VALUES ('Aéreo'),('Terrestre');

INSERT INTO DimMaterial (MaterialName, IsRecyclable) VALUES ('Pilha',1),('Papelão e Papel',1),('Vidro',1),('Plástico',1),('Eletrônicos',1),('Copo Plástico',1),('Papel',1),('Bateria',1),('Água',0),('Energia',0);

-- =============================================
-- CONSULTAS DE TESTE
-- =============================================

SELECT f.Sustainability as ID, dt.Year, dt.MonthNumber, C.OrgName, M.MaterialName, f.TotalWasteKg, f.RecycledWasteKg, f.TotalKWh, f.TotalLiters, f.TotalPrints, f.PlasticKg, Headcount  
FROM FactSustainability as f
INNER JOIN DimDate as dt ON dt.DateKey = f.DateKey
INNER JOIN DimCompany as C ON f.CompanyKey = C.CompanyKey
INNER JOIN DimMaterial as M ON f.MaterialKey = M.MaterialKey
ORDER BY dt.Year DESC, dt.MonthNumber DESC;


SELECT D.Year as Ano, D.MonthNumber as Mês, C.OrgName, E.SourceName, F.CO2Kg, F.KmDriven, F.TravelersCount
FROM FactCO2 as F
JOIN DimDate as D ON F.DateKey = D.DateKey
JOIN DimEmissionSource AS E ON F.EmissionSourceKey = E.EmissionSourceKey
JOIN DimCompany as C ON F.CompanyKey = C.CompanyKey
ORDER BY D.Year DESC, D.MonthNumber DESC;