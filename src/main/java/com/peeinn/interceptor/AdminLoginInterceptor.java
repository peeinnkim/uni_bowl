package com.peeinn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("ADMIN LOGINPOST INTERCEPTOR");
		Object auth = request.getSession().getAttribute("Auth");
		System.out.println("auth->>>" + auth);
		Object dest = request.getSession().getAttribute("dest");
		System.out.println("dest->>>" + dest);
		
		if(auth != null) {
			System.out.println("Auth 있음");
			if(dest != null) {//이동할 목적지가 저장되어 있을 경우 그곳으로 이동
				System.out.println("des 없음");
				response.sendRedirect((String)dest);
			} else {
				System.out.println("INTRANET SALES 이동");
				response.sendRedirect(request.getContextPath() + "/admin/gnr/sales"); 
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/member/login"); 
		}
	}  

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}


}// LoginInterceptor
