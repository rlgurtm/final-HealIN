-- 여기는 health sql문을 쓸 수 있습니다

-- 전체 drop
drop table consumption_member;
drop table exercise;
drop table physical_info;
drop table intake_member;
drop table food;
drop table matching;
drop table following;
drop table mentoring;
drop table pay;
drop table trainer_rate;
drop table field;
drop table field_category;
drop table video_comment;
drop table video_like;
drop table trainer_video;
drop table health_user;
drop table trainer;
drop table health_comment;
drop table tipandqna;
drop table health_member;

drop sequence board_no_seq;
drop sequence comment_no_seq;
drop sequence mentoring_no_seq;
drop sequence consumpton_no_seq;
drop sequence physical_no_seq;
drop sequence intake_no_seq;
drop sequence pay_no_seq;
drop sequence video_no_seq;


-- 회원 테이블
drop table health_member;
create table health_member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	nickname varchar2(100) not null,
	name varchar2(100) not null,
	birthdate varchar2(100) not null, 
	gender varchar2(100) not null,
	address varchar2(100) not null,
	tel varchar2(100) not null,
	e_mail varchar2(100) not null,
	is_trainer varchar2(100) not null,
	withdrawal char(1) default('N')
)

-- 사용자 테이블
drop table health_user;
create table health_user(
	user_id varchar2(100) primary key 
	constraint member_fk references health_member(id)
)

-- 강사 테이블
drop table trainer;
create table trainer(
	trainer_id varchar2(100) primary key 
	constraint member_fk_trainer references health_member(id),
	career clob not null,
	rank number default 0,
	location varchar2(100) not null,
	trainer_photo varchar2(100) not null
)

select * from health_member;
select * from health_user;
select * from trainer;

-- 게시판 테이블
drop sequence board_no_seq;
create sequence board_no_seq;
drop table tipandqna;
create table tipandqna(
	board_no number primary key,
	title varchar2(100) not null,
	content clob not null,
	attached_file varchar2(100),
	hits number default 0,
	posted_date date not null,
	category varchar2(100) not null,
	id varchar2(100) not null
	constraint member_fk_board references health_member(id),
	tipqna varchar2(100) not null
)

-- 게시판 댓글 테이블
drop sequence comment_no_seq;
create sequence comment_no_seq;
drop table health_comment;
create table health_comment(
	comment_no number primary key,
	board_no number not null,
	health_comment clob not null,
	posted_date date not null,
	id varchar2(100) not null
	constraint member_fk_comment references health_member(id),
	constraint qna_fk_board foreign key(board_no) references tipandqna(board_no)
)

-- 매칭 테이블
drop table matching;
create table matching(
	user_id varchar2(100) not null,
	trainer_id varchar2(100) not null,
	apply_result char(1) default('N'),
	accept_result char(1) default('N'),
	primary key(user_id,trainer_id),
	constraint user_id_fk_matching foreign key(user_id) references health_user(user_id),
	constraint trainer_id_fk_matching foreign key(trainer_id) references trainer(trainer_id)
)

-- 1:1 멘토링 테이블
drop sequence mentoring_no_seq;
create sequence mentoring_no_seq;
drop table mentoring;
create table mentoring(
	mentoring_no number not null,
	user_id varchar2(100) not null,
	trainer_id varchar2(100) not null,
	content clob not null,
	posted_date date not null,
	hits number default 0,
	primary key(mentoring_no,user_id,trainer_id),
	constraint user_id_fk_mentoring foreign key(user_id) references health_user(user_id),
	constraint trainer_id_fk_mentoring foreign key(trainer_id) references trainer(trainer_id)
)

-- 운동 테이블
drop table exercise;
create table exercise(
	name varchar2(100) primary key,
	calorie number not null,
	category varchar2(100) not null
);
-- 회원별 소비량 테이블
drop table consumption_member;
create table consumption_member(
	consumption_no number primary key,
	name varchar2(100) not null,
	ex_hour number not null,
	ex_date date not null,
	user_id varchar2(100) not null,
	constraint fk_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_health_name foreign key(name) references exercise(name)
);
-- 회원별 소비량 시퀀스
drop sequence consumption_no_seq;
create sequence consumption_no_seq;

--회원 체중관리 테이블
drop table physical_info;
create table physical_info(
	physical_no number primary key,
	height number not null,
	weight number not null,
	today date not null,
	user_id varchar2(100) not null,
	constraint fk_physical_user_id foreign key(user_id) references health_user(user_id)
);

--회원 체중관리 테이블 시퀀스
drop sequence physical_no_seq;
create sequence physical_no_seq;

--음식 테이블
drop table food;
create table food(
	food_name varchar2(100) primary key,
	calorie number not null,
	food_category varchar2(100) not null
);

--회원별 섭취량 테이블
drop table intake_member;
create table intake_member(
	intake_no number primary key,
	intake_date date not null,
	food_name varchar2(100) not null,
	user_id varchar2(100) not null,
	constraint fk_intake_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_intake_food_name foreign key(food_name) references food(food_name)
);
-- 회원별 섭취량 시퀀스
drop sequence intake_no_seq;
create sequence intake_no_seq;

--팔로잉 테이블
drop table following;
create table following(
	user_id varchar2(100),
	trainer_id varchar2(100),
	apply_result char(1) default('N'),
	accept_result char(1) default('N'),
	primary key (user_id, trainer_id),
	constraint fk_following_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_following_trainer_id foreign key(trainer_id) references trainer(trainer_id)
);

-- 결제 테이블
drop table pay;
create table pay(
	pay_no number primary key,
	price number not null,
	pay_date date not null,
	pay_state varchar2(100) not null,
	user_id varchar2(100) not null,
	trainer_id varchar2(100) not null,
	constraint fk_pay_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_pay_trainer_id foreign key(trainer_id) references trainer(trainer_id)
);

-- 결제 시퀀스 
drop sequence pay_no_seq;
create sequence pay_no_seq;

--강사 평가 테이블 
drop table trainer_rate;
create table trainer_rate(
	user_id varchar2(100),
	trainer_id varchar2(100),
	rate number default 0,
	content clob not null,
	rate_date date not null,
	primary key(user_id,trainer_id),
	constraint fk_rate_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_rate_trainer_id foreign key(trainer_id) references trainer(trainer_id)
);



-- 강사 동영상
drop table trainer_video
create sequence video_no_seq;
create table trainer_video(
   video_no number primary key, 
   title varchar2(100) not null, 
   content varchar2(100) not null, 
   video_file varchar2(100) not null, 
   posted_date date not null, 
   hits number default 0,
   category varchar2(100) not null,
   trainer_id varchar2(100) not null,
   CONSTRAINT fk_trainer_id   FOREIGN KEY (trainer_id)  REFERENCES trainer(trainer_id),
   openrank number not null
)
select * from trainer_video


-- 비디오 좋아요 
drop table video_like
CREATE TABLE video_like (
 id VARCHAR2(25) ,
 video_no number ,
 like_state VARCHAR2(25) NOT NULL,
 CONSTRAINT trainer_like_pk primary key(id, video_no),
 CONSTRAINT fk_trainer_like_id   FOREIGN KEY (id)  REFERENCES health_member(id),
 CONSTRAINT fk_trainer_like_video_no   FOREIGN KEY (video_no)  REFERENCES trainer_video(video_no)
);
select * from video_like

-- 동영상 댓글
drop table video_comment
CREATE TABLE video_comment (
 video_comment_no number primary key,
 video_no number  NOT NULL,
 video_comment clob NOT NULL,
 video_comment_date date NOT NULL,
 CONSTRAINT fk_video_comment_no   FOREIGN KEY (video_no)  REFERENCES trainer_video(video_no)
);
select * from video_comment

-- 분류카데고리
drop table field_category
CREATE TABLE field_category(
filed_name  VARCHAR2(50) primary key
)

-- 분류
drop table field
CREATE TABLE field(
filed_name VARCHAR2(50)   NOT NULL,
id  VARCHAR2(50) NOT NULL,
field_state  VARCHAR2(50) NOT NULL,
 CONSTRAINT field_pk primary key(filed_name, id),
 CONSTRAINT fk_filed_name   FOREIGN KEY (filed_name)  REFERENCES field_category(filed_name),
 CONSTRAINT fk_filed_id   FOREIGN KEY (id)  REFERENCES health_member(id)
)


-- 삽입: 멤버 java 임시로 박은거
insert into health_member 
values('java','1234','자바퀸','자바','19810901','female','서울시 종로구 통인동 65 202호','01078967896','queen@naver.com','user','N')
insert into health_member
values('spring','1234','스프링','스프링','19190505','male','서울시 종로구 계동 100 101호','01000010002','physical@daum.net','user','N')
insert into health_user  values('java')
insert into health_user  values('maven')
insert into health_user  values('spring')

insert into health_member 
values('healthboy','1234','헬쓰보이','근육짱','19810902','male','서울시 종로구 통인동 65 201호','01098967896','healthboy@naver.com','trainer','N');
insert into trainer  values('healthboy','성동구 생활체육센터 헬쓰트레이너 2년',0,'서초구','healthboy1.png')
insert into health_member 
values('user1','1234','유저1','멸치','19911111','male','서울시 종로구 통인동 65 201호','01098967896','user1@naver.com','user','N');
insert into health_user  values('user1')

insert into trainer_video(video_no,title,content,video_file,posted_date,category,trainer_id,openrank)
values (video_no_seq.nextval,'쵸파 play3','신들린 쵸파의 멋진 샷발!! 기가맥힌 쵸파입니다.','20160903.mp4',sysdate,'분류1','healthboy',0);
insert into trainer_video(video_no,title,content,video_file,posted_date,category,trainer_id,openrank)
values (video_no_seq.nextval,'쵸파 play4444','신들린 쵸파의 멋진 샷발!! 기가맥힌 쵸파입니다.','20160905.mp4',sysdate,'분류1','healthboy',0);

select * from trainer_video
select * from health_member
select * from health_user
select * from trainer



-- 테스트용 (LJS)
insert into health_member(id, password, nickname, name, birthdate, gender, address, tel, e_mail, is_trainer, withdrawal)
values('java', '1234', '자바', '자바', '19911111', '남', '판교', '01011111234', 'abcd12345@gmail.com', 'user', 'N');
insert into health_member(id, password, nickname, name, birthdate, gender, address, tel, e_mail, is_trainer, withdrawal)
values('java1', '1234', '강사', '자바', '19910101', '남', '판교', '01011111234', 'abcd12345@gmail.com', 'trainer', 'N');

-- tipandqna 삽입

insert into tipandqna
values(board_no_seq.nextval,'당신도 날씬하고 건강한 몸매를 가질 수 있다!','헬스헬스헬스!!!','file',0,sysdate,'헬스','java','tip');
insert into tipandqna
values(board_no_seq.nextval,'채소를 많이 먹으면 피부가 좋아져요~','헬스헬스헬스!!!','file',0,sysdate,'운동','java','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 1탄','헬스헬스헬스!!!','file',0,sysdate,'헬스','healthboy','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 2탄','헬스헬스헬스!!!','file',0,sysdate,'헬스','healthboy','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트 개꿀팁! 나도 이참에 살 좀 빼보자!! 3탄','헬스헬스헬스!!!','file',0,sysdate,'헬스','healthboy','tip');
insert into tipandqna
values(board_no_seq.nextval,'다이어트는 어떻게 하나요?','다이어트는 어떻게 하나요?','file',0,sysdate,'헬스','spring','qna');
insert into tipandqna
values(board_no_seq.nextval,'초보자를 위한 운동팁','더워지는 날씨만큼 건강하고 멋진 몸을 만들기 위해 운동을 시작하는 사람들이 늘고 있습니다. 운동을 처음하는 초보자들이 건강하고 효율적으로 운동할 수 있는 팁','file',0,sysdate,'운동','java','tip');

-- trainer 테스트 db 
insert into health_member 
values('healthma','1234','헬쓰마','포스짱','19790902','male','서울시 은평구 통인동 65 201호','01098900000','healthma@naver.com','trainer','N')
insert into trainer  values('healthma','은평구 생활체육센터 헬쓰트레이너 3년',0,'은평구','healthboy2.png')

insert into health_member 
values('yogagirl','1234','요가걸','섹시짱','19810902','female','성남시 분당구 구미동 65 201호','01098967896','healthboy@naver.com','trainer','N')
insert into trainer  values('yogagirl','분당구 생활체육센터 요가 2년',0,'성남시','healthboy3.png')

insert into health_member 
values('sanggirl','1234','상걸','상짱','19910902','female','서울시 노원구 상계동 1259 ','01090000000','sanggirl@naver.com','trainer','N')
insert into trainer  values('sanggirl','노원구 Sangfitness 필라테스 6년',0,'노원구','sanggirl1.png')

-- food 테스트 db
insert into food
values('공기밥', 120, '공기밥');
insert into food
values('탕수육', 350, '탕수육');
insert into food
values('치킨', 400, '치킨');

insert into health_member 
values('swimmingguy','1234','수영남1','수영남','19890902','male','양평군 양평읍 군청앞길','01000000010','swimmingguy@naver.com','trainer','N')
insert into trainer  values('swimmingguy','양평군 belly fitness 수영강사 5년',0,'양평군','swimmingguy1.png')

insert into health_member 
values('swimmingguy2','1234','수영남2','수영남이','19870902','male','서울특별시 용산구 용산동1가 8','01000000100','swimmingguy2@naver.com','trainer','N')
insert into trainer  values('swimmingguy2','용산구 swim gim 수영강사 7년',0,'용산구','swimmingguy2.png')

insert into health_member 
values('swimminggirl','1234','수영녀','수영녀','19900101','male','경기도 용인시 수지구 동천동 240','01000001000','swimminggirl@naver.com','trainer','N')
insert into trainer  values('swimminggirl','용인시 swimminggirl 수영강사 4년',0,'용인시','swimminggirl.png')

insert into health_member 
values('healthman6','1234','헬스맨','포스짱','19790902','male','서울시 은평구 통인동 65 201호','01098900000','healthma@naver.com','trainer','N')
insert into trainer  values('healthman6','은평구 생활체육센터 헬쓰트레이너 3년',0,'은평구','healthboy2.png')

select * from TRAINER
-- intake_member 테스트 db
insert into intake_member
values(intake_no_seq.nextval, '20170529', '치킨', 'user1');
insert into intake_member
values(intake_no_seq.nextval, '20170529', '공기밥', 'user1');


--physical_info 테스트 db
select * from physical_info;
insert into physical_info(physical_no,height,weight,today,user_id)
values(physical_no_seq.nextval,'180','80',sysdate,'java');
insert into physical_info(physical_no,height,weight,today,user_id)
values(physical_no_seq.nextval,'190','90',sysdate,'maven');
insert into physical_info(physical_no,height,weight,today,user_id)
values(physical_no_seq.nextval,'185','100',sysdate,'spring')

