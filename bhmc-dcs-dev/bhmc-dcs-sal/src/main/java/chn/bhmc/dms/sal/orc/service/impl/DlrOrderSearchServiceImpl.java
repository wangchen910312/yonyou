package chn.bhmc.dms.sal.orc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.orc.service.DlrOrderSearchService;
import chn.bhmc.dms.sal.orc.service.dao.DlrOrderSearchDAO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DlrOrderSearchServiceImpl
 * @Description : 딜러주문조회
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

@Service("dlrOrderSearchService")
public class DlrOrderSearchServiceImpl extends HService implements DlrOrderSearchService {

    /**
     * 딜러주문조회 DAO 선언
     */
    @Resource(name="dlrOrderSearchDAO")
    DlrOrderSearchDAO dlrOrderSearchDAO;

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectDlrOrderSearchsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 딜러주문조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectDlrOrderSearchsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchsByCondition(searchVO);
    }


    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectDlrOrderSearchSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchSubsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 딜러주문조회 세부 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntSubVO> selectDlrOrderSearchSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchSubsByCondition(searchVO);
    }



}
