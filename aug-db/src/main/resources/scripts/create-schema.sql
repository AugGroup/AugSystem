
    alter table ADDRESS 
        drop 
        foreign key FKE66327D46DBA8CB5;

    alter table APPLICANT_POSITION 
        drop 
        foreign key FKF7E229E674782F7F;

    alter table APPLICANT_POSITION 
        drop 
        foreign key FKF7E229E66DBA8CB5;

    alter table ATTACHFILE 
        drop 
        foreign key FKA7DE25416DBA8CB5;

    alter table AUGEMPLOYEE 
        drop 
        foreign key FK7F3792416DBA8CB5;

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

    alter table REQUEST_POSITION 
        drop 
        foreign key FK34908F991E97D6B;

    alter table SKILL 
        drop 
        foreign key FK4B4D231362DBE58;

    drop table if exists ADDRESS;

    drop table if exists APPLICANT;

    drop table if exists APPLICANT_POSITION;

    drop table if exists ATTACHFILE;

    drop table if exists AUGEMPLOYEE;

    drop table if exists AUG_REQUEST;

    drop table if exists DEPARTMENT;

    drop table if exists EDUCATION;

    drop table if exists EXPERIENCE;

    drop table if exists FAMILY;

    drop table if exists LANGUAGES;

    drop table if exists POSITION;

    drop table if exists REFERENCE;

    drop table if exists REQUEST_POSITION;

    drop table if exists SKILL;

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
        APPLICANT_STATUS varchar(255),
        AGE integer,
        APPLY_DATE datetime,
        BIRTHDATE datetime,
        CARD_EXPIRY_DATE datetime,
        CARD_ID varchar(255),
        CARD_ISSUED_OFFICE varchar(255),
        CERTIFICATE varchar(255),
        APPLICANT_CODE varchar(255),
        EMAIL varchar(255),
        EMERGENCY_ADDRESS varchar(255),
        EMERGENCY_NAME varchar(255),
        EMERGENCY_TEL varchar(255),
        EXPACTED_SALARY varchar(255),
        FIRST_NAME_EN varchar(255),
        FIRST_NAME_TH varchar(255),
        HEIGHT integer,
        ISSUE_OFFICE_MARRIAGE varchar(255),
        LAST_NAME_EN varchar(255),
        LAST_NAME_TH varchar(255),
        MARRIAGE_CERTIFICATE_NO varchar(255),
        MARRITAL_STATUS_NAME varchar(255),
        MILITARY_FROM_YEAR varchar(255),
        MILITARY_PLACE varchar(255),
        MILITARY_REASON varchar(255),
        MILITARY_SERVICE_NO varchar(255),
        MILITARY_STATUS varchar(255),
        MILITARY_TO_YEAR varchar(255),
        NATIONALITY varchar(255),
        NICK_NAME_EN varchar(255),
        NICK_NAME_TH varchar(255),
        NOTICE_FRIEND varchar(255),
        NOTICE_MAGAZINE varchar(255),
        NOTICE_NEWSPAPER varchar(255),
        NOTICE_OTHER varchar(255),
        NOTICE_WEBSITE varchar(255),
        NUMBER_OF_CHILDREN integer,
        OCCUPATION_MARRIAGE varchar(255),
        POSITION1 varchar(255),
        POSITION2 varchar(255),
        POSITION3 varchar(255),
        RELIGION varchar(255),
        SPOUSE_NAME varchar(255),
        TEL varchar(255),
        TRACKING_STATUS varchar(255),
        WEIGHT integer,
        primary key (APPLICANT_ID)
    );

    create table APPLICANT_POSITION (
        APPLICANT_ID integer not null,
        POSITION_ID integer not null
    );

    create table ATTACHFILE (
        ATTACH_ID integer not null auto_increment,
        ATTACH_NAME varchar(255),
        ATTACH_TYPE_File varchar(255),
        PATH varchar(255),
        TYPE varchar(255),
        APPLICANT_ID integer,
        primary key (ATTACH_ID)
    );

    create table AUGEMPLOYEE (
        AUGEMPLOYEE_ID integer not null auto_increment,
        EMPLOYED_NAME varchar(255),
        APPLICANT_ID integer,
        primary key (AUGEMPLOYEE_ID)
    );

    create table AUG_REQUEST (
        REQUESTID bigint not null auto_increment,
        APPROVAL_DATE datetime,
        APPROVAL_NAME varchar(255),
        REQUEST_DATE datetime,
        REQUESTER_NAME varchar(255),
        STATUS varchar(255),
        primary key (REQUESTID)
    );

    create table DEPARTMENT (
        DEPARTMENT_ID integer not null auto_increment,
        DEPARTMENT_CODE varchar(255),
        DEPARTMENT_NAME varchar(255),
        primary key (DEPARTMENT_ID)
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
        FAMILY_ID integer not null auto_increment,
        ADDRESS varchar(255),
        NAME varchar(255),
        OCCUPATION varchar(255),
        RELATION varchar(255),
        APPLICANT_ID integer,
        primary key (FAMILY_ID)
    );

    create table LANGUAGES (
        LANGUAGES_ID integer not null auto_increment,
        LANGUAGES_NAME varchar(255),
        READING varchar(255),
        SPEAKING varchar(255),
        UNDERSTANDING varchar(255),
        WRITING varchar(255),
        APPLICANT_ID integer,
        primary key (LANGUAGES_ID)
    );

    create table POSITION (
        POSITION_ID integer not null auto_increment,
        POSITON_CODE varchar(255),
        POSITION_NAME varchar(255),
        DEPARTMENT_ID integer,
        primary key (POSITION_ID)
    );

    create table REFERENCE (
        ID integer not null auto_increment,
        FULLNAME varchar(255),
        OCCUPATION varchar(255),
        TEL varchar(255),
        APPLICANT_ID integer,
        primary key (ID)
    );

    create table REQUEST_POSITION (
        REQPOSITION_ID integer not null auto_increment,
        NUMBER_APPLICANT integer,
        POSITION_NAME varchar(255),
        SPECIFIC_SKILL varchar(255),
        YEAR_EXPERIENCE integer,
        requestId bigint,
        primary key (REQPOSITION_ID)
    );

    create table SKILL (
        ID integer not null auto_increment,
        SKILL_DETAIL varchar(255),
        primary key (ID)
    );

    alter table ADDRESS 
        add index FKE66327D46DBA8CB5 (APPLICANT_ID), 
        add constraint FKE66327D46DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table APPLICANT_POSITION 
        add index FKF7E229E674782F7F (POSITION_ID), 
        add constraint FKF7E229E674782F7F 
        foreign key (POSITION_ID) 
        references POSITION (POSITION_ID);

    alter table APPLICANT_POSITION 
        add index FKF7E229E66DBA8CB5 (APPLICANT_ID), 
        add constraint FKF7E229E66DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

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

    alter table POSITION 
        add index FK5B388929112D8D9F (DEPARTMENT_ID), 
        add constraint FK5B388929112D8D9F 
        foreign key (DEPARTMENT_ID) 
        references DEPARTMENT (DEPARTMENT_ID);

    alter table REFERENCE 
        add index FK6EF34F2B6DBA8CB5 (APPLICANT_ID), 
        add constraint FK6EF34F2B6DBA8CB5 
        foreign key (APPLICANT_ID) 
        references APPLICANT (APPLICANT_ID);

    alter table REQUEST_POSITION 
        add index FK34908F991E97D6B (requestId), 
        add constraint FK34908F991E97D6B 
        foreign key (requestId) 
        references AUG_REQUEST (REQUESTID);

    alter table SKILL 
        add index FK4B4D231362DBE58 (id), 
        add constraint FK4B4D231362DBE58 
        foreign key (id) 
        references APPLICANT (APPLICANT_ID);
