package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO;

/**
 * 판매기회진행이력에 관한 데이터처리 매퍼 클래스
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

@Mapper("salesOpptProcessMgmtFinishDAO")
public interface SalesOpptProcessMgmtFinishDAO {

    public int updateSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO) throws Exception;

    public int insertSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO) throws Exception;

    public SalesOpptProcessMgmtFinishVO selectSalesOpptProcessMgmtFinishByKey(SalesOpptProcessMgmtFinishSearchVO searchVO) throws Exception;

    public int selectSalesOpptProcessMgmtFinishByConditionCnt(SalesOpptProcessMgmtFinishSearchVO searchVO) throws Exception;

    public List<SalesOpptProcessMgmtFinishVO> selectSalesOpptProcessMgmtFinishByCondition(SalesOpptProcessMgmtFinishSearchVO searchVO) throws Exception;

    public int mergeSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO) throws Exception;

}
