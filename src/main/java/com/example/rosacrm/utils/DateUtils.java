package com.example.rosacrm.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateUtils {

    private static SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");


    public static String convertDateToString(Date date) {
        if (date != null) {
            return sdf.format(date);
        }
        return "";
    }

    public static Date convertStringToDate(String date) {
        if (date != null) {
            try {
                return sdf.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public static Timestamp convertHtmlDateToDateStamp(String date) {
        String pattern = "yyyy-MM-dd,HH:mm";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        if (date != null) {
            date = date.replaceFirst("T", ",");
            LocalDateTime localDateTime = LocalDateTime.from(formatter.parse(date));
            return Timestamp.valueOf(localDateTime);
        }
        return null;
    }

}
