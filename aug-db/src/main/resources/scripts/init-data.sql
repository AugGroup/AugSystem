insert INTO APPLICANT (APPLICANT_CODE,FIRST_NAME_TH,FIRST_NAME_EN,LAST_NAME_TH,LAST_NAME_EN,NICK_NAME_TH,NICK_NAME_EN,BIRTHDATE,AGE,HEIGHT,WEIGHT,RELIGION,NATIONALITY,TEL,EMAIL,APPLICANT_STATUS,APPLY_DATE,EMERGENCY_NAME,EMERGENCY_TEL,EMERGENCY_ADDRESS,NOTICE_NEWSPAPER,NOTICE_MAGAZINE,NOTICE_FRIEND,NOTICE_WEBSITE,NOTICE_OTHER,POSITION1,POSITION2,POSITION3,TRACKING_STATUS,CERTIFICATE,EXPACTED_SALARY,CARD_ID,CARD_ISSUED_OFFICE,CARD_EXPIRY_DATE,MILITARY_FROM_YEAR,MILITARY_TO_YEAR,MILITARY_PLACE,MILITARY_SERVICE_NO,MILITARY_REASON,MILITARY_STATUS,MARRITAL_STATUS_NAME,NUMBER_OF_CHILDREN,SPOUSE_NAME,MARRIAGE_CERTIFICATE_NO,ISSUE_OFFICE_MARRIAGE,OCCUPATION_MARRIAGE)
VALUES ('C201501','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Buddha','Thai','021234567','yam@gmail.com','Marriage',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','0912345678','บ้านหนองนมวัว','no','no','no','yes','no','Senior JAVA','Senior .Net','Senior HR','Waiting for consider','TOEIC 750','25000','1111122223344','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'no','no','no','no','no','no','no',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา'),
('C201502','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Buddha','Thai','021234567','yam@gmail.com','Marriage',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','0912345678','บ้านหนองนมวัว','no','no','no','yes','no','Senior JAVA','Senior .Net','Senior HR','Waiting for consider','TOEIC 750','25000','1111122223344','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'no','no','no','no','no','no','no',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา'),
('C201503','แย้ม','Yam','หมั่นกิจ','Mankit','แย้ม','Yam',STR_TO_DATE('26/01/1940','%d/%m/%Y'),75,165,45,'Buddha','Thai','021234567','yam@gmail.com','Marriage',STR_TO_DATE('26/05/2015','%d/%m/%Y'),'ประเทือง หมั่นกิจ','0912345678','บ้านหนองนมวัว','no','no','no','yes','no','Senior JAVA','Senior .Net','Senior HR','Waiting for consider','TOEIC 750','25000','1111122223344','บ้านหนองนมวัว',STR_TO_DATE('27/05/2017','%d/%m/%Y'),'no','no','no','no','no','no','no',3,'ประเทือง หมั่นกิจ','1234','บ้านหนองนมวัว','ชาวนา');

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
VALUES ('1','JAVA JS'),('2','JAVA PHP'),('3','-');


insert INTO AUG_REQUEST (REQUEST_DATE,REQUESTER_NAME,STATUS,APPROVAL_NAME,APPROVAL_DATE)
VALUES (STR_TO_DATE('26/05/2015','%d/%m/%Y'),'SamSmith','NEW','ChrisBrown',STR_TO_DATE('27/05/2015','%d/%m/%Y'));

insert INTO REQUEST_POSITION (POSITION_NAME,NUMBER_APPLICANT,SPECIFIC_SKILL,YEAR_EXPERIENCE,requestId)
VALUES ('JAVA',2,'HibernateSping',3,1);
