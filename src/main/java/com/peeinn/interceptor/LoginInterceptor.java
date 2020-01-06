package com.peeinn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Object auth = request.getSession().getAttribute("Auth");
		Object dest = request.getSession().getAttribute("dest");
		
		if(auth != null) {
			if(dest != null) {//이동할 목적지가 저장되어 있을 경우 그곳으로 이동
				response.sendRedirect((String)dest);
			} else { //목적지가 저장되어있지 않을 경우 home으로 이동
				response.sendRedirect(request.getContextPath()); 
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/user/member/login"); 
		}
	}  

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return super.preHandle(request, response, handler);
	}


}// LoginInterceptor
