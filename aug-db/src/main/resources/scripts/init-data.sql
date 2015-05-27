INSERT INTO Address (APPLICANT_ID, HOUSE_NO, ROAD, SUB_DISTRICT, DISTRICT, PROVINCE, ZIPCODE, ADDRESS_TYPE)
VALUES ('C201501','11/1','Sukumwit','Bangjak','Prakanong','Bankok','10260','permanent'),
('C201501','248/1','Nonsri','Chongnonsri','Yanawa','Bankok','10260','present'),
('C201502','44/1','Patchaburi','Payathai','Rachatawi','Bankok','10260','permanent'),
('C201502','22/1','Nonsri','Chongnonsri','Yanawa','Bankok','10260','persent'),
('C201503','88/9','klongnueng','klongluang','Rangsit','Pathumyhani','12120','permanent'),
('C201503','1/120','Nonsri','Chongnonsri','Yanawa','Bankok','10260','present');

INSERT INTO Education(APPLICANT_ID, SCHOOL_NAME, DEGREE, FACULTY, GPA, YEAR_OF_GRADUATE)
VALUES ('C201501','Thammasat University','Bachelor','Science','3.0','2010-2014'),
('C201502','Mahidol University','Bachelor','Science','3.0','2010-2014'),
('C201503','Kasetsart University','Bachelor','Science','3.0','2011-2015');

INSERT INTO Experience(APPLICANT_ID, POSITION, FROM_DATE, TO_DATE, EMPLOYER_NAME, ADDRESS, TYPE_OF_BUSSINESS, POSITION_OF_EMPLOYER, REASON, SUPERVISOR, SALARY, DESCRIPTION)
VALUES ('C201501', 'Junior Java Consultance',STR_TO_DATE('01/04/2012','%d/%m/%Y'),STR_TO_DATE('01/08/2012','%d/%m/%Y'),'Tomas','22/2 Nongnom Nakornsawan', 'IT Consultance', 'Manager','-','Adison','15000','-'),
('C201502', 'Senior Java Consultance',STR_TO_DATE('01/03/2012','%d/%m/%Y'),STR_TO_DATE('01/05/2015','%d/%m/%Y'),'John','86/4 Ladprao Chankasam Bangkok', 'IT Consultance', 'Manager','-','Somsuk','30000','-'),
('C201503', 'HR',STR_TO_DATE('01/03/2009','%d/%m/%Y'),STR_TO_DATE('01/05/2013','%d/%m/%Y'),'Uthaiwan','13 Rangsit Ransit Pathumthani', 'IT Consultance', 'HR','-','Asana','25000','-');


INSERT INTO Skill(APPLICANT_ID, SKILL_DETAIL)
VALUES ('C201501','JAVA JS'),('C201502','JAVA PHP'),('C201503','-');