
--comment.sql

create table comment1(
 c_no number(20) constraint comment1_cno_pk primary key --댓글번호
 ,c_name varchar2(100) --댓글이름
 ,c_cont varchar2(4000) constraint comment1_ccont_nn not null --댓글내용
 ,c_date date --댓글 등록날짜
 ,cm_no number(38) not null references cm(cm_no)
 --cm 테이블의 cm_no필드를 주인키로 가리키고 있다. 외래키(foreign key) 설정
);

create sequence c_no_seq
increment by 1
start with 1
nocache;

select * from comment1;

drop table comment1;
drop sequence c_no_seq;
