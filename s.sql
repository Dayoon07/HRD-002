CREATE TABLE member_2024(
	custno number(6) not null primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(1),
	city char(2)
);

select max(custno) + 1 custno from member_2024;

SELECT custno, custname, phone, address, joindate, city,
DECODE (grade, 'A', 'VIP', 'B', '일반', 'C', '직원') AS grade
FROM member_2024 order by custno asc;

insert into member_2024 values(100001, '김행복', '000-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_2024 values(100002, '이축복', '000-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_2024 values(100003, '장믿음', '000-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
insert into member_2024 values(100004, '최사랑', '000-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');
insert into member_2024 values(100005, '진평화', '000-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_2024 values(100006, '차공단', '000-1111-7777', '제주도 제주시 감나무공', '20151211', 'C', '60');

CREATE TABLE money_2024(
	custno number(6),
	saleno number(8),
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,	
	primary key(custno, saleno)
);

SELECT A.custno, A.custname,
	case when A.grade = 'A' then 'VIP'
	when A.grade = 'B' then '일반'
	when A.grade = 'C' then '직원'
	end grade, sum(B.price) price
FROM member_2024 A
join money_2024 B on A.custno = B.custno
group by A.custno, A.custname, A.grade
order by price desc;

SELECT custno, custname, DECODE(A.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, price
FROM member_2024 A, money_2024 B
WHERE A.custno = B.custno
GROUP BY A.custno, A.custname, A.grade
ORDER BY price DESC;

insert into money_2024 values(100001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_2024 values(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into money_2024 values(100001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into money_2024 values(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into money_2024 values(100002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into money_2024 values(100003, 20160006, 3000, 2, 3000, 'A003', '20160103');
insert into money_2024 values(100004, 20160007, 1000, 2, 1000, 'A001', '20160104');
insert into money_2024 values(100004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into money_2024 values(100004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into money_2024 values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

SELECT * FROM member_2024;

SELECT * FROM money_2024;

















