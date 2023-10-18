package com.example.resumeapp.controller;
import com.company.dao.inter.UserDaoInter;
import com.company.entity.User;
import com.company.main.Context;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "UserController" , value = "/user")
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        try {
            UserDaoInter userDao = Context.instanceOfUserDao();
            List<User> users = userDao.search(req.getParameter("firstname"), req.getParameter("lastname"), req.getParameter("email"));
            req.setAttribute("users", users);
            req.getRequestDispatcher("user.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
