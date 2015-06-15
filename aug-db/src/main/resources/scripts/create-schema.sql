
    alter table ADDRESS 
        drop 
        foreign key FKE66327D46DBA8CB5;

    alter table APPLICANT 
        drop 
        foreign key FK29852EE27EA0E820;

    alter table APPLICANT 
        drop 
        foreign key FK29852EE27EA1D0DE;

    alter table APPLICANT 
        drop 
        foreign key FK29852EE27EA15C7F;

    alter table ATTACHFILE 
        drop 
        foreign key FKA7DE25416DBA8CB5;

    alter table AUGEMPLOYEE 
        drop 
        foreign key FK7F3792416DBA8CB5;

    alter table AUG_REQUEST 
        drop 
        foreign key FK218E0C3E7089C67;

    alter table EDUCATION 
        drop 
        foreign key FK94C377886DBA8CB5;

    alter table EXPERIENCE 
        drop 
        foreign key FK17D0456A6DBA8CB5;

    alter table FAMILY 
        drop 
        foreign key FK7B2B4F646DBA8CB5;

    alter table LANGUAGES 
        drop 
        foreign key FK97E7FB6DBA8CB5;

    alter table POSITION 
        drop 
        foreign key FK5B388929112D8D9F;

    alter table REFERENCE 
        drop 
        foreign key FK6EF34F2B6DBA8CB5;

    alter table SKILL 
        drop 
        foreign key FK4B4D2316DBA8CB5;

    drop table if exists ADDRESS;

    drop table if exists APPLICANT;

    drop table if exists ATTACHFILE;

    drop table if exists AUGEMPLOYEE;

    drop table if exists AUG_REQUEST;

    drop table if exists DEPARTMENT;

    drop table if exists EDUCATION;

    drop table if exists EXPERIENCE;

    drop table if exists FAMILY;

    drop table if exists LANGUAGES;

    drop table if exists LOGIN;

    drop table if exists POSITION;

    drop table if exists REFERENCE;

    drop table if exists SKILL;

    drop table if exists USER_ROLES;

    create table ADDRESS (
        ID integer not null auto_increment,
        ADDRESS_TYPE varchar(255),
        DISTRICT varchar(255),
        HOUSE_NO varchar(255),
        PROVINCE varchar(255),
        ROAD varchar(255),
        SUB_DISTRICT varchar(255),
        ZIPCODE integer,
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table APPLICANT (
        APPLICANT_ID integer not null auto_increment,
        AGE integer,
        APPLICANT_STATUS varchar(255),
        APPLY_DATE datetime,
        ATTITUDE_HOME varchar(255),
        ATTITUDE_OFFICE varchar(255),
        BIRTHDATE datetime,
        BRANCH_SERVICE varchar(255),
        CARD_EXPIRY_DATE datetime,
        CARD_ID varchar(255),
        CARD_ISSUED_OFFICE varchar(255),
        CERTIFICATE varchar(255),
        APPLICANT_CODE varchar(255),
        DATE_TO_BE_DRAFTED datetime,
        EMAIL varchar(255),
        EMERGENCY_ADDRESS varchar(255),
        EMERGENCY_NAME varchar(255),
        EMERGENCY_TEL varchar(255),
        EMPLOYED_NAME varchar(255),
        EMPLOYED_POSITION varchar(255),
        EMPLOYED_RELATION varchar(255),
        EXPECTED_SALARY varchar(255),
        FIRSTNAME_EN varchar(255),
        FIRSTNAME_TH varchar(255),
        HEIGHT integer,
        ISSUE_OFFICE_MARRIAGE varchar(255),
        LASTNAME_EN varchar(255),
        LASTNAME_TH varchar(255),
        MARRIAGE_ADDRESS varchar(255),
        MARRIAGE_CERTIFICATE_NO varchar(255),
        MARRITAL_STATUS_NAME varchar(255),
        MILITARY_FROM_YEAR varchar(255),
        MILITARY_PLACE varchar(255),
        MILITARY_REASON varchar(255),
        MILITARY_SERVICE_NO varchar(255),
        MILITARY_STATUS varchar(255),
        MILITARY_TO_YEAR varchar(255),
        NATIONALITY varchar(255),
        NICKNAME_EN varchar(255),
        NICKNAME_TH varchar(255),
        NOTICE_FRIEND varchar(255),
        NOTICE_MAGAZINE varchar(255),
        NOTICE_NEWSPAPER varchar(255),
        NOTICE_OTHER varchar(255),
        NOTICE_WEBSITE varchar(255),
        NOW_EMPLOYED varchar(255),
        NUMBER_OF_CHILDREN integer,
        OCCUPATION_MARRIAGE varchar(255),
        PLACE_BIRTH varchar(255),
        PREVIOUS_EMPLOYERS varchar(255),
        PREVIOUS_EMPLOYERS_REASON varchar(255),
        RELIGION varchar(255),
        SCORE varchar(255),
        SEX varchar(255),
        SPOUSE_NAME varchar(255),
        TECH_SCORE varchar(255),
        TEL varchar(255),
        TRACKING_STATUS varchar(255),
        WEIGHT integer,
        POSITION1_ID integer,
        POSITION2_ID integer,
        POSITION3_ID integer,
        primary key (APPLICANT_ID)
    );

    create table ATTACHFILE (
        ID integer not null auto_increment,
        ATTACH_NAME varchar(255),
        ATTACH_TYPE_FILE varchar(255),
        PATH varchar(255),
        TYPE varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table AUGEMPLOYEE (
        ID integer not null auto_increment,
        EMPLOYED_NAME varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table AUG_REQUEST (
        REQUEST_ID integer not null auto_increment,
        APPROVAL_NAME varchar(255),
        APPROVE_DATE datetime,
        NUMBER_APPLICANT integer,
        REQUEST_DATE datetime,
        REQUESTER_NAME varchar(255),
        SPECIFIC_SKILL varchar(255),
        STATUS varchar(255),
        YEAR_EXPERIENCE integer,
        REQUEST_POSITION integer,
        primary key (REQUEST_ID)
    );

    create table DEPARTMENT (
        ID integer not null auto_increment,
        DEPARTMENT_CODE varchar(255),
        DEPARTMENT_NAME varchar(255),
        primary key (ID)
    );

    create table EDUCATION (
        ID integer not null auto_increment,
        DEGREE varchar(255),
        FACULTY varchar(255),
        GPA double precision,
        MAJOR varchar(255),
        SCHOOL_NAME varchar(255),
        YEAR_OF_GRADUATE varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table EXPERIENCE (
        ID integer not null auto_increment,
        ADDRESS varchar(255),
        DESCRIPTION varchar(255),
        EMPLOYER_NAME varchar(255),
        FROM_DATE datetime,
        POSITION varchar(255),
        POSITION_OF_EMPLOYER varchar(255),
        REASON varchar(255),
        SALARY bigint,
        SUPERVISOR varchar(255),
        TO_DATE datetime,
        TYPE_OF_BUSSINESS varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table FAMILY (
        ID integer not null auto_increment,
        ADDRESS varchar(255),
        NAME varchar(255),
        OCCUPATION varchar(255),
        POSITION_FAMILY varchar(255),
        RELATION varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table LANGUAGES (
        ID integer not null auto_increment,
        LANGUAGES_NAME varchar(255),
        READING varchar(255),
        SPEAKING varchar(255),
        UNDERSTANDING varchar(255),
        WRITING varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table LOGIN (
        ID integer not null auto_increment,
        PASSWORD varchar(255),
        USERNAME varchar(255),
        primary key (ID)
    );

    create table POSITION (
        ID integer not null auto_increment,
        POSITON_CODE varchar(255),
        POSITION_NAME varchar(255),
        DEPARTMENT_ID integer,
        primary key (ID)
    );

    create table REFERENCE (
        ID integer not null auto_increment,
        COMPLETE_ADDRESS varchar(255),
        FULLNAME varchar(255),
        OCCUPATION varchar(255),
        TEL varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table SKILL (
        ID integer not null auto_increment,
        SKILL_DETAIL varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table USER_ROLES (
        ID integer not null auto_increment,
        ROLE varchar(255),
        USERNAME varchar(255),
        primary key (ID)
    );

    alter table ADDRESS 
        add index FKE66327D46DBA8CB5 (APPLICANT_ID), 
        add constraint FKE66327D46DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    create index position3Index on APPLICANT (POSITION3_ID);

    create index position1Index on APPLICANT (POSITION1_ID);

    create index position2Index on APPLICANT (POSITION2_ID);

    alter table APPLICANT 
        add index FK29852EE27EA0E820 (POSITION1_ID), 
        add constraint FK29852EE27EA0E820 
        foreign key (POSITION1_ID) 
        references POSITION (ID);

    alter table APPLICANT 
        add index FK29852EE27EA1D0DE (POSITION3_ID), 
        add constraint FK29852EE27EA1D0DE 
        foreign key (POSITION3_ID) 
        references POSITION (ID);

    alter table APPLICANT 
        add index FK29852EE27EA15C7F (POSITION2_ID), 
        add constraint FK29852EE27EA15C7F 
        foreign key (POSITION2_ID) 
        references POSITION (ID);

    alter table ATTACHFILE 
        add index FKA7DE25416DBA8CB5 (APPLICANT_ID), 
        add constraint FKA7DE25416DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table AUGEMPLOYEE 
        add index FK7F3792416DBA8CB5 (APPLICANT_ID), 
        add constraint FK7F3792416DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table AUG_REQUEST 
        add index FK218E0C3E7089C67 (REQUEST_POSITION), 
        add constraint FK218E0C3E7089C67 
        foreign key (REQUEST_POSITION) 
        references POSITION (ID);

    alter table EDUCATION 
        add index FK94C377886DBA8CB5 (APPLICANT_ID), 
        add constraint FK94C377886DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table EXPERIENCE 
        add index FK17D0456A6DBA8CB5 (APPLICANT_ID), 
        add constraint FK17D0456A6DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table FAMILY 
        add index FK7B2B4F646DBA8CB5 (APPLICANT_ID), 
        add constraint FK7B2B4F646DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table LANGUAGES 
        add index FK97E7FB6DBA8CB5 (APPLICANT_ID), 
        add constraint FK97E7FB6DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    create index positionNameIndex on POSITION (POSITION_NAME);

    alter table POSITION 
        add index FK5B388929112D8D9F (DEPARTMENT_ID), 
        add constraint FK5B388929112D8D9F 
        foreign key (DEPARTMENT_ID) 
        references DEPARTMENT (ID);

    alter table REFERENCE 
        add index FK6EF34F2B6DBA8CB5 (APPLICANT_ID), 
        add constraint FK6EF34F2B6DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table SKILL 
        add index FK4B4D2316DBA8CB5 (APPLICANT_ID), 
        add constraint FK4B4D2316DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);
