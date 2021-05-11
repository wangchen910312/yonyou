package chn.bhmc.dms.sal.orc.service;

import java.util.List;

import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOldOrderCntService
 * @Description : 구종합오더현황
 * @author Lee Seungmin
 * @since 2017. 7. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 5.     Lee Seungmin     최초 생성
 * </pre>
 */

public interface SumOldOrderCntService {

    /**
     * 구종합오더현황-딜러 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectSumOldOrderCntDlrByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOldOrderCntDlrByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    public int selectSumOldOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntSubVO> selectSumOldOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

}
