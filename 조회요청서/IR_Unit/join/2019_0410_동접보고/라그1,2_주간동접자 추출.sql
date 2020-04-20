
--라그1 동접자 보고


Declare @Sdate varchar(10)
Declare @Edate varchar(10)

Set @Sdate = '2018-12-27' --지난 목요일
Set @Edate = '2019-01-02' --금주 수요일 

Select B.Type, 
           sum(case when b.no = '1'  and a.country = 'Korea' then Max
                            when b.no = '2'  and a.country = 'Korea' then Avg else null end) as Korea,
           sum(case when b.no = '1'  and a.country = 'KoreaZero' then Max
                            when b.no = '2'  and a.country = 'KoreaZero' then Avg else null end) as KoreaZero,
           sum(case when b.no = '1'  and a.country = 'Philippines' then Max
                            when b.no = '2'  and a.country = 'Philippines' then Avg else null end) as Philippines,
           sum(case when b.no = '1'  and a.country = 'USA' then Max
                            when b.no = '2'  and a.country = 'USA' then Avg else null end) as USA,
           sum(case when b.no = '1'  and a.country = 'Malaysia' then Max
                            when b.no = '2'  and a.country = 'Malaysia' then Avg else null end) as Malaysia,
           sum(case when b.no = '1'  and a.country = 'China' then Max
                            when b.no = '2'  and a.country = 'China' then Avg else null end) as China,
           sum(case when b.no = '1'  and a.country = 'Europe' then Max
                            when b.no = '2'  and a.country = 'Europe' then Avg else null end) as Europe,
           sum(case when b.no = '1'  and a.country = 'Brazil' then Max
                            when b.no = '2'  and a.country = 'Brazil' then Avg else null end) as Brazil,
           sum(case when b.no = '1'  and a.country = 'Japan' then Max
                            when b.no = '2'  and a.country = 'Japan' then Avg else null end) as Japan,
           sum(case when b.no = '1'  and a.country = 'Thailand' then Max
                            when b.no = '2'  and a.country = 'Thailand' then Avg else null end) as Thailand,
           sum(case when b.no = '1'  and a.country = 'Taiwan' then Max
                            when b.no = '2'  and a.country = 'Taiwan' then Avg else null end) as Taiwan,
           sum(case when b.no = '1'  and a.country = 'TaiwanRestart' then Max
                            when b.no = '2'  and a.country = 'TaiwanRestart' then Avg else null end) as TaiwanRestart,
           sum(case when b.no = '1'  and a.country = 'India' then Max
                            when b.no = '2'  and a.country = 'India' then Avg else null end) as India,
           sum(case when b.no = '1'  and a.country = 'Indonesia' then Max
                            when b.no = '2'  and a.country = 'Indonesia' then Avg else null end) as Indonesia,
           sum(case when b.no = '1'  and a.country = 'Russia' then Max
                            when b.no = '2'  and a.country = 'Russia' then Avg else null end) as Russia,
           sum(case when b.no = '1'  and a.country = 'Vietnam' then Max
                            when b.no = '2'  and a.country = 'Vietnam' then Avg else null end) as Vietnam,
           sum(case when b.no = '1'  and a.country = 'Chile' then Max
                            when b.no = '2'  and a.country = 'Chile' then Avg else null end) as Chile,
           sum(case when b.no = '1'  and a.country = 'France' then Max
                            when b.no = '2'  and a.country = 'France' then Avg else null end) as France,
           sum(case when b.no = '1'  and a.country = 'UAE' then Max
                            when b.no = '2'  and a.country = 'UAE' then Avg else null end) as UAE
From (
		Select 'Korea' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Korea
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'KoreaZero' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_Zero_ConnectLog_Korea
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Philippines' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Philippines
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'USA' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_USA
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Malaysia' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Malaysia
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'China' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_China
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Europe' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Europe
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Brazil' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Brazil
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Japan' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Japan
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Thailand' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Thailand
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Taiwan' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Taiwan
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'TaiwanRestart' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_Restart_ConnectLog_Taiwan
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'India' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_India
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Indonesia' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Indonesia
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Russia' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Russia
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Vietnam' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Vietnam
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Chile' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Chile
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'France' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_France
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+'' 
		UNION ALL
		Select 'UAE' as Country, max(MaxConnectCount) as Max, avg(AvgConnectCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_UAE
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+'' ) A
              Cross join (Select 1 as no, 'Max' as Type Union all Select 2, 'Avg') B
Group by B.Type, B.no
Order by b.no asc





-- 라그나로크1 Unique Count (Type :Avg ) 
Select B.Type, 
           sum(case when b.no = '1'  and a.country = 'Korea' then Max
                            when b.no = '2'  and a.country = 'Korea' then Avg else null end) as Korea,
           sum(case when b.no = '1'  and a.country = 'KoreaZero' then Max
                            when b.no = '2'  and a.country = 'KoreaZero' then Avg else null end) as KoreaZero,
           sum(case when b.no = '1'  and a.country = 'Philippines' then Max
                            when b.no = '2'  and a.country = 'Philippines' then Avg else null end) as Philippines,
           sum(case when b.no = '1'  and a.country = 'USA' then Max
                            when b.no = '2'  and a.country = 'USA' then Avg else null end) as USA,
           sum(case when b.no = '1'  and a.country = 'Malaysia' then Max
                            when b.no = '2'  and a.country = 'Malaysia' then Avg else null end) as Malaysia,
           sum(case when b.no = '1'  and a.country = 'China' then Max
                            when b.no = '2'  and a.country = 'China' then Avg else null end) as China,
           sum(case when b.no = '1'  and a.country = 'Europe' then Max
                            when b.no = '2'  and a.country = 'Europe' then Avg else null end) as Europe,
           sum(case when b.no = '1'  and a.country = 'Brazil' then Max
                            when b.no = '2'  and a.country = 'Brazil' then Avg else null end) as Brazil,
           sum(case when b.no = '1'  and a.country = 'Japan' then Max
                            when b.no = '2'  and a.country = 'Japan' then Avg else null end) as Japan,
           sum(case when b.no = '1'  and a.country = 'Thailand' then Max
                            when b.no = '2'  and a.country = 'Thailand' then Avg else null end) as Thailand,
           sum(case when b.no = '1'  and a.country = 'Taiwan' then Max
                            when b.no = '2'  and a.country = 'Taiwan' then Avg else null end) as Taiwan,
           sum(case when b.no = '1'  and a.country = 'TaiwanRestart' then Max
                            when b.no = '2'  and a.country = 'TaiwanRestar' then Avg else null end) as TaiwanRestar,
           sum(case when b.no = '1'  and a.country = 'India' then Max
                            when b.no = '2'  and a.country = 'India' then Avg else null end) as India,
           sum(case when b.no = '1'  and a.country = 'Indonesia' then Max
                            when b.no = '2'  and a.country = 'Indonesia' then Avg else null end) as Indonesia,
           sum(case when b.no = '1'  and a.country = 'Russia' then Max
                            when b.no = '2'  and a.country = 'Russia' then Avg else null end) as Russia,
           sum(case when b.no = '1'  and a.country = 'Vietnam' then Max
                            when b.no = '2'  and a.country = 'Vietnam' then Avg else null end) as Vietnam,
           sum(case when b.no = '1'  and a.country = 'Chile' then Max
                            when b.no = '2'  and a.country = 'Chile' then Avg else null end) as Chile,
           sum(case when b.no = '1'  and a.country = 'France' then Max
                            when b.no = '2'  and a.country = 'France' then Avg else null end) as France,
           sum(case when b.no = '1'  and a.country = 'UAE' then Max
                            when b.no = '2'  and a.country = 'UAE' then Avg else null end) as UAE
From (
		Select 'Korea' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Korea
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'KoreaZero' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_Zero_ConnectLog_Korea
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Philippines' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Philippines
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'USA' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_USA
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Malaysia' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Malaysia
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'China' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_China
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Europe' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Europe
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Brazil' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Brazil
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Japan' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Japan
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Thailand' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Thailand
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Taiwan' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Taiwan
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'TaiwanRestart' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_Restart_ConnectLog_Taiwan
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'India' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_India
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Indonesia' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Indonesia
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'Russia' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_Russia
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+''
		UNION ALL
		Select 'France' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_France
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+'' 
		UNION ALL
		Select 'UAE' as Country, max(DailyUserCount) as Max, avg(DailyUserCount) as Avg
		from NewMISLOG.dbo.RO_ConnectLog_UAE
		Where convert(varchar(10),RegDate,120) between ''+@Sdate+'' and ''+@Edate+'' ) A
              Cross join (Select 1 as no, 'Max' as Type Union all Select 2, 'Avg') B
Group by B.Type, B.no
Order by b.no asc