select table_name as name,table_comment as comment from information_schema.tables where table_schema ='DMSDB' order by table_name;

select table_name as name from all_tables where owner='DMSDB';

SHOW FULL FIELDS FROM 'SA_0131T';

select table_name from user_tables;
select * from user_tab_comments;
select t.TABLE_NAME as name,t.COMMENTS as comment from (select * from  user_tab_comments) t;

select TABLE_NAME as name,COMMENTS as comments from dba_tab_comments s where s.OWNER = 'DMSDB' AND (s.TABLE_NAME like '%SE%' OR s.TABLE_NAME like '%PT%' OR s.TABLE_NAME like '%SA%' OR s.TABLE_NAME like '%CM%');

select TABLE_NAME as name,COMMENTS as comments from dba_tab_comments s where s.OWNER = 'DMSDB';

select * from dba_tab_comments

select * from user_tab_comments;

select * from user_col_comments s where s.TABLE_NAME ='PT_0101T';
select * from user_tab_columns
select * from  user_col_comments;


select TABLE_NAME as name,COMMENTS as comments from dba_tab_comments s where s.OWNER = 'DMSDB' AND s.TABLE_NAME like 'SE%'


select s.COLUMN_NAME as field,s.DATA_TYPE as type,c.COMMENTS as comments,s.NULLABLE as isnull from user_tab_columns s 
left join user_col_comments c on s.TABLE_NAME = c.TABLE_NAME and c.COLUMN_NAME = s.COLUMN_NAME
where s.TABLE_NAME = 'AAA';

select * from dba_col_comments d where d.owner='DMSDB'

select s.COLUMN_NAME as field,s.DATA_TYPE as type,c.COMMENTS as comments,s.NULLABLE as isnull from (select * from dba_tab_columns d where d.owner ='DMSDB') s 
left join (select * from dba_col_comments d where d.owner='DMSDB') c on s.TABLE_NAME = c.TABLE_NAME and c.COLUMN_NAME = s.COLUMN_NAME
where s.TABLE_NAME = 'AAA'


select TABLE_NAME as name,COMMENTS as comments from user_tab_comments 
