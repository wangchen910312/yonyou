
package chn.bhmc.dms.security.config;

import javax.sql.DataSource;

public class SecurityConfig {
    public static final String DEF_USERS_BY_USERNAME_QUERY_SQL = "SELECT * FROM CM_0801T WHERE USR_ID = ?";
    public static final String DEF_AUTHORITIES_BY_USERNAME_QUERY_SQL = "SELECT REF_ID AS USER_ID, ROLE_ID AS AUTHORITY FROM CM_0803T WHERE REF_ID = ?";

	private String loginUrl;
	private String loginUrlParameter;
	private String loginFormProcessUrl;
	private String logoutSuccessUrl;
	private String logoutSuccessUrlParameter;
	private String loginFailureUrl;
	private String loginFailureUrlParameter;
	private String accessDeniedUrl;

	private DataSource dataSource;

	private String jdbcUsersByUsernameQuery = DEF_USERS_BY_USERNAME_QUERY_SQL;
	private String jdbcAuthoritiesByUsernameQuery = DEF_AUTHORITIES_BY_USERNAME_QUERY_SQL;

	private String jdbcMapClass = "chn.bhmc.dms.security.userdetails.DefaultMapUserDetailsMapping";

	private String requestMatcherType = "regex";		// regex, ant, ciRegex (case-insensitive)
	private String hash = "sha-256";					// hashing algorithm
	private boolean hashBase64 = true;					// default = true

	private int concurrentMaxSessons;
	private String concurrentExpiredUrl;

	private String defaultTargetUrl;
	private String defaultTargetUrlParameter;

	private boolean supportPointcut;

	public String getLoginUrl() {
		return loginUrl;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}

	public String getLoginUrlParameter() {
		return loginUrlParameter;
	}

	public void setLoginUrlParameter(String loginUrlParameter) {
		this.loginUrlParameter = loginUrlParameter;
	}

	/**
     * @return the loginFormProcessUrl
     */
    public String getLoginFormProcessUrl() {
        return loginFormProcessUrl;
    }

    /**
     * @param loginFormProcessUrl the loginFormProcessUrl to set
     */
    public void setLoginFormProcessUrl(String loginFormProcessUrl) {
        this.loginFormProcessUrl = loginFormProcessUrl;
    }

    public String getLogoutSuccessUrl() {
		return logoutSuccessUrl;
	}

	public void setLogoutSuccessUrl(String logoutSuccessUrl) {
		this.logoutSuccessUrl = logoutSuccessUrl;
	}

	public String getLogoutSuccessUrlParameter() {
		return logoutSuccessUrlParameter;
	}

	public void setLogoutSuccessUrlParameter(String logoutSuccessUrlParameter) {
		this.logoutSuccessUrlParameter = logoutSuccessUrlParameter;
	}

    public String getLoginFailureUrl() {
		return loginFailureUrl;
	}

	public void setLoginFailureUrl(String loginFailureUrl) {
		this.loginFailureUrl = loginFailureUrl;
	}

	public String getLoginFailureUrlParameter() {
		return loginFailureUrlParameter;
	}

	public void setLoginFailureUrlParameter(String loginFailureUrlParameter) {
		this.loginFailureUrlParameter = loginFailureUrlParameter;
	}

	public String getAccessDeniedUrl() {
		return accessDeniedUrl;
	}

	public void setAccessDeniedUrl(String accessDeniedUrl) {
		this.accessDeniedUrl = accessDeniedUrl;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public String getJdbcUsersByUsernameQuery() {
		return jdbcUsersByUsernameQuery;
	}

	public void setJdbcUsersByUsernameQuery(String jdbcUsersByUsernameQuery) {
		this.jdbcUsersByUsernameQuery = jdbcUsersByUsernameQuery;
	}

	public String getJdbcAuthoritiesByUsernameQuery() {
		return jdbcAuthoritiesByUsernameQuery;
	}

	public void setJdbcAuthoritiesByUsernameQuery(String jdbcAuthoritiesByUsernameQuery) {
		this.jdbcAuthoritiesByUsernameQuery = jdbcAuthoritiesByUsernameQuery;
	}

	public String getJdbcMapClass() {
		return jdbcMapClass;
	}

	public void setJdbcMapClass(String jdbcMapClass) {
		this.jdbcMapClass = jdbcMapClass;
	}

	public String getRequestMatcherType() {
		return requestMatcherType;
	}

	public void setRequestMatcherType(String requestMatcherType) {
		this.requestMatcherType = requestMatcherType;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public boolean isSupportPointcut() {
		return supportPointcut;
	}

	public void setSupportPointcut(boolean supportPointcut) {
		this.supportPointcut = supportPointcut;
	}

	public int getConcurrentMaxSessons() {
		return concurrentMaxSessons;
	}

	public void setConcurrentMaxSessons(int concurrentMaxSessons) {
		this.concurrentMaxSessons = concurrentMaxSessons;
	}

	public String getConcurrentExpiredUrl() {
		return concurrentExpiredUrl;
	}

	public void setConcurrentExpiredUrl(String concurrentExpiredUrl) {
		this.concurrentExpiredUrl = concurrentExpiredUrl;
	}

	public String getDefaultTargetUrl() {
		return defaultTargetUrl;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}

	public String getDefaultTargetUrlParameter() {
		return defaultTargetUrlParameter;
	}

	public void setDefaultTargetUrlParameter(String defaultTargetUrlParameter) {
		this.defaultTargetUrlParameter = defaultTargetUrlParameter;
	}

	public boolean isHashBase64() {
		return hashBase64;
	}

	public void setHashBase64(boolean hashBase64) {
		this.hashBase64 = hashBase64;
	}
}
