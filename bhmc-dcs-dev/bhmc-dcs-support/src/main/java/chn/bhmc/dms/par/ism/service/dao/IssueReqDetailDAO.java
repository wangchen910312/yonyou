package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;

/**
 * 구매요청 상세 데이타 매퍼 클래스
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

@Mapper("issueReqDetailDAO")
public interface IssueReqDetailDAO {

    /**
     * 구매요청상세 정보를 등록한다.
     * @param issueReqDetail - 등록할 정보가 담긴 IssueReqDetail
     * @return 등록된 목록수
     */
    public int insertIssueReqDetail(IssueReqDetailVO issueReqDetailVO);

    /**
     * 구매요청상세 정보를 수정한다.
     * @param issueReqDetail - 수정할 정보가 담긴 IssueReqDetail
     * @return 수정된 목록수
     */
    public int updateIssueReqDetail(IssueReqDetailVO issueReqDetailVO);

    /**
     * 구매요청상세 정보를 삭제한다.
     * @param issueReqDetail - 삭제할 정보가 담긴 IssueReqDetail
     * @return 삭제된 목록수
     */
    public int deleteIssueReqDetail(IssueReqDetailVO issueReqDetailVO);

    /**
     * Key에 해당하는 구매요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 구매요청상세 정보
     */
    public IssueReqDetailVO selectIssueReqDetailByKey(@Param("dlrCd") String dlrCd);

    /**
     * 조회 조건에 해당하는 구매요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO);
}
