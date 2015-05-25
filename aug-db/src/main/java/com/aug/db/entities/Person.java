package com.aug.db.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PERSON")
public class Person {


    @Id
    @Column(name = "ID")
    private Integer id;

    @Column(name = "NAME")
    private String name;




}
