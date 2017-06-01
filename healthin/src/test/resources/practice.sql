-- health_member
insert into health_member 
values('java','1234','아이유','김지원','19810901','female','서울시 종로구 통인동 65 202호','01078967896','queen@naver.com','user','N');
insert into health_member
values('spring','1234','스프링','장기혁','19190505','male','서울시 종로구 계동 100 101호','01000010002','physical@daum.net','user','N');
insert into health_member
values('ajax', '1234', '자바', '김규익', '19911111', 'male', '서울시 강남구 개포동', '01011111234', 'abcd12345@gmail.com', 'user', 'N');
insert into health_member
values('java1', '1234', '강사', '임주성', '19910101', 'male', '서울시 강남구 청담동', '01011111234', 'abcd12345@gmail.com', 'trainer', 'N');
insert into health_member 
values('healthboy','1234','헬쓰보이','근육짱','19810902','male','서울시 종로구 통인동 65 201호','01098967896','healthboy@naver.com','trainer','N');
insert into health_member 
values('user1','1234','유저1','멸치','19901111','male','서울시 종로구 통인동 65 201호','01098967896','user1@naver.com','user','N');
insert into health_member 
values('user2','1234','유저2','이쑤시개','19911112','female','서울시 종로구 통인동 65 201호','01098967896','user2@naver.com','user','N');
insert into health_member 
values('user3','1234','유저3','이쑤시개2','19911112','female','서울시 종로구 통인동 65 201호','01098967896','user2@naver.com','user','N');
insert into health_member 
values('healthma','1234','헬쓰마','포스짱','19790902','male','서울시 은평구 통인동 65 201호','01098900000','healthma@naver.com','trainer','N');
insert into health_member 
values('yogagirl','1234','요가걸','섹시짱','19810902','female','성남시 분당구 구미동 65 201호','01098967896','healthboy@naver.com','trainer','N');
insert into health_member 
values('sanggirl','1234','상걸','상짱','19910902','female','서울시 노원구 상계동 1259 ','01090000000','sanggirl@naver.com','trainer','N');
insert into health_member 
values('swimmingguy','1234','수영남1','수영남','19890902','male','양평군 양평읍 군청앞길','01000000010','swimmingguy@naver.com','trainer','N');
insert into health_member 
values('swimmingguy2','1234','수영남2','수영남이','19870902','male','서울특별시 용산구 용산동1가 8','01000000100','swimmingguy2@naver.com','trainer','N');
insert into health_member 
values('swimminggirl','1234','수영녀','수영녀','19900101','male','경기도 용인시 수지구 동천동 240','01000001000','swimminggirl@naver.com','trainer','N');
insert into health_member 
values('healthman6','1234','헬스맨','포스짱','19790902','male','서울시 은평구 통인동 65 201호','01098900000','healthma@naver.com','trainer','N');

-- health_user
insert into health_user values('java');
insert into health_user values('spring');
insert into health_user values('ajax');
insert into health_user values('user1');
insert into health_user values('user2');
insert into health_user values('user3');

--trainer
insert into trainer  
values('java1','성동구 생활체육센터 헬쓰트레이너 2년',0,'서초구','healthboy.jpg');
insert into trainer  
values('healthboy','강남구 강남체육센터 헬쓰트레이너 5년',0,'강남수','healthboy.jpg');
insert into trainer  
values('healthma','은평구 생활체육센터 헬쓰트레이너 3년',0,'은평구','healthboy.jpg');
insert into trainer  
values('yogagirl','분당구 생활체육센터 요가 2년',0,'성남시','healthboy.jpg');
insert into trainer 
values('sanggirl','노원구 Sangfitness 필라테스 6년',0,'노원구','healthboy.jpg');
insert into trainer  
values('swimmingguy','양평군 belly fitness 수영강사 5년',0,'양평군','healthboy.jpg');
insert into trainer  
values('swimmingguy2','용산구 swim gim 수영강사 7년',0,'용산구','healthboy.jpg');
insert into trainer 
values('swimminggirl','용인시 swimminggirl 수영강사 4년',0,'용인시','healthboy.jpg');
insert into trainer  
values('healthman6','은평구 생활체육센터 헬쓰트레이너 3년',0,'은평구','healthboy.jpg');


--trainer_video
insert into trainer_video(video_no,title,content,video_file,posted_date,category,trainer_id,openrank)
values (video_no_seq.nextval,'쵸파 play3','신들린 쵸파의 멋진 샷발!! 기가맥힌 쵸파입니다.','20160903.mp4',sysdate,'분류1','healthboy',0);
insert into trainer_video(video_no,title,content,video_file,posted_date,category,trainer_id,openrank)
values (video_no_seq.nextval,'쵸파 play4444','신들린 쵸파의 멋진 샷발!! 기가맥힌 쵸파입니다.','20160905.mp4',sysdate,'분류1','healthboy',0);


-- tipandqna 삽입
insert into tipandqna
values(board_no_seq.nextval,'당신도 날씬하고 건강한 몸매를 가질 수 있다!','헬스헬스헬스!!!',null,0,sysdate,'다이어트','java','tip');
insert into tipandqna
values(board_no_seq.nextval,'채소를 많이 먹으면 피부가 좋아져요~','헬스헬스헬스!!!',null,0,sysdate,'운동','java','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 1탄','헬스헬스헬스!!!',null,0,sysdate,'다이어트','healthboy','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 2탄','헬스헬스헬스!!!',null,0,sysdate,'다이어트','healthboy','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 3탄','헬스헬스헬스!!!',null,0,sysdate,'다이어트','healthboy','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트는 어떻게 하나요?','다이어트는 어떻게 하나요?',null,0,sysdate,'운동','spring','qna');
insert into tipandqna
values(board_no_seq.nextval,'초보자를 위한 운동팁','더워지는 날씨만큼 건강하고 멋진 몸을 만들기 위해 운동을 시작하는 사람들이 늘고 있습니다. 운동을 처음하는 초보자들이 건강하고 효율적으로 운동할 수 있는 팁',null,0,sysdate,'운동','java','tip');
insert into tipandqna
values(board_no_seq.nextval,'어떤 샐러드가 더 몸에 도움이 되는가?','더워지는 날씨만큼 건강하고 멋진 몸을 만들기 위해 운동을 시작하는 사람들이 늘고 있습니다. 운동을 처음하는 초보자들이 건강하고 효율적으로 운동할 수 있는 팁',null,0,sysdate,'식단','java','tip');


-- food 테스트 db
insert into food
values('공기밥', 120, '공기밥');
insert into food
values('탕수육', 350, '탕수육');
insert into food
values('치킨', 400, '치킨');

-- intake_member
delete from intake_member;
insert into intake_member values(intake_no_seq.nextval, '2017-05-09', '치킨', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-09', '탕수육', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-09', '곰국', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-11', '치킨', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-11', '공기밥', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-11', '공기밥', 1, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-30', '치킨', 1, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-25', '치킨', 3, 'user2');
insert into intake_member values(intake_no_seq.nextval, '2017-05-01', '공기밥', 2, 'user3');
insert into intake_member values(intake_no_seq.nextval, '2017-05-05', '치킨', 3, 'user3');

-- consumption_member
insert into consumption_member(consumption_no, name, ex_hour, ex_date, user_id) 
values(consumption_no_seq.nextval, '농구', 3, '2017-06-01', 'user1');
insert into consumption_member(consumption_no, name, ex_hour, ex_date, user_id) 
values(consumption_no_seq.nextval, '야구', 2, '2017-06-01', 'user1');


-- 일일 총 칼로리 섭취량
select sum(f.calorie*im.count) as totalCalorie from food f, intake_member im, health_user hu
where im.user_id = hu.user_id and f.food_name = im.food_name and intake_date = '2017-05-29' and im.user_id='user1';
-- 월 총 칼로리 섭취량
select distinct to_char(intake_date, 'YYYY-MM-DD') as intakeDate
from food f, intake_member im, health_user hu
where im.user_id = hu.user_id and f.food_name = im.food_name and im.user_id = 'user1';
-- 일일 총 칼로리 소비량
select sum(e.calorie*cm.ex_hour) as totalCalorie from exercise e, consumption_member cm, health_user hu
where cm.user_id = hu.user_id and e.name = cm.name and ex_date = '2017-06-01' and cm.user_id='user1';


--physical_info 
select * from physical_info;
insert into physical_info(physical_no,height,weight,today,user_id)
values(physical_no_seq.nextval,'180','80',sysdate,'java');
insert into physical_info(physical_no,height,weight,today,user_id)
values(physical_no_seq.nextval,'190','90',sysdate,'maven');
insert into physical_info(physical_no,height,weight,today,user_id)
values(physical_no_seq.nextval,'185','100',sysdate,'spring');

