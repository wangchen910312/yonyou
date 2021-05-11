package chn.bhmc.dms.mob.api.sales.service;

import java.util.List;

import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSubVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 15.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface SalesSumOrderCntService {

    /**
     * 종합오더현황-딜러 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntDlrsByCondition(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntFstScndFinal(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntAsFstScndFinal(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 종합오더현황-딜러 세부조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    public int selectSumOrderCntDlrsAsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntDlrsAsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

}
