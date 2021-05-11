package chn.bhmc.dms.sal.bto.service;

import java.util.List;

import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntDetailVO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntSearchVO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntVO;

/**
 * 주문 예측수량 관리 서비스
 *
 * @author Bong
 * @since 2016. 5. 26.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.26         Bong            최초 생성
 * </pre>
 */

public interface BuyPredictedQuantityMngmntService {

	/**
     * 조회 조건에 해당하는 주문 예측/완성 수량 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BuyPredictedQuantityMngmntSearchVO
     * @return 조회 목록
     */
	public List<BuyPredictedQuantityMngmntVO> selectBuyPredictedQuantityMngmntByCondition(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception;


	/**
	 * 주문예측수량 상세내역을 조회한다.
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public List<BuyPredictedQuantityMngmntDetailVO> selectBuyPredictedQuantityMngmntDetailByCondition(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception;


}
