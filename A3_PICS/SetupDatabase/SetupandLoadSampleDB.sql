INSERT INTO NationalParkList (Id, Name, Photo) 
SELECT 1, 'test', BulkColumn 
FROM Openrowset( Bulk 'C:\test.jpg', Single_Blob) as image

--location information, square footage, 
-- license = https://creativecommons.org/licenses/by-sa/3.0/legalcode

--Acadia = https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Acadia_National_Park_02.JPG/320px-Acadia_National_Park_02.JPG
-- American Samoa = https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Vatia_from_the_National_Park_of_American_Samoa.jpg/320px-Vatia_from_the_National_Park_of_American_Samoa.jpg
-- Arches = https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Delicatearch.png/317px-Delicatearch.png
-- Badlands = https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/MK00609_Badlands.jpg/320px-MK00609_Badlands.jpg
-- Big Bend = https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Big_Bend_Chihuahuan_Desert.jpg/320px-Big_Bend_Chihuahuan_Desert.jpg
-- Florida Biscayne = https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Biscayne.JPG/320px-Biscayne.JPG
-- Black Canyon = https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Black_Canyon_and_Gunnison_River_2008.jpg/320px-Black_Canyon_and_Gunnison_River_2008.jpg
-- Bryce Canyon = https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Inspiration_Point_Bryce_Canyon_November_2018_panorama.jpg/320px-Inspiration_Point_Bryce_Canyon_November_2018_panorama.jpg
-- canyonlands = https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Green_River_Overlook_Ekker_Butte.jpg/320px-Green_River_Overlook_Ekker_Butte.jpg
-- capitol reef = https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Capitol_Reef_National_Park.jpg/320px-Capitol_Reef_National_Park.jpg
--carlsbad caverns = https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Carlsbad_Caverns_Entrance.jpg/320px-Carlsbad_Caverns_Entrance.jpg
-- channel islands = https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Channel_Islands_National_Park_by_Sentinel-2.jpg/320px-Channel_Islands_National_Park_by_Sentinel-2.jpg
--congaree = https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kayakers_on_Cedar_Creek.jpg/228px-Kayakers_on_Cedar_Creek.jpg
--cuyahoga = https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Cuyahoga_Valley_National_Park.jpg/319px-Cuyahoga_Valley_National_Park.jpg
--crater lake = https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Crater_Lake_winter_pano2.jpg/320px-Crater_Lake_winter_pano2.jpg
--death valley =https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Sand_Dunes_in_Death_Valley_National_Park.jpg/320px-Sand_Dunes_in_Death_Valley_National_Park.jpg
--denali = https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Every_Road-_Denali_%287945497984%29.jpg/320px-Every_Road-_Denali_%287945497984%29.jpg
--dry tortugas = https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Fort-Jefferson_Dry-Tortugas.jpg/320px-Fort-Jefferson_Dry-Tortugas.jpg
--everglades = https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Sunset_over_the_River_of_Grass%2C_NPSphoto%2C_G.Gardner_%289255157507%29.jpg/320px-Sunset_over_the_River_of_Grass%2C_NPSphoto%2C_G.Gardner_%289255157507%29.jpg
--gates of the arcctic = https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Oolah_Valley_%2816089307144%29.jpg/320px-Oolah_Valley_%2816089307144%29.jpg
--glacier = https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Mountain_Goat_at_Hidden_Lake.jpg/320px-Mountain_Goat_at_Hidden_Lake.jpg
--glacier bay = https://upload.wikimedia.org/wikipedia/commons/archive/b/bf/20151222083444%21A045%2C_Glacier_Bay_National_Park%2C_Alaska%2C_USA%2C_Johns_Hopkins_Glacier%2C_2002.jpg
--grand canyon = https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Dawn_on_the_S_rim_of_the_Grand_Canyon_%288645178272%29.jpg/320px-Dawn_on_the_S_rim_of_the_Grand_Canyon_%288645178272%29.jpg
--grand teton = https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Barns_grand_tetons.jpg/320px-Barns_grand_tetons.jpg
--great basin= https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Stella_Lake_Great_Basin.jpg/320px-Stella_Lake_Great_Basin.jpg
--great sand dunes = https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Great_Sand_Dunes_National_Park_and_Preserve%2C_United_States_%28Unsplash%29.jpg/320px-Great_Sand_Dunes_National_Park_and_Preserve%2C_United_States_%28Unsplash%29.jpg
-- great smokey = https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/View_atop_Cliff_Tops_on_Mount_LeConte%2C_GSMNP%2C_TN.jpg/320px-View_atop_Cliff_Tops_on_Mount_LeConte%2C_GSMNP%2C_TN.jpg
--guadalupe = https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Guadalupe_Peak_from_Hunter_Peak.jpg/320px-Guadalupe_Peak_from_Hunter_Peak.jpg
--Haleakala = https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Haleakal%C4%81_2017%283%29.jpg/320px-Haleakal%C4%81_2017%283%29.jpg
--Hawaii Volcanoes = https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/P%C4%81hoehoe_and_Aa_flows_at_Hawaii.jpg/320px-P%C4%81hoehoe_and_Aa_flows_at_Hawaii.jpg
--hot springs = https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Downtown_Hot_Springs%2C_Arkansas_%28aerial%29.jpg/320px-Downtown_Hot_Springs%2C_Arkansas_%28aerial%29.jpg
--isle royale = https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Isle_Royale.jpg/320px-Isle_Royale.jpg
-- joshua tree = https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Joshua_Tree_-_Cyclops_%2B_Potato_Head_-_Sunrise.jpg/320px-Joshua_Tree_-_Cyclops_%2B_Potato_Head_-_Sunrise.jpg
--katmai = https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Katmai_Crater_1980.jpg/320px-Katmai_Crater_1980.jpg
--kenai fjords = https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Kenai_Fjords_coast.jpg/320px-Kenai_Fjords_coast.jpg
--kings canyon = https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/KingsCanyonNP.JPG/320px-KingsCanyonNP.JPG
--kobuk = https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Kobuk_Bendlova_235.jpg/320px-Kobuk_Bendlova_235.jpg
--lake clark = =https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Lake_Clark.JPG/320px-Lake_Clark.JPG
--Mesa Verde = https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Mesa_verde_north_2007.jpg/320px-Mesa_verde_north_2007.jpg
--mammoth cave = https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Mammoth_Cave_Rotunda_%28USGS_Lwt02830%29.jpg/320px-Mammoth_Cave_Rotunda_%28USGS_Lwt02830%29.jpg
--mount ranier = https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Mount_Rainier_from_above_Myrtle_Falls_in_August.JPG/320px-Mount_Rainier_from_above_Myrtle_Falls_in_August.JPG
--cascades = https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Cascade_Pass_and_Pelton_Basin.jpg/320px-Cascade_Pass_and_Pelton_Basin.jpg
--olympic = https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Cedar_Creek_Abbey_Island_Ruby_Beach.jpg/320px-Cedar_Creek_Abbey_Island_Ruby_Beach.jpg
--petrified = https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/The_PEFO_Tepees.jpg/320px-The_PEFO_Tepees.jpg
--pinnacle = https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Rock_formations_at_Pinnacles_National_Park.jpg/320px-Rock_formations_at_Pinnacles_National_Park.jpg
--redwood = https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Redwood_National_Park%2C_fog_in_the_forest.jpg/320px-Redwood_National_Park%2C_fog_in_the_forest.jpg
--saguaro = https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Saguaro_Sunset.jpg/320px-Saguaro_Sunset.jpg
--sequoia = https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/General_Sherman_Tree_in_Sequoia_National_Park_-_June_2022.jpg/180px-General_Sherman_Tree_in_Sequoia_National_Park_-_June_2022.jpg
--shenandoah = https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Skyline_Drive_in_the_Fall_%2821852619608%29.jpg/320px-Skyline_Drive_in_the_Fall_%2821852619608%29.jpg
--theodore = https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/View_of_Theodore_Roosevelt_National_Park.jpg/320px-View_of_Theodore_Roosevelt_National_Park.jpg
--VI = https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/St_John_Trunk_Bay_3.jpg/320px-St_John_Trunk_Bay_3.jpg
-- wrangell = https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Malaspina_Glacier_from_space.jpg/320px-Malaspina_Glacier_from_space.jpg
-- Voyageurs = https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Voyageurs_National_Park.jpg/800px-Voyageurs_National_Park.jpg
--wind cave =https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Cave_Boxwork_often_call_cratework_when_this_large._WInd_Cave.JPG/320px-Cave_Boxwork_often_call_cratework_when_this_large._WInd_Cave.JPG
--yellowstone = https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Grand_Canyon_of_yellowstone.jpg/180px-Grand_Canyon_of_yellowstone.jpg
--yosemite = https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Tunnel_View%2C_Yosemite_Valley%2C_Yosemite_NP_-_Diliff.jpg/320px-Tunnel_View%2C_Yosemite_Valley%2C_Yosemite_NP_-_Diliff.jpg
--zion = https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Zion_angels_landing_view.jpg/234px-Zion_angels_landing_view.jpg
--rocky mountain = https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Rocky_Mountain_National_Park_in_September_2011_-_Glacier_Gorge_from_Bear_Lake.JPG/320px-Rocky_Mountain_National_Park_in_September_2011_-_Glacier_Gorge_from_Bear_Lake.JPG

USE master;  
GO  
CREATE DATABASE Sales  
ON   
( NAME = Sales_dat,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\saledat.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = Sales_log,  
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\salelog.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB );  
GO  


IF NOT EXISTS
(
    SELECT *
    FROM sys.objects
    WHERE object_id = OBJECT_ID(N'RetoolSampleDB')
)
    BEGIN
        PRINT 'Stored procedure already exists';
END;

select  @@VERSION



USE master;
GO
IF DB_ID (N'RetoolSampleDataDB') IS NOT NULL
DROP DATABASE RetoolSampleDataDB;
GO
CREATE DATABASE RetoolSampleDataDB;
GO

USE [RetoolSampleDataDB]
GO

INSERT INTO [dbo].[NationalParkList]
           ([park_name]
           ,[park_state]
           ,[park_code]
           ,[park_visitors]
           ,[park_description]
           ,[nps_link]
           ,[park_preview_pic_name]
           ,[park_preview_pic_data]
           ,[park_date_est]
           ,[park_lat]
           ,[park_long]
           ,[park_area_acres]
           ,[park_area_sq_km]
           ,[pic_license])
    SELECT 'Acadia',
           'Maine',
           'park_acadia',
            3303393,
           'Covering most of Mount Desert Island and other coastal islands, Acadia features the tallest mountain on the Atlantic coast of the United States, granite peaks, ocean shoreline, woodlands, and lakes. There are freshwater, estuary, forest, and intertidal habitats.',
           'https://www.nps.gov/acad/index.htm',
           'acadia.jpg',
			(SELECT * FROM OPENROWSET(BULK N'C:\Users\khaleel\Desktop\tests\A3\SetupDatabase\acadia.jpg', SINGLE_BLOB) as image),
            CAST('2/26/1919' AS date),
           44.35,
           -68.21,
           76678.98,
           198.5,
           'https://creativecommons.org/licenses/by-sa/3.0/legalcode'
GO
