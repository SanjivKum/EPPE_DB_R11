set echo on
col filename new_value filename

select name||'-19-'||to_char(sysdate, 'yymmdd') filename from v$database;

prompt &filename
spool &filename..log

Alter session set current_schema=EPPE1;

select vrsn from db_vrsn_cntl where vrsn_rls_dt = 
(select max(vrsn_rls_dt) from db_vrsn_cntl);

@dua_data_fil_yr_0315.sql
@dua_data_fil_yr_aud_0315.sql

-- Database Version Control Update
insert into db_vrsn_cntl
(VRSN, VRSN_STUS, VRSN_RLS_DT, APLCTN_VRSN)  
values (19,'Completed',sysdate,'EPPE Release 11.0');

commit;

select vrsn, APLCTN_VRSN from db_vrsn_cntl where vrsn_rls_dt = 
(select max(vrsn_rls_dt) from db_vrsn_cntl);

spool off