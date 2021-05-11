package chn.bhmc.dms.cmm.bbs.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.bbs.vo.IssueBoardSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.IssueBoardVO;

/**
 * 이슈정보 관리 DAO
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
@Mapper("issueBoardDAO")
public interface IssueBoardDAO {

    /**
     * 이슈정보 정보를 등록한다.
     * @param issueBoardVO - 등록할 정보가 담긴 IssueBoardVO
     * @return 등록된 목록수
     */
    public int insertIssueBoard(IssueBoardVO issueBoardVO);

    /**
     * 이슈정보 정보를 수정한다.
     * @param issueBoardVO - 수정할 정보가 담긴 IssueBoardVO
     * @return 수정된 목록수
     */
    public int updateIssueBoard(IssueBoardVO issueBoardVO);

    /**
     * 이슈정보 정보를 삭제한다.
     * @param issueNo Issue 번호
     * @return 삭제된 목록수
     */
    public int deleteIssueBoard(int issueNo);

    /**
     * Key에 해당하는 이슈정보 정보를 조회한다.
     * @param issueNo 이슈번호
     * @return 조회한 이슈정보
     */
    public IssueBoardVO selectIssueBoardByKey(int issueNo);

    /**
     * 조회 조건에 해당하는 이슈정보 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 IssueBoardSearchVO
     * @return 조회 목록
     */
    public List<IssueBoardVO> selectIssueBoardsByCondition(IssueBoardSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 이슈정보 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 IssueBoardSearchVO
     * @return
     */
    public int selectIssueBoardsByConditionCnt(IssueBoardSearchVO searchVO);
}
