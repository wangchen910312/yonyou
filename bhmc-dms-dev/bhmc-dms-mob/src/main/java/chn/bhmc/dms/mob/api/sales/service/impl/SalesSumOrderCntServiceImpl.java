package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesSumOrderCntDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesSumOrderCntService;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSubVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntServiceImpl
 * @Description : 종합오더현황
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.15          최초 생성
 * </pre>
 */

@Service("SalesSumOrderCntService")
public class SalesSumOrderCntServiceImpl extends HService implements SalesSumOrderCntService {

    /**
     * 종합오더현황 DAO 선언
     */
    @Resource(name="SalesSumOrderCntDAO")
    SalesSumOrderCntDAO SalesSumOrderCntDAO;


    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesSumOrderCntDAO.selectSumOrderCntDlrsByCondition(searchVO);
    }
    
    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntFstScndFinal(SumOrderCntSearchVO searchVO) throws Exception{
    	return SalesSumOrderCntDAO.selectSumOrderCntFstScndFinal(searchVO);
    }
    
    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntAsFstScndFinal(SumOrderCntSearchVO searchVO) throws Exception{
    	return SalesSumOrderCntDAO.selectSumOrderCntAsFstScndFinal(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesSumOrderCntDAO.selectSumOrderCntDlrsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 세부 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesSumOrderCntDAO.selectSumOrderCntDlrSubsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesSumOrderCntDAO.selectSumOrderCntDlrSubsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsAsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesSumOrderCntDAO.selectSumOrderCntDlrsAsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrsAsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesSumOrderCntDAO.selectSumOrderCntDlrsAsByConditionCnt(searchVO);
    }

}
