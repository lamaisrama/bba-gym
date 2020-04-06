package com.bbagym.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bbagym.model.vo.Member;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter(urlPatterns= {"/board/*","/notice/*"})
public class LoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }

   /**
    * @see Filter#destroy()
    */
   public void destroy() {
      // TODO Auto-generated method stub
   }

   /**
    * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
    */
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      // TODO Auto-generated method stub
      // place your code here
      HttpSession session = ((HttpServletRequest)request).getSession();
      
      Member login=(Member)session.getAttribute("logginMember");
      if(login==null) {
         request.setAttribute("msg", "로그인 후 이용가능합니다.");
         request.setAttribute("loc", "/");
         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
      }else {
         chain.doFilter(request, response);
      }

      // pass the request along the filter chain
      
   }

   /**
    * @see Filter#init(FilterConfig)
    */
   public void init(FilterConfig fConfig) throws ServletException {
      // TODO Auto-generated method stub
   }

}