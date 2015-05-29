package com.aug.db.repositories;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.aug.db.entities.AttachFile;

public abstract class HibernateRepositoryImpl<Entity, ID extends Serializable> implements GenericRepository<Entity, ID> {
	protected Class clazz;

    @Autowired
    protected SessionFactory sessionFactory;

    public HibernateRepositoryImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        clazz = (Class) pt.getActualTypeArguments()[0];
    }


    public void setEntityClass(final Class clazz) {
        this.clazz = clazz;
    }

    public ID insert(Entity entity) {
        return (ID)getCurrentSession().save(entity);
    }

    public Entity findById(ID id) {
        return (Entity)getCurrentSession().get(clazz, id);
    }

    public void update(Entity entity) {
        getCurrentSession().saveOrUpdate(entity);
    }

    public void delete(Entity entity) {
        getCurrentSession().delete(entity);
    }
    
    public void deleteById(ID id){
    	delete(findById(id));
    }
    public List findAll() {
        return getCurrentSession().createQuery("from " + clazz.getName()).list();
    }

    protected DetachedCriteria createDetachedCriteria() {
        return DetachedCriteria.forClass(clazz);
    }

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }


}