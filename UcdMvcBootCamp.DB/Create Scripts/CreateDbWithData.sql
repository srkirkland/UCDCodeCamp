USE [CodeCamp]
GO
/****** Object:  Table [dbo].[Speakers]    Script Date: 05/10/2010 14:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Speakers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Bio] [varchar](max) NULL,
 CONSTRAINT [PK_Speakers_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Speakers] ON
INSERT [dbo].[Speakers] ([Id], [FirstName], [LastName], [Bio]) VALUES (1, N'Yancy', N'Fry', NULL)
INSERT [dbo].[Speakers] ([Id], [FirstName], [LastName], [Bio]) VALUES (2, N'Bender', N'Rodriguez', NULL)
INSERT [dbo].[Speakers] ([Id], [FirstName], [LastName], [Bio]) VALUES (3, N'Marion', N'Cobretti', NULL)
INSERT [dbo].[Speakers] ([Id], [FirstName], [LastName], [Bio]) VALUES (4, N'Zapp', N'Brannigan', NULL)
INSERT [dbo].[Speakers] ([Id], [FirstName], [LastName], [Bio]) VALUES (5, N'Cubert', N'Farnsworth', NULL)
SET IDENTITY_INSERT [dbo].[Speakers] OFF
/****** Object:  Table [dbo].[Attendees]    Script Date: 05/10/2010 14:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attendees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[ConferenceID] [int] NULL,
 CONSTRAINT [PK_Attendee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Attendees] ON
INSERT [dbo].[Attendees] ([Id], [FirstName], [LastName], [Email], [ConferenceID]) VALUES (1, N'Scott', N'Kirkland', NULL, 1)
INSERT [dbo].[Attendees] ([Id], [FirstName], [LastName], [Email], [ConferenceID]) VALUES (2, N'Alan', N'Lai', NULL, 2)
INSERT [dbo].[Attendees] ([Id], [FirstName], [LastName], [Email], [ConferenceID]) VALUES (4, N'Ken', N'Taylor', NULL, 2)
INSERT [dbo].[Attendees] ([Id], [FirstName], [LastName], [Email], [ConferenceID]) VALUES (5, N'Jason', N'Sylvestre', NULL, 3)
SET IDENTITY_INSERT [dbo].[Attendees] OFF
/****** Object:  Table [dbo].[Conferences]    Script Date: 05/10/2010 14:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[SessionCount] [int] NULL,
	[AttendeeCount] [int] NULL,
 CONSTRAINT [PK_Conference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Conferences] ON
INSERT [dbo].[Conferences] ([Id], [Name], [SessionCount], [AttendeeCount]) VALUES (1, N'MIX', 2, 1)
INSERT [dbo].[Conferences] ([Id], [Name], [SessionCount], [AttendeeCount]) VALUES (2, N'DevConnections', 1, 1)
INSERT [dbo].[Conferences] ([Id], [Name], [SessionCount], [AttendeeCount]) VALUES (3, N'PDC', 2, 0)
SET IDENTITY_INSERT [dbo].[Conferences] OFF
/****** Object:  Table [dbo].[Sessions]    Script Date: 05/10/2010 14:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sessions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Abstract] [varchar](max) NULL,
	[SpeakerID] [int] NULL,
	[ConferenceID] [int] NULL,
 CONSTRAINT [PK_Speakers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON
INSERT [dbo].[Sessions] ([Id], [Title], [Abstract], [SpeakerID], [ConferenceID]) VALUES (1, N'jQuery is cool', NULL, 1, 1)
INSERT [dbo].[Sessions] ([Id], [Title], [Abstract], [SpeakerID], [ConferenceID]) VALUES (2, N'MVC Security', NULL, 2, 2)
INSERT [dbo].[Sessions] ([Id], [Title], [Abstract], [SpeakerID], [ConferenceID]) VALUES (4, N'UI Testing', N'Going to test those UIs', 3, 1)
INSERT [dbo].[Sessions] ([Id], [Title], [Abstract], [SpeakerID], [ConferenceID]) VALUES (5, N'Silverlight 4', NULL, 4, 3)
INSERT [dbo].[Sessions] ([Id], [Title], [Abstract], [SpeakerID], [ConferenceID]) VALUES (6, N'Windows Azure', NULL, 5, 3)
SET IDENTITY_INSERT [dbo].[Sessions] OFF
 