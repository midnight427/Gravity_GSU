
RESTORE DATABASE t1  FROM DISK = 'D:\DBBackup\character\w1\Character_db_202003310903.BAK'
WITH RECOVERY ,REPLACE, 
MOVE 'character'     TO 'd:\mdf_ldf\t1.mdf',
MOVE 'Character_Log'      TO 'd:\mdf_ldf\t1_log.ldf', replace

RESTORE DATABASE t2  FROM DISK = 'D:\DBBackup\character\w2\Character_db_202003310903.BAK'
WITH RECOVERY ,REPLACE, 
MOVE 'character_data'     TO 'd:\mdf_ldf\t2.mdf',
MOVE 'Character_Log'      TO 'd:\mdf_ldf\t2_log.ldf', replace

RESTORE DATABASE t3  FROM DISK = 'D:\DBBackup\character\w3\Character_db_202003310903.BAK'
WITH RECOVERY ,REPLACE, 
MOVE 'character_data'     TO 'd:\mdf_ldf\t3.mdf',
MOVE 'Character_Log'      TO 'd:\mdf_ldf\t3_log.ldf', replace

RESTORE DATABASE t6  FROM DISK = 'D:\DBBackup\character\w6\Character_db_202003310903.BAK'
WITH RECOVERY ,REPLACE, 
MOVE 'character'     TO 'd:\mdf_ldf\t6.mdf',
MOVE 'Character_Log'      TO 'd:\mdf_ldf\t6_log.ldf', replace

RESTORE DATABASE nlogin  FROM DISK = 'D:\DBBackup\nlogin\nlogin_db_202004070000.BAK'
WITH RECOVERY ,REPLACE, 
MOVE 'nlogin'     TO 'd:\mdf_ldf\nlogin.mdf',
MOVE 'nlogin_Log'      TO 'd:\mdf_ldf\nlogin_log.ldf', replace


--item¿‹ø©∑Æ  itemobserver∑Œ ¿‹ø©∑Æ √ﬂ√‚
use t1
select * into usercountlog..t1 from toolkit_summary where itid in(27183) 
insert usercountlog..t1 
select * from   toolkit_summary    where [SlotCardITID1] = 27183 or [SlotCardITID2] = 27183 or [SlotCardITID3] = 27183 or [SlotCardITID4] = 27183

use t2
select * into usercountlog..t2 from toolkit_summary where itid in(27183)
insert usercountlog..t2
select * from   toolkit_summary    where [SlotCardITID1] = 27183 or [SlotCardITID2] = 27183 or [SlotCardITID3] = 27183 or [SlotCardITID4] = 27183

use t3
select * into usercountlog..t3 from toolkit_summary where itid in(27183)
insert usercountlog..t3
select * from   toolkit_summary    where [SlotCardITID1] = 27183 or [SlotCardITID2] = 27183 or [SlotCardITID3] = 27183 or [SlotCardITID4] = 27183

use t6
select * into usercountlog..t6 from toolkit_summary where itid in(27183)
insert usercountlog..t6
select * from   toolkit_summary    where [SlotCardITID1] = 27183 or [SlotCardITID2] = 27183 or [SlotCardITID3] = 27183 or [SlotCardITID4] = 27183



use t1
update usercountlog..t1 set aid = b.aid from usercountlog..t1 a , charinfo b where a.Key1 = b.GID and a.RepositoryName in('cart','inventory')
update usercountlog..t1 set aid = Key1 where RepositoryName ='store'
update usercountlog..t1 set aid = b.aid from usercountlog..t1 a , guildminfo b where a.key1 = b.gdid and a.RepositoryName in('guildstore') and b.positionid=0
update usercountlog..t1 set aid = b.receiveaid , key2=b.receivegid from usercountlog..t1 a , rodex b where a.Key1  = b.MID  and a.RepositoryName in('mail')
update usercountlog..t1 set id = b.id from usercountlog..t1 a , nlogin..login b where a.aid = b.aid

use t2
update usercountlog..t2 set aid = b.aid from usercountlog..t2 a , charinfo b where a.Key1 = b.GID and a.RepositoryName in('cart','inventory')
update usercountlog..t2 set aid = Key1 where RepositoryName ='store'
update usercountlog..t2 set aid = b.aid from usercountlog..t2 a , guildminfo b where a.key1 = b.gdid and a.RepositoryName in('guildstore') and b.positionid=0
update usercountlog..t2 set aid = b.receiveaid , key2=b.receivegid from usercountlog..t2 a , rodex b where a.Key1  = b.MID  and a.RepositoryName in('mail')
update usercountlog..t2 set id = b.id from usercountlog..t2 a , nlogin..login b where a.aid = b.aid

use t3
update usercountlog..t3 set aid = b.aid from usercountlog..t3 a , charinfo b where a.Key1 = b.GID and a.RepositoryName in('cart','inventory')
update usercountlog..t3 set aid = Key1 where RepositoryName ='store'
update usercountlog..t3 set aid = b.aid from usercountlog..t3 a , guildminfo b where a.key1 = b.gdid and a.RepositoryName in('guildstore') and b.positionid=0
update usercountlog..t3 set aid = b.receiveaid , key2=b.receivegid from usercountlog..t3 a , rodex b where a.Key1  = b.MID  and a.RepositoryName in('mail')
update usercountlog..t3 set id = b.id from usercountlog..t3 a , nlogin..login b where a.aid = b.aid

use t6
update usercountlog..t6 set aid = b.aid from usercountlog..t6 a , charinfo b where a.Key1 = b.GID and a.RepositoryName in('cart','inventory')
update usercountlog..t6 set aid = Key1 where RepositoryName ='store'
update usercountlog..t6 set aid = b.aid from usercountlog..t6 a , guildminfo b where a.key1 = b.gdid and a.RepositoryName in('guildstore') and b.positionid=0
update usercountlog..t6 set aid = b.receiveaid , key2=b.receivegid from usercountlog..t6 a , rodex b where a.Key1  = b.MID  and a.RepositoryName in('mail')
update usercountlog..t6 set id = b.id from usercountlog..t6 a , nlogin..login b where a.aid = b.aid



update usercountlog..t1 set name = b.name from usercountlog..t1 a , script..viewItemList b where a.itid = b.id 
update usercountlog..t2 set name = b.name from usercountlog..t2 a , script..viewItemList b where a.itid = b.id 
update usercountlog..t3 set name = b.name from usercountlog..t3 a , script..viewItemList b where a.itid = b.id 
update usercountlog..t6 set name = b.name from usercountlog..t6 a , script..viewItemList b where a.itid = b.id 
