package com.example.rosacrm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
}
