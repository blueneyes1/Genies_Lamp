-- Notice
insert into genies_notice(notice_idx, notice_title, notice_content, notice_date)
values ( genies_notice_seq.nextval, 'AS문의', 'AS보장 기간은 주문일로 부터 1년을 기준으로 무상 AS가 됩니다. 단, 제품부품의 경우는 부속품 교체를 진행하며 상품 및 경우에 따라 불량제품을 회수하여 AS가 진행 될수 있습니다. (설치 AS부분은 불가하오니 이점 양해 부탁 드립니다.)', sysdate);

insert into genies_notice(notice_idx, notice_title, notice_content, notice_date)
values ( genies_notice_seq.nextval, '결제취소 처리기간', '카드와 실시간 계좌이체의 취소를 원하시는 경우 승인사의 승인을 거쳐 처리가 되므로 처리기간은 영업일 기준 약 3-7일 정도 소요 되고 있으며, 무통장 입금의 경우에는 영업일 기준 1-2일 이내 처리되므로 이점 양해 부탁드립니다.', sysdate);

insert into genies_notice(notice_idx, notice_title, notice_content, notice_date)
values ( genies_notice_seq.nextval, '설치 문의', '상품구매 혹은 구매 후에 설치기사님 요청을 하시면 연결해 드립니다. 날짜 조정과 견적은 기사님과 상의 후 진행 하시면 됩니다. 설치 완료 후 방문하신 기사님께 설치비용을 지불해주시면 됩니다.', sysdate);

insert into genies_notice(notice_idx, notice_title, notice_content, notice_date)
values ( genies_notice_seq.nextval, '배송 기간', '평일 오후 2시 이전 결제 완료된 상품의 경우 당일 출고 가능하며(일부품목/주문품제외) 택배사 지연이 없을 경우 1-2일 정도 소요됩니다. 간혹 공휴일/택배사의 물류 상황에 따라 지연이 될수 있으니 미리 참고하시고 주문 부탁드립니다.', sysdate);

insert into genies_notice(notice_idx, notice_title, notice_content, notice_date)
values ( genies_notice_seq.nextval, '전구색상 가이드', '전구색, 주백색, 주광색 순으로 주황빛에서 점차 하얀 빛으로 밝아 집니다. ', sysdate);

insert into genies_notice(notice_idx, notice_title, notice_content, notice_date)
values ( genies_notice_seq.nextval, '지니의 램프 쇼룸', '매장을 직접 방문하시면 거실, 방, 외관조명, 사무실, 카페등 다양한 공간에 어울리는 아름다운 조명들을 한공간에서 직접 불을 켜고 만져볼 수 있으며, 원하시는 경우 전문가의 컨설팅도 함께 받을수 있습니다.', sysdate);

-- FAQ
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


-- 스탠드등
insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드등', '큐브 미드센추리 스텐드', 'Genie origins', '블랙', '28900', '17', '/upload/2022222115456166.JPG', '전구가 자연스럽게 노출되어 전구 선택에 따른 비비드, 심플, 미니멀, 미드센추리 모던 까지 트렌드의 모든 키워드를 담은 스탠드 조명으로 감각적인 연출이 가능한 인테리어 스탠드 입니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드등', 'LED 오로라 우주비행사 무드등', 'Genie origins', '화이트', '24500', '22', '/upload/20222220135853.JPG', '리모컨으로 변화 속도와 밝기를 손 쉽게 전환할 수 있는 우주비행사 무드등과 함께 방안을 우주의 오로라로 수놓아 보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1, product_content, product_date)
values (genies_product_seq.nextval, '스탠드등', 'LED 태양광 반딧불 정원등', 'Genie origins', '옐로우', '6300', '14', '/upload/2022222093558.JPG', '태양광 전지 패널이 붙어 있어 태양광을 이용해 충전되며 어두운곳에서 센서가 작동하여 마치 병속에 담아둔 반딧불 처럼 반짝이는 분위기를 연출할 수 있습니다. 주거공간, 상업공간 등의 정원등, 무드등으로 추천드립니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드등', '카르텔 무선 배터리 램프', 'Genie origins', '화이트', '39800', '12', '/upload/202222201545917.JPG', '크리스탈 형태의 갓에서 퍼져 나오는 매혹적인 빛 그림자가 공간을 밝혀주며 USB충전형 무선 타입으로 휴대성까지 높은 카르텔 무선 배터리 램프를 이용해, 감각적인 무드를 연출해보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '스탠드등', '오프리시 공기청정 단스탠드', 'Genie origins', '골드', '263900', '19', '/upload/202222202530402.JPG', '쾌적한 일상을 위한 필수품이 되어버린 공기청정기에 시각적 쾌적함을 챙긴 오프리시 공기청정 단스탠드로 공기와 인테리어를 모두 잡아보세요.',  sysdate);

-- 레일등
insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '레일등', '모더니크 레일조명 3구 세트', 'Genie origins', '블랙골드', '145000', '17', '/upload/202222385352611.JPG', '시크하고 모던한 분위기를 살린 블랙 베이스의 심플한 디자인의 원통형 레일등입니다. 단조로울수 있는 바디 하단과 자유봉은 따듯한 느낌의 골드 빛으로 포인트를 주었습니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '레일등', '마이티 레일조명 4구 세트', 'Genie origins', '화이트', '50000', '14', '/upload/20222239133209.JPG', '점등시 타공사이로 퍼져나오는 빛이 포인트인 마이티 레일조명은 우아한 미니멀리즘의 화이트색상을 채용한 레일등 입니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '레일등', '데몽 레일조명 3구 세트', 'Genie origins', '블랙', '44000', '21', '/upload/20222239717289.JPG', '유니크하면서도 볼륨감 넘치는 디자인으로 스틸와이어 바디속 부드럽게 퍼지는 빛은 공간 깊숙히 스며들어 특별한 무드를 선사합니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '레일등', '코퍼 레일조명 4구 세트', 'Genie origins', '코퍼', '76000', '13', '/upload/202222391113921.JPG', '트렌디한 유광 코퍼 컬러의 글로시한 매력을 가진 코퍼 레일등을 통해 공간에 우아한 포인트를 추가해 보세요. ',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '레일등', '폴디 레일조명 5구 세트', 'Genie origins', '화이트', '241500', '16', '/upload/202222391510793.JPG', '심플하면서도 깔끔한 디자인에 공간의 분위기를 손쉽게 바꿔주는 실용적이면서 스타일리쉬한 폴디와 함께 세련되고 근사한 공간을 완성해보세요. ',  sysdate);

-- 천장등
insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '천장등', '아루스 천장등', 'Genie origins', '화이트', '104000', '19', '/upload/202222395932480.JPG', '세개의 각기 다른 사이즈와 형태의 원이 연결된 디자인으로 조명의 역할뿐 아니라 오브제로도 손색없는 유니크한 디자인으로 공간의 매력을 한단계 업그레이드 해보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '천장등', '아르엘 천장등', 'Genie origins', '화이트골드', '148900', '17', '/upload/202222310451625.JPG', '무채색의 평범한 쉐입의 조명으론 아쉬우셨다면, 깔끔한 화이트 컬러 원형 프레임에 골드 컬러 곡선 프레임이 어우러진 아르엘을 이용해 개성과 깔끔함을 모두 연출해보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '천장등', '모드제 천장등', 'Genie origins', '블랙앤화이트', '129000', '16', '/upload/202222310948254.JPG', '모서리가 둥근 사각형들이 선과 면으로 어우러져 깔끔하면서도 편안한 분위기를 선사하며 블랙과 화이트의 색상 으로 모던함과 세련됨을 모두 챙긴 모드제 천장등을 골라보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '천장등', '로이나 천장등', 'Genie origins', '화이트', '59000', '15', '/upload/2022223101516860.JPG', '다른 곳에서 쉽게 볼 수 없는 개성 넘치는 디자인으로 공간의 분위기를 바꾸고 싶다면, 입체적으로 제작해 공간에 색다른 느낌을 주는 것은 물론 예술적 감각과 볼륨감까지 선사하는 천장등입니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '천장등', '오르간 천장등', 'Genie origins', '실버', '245000', '22', '/upload/2022223101936346.JPG', '슬림한 디자인이 공간을 넓어 보이도록 도와주고, 건반을 배열해 놓은 듯한 디자인이 공간에 리듬감을 주는 조명입니다. 스틸과 아크릴 소재의 조화로 모던한 고급스러움을 느껴보세요.',  sysdate);

-- 벽등
insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '벽등', '오벨르 엔틱 벽등', 'Genie origins', '크리스탈', '45000', '18', '/upload/20222239281217.JPG', '어릴적 읽었던 동화 속 장면에서 본듯한, 엔틱한 감성의 크리스탈 소재와 브론즈 컬러 조합의 디자인이 공간에 과하지 않은 우아한 분위기를 물들여, 엔틱한 분위기를 줍니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '벽등', '샤롯 인테리어 벽등', 'Genie origins', '골드', '64000', '12', '/upload/202222393811626.JPG', '고급스러운 호텔과 같이 럭셔리한 골드 컬러와 찰랑거리는 크리스탈 조각들이 만나 밋밋했던 벽에 빛나는 아름다움을 연출할 수 있습니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '벽등', '크로쉐 벽시계 조명', 'Genie origins', '블랙', '75000', '16', '/upload/202222393915731.JPG', '시계와 조명이 만나 낮에는 인테리어 감성 시계로 밤에는 무드등으로 사용이 가능해 더 효율적인 인테리어 벽시계 조명입니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '벽등', '레이턴 인테리어 벽등', 'Genie origins', '화이트', '49000', '19', '/upload/202222394738593.JPG', '다소 심심한 공간 때문에 고민이라면 비어있는 벽면에 독특한 입체감을 불어 넣어 갤러리 같은 공간을 완성해주는 레이턴 인테리어 벽등을 소개합니다.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '벽등', '큐브 인테리어 벽등', 'Genie origins', '우든', '30000', '14', '/upload/202222395215752.JPG', '집안에 숨어 있거나 사용하지 않아 무심코 잊혀진 공간을, 심플한 원목 받침위에 큐브의 유리갓을 통해 흘러나오는 부드럽고 은은한 빛으로 채워 보세요.',  sysdate);

insert into genies_product(product_idx, product_type,  product_name, product_brand, product_color, product_price, product_count, product_img1,product_content, product_date)
values (genies_product_seq.nextval, '벽등', '웨이브 인테리어 벽등', 'Genie origins', '화이트', '55000', '23', '/upload/2022224112229433.JPG', '자연스러운 곡선으로 평면적인 벽에 부드러운 분위기를 추가할 수 있습니다. 모던하고 깔끔한 화이트 색상의 웨이브 인테리어 벽등을 통해 편안함을 연출할 수 있습니다.',  sysdate);
