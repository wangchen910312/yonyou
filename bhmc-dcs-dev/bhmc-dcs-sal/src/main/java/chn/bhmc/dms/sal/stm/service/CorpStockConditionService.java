package chn.bhmc.dms.sal.stm.service;

import java.util.List;

import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionVO;

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

public interface CorpStockConditionService {

    /**
     * 법인재고현황(전략오더) 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCorpStockConditionsByConditionCnt(CorpStockConditionSearchVO searchVO) throws Exception;
    public List<CorpStockConditionVO> selectCorpStockConditionsByCondition(CorpStockConditionSearchVO searchVO) throws Exception;

    /**
     * 모델, 지도가격, 배기등급을 불러온다.
     * @param list
     * @return
     * @throws Exception
     */
    public List<CorpStockConditionVO> selectCorpStockConditionModelPrice(List<CorpStockConditionVO> list) throws Exception;

    /**
     * 일괄등록 데이터를 저장 한다.
     * @param list
     * @throws Exception
     */
    public void insertCorpStockConditionUpload(List<CorpStockConditionVO> list) throws Exception;
}