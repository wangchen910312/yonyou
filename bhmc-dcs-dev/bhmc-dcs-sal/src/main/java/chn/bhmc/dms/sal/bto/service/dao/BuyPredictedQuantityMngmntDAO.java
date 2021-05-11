package chn.bhmc.dms.sal.bto.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntDetailVO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntSearchVO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BuyPredictedQuantityMngmntDAO
 * @Description : 주문 예측수량 관리 DAO
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

@Mapper("buyPredictedQuantityMngmntDAO")
public interface BuyPredictedQuantityMngmntDAO {

    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<BuyPredictedQuantityMngmntVO> selectBuyPredictedQuantityMngmntByCondition(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception;

    /**
     * 주문수량예측 상세내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<BuyPredictedQuantityMngmntDetailVO> selectBuyPredictedQuantityMngmntDetailByCondition(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception;
}
