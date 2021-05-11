package chn.bhmc.dms.sal.cnt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.cnt.service.ProgressService;
import chn.bhmc.dms.sal.cnt.service.dao.ProgressDAO;
import chn.bhmc.dms.sal.cnt.vo.ContractCntVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProgressServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 2. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 19      Kim yewon             최초 생성
 * </pre>
 */

@Service("progressService")
public class ProgressServiceImpl extends HService implements ProgressService {

    /**
     * 모델컬러 DAO 선언
     */
    @Resource(name="progressDAO")
    ProgressDAO progressDAO;

    /**
     * 조회 조건에 해당하는 계약품의진척을 조회한다.
     */
    @Override
    public List<ContractReVO> selectProgressByCondition(ContractSearchVO searchVO) throws Exception {
        return progressDAO.selectProgressByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 계약품의진척 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectProgressByConditionCnt(ContractSearchVO searchVO) throws Exception {
        return progressDAO.selectProgressByConditionCnt(searchVO);
    }

    /**
     * 각 유형별 갯수를 조회한다.
     */
    @Override
    public List<ContractCntVO> selectPannelCnt() throws Exception {
        return progressDAO.selectPannelCnt();
    }

}
