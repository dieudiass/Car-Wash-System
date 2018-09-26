
CREATE TABLE employeeService
(es_empSerID NUMBER(5),
es_serviceDate DATE,
s_serviceID VARCHAR2(3),
e_empID NUMBER(5),
CONSTRAINT employeeService_es_empSerID_pk PRIMARY KEY (es_empSerID),
CONSTRAINT service_s_serviceID_fk FOREIGN KEY REFERENCES service(s_serviceID),
CONSTRAINT employee_e_empID_fk FOREIGN KEY REFERENCES employee(e_empID));


DROP TABLE client CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE car CASCADE CONSTRAINTS;
DROP TABLE service CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE carservice CASCADE CONSTRAINTS;
DROP TABLE booking CASCADE CONSTRAINTS;
DROP SEQUENCE b_bookingID_seq ;

CREATE TABLE client
(c_clientID NUMBER(13), 
c_last VARCHAR2(30),
c_first VARCHAR2(30),
c_birthdate DATE,
c_streetName VARCHAR2(30),
c_city VARCHAR2(30),
c_state CHAR(30),
c_zip VARCHAR2(10),
c_contactNumber VARCHAR2(10),
CONSTRAINT c_clientID_pk PRIMARY KEY (c_clientID));

CREATE TABLE employee
(e_empID VARCHAR2(5), 
e_last VARCHAR2(30),
e_first VARCHAR2(30),
e_streetName VARCHAR2(30),
e_city VARCHAR2(30),
e_state CHAR(30),
e_zip VARCHAR2(10),
e_contactNumber VARCHAR2(10),
e_jobType VARCHAR2(30),
CONSTRAINT employee_e_empID_pk PRIMARY KEY (e_empID));

CREATE TABLE car
(c_carReg VARCHAR2(13),
c_model VARCHAR2(30),
c_colour VARCHAR2(30),
c_clientID NUMBER(13),
CONSTRAINT car_c_carReg_pk PRIMARY KEY (c_carReg),
CONSTRAINT c_clientID_fk FOREIGN KEY (c_clientID) REFERENCES client(c_clientID));

CREATE TABLE service(
s_serviceID VARCHAR2(10),
s_description VARCHAR2(30),
e_empID VARCHAR2(5), 
c_carReg VARCHAR2(13),
CONSTRAINT s_serviceID_pk PRIMARY KEY (s_serviceID),
CONSTRAINT e_empID_fk FOREIGN KEY (e_empID) REFERENCES employee(e_empID),
CONSTRAINT c_carReg_fk FOREIGN KEY  (c_carReg) REFERENCES car(c_carReg));

CREATE TABLE payment
(p_paymentID VARCHAR2(6),
p_paymentDate DATE,
p_paymentAmount NUMBER,
s_serviceID VARCHAR2(10),
CONSTRAINT p_paymentID_pk PRIMARY KEY (p_paymentID),
CONSTRAINT s_serviceID_fk FOREIGN KEY (s_serviceID) REFERENCES service(s_serviceID));

CREATE TABLE booking
(b_bookingID NUMBER(5),
b_bookingDate DATE,
s_serviceID VARCHAR2(3),
c_clientID NUMBER(13),
CONSTRAINT b_bookingID_pk PRIMARY KEY (b_bookingID),
CONSTRAINT s_serviceCode_fk FOREIGN KEY (s_serviceID) REFERENCES service(s_serviceID),
CONSTRAINT c_clientNum_fk FOREIGN KEY (c_clientID) REFERENCES client(c_clientID));

create table carservice(
c_carReg VARCHAR2(13),
s_serviceID VARCHAR2(10),
noOfServicePerformed number,
cs_Date  date,
CONSTRAINT c_carRegNo_fk FOREIGN KEY  (c_carReg) REFERENCES car(c_carReg),
CONSTRAINT s_serviceNo_fk FOREIGN KEY (s_serviceID) REFERENCES service(s_serviceID));


alter table carservice
modify (c_carReg VARCHAR2(13));
alter table carservice
modify (s_serviceID VARCHAR2(10));
 
alter table client
modify ( c_state CHAR(30));

alter table employee
modify ( e_state CHAR(30));

alter table car 
modify (c_carReg VARCHAR2(13));

-----Inserting into Client table---------
INSERT INTO CLIENT VALUES
(9510250852089, 'Thomas', 'John', to_date('10/25/1994', 'mm/dd/yyyy'), 'penelope Str',
'VanderbjilPark', 'Gauteng', '1619', '0119254208', 'John46', 'J1234');

INSERT INTO CLIENT VALUES
(9602140832083, 'Nkosi', 'Nqobile', to_date('02/14/1991', 'mm/dd/yyyy'), 'casandra Str',
'VanderbjilPark', 'Gauteng', '1619', '0721284751', 'nc0nco1', '987nkosi');

INSERT INTO CLIENT VALUES
(9706100845808, 'Lebese', 'Thabang', to_date('06/10/1992', 'mm/dd/yyyy'), 'conroy Str',
'Kempton Park', 'Gauteng', '1946', '0711007856', 'thabang92', 'pass123');

desc client;
desc employee;
desc car;
desc service;
desc payment;
desc carservice;
desc booking;




-------inserting into employee table--------
INSERT INTO EMPLOYEE VALUES
('emp01', 'Hlophe', 'Thandolwethu', 'Mashego Str', 'Tembisa', 'Gauteng', 1632, '0847209876', 'tyre polisher');

INSERT INTO EMPLOYEE VALUES
('emp02', 'Sibanyoni', 'Mandla', 'Amsterdam Str', 'Midrand', 'Gauteng', 1628, '0735576456', 'washer');

INSERT INTO EMPLOYEE VALUES
('emp03', 'Johnson', 'Mike', 'casandra Str', 'VanderbijlPark', 'Gauteng', 1619, '0118760053', 'washer');





---------inserting into car table---------
INSERT INTO CAR VALUES
('YY 89 GF GP', 'van', 'black', 9206100845808);

INSERT INTO CAR VALUES
('FGT 097 GP', 'hatchback', 'red', 9102140832083);

INSERT INTO CAR VALUES
('QQW 345 GP', 'hatchback', 'grey', 9410250852089);





--------inserting into service table------------
INSERT INTO SERVICE VALUES
('s001', 'Full hand wash', 'emp03', 'FGT 097 GP'); 

INSERT INTO SERVICE VALUES
('s002', 'polish car only', 'emp01', 'QQW 345 GP'); 

INSERT INTO SERVICE VALUES
('s003', 'polish tyres only', 'emp01', 'YY 89 GF GP'); 


alter table payment
modify ( s_serviceID VARCHAR2(10));

--------inserting into payment table------------
INSERT INTO PAYMENT VALUES
('cash01', to_date('03/12/2017', 'mm/dd/yyyy'), 150, 's002');

INSERT INTO PAYMENT VALUES
('cash02', to_date('03/25/2017', 'mm/dd/yyyy'), 300, 's001');

INSERT INTO PAYMENT VALUES
('cash03', to_date('03/27/2017', 'mm/dd/yyyy'), 75, 's003');

CREATE TABLE booking
(b_bookingID NUMBER(5),
b_bookingDate DATE,
s_serviceID VARCHAR2(3),
c_clientID NUMBER(13),
CONSTRAINT b_bookingID_pk PRIMARY KEY (b_bookingID),
CONSTRAINT s_serviceCode_fk FOREIGN KEY (s_serviceID) REFERENCES service(s_serviceID),
CONSTRAINT c_clientNum_fk FOREIGN KEY (c_clientID) REFERENCES client(c_clientID));


alter table booking
modify ( s_serviceID VARCHAR2(10));
--------inserting into booking table--------
INSERT INTO BOOKING VALUES
(0001,to_date('05/13/2017','mm/dd/yyyy'),'s001',9206100845808);
INSERT INTO BOOKING VALUES
(0002,to_date('05/11/2017','mm/dd/yyyy'),'s002',9102140832083);
INSERT INTO BOOKING VALUES
(0003,to_date('05/12/2017','mm/dd/yyyy'),'s003',9410250852089);

INSERT INTO carservice VALUES
('YY 89 GF GP','s003', 2, to_date('11/04/2017','mm-dd-yyyy'));
INSERT INTO carservice  VALUES
('FGT 097 GP','s002', 3, to_date('10/03/2017','mm-dd-yyyy'));
INSERT INTO carservice VALUES
('QQW 345 GP','s001', 1, to_date('10/03/2017','mm-dd-yyyy'));


COMMIT;



