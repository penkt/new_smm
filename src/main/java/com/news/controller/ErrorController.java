package com.news.controller;

import com.news.exception.NotFoundExpection;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
@RequestMapping("/")
public class ErrorController {

    @ExceptionHandler(NotFoundExpection.class)
    public String handleStaffNotFound(Exception exception, WebRequest request)
    {
        return "redirect:/error/404";
    }

}
