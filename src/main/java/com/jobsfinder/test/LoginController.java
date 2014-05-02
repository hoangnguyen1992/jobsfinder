package com.jobsfinder.test;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestContext;

import com.jobsfinder.entities.Authority;
import com.jobsfinder.entities.User;

import HibernateUtils.HibernateUtil;

@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	/** Injecting */ 
	@Autowired 
	/** This annotation is used when we want to inject candidate beans */
	@Qualifier("authMgr") 
	private AuthenticationManager authMgr;
	
	@Autowired 
	private UserDetailsService userDetailsSvc;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	 
	@RequestMapping("/login")
	public String doLogin(HttpServletRequest request, HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		RequestContext ctx = new RequestContext(request);
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(@ModelAttribute("user") User user){
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user, BindingResult result,  HttpServletRequest request, HttpServletResponse response) throws Exception{
		 try {
			 	Session session = sessionFactory.openSession();
				Transaction tx = null;	
			 	tx = session.beginTransaction();
				user.setEnabled(true);
				String plainPassword = user.getPassword();
				String encodedPassword = passwordEncoder.encodePassword(user.getPassword(), null);
				user.setPassword(encodedPassword);
				Authority authority = new Authority();
				authority.setUser(user);
				authority.setAuthority("ROLE_USER");
				session.save(user);
				session.save(authority);
				session.flush();
				tx.commit();
				
				user.setPassword(plainPassword);

			  UserDetails userDetails = userDetailsSvc.loadUserByUsername(user.getUserName());
		      UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetails, user.getPassword(), userDetails.getAuthorities());
		      authMgr.authenticate(auth);
		 
		      // redirect into secured main page if authentication successful
		      if(auth.isAuthenticated()) {
		        SecurityContextHolder.getContext().setAuthentication(auth);
		        return "redirect:/";
		      }
		    } catch (Exception e) {
		      logger.debug("Problem authenticating user" + user.getUserName(), e);
		    }
		    return "redirect:/login";
	}
	
}
