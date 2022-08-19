
DROP TABLE files;
DROP TABLE review;
DROP TABLE cart;
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;

DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;
DROP SEQUENCE seq_cart_cart_no;


CREATE SEQUENCE seq_product_prod_no		 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_cart_cart_no		 	INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 				VARCHAR2(20)	NOT NULL,
	user_name 				VARCHAR2(50)	NOT NULL,
	password 				VARCHAR2(10)	NOT NULL,
	role 					VARCHAR2(5) 	DEFAULT 'user',
	ssn 					VARCHAR2(13),
	cell_phone 				VARCHAR2(14),
	addr 					VARCHAR2(100),
	email 					VARCHAR2(50),
	reg_date 				DATE,
	PRIMARY KEY(user_id)
);


CREATE TABLE product ( 
	prod_no 				NUMBER 			NOT NULL,
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 			VARCHAR2(200),
	manufacture_day			VARCHAR2(8),
	price 					NUMBER(10),
	reg_date 				DATE,
	amount 					NUMBER(10),
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	tran_no 				NUMBER 			NOT NULL,
	prod_no 				NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option			CHAR(3),
	receiver_name 			VARCHAR2(20),
	receiver_phone			VARCHAR2(14),
	dlvy_addr 				VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	tran_status_code		CHAR(3),
	order_date 				DATE,
	dlvy_date 				DATE,
	amount 					NUMBER(10),
	PRIMARY KEY(tran_no)
);

CREATE TABLE cart ( 
	cart_no 				NUMBER 			NOT NULL,
	prod_no 				NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	user_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	amount 					NUMBER(10),
	PRIMARY KEY(cart_no)
);

CREATE TABLE review ( 
	tran_no 				NUMBER 			NOT NULL REFERENCES transaction(tran_no),
	prod_no 				NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	user_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	grade					NUMBER(2,1),
	detail					VARCHAR2(200),
	review_date				DATE,
	PRIMARY KEY(tran_no)
);

CREATE TABLE files ( 
	ref_key 				NUMBER(16),
	file_name				VARCHAR2(150)	NOT NULL,
	original_name			VARCHAR2(100),
	path					VARCHAR2(100),
	file_size				NUMBER,
	image_type				VARCHAR2(10),
	target					VARCHAR2(20),
	PRIMARY KEY(file_name)
);


INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           
insert into product values (seq_product_prod_no.nextval,'vaio vgn FS70B','소니 바이오 노트북 신동품','20120514',2000000, to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),5);
insert into product values (seq_product_prod_no.nextval,'자전거','자전거 좋아요~','20120514',10000, to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),10);
insert into product values (seq_product_prod_no.nextval,'보르도','최고 디자인 신품','20120201',1170000, to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),5);
insert into product values (seq_product_prod_no.nextval,'보드세트','한시즌 밖에 안썼습니다. 눈물을 머금고 내놓음 ㅠ.ㅠ','20120217', 200000, to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),5);
insert into product values (seq_product_prod_no.nextval,'인라인','좋아욥','20120819', 20000, to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),5);
insert into product values (seq_product_prod_no.nextval,'삼성센스 2G','sens 메모리 2Giga','20121121',800000, to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),5);
insert into product values (seq_product_prod_no.nextval,'연꽃','정원을 가꿔보세요','20121022',232300, to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),5);
insert into product values (seq_product_prod_no.nextval,'삼성센스','노트북','20120212',600000, to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),5);

INSERT INTO files VALUES(10000,'AHlbAAAAtBqyWAAA.jpg','AHlbAAAAtBqyWAAA.jpg','uploadFiles',0,'main','product');
INSERT INTO files VALUES(10001,'AHlbAAAAvetFNwAA.jpg','AHlbAAAAvetFNwAA.jpg','uploadFiles',0,'main','product');
INSERT INTO files VALUES(10002,'AHlbAAAAvewfegAB.jpg','AHlbAAAAvewfegAB.jpg','uploadFiles',0,'main','product');
INSERT INTO files VALUES(10003,'AHlbAAAAve1WwgAC.jpg','AHlbAAAAve1WwgAC.jpg','uploadFiles',0,'main','product');
INSERT INTO files VALUES(10004,'AHlbAAAAve37LwAD.jpg','AHlbAAAAve37LwAD.jpg','uploadFiles',0,'main','product');
INSERT INTO files VALUES(10005,'AHlbAAAAtBqyWAAB.jpg','AHlbAAAAtBqyWAAA.jpg','uploadFiles',0,'main','product');
INSERT INTO files VALUES(10006,'AHlbAAAAtDPSiQAA.jpg','AHlbAAAAtDPSiQAA.jpg','uploadFiles',0,'main','product');
INSERT INTO files VALUES(10007,'AHlbAAAAug1vsgAA.jpg','AHlbAAAAug1vsgAA.jpg','uploadFiles',0,'main','product');

commit;
