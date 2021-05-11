package chn.bhmc.dms.sal.orc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.orc.service.SumOldOrderCntService;
import chn.bhmc.dms.sal.orc.service.dao.SumOldOrderCntDAO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOldOrderCntServiceImpl
 * @Description : 구종합오더현황
 * @author
 * @since 2017. 07. 06.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 07. 06.   Lee Seungmin     최초 생성
 * </pre>
 */

@Service("sumOldOrderCntService")
public class SumOldOrderCntServiceImpl extends HService implements SumOldOrderCntService {

    /**
     * 종합오더현황 DAO 선언
     */
    @Resource(name="sumOldOrderCntDAO")
    SumOldOrderCntDAO sumOldOrderCntDAO;

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOldOrderCntDlrByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOldOrderCntDAO.selectSumOldOrderCntDlrByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOldOrderCntDlrByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOldOrderCntDAO.selectSumOldOrderCntDlrByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 구종합오더현황-딜러 세부 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntSubVO> selectSumOldOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOldOrderCntDAO.selectSumOldOrderCntDlrSubsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOldOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOldOrderCntDAO.selectSumOldOrderCntDlrSubsByConditionCnt(searchVO);
    }
}
