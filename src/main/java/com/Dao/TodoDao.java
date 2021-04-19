package com.Dao;

import java.util.Collections;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Todo;

@Component
public class TodoDao {


	@Autowired
	HibernateTemplate hibernateTemplate;

	
	@Transactional
	public int save(Todo todo) {
		int res = (Integer) this.hibernateTemplate.save(todo);
		return res;
	}

	public List<Todo> getAll() {
		List<Todo> todos;
		todos = this.hibernateTemplate.loadAll(Todo.class);
		Collections.reverse(todos);
		return todos;
	}
}
