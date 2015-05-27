package com.aug.db.entities;

import javax.persistence.*;

@Entity
@Table(name = "PERSON")
public class Person {


    @Id
//    @Column(name = "ID")
    @GeneratedValue
    private Integer id;

    @Column(name = "NAME")
    private String name;




}
