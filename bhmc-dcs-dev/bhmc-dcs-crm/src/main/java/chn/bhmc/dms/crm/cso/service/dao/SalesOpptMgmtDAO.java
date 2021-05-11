package chn.bhmc.dms.crm.cso.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.cso.vo.SalesOpptFailMgmtVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtVO;

/**
 * 판매기회 관리에 관한 데이터처리 매퍼 클래스
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

@Mapper("salesOpptMgmtDAO")
public interface SalesOpptMgmtDAO {

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
   * 판매기회 상세 조회
   * @param searchVO
   * @return
   */
  public SalesOpptMgmtVO selectSalesOpptMgmtByKey(SalesOpptMgmtSearchVO searchVO) throws Exception;

  /**
   * 조회 조건에 해당하는 판매기회 히스토리 총 갯수를 조회한다.          TODO [이인문] 판매기회 히스토리 테이블 조회로 수정
   * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
   * @return
   */
  public int selectSalesOpptHistorysByConditionCnt(SalesOpptMgmtSearchVO searchVO) throws Exception;

  /**
   * 조회 조건에 해당하는 판매기회 히스토리 정보를 조회한다.            TODO [이인문] 판매기회 히스토리 테이블 조회로 수정
   * @param searchVO - 조회 조건을 포함하는 SalesOpptMgmtSearchVO
   * @return 조회 목록
   */
  public List<SalesOpptMgmtVO> selectSalesOpptHistorysByCondition(SalesOpptMgmtSearchVO searchVO) throws Exception;

    /**
     * 판매기회단계 상태 변경
     * @param saveVO
     * @return
     */
  public int updateSalesOpptStep(SalesOpptMgmtVO saveVO) throws Exception;

  /**
   * 전출상태 변경
   * @param saveVO
   * @return
   */
  public int updateTrsfStat(SalesOpptMgmtVO saveVO) throws Exception;

    /**
     * 판매기회 실패 등록
     * @param salesOpptFailVO
     * @return
     */
    public int insertSalesOpptFail(SalesOpptFailMgmtVO saveVO) throws Exception;

    /**
     * 판매기회단계 진행중 중복 수량 체크
     *
     * @param searchVO - dlrCd, custNo
     * @return
     */
    public int selectSalesOpptDupCnt(SalesOpptMgmtSearchVO searchVO);

}
