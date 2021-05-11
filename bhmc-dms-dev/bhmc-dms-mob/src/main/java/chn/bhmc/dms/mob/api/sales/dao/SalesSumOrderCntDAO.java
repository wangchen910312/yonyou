package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSubVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntDAO
 * @Description : 종합오더현황 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.15     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("SalesSumOrderCntDAO")
public interface SalesSumOrderCntDAO {

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */

    public List<SumOrderCntVO> selectSumOrderCntDlrsByCondition(SumOrderCntSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */

    public List<SumOrderCntVO> selectSumOrderCntFstScndFinal(SumOrderCntSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */

    public List<SumOrderCntVO> selectSumOrderCntAsFstScndFinal(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 세부 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 세부 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;

    public int selectSumOrderCntDlrsAsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectSumOrderCntDlrsAsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

}