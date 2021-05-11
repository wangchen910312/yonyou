package chn.bhmc.dms.cmm.sci.service;
import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import able.com.service.HService;

import java.util.Arrays;

import chn.bhmc.dms.core.util.LoginUtil;
public class UserServiceLogger extends HService {
	
	 public static final Logger log = LoggerFactory.getLogger(UserServiceLogger.class);
	
	  // 前置增强
	  public void before(JoinPoint joinPoint) {
		try {
			    SecurityContext context = SecurityContextHolder.getContext();
		        Authentication authentication = context.getAuthentication();
		        WebAuthenticationDetails webAuthenticationDetails = (WebAuthenticationDetails) authentication.getDetails();
		        String sessionId = webAuthenticationDetails.getSessionId();
				  log.info( "操作人id " +   LoginUtil.getUserId()
						   +" sessionId "+ sessionId
						    +" 操作人姓名 "+ LoginUtil.getUserNm()
						    +" 初始化调用 " + joinPoint.getTarget() 
						    + " 的 "
					        + joinPoint.getSignature() + "  方法，方法参数是：  "
					        + Arrays.toString(joinPoint.getArgs())
				         );
		} catch (Exception e) {
			
		}
		     
	  }
	  
	  // 后置增强
	  public void afterReturning(JoinPoint joinPoint,Object result) {
		 try {
			 
				  log.info("操作人id" +  LoginUtil.getUserId() +"操作人姓名" +   LoginUtil.getUserNm()
						    +"执行操作" + joinPoint.getTarget() + "的"
					        + joinPoint.getSignature() + "方法，方法的返回值是："
					        + result );
		} catch (Exception e) {
			// TODO: handle exception
		}
		  
	  }
}
