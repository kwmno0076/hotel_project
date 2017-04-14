--gongji.sql

--공지테이블
create table gongji(
 gongji_no number(38) 
 constraint gongji_no_pk primary key
 ,gongji_name varchar2(100) 
 constraint gongji_name_nn not null
 ,gongji_title CLOB
 constraint gongji_title_nn not null
 ,gongji_pwd varchar2(20)
 constraint gongji_pwd_nn not null
 ,gongji_cont CLOB
 constraint gongji_cont_nn not null
 ,gongji_hit number(38)
 ,gongji_date date
);

drop table gongji;

select * from gongji order by gongji_no desc;

--공지 시퀀스 생성
create sequence gongji_no_seq
start with 1
increment by 1
nocache;

select gongji_no_seq.nextval from dual;




