
package chn.bhmc.dms.security.service.impl;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class MobStatisticsDAO implements ApplicationContextAware {

	/**
     * url 형식인 보호자원 - Role 맵핑정보를 조회하는 default 쿼리이다.
     */
    public static final String DEF_APP_USAGE_INSERT =
         " MERGE INTO CM_APP_USAGE_LOG a"
        +" USING (select :USR_ID USR_ID, sysdate REG_DT , :VIEW_URL VIEW_URL from dual) b"
        +" ON (a.USR_ID = b.USR_ID"
        +" and to_char(a.REG_DT,'yyyy-mm-dd') = to_char(b.REG_DT,'yyyy-mm-dd')"
        +" and a.VIEW_URL = b.VIEW_URL"
        +" )"
        +" WHEN NOT MATCHED THEN"
        +" insert "
        +" (USAGE_ID ,USR_ID ,USR_NM ,DLR_CD ,DLR_NM ,REG_DT ,VIEW_URL)"
        +" values (SEQ_CM_APP_USAGE_LOG.nextval ,:USR_ID ,:USR_NM  , :DLR_CD , :DLR_NM ,sysdate ,:VIEW_URL) ";



    private String sqlAppUsage;
    
    private ApplicationContext context;

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public MobStatisticsDAO() {
		this.setSqlAppUsage(DEF_APP_USAGE_INSERT);
    }

    public void setDataSource(DataSource dataSource) {
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

	public void setApplicationContext(ApplicationContext context) throws BeansException {
		this.context=context;
	}


    public int insertAppUsageLog(Map<String, Object> paramMap) throws Exception {
    	String sql =this.sqlAppUsage;
    	return this.namedParameterJdbcTemplate.update(sql, paramMap);
    }

	public String getSqlAppUsage() {
		return sqlAppUsage;
	}

	public void setSqlAppUsage(String sqlAppUsage) {
		this.sqlAppUsage = sqlAppUsage;
	}

    
}
