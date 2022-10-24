package com.example.rosacrm.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class CustomLogoutHandler implements LogoutHandler {

    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        SecurityContextHolder.clearContext();
        HttpSession hs = request.getSession();
        hs.invalidate();

        try {
            response.sendRedirect("/signin");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}