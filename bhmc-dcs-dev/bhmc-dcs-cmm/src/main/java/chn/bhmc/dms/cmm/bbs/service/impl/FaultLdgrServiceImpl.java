package chn.bhmc.dms.cmm.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.bbs.service.FaultLdgrService;
import chn.bhmc.dms.cmm.bbs.service.dao.FaultLdgrDAO;
import chn.bhmc.dms.cmm.bbs.vo.FaultLdgrSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.FaultLdgrVO;

/**
 * 결함대장 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("faultLdgrService")
public class FaultLdgrServiceImpl extends HService implements FaultLdgrService {

    /**
     * 결함대장 관리 DAO
     */
    @Resource(name="faultLdgrDAO")
    FaultLdgrDAO faultLdgrDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertFaultLdgr(FaultLdgrVO faultLdgrVO) throws Exception {
        return faultLdgrDAO.insertFaultLdgr(faultLdgrVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateFaultLdgr(FaultLdgrVO faultLdgrVO) throws Exception {
        return faultLdgrDAO.updateFaultLdgr(faultLdgrVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteFaultLdgr(int issueNo) throws Exception {
        return faultLdgrDAO.deleteFaultLdgr(issueNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public FaultLdgrVO selectFaultLdgrByKey(int issueNo) throws Exception {
        return faultLdgrDAO.selectFaultLdgrByKey(issueNo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<FaultLdgrVO> selectFaultLdgrsByCondition(FaultLdgrSearchVO searchVO) throws Exception {
        return faultLdgrDAO.selectFaultLdgrsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectFaultLdgrsByConditionCnt(FaultLdgrSearchVO searchVO) throws Exception {
        return faultLdgrDAO.selectFaultLdgrsByConditionCnt(searchVO);
    }

}
