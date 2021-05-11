package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptFailOtherBrandMgmtVO;
/**
 * 판매기회 관리 서비스
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

public interface CrmSalesOpptFailOtherBrandMgmtService {

    /**
     * 조회 조건에 해당하는 판매기회실패브랜드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailBrandMgmtSearchVO
     * @return int
     */
    public int selectSalesOpptFailBrandMgmtsByConditionCnt(SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회실패브랜드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailBrandMgmtSearchVO
     * @return 조회 목록 SalesOpptFailBrandMgmtVO
     */
    public List<SalesOpptFailOtherBrandMgmtVO> selectSalesOpptFailBrandMgmtsByCondition(SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception;
}
