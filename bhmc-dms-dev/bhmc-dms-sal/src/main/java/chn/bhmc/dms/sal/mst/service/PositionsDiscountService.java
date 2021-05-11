package chn.bhmc.dms.sal.mst.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.sal.mst.vo.PositionsDiscountAmtVO;
import chn.bhmc.dms.sal.mst.vo.PositionsDiscountSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PositionsDiscountService
 * @Description : 직책별 할인금액 관리 서비스
 * @author Bong
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.       Bong                최초 생성
 * </pre>
 */

public interface PositionsDiscountService {

    public List<PositionsDiscountAmtVO> selectPositionsDiscountAmtCondition(PositionsDiscountSearchVO searchVO) throws Exception;

    public int selectPositionsDiscountAmtConditionCnt(PositionsDiscountSearchVO searchVO)  throws Exception;

    public void multiPositionsDiscountAmt(BaseSaveVO<PositionsDiscountAmtVO> obj) throws Exception;
}
