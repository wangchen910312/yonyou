package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptHoldTypeMgmtVO;

/**
 * 판매기회유입유형 관리 서비스
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

public interface CrmSalesOpptHoldTypeMgmtService {

    /**
     * 조회 조건에 해당하는 판매기회유입유형프로세스 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return int
     */
    public int selectSalesOpptHoldTypeMgmtsByConditionCnt(SalesOpptHoldTypeMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회유입유형프로세스 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
     * @return int 조회 목록
     */
    public List<SalesOpptHoldTypeMgmtVO> selectSalesOpptHoldTypeMgmtsByCondition(SalesOpptHoldTypeMgmtSearchVO searchVO) throws Exception;
}
