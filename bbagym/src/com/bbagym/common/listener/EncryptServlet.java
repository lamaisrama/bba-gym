package com.bbagym.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.bbagym.common.encrypt.AESEncrypt;

/**
 * Application Lifecycle Listener implementation class EncryptServlet
 *
 */
@WebListener
public class EncryptServlet implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public EncryptServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	/* 암호화 객체를 생성*/
    	String path=arg0.getServletContext().getRealPath("/WEB-INF");
    	new AESEncrypt(path);
    }
	
}
