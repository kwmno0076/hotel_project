
--관리자 테이블 설계
create table adminT(
  admin_no number(38)--관리자 번호
  ,admin_id varchar2(100)--관리자 아이디
  ,admin_pwd varchar2(20)--관리자 비번
  ,admin_name varchar2(50)--관리자 이름
  ,admin_date date--날짜
 );
 
 insert into adminT values(0,'admin','admin1234','관리자',sysdate);
 
 select * from adminT;
 
 drop table adminT;

/*
  HOTEL.sql
*/
 create table tbl_Hotel( --호텔 테이블 
  h_no number(38) constraint h_no_pk primary key -- 번호값

  ,h_name varchar2(20) constraint h_name_nn not null -- 성명
  ,h_phone varchar2(100) constraint h_phone_nn not null --호텔업주 번호
  ,h_title varchar2(100) constraint h_title_nn not null -- 호텔이름
  ,h_room varchar2(100) -- 방이름
  ,h_room_ok number(20) -- 방,룸 수
   ,h_price_room number(38)-- 방 금액
  ,h_option varchar2(100) -- 호텔 추가 옵션
  ,h_price_option number(38)-- 옵션 금액
  ,h_local varchar2(300) constraint h_local_nn not null -- 주소
 
  ,h_cont varchar2(4000) constraint h_cont_nn not null --내용
  ,h_file varchar2(200) --이진파일명
  ,h_hit number(38) --조회수
  ,h_date date /*등록날짜*/
 );
 
 
 
 
 delete from tbl_Hotel;
 
 
 
 drop table tbl_Hotel;
 
 select * from tbl_hotel order by h_no desc;
 

 create sequence h_no_seq
 start with 1 --1부터 시작
 increment by 1 --1씩증가 옵션
 nocache;
 
 drop sequence h_no_seq;
 
 select h_no_seq.nextval from dual;
 
 delete from Hotel where h_name;
 
 DELETE FROM Hotel;
 
 
 
 /* 호텔 예약 목록*/
 
  create table hotel_reserve(
  reserve_no number(38) primary key --예약번호
  ,reserve_Hno number(38) not null --호텔번호
  ,reserve_Name varchar2(80) not null--호텔이름
  
  ,reserve_RoomFind number(38) not null -- 호텔 구분 짓기
  
  ,reserve_UserId varchar2(20) --예약자ID
  ,reserve_UserName varchar2(40) --예약자이름(입금자명)
  
  ,reserve_Date number(30) not null--호텔예약날짜
  
  ,reserve_Night varchar2(30) --숙박일수 = 기본 1박2일
  ,reserve_Ref number(20) --예약번호묶음
  ,reserve_Addr varchar2(40) --예약자연락처
  ,reserve_Pwd varchar2(40) --예약비밀번호
  ,reserve_Price number(38) not null--결제금액
  ,reserve_Payment varchar2(20) --결제방법 ('C'카드,'B'계좌)
  ,reserve_Payname varchar2(50) --입금은행
  ,reserve_Paynum varchar2(38) --계좌번호
  ,reserve_Payok varchar2(20) --결제여부 ('Y','N','X')
  ,reserve_Regdate date --예약날짜 
 );


 drop table hotel_reserve;
 
 drop sequence hr_no_seq;

 create sequence hr_no_seq
 increment by 1
 start with 1
 nocache;

