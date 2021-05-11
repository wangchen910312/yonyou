package chn.bhmc.dms.par.ism.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.ism.service.IssueReqTechManService;
import chn.bhmc.dms.par.ism.service.dao.IssueReqTechManDAO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqTechManVO;

/**
 * 구매요청 헤더 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("issueReqTechManService")
public class IssueReqTechManServiceImpl extends HService implements IssueReqTechManService {

    @Resource(name="issueReqTechManDAO")
    private IssueReqTechManDAO issueReqTechManDAO;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqTechManService#selectTechManFnMasterByCondition(chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO)
     */
    @Override
    public List<IssueReqTechManVO> selectTechManFnMasterByCondition(IssueReqTechManSearchVO searchVO) throws Exception {
        return issueReqTechManDAO.selectTechManFnMasterByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqTechManService#selectTechManFnMasterUseresByCondition(chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO)
     */
    @Override
    public List<IssueReqTechManVO> selectTechManFnMasterUseresByCondition(IssueReqTechManSearchVO searchVO)
            throws Exception {
        return issueReqTechManDAO.selectTechManFnMasterUseresByCondition(searchVO);
    }















}
