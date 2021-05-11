package chn.bhmc.dms.core.context;

import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.web.context.ServletContextAware;

public class ServletContextProvider implements ServletContextAware {
	@Override
	public void setServletContext(ServletContext context) throws BeansException {
		WebContext.setServletContext(context);
	}
}