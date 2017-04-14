
--cptomment.sql

create table ptcomment(
 pc_no number(20) constraint ptcomment_pcno_pk primary key --댓글번호
 ,pc_name varchar2(100) --댓글이름
 ,pc_cont varchar2(4000) constraint ptcomment_pccont_nn not null --댓글내용
 ,pc_date date --댓글 등록날짜
 ,pt_no number(38) not null references ptcm(pt_no)
 --cm 테이블의 cm_no필드를 주인키로 가리키고 있다. 외래키(foreign key) 설정
);

create sequence pc_no_seq
increment by 1
start with 1
nocache;

select * from ptcomment;

drop table ptcomment;
drop sequence pc_no_seq;