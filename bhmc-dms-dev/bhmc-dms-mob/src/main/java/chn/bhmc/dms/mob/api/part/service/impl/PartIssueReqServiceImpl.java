package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartIssueReqDAO;
import chn.bhmc.dms.mob.api.part.service.PartIssueReqService;
import chn.bhmc.dms.mob.api.part.vo.IssueReqSearchVO;
import chn.bhmc.dms.mob.api.part.vo.IssueReqVO;

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
@Service("PartIssueReqService")
public class PartIssueReqServiceImpl extends HService implements PartIssueReqService {

    @Resource(name="PartIssueReqDAO")
    private PartIssueReqDAO PartIssueReqDAO;

    @Override
    public List<IssueReqVO> selectIssueReqsByCondition(IssueReqSearchVO searchVO) throws Exception {
        return PartIssueReqDAO.selectIssueReqsByCondition(searchVO);
    }

   
}
