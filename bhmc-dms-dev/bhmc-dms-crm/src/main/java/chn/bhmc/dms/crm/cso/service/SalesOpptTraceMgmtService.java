package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtVO;

/**
 * 추적 관리 서비스
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

public interface SalesOpptTraceMgmtService {

    /**
     * 조회 조건에 해당하는 추적프로세스 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptTraceMgmtSearchVO
     * @return
     */
    public int selectSalesOpptTraceMgmtsByConditionCnt(SalesOpptTraceMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 추적프로세스 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptTraceMgmtSearchVO
     * @return 조회 목록
     */
    public List<SalesOpptTraceMgmtVO> selectSalesOpptTraceMgmtsByCondition(SalesOpptTraceMgmtSearchVO searchVO) throws Exception;

   /**
    * 추적프로세스 관리 정보를 등록한다. ( 추적 )
    * @param SalesOpptTraceMgmtVO
    * @return 등록된 목록수
    */
   public String multiSalesOpptTraceMgmts(SalesOpptTraceMgmtVO saveVO) throws Exception;

   /**
    * 추적프로세스 관리 정보를 등록한다.
    * @param SalesOpptTraceMgmtVO - 등록할 정보가 담긴 SalesOpptTraceMgmtVO
    * @return SalesOpptTraceNo
    */
   public int insertSalesOpptTraceMgmt(SalesOpptTraceMgmtVO SalesOpptTraceMgmtVO) throws Exception;

   /**
    * 추적프로세스 관리 정보를 수정한다.
    * @param SalesOpptTraceMgmtVO - 수정할 정보가 담긴 SalesOpptTraceMgmtVO
    * @return 수정된 목록수
    */
   public int updateSalesOpptTraceMgmt(SalesOpptTraceMgmtVO SalesOpptTraceMgmtVO) throws Exception;

}
