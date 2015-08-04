insert INTO DEPARTMENT (DEPARTMENT_CODE,DEPARTMENT_NAME) VALUES ('CEO','Office of CEO'),('FA','Finance And Administration'),('ITS','Integrated Technology Services'),('MKT','Marketing'),('MoH','Ministry of Happiness'),('SAP','SAP Services'),('TXM','Transformation');

insert INTO POSITION (DEPARTMENT_ID,POSITION_NAME,POSITION_CODE) VALUES ('2','Account Executive','P01'),
('2','Account Manager','P02'),
('3','Business Division Director','P03'),
('3','Consultant','P04'),
('3','Manager','P05'),
('3','Managing Consultant','P06'),
('6','Partner','P07'),
('3','Principal Consultant','P08'),
('3','Professional','P09'),
('2','Senior Account Manager','P10'),
('3','Senior Consultant','P11'),
('3','Senior Manager','P12'),
('3','Senior Professional','P13'),
('2','Support Division Director','P14');

insert INTO APPLICANT (APPLICANT_CODE,FIRSTNAME_TH,FIRSTNAME_EN,LASTNAME_TH,LASTNAME_EN,NICKNAME_TH,NICKNAME_EN,BIRTHDATE,AGE,HEIGHT,WEIGHT,SEX,RELIGION,NATIONALITY,TEL,EMAIL,APPLICANT_STATUS,APPLY_DATE,EMERGENCY_NAME,EMERGENCY_TEL,EMERGENCY_ADDRESS,NOTICE_NEWSPAPER,NOTICE_MAGAZINE,NOTICE_FRIEND,NOTICE_WEBSITE,NOTICE_OTHER,POSITION1_ID,POSITION2_ID,POSITION3_ID,TRACKING_STATUS,EXPECTED_SALARY,CARD_ID,CARD_ISSUED_OFFICE,CARD_EXPIRY_DATE,MILITARY_FROM_YEAR,MILITARY_TO_YEAR,MILITARY_PLACE,MILITARY_SERVICE_NO,MILITARY_REASON,NUMBER_OF_CHILDREN,SPOUSE_NAME,MARRIAGE_CERTIFICATE_NO,ISSUE_OFFICE_MARRIAGE,OCCUPATION_MARRIAGE,PLACE_BIRTH,SCORE,TECH_SCORE,ATTITUDE_HOME,ATTITUDE_OFFICE,NOW_EMPLOYED,EMPLOYED_NAME,EMPLOYED_POSITION,EMPLOYED_RELATION,BRANCH_SERVICE,PREVIOUS_EMPLOYERS,PREVIOUS_EMPLOYERS_REASON,DATE_TO_BE_DRAFTED,MARRIAGE_ADDRESS,RESUME,TRANSCRIPT,IMAGE,MILITARY_STATUS)
VALUES ('C201501','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Female','Buddha','Thai','(021) 234-5678','yam@gmail.com','Married',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','(091) 234-5678','บ้านหนองนมวัว','No','No','No','Yes','No','4','2','3','Waiting for consider','25000','1111-1222-2334-4','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'No','No','No','No','No',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา','Nakon Sawan','40/50','Pass','C#26','S#22','Yes','Ashley','Consultant','friend','No','No','Recently graduated',STR_TO_DATE('27/05/2030','%d/%m/%Y'),'72/2 Moo 5 Behind Somchai Estate,Soi 3,Bangkruay Sai Noi Road, Bangkruay Sub District, Bangkruay District, Nonthaburi Province 11130','resume.pdf','transcript.pdf','image.png','No'),
('C201502','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Female','Buddha','Thai','(022) 234-5678','yam@gmail.com','Married',STR_TO_DATE('27/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','(092) 234-5678','บ้านหนองนมวัว','No','No','No','Yes','No','1','2','3','Waiting for consider','25000','1111-1222-2334-5','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'No','No','No','No','No',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา','Nakon Sawan','40/50','Pass','C#26','S#22','Yes','Ashley','Consultant','friend','No','No','Recently graduated',STR_TO_DATE('27/05/2030','%d/%m/%Y'),'72/2 Moo 5 Behind Somchai Estate,Soi 3,Bangkruay Sai Noi Road, Bangkruay Sub District, Bangkruay District, Nonthaburi Province 11130','resume.pdf','transcript.pdf','image.png','No'),
('C201503','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Male','Buddha','Thai','(023) 234-5678','yam@gmail.com','Married',STR_TO_DATE('29/06/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','(093) 234-5678','บ้านหนองนมวัว','No','No','No','Yes','No','1','2','3','Waiting for consider','25000','1111-1222-2334-6','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'No','No','No','No','No',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา','Nakon Sawan','40/50','Not','I#24','C#22','Yes','Ashley','Consultant','friend','No','No','Recently graduated',STR_TO_DATE('27/05/2030','%d/%m/%Y'),'72/2 Moo 5 Behind Somchai Estate,Soi 3,Bangkruay Sai Noi Road, Bangkruay Sub District, Bangkruay District, Nonthaburi Province 11130','resume.pdf','transcript.pdf','image.png','No'),
('C201504','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Female','Buddha','Thai','(024) 234-5678','yam@gmail.com','Married',STR_TO_DATE('28/06/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','(094) 234-5678','บ้านหนองนมวัว','No','No','No','Yes','No','1','2','3','Waiting for consider','25000','1111-1222-2334-7','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'No','No','No','No','No',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา','Nakon Sawan','40/50','Pass','D#26','I#24','Yes','Ashley','Consultant','friend','No','No','Recently graduated',STR_TO_DATE('27/05/2030','%d/%m/%Y'),'72/2 Moo 5 Behind Somchai Estate,Soi 3,Bangkruay Sai Noi Road, Bangkruay Sub District, Bangkruay District, Nonthaburi Province 11130','resume.pdf','transcript.pdf','image.png','No');

insert INTO AUGEMPLOYEE (APPLICANT_ID,EMPLOYED_NAME) VALUES ('1','Ethan'),('2','Carter'),('3','Ashley'),('4','Andrea');

insert INTO FAMILY (APPLICANT_ID,ADDRESS,NAME,OCCUPATION,RELATION,POSITION_FAMILY) VALUES ('1','House No.197, Charoenrat Road, Watgate sub-district, Mueang Chiang Mai district, Chiang Mai province, 50000, Thailand','Olivia','Photographer','Sister','Manager'),
('2','888 Ekachai Road, Soi Kamnanmaen 7, Sub-soi 1, Bangbon Sub-district, Bangbon District, Bangkok 10150','Michael','Doctor','Brother','Manager'),
('3','No.115, Moo 2, San Klang Sub District, San Kam Peang District, Chiangmai','Daniel','Scientist','Father','Manager'),
('4','House No.39, Village No.3, Nhong Kwai sub-district, Chiang Mai','Emily','Engineer','Mother','Manager');


insert INTO REFERENCE (APPLICANT_ID,FULLNAME,COMPLETE_ADDRESS,OCCUPATION,TEL) VALUES ('1','Sydney','17/4 Village No.5 Bamroongrat Road, Pibulsongkram Sub-district, Muang District, Chiang Rai, 51000','Pharmacist','086-9741352'),('2','Kimberly','99 Sukhumvit Soi 123, Klongtoey-nua, Wattana, Sukhumvit, Bangkok, Thailand 10110','Physicist','097-4857695'),('3','Layla','220/1 Moo 2, Sai asia Rd,Tambol Nongbuatai,Muang District,Tak, 63000
Thailand','Pilot','087-1465894'),('4','Jack','576 Mooban Chaimongkol Soi Karnchanapisek 008 Bangkae district Bangkok 10160 ','Dentist','097-1234567');

insert into LANGUAGES (APPLICANT_ID,LANGUAGES_NAME,READING,SPEAKING,UNDERSTANDING,WRITING) VALUES ('1','English','Good','Excellent','Excellent','Good'),('2','Japanese','Excellent','Good','Good','Good'),('3','Chinese','Excellent','Excellent','Excellent','Good'),('4','France','Excellent','Good','Excellent','Fair');

INSERT INTO ADDRESS (APPLICANT_ID, HOUSE_NO, ROAD, SUB_DISTRICT, DISTRICT, PROVINCE, ZIPCODE, ADDRESS_TYPE)
VALUES ('1','11/1','Sukumwit','Bangjak','Prakanong','Bankok','10260','Permanent'),
('1','248/1','Nonsri','Chongnonsri','Yanawa','Bankok','10260','Present'),
('2','44/1','Patchaburi','Payathai','Rachatawi','Bankok','10260','Permanent'),
('2','22/1','Nonsri','Chongnonsri','Yanawa','Bankok','10260','Present'),
('3','88/9','klongnueng','klongluang','Rangsit','Pathumyhani','12120','permanent'),
('3','1/120','Nonsri','Chongnonsri','Yanawa','Bankok','10260','Present');

INSERT INTO EDUCATION(APPLICANT_ID, SCHOOL_NAME, DEGREE, MAJOR, FACULTY, GPA, YEAR_OF_GRADUATE)
VALUES ('1','Thammasat University','Bachelor','Com','Science','3.0','2010-2014'),
('2','Mahidol University','Bachelor','Com','Science','3.0','2010-2014'),
('3','Kasetsart University','Bachelor','Marketing','BA','2.5','2011-2015'),
('4','Bangkok University','Master','Envi','Science','2.0','2011-2015');

INSERT INTO EXPERIENCE(APPLICANT_ID, POSITION, FROM_DATE, TO_DATE, EMPLOYER_NAME, ADDRESS, TYPE_OF_BUSSINESS, POSITION_OF_EMPLOYER, REASON, SUPERVISOR, SALARY, DESCRIPTION)
VALUES ('1', 'Junior Java Consultance',STR_TO_DATE('01/04/2012','%d/%m/%Y'),STR_TO_DATE('01/08/2012','%d/%m/%Y'),'Tomas','22/2 Nongnom Nakornsawan', 'IT Consultance', 'Manager','-','Adison','15000','-'),
('2', 'Senior Java Consultance',STR_TO_DATE('01/03/2012','%d/%m/%Y'),STR_TO_DATE('01/05/2015','%d/%m/%Y'),'John','86/4 Ladprao Chankasam Bangkok', 'IT Consultance', 'Manager','-','Somsuk','30000','-'),
('3', 'HR',STR_TO_DATE('01/03/2009','%d/%m/%Y'),STR_TO_DATE('01/05/2013','%d/%m/%Y'),'Uthaiwan','13 Rangsit Ransit Pathumthani', 'IT Consultance', 'HR','-','Asana','25000','-');


INSERT INTO SKILL (APPLICANT_ID, SKILL_DETAIL)
VALUES ('1','JAVAJS'),('2','JAVAPHP'),('3','-');


insert INTO AUG_REQUEST (REQUEST_DATE,REQUESTER_NAME,STATUS,APPROVAL_NAME,APPROVE_DATE,REQUEST_POSITION,NUMBER_APPLICANT,SPECIFIC_SKILL,YEAR_EXPERIENCE)
VALUES (STR_TO_DATE('26/05/2015','%d/%m/%Y'),'SamSmith','New Request','ChrisBrown',STR_TO_DATE('27/05/2015','%d/%m/%Y'),'1','2','HibernateSping','3'),
(STR_TO_DATE('26/05/2015','%d/%m/%Y'),'SamSmith','New Request','ChrisBrown',STR_TO_DATE('27/05/2015','%d/%m/%Y'),'2','2','HibernateSping','3');

insert INTO LOGIN(USERNAME,PASSWORD)
VALUES ('admin','admin'),('staff','staff'),('manager','manager');

insert INTO USER_ROLES(USERNAME,ROLE)
VALUES ('admin','ROLE_ADMIN'),('staff','ROLE_STAFF'),('manager','ROLE_MANAGER');

insert INTO CERTIFICATE(APPLICANT_ID,CERTIFICATE_NAME)
VALUES ('1','java'),('2','.net'),('3','microsoft'),('4','ccna');
