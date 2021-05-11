package chn.bhmc.dms.core.context;

import org.springframework.context.ApplicationContext;

public class WebAppContext {

	private static ApplicationContext ctx;

	public static void setApplicationContext(ApplicationContext applicationContext) {
		WebAppContext.ctx = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return ctx;
	}

}
