package chn.bhmc.dms.sal.bto.service;

import java.util.List;

import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntSaveVO;
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

    //검색
    public int selectBuyPredictedQuantityMngmntByConditionCnt(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception;
	public List<BuyPredictedQuantityMngmntVO> selectBuyPredictedQuantityMngmntByCondition(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception;

	//저장
    public int updateBuyPredictedQuantityMngmnt(BuyPredictedQuantityMngmntSaveVO saveVO) throws Exception;
}
