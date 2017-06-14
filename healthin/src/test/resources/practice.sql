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
values (video_no_seq.nextval,'쵸파 play3','신들린 쵸파의 멋진 샷발!! 기가맥힌 쵸파입니다.','20160903.mp4',sysdate,'팔','healthboy',0);
insert into trainer_video(video_no,title,content,video_file,posted_date,category,trainer_id,openrank)
values (video_no_seq.nextval,'쵸파 play4444','신들린 쵸파의 멋진 샷발!! 기가맥힌 쵸파입니다.','20160905.mp4',sysdate,'팔','healthboy',0);


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
insert into intake_member values(intake_no_seq.nextval, '2017-06-01', '치킨', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-09', '탕수육', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-09', '곰국', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-11', '치킨', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-11', '공기밥', 2, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-11', '공기밥', 1, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-30', '치킨', 1, 'user1');
insert into intake_member values(intake_no_seq.nextval, '2017-05-25', '치킨', 3, 'user2');
insert into intake_member values(intake_no_seq.nextval, '2017-06-01', '공기밥', 2, 'user3');
insert into intake_member values(intake_no_seq.nextval, '2017-05-05', '치킨', 3, 'user3');
insert into intake_member(intake_no, intake_date, food_name, count, user_id)
values(intake_no_seq.nextval, '2017-06-01', '치킨', 3, 'user1')
select food_name from food where food_name like '%"%'

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


--matching
insert into matching(user_id,trainer_id,apply_result,accept_result)
values('rlgurtm','lovhealth','Y','Y');
insert into matching(user_id,trainer_id,apply_result,accept_result)
values('lim1','lovhealth','Y','Y');
insert into matching(user_id,trainer_id,apply_result,accept_result)
values('java','healthboy','Y','Y');
insert into matching(user_id,trainer_id,apply_result,accept_result)
values('spring','healthboy','Y','Y');
insert into matching(user_id,trainer_id,apply_result,accept_result)
values('java','swimmingguy','Y','N');
insert into matching(user_id,trainer_id,apply_result,accept_result)
values('user1','healthboy','N','Y');


--mentoring
insert into mentoring(mentoring_no,send_id,receive_id,content,posted_date)
values(mentoring_no_seq.nextval,'rlgurtm','lovhealth','안녕하세요?',sysdate);
insert into mentoring(mentoring_no,send_id,receive_id,content,posted_date)
values(mentoring_no_seq.nextval,'rlgurtm','lovhealth','반가워요?',sysdate);
insert into mentoring(mentoring_no,send_id,receive_id,content,posted_date)
values(mentoring_no_seq.nextval,'lovhealth','rlgurtm','잘부탁드립니다',sysdate);
insert into mentoring(mentoring_no,send_id,receive_id,content,posted_date)
values(mentoring_no_seq.nextval,'lovhealth','rlgurtm','안녕하세요?',sysdate);
insert into mentoring(mentoring_no,send_id,receive_id,content,posted_date)
values(mentoring_no_seq.nextval,'java','healthboy','대답이 없네요?',sysdate);
insert into mentoring(mentoring_no,send_id,receive_id,content,posted_date)
values(mentoring_no_seq.nextval,'healthboy','java','이제 봣네요?',sysdate);



select food_name from food where food_name='곰국'
select distinct food_category from food
delete from intake_member where user_id = 'user1' and intake_date = '2017-06-01'
select im.intake_no as intakeNo, f.food_name as foodName, f.calorie, im.count, f.calorie*im.count as totalCalorie 
from food f, intake_member im, health_user hu
where im.user_id = hu.user_id and f.food_name = im.food_name and intake_date = '2017-05-30' and im.user_id = 'user1'
select food_name from food where food_category = '한식'

select * 
from (select row_number() over (order by likeState desc) as rnum,a.* 
	from (select a.*,nvl(likeState,0) as likeState
		from (
			select video_no as videoNo,title,content,video_file as videoFile
			,to_char(posted_date,'YYYY.MM.DD') as postedDate,hits,category
			,trainer_id as trainerId,openrank 
			from trainer_video 
			where openrank<9) a
			,(
			select video_no,sum(like_state) as likeState 
			from video_like group by video_no) b
		where b.video_no(+)=a.videoNo) a )
where rnum between 1 and 200


select im.intake_no as intakeNo, f.food_name as foodName, f.calorie, im.count, f.calorie*im.count as totalCalorie 
 		from food f, intake_member im, health_user hu
		where im.user_id = hu.user_id and f.food_name = im.food_name and intake_no = 123
select cm.consumption_no as consumptionNo, e.name as exName, e.calorie, cm.ex_hour as exHour, e.calorie*cm.ex_hour as totalCalorie 
 		from exercise e, consumption_member cm, health_user hu
		where cm.user_id = hu.user_id and e.name = cm.name and consumption_no = 1		
select cm.consumption_no as consumptionNo, e.name as exName, e.calorie, cm.ex_hour as exHour, e.calorie*cm.ex_hour*pi.weight as totalCalorie 
 		from exercise e, consumption_member cm, health_user hu, physical_info pi
		where cm.user_id = hu.user_id and cm.user_id = pi.user_id and e.name = cm.name and ex_date = '2017-06-01' and cm.user_id = 'user1'

select sum(f.calorie*im.count) as totalCalorie from food f, intake_member im, health_user hu
where im.user_id = hu.user_id and f.food_name = im.food_name and im.user_id = 'user1' and im.intake_date like '%06%' and im.intake_date like '%30%' 

select pi.rnum, cm.consumption_no as consumptionNo, e.name as exName, e.calorie, cm.ex_hour as exHour, (e.calorie*cm.ex_hour*pi.weight) as totalCalorie 
from(select p.physical_no, row_number() over(order by physical_no desc) rnum, p.weight from physical_info p, health_user h where p.user_id = h.user_id) pi, exercise e, consumption_member cm, health_user hu
where cm.user_id = hu.user_id and e.name = cm.name and cm.ex_date = '2017-06-06' and cm.user_id = 'user1' and pi.rnum = 1

--select row_number() over(order by board_no desc) rnum
-- 칼로리 섭취가 있는 날짜 출력
select tmp.rnum, distinct to_number(to_char(im.intake_date, 'YYYYMMDD')) as intakeDate
from(select im.intake_no, im.intake_date, row_number() over(order by intake_no desc) rnum from intake_member im, health_user hu where im.user_id = hu.user_id) tmp, food f, intake_member im, health_user hu
where f.food_name = im.food_name and im.user_id = 'user1' 
-- 해당 날짜에 총 섭취한 칼로리 양 출력
select sum(f.calorie*im.count) as totalCalorie from food f, intake_member im, health_user hu
where im.user_id = hu.user_id and f.food_name = im.food_name and intake_date = #{date} and im.user_id = #{id}
-- 칼로리 소모가 있는 날짜 출력
select distinct to_char(ex_date, 'YYYY-MM-DD') as exerciseDate
from exercise e, consumption_member cm, health_user hu
where cm.user_id = hu.user_id and e.name = cm.name and cm.user_id = #{value}
-- 해당 날짜에 총 소모한 칼로리 양 출력
select sum(e.calorie*cm.ex_hour*pi.weight) as totalCalorie from exercise e, consumption_member cm, health_user hu, physical_info pi
where cm.user_id = hu.user_id and hu.user_id = pi.user_id and e.name = cm.name and ex_date = #{date} and cm.user_id = #{id}

select * from TRAINER
select * from physical_info

select im.intake_no as intakeNo, f.food_name as foodName, f.calorie, im.count, f.calorie*im.count as totalCalorie 
 		from food f, intake_member im, health_user hu
		where im.user_id = hu.user_id and f.food_name = im.food_name and intake_date = '2017-05-31' and im.user_id = 'user1'

		select * from CONSUMPTION_MEMBER
select * from HEALTH_MEMBER
select * from TRAINER
update HEALTH_MEMBER set is_trainer='user' where id='gogo'

select a.* from
(select row_number() over(order by board_no desc) rnum,t.board_no as no,t.title,t.hits,t.content,
to_char(t.posted_date,'YYYY.MM.DD') as postedDate,t.category,t.id,t.tipqna,m.name
from tipandqna t,health_member m
where t.id=m.id and t.tipqna='tip' and  
t.category like '%' || '운' ||'%' or
t.title like '%' || '몸' ||'%' or
t.id like '%' || 'j' ||'%' or
t.content like '%' || 'j' ||'%' 
) a 
where rnum between 1 and 5



		select a.* from
		(select row_number() over(order by board_no desc) rnum,t.board_no as
		no,t.title,t.hits,t.content,
		to_char(t.posted_date,'YYYY.MM.DD') as postedDate,t.category,t.id,t.tipqna,m.name,
		(select count(*)from health_comment where board_no=t.board_no )as
		commentCount
		from tipandqna t,health_member m
		where t.id=m.id and t.tipqna='ptqna') a
		where rnum between 1 and 2
		and category like '%' || '다' ||'%' or
		title like '%' ||  '다'  ||'%' or
		id like '%' ||  '다'  ||'%' or
		content like '%' ||  '다'  ||'%'




select p.*
 		from(select row_number() over(order by physical_no desc) as rnum,
 				physical_no,height,weight,to_char(today,'YYYY-MM-DD') as today,user_id
 				from physical_info
 				) p
 		where b.user_id = p.user_id and between 1 and 5
 		order by physical_no desc;
 		
 		select * from physical_info 
 		where user_id='user1'

 		insert into tipandqna
values(board_no_seq.nextval,'다이어트는 어떻게 하나요??????????????????????????????????????????????????','다이어트는 어떻게 하나요?',null,0,sysdate,'운동','spring','ptqna');
insert into tipandqna
values(board_no_seq.nextval,'다이어트는 어떻게 하나요?','다이어트는 어떻게 하나요?',null,0,sysdate,'운동','spring','ptqna');
 select a.* from
		(select row_number() over(order by board_no desc) rnum, t.board_no as no, t.title, t.hits,
		to_char(t.posted_date, 'YYYY.MM.DD') as postedDate, t.category, t.id, t.tipqna, m.name,
		(select count(*)from health_comment where board_no = t.board_no) as commentCount
		from tipandqna t, health_member m
		where t.id = m.id and t.tipqna = 'ptqna') a 
		where rnum between 1 and 10
		

		
select pi.rnum, cm.consumption_no as consumptionNo, e.name as exName,
		e.calorie, cm.ex_hour as exHour, (e.calorie*cm.ex_hour*pi.weight) as totalCalorie
		from(select p.physical_no, row_number() over(order by physical_no desc) rnum,
		p.weight from physical_info p, health_user h where p.user_id = h.user_id) pi, 
		exercise e, consumption_member cm, health_user hu
		where cm.user_id = hu.user_id and e.name = cm.name and cm.ex_date = '2017-06-10'
		and cm.user_id = 'lim1' and pi.rnum = 1
		
select sum(e.calorie*cm.ex_hour*pi.weight) as totalCalorie from
		exercise e, consumption_member cm, (select p.weight, row_number() over(order by physical_no desc)
		rnum from physical_info p, health_user hu where p.user_id = hu.user_id)
		pi where e.name = cm.name and pi.rnum = 1
		and ex_date = '2017-06-10' and cm.user_id = 'lim1'

insert into health_member 
values('healthman7','1234','헬스맨','포스짱','19790902','male','서울시 은평구 통인동 65 201호','01098900000','healthma@naver.com','trainer','N');
insert into trainer  
values('healthman7','은평구 생활체육센터 헬쓰트레이너 3년',0,'은평구','트레이너2.jpg');

update trainer set trainer_photo = '트레이너2.jpg' where trainer_id = 'healthboy'

select sum(e.calorie*cm.ex_hour*pi.weight) as totalCalorie from exercise e,
		consumption_member cm, (select p.weight, row_number() over(order by physical_no desc) rnum from physical_info p, health_user hu where p.user_id = hu.user_id) pi
		where e.name = cm.name  and pi.rnum = 1
		and ex_date = '2017-06-10' and cm.user_id ='user1'
		
		
select pi.rnum, cm.consumption_no as consumptionNo, e.name as exName,
		e.calorie, cm.ex_hour as exHour, (e.calorie*cm.ex_hour*pi.weight) as totalCalorie
		from(select p.physical_no, row_number() over(order by physical_no desc) rnum,
		p.weight from physical_info p, health_user h where p.user_id = h.user_id) pi, 
		exercise e, consumption_member cm, health_user hu
		where cm.user_id = hu.user_id and e.name = cm.name and cm.ex_date = '2017-06-10'
		and cm.user_id = 'user1' and pi.rnum = 1
		
select e.calorie,cm.ex_hour,pi.weight as totalCalorie from exercise e,
		consumption_member cm, physical_info pi
		where e.name = cm.name and pi.user_id = cm.user_id
		and ex_date = '2017-06-11' and cm.user_id = 'user1'
		
select cme.ex_hour,cme.calorie,p.weight
from
   (select cm.consumption_no,cm.name,cm.ex_hour,cm.ex_date,cm.user_id
      ,e.calorie 
   from (select consumption_no,name,ex_hour,ex_date,user_id 
   from consumption_member) cm,
   (select calorie, name from exercise) e
   where cm.name=e.name and ex_date='2017-06-10') cme, 

   (select a.* from
   (select row_number() over(order by physical_no desc) rnum,weight,user_id,today
   from physical_info
   where today = '2017-06-10') a
   where rnum=1 ) p
   where cme.user_id=p.user_id and p.user_id = 'user1'
   
    update trainer set trainer_photo = '트레이너2.jpg' where trainer_id = 'healthboy'
              
              
       select a.* from 
       (select row_number() over(order by name desc) rnum,
       id,name,location,career,rank,trainer_photo
       from trainer t,health_member m
       where t.trainer_id=m.id) a 
       where id like '%' ||'s' ||'%'

       
select r.* from(
	select row_number() over(order by pay_no desc) rnum, p.pay_no, hu.user_id
	from pay p, health_user hu, trainer t
	where p.user_id = hu.user_id and p.trainer_id = t.trainer_id and hu.user_id = 'user1'
) r
where rnum between 1 and 5 order by rnum asc

select a.* from
  (select row_number() over(order by pay_no desc) rnum,t.board_no as no,t.title,t.hits,
  to_char(t.posted_date,'YYYY.MM.DD') as postedDate,t.category,t.id,t.tipqna,m.name,
  (select count(*)from health_comment where board_no=t.board_no )as commentCount,m.nickname
  from tipandqna t,health_member m
  where t.id=m.id and t.tipqna='tip') a 
where rnum between #{startRowNumber} and #{endRowNumber}

select count(*) from pay p, health_user hu where p.user_id=hu.user_id and hu.user_id ='user1'

select r.* from(
	select row_number() over(order by pay_no desc) rnum, 
	p.pay_no as payNo, p.user_id as userId, p.price, p.pay_date as payDate, p.pay_state as payState, p.period, p.trainer_id as trainerId
	from pay p, health_user hu, trainer t
	where p.user_id = hu.user_id and p.trainer_id = t.trainer_id and hu.user_id = 'user1'
) r
where rnum between 1 and 6 order by rnum asc