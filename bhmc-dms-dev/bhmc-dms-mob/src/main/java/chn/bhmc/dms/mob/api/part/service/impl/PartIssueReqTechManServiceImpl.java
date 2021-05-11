package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartIssueReqTechManDAO;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqTechManService;
import chn.bhmc.dms.mob.api.part.vo.IssueReqTechManSearchVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqTechManVO;


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
@Service("PartIssueReqTechManService")
public class PartIssueReqTechManServiceImpl extends HService implements PartIssueReqTechManService {

    @Resource(name="PartIssueReqTechManDAO")
    private PartIssueReqTechManDAO PartIssueReqTechManDAO;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueReqTechManService#selectTechManFnMasterByCondition(chn.bhmc.dms.par.ism.vo.IssueReqTechManSearchVO)
     */
    @Override
    public List<IssueReqTechManVO> selectTechManFnMasterByCondition(IssueReqTechManSearchVO searchVO) throws Exception {
        return PartIssueReqTechManDAO.selectTechManFnMasterByCondition(searchVO);
    }

    


}
