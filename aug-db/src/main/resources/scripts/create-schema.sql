
    alter table REQUEST_POSITION 
        drop 
        foreign key FK34908F991E97D6B;

    drop table if exists APPLICANT;

    drop table if exists AUG_REQUEST;

    drop table if exists REQUEST_POSITION;

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

    create table AUG_REQUEST (
        REQUESTID integer not null auto_increment,
        APPROVAL_DATE datetime,
        APPROVAL_NAME varchar(255),
        REQUEST_DATE datetime,
        REQUESTER_NAME varchar(255),
        STATUS varchar(255),
        primary key (REQUESTID)
    );

    create table REQUEST_POSITION (
        REQPOSITION_ID integer not null auto_increment,
        NUMBER_APPLICANT integer,
        POSITION_NAME varchar(255),
        SPECIFIC_SKILL varchar(255),
        YEAR_EXPERIENCE integer,
        requestId integer,
        primary key (REQPOSITION_ID)
    );

    alter table REQUEST_POSITION 
        add index FK34908F991E97D6B (requestId), 
        add constraint FK34908F991E97D6B 
        foreign key (requestId) 
        references AUG_REQUEST (REQUESTID);
