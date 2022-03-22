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
    product_content		varchar2(5000),  	-- 소개글
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
    review_reply_review_idx 		number(20)
);

drop sequence genies_review_reply_seq;
create sequence genies_review_reply_seq;


insert into genies_faq(faq_idx, faq_title,  faq_content)
values (genies_faq_seq.nextval, '회원가입을 해야지만 주문할수 있나요?', 
'지니의 램프는 고객님의 소중한 상품을 빠르고 정확하게 보내드리기 위해 회원가입제를 운영하고 있습니다.');

insert into genies_faq(faq_idx, faq_title,  faq_content)
values (genies_faq_seq.nextval, '아이디/비밀번호/회원정보 변경이 가능한가요?', 
'비밀번호와 회원정보는 변경 가능하나 아이디 변경은 불가합니다.
아이디 변경을 원할시 회원 탈퇴 후 재가입 해주셔야 합니다.
비밀번호 및 회원정보 변경을 원할 시[마이페이지]>[회원정보수정]에서 변경할 사항을 입력하신뒤 [회원정보수정] 버튼을 눌러 저장해주시면 됩니다.');

insert into genies_faq(faq_idx, faq_title,  faq_content)
values (genies_faq_seq.nextval, 'ID/ 비밀번호가 기억나지 않아요 찾을수 있나요?', 
'홈페이지 상단[로그인]>[아이디/비밀번호 찾기]에서 가입정보를 입력하시면 확인 가능합니다.');

insert into genies_faq(faq_idx, faq_title,  faq_content)
values (genies_faq_seq.nextval, '최저가 보상 제도는 어떤 제도인가요?', 
'지니의 램프에서 구입한 동일한 제품이 타 사이트에서 결제한 금액보다 저렴하게 판매되고 있을 경우 고객센터로 연락주시면 대조작업을 통해 동일제품 유무를 확인 후 차액을 환불해드리는 보상 제도입니다.');

insert into genies_faq(faq_idx, faq_title,  faq_content)
values (genies_faq_seq.nextval, '수령자/배송지 주소를 변경하고 싶어요.', 
'고객센터로 연락하시어 상담을 통해 발송 전 변경요청이 가능합니다.
단, 발송 후에는 변경 처리가 어려운 점 양해 부탁 드립니다.
출고 후, 고객님 사정에 의해 택배사를 통해 주소지 변경요청은 드릴수 있으나 택배비용이 착불로 청구될수 있습니다.(고객부담)');

insert into genies_faq(faq_idx, faq_title,  faq_content)
values (genies_faq_seq.nextval, '교환, 환불, AS가 가능한가요?', 
'제품 자체의 하자가 아닌 고객님 개인 사정으로 인한 요청의 경우,
주문건이 아닌 박스 기준으로 1박스당 왕복 택배비가 발생되며, 
특수 지역 및 대형 제품의 경우 비용이 추가될 수 있습니다.');


insert into genies_faq(faq_idx, faq_title,  faq_content)
values (genies_faq_seq.nextval, '일반 설치 서비스도 이용 가능한가요?', 
'네, 지니의 램프는 인테리어 공사 일정, 이사 일정 등으로 인해 조명을 먼저 받고 추후에 설치 전문가의 도움을 받을수 있는 "일반 설치 서비스"도 운영 중입니다.');

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드 등', '큐브 미드센추리 스텐드', 'Genie origins', '블랙', '28,900 원', '17', '/upload/2022222115456166.JPG', '전구가 자연스럽게 노출되어 전구 선택에 따른 비비드, 심플, 미니멀, 미드센추리 모던 까지 트렌드의 모든 키워드를 담은 스탠드 조명으로 감각적인 연출이 가능한 인테리어 스탠드 입니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드 등', 'LED 오로라 우주비행사 무드등', 'Genie origins', '화이트', '24,500 원', '22', '/upload/20222220135853.JPG', '리모컨으로 변화 속도와 밝기를 손 쉽게 전환할 수 있는 우주비행사 무드등과 함께 방안을 우주의 오로라로 수놓아 보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드 등', 'LED 태양광 반딧불 정원등', 'Genie origins', '옐로우', '6,300 원', '14', '/upload/2022222093558.JPG, '태양광 전지 패널이 붙어 있어 태양광을 이용해 충전되며 어두운 곳에서 센서가 작동하여 마치 병속에 담아둔 반딧불 처럼 반짝이는 분위기를 연출할 수 있습니다. 주거공간, 상업공간 등의 정원등, 무드등으로 추천드립니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드 등', '카르텔 무선 배터리 램프', 'Genie origins', '화이트', '39,800 원', '12', '/upload/202222201545917.JPG', '크리스탈 형태의 갓에서 퍼져 나오는 매혹적인 빛 그림자가 공간을 밝혀주며 USB충전형 무선 타입으로 휴대성까지 높은 카르텔 무선 배터리 램프를 이용해, 감각적인 무드를 연출해보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드 등', '오프리시 공기청정 단스탠드', 'Genie origins', '골드', '263,900 원', '19', '/upload/202222202530402.JPG', '쾌적한 일상을 위한 필수품이 되어버린 공기청정기에 시각적 쾌적함을 챙긴 오프리시 공기청정 단스탠드로 공기와 인테리어를 모두 잡아보세요.',  sysdate);


commit;