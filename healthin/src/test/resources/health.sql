-- 여기는 health sql문을 쓸 수 있습니다

-- 회원 테이블
drop table healthmember;
create table healthmember(
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
drop table healthuser;
create table healthuser( 
   user_id varchar2(100) primary key 
   constraint member_fk references healthmember(id)
)

-- 강사 테이블
drop table trainer;
create table trainer(
   trainer_id varchar2(100) primary key 
   constraint member_fk_trainer references healthmember(id),
   career clob not null,
   rank number default 0,
   location varchar2(100) not null,
   trainerphoto varchar2(100) not null
)

-- 강사 동영상
drop table trainer_video
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
 CONSTRAINT fk_trainer_like_id   FOREIGN KEY (id)  REFERENCES healthmember(id),
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
 CONSTRAINT fk_filed_id   FOREIGN KEY (id)  REFERENCES healthmember(id)
)



