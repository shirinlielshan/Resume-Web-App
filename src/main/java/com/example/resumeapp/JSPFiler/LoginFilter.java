package com.example.resumeapp.JSPFiler;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "LoginFiler", value = {"*"})
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("loggedInUser") != null);
        boolean isLoginPage = (request.getRequestURI().endsWith("login"));
        String loginURI = request.getContextPath() + "/login";
        boolean isLoginRequest = request.getRequestURI().equals(loginURI);

        try{
            if(isLoggedIn && (isLoginPage || isLoginRequest)){
                System.out.println("EEE");
                RequestDispatcher dispatcher = request.getRequestDispatcher("user");
                dispatcher.forward(request, response);
            }else if(isLoggedIn || isLoginRequest){
                filterChain.doFilter(request,response);
            }else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("login");
                dispatcher.forward(request, response);
            }
        }catch (IOException | ServletException e){
            throw new RuntimeException(e);
        }

    }
}
