USE [master]
GO
CREATE LOGIN [AppProfilesUser] WITH PASSWORD=N'Password1234', DEFAULT_DATABASE=[Profiles], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Profiles]
GO
CREATE USER [AppProfilesUser] FOR LOGIN [AppProfilesUser]
GO
EXEC sp_addrolemember N'db_owner', N'AppProfilesUser'
GO
SET NOCOUNT ON
DECLARE @user SYSNAME
 
-- 2 - Set @user variable
SELECT @user='AppProfilesUser'
 
-- 4 - Populate temporary table
SELECT  'GRANT EXEC ON ' + '[' + ROUTINE_SCHEMA + ']' + '.' + '[' +ROUTINE_NAME + ']' + ' TO ' + @user
         call
  INTO #storedprocedures
  FROM INFORMATION_SCHEMA.ROUTINES
 WHERE ROUTINE_NAME NOT LIKE 'dt_%'
   AND ROUTINE_TYPE = 'PROCEDURE'
 
-- 6 - WHILE loop
WHILE exists (SELECT TOP 1 * FROM #storedprocedures  )
      BEGIN
       
            DECLARE @sql varchar(max)
            SELECT TOP 1 @sql=call
              FROM #storedprocedures
            DELETE      
              FROM #storedprocedures
             WHERE call=@sql
            EXEC (@SQL)
      END
DROP TABLE #storedprocedures