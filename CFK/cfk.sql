create table cfk_user(
	user_id varchar(12) primary key,
	user_passwd varchar(12) not null,
	user_addr varchar(50) not null,
	user_area varchar(12) not null,
	user_tel varchar(30) not null,
	user_age int not null,
	user_name varchar(12) not null,
	user_email varchar(30) not null,
	user_gender char(1) not null,
	user_attend_date varchar(10),
	user_check_vote int
);

drop table cfk_user;

create table cfk_board(
	board_num int primary key,
	board_subject varchar(50) not null,
	board_content varchar(2000) not null,
	board_file varchar(50) not null,
	board_real_file varchar(50),
	board_thumbnail varchar(50),
	board_writer varchar(20),
	board_vote int default 0,
	board_readcount int default 0,
	board_date date	
);	
drop table cfk_board;
select * from cfk_board;

insert into cfk_board values(11,'11','11','11',NULL,NULL,'11',0,0,now());

create table cfk_reply(
	reply_num int primary key,
	reply_content varchar(2000) not null,
	reply_writer varchar(20) not null,
	reply_readcount int default 0;
	reply_date date,
	reply_board_num int not null,	--원글 번호
	reply_re_ref int not null,		--답변글 작성시 참조
	reply_re_lev int not null,		--답변글의 길이
	reply_re_seq int not null,		--답변 글의 순서
);	

select * from cfk_user;