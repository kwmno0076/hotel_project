

create table zmem(
 mem_id varchar2(100) constraint m_mid_pk
 primary key
 ,mem_pwd varchar2(50) constraint m_mpwd_nn
 not null
 ,mem_name varchar2(100) constraint m_mname_nn
 not null
 ,mem_phone varchar2(50) constraint m_mph_nn
 not null
 ,mem_email varchar2(50) constraint m_email_nn
 not null	
 ,mem_date date -- 회원등록날짜
 ,mem_state number(38) --가입회원 1,탈퇴회원 2
 ,mem_deldate date --탈퇴날짜
);

select * from zmem where mem_email='12@12.12';

insert into zmem(mem_id,mem_pwd,mem_name,mem_phone,mem_email,mem_date,mem_state)values('a','1','이름','010-1234-5678','mistral1@nate.com',sysdate,1);

drop table zmem;

delete from zmem  where mem_email='mistral7@nate.com';

select * from zmem;

