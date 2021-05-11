package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptProcessMgmtHistSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptProcessMgmtHistVO;

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

public interface CrmSalesOpptProcessMgmtService {

    

   /**
    * 판매기회프로세스 관리 정보를 수정한다.
    * @param SalesOpptProcessMgmtVO - 수정할 정보가 담긴 SalesOpptProcessMgmtVO
    * @return 수정된 목록수
    * support로 이동 (salesOpptProcessMgmtOutBoundService)
    */
   //public int updateSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회 이력 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtHistSearchVO
    * @return int
    */
   public int selectSalesOpptProcessMgmtsHistByConditionCnt(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회 이력 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtHistSearchVO
    * @return SalesOpptProcessMgmtHistVO
    */
   public List<SalesOpptProcessMgmtHistVO> selectSalesOpptProcessMgmtsHistByCondition(SalesOpptProcessMgmtHistSearchVO searchVO) throws Exception;
   

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다. (단건)
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return SalesOpptProcessMgmtVO 조회 목록
    */
   public SalesOpptProcessMgmtVO selectSalesOpptProcessMgmtsByKey(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return int
    */
   public int selectSalesOpptProcessMgmtsByConditionCnt(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;

   /**
    * 조회 조건에 해당하는 판매기회프로세스 관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SalesOpptProcessMgmtSearchVO
    * @return SalesOpptProcessMgmtVO 조회 목록
    */
   public List<SalesOpptProcessMgmtVO> selectSalesOpptProcessMgmtsByCondition(SalesOpptProcessMgmtSearchVO searchVO) throws Exception;
   
}
