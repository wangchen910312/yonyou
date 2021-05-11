package chn.bhmc.dms.mob.api.repair.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.repair.vo.CustDemandVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonDAO.java
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
@Mapper("RepairServiceCommonDAO")
public interface RepairServiceCommonDAO {

    public List<CustDemandVO> selectCustDemandsByCondition(TabInfoSearchVO searchVO)throws Exception;

    public List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO)throws Exception;

}
