-- 여기는 health sql문을 쓸 수 있습니다
-- 회원 테이블
drop table health_member;
create table health_member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	nickname varchar2(100) not null,
	name varchar2(100) not null,
	birthdate number default 0, 
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
	attached_file varchar2(100) not null,
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
drop table mentoring
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
drop sequence consumpton_no_seq;
create sequence consumption_no_seq;

--회원 체중관리 테이블
drop table physical_info;
create table physical_info(
	physical_no number primary key,
	height number not null,
	weught number not null,
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
	food_catefory varchar2(100) not null
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
	constraint fk_rate_user_id foreign key(user_id) references health_user(user_id),
	constraint fk_rate_trainer_id foreign key(trainer_id) references trainer(trainer_id)
);





















