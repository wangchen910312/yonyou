package chn.bhmc.dms.cmm.core.security.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpRedirectFilter implements Filter {

	Logger logger = LoggerFactory.getLogger(HttpRedirectFilter.class);

	/**
	 * HTTP 포트
	 */
	private String httpPort;

	/**
	 * HTTPS 포트
	 */
	private String httpsPort;

	/**
	 * HTTPS URI 패턴
	 */
	private String httpsUriPatterns;

	/**
	 * 필터 제외 패턴
	 */
	private String excludeUriPatterns;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
	                      FilterChain chain) throws IOException, ServletException {

	    if(request instanceof HttpServletRequest && response instanceof HttpServletResponse) {

	    	HttpServletRequest httpReq = (HttpServletRequest) request;
	    	String requestUri = httpReq.getRequestURI().replaceFirst(httpReq.getContextPath(), "");

	    	if(excludeUriPatterns != null
	    			&& !requestUri.endsWith(httpsUriPatterns)
	    			&& requestUri.startsWith(excludeUriPatterns)){
	    		chain.doFilter(request, response);
	    		return;
	    	}

	    	String requestUrl = httpReq.getRequestURL().toString();
	    	String scheme = httpReq.getScheme();
	    	String redirectTarget = null;

	    	if(StringUtils.isNotEmpty(httpsUriPatterns) && requestUrl.endsWith(httpsUriPatterns)){
	    		if("http".equals(scheme)){
	    			redirectTarget = requestUrl.replaceFirst("http", "https");
	    			redirectTarget = redirectTarget.replaceFirst(":"+httpPort, ":"+httpsPort);
	    		}
	    	}else if("https".equals(scheme)){
	    		redirectTarget = requestUrl.replaceFirst("https", "http");
	    		redirectTarget = redirectTarget.replaceFirst(":"+httpsPort, ":"+httpPort);
	    	}

	    	if(redirectTarget != null) {
	            ((HttpServletResponse)response).sendRedirect(redirectTarget);
	        } else {
	            chain.doFilter(request, response);
	        }
	    }
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
        this.httpPort = StringUtils.defaultString(filterConfig.getInitParameter("httpPort"), "80");
        this.httpsPort = StringUtils.defaultString(filterConfig.getInitParameter("httpsPort"), "443");
        this.httpsUriPatterns = filterConfig.getInitParameter("httpsUriPatterns");
        this.excludeUriPatterns = filterConfig.getInitParameter("excludeUriPatterns");
	}

	@Override
	public void destroy() {
	}
}