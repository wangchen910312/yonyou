package chn.bhmc.dms.crm.cso.service;

import java.util.List;

import chn.bhmc.dms.crm.cso.vo.SalesOpptFailMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;

/**
 * 판매기회 관리 서비스
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

public interface SalesOpptMgmtService {

    /**
     * 조회 조건에 해당하는 판매기회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return
     */
    public int selectSalesOpptMgmtsByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 판매기회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
     * @return 조회 목록
     */
    public List<SalesOpptMgmtVO> selectSalesOpptMgmtsByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception;

    /**
    * 판매기회 정보를 등록한다. ( 판매기회 + 관심차 )
    * @param SalesOpptMgmtSaveVO - 판매기회정보를 등록할 정보가 담긴 SalesOpptMgmtVO, 관심차을 등록할 정보가 담긴 CarLineInfoVO
    * @return 등록된 목록수
    */
   public String multiSalesOpptMgmts(SalesOpptMgmtSaveVO saveVO) throws Exception;

   /**
    * 판매기회 정보를 등록한다.
    * @param salesOpptMgmtVO - 등록할 정보가 담긴 SalesOpptMgmtVO
    * @return 등록된 목록수
    */
   public int insertSalesOpptMgmt(SalesOpptMgmtVO salesOpptMgmtVO) throws Exception;

   /**
    * 판매기회 정보를 수정한다.
    * @param salesOpptMgmtVO - 수정할 정보가 담긴 SalesOpptMgmtVO
    * @return 수정된 목록수
    */
   public int updateSalesOpptMgmt(SalesOpptMgmtVO salesOpptMgmtVO) throws Exception;

   /**
   * 판매기회 상제정보를 조회한다.
   * @param searchVO
   * @return
   */
  public SalesOpptMgmtVO selectSalesOpptMgmtByKey(SalesOpptMgmtSearchVO searchVO) throws Exception;

  /**       TODO [이인문] 판매기회 히스토리 테이블 조회로 수정
   * 조회 조건에 해당하는 판매기회 히스토리 총 갯수를 조회한다.
   * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
   * @return
   */
  public int selectSalesOpptHistorysByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception;

  /**       TODO [이인문] 판매기회 히스토리 테이블 조회로 수정
   * 조회 조건에 해당하는 판매기회 히스토리 정보를 조회한다.
   * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
   * @return 조회 목록
   */
  public List<SalesOpptMgmtVO> selectSalesOpptHistorysByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception;

  /**
   * 판매기회단계 상태를 수정한다.
   * @param salesOpptMgmtSaveVO - 수정할 정보가 담긴 salesOpptMgmtSaveVO
   * @return 수정된 목록수
   */
  public int updateSalesOpptStep(SalesOpptMgmtVO saveVO) throws Exception;

  /**
   * 전출상태를 수정한다.
   * @param salesOpptMgmtSaveVO - 수정할 정보가 담긴 salesOpptMgmtSaveVO
   * @return 수정된 목록수
   */
  public int updateTrsfStat(SalesOpptMgmtVO saveVO) throws Exception;

    /**
     * 판매기회 실패 사유를 등록한다.
     * @param salesOpptFailVO - 등록할 정보가 담긴 salesOpptFailVO
     * @return 수정된 목록수
     */
  public int insertSalesOpptFail(SalesOpptFailMgmtVO saveVO) throws Exception;

    /**
     * Statements
     *
     * @param saleOpptSeq
     */
    public int updateSalesOpptFail(String[] saleOpptNos) throws Exception;

    /**
     * 판매기회단계 진행중 중복 수량 체크
     * @param dlrCd, custNo
     * @return
     */
    public int selectSalesOpptDupCnt(String dlrCd, String custNo) throws Exception;

}
