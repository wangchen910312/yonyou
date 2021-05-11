package chn.bhmc.dms.sal.bto.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.bto.service.BuyPredictedQuantityMngmntService;
import chn.bhmc.dms.sal.bto.service.dao.BuyPredictedQuantityMngmntDAO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntDetailVO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntSearchVO;
import chn.bhmc.dms.sal.bto.vo.BuyPredictedQuantityMngmntVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BuyPredictedQuantityMngmntServiceImpl
 * @Description : 주문 예측수량 관리
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

@Service("buyPredictedQuantityMngmntService")
public class BuyPredictedQuantityMngmntServiceImpl extends HService implements BuyPredictedQuantityMngmntService {

    /**
     * 로컬옵션 DAO 선언
     */
    @Resource(name="buyPredictedQuantityMngmntDAO")
    BuyPredictedQuantityMngmntDAO buyPredictedQuantityMngmntDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<BuyPredictedQuantityMngmntVO> selectBuyPredictedQuantityMngmntByCondition(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception {
        return buyPredictedQuantityMngmntDAO.selectBuyPredictedQuantityMngmntByCondition(searchVO);
    }

    /**
     * 주문예측수량 상세 내역을 조회한다.
     */
    @Override
    public List<BuyPredictedQuantityMngmntDetailVO> selectBuyPredictedQuantityMngmntDetailByCondition(BuyPredictedQuantityMngmntSearchVO searchVO) throws Exception{
       return buyPredictedQuantityMngmntDAO.selectBuyPredictedQuantityMngmntDetailByCondition(searchVO);

    }


}
