package com.example.resumeapp.controller;
import com.company.dao.inter.CountryDaoInter;
import com.company.dao.inter.UserDaoInter;
import com.company.entity.Country;
import com.company.entity.User;
import com.company.main.Context;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "UserDetailsController", value = "/user_details")
public class UserDetailsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try{
            String id = req.getParameter("id");
            if(id == null || id.trim().isEmpty()){
                throw new IllegalArgumentException("id is not specified");
            }
            int user_id = Integer.parseInt(id);
            UserDaoInter userDao = Context.instanceOfUserDao();
            User user = userDao.getById(user_id);
            if(user == null){
                throw new IllegalArgumentException("There is no user with this id");
            }
            CountryDaoInter countryDao = Context.instanceOfCountryDao();
            List<Country> countries = countryDao.getAll();
            req.setAttribute("countries", countries);
            req.setAttribute("user", user);
            req.getRequestDispatcher("userDetails.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("error?msg=" + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        UserDaoInter userDao = Context.instanceOfUserDao();
        int id = Integer.parseInt(req.getParameter("id"));
        String action = req.getParameter("action");
        if(action.equals("update")){
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phoneNumber");
            String address = req.getParameter("address");
            String profileDescription = req.getParameter("profileDescription");
            Date birthdate = Date.valueOf(req.getParameter("birthdate"));
            int country = Integer.parseInt(req.getParameter("country"));
            String password = userDao.getById(id).getPassword();
            User u = new User(id,firstName, lastName, email, phoneNumber, address, profileDescription, birthdate, country, password);
            userDao.updateUser(u);
            resp.sendRedirect("user");
        } else if (action.equals("delete")) {
            userDao.removeUserbyId(id);
            resp.sendRedirect("user");
        }
    }
}
