
package chn.bhmc.dms.security.securedobject.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RegexRequestMatcher;
import org.springframework.util.StringUtils;

import chn.bhmc.dms.security.config.SecuredObjectConfig;

public class SecuredObjectDAO implements ApplicationContextAware {

	private static final Logger LOGGER = LoggerFactory.getLogger(SecuredObjectDAO.class);

    /**
     * url 형식인 보호자원 - Role 맵핑정보를 조회하는 default 쿼리이다.
     */
    public static final String DEF_ROLES_AND_URL_QUERY =
        "SELECT T1.RESOURCE_PATTERN URL, T2.ROLE_ID AUTHORITY "
            + "FROM CM_0806T T1, CM_0807T T2 "
            + "WHERE T1.RESOURCE_ID = T2.RESOURCE_ID "
            + "AND T1.RESOURCE_TP = 'URL' ORDER BY T1.SORT_ORDER ";

    /**
     * method 형식인 보호자원 - Role 맵핑정보를 조회하는 default 쿼리이다.
     */
    public static final String DEF_ROLES_AND_METHOD_QUERY =
        "SELECT T1.RESOURCE_PATTERN METHOD, T2.ROLE_ID AUTHORITY "
            + "FROM CM_0806T T1, CM_0807T T2 "
            + "WHERE T1.RESOURCE_ID = T2.RESOURCE_ID "
            + "AND T1.RESOURCE_TP = 'METHOD' ORDER BY T1.SORT_ORDER ";

    /**
     * pointcut 형식인 보호자원 - Role 맵핑정보를 조회하는 default 쿼리이다.
     */
    public static final String DEF_ROLES_AND_POINTCUT_QUERY =
        "SELECT T1.RESOURCE_PATTERN POINTCUT, T2.ROLE_ID AUTHORITY "
            + "FROM CM_0806T T1, CM_0807T T2 "
            + "WHERE T1.RESOURCE_ID = T2.RESOURCE_ID "
            + "AND T1.RESOURCE_TP = 'POINTCUT' ORDER BY T1.SORT_ORDER ";

    /**
     * 매 request 마다 best matching url 보호자원 - Role 맵핑정보를 얻기위한 default 쿼리이다.
     * (Oracle 10g specific)
     */
    public static final String DEF_REGEX_MATCHED_REQUEST_MAPPING_QUERY_ORACLE10G =
        "SELECT T1.RESOURCE_PATTERN URI, T2.ROLE_ID AUTHORITY "
            + "FROM CM_0806T T1, CM_0807T T2 "
            + "WHERE T1.RESOURCE_ID = T2.RESOURCE_ID "
            + "AND T1.RESOURCE_ID =  "
            + " ( SELECT RESOURCE_ID FROM "
            + "    ( SELECT RESOURCE_ID, ROW_NUMBER() OVER (ORDER BY SORT_ORDER) RESOURCE_ORDER FROM CM_0806T V1 "
            + "      WHERE REGEXP_LIKE ( :URL, V1.RESOURCE_PATTERN ) "
            + "      AND V1.RESOURCE_TP = 'URL' "
            + "      ORDER BY V1.SORT_ORDER ) "
            + "   WHERE RESOURCE_ORDER = 1 ) ";

    /**
     * Role 의 계층(Hierarchy) 관계를 조회하는 default 쿼리이다.
     */
    public static final String DEF_HIERARCHICAL_ROLES_QUERY =
        "SELECT T1.CHILD_ROLE_ID CHILD, T1.PARENT_ROLE_ID PARENT "
            + "FROM CM_0805T T1 LEFT JOIN CM_0805T T2 ON (T1.CHILD_ROLE_ID = T2.PARENT_ROLE_ID) ";

    public static final String DEF_VIEW_RESOURCE_MAPPING_QUERY =
		"SELECT T2.VIEW_ID, T2.REF_TP, T2.REF_ID, T2.MASK, T2.PERMISSIONS  "
			+ "FROM CM_0810T T2, CM_0809T T1 "
			+ "WHERE T1.VIEW_ID = :viewId "
			+ "AND T1.VIEW_ID = T2.VIEW_ID "
			//+ "AND T1.VISIBLE = 'Y' "
			+ "AND ( "
			+ "		   ( T2.REF_ID IN ( {{userRoleList}} ) AND T2.REF_TP = 'R' ) "
			+ "		OR ( T2.REF_ID = :userId AND T2.REF_TP = 'U' ) "
			+ "		OR ( T2.REF_ID = :groupId AND T2.REF_TP = 'G' ) "
			+ "	) "
			+ "ORDER BY CASE T2.REF_TP WHEN 'U' THEN 1 WHEN 'G' THEN 2 WHEN 'R' THEN 3 ELSE 10 END, T2.REF_ID ";

    private String sqlRolesAndUrl;

    private String sqlRolesAndMethod;

    private String sqlRolesAndPointcut;

    private String sqlRegexMatchedRequestMapping;

    private String sqlHierarchicalRoles;

    private String sqlViewResourceMapping;

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    private ApplicationContext context;

    public SecuredObjectDAO() {
		this.sqlRolesAndUrl = DEF_ROLES_AND_URL_QUERY;
		this.sqlRolesAndMethod = DEF_ROLES_AND_METHOD_QUERY;
		this.sqlRolesAndPointcut = DEF_ROLES_AND_POINTCUT_QUERY;
		this.sqlRegexMatchedRequestMapping = DEF_REGEX_MATCHED_REQUEST_MAPPING_QUERY_ORACLE10G;
		this.sqlHierarchicalRoles = DEF_HIERARCHICAL_ROLES_QUERY;
		this.sqlViewResourceMapping = DEF_VIEW_RESOURCE_MAPPING_QUERY;
    }

    public void setDataSource(DataSource dataSource) {
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context = context;
	}

	@PostConstruct
	public void securedObjectConfigInit() {
		if (context.getBeanNamesForType(SecuredObjectConfig.class).length > 0) {
			SecuredObjectConfig config = context.getBean(SecuredObjectConfig.class);

			if (StringUtils.hasText(config.getSqlRolesAndUrl())) {
				sqlRolesAndUrl = config.getSqlRolesAndUrl();
			}

			if (StringUtils.hasText(config.getSqlRolesAndMethod())) {
				sqlRolesAndMethod = config.getSqlRolesAndMethod();
			}

			if (StringUtils.hasText(config.getSqlRolesAndPointcut())) {
				sqlRolesAndPointcut = config.getSqlRolesAndPointcut();
			}

			if (StringUtils.hasText(config.getSqlRegexMatchedRequestMapping())) {
				sqlRegexMatchedRequestMapping = config.getSqlRegexMatchedRequestMapping();
			}

			if (StringUtils.hasText(config.getSqlHierarchicalRoles())) {
				sqlHierarchicalRoles = config.getSqlHierarchicalRoles();
			}

			if (StringUtils.hasText(config.getSqlViewResourceMapping())) {
				sqlViewResourceMapping = config.getSqlViewResourceMapping();
			}
		}

	}

    /**
     * 롤에 대한 URL 정보를 가져오는 SQL을 얻어온다.
     * @return
     */
    public String getSqlRolesAndUrl() {
        return sqlRolesAndUrl;
    }

    /**
     * 롤에대한 URL 정보를 가져오는 SQL을 설정한다.
     * @param sqlRolesAndUrl
     */
    public void setSqlRolesAndUrl(String sqlRolesAndUrl) {
        this.sqlRolesAndUrl = sqlRolesAndUrl;
    }

    /**
     *  롤에 대한 메소드 정보를 가져오는 SQL을 얻어온다.
     * @return
     */
    public String getSqlRolesAndMethod() {
        return sqlRolesAndMethod;
    }

    /**
     * 롤에 대한 메소드 정보를 가져오는 SQL을 설정한다.
     * @param sqlRolesAndMethod
     */
    public void setSqlRolesAndMethod(String sqlRolesAndMethod) {
        this.sqlRolesAndMethod = sqlRolesAndMethod;
    }

    /**
     * 롤에 대한 포인트컷 정보를 가져오는 SQL을 얻어온다.
     * @return
     */
    public String getSqlRolesAndPointcut() {
        return sqlRolesAndPointcut;
    }

    /**
     * 롤에 대한 포인트컷 정보를 가져오는 SQL을 설정한다.
     * @param sqlRolesAndPointcut
     */
    public void setSqlRolesAndPointcut(String sqlRolesAndPointcut) {
        this.sqlRolesAndPointcut = sqlRolesAndPointcut;
    }

    /**
     *  매핑 정보를 가져오는 SQL을 얻어온다.
     * @return
     */
    public String getSqlRegexMatchedRequestMapping() {
        return sqlRegexMatchedRequestMapping;
    }

    /**
     * 매핑 정보를 가져오는 SQL을 설정한다.
     * @param sqlRegexMatchedRequestMapping
     */
    public void setSqlRegexMatchedRequestMapping(String sqlRegexMatchedRequestMapping) {
        this.sqlRegexMatchedRequestMapping = sqlRegexMatchedRequestMapping;
    }

    /**
     * 롤 계층구조 정보를 가져오는 SQL을 얻어온다.
     * @return
     */
    public String getSqlHierarchicalRoles() {
        return sqlHierarchicalRoles;
    }

    /**
     * 롤 계층구조 정보를 가져오는 SQL을 설정한다.
     * @param sqlHierarchicalRoles
     */
    public void setSqlHierarchicalRoles(String sqlHierarchicalRoles) {
        this.sqlHierarchicalRoles = sqlHierarchicalRoles;
    }

    /**
     * 화면 매핑 정보를 가져오는 SQL을 얻어온다.
     * @return
     */
    public String getSqlViewResourceMapping() {
		return sqlViewResourceMapping;
	}

    /**
     * 화면 매핑 정보를 가져오는 SQL을 설정한다.
     * @param sqlViewResourceMapping
     */
	public void setSqlViewResourceMapping(String sqlViewResourceMapping) {
		this.sqlViewResourceMapping = sqlViewResourceMapping;
	}

	/**
     * 리소스 유형에 대한 할당된 롤 정보를 가져온다.
     *
     * @param resourceType
     * @return
     * @throws Exception
     */
    public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndResources(String resourceType, String requestMatcherType) throws Exception {

        LinkedHashMap<Object, List<ConfigAttribute>> resourcesMap = new LinkedHashMap<Object, List<ConfigAttribute>>();

        String sqlRolesAndResources;
        boolean isResourcesUrl = true;

        if ("method".equals(resourceType)) {
            sqlRolesAndResources = getSqlRolesAndMethod();
            isResourcesUrl = false;
        } else if ("pointcut".equals(resourceType)) {
            sqlRolesAndResources = getSqlRolesAndPointcut();
            isResourcesUrl = false;
        } else {
            sqlRolesAndResources = getSqlRolesAndUrl();
        }

        List<Map<String, Object>> resultList = this.namedParameterJdbcTemplate.queryForList(sqlRolesAndResources, new HashMap<String, String>());

        Iterator<Map<String, Object>> itr = resultList.iterator();
        Map<String, Object> tempMap;
        String preResource = null;
        String presentResourceStr;
        Object presentResource;
        while (itr.hasNext()) {
            tempMap = itr.next();

            presentResourceStr = (String) tempMap.get(resourceType);
            // url 인 경우 RequestKey 형식의 key를 Map에 담아야 함
            if (isResourcesUrl) {
            	if (requestMatcherType.equalsIgnoreCase("regex")) {
            		presentResource = new RegexRequestMatcher(presentResourceStr, null);
            	} else if (requestMatcherType.equalsIgnoreCase("ciRegex")) {
            		presentResource = new RegexRequestMatcher(presentResourceStr, null, true);
            	} else {
            		presentResource = new AntPathRequestMatcher(presentResourceStr);
            	}
            } else {
            	presentResource = presentResourceStr;
            }
            List<ConfigAttribute> configList = new LinkedList<ConfigAttribute>();

            // 이미 requestMap 에 해당 Resource 에 대한 Role 이 하나 이상 맵핑되어 있었던 경우,
            // sort_order 는 resource(Resource) 에 대해 매겨지므로 같은 Resource 에 대한 Role 맵핑은 연속으로 조회됨.
            // 해당 맵핑 Role List (SecurityConfig) 의 데이터를 재활용하여 새롭게 데이터 구축
            if (preResource != null && presentResourceStr.equals(preResource)) {
                List<ConfigAttribute> preAuthList = resourcesMap.get(presentResource);

                if(preAuthList != null){
                    Iterator<ConfigAttribute> preAuthItr = preAuthList.iterator();
                    while (preAuthItr.hasNext()) {
                        SecurityConfig tempConfig = (SecurityConfig) preAuthItr.next();
                        configList.add(tempConfig);
                    }
                }
            }

            configList.add(new SecurityConfig((String) tempMap.get("authority")));

            // 만약 동일한 Resource 에 대해 한개 이상의 Role 맵핑 추가인 경우
            // 이전 resourceKey 에 현재 새로 계산된 Role 맵핑 리스트로 덮어쓰게 됨.
            resourcesMap.put(presentResource, configList);

            // 이전 resource 비교위해 저장
            preResource = presentResourceStr;
        }

        return resourcesMap;
    }

    public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndUrl(String requestMatcherType) throws Exception {
        return getRolesAndResources("url", requestMatcherType);
    }

    public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndMethod() throws Exception {
        return getRolesAndResources("method", null);
    }

    public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndPointcut() throws Exception {
        return getRolesAndResources("pointcut", null);
    }

    public List<ConfigAttribute> getRegexMatchedRequestMapping(String url) throws Exception {

        // best regex matching - best 매칭된 Uri 에 따른 Role List 조회,
    	// DB 차원의 정규식 지원이 있는 경우 사용 (ex. hsqldb custom function, Oracle 10g regexp_like 등)
        Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("url", url);
        List<Map<String, Object>> resultList = this.namedParameterJdbcTemplate.queryForList(getSqlRegexMatchedRequestMapping(), paramMap);

        Iterator<Map<String, Object>> itr = resultList.iterator();
        Map<String, Object> tempMap;
        List<ConfigAttribute> configList = new LinkedList<ConfigAttribute>();
        // 같은 Uri 에 대한 Role 맵핑이므로 무조건 configList 에 add 함
        while (itr.hasNext()) {
            tempMap = itr.next();
            configList.add(new SecurityConfig((String)tempMap.get("authority")));
        }

        if (configList.size() > 0) {
        	LOGGER.debug("Request Uri : {}, matched Uri : {}, mapping Roles : {}", new Object[]{url, resultList.get(0).get("uri"), configList});
        }

        return configList;
    }

    public String getHierarchicalRoles() throws Exception {

    	List<Map<String, Object>> resultList = this.namedParameterJdbcTemplate.queryForList(getSqlHierarchicalRoles(), new HashMap<String, String>());

        Iterator<Map<String, Object>> itr = resultList.iterator();
        StringBuffer concatedRoles = new StringBuffer();
        Map<String, Object> tempMap;
        while (itr.hasNext()) {
            tempMap = itr.next();
            concatedRoles.append(tempMap.get("child"));
            concatedRoles.append(" > ");
            concatedRoles.append(tempMap.get("parent"));
            concatedRoles.append("\n");
        }

        return concatedRoles.toString();
    }

    public List<Map<String, Object>> getViewResourceMapping(Map<String, Object> paramMap) throws Exception {
        String sql = getSqlViewResourceMapping();
        return this.namedParameterJdbcTemplate.queryForList(sql, paramMap);
    }

    /*
    @SuppressWarnings("unchecked")
    public List<Map<String, Object>> getViewResourceMapping(Map<String, Object> paramMap) throws Exception {

        String sql = getSqlViewResourceMapping();
        String userRoleList = "'UNDEFINED'";
        String groupId = "UNDEFINED";

        if (!paramMap.containsKey("groupId")) {
            paramMap.put("groupId", groupId);
        }

        List<GrantedAuthority> authorities = (List<GrantedAuthority>) paramMap.get("authorities");
        if (authorities != null) {
            for (int i = 0; i < authorities.size(); i++) {
                if (i == 0) {
                    userRoleList = ":userRole" + i;
                    paramMap.put("userRole" + i, ((GrantedAuthority)authorities.get(i)).getAuthority());
                }
                else {
                    userRoleList += (" , :userRole" + i);
                    paramMap.put("userRole" + i, ((GrantedAuthority)authorities.get(i)).getAuthority());
                }
            }
        }

        sql = sql.replace("{{userRoleList}}", userRoleList);

        return this.namedParameterJdbcTemplate.queryForList(sql, paramMap);
    }
    */

}
