
package chn.bhmc.dms.security.config;

public class SecuredObjectConfig {

    private String sqlViewResourceMapping;
    private String sqlHierarchicalRoles;
    private String sqlRolesAndUrl;
    private String sqlRolesAndMethod;
    private String sqlRolesAndPointcut;
    private String sqlRegexMatchedRequestMapping;
    private String roleHierarchyString;

	public String getSqlRolesAndUrl() {
		return sqlRolesAndUrl;
	}

	public void setSqlRolesAndUrl(String sqlRolesAndUrl) {
		this.sqlRolesAndUrl = sqlRolesAndUrl;
	}

	public String getSqlRolesAndMethod() {
		return sqlRolesAndMethod;
	}

	public void setSqlRolesAndMethod(String sqlRolesAndMethod) {
		this.sqlRolesAndMethod = sqlRolesAndMethod;
	}

	public String getSqlRolesAndPointcut() {
		return sqlRolesAndPointcut;
	}

	public void setSqlRolesAndPointcut(String sqlRolesAndPointcut) {
		this.sqlRolesAndPointcut = sqlRolesAndPointcut;
	}

	public String getSqlRegexMatchedRequestMapping() {
		return sqlRegexMatchedRequestMapping;
	}

	public void setSqlRegexMatchedRequestMapping(String sqlRegexMatchedRequestMapping) {
		this.sqlRegexMatchedRequestMapping = sqlRegexMatchedRequestMapping;
	}

	public String getSqlHierarchicalRoles() {
		return sqlHierarchicalRoles;
	}

	public void setSqlHierarchicalRoles(String sqlHierarchicalRoles) {
		this.sqlHierarchicalRoles = sqlHierarchicalRoles;
	}

	public String getSqlViewResourceMapping() {
		return sqlViewResourceMapping;
	}

	public void setSqlViewResourceMapping(String sqlViewResourceMapping) {
		this.sqlViewResourceMapping = sqlViewResourceMapping;
	}

	public String getRoleHierarchyString() {
		return roleHierarchyString;
	}

	public void setRoleHierarchyString(String roleHierarchyString) {
		this.roleHierarchyString = roleHierarchyString;
	}
}
