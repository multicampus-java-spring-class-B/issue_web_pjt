drop table post;
drop table member;
drop table board;

create table member(
user_id varchar2(20) primary key,
name nvarchar2(20) not null,
pw varchar2(20) not null,
hp varchar2(20),
sex varchar2(20) not null
);

insert into member (user_id,name,pw,hp,sex) values ('abc1234', '홍길동', '2424', '01012344555', '남');
insert into member (user_id,name,pw,hp,sex) values ('adt3535', '김민석', 'ajofs3424', '01033335543', '남');
insert into member (user_id,name,pw,hp,sex) values ('uub34322', '이주리', 'qjrwo4', '01012424235', '여');
insert into member (user_id,name,pw,hp,sex) values ('111ihwg', '김지영', '23535wjrow', '01012364364', '여');
insert into member (user_id,name,pw,hp,sex) values ('9994343', '한세리', 'askdoasf', '01012754599', '여');


create table board(
board_name nvarchar2(20) primary key,
board_contents nclob
);

insert into board (board_name, board_contents) values('DUS', '미세먼지(Particulate Matter; PM)는 대기 중에 떠다니며 눈에 보이지 않을 정도로 작은  먼지를 말한다. 질산염(NO3-), 암모늄 이온(NH4+), 황산염(SO42-) 등의 이온 성분과 탄소 화합물, 금속 화합물 등으로 이루어져 있다.외국에서는 지름이 10㎛ 이하(PM 10)이면 미세먼지(부유먼지, suspended particles)라 하며 지름이 2.5㎛ 이하(PM 2.5)인 먼지, 지름이 1㎛ 이하(PM1)인 먼지로 세분화하나, 한국에서는 부유먼지를 미세먼지(PM10)로, 미세먼지를 초미세먼지(PM2.5)로 부르며, PM1 역시 초미세먼지로 분류한다.');

insert into board (board_name, board_contents) values('COR', '2019년 12월부터 중국에서 처음으로 퍼져 현재까지 전 세계에서 지속되고 있는 범유행전염병이자 사람과 동물 모두 감염되는 인수공통전염병이다.  또한 제1급감염병 신종감염병증후군의 법정감염병이다. 2019년 12월 12일 최초 보고 내용에 따르면 2019년 12월 1일 중국 후베이성 우한시에서 최초로 발생하였다.');

insert into board (board_name, board_contents) values('YOU', '광고가 아닌 순수한 리뷰인 척 제품이나 서비스를 소개하면서, 뒤로는 돈이나 반대급부를 제공받는 형식으로 이를 홍보하는 행위를 의미한다. 인터넷의 발달로 디지털 노매드형 직업이 활발해지면서 나타난 부작용으로, 주로 언론사와 기자, 유명 SNS 계정, 인터넷 방송인 유튜버, 스트리머 등, 파워 블로거 등 인플루언서(influencer)들에 의해 저질러진다.');

create table post(
post_id number(5) primary key,
title nvarchar2(80) not null,
user_id varchar2(20),
content nclob,
board_name nvarchar2(20),
view_count number(20) default 0,
wtime date default sysdate,
CONSTRAINT pst_memuser_id_fk foreign key(user_id)
REFERENCES member(user_id));

insert into post(post_id, title, user_id, content, board_name)
values('0','Test','abc1234','TEST','COR');
insert into post(post_id, title, user_id, content, board_name)
values((select nvl(max(post_id),0)+1 from post),'Test2','adt3535','TEST2','WHE');
insert into post(post_id, title, user_id, content, board_name)
values((select nvl(max(post_id),0)+1 from post),'Test3','uub34322','TEST3','DUS');
insert into post(post_id, title, user_id, content, board_name)
values((select nvl(max(post_id),0)+1 from post),'Test4','9994343','TEST4','COR');

