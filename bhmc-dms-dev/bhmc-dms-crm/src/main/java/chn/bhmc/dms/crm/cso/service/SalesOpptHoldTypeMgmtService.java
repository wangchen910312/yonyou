package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;

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

public interface SalesOpptHoldTypeMgmtService {

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


   /**
    * 판매기회유입유형프로세스 관리 정보를 등록한다. ( 판매기회유입유형 + 주소 )
    * @param SalesOpptProcessMgmtVO - 판매기회유입유형정보를 등록할 정보가 담긴 SalesOpptHoldTypeMgmtVO, 주소을 등록할 정보가 담긴 addressInfoVO
    * @return 등록된 목록수
    */
   public void multiSalesOpptHoldType(BaseSaveVO<SalesOpptHoldTypeMgmtVO> saveVO) throws Exception;

   /**
    *  판매기회유입유형 정보를 등록한다.
    * @param dbMessageSourceVO - 등록할 정보가 담긴 DBMessageSourceVO
    * @return 등록된 목록수
    */
   public int insertSalesOpptHoldType(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO) throws Exception;

   /**
    *  판매기회유입유형 정보를 수정한다.
    * @param dbMessageSourceVO - 수정할 정보가 담긴 DBMessageSourceVO
    * @return 수정된 목록수
    */
   public int updateSalesOpptHoldType(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO) throws Exception;

   /**
    *  판매기회유입유형 정보를 삭제한다.
    * @param dbMessageSourceVO - 삭제할 정보가 담긴 DBMessageSourceVO
    * @return 삭제된 목록수
    */
   public int deleteSalesOpptHoldType(SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO) throws Exception;


}
