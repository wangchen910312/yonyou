package chn.bhmc.dms.core.support.query;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
/**
 * <pre>
 * 쿼리 실행 서비스
 * </pre>
 *
 * @ClassName   : CommonQueryService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 22.     Kang Seok Han     최초 생성
 * </pre>
 */
public class CommonQueryService {	
	
	private final static Logger logger = LoggerFactory.getLogger(CommonQueryService.class);
	
	/**
	 * JdbcTemplate
	 */
	private JdbcTemplate template;
	
	/**
	 * Query Provider
	 */
	private Map<String, String> queryProvider = new HashMap<String, String>();
	
	/**
	 * 로그 정보를 등록한다.
	 * @param queryId 쿼리ID
	 * @param params 
	 * @return
	 */     
	public int execute(String queryId, Object... params) {
		int cnt = 0;
		String query = queryProvider.get(queryId);
		
		if(query != null){	
			try{
				cnt = template.update(query, params);
			}catch(DataAccessException e){
				logger.error(e.getMessage(), e);
			}
		}
		
		return cnt;
	}
	
	public void setDataSource(DataSource dataSource) {
	    this.template = new JdbcTemplate(dataSource);
	}

	public void setQueryProvider(Map<String, String> queryProvider) {
		this.queryProvider = queryProvider;
	}
}
