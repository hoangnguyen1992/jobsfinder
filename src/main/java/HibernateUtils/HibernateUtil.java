package HibernateUtils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {
	
	private static SessionFactory sessionFactory = null;
	
	static {
		try{
			sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		}catch(Throwable e){
			System.err.println("Initial SessionFactory creation failed." + e);
			throw new ExceptionInInitializerError(e);
		}
	}
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public static Session openSession(){
		return sessionFactory.openSession();
	}
	
	public static void close(){
		sessionFactory.close();
	}
	
}
