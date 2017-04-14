
 create table ptcm(--자유게시판 테이블
  pt_no number(38) constraint pt_ptno_pk primary key --글번호
  ,pt_name varchar2(100) constraint pt_ptname_nn not null --작성자
  ,pt_title varchar2(300) constraint pt_pttitle_nn not null --제목
  ,pt_pwd varchar2(20) constraint pt_ptpwd_nn not null --비밀번호
  ,pt_cont varchar2(4000) constraint pt_ptcont_nn not null --내용
  ,pt_file varchar2(100) --실제 업로드 된 파일명
  ,ori_pt_file varchar2(100) --실제 업로드 되기전 원래 파일명
  ,pt_hit number(38) --조횟수
  ,pt_date date --등록날짜
 );
 
 select * from ptcm order by pt_no desc;
 
 --pt_no_seq 시퀀스 생성
 create sequence pt_no_seq
 start with 1 --0부터시작
 increment by 1 --1씩증가a
 nocache;
 
 select pt_no_seq.nextval from dual;
 
 drop table ptcm;
 drop sequence pt_no_seq;
 

 