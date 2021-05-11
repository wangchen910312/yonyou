package chn.bhmc.dms.mob.api.sales.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSearchVO;

import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DlrOrderSearchDAO
 * @Description : 딜러주문조회 DAO
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

@Mapper("SalesDlrOrderSearchDAO")
public interface SalesDlrOrderSearchDAO {

    /**
     * 조회 조건에 해당하는 딜러주문조회 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectDlrOrderSearchsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 딜러주문조회 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    public List<SumOrderCntVO> selectDlrOrderSearchsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 엑셀 조회 조건에 해당하는 딜러주문조회 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    public List<SumOrderCntVO> selectDlrOrderSearchsByConditionXls(SumOrderCntSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 딜러주문조회 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectDlrOrderSumByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 딜러주문조회 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    public List<SumOrderCntVO> selectDlrOrderSumByCondition(SumOrderCntSearchVO searchVO) throws Exception;
}