package chn.bhmc.dms.sal.orm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.orm.vo.BtoCarInfoSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderAmtPopupVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BtoCreateOrderDAO
 * @Description : BTO 주문생성 DAO
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16         Bong            최초 생성
 * </pre>
 */

@Mapper("btoCreateOrderDAO")
public interface BtoCreateOrderDAO {

    /**
     * 주차 및 메모  정보를 조회한다.
     */
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO)throws Exception;
    /**
     * 납기예시일  정보를 조회한다.
     */
    public List<BtoCreateOrderEtcVO> selectPfpExamDt(BtoCreateOrderSearchVO searchVO)throws Exception;
    /**
     * 참조수량  정보를 조회한다.
     */
    public List<BtoCreateOrderEtcVO> selectRefOrdQty(BtoCreateOrderSearchVO searchVO)throws Exception;
    /**
     * 오더등급  정보를 조회한다.
     */
    public List<BtoCreateOrderEtcVO> selectOrdGradeCd(BtoCreateOrderSearchVO searchVO)throws Exception;

    /**
     * 전략오더를 제외한 모든 오더 OCN 갯수조회
     */
    public int selectBtoOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 전략오더를 제외한 모든 오더 OCN조회 (블락적용)
     */
    public List<BtoCarInfoVO> selectBtoOcnListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 전략오더 OCN 갯수조회
     */
    public int selectStrOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 전략오더 OCN 조회 (블락적용)
     */
    public List<BtoCarInfoVO> selectStrOcnListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 블락 적용된 외장색 갯수조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectBtoExtColorListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 블락 적용된 외장색 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<BtoCarInfoVO> selectBtoExtColorListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 블락 적용된 내장색 갯수조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectBtoIntColorListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 블락 적용된 내장색 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<BtoCarInfoVO> selectBtoIntColorListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<BtoCreateOrderVO> selectBtoCreateOrderByCondition(BtoCreateOrderSearchVO searchVO)throws Exception;

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectBtoCreateOrderByConditionCnt(BtoCreateOrderSearchVO searchVO)throws Exception;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
   public List<BtoCreateOrderVO> selectOrdProrCd(BtoCreateOrderVO searchVO)throws Exception;

   /**
     * 주문 삭제한다.
     * @param BtoCreateOrderVO
     * @return
     */
   public int updateBtoCreateOrderDelete(BtoCreateOrderVO saveVO)throws Exception;

   /**
    *  오더 생성 유무를 조회한다.
    */
   public String selectChkCreateYn(BtoCreateOrderVO saveVO)throws Exception;

   /**
    * Bto 주문을 저장한다.
    * @param BtoCreateOrderVO
    * @return
    */
   public int insertBtoCreateOrder(BtoCreateOrderVO saveVO)throws Exception;

   /**
    * BTO 주문 정보를 수정한다.
    * @param BtoCreateOrderVO
    * @return
    */
   public int updateBtoCreateOrder(BtoCreateOrderVO saveVO)throws Exception;

   /**
    * BTO 주문 내역 확인
    * @param searchVO
    * @return
    * @throws Exception
    */
   public List<BtoCreateOrderVO> selectBtoCreateOrderValueSearch(BtoCreateOrderVO searchVO)throws Exception;


   /**
    * Bto 주문 이력을 저장한다.
    * @param BtoCreateOrderVO
    * @return
    */
   public int insertBtoCreateOrderHis(BtoCreateOrderVO saveVO)throws Exception;


   /**
    * 조회 조건에 해당하는  정보를 조회한다.(주문금액 팝업)
    */
  public List<BtoCreateOrderAmtPopupVO> selectBtoCreateOrderAmtPopup(BtoCreateOrderVO searchVO)throws Exception;


  /**
  *
  * 오더등록 정보를 프로시져로 등록한다.
  *
  * @param saveVO - PWA 요청 부품 등록 목록을 포함하는 SaveVO
  * @return bindingResult
  * @throws Exception
  */
  public int procPenaltyOrdReq(BtoCreateOrderVO saveVO) throws Exception;

  /**
   * 주문유형 : 전략오더 일경우 참고수량 조회
   */
  public int selectASOrdRefOrdQtyChkSearch(BtoCreateOrderSearchVO searchVO) throws Exception;
}
