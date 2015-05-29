insert INTO APPLICANT (APPLICANT_CODE,FIRST_NAME_TH,FIRST_NAME_EN,LAST_NAME_TH,LAST_NAME_EN,NICK_NAME_TH,NICK_NAME_EN,BIRTHDATE,AGE,HEIGHT,WEIGHT,RELIGION,NATIONALITY,TEL,EMAIL,APPLICANT_STATUS,APPLY_DATE,EMERGENCY_NAME,EMERGENCY_TEL,EMERGENCY_ADDRESS,NOTICE_NEWSPAPER,NOTICE_MAGAZINE,NOTICE_FRIEND,NOTICE_WEBSITE,NOTICE_OTHER,POSITION1,POSITION2,POSITION3,TRACKING_STATUS,CERTIFICATE,EXPACTED_SALARY,CARD_ID,CARD_ISSUED_OFFICE,CARD_EXPIRY_DATE,MILITARY_FROM_YEAR,MILITARY_TO_YEAR,MILITARY_PLACE,MILITARY_SERVICE_NO,MILITARY_REASON,MILITARY_STATUS,MARRITAL_STATUS_NAME,NUMBER_OF_CHILDREN,SPOUSE_NAME,MARRIAGE_CERTIFICATE_NO,ISSUE_OFFICE_MARRIAGE,OCCUPATION_MARRIAGE)
VALUES ('C201501','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Buddha','Thai','021234567','yam@gmail.com','Marriage',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','0912345678','บ้านหนองนมวัว','no','no','no','yes','no','Senior JAVA','Senior .Net','Senior HR','Waiting for consider','TOEIC 750','25000','1111122223344','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'no','no','no','no','no','no','no',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา'),
('C201502','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Buddha','Thai','021234567','yam@gmail.com','Marriage',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','0912345678','บ้านหนองนมวัว','no','no','no','yes','no','Senior JAVA','Senior .Net','Senior HR','Waiting for consider','TOEIC 750','25000','1111122223344','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'no','no','no','no','no','no','no',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา'),
('C201503','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Buddha','Thai','021234567','yam@gmail.com','Marriage',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','0912345678','บ้านหนองนมวัว','no','no','no','yes','no','Senior JAVA','Senior .Net','Senior HR','Waiting for consider','TOEIC 750','25000','1111122223344','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'no','no','no','no','no','no','no',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา'),
('C201504','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Buddha','Thai','021234567','yam@gmail.com','Marriage',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','0912345678','บ้านหนองนมวัว','no','no','no','yes','no','Senior JAVA','Senior .Net','Senior HR','Waiting for consider','TOEIC 750','25000','1111122223344','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'no','no','no','no','no','no','no',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา');

insert INTO DEPARTMENT (DEPARTMENT_CODE,DEPARTMENT_NAME) VALUES ('CEO','Office of CEO'),('FA','Finance And Administration'),('ITS','Integrated Technology Services'),('MKT','Marketing'),('MoH','Ministry of Happiness'),('SAP','SAP Services'),('TXM','Transformation');

insert INTO POSITION (DEPARTMENT_ID,POSITION_NAME,POSITON_CODE) VALUES ('2','Account Executive','P01'),
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


insert INTO APPLICANT_POSITION (APPLICANT_ID,POSITION_ID) VALUES ('1','2'),
('1','3'),
('2','5'),
('3','13'),('4','11');

insert INTO AUGEMPLOYEE (APPLICANT_ID,EMPLOYED_NAME) VALUES ('1','Ethan'),('2','Carter'),('3','Ashley'),('4','Andrea');

insert INTO FAMILY (APPLICANT_ID,ADDRESS,NAME,OCCUPATION,RELATION) VALUES ('1','House No.197, Charoenrat Road, Watgate sub-district, Mueang Chiang Mai district, Chiang Mai province, 50000, Thailand','Olivia','Photographer','Sister'),
('2','888 Ekachai Road, Soi Kamnanmaen 7, Sub-soi 1, Bangbon Sub-district, Bangbon District, Bangkok 10150','Michael','Doctor','Brother'),
('3','No.115, Moo 2, San Klang Sub District, San Kam Peang District, Chiangmai','Daniel','Scientist','Father'),
('4','House No.39, Village No.3, Nhong Kwai sub-district, Chiang Mai','Emily','Engineer','Mother');


insert INTO REFERENCE (APPLICANT_ID,FULLNAME,OCCUPATION,TEL) VALUES ('1','Sydney','Pharmacist','086-9741352'),('2','Kimberly','Physicist','097-4857695'),('3','Layla','Pilot','087-1465894'),('4','Jack','Dentist','097-1234567');

insert into LANGUAGES (APPLICANT_ID,LANGUAGES_NAME,READING,SPEAKING,UNDERSTANDING,WRITING) VALUES ('1','English','Good','Excellent','Excellent','Good'),('2','Japanese','Excellent','Good','Good','Good'),('3','Chinese','Excellent','Excellent','Excellent','Good'),('4','France','Excellent','Good','Excellent','Fair');

insert into ATTACHFILE (APPLICANT_ID,ATTACH_NAME,ATTACH_TYPE_File,PATH,TYPE) VALUES ('1','resume.pdf','resume','resume','.pdf'),
('2','picture.png','picture','picture','.png'),
('3','transcript.pdf','transcript','transcript','.pdf'),('4','certificate.pdf','certificate','certificate','.pdf');

INSERT INTO Address (APPLICANT_ID, HOUSE_NO, ROAD, SUB_DISTRICT, DISTRICT, PROVINCE, ZIPCODE, ADDRESS_TYPE)
VALUES ('1','11/1','Sukumwit','Bangjak','Prakanong','Bankok','10260','permanent'),
('1','248/1','Nonsri','Chongnonsri','Yanawa','Bankok','10260','present'),
('2','44/1','Patchaburi','Payathai','Rachatawi','Bankok','10260','permanent'),
('2','22/1','Nonsri','Chongnonsri','Yanawa','Bankok','10260','persent'),
('3','88/9','klongnueng','klongluang','Rangsit','Pathumyhani','12120','permanent'),
('3','1/120','Nonsri','Chongnonsri','Yanawa','Bankok','10260','present');

INSERT INTO Education(APPLICANT_ID, SCHOOL_NAME, DEGREE, FACULTY, GPA, YEAR_OF_GRADUATE)
VALUES ('1','Thammasat University','Bachelor','Science','3.0','2010-2014'),
('2','Mahidol University','Bachelor','Science','3.0','2010-2014'),
('3','Kasetsart University','Bachelor','Science','3.0','2011-2015');

INSERT INTO Experience(APPLICANT_ID, POSITION, FROM_DATE, TO_DATE, EMPLOYER_NAME, ADDRESS, TYPE_OF_BUSSINESS, POSITION_OF_EMPLOYER, REASON, SUPERVISOR, SALARY, DESCRIPTION)
VALUES ('1', 'Junior Java Consultance',STR_TO_DATE('01/04/2012','%d/%m/%Y'),STR_TO_DATE('01/08/2012','%d/%m/%Y'),'Tomas','22/2 Nongnom Nakornsawan', 'IT Consultance', 'Manager','-','Adison','15000','-'),
('2', 'Senior Java Consultance',STR_TO_DATE('01/03/2012','%d/%m/%Y'),STR_TO_DATE('01/05/2015','%d/%m/%Y'),'John','86/4 Ladprao Chankasam Bangkok', 'IT Consultance', 'Manager','-','Somsuk','30000','-'),
('3', 'HR',STR_TO_DATE('01/03/2009','%d/%m/%Y'),STR_TO_DATE('01/05/2013','%d/%m/%Y'),'Uthaiwan','13 Rangsit Ransit Pathumthani', 'IT Consultance', 'HR','-','Asana','25000','-');


INSERT INTO Skill(APPLICANT_ID, SKILL_DETAIL)
VALUES ('1','JAVAJS'),('2','JAVAPHP'),('3','-');


insert INTO AUG_REQUEST (REQUEST_DATE,REQUESTER_NAME,STATUS,APPROVAL_NAME,APPROVAL_DATE)
VALUES (STR_TO_DATE('26/05/2015','%d/%m/%Y'),'SamSmith','NEW','ChrisBrown',STR_TO_DATE('27/05/2015','%d/%m/%Y'));

insert INTO REQUEST_POSITION (POSITION_NAME,NUMBER_APPLICANT,SPECIFIC_SKILL,YEAR_EXPERIENCE,REQUEST_ID)
VALUES ('JAVA',2,'HibernateSping',3,1);
