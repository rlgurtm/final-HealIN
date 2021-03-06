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
drop sequence consumption_no_seq;
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
	constraint member_fk_comment references health_member(id)
)
alter table health_comment add constraint qna_fk_board foreign key (board_no) 
references tipandqna(board_no) on delete cascade

-- 매칭 테이블
drop table matching;
create table matching(
	user_id varchar2(100) not null,
	trainer_id varchar2(100) not null,
	apply_result char(1) default('N'),
	accept_result char(1) default('N'),
	matching_date date,
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
	send_id varchar2(100) not null,
	receive_id varchar2(100) not null,
	content clob not null,
	posted_date date not null,
	hits number default 0,
	primary key(mentoring_no),
	constraint send_id_fk_mentoring foreign key(send_id) references health_member(id),
	constraint receive_id_fk_mentoring foreign key(receive_id) references health_member(id)
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
	count number default 0,
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
	period number not null,
	constraint fk_pay_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_pay_trainer_id foreign key(trainer_id) references trainer(trainer_id)
);

-- 결제 시퀀스 
drop sequence pay_no_seq;
create sequence pay_no_seq;

--강사 평가 테이블 
drop table trainer_rate;
create table trainer_rate(
	rate_no number not null,
	user_id varchar2(100),
	trainer_id varchar2(100),
	rate number default 0,
	content clob not null,
	rate_date date not null,
	primary key(rate_no, user_id,trainer_id),
	constraint fk_rate_rate_no foreign key(rate_no) references pay(pay_no),
	constraint fk_rate_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_rate_trainer_id foreign key(trainer_id) references trainer(trainer_id)
);


-- 강사 동영상
drop sequence video_no_seq;
create sequence video_no_seq;
drop table trainer_video
create table trainer_video(
   video_no number primary key, 
   title varchar2(100) not null, 
   content clob not null, 
   video_file varchar2(100) not null, 
   posted_date date not null, 
   hits number default 0,
   category varchar2(100) not null,
   trainer_id varchar2(100) not null,
   CONSTRAINT fk_trainer_id   FOREIGN KEY (trainer_id)  REFERENCES trainer(trainer_id),
   openrank number not null
);

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

-- 동영상 댓글
drop sequence video_comment_no_seq;
create sequence video_comment_no_seq;
drop table video_comment
CREATE TABLE video_comment (
 video_comment_no number primary key,
 video_no number  NOT NULL,
 video_comment clob NOT NULL,
 video_comment_date date NOT NULL,
 video_comment_id VARCHAR2(25) NOT NULL,
 CONSTRAINT fk_video_no   FOREIGN KEY (video_no)  REFERENCES trainer_video(video_no),
 CONSTRAINT fk_video_comment_id   FOREIGN KEY (video_comment_id)  REFERENCES health_member(id)
);

-- 분류카데고리
drop table field_category
CREATE TABLE field_category(
field_name  VARCHAR2(50) primary key
);

-- 분류
drop table field
CREATE TABLE field(
field_name VARCHAR2(50)   NOT NULL,
id  VARCHAR2(50) NOT NULL,
field_state  VARCHAR2(50) NOT NULL,
 CONSTRAINT field_pk primary key(field_name, id),
 CONSTRAINT fk_field_name   FOREIGN KEY (field_name)  REFERENCES field_category(field_name),
 CONSTRAINT fk_field_id   FOREIGN KEY (id)  REFERENCES health_member(id)
);
