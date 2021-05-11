package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;

/**
 * 구매요청상세 서비스
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

public interface IssueReqDetailService {

    /**
     * 구매요청상세 정보를 등록한다.
     * @param issueReqDetailDetailVO 등록할 정보가 담긴 IssueReqDetailVO
     * @return 등록된 목록수
     */
    public int insertIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 구매요청상세 정보를 수정한다.
     * @param issueReqDetailDetailVO - 수정할 정보가 담긴 IssueReqDetailVO
     * @return 수정된 목록수
     */
    public int updateIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 구매요청상세 정보를 삭제한다.
     * @param issueReqDetailVO - 삭제할 정보가 담긴 IssueReqDetailVO
     * @return 삭제된 목록수
     */
    public int deleteIssueReqDetail(IssueReqDetailVO issueReqDetailVO) throws Exception;

    /**
     * 구매요청상세 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public void multiIssueReqDetails(BaseSaveVO<IssueReqDetailVO> issueReqDetailSaveVO) throws Exception;

    /**
     * 기타출고(내부유용) 상세정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public IssueReqSaveVO multiIssueReqInnerDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception;

    /**
     * 구매요청상세 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailSaveVO
     */
    public void multiIssueReqDetails(IssueReqDetailSaveVO issueReqDetailSaveVO) throws Exception;

    /**
     * Key에 해당하는 구매요청상세 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 구매요청상세 정보
     */
    public IssueReqDetailVO selectIssueReqByKey(String dlrCd) throws Exception;

    /**
     * 조회 조건에 해당하는 구매요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailsByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailsByConditionCnt(IssueReqSearchVO searchVO) throws Exception;
}
