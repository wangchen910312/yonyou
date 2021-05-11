package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.par.ism.vo.IssueReqSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqStatusVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;

/**
 * 부품요청 헤더 서비스
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

public interface IssueReqService {

    /**
     * 부품요청 정보를 등록한다.
     * @param issueReqVO 등록할 정보가 담긴 IssueReqVO
     * @return 등록된 목록수
     */
    public int insertIssueReq(IssueReqVO issueReqVO) throws Exception;

    /**
     * 부품요청 정보를 등록한다.
     * @param issueReqVO 등록할 정보가 담긴 IssueReqVO
     * @return 등록된 목록수
     */
    public int insertInKeyIssueReq(IssueReqVO issueReqVO) throws Exception;

    /**
     * 부품요청,부품요청상세 정보를 등록한다.
     * @param issueReqSaveVO 등록할 정보가 담긴 IssueReqSaveVO
     * @return 등록된 IssueReqSaveVO
     */
    public IssueReqSaveVO insertIssueReq(IssueReqSaveVO issueReqSaveVO) throws Exception;    

    /**
     * 기타출고 부품요청,부품요청상세 정보를 등록한다.
     * @param issueReqSaveVO 등록할 정보가 담긴 IssueReqSaveVO
     * @return 등록된 IssueReqSaveVO
     */
    public IssueReqSaveVO insertIssueInnerReq(IssueReqSaveVO issueReqSaveVO) throws Exception;

    /**
     * 부품요청 정보를 수정한다.
     * @param issueReqVO - 수정할 정보가 담긴 IssueReqVO
     * @return 수정된 목록수
     */
    public int updateIssueReq(IssueReqVO issueReqVO) throws Exception;

    /**
     * 부품요청,부품요청상세 정보를 수정한다.
     * @param issueReqSaveVO 등록할 정보가 담긴 IssueReqSaveVO
     * @return 등록된 IssueReqSaveVO
     */
    public IssueReqSaveVO updateIssueReq(IssueReqSaveVO issueReqSaveVO) throws Exception;

    /**
     * 부품요청 정보를 삭제한다.
     * @param issueReqVO - 삭제할 정보가 담긴 IssueReqVO
     * @return 삭제된 목록수
     */
    public int deleteIssueReq(IssueReqVO issueReqVO) throws Exception;

    /**
     * Key에 해당하는 부품요청 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param parReqDocNo - 부품요청코드
     * @return 조회한 부품요청 정보
     */
    public IssueReqVO selectIssueReqByKey(String dlrCd, String parReqDocNo, String roDocNo, String parGiTp) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqVO> selectIssueReqsByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqsByConditionCnt(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청현황 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqStatusVO> selectIssueReqStatuesByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청현황 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqStatuesByConditionCnt(IssueReqSearchVO searchVO) throws Exception;
    
    /**
     * 부품요청 상태 정보를 수정한다.           
     */
    public void updateIssueHeaderStatus(String parReqDocNo ) throws Exception;

}
