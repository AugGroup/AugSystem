
    drop table if exists PERSON;

    create table PERSON (
        id integer not null auto_increment,
        NAME varchar(255),
        primary key (id)
    );
