USE [Character]
GO
/****** Object:  StoredProcedure [dbo].[usp_JumpingChar_Event_Ver7]    Script Date: 03/21/2019 09:24:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_JumpingChar_Event_Ver7]  
@AID INT,  
@GID INT,  
@CharNum TINYINT,  
@JobName varchar(30),
@Sex INT,  
@return INT OUTPUT,  
@return_GID INT OUTPUT  
AS  
  
SET XACT_ABORT ON;      
SET NOCOUNT ON;      
  
DECLARE @CharName varchar(24)  
DECLARE @R_Num varchar(4)  
  
SELECT @R_Num=LEFT(NEWID(),4)  
--숫자만 부여시 사용
--SELECT @R_Num=LEFT(abs(checksum(newid())),4)
  
--SET @CharName = CONVERT(varchar(23),@JobName+'_'+CONVERT(varchar(10),@AID-10001))  
SET @CharName = CONVERT(varchar(23),@JobName+'_'+@R_Num)  
  
IF EXISTS (SELECT GID FROM charinfo WHERE AID = @AID AND CharNum = @CharNum)      
 BEGIN      
  SET @return= -1  
  RETURN(@return)--실패(슬롯에 캐릭터 존재)  
 END      
ELSE   
 IF EXISTS (SELECT GID FROM Charinfo WHERE CharName = @CharName)      
  BEGIN      
   SET @return= -2  
   RETURN(@return)--실패(캐릭터명 존재)  
  END       
 ELSE  
  BEGIN    
   DECLARE @Identity INT  
     
   INSERT INTO Charinfo(CharName, job, clevel, sppoint, exp, jobpoint, STR, AGI, VIT, INT, DEX, LUK, hp, maxhp, sp, maxsp, AID,    --운영Unit에서 게임안에 생성 한 전승캐릭터 값 그대로 세팅 값으로 입력!!!! 
      mapname, xPos, yPos, GuildID, CharNum, speed, jobexp, virtue, honor, haircolor, joblevel, bodystate,   
      healthstate, sxPos, syPos, restartMapName, effectstate, head, weapon, accessory, headpalette, bodypalette,   
      accessory2, accessory3, shield, party_config, equipwinopen, font, robepalette, chr_slot_change, chr_name_changeCNT, sex)  
   SELECT @CharName as CharName, job, clevel, sppoint, exp, jobpoint, STR, AGI, VIT, INT, DEX, LUK, hp, maxhp,   
     sp, maxsp, @AID as AID, 'prontera.gat' as mapname, 150 as xPos, 31 as yPos, GuildID, @CharNum as CharNum, speed, jobexp, virtue, honor, haircolor, joblevel, bodystate,   
     healthstate, 116 as sxPos, 72 as syPos, 'prontera.gat' as restartMapName, effectstate, head, weapon, accessory, headpalette, bodypalette,   
     accessory2, accessory3, shield, party_config, equipwinopen, font, robepalette, chr_slot_change, 1 as chr_name_changeCNT, @Sex as sex
   FROM charinfo  
   WHERE GID = @GID  
  
   SELECT @Identity=@@IDENTITY  
  
   INSERT INTO Item(GID,equipItem)  
   SELECT  @Identity,  equipItem FROM item WHERE GID = @GID  
  
   DELETE Skill_Rebuild WHERE GID=@Identity  
     
   INSERT INTO Skill_Rebuild(GID, ID, Level, RemainMS, Attr, Data, MaxMS)  
   SELECT @Identity, ID, Level, RemainMS, Attr, Data, MaxMS FROM Skill_Rebuild WHERE GID = @GID  
     
   EXEC ItemLog.dbo.usp_ins_createCharacterLog @Identity,@AID, @CharName,0,'0.0.0.0'  
     
   SET @return= 1  
   SET @return_GID = @Identity  
   RETURN --성공  
  END  
    
SET NOCOUNT OFF;      
SET XACT_ABORT OFF; 