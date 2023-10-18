package com.example.resumeapp.JSPFiler;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

//@WebFilter(filterName = "JSPFilter", value = {"*.jsp"})
public class JSPFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String path = request.getRequestURI();
        System.out.println(path);
        try {
            if(path.contains("/index.jsp")){
                response.sendRedirect("login");
            }
            else{
                response.sendRedirect("error?msg=not found");
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
