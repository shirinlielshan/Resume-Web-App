package com.example.resumeapp.controller;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.company.dao.inter.UserDaoInter;
import com.company.entity.User;
import com.company.main.Context;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "userLoginController", value = "/login")
public class UserLoginController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        try {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        UserDaoInter userDao = Context.instanceOfUserDao();
        User user = userDao.searchByEmail(req.getParameter("email"));
        BCrypt.Result result = BCrypt.verifyer().verify(req.getParameter("password").toCharArray(), user.getPassword());
        if(result.verified){
            req.getSession().setAttribute("loggedInUser", user);
            resp.sendRedirect("user");

        }else {
            resp.sendRedirect("login");
        }
    }

}
