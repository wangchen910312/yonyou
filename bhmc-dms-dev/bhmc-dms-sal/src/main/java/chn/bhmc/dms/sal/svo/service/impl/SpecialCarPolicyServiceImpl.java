package chn.bhmc.dms.sal.svo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.svo.service.SpecialCarPolicyService;
import chn.bhmc.dms.sal.svo.service.dao.SpecialCarPolicyDAO;
import chn.bhmc.dms.sal.svo.vo.PolicySearchVO;
import chn.bhmc.dms.sal.svo.vo.PolicyVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialCarPolicyServiceImpl
 * @Description : 특수차 정책 이력 조회
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.30                              최초 생성
 * </pre>
 */

@Service("specialCarPolicyService")
public class SpecialCarPolicyServiceImpl extends HService implements SpecialCarPolicyService {

    /**
     * 구원차/대부차신청 DAO 선언
     */
    @Resource(name="specialCarPolicyDAO")
    SpecialCarPolicyDAO specialCarPolicyDAO;


    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectPolicyHistorysByConditionCnt(PolicySearchVO searchVO) throws Exception{
        return specialCarPolicyDAO.selectPolicyHistorysByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public List<PolicyVO> selectPolicyHistorysByCondition(PolicySearchVO searchVO) throws Exception{
        return specialCarPolicyDAO.selectPolicyHistorysByCondition(searchVO);
    }

}
