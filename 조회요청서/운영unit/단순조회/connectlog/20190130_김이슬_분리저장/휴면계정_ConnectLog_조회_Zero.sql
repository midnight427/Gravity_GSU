select AID, MAX([Date]) as Last_Login
into pubs..ConnectLog_Zero_20190130 
from
(
select AID, Date from connectZ201801..connectlog2 where  date > '2018-01-30 00:00:00.000' union all
select AID, Date from connectZ201802..connectlog2 union all
select AID, Date from connectZ201803..connectlog2 union all
select AID, Date from connectZ201804..connectlog2 union all
select AID, Date from connectZ201805..connectlog2 union all
select AID, Date from connectZ201806..connectlog2 union all
select AID, Date from connectZ201807..connectlog2 union all
select AID, Date from connectZ201808..connectlog2 union all
select AID, Date from connectZ201809..connectlog2 union all
select AID, Date from connectZ201810..connectlog2 union all
select AID, Date from connectZ201811..connectlog2 union all
select AID, Date from connectZ201812..connectlog2 union all

select AID, Date from connectZ201901..connectlog2 union all

select AID, Date from [GLOBALINFO_ZERO].ConnectLog_Z.dbo.connectlog2) B

group by AID
order by AID
