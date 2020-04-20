
select AID, MAX([login]) as Last_Login
into pubs..ConnectLog_20190130
from
(
select AID, Login from connect201801..connectlog where  login > '2018-01-30 00:00:00.000' union all
select AID, Login from connect201802..connectlog union all
select AID, Login from connect201803..connectlog union all
select AID, Login from connect201804..connectlog union all
select AID, Login from connect201805..connectlog union all
select AID, Login from connect201806..connectlog union all
select AID, Login from connect201807..connectlog union all
select AID, Login from connect201808..connectlog union all
select AID, Login from connect201809..connectlog union all
select AID, Login from connect201810..connectlog union all
select AID, Login from connect201811..connectlog union all
select AID, Login from connect201812..connectlog union all

select AID, Login from connect201901..connectlog union all

select AID, Login from [GLOBALINFO].[ConnectLog].[dbo].[connectLog]) B

group by AID
order by AID
