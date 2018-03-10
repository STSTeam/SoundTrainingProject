/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

PRINT N'Populating [Users] data...';
:r .\FillUserScript.sql
PRINT N'--------- END Populating [Users] data...';

PRINT N'Populating  FillSessionsAndModules.sql...';
:r .\FillSessionsAndModules.sql
PRINT N'--------- END Populating  FillSessionsAndModules.sql...';

--PRINT N'Populating  FillSound_sessions_Images.sql...';
--:r .\FillSound_sessions_Images.sql
--PRINT N'--------- END Populating  FillSound_sessions_Images.sql...';