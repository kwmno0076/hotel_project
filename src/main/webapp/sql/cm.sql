
 create table cm(--자유게시판 테이블
  cm_no number(38) constraint cm_cmno_pk primary key --글번호
  ,cm_name varchar2(100) constraint cm_cmname_nn not null --작성자
  ,cm_title varchar2(300) constraint cm_cmtitle_nn not null --제목
  ,cm_pwd varchar2(20) constraint cm_cmpwd_nn not null --비밀번호
  ,cm_cont clob constraint cm_cmcont_nn not null --내용
  ,cm_hit number(38) --조횟수
  ,cm_date date --등록날짜
 );
 
 select * from cm order by cm_no desc;
 
 --cm_no_seq 시퀀스 생성
 create sequence cm_no_seq
 start with 1 --0부터시작
 increment by 1 --1씩증가
 nocache;
 
 select cm_no_seq.nextval from dual;
 
 drop table cm;
 
 drop sequence cm_no_seq;
 