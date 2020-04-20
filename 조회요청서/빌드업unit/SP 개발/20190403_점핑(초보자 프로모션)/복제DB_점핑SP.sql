USE [STATE]
GO
/****** Object:  StoredProcedure [dbo].[usp_JumPingChar_IsValid_Ver7]    Script Date: 03/21/2019 09:17:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
CREATE PROCEDURE [dbo].[usp_JumPingChar_IsValid_Ver7]  
@AID INT,  
@svrName varchar(30),  
@JobID INT,
@Sex INT,
@DI varchar(500),
@Result INT OUTPUT,  
@Result_GID INT OUTPUT  
AS  
DECLARE @GMgid INT  
DECLARE @CDI varchar(500)  
DECLARE @JobName varchar(20)  
DECLARE @RandomName varchar(10)  
DECLARE @ChaName varchar(30)  

select @CDI = DI from STATE.dbo.TB_JumPingChar_EventLog_Ver7 where DI = @DI and IsFlag = 1

SELECT @GMgid=GID, @JobName=JobName  
FROM STATE.dbo.TB_JumPingChar_Base_Ver7 WHERE svrName = @svrName AND JobID = @JobID  
  
IF @JobID IN (4060,4061,4062,4063,4064,4065,4073,4074,4075,4076,4077,4078,4079) 
 BEGIN  
  SELECT TOP 1 @RandomName=CITY FROM STATE.dbo.TB_JumPingChar_CharNameBase_Ver7    
  WHERE datalength(city) < 7 ORDER BY NEWID()  
  SET @ChaName=@RandomName+@JobName    
 END  
ELSE  
 BEGIN  
  SELECT TOP 1 @RandomName=CITY FROM STATE.dbo.TB_JumPingChar_CharNameBase_Ver7 ORDER BY NEWID()  
  SET @ChaName=@RandomName+@JobName  
 END  
  
-- 만약 게임에 접속해있으면..  
IF EXISTS (SELECT tu_AID FROM RO1_USER_REPL.dbo.t_user WHERE tu_AID = @AID)  
 BEGIN   
  SET @Result= -3 --현재 게임접속중  
 END  
ELSE  
 BEGIN  
  DECLARE @charNum SMALLINT  
  DECLARE @isGIDCnt SMALLINT  
    
  IF @svrName = 'Yggdrasil'  
   BEGIN  
    SELECT @isGIDCnt=COUNT(DISTINCT number), @charNum=MIN(number) FROM master.dbo.spt_values WHERE number between 0 and 17  
    AND number NOT IN (SELECT CharNum FROM Yggdrasil_REPL.dbo.Charinfo WHERE AID=@AID)  
   END  
  IF @svrName = 'Baphomet'  
   BEGIN  
    SELECT @isGIDCnt=COUNT(DISTINCT number), @charNum=MIN(number) FROM master.dbo.spt_values WHERE number between 0 and 17
    AND number NOT IN (SELECT CharNum FROM Baphomet_REPL.dbo.Charinfo WHERE AID=@AID)  
   END    
  IF @svrName = 'DarkLord'  
   BEGIN  
    SELECT @isGIDCnt=COUNT(DISTINCT number), @charNum=MIN(number) FROM master.dbo.spt_values WHERE number between 0 and 17
    AND number NOT IN (SELECT CharNum FROM DarkLord_REPL.dbo.Charinfo WHERE AID=@AID)  
   END    
    
  IF @isGIDCnt=18 AND @charNum=0  
   BEGIN  
    SET @Result= -4 --해당서버내 캐릭터 존재하지 않음  
   END  
  ELSE  
   IF @charNum IS NULL  
    BEGIN  
     SET @Result= -5 -- 해당 계정내 빈슬롯이 없음  
    END  
   ELSE
   IF @CDI is not null
    BEGIN  
     SET @Result= -6 -- 이미 점핑 캐릭터가 지급된 DI
    END
   ELSE   
    BEGIN  
     DECLARE @return INT  
     DECLARE @return_GID INT  
       
     IF @svrName = 'Yggdrasil'  
      EXEC Yggdrasil.[character].dbo.usp_JumpingChar_Event_Ver7 @AID,@GMgid,@charNum,@ChaName,@Sex,@return OUTPUT, @return_GID OUTPUT  
      SET @Result=@return  
      SET @Result_GID=@return_GID   
     IF @svrName = 'Baphomet'  
      EXEC Baphomet.[character].dbo.usp_JumpingChar_Event_Ver7 @AID,@GMgid,@charNum,@ChaName,@Sex,@return OUTPUT, @return_GID OUTPUT  
      SET @Result=@return  
      SET @Result_GID=@return_GID  
     IF @svrName = 'DarkLord'  
      EXEC DarkLord.[character].dbo.usp_JumpingChar_Event_Ver7 @AID,@GMgid,@charNum,@ChaName,@Sex,@return OUTPUT, @return_GID OUTPUT  
      SET @Result=@return  
      SET @Result_GID=@return_GID  
    END  
 END  
   
INSERT INTO STATE.dbo.TB_JumPingChar_EventLog_Ver7(SvrName, AID, GID, JobID, CharNum, Sex, RegDate, DI, IsFlag)  
VALUES(@svrName,@AID, @result_GID, @JobID,@charNum,@Sex, GETDATE(), @DI, @Result)  
RETURN(@Result)  
  

