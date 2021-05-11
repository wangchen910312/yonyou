package chn.bhmc.dms.sal.svo.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.svo.vo.PolicySearchVO;
import chn.bhmc.dms.sal.svo.vo.PolicyVO;

/**
 * @ClassName   : SpecialCarPolicyDAO
 * @Description : 특수차 정책 이력 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("specialCarPolicyDAO")
public interface SpecialCarPolicyDAO {

    /**
     * 특수차 정책 이력 메인 조회
     */
    public int selectPolicyHistorysByConditionCnt(PolicySearchVO searchVO) throws Exception;
    public List<PolicyVO> selectPolicyHistorysByCondition(PolicySearchVO searchVO) throws Exception;

}