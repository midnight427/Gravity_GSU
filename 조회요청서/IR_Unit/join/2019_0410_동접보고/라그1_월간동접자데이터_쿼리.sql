
��ó : D:\������(mis)\�¿��۾�\[���� IR ����]MonthUsercount_Brian.sql 

------------------------------------------------------------------------------------------------------------------------------------
--     ���1 ���� IR�ڷ� ���� (�� ���� ���� ������ ��)         
--     �� �� ���󺰷� ���� �Ѵް� �ְ� ���� �����ڸ� �����ϴ� ����
--     �� ��� ���� IR ���� �ڷ��� RO Peakl Concurent Users�� �ۼ�
------------------------------------------------------------------------------------------------------------------------------------
--Monthly Max MaxConnectCount
Declare @WD varchar(10)
Declare @WFD varchar(10)
Set @WFD  =  Convert(char(7), DateAdd(mm,-1,getdate()), 20)+'-01'
Set @WD =  Convert(char(7),getdate(), 20) +'-01'

select top 1(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Taiwan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as TaiwanMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_Restart_ConnectLog_Taiwan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as TaiwanRestartMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Thailand
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as ThailandMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Japan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as JapanMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_China
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as ChinaMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Philippines
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as PhilippinesMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Malaysia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as MalaysiaMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Indonesia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as IndonesiaMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Korea
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as KoreaMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_Zero_ConnectLog_Korea
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as KoreaZeroMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_USA
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as USAMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Europe
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as EuropeMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Australia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0)  as AustraliaMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Brazil
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as BrazilMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_India
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as IndiaMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Russia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as RussiaMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Vietnam
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as VietnamMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Chile
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as ChileMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_France
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as FranceMax,
(select  max(MaxConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_UAE
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and MaxConnectCount <>0) as UAEMax
from  NewMISLOG.dbo.RO_ConnectLog_UAE
------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------
--     ���1 ���� IR�ڷ� ���� (�� ���� ���� ������ ��)         
--     �� �� ���󺰷� ���� �Ѵް� ��� �����ڸ� �����ϴ� ����
--     �� ��� ���� IR ���� �ڷ��� ACU�� All_Avg��Ʈ�� �ۼ�
------------------------------------------------------------------------------------------------------------------------------------
Declare @WD varchar(10)
Declare @WFD varchar(10)
Set @WFD  =  Convert(char(7), DateAdd(mm,-1,getdate()), 20)+'-01'
Set @WD = Convert(char(7),getdate(), 20) +'-01'

select top 1(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Taiwan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Taiwanavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_Restart_ConnectLog_Taiwan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as TaiwanRestartavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Thailand
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Thailandavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Japan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Japanavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_China
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Chinaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Philippines
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Philippinesavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Malaysia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Malaysiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Indonesia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Indonesiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Korea
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Koreaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_Zero_ConnectLog_Korea
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as KoreaZeroavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_USA
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as USAavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Europe
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Europeavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Australia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0)  as Australiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Brazil
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Brazilavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_India
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Indiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Russia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Russiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Vietnam
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Vietnamavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Chile
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Chileavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_France
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Franceavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_UAE
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as UAEavg
from  NewMISLOG.dbo.RO_ConnectLog_UAE
------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------
--     ���1 ���� IR�ڷ� ���� (�� ���� �б⺰ ������ ��)         
--     �� �� ���󺰷� �������� ������ �б��� ��� �����ڸ� �����ϴ� ����
--     �� ��� ���� IR ���� �ڷ��� ACU�� �ۼ�
------------------------------------------------------------------------------------------------------------------------------------
Declare @WD varchar(10)
Declare @WFD varchar(10)
Declare @WD2 varchar(10)

Set @WFD  = Convert(char(7), DateAdd(mm,-6,getdate()), 20)+'-01'
Set @WD =  Convert(char(7), DateAdd(mm,-3,getdate()), 20) +'-01'
--Set @WFD  = Convert(char(7), DateAdd(mm,-3,getdate()), 20)+'-01'
--Set @WD =  Convert(char(7),getdate(), 20) +'-01'

select top 1 (@WFD+'~'+@WD) as [Date],

(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Japan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Japanavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Taiwan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Taiwanavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_Restart_ConnectLog_Taiwan
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as TaiwanRestartavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_Zero_ConnectLog_Korea
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Koreaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Korea
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as KoreaZeroavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Thailand
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Thailandavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_China
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Chinaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_USA
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as USAavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Chile
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as [Space],
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Philippines
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Philippinesavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Australia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0)  as Australiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Malaysia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Malaysiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Europe
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Europeavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Brazil
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Brazilavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_India
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Indiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Indonesia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Indonesiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Russia
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Russiaavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Vietnam
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Vietnamavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_Chile
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Chile,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_France
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as Franceavg,
(select  avg(AvgConnectCount)  from NewMISLOG.dbo.RO_ConnectLog_UAE
where (RegDate >=''+@WFD+'' and RegDate <''+@WD+'' ) and AvgConnectCount <>0) as UAEavg
from  NewMISLOG.dbo.RO_ConnectLog_UAE
--------------------------------------------------------------------------------------
 