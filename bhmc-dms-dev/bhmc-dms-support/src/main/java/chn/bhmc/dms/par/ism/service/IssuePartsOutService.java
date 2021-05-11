package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.par.ism.vo.IssuePartsOutSaveVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutVO;

/**
 * 부품출고 헤더 서비스
 *
 * @author In Bo Shim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 23.     In Bo Shim      최초 생성
 * </pre>
 */

public interface IssuePartsOutService {

    /**
     * 부품출고 헤더 정보를 등록한다.
     * @param issuePartsOutVO 등록할 정보가 담긴 IssuePartsOutVO
     * @return 등록된 목록수
     */
    public int insertIssuePartsOut(IssuePartsOutVO issuePartsOutVO) throws Exception;

    /**
     * 정비수령 정비수령/정비반품 처리.
     * @param issuePartsOutSaveVO 등록할 정보가 담긴 IssuePartsOutSaveVO
     * @return 등록된 IssuePartsOutSaveVO
     */
    public IssuePartsOutSaveVO insertIssuePartsOut(IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception;

    /**
     * 내부수령 정비수령/정비반품 처리.
     * @param issuePartsOutSaveVO 등록할 정보가 담긴 IssuePartsOutSaveVO
     * @return 등록된 IssuePartsOutSaveVO
     */
    public IssuePartsOutSaveVO insertIssuePartsOutInner(IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception;


    /**
     * 부품출고 헤더,부품출고 상세 정보를 반품한다.
     * @param issuePartsOutSaveVO 등록할 정보가 담긴 IssuePartsOutSaveVO
     * @return 등록된 IssuePartsOutSaveVO
     */
    public IssuePartsOutSaveVO insertIssuePartsOutReturn(IssuePartsOutSaveVO issuePartsOutSaveVO) throws Exception;

    /**
     * 부품출고 헤더 정보를 수정한다.
     * @param issuePartsOutVO - 수정할 정보가 담긴 IssuePartsOutVO
     * @return 수정된 목록수
     */
    public int updateIssuePartsOut(IssuePartsOutVO issuePartsOutVO) throws Exception;

    /**
     * 부품출고 헤더 정보를 삭제한다.
     * @param issuePartsOutVO - 삭제할 정보가 담긴 IssuePartsOutVO
     * @return 삭제된 목록수
     */
    public int deleteIssuePartsOut(IssuePartsOutVO issuePartsOutVO) throws Exception;

    /**
     * Key에 해당하는 부품출고 헤더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param giDocNo - 출고문서번호
     * @return 조회한 부품출고 헤더 정보
     */
    public IssuePartsOutVO selectIssuePartsOutByKey(String dlrCd, String giDocNo) throws Exception;

    /**
     * 조회 조건에 해당하는 부품출고 헤더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutSearchVO
     * @return 조회 목록
     */
    public List<IssuePartsOutVO> selectIssuePartsOutsByCondition(IssuePartsOutSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품출고 헤더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutSearchVO
     * @return 조회 목록 수
     */
    public int selectIssuePartsOutsByConditionCnt(IssuePartsOutSearchVO searchVO) throws Exception;
}
