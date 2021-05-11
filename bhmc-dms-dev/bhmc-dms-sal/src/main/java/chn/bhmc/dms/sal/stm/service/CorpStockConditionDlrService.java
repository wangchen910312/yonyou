package chn.bhmc.dms.sal.stm.service;

import java.util.List;

import chn.bhmc.dms.sal.stm.vo.CorpStockConditionDlrVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;

/**
 *   법인재고현황(전략오더)
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.25         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface CorpStockConditionDlrService {

    /**
     * [딜러]법인재고현황(전략오더) 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CorpStockConditionDlrVO> selectCorpStockConditionDlrsByCondition(CorpStockConditionSearchVO searchVO) throws Exception;

}