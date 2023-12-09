package com.bookshopweb.filter;

import com.bookshopweb.dto.ErrorMessage;
import com.bookshopweb.utils.JsonUtils;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;

@WebFilter(filterName = "ExceptionFilter", value = "/*")
public class ExceptionFilter implements Filter {
    
    	private ServletContext context;
	
	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("RequestLoggingFilter initialized");
	}
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        try {
            chain.doFilter(request, response);
        } catch (RuntimeException e) {
            ErrorMessage errorMessage = new ErrorMessage(400, e.toString());
            JsonUtils.out(response, errorMessage, HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
