package com.seegene.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.seegene.web.admin.log.error.service.LogErrorService;

public class ErrorExceptionResolver extends SimpleMappingExceptionResolver{

	@Autowired
	private LogErrorService errorService;
	
	@Override
	protected ModelAndView doResolveException(HttpServletRequest req, HttpServletResponse res, Object handler,
			Exception ex) {
		
		ex.printStackTrace();
		errorService.addErrorLog(req, ex);
		
		return super.doResolveException(req, res, handler, ex);
	}

	
	
}
