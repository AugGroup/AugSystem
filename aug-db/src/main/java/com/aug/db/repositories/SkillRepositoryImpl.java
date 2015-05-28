package com.aug.db.repositories;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

import com.aug.db.entities.Skill;

@Repository(value="skillRepository")
public class SkillRepositoryImpl extends HibernateRepositoryImpl<Skill, Serializable> implements
SkillRepository{

}
