package chn.bhmc.dms.security.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.security.service.MobStatisticsService;
import chn.bhmc.dms.security.vo.CustomUserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MainMobStatisticsServiceImpl.java
 * @Description : 记录App请求后台用户访问信息以及访问的url.
 * @author Sun Zq
 * @since 2018. 07. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 07.02.    Sun Zq          记录App请求后台用户访问信息以及访问的url.
 * </pre>
 */
@Service("mobStatisticsService")
public class MobStatisticsServiceImpl extends HService implements MobStatisticsService {


    private MobStatisticsDAO mobStatisticsDAO;
  
    public void setMobStatisticsDAO(MobStatisticsDAO mobStatisticsDAO) {
		this.mobStatisticsDAO = mobStatisticsDAO;
	}



	@Override
	public void insertAppLogByUserInfo(CustomUserVO user, String url) throws Exception{

		Map<String,Object> paramMap =new HashMap<String, Object>();
		paramMap.put("USR_ID", user.getUsrId());
		paramMap.put("USR_NM", user.getUsrNm());
		paramMap.put("DLR_CD", user.getDlrCd());
		paramMap.put("DLR_NM", user.getDlrNm());
		paramMap.put("VIEW_URL", url);
		mobStatisticsDAO.insertAppUsageLog(paramMap);
    }

}
