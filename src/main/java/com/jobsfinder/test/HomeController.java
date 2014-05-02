package com.jobsfinder.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.map.util.JSONPObject;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import HibernateUtils.HibernateUtil;

import com.jobsfinder.entities.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		Session session = sessionFactory.openSession();
		User user = (User) session
				.createQuery("from User where userName =:user")
				.setParameter("user", authentication.getName()).uniqueResult();
		model.addAttribute("user", user);
		model.addAttribute("serverTime", formattedDate);

		return "hello";
	}

	@RequestMapping(value = "/getData", method = RequestMethod.GET)
	@ResponseBody
	public List<City> test() {

		Query q = sessionFactory.openSession().createQuery("from City");

		List<City> list = q.list();

		return list;
	}

	@RequestMapping(value = "/addNewCity", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
	@ResponseBody
	public City addNewCity(@RequestBody City city) {
		City newCity = null;

		Session session = sessionFactory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();

			newCity = new City();
			newCity.setCountry(city.getCountry());
			newCity.setName(city.getName());
			newCity.setRegionId(city.getRegionId());
			session.save(newCity);
			session.flush();
			tx.commit();

			return newCity;

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

}
