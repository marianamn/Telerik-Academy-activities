USE [master]
GO
/****** Object:  Database [PeopleLocationDB]    Script Date: 10/8/2015 11:36:50 PM ******/
CREATE DATABASE [PeopleLocationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PeopleLocationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PeopleLocationDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PeopleLocationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PeopleLocationDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PeopleLocationDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PeopleLocationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PeopleLocationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PeopleLocationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PeopleLocationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PeopleLocationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PeopleLocationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PeopleLocationDB] SET  MULTI_USER 
GO
ALTER DATABASE [PeopleLocationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PeopleLocationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PeopleLocationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PeopleLocationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PeopleLocationDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PeopleLocationDB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/8/2015 11:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] NOT NULL,
	[AddressText] [nvarchar](50) NOT NULL,
	[TownId] [int] IDENTITY(10,2) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 10/8/2015 11:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[ContinentId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 10/8/2015 11:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 10/8/2015 11:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] NOT NULL,
	[FirstName] [nchar](30) NOT NULL,
	[Lastname] [nchar](30) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 10/8/2015 11:36:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[TownID] [int] IDENTITY(10,2) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [AddressText], [TownId]) VALUES (1, N'Mladost', 16)
INSERT [dbo].[Address] ([AddressId], [AddressText], [TownId]) VALUES (2, N'Li Chang', 20)
SET IDENTITY_INSERT [dbo].[Address] OFF
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (2, N'Asia')
INSERT [dbo].[Continents] ([ContinentId], [Name]) VALUES (3, N'Africa')
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (2, N'China', 2)
INSERT [dbo].[Countries] ([CountryId], [Name], [ContinentId]) VALUES (3, N'Gana', 3)
INSERT [dbo].[People] ([Id], [FirstName], [Lastname], [AddressId]) VALUES (1, N'Pesho                         ', N'Goshev                        ', 1)
INSERT [dbo].[People] ([Id], [FirstName], [Lastname], [AddressId]) VALUES (2, N'Chao                          ', N'Ling                          ', 2)
SET IDENTITY_INSERT [dbo].[Towns] ON 

INSERT [dbo].[Towns] ([TownID], [Name], [CountryId]) VALUES (16, N'Sofia', 1)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryId]) VALUES (18, N'Hong Kong', 2)
INSERT [dbo].[Towns] ([TownID], [Name], [CountryId]) VALUES (20, N'Safari', 3)
SET IDENTITY_INSERT [dbo].[Towns] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([TownID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([ContinentId])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Address]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [PeopleLocationDB] SET  READ_WRITE 
GO
