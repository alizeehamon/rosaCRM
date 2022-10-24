package com.example.rosacrm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    @GetMapping
    public String displayCalendar(Model model){
        return "calendarPage";
    }
}
