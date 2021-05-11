package chn.bhmc.dms.mob.api.repair.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.mob.api.repair.vo.CustDemandVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface RepairServiceCommonService {
	
	public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception;

    List<CustDemandVO> selectCustDemandsByCondition(TabInfoSearchVO searchVO)throws Exception;

    List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO)throws Exception;

}
