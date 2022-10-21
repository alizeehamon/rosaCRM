package com.example.rosacrm.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.NoSuchElementException;

@ControllerAdvice
public class GlobalExceptionHandler {

    public static final String DEFAULT_ERROR_VIEW = "error";

    @ExceptionHandler(value = NoSuchElementException.class)
    public String notFoundErrorHandler() {
        return DEFAULT_ERROR_VIEW;
    }
}