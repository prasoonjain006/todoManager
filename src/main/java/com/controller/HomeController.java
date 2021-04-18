package com.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Dao.TodoDao;
import com.entities.Todo;

@Controller
public class HomeController {

	@Autowired
	TodoDao todoDao;

	@RequestMapping("/home")
	public String home(Model m) {

		String page = "home";
		m.addAttribute("page", page);
		List<Todo> todos = this.todoDao.getAll();
		m.addAttribute("todos", todos);
		return "home";
	}

	@RequestMapping("/add")
	public String add(Model m) {


		Todo todo = new Todo();
		m.addAttribute("todo", todo);

		String page = "add";
		m.addAttribute("page", page);
		return "home";
	}

	@RequestMapping(value = "/saveTodo", method = RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo todo, Model m) {

		todo.setDate(new Date());
		if (todo.getTitle().isEmpty()  || todo.getContent().isEmpty()) {
			m.addAttribute("lenError", "lenError");
		} else {
			this.todoDao.save(todo);

			m.addAttribute("msg", "Added Successfully !");
		}
		return "home";
	}

}
