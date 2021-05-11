package chn.bhmc.dms.core.context;

import javax.servlet.ServletContext;


public class WebContext {

	private static ServletContext servletContext = null;

	public static ServletContext getServletContext() {
		return servletContext;
	}

	public static void setServletContext(ServletContext servletContext) {
		WebContext.servletContext = servletContext;
	}

	public static String getInitParameter(String paramName){
		return servletContext.getInitParameter(paramName);
	}

	public static String getContextPath(){
		return servletContext.getContextPath();
	}

	public static String getRealPath(String path){
		return servletContext.getRealPath(path);
	}

}
