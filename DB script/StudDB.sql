USE [master]
GO
/****** Object:  Database [StudDB]    Script Date: 2.4.25 12:55:24 ******/
CREATE DATABASE [StudDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StudDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudDB]
GO
/****** Object:  Table [dbo].[tblAttendance]    Script Date: 2.4.25 12:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAttendance](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[studentID] [int] NULL,
	[AttendanceDate] [datetime] NULL,
	[isPresent] [bit] NULL,
 CONSTRAINT [PK_tblAttendance] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourses]    Script Date: 2.4.25 12:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCourses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 2.4.25 12:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistration]    Script Date: 2.4.25 12:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[loginid] [int] NOT NULL,
 CONSTRAINT [PK__tblRegis__3214EC07D79D4D37] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 2.4.25 12:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 2.4.25 12:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudent](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[totalMarks] [int] NULL,
	[div] [nchar](10) NULL,
	[CouserId] [int] NULL,
	[RegId] [int] NULL,
 CONSTRAINT [PK_tblStudent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserRoles]    Script Date: 2.4.25 12:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loginId] [int] NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_tblUserRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCourses] ON 

INSERT [dbo].[tblCourses] ([id], [courseName]) VALUES (1, N'MCA')
INSERT [dbo].[tblCourses] ([id], [courseName]) VALUES (2, N'MBA')
INSERT [dbo].[tblCourses] ([id], [courseName]) VALUES (3, N'BCA')
INSERT [dbo].[tblCourses] ([id], [courseName]) VALUES (4, N'Bsc')
INSERT [dbo].[tblCourses] ([id], [courseName]) VALUES (5, N'BA')
SET IDENTITY_INSERT [dbo].[tblCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([Id], [userid], [password]) VALUES (1, N'admin', N'admin@123')
INSERT [dbo].[tblLogin] ([Id], [userid], [password]) VALUES (2, N'rajesh', N'rajesh@123')
INSERT [dbo].[tblLogin] ([Id], [userid], [password]) VALUES (3, N'vinod', N'vinod@123')
SET IDENTITY_INSERT [dbo].[tblLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRegistration] ON 

INSERT [dbo].[tblRegistration] ([Id], [FirstName], [LastName], [Email], [loginid]) VALUES (1, N'Darshan', N'Ruikar', N'darshan@gmail.com', 1)
INSERT [dbo].[tblRegistration] ([Id], [FirstName], [LastName], [Email], [loginid]) VALUES (3, N'rajesh', N'waghmare', N'rajesh@gmail.com', 2)
INSERT [dbo].[tblRegistration] ([Id], [FirstName], [LastName], [Email], [loginid]) VALUES (4, N'vinod', N'suravase', N'vinod@gmail.com', 3)
SET IDENTITY_INSERT [dbo].[tblRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([id], [Role]) VALUES (1, N'Principal')
INSERT [dbo].[tblRoles] ([id], [Role]) VALUES (2, N'Teacher')
INSERT [dbo].[tblRoles] ([id], [Role]) VALUES (3, N'Student')
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUserRoles] ON 

INSERT [dbo].[tblUserRoles] ([id], [loginId], [roleId]) VALUES (1, 1, 1)
INSERT [dbo].[tblUserRoles] ([id], [loginId], [roleId]) VALUES (2, 1, 2)
INSERT [dbo].[tblUserRoles] ([id], [loginId], [roleId]) VALUES (3, 2, 2)
INSERT [dbo].[tblUserRoles] ([id], [loginId], [roleId]) VALUES (4, 2, 3)
INSERT [dbo].[tblUserRoles] ([id], [loginId], [roleId]) VALUES (5, 3, 3)
SET IDENTITY_INSERT [dbo].[tblUserRoles] OFF
GO
ALTER TABLE [dbo].[tblAttendance] ADD  CONSTRAINT [DF_tblAttendance_isPresent]  DEFAULT ((0)) FOR [isPresent]
GO
ALTER TABLE [dbo].[tblAttendance]  WITH CHECK ADD  CONSTRAINT [FK_tblAttendance_tblStudent] FOREIGN KEY([studentID])
REFERENCES [dbo].[tblStudent] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAttendance] CHECK CONSTRAINT [FK_tblAttendance_tblStudent]
GO
ALTER TABLE [dbo].[tblRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistration_tblLogin] FOREIGN KEY([loginid])
REFERENCES [dbo].[tblLogin] ([Id])
GO
ALTER TABLE [dbo].[tblRegistration] CHECK CONSTRAINT [FK_tblRegistration_tblLogin]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblCourses] FOREIGN KEY([CouserId])
REFERENCES [dbo].[tblCourses] ([id])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblCourses]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblRegistration] FOREIGN KEY([RegId])
REFERENCES [dbo].[tblRegistration] ([Id])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblRegistration]
GO
ALTER TABLE [dbo].[tblUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_tblUserRoles_tblLogin] FOREIGN KEY([loginId])
REFERENCES [dbo].[tblLogin] ([Id])
GO
ALTER TABLE [dbo].[tblUserRoles] CHECK CONSTRAINT [FK_tblUserRoles_tblLogin]
GO
ALTER TABLE [dbo].[tblUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_tblUserRoles_tblRoles] FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRoles] ([id])
GO
ALTER TABLE [dbo].[tblUserRoles] CHECK CONSTRAINT [FK_tblUserRoles_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [StudDB] SET  READ_WRITE 
GO
