package chn.bhmc.dms.mob.api.crm.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptProcessMgmtHistVO;

/**
 * 판매기회 관리에 관한 데이터처리 매퍼 클래스
 *
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         kyo jin lee            최초 생성
 * </pre>
 */

@Mapper("CrmsalesOpptProcessMgmtDAO")
public interface CrmSalesOpptProcessMgmtDAO {

    public int selectSalesOpptProcessMgmtsHistByConditionCnt(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtHistVO> selectSalesOpptProcessMgmtsHistByCondition(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;
    
    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;
    
    public int selectSalesOpptProcessMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

}
