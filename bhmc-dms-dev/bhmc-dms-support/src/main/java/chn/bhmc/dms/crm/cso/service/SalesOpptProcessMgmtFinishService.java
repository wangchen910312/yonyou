package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;

/**
 * 판매기회진행이력 관리 서비스
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

public interface SalesOpptProcessMgmtFinishService {

    /**
     * 판매기회진행이력 관리 정보를 수정한다.
     * @param SalesOpptProcessMgmtFinishVO - 수정할 정보가 담긴 SalesOpptProcessMgmtFinishVO
     * @return 수정된 목록수
     */
    public int updateSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO) throws Exception;

   /**
    * 판매기회진행이력 관리 정보를 등록한다.
    * @param SalesOpptProcessMgmtFinishVO - 등록할 정보가 담긴 SalesOpptProcessMgmtFinishVO
    * @return int
    */
   public int insertSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회진행이력 관리 정보를 조회한다. (단건)
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtFinishSearchVO
     * @return SalesOpptProcessMgmtVO 조회 목록
     */
    public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtFinishByKey(SalesOpptProcessMgmtFinishSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회진행이력 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtFinishSearchVO
     * @return int
     */
    public int selectSalesOpptProcessMgmtFinishByConditionCnt(SalesOpptProcessMgmtFinishSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회진행이력 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtFinishSearchVO
     * @return SalesOpptProcessMgmtVO 조회 목록
     */
    public List<SalesOpptProcessMgmtFinishVO> selectSalesOpptProcessMgmtFinishByCondition(SalesOpptProcessMgmtFinishSearchVO searchVO) throws Exception;

    /**
     * 판매기회진행이력 관리 정보를 수정한다.
     * @param SalesOpptProcessMgmtFinishVO - 수정할 정보가 담긴 SalesOpptProcessMgmtFinishVO
     * @return 수정된 목록수
     */
    public int mergeSalesOpptProcessMgmtFinish(SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO) throws Exception;

}
