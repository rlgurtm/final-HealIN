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
	

	


































