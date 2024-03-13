package egovframework.com.cmm;


import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EgovComOthersExcepHndlr implements ExceptionHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComOthersExcepHndlr.class);

    public void occur(Exception exception, String packageName) {
    	//log.debug(" EgovServiceExceptionHandler run...............");
    	
//    	System.out.println("////////////////////////////////////////");
//    	System.out.println("EgovComOthersExcepHndlr");
//    	exception.printStackTrace();
//    	System.out.println("////////////////////////////////////////");
    	LOGGER.error(packageName, exception);
    }
}
