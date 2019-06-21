/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 *
 * @author Makis
 */
@Component
@Order(1)
public class TransactionFilter 
//        implements Filter
{

//    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
               sr.setCharacterEncoding("UTF-8");
               sr1.setCharacterEncoding("UTF-8");
               System.out.println(sr.getCharacterEncoding());
               System.out.println(sr1.getCharacterEncoding());
               
               HttpServletRequest req = (HttpServletRequest)sr;
               HttpServletResponse res = (HttpServletResponse)sr1;
               
               System.out.println(req.getRequestURI());
               
    }

}
