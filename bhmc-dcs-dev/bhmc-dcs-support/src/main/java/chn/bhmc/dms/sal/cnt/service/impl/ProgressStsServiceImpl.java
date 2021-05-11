package chn.bhmc.dms.sal.cnt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.cnt.service.ProgressStsService;
import chn.bhmc.dms.sal.cnt.service.dao.ProgressStsDAO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractVO;

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

@Service("progressStsService")
public class ProgressStsServiceImpl extends HService implements ProgressStsService {

    /**
     * 모델컬러 DAO 선언
     */
    @Resource(name="progressStsDAO")
    ProgressStsDAO progressStsDAO;

    /**
     * 조회 조건에 해당하는 계약품의현황을 조회한다.
     */
    @Override
    public List<ContractVO> selectProgressStsByCondition(ContractSearchVO searchVO) throws Exception {
        List<ContractVO> a = progressStsDAO.selectProgressStsByCondition(searchVO);
        return a;
    }

    /**
     * 조회 조건에 해당하는 모델컬러 총 갯수를 조회한다.
     */
    @Override
    public int selectProgressStsByConditionCnt(ContractSearchVO searchVO) throws Exception {
        int a = progressStsDAO.selectProgressStsByConditionCnt(searchVO);
        return a;
    }

}
