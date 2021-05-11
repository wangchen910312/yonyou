package chn.bhmc.dms.sal.orm.service;

import java.util.List;

import chn.bhmc.dms.sal.orm.vo.BtoCarInfoSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderAmtPopupVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSaveVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderVO;

/**
 * BTO 주문생성 서비스
 *
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

public interface BtoCreateOrderService {

    /**
     * 주차 및 메모 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return 조회 목록
     */
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO) throws Exception;
    /**
     * 납기예시일를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return 조회 목록
     */
    public List<BtoCreateOrderEtcVO> selectPfpExamDt(BtoCreateOrderSearchVO searchVO) throws Exception;
    /**
     * 참고수량을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return 조회 목록
     */
    public List<BtoCreateOrderEtcVO> selectRefOrdQty(BtoCreateOrderSearchVO searchVO) throws Exception;
    /**
     * 주차 및 메모 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BtoCreateOrderSearchVO
     * @return 조회 목록
     */
    public List<BtoCreateOrderEtcVO> selectOrdGradeCd(BtoCreateOrderSearchVO searchVO) throws Exception;

    /**
     * 전략오더를 제외한 모든 OCN 갯수조회
     * @return
     * @throws Exception
     */
    public int selectBtoOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 전략오더를 제외한 모든 OCN 조회 (블락적용)
     * @return
     * @throws Exception
     */
    public List<BtoCarInfoVO> selectBtoOcnListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 전략오더 OCN 갯수조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStrOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception;

    /**
     * 전략오더 OCN 조회 (블락적용)
     * @param searchVO
     * @return
     * @throws Exception
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
     * 조회 조건에 해당하는 완성차 정산순위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return 조회 목록
     */
	public List<BtoCreateOrderVO> selectBtoCreateOrderByCondition(BtoCreateOrderSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 완성차 정산순위 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FinancialProductsManagementSearchVO
     * @return
     */
	public int selectBtoCreateOrderByConditionCnt(BtoCreateOrderSearchVO searchVO) throws Exception;

	/**
     * 주문 우선순위  정보를 조회한다.
     */
    public List<BtoCreateOrderVO> selectOrdProrCd(BtoCreateOrderVO searchVO) throws Exception;

	/**
     * BTO 주문을 삭제 처리한다
     * @param BtoCreateOrderVO
     * @return
     */
    public void delBtoCreateOrder(BtoCreateOrderSaveVO saveVO) throws Exception;

    /**
     * BTO 주문을 등록 및 수정 처리한다
     * @param BtoCreateOrderVO
     * @return
     */
    public void saveBtoCreateOrder(BtoCreateOrderSaveVO saveVO) throws Exception;

	 /**
     * 주문금액 팝업 정보를 조회한다.
     * @param searchVO - 키를 포함하는 BtoCreateOrderVO
     * @return 조회 목록
     */
    public List<BtoCreateOrderAmtPopupVO> selectBtoCreateOrderAmtPopup(BtoCreateOrderVO searchVO) throws Exception;

    /**
     * 주문유형 : 전략오더 일경우 참고수량 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectASOrdRefOrdQtyChkSearch(BtoCreateOrderSearchVO searchVO) throws Exception;

}
