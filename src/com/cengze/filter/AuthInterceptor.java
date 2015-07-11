package com.cengze.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cengze.entity.Manager;
import com.cengze.entity.User;
import com.cengze.util.auth.AuthPassport;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			AuthPassport authPassport = ((HandlerMethod)handler).getMethodAnnotation(AuthPassport.class);
			//没有声明需要权限，或者声明不验证权限
			if(authPassport == null || authPassport.validate() == false)
				return true;
			else {
				//在这实现权限验证
				Manager manager = (Manager) request.getSession().getAttribute("man");
				User user = (User) request.getSession().getAttribute("user");
				System.out.print(user +"2222");
				if(user != null) {
					System.out.println("4444");
					return true;
				}
				if(manager != null ) {
					System.out.println(manager.getPosition());
					if(manager.getPosition().equals("总经理")) {
						return true;
					}
					
					if(authPassport.managertype().equals("news")) {
						if(manager.getDepartment().getDepartmentname().equals("新闻部")) {
							return true;
						}
					}
					if(authPassport.managertype().equals("product")) {
						if(manager.getDepartment().getDepartmentname().equals("研发部"))
							return true;
					}
					if(authPassport.managertype().endsWith("PR")) {
						if(manager.getDepartment().getDepartmentname().equals("公关部")) {
							return true;
						}
					}
					
				}
				response.setContentType("text;utf-8");
				response.getWriter().print("0");
				
				return false;
			}
			
			
		}else
			return true;
	}
	
}
