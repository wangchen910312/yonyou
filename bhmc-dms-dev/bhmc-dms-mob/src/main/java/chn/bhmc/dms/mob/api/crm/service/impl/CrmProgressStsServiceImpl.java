package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;
import chn.bhmc.dms.mob.api.crm.vo.ContractSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractVO;
import chn.bhmc.dms.mob.api.crm.service.CrmProgressStsService;
import chn.bhmc.dms.mob.api.crm.dao.CrmProgressStsDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProgressStsServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 2. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 18      Kim yewon             최초 생성
 * </pre>
 */

@Service("CrmprogressStsService")
public class CrmProgressStsServiceImpl extends HService implements CrmProgressStsService {

    /**
     * 모델컬러 DAO 선언
     */
    @Resource(name="CrmprogressStsDAO")
    CrmProgressStsDAO CrmprogressStsDAO;

    /**
     * 조회 조건에 해당하는 계약품의현황을 조회한다.
     */
    @Override
    public List<ContractVO> selectProgressStsByCondition(ContractSearchVO searchVO) throws Exception {
        List<ContractVO> a = CrmprogressStsDAO.selectProgressStsByCondition(searchVO);
        return a;
    }

    /**
     * 조회 조건에 해당하는 모델컬러 총 갯수를 조회한다.
     */
    @Override
    public int selectProgressStsByConditionCnt(ContractSearchVO searchVO) throws Exception {
        int a = CrmprogressStsDAO.selectProgressStsByConditionCnt(searchVO);
        return a;
    }

}
