package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOpptFailMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;

/**
 * 판매기회 실패관리 서비스
 *
 * @author in moon lee
 * @since 2016.03.22.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.22         in moon lee            최초 생성
 * </pre>
 */

public interface SalesOpptFailMgmtService {

    /**
     * 조회 조건에 해당하는 판매기회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    public int selectSalesOpptFailMgmtsByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return 조회 목록
     */
    public List<SalesOpptMgmtVO> selectSalesOpptFailMgmtsByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    public int selectSalesOpptFailDetlMgmtsByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return 조회 목록
     */
    public List<SalesOpptFailMgmtVO> selectSalesOpptFailDetlMgmtsByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception;

}
