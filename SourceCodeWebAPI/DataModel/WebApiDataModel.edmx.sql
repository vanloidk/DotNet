
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/08/2017 14:30:35
-- Generated from EDMX file: C:\Users\Loi_N\Desktop\sourcecode\SourceCodeWebAPI\DataModel\WebApiDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WebApiDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Tokens_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tokens] DROP CONSTRAINT [FK_Tokens_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Tokens]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tokens];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductId] int IDENTITY(1,1) NOT NULL,
    [ProductName] varchar(50)  NOT NULL
);
GO

-- Creating table 'Tokens'
CREATE TABLE [dbo].[Tokens] (
    [TokenId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [AuthToken] nvarchar(250)  NOT NULL,
    [IssuedOn] datetime  NOT NULL,
    [ExpiresOn] datetime  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [Name] nvarchar(50)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ProductId] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductId] ASC);
GO

-- Creating primary key on [TokenId] in table 'Tokens'
ALTER TABLE [dbo].[Tokens]
ADD CONSTRAINT [PK_Tokens]
    PRIMARY KEY CLUSTERED ([TokenId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Tokens'
ALTER TABLE [dbo].[Tokens]
ADD CONSTRAINT [FK_Tokens_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tokens_User'
CREATE INDEX [IX_FK_Tokens_User]
ON [dbo].[Tokens]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------