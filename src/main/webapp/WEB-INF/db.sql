-- 지니의 램프 - Genie's Lamp

-- 회원가입, 로그인, 로그아웃, 아이디 찾기, 
-- 비밀번호 찾기, 아이디 중복확인

drop table genies_member;
create table genies_member(
    member_idx       number(20),
    member_id      varchar2(20) primary key,
    member_pw     varchar2(20),
    member_name    varchar2(20),
    member_email   varchar2(100),
    member_email_receive   number(1),	-- 0: 비수신 1: 수신
    member_pw_question   number(4),
    member_pw_answer   varchar2(100),
    member_phone		varchar2(13),
    member_address1		varchar2(100),		-- 우편번호
    member_address2		varchar2(100),		-- 회원주소
    member_address3		varchar2(100),		-- 회원상세주소
    member_grade       char(1) default 'C',		-- A : 관리자, B : 직원, C : 일반고객
    member_join_date      date default sysdate
);

drop sequence genies_member_seq;
create sequence genies_member_seq;

-- 관리자계정
insert into genies_member(member_idx, member_id, member_pw, member_name, 
member_email, member_email_receive, member_pw_question, member_pw_answer, 
member_phone, member_address1, member_address2, member_address3, member_grade, member_join_date) 
values (genies_member_seq.nextval, 'Genie', '1234', 'Genie', 'test@gmail.com', 0,0,0,'010-1234-5678', 
'01695', '서울 노원구 상계로 64 화랑빌딩', '7층', 'A', sysdate);

select * from genies_member;


-- 공지사항   
drop table genies_notice;
create table genies_notice(
    notice_idx      number(20) primary key,
    notice_title    varchar2(100),
    notice_content  varchar2(4000),
    notice_date     date default sysdate
);

drop sequence genies_notice_seq;
create sequence genies_notice_seq;   

-- 제품
drop table genies_product;
create table genies_product(
    product_idx      number(20) primary key,
    product_type		varchar2(20),
    product_name     varchar2(50),
    product_brand       varchar2(50),
    product_color  		varchar2(50),
    product_price 	 number(8),		-- 가격
    product_count     number(8),	-- 수량
    product_img1      varchar2(1000),
    product_content		varchar2(4000),  	-- 소개글
    product_date		date default sysdate
    
);

	
drop sequence genies_product_seq;
create sequence genies_product_seq;

-- 장바구니
drop table genies_basket;
create table genies_basket(
    basket_idx      number(20) primary key,
    basket_member_id    varchar2(20),
    basket_product_idx	  number(20),
    basket_count     number(2),
    basket_price     number(8),
    foreign key (basket_member_id)references genies_member(member_id),
    foreign key (basket_product_idx)references genies_product(product_idx)
);

drop sequence genies_basket_seq;
create sequence genies_basket_seq;      
   
-- FAQ
drop table genies_faq;
create table genies_faq(
    faq_idx      number(20) primary key,
    faq_title    varchar2(100),
    faq_content  varchar2(2000)
);

drop sequence genies_faq_seq;
create sequence genies_faq_seq;

-- 1:1문의
drop table genies_one2one;
create table genies_one2one(
    one2one_idx      number(20) primary key,
    one2one_member_id		varchar2(20),
    one2one_name     varchar2(20),
    one2one_phone    varchar2(20),
    one2one_email     varchar2(100),
    one2one_address1   varchar2(100),
    one2one_address2   varchar2(100),
    one2one_address3   varchar2(100),
    one2one_title    varchar2(100),
    one2one_content  varchar2(2000),
    one2one_date     date default sysdate,
    foreign key (one2one_member_id)references genies_member(member_id)
);

drop sequence genies_one2one_seq;
create sequence genies_one2one_seq;


-- 1:1 문의 답변
drop table genies_one2one_reply;
create table genies_one2one_reply(
    one2one_reply_idx      number(20) primary key,
    one2one_reply_one2one_idx		number(20),
    one2one_reply_member_id    varchar2(20),
    one2one_reply_member_name  varchar2(20),
    one2one_reply_title			varchar2(100),
    one2one_reply_content		varchar2(2000),
    one2one_reply_date		date default sysdate,
    foreign key (one2one_reply_one2one_idx)references genies_one2one(one2one_idx)
);

drop sequence genies_one2one_reply_seq;
create sequence genies_one2one_reply_seq;
   
   
-- 결제정보
drop table genies_pay;
create table genies_pay(
    pay_idx      number(20),
    pay_number		CHAR(12) primary key,	-- 주문 정보 식별자(날마다 시퀸스 초기화하는 프로시저 필요)
    pay_member_id     varchar2(20),
    pay_receiver       varchar2(20),		-- 받는사람
    pay_phone  		varchar2(13),
    pay_address1		varchar2(100),		-- 우편번호
    pay_address2		varchar2(100),		-- 회원주소
    pay_address3		varchar2(100),		-- 회원상세주소
    pay_message     varchar2(100),
    pay_cost		number(4),		-- 배송비
    pay_total		number(8),				-- 결제금액 ( 배송비포함 )
    pay_delivery	number(1) default '1',		-- 0:결제취소 1:배송준비 2:배송중 3:배송완료
    pay_date		date default sysdate,
    foreign key (pay_member_id)references genies_member(member_id)
);

drop sequence genies_pay_seq;
create sequence genies_pay_seq
 START WITH 1
    INCREMENT BY 1
    MAXVALUE 999;

-- 주문제품
drop table genies_order;
create table genies_order(
	order_idx		number(20) primary key,
	order_pay_number		CHAR(12),
	order_product_idx		number(20),
	order_product_name		varchar2(50),
	order_count			number(2),
	order_price			number(8),
	order_review		CHAR(1) default 'N',
	foreign key (order_pay_number)references genies_pay(pay_number),
	foreign key (order_product_idx)references genies_product(product_idx)
);

drop sequence genies_order_seq;
create sequence genies_order_seq;


-- 제품리뷰
drop table genies_product_review;
create table genies_product_review(
    review_idx      number(20) primary key,
    review_order_idx		number(20),
    review_product_idx    number(20),
    review_member_id  		varchar2(20),
    review_img		    varchar2(1000),
    review_title			varchar2(50),
    review_content		varchar2(1000),
    review_grade			char(1),
    review_date		date default sysdate,
    foreign key (review_member_id) references genies_member(member_id),
    foreign key (review_order_idx) references genies_order(order_idx)
);

drop sequence genies_product_review_seq;
create sequence genies_product_review_seq;


-- 리뷰답글
drop table genies_review_reply;
create table genies_review_reply(
    review_reply_idx       number(20) primary key,
    review_reply_content   varchar2(1000),
    review_reply_date      date default sysdate,
    review_reply_review_idx 		number(20),
	foreign key review_reply_review_idx references genies_product_review(review_idx);

drop sequence genies_review_reply_seq;
create sequence genies_review_reply_seq;

commit;