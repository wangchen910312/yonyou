
package chn.bhmc.dms.security.userdetails.jdbc;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContextException;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.security.userdetails.CustomUserDetails;


public class CustomJdbcUserDetailsManager extends JdbcUserDetailsManager {
	private static final Logger LOGGER = LoggerFactory.getLogger(CustomJdbcUserDetailsManager.class);

	private CustomUserDetails userDetails = null;
    private UsersByUsernameMapping usersByUsernameMapping;

    private String mapClass;
    private RoleHierarchy roleHierarchy = null;

    /**
     * 사용자 테이블의 쿼리 조회 컬럼과 세션에서 사용할 사용자 VO와 메핑 할 클래스를 지정한다.
     * @param mapClass
     */
    public void setMapClass(String mapClass) {
        this.mapClass = mapClass;
    }

    /**
     * Role Hierarchy를 지원한다.
     * @param roleHierarchy
     */
    public void setRoleHierarchy(RoleHierarchy roleHierarchy) {
        this.roleHierarchy = roleHierarchy;
    }

    /**
     * JdbcUserDetailsManager 클래스 재정의
     */
    @Override
	protected void initDao() throws ApplicationContextException {
		super.initDao();

		try {
			initMappingSqlQueries();
		} catch (Exception e) {
			LOGGER.error("CustomJdbcUserDetailsManager.initDao.Exception : {}", e.toString(), e);
		}
    }

    /**
     * jdbc-user-service의 usersByUsernameQuery 사용자조회 쿼리와
     * authoritiesByUsernameQuery 권한조회 쿼리를 이용하여 정보를 저장한다.
     * @throws Exception
     * @throws ClassNotFoundException
     */
	private void initMappingSqlQueries() throws Exception  {

		LOGGER.debug("## CustomJdbcUserDetailsManager query : {}", getUsersByUsernameQuery());

		LOGGER.debug("Mapping Class : {}", this.mapClass);
        Class<?> clazz = ObjectUtil.loadClass(this.mapClass);
        Constructor<?> constructor = clazz.getConstructor(new Class[] {DataSource.class, String.class });
        Object[] params = new Object[] { getDataSource(), getUsersByUsernameQuery() };

        this.usersByUsernameMapping = (UsersByUsernameMapping) constructor.newInstance(params);
    }

    /**
     * JdbcDaoImpl 클래스의 loadUsersByUsername 메소드 재정의.
     * 사용자명(또는 ID)로 UserDetails 정보를 조회하여 리스트 형식으로 저장한다.
     */
    @Override
    protected List<UserDetails> loadUsersByUsername(String username) {
        List<CustomUserDetails> list = usersByUsernameMapping.execute(username);
        ArrayList<UserDetails> newList = new ArrayList<UserDetails>();

        for (UserDetails user : list) {
        	newList.add(user);
        }

        return newList;
    }

    /**
     * JdbcDaoImpl 클래스의 loadUserByUsername 메소드 재정의.
     * 사용자명(또는 ID)로 UserDetails의 정보를 조회한다.
     * @param username
     * @return
     * @throws UsernameNotFoundException
     * @throws DataAccessException
     */
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException, DataAccessException {

        List<UserDetails> users = loadUsersByUsername(username);

        if (users.size() == 0) {
        	LOGGER.debug("Query returned no results for user '{}'", username);
			throw new UsernameNotFoundException(messages.getMessage("CustomJdbcUserDetailsManager.notFound", new Object[] { username }, "Username {0} not found"));
        }

        UserDetails obj = users.get(0);
        this.userDetails = (CustomUserDetails) obj;

        Set<GrantedAuthority> dbAuthsSet = new HashSet<GrantedAuthority>();

        dbAuthsSet.addAll(loadUserAuthorities(this.userDetails.getUsername()));

        List<GrantedAuthority> dbAuths = new ArrayList<GrantedAuthority>(dbAuthsSet);

        addCustomAuthorities(this.userDetails.getUsername(), dbAuths);

        if (dbAuths.size() == 0) {
			throw new UsernameNotFoundException(messages.getMessage("CustomJdbcUserDetailsManager.noAuthority", new Object[] { username }, "User {0} has no GrantedAuthority"));
        }

        // RoleHierarchyImpl 에서 저장한 Role Hierarchy 정보가 저장된다.
        Collection<? extends GrantedAuthority> authorities = roleHierarchy.getReachableGrantedAuthorities(dbAuths);

        // JdbcDaoImpl 클래스의 createUserDetails 메소드 재정의
        return new CustomUserDetails(this.userDetails.getUsername(),
            this.userDetails.getPassword(), this.userDetails.isEnabled(), true,
            true, true, authorities, this.userDetails.getCustomUserVO());
    }

    /**
     * 인증된 사용자 이름으로 사용자정보(UserDetails)를 가져온다.
     * @return
     * @throws UsernameNotFoundException
     * @throws DataAccessException
     */
    public UserDetails getAuthenticatedUser() throws UsernameNotFoundException, DataAccessException {
        return loadUserByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    }

}
