package chn.bhmc.dms.cmm.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.bbs.service.IssueBoardService;
import chn.bhmc.dms.cmm.bbs.service.dao.IssueBoardDAO;
import chn.bhmc.dms.cmm.bbs.vo.IssueBoardSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.IssueBoardVO;

/**
 * 이슈정보 관리 서비스 구현 클래스
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

@Service("issueBoardService")
public class IssueBoardServiceImpl extends HService implements IssueBoardService {

    /**
     * 이슈정보 관리 DAO
     */
    @Resource(name="issueBoardDAO")
    IssueBoardDAO issueBoardDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertIssueBoard(IssueBoardVO issueBoardVO) throws Exception {
        return issueBoardDAO.insertIssueBoard(issueBoardVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateIssueBoard(IssueBoardVO issueBoardVO) throws Exception {
        return issueBoardDAO.updateIssueBoard(issueBoardVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteIssueBoard(int issueNo) throws Exception {
        return issueBoardDAO.deleteIssueBoard(issueNo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public IssueBoardVO selectIssueBoardByKey(int issueNo) throws Exception {
        return issueBoardDAO.selectIssueBoardByKey(issueNo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<IssueBoardVO> selectIssueBoardsByCondition(IssueBoardSearchVO searchVO) throws Exception {
        return issueBoardDAO.selectIssueBoardsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectIssueBoardsByConditionCnt(IssueBoardSearchVO searchVO) throws Exception {
        return issueBoardDAO.selectIssueBoardsByConditionCnt(searchVO);
    }

}
