CREATE TABLE [dbo].[Employees] (
    [EmployeeID] INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50)  NOT NULL,
    [LastName]   NVARCHAR (50)  NOT NULL,
    [Email]      NVARCHAR (100) NOT NULL,
    [Phone]      NVARCHAR (15)  NULL,
    [HireDate]   DATETIME       NOT NULL
);
