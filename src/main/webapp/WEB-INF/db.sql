-- 지니의 램프 - Genie's Lamp

-- 회원가입, 로그인, 로그아웃, 아이디 찾기, 
-- 비밀번호 찾기, 아이디 중복확인

drop table genies_member;
create table genies_member(
    member_idx       number(4) primary key,
    member_id      varchar2(20),
    member_pw     varchar2(20),
    member_name   varchar2(20),
    member_email   varchar2(100),
    member_email_receive   number(1),	--0: 비수신 1: 수신
    member_pw_question   number(4),
    member_pw_answer   varchar2(100),
    member_phone		varchar2(13),
    member_address		varchar2(200),
    member_birth_date      date,
    member_grade       char(1) default 'C',		-- A : 관리자, B : 직원, C : 일반고객
    member_join_date      date default sysdate
);

drop sequence genies_member_seq;
create sequence genies_member_seq;

-- 관리자계정
insert into genies_member(member_idx, member_id, member_pw, member_name, 
member_email, member_email_receive, member_pw_question, member_pw_answer, 
member_phone, member_address, member_birth_date, member_grade, member_join_date) 
values (genies_member_seq.nextval, 'Genie', '1234', 'Genie', 'test@gmail.com', 0,0,0,'010-1234-5678', 
'서울', '2022/01/01', 'A', sysdate);

select * from genies_member;


-- 공지사항   
drop table genies_notice;
create table genies_notice(
    notice_idx      number(4) primary key,
    notice_title    varchar2(100),
    notice_content  varchar2(4000),
    notice_date     date default sysdate
);

drop sequence genies_notice_seq;
create sequence genies_notice_seq;   

-- 장바구니
drop table genies_basket;
create table genies_basket(
    basket_idx      number(4) primary key,
    basket_member_id    varchar2(20),
    basket_product_idx	  number(4),
    basket_count     number(2),
    basket_price     number(8)
);

drop sequence genies_basket_seq;
create sequence genies_basket_seq;      
   
-- FAQ
drop table genies_faq;
create table genies_faq(
    faq_idx      number(4) primary key,
    faq_title    varchar2(100),
    faq_content  varchar2(2000)
);

drop sequence genies_faq_seq;
create sequence genies_faq_seq;

-- 1:1 문의 답변
drop table genies_one2one_reply;
create table genies_one2one_reply(
    one2one_reply_idx      number(4) primary key,
    one2one_reply_member_id    varchar2(20),
    one2one_reply_member_name  varchar2(20),
    one2one_reply_title			varchar2(100),
    one2one_reply_content		varchar2(2000),
    one2one_reply_date		date default sysdate
);

drop sequence genies_one2one_reply_seq;
create sequence genies_one2one_reply_seq;
   
   
-- 1:1문의
drop table genies_one2one;
create table genies_one2one(
    one2one_idx      number(4) primary key,
    one2one_member_id     varchar2(20),
    one2one_member_name    varchar2(20),
    one2one_title     varchar2(100),
    one2one_content  	varchar2(2000),
    one2one_date     date default sysdate
);

drop sequence genies_one2one_seq;
create sequence genies_one2one_seq;

-- 결제정보
drop table genies_pay;
create table genies_pay(
    pay_idx      number(4) primary key,
    pay_member_id     varchar2(20),
    pay_receiver       varchar2(20),		-- 받는사람
    pay_phone  		varchar2(13),
    pay_address 	 varchar2(200),
    pay_message     varchar2(100),
    pay_total		number(8),
    pay_delivery	number(1) default 1		-- 0:결제취소 1:배송준비 2:배송중 3:배송완료
);

drop sequence genies_pay_seq;
create sequence genies_pay_seq;

-- 제품
drop table genies_product;
create table genies_product(
    product_idx      number(4) primary key,
    product_type		varchar2(20),
    product_name     varchar2(50),
    product_brand       varchar2(50),
    product_color  		varchar2(50),
    product_price 	 number(8),		-- 가격
    product_count     number(8),	-- 수량
    product_date		date default sysdate
);
	
drop sequence genies_product_seq;
create sequence genies_product_seq;

-- 제품리뷰
drop table genies_product_review;
create table genies_product_review(
    review_idx      number(4) primary key,
    review_product_idx    number(4),
    review_member_id  		varchar2(20),
    review_title			varchar2(50),
    review_content		varchar2(1000),
    review_date		date default sysdate
);

drop sequence genies_product_review_seq;
create sequence genies_product_review_seq;

commit;


















