package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailItemVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsOutDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;

/**
 * 부품출고 품목 서비스
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

public interface IssuePartsOutDetailService {

    /**
     * 부품출고 품목 정보를 등록한다.
     * @param issuePartsOutDetailVO 등록할 정보가 담긴 IssuePartsOutDetailVO
     * @return 등록된 목록수
     */
    public int insertIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO) throws Exception;

    /**
     * 부품출고 품목 정보를 수정한다.
     * @param issuePartsOutDetailVO - 수정할 정보가 담긴 IssuePartsOutDetailVO
     * @return 수정된 목록수
     */
    public int updateIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO) throws Exception;

    /**
     * 부품출고 품목 정보를 삭제한다.
     * @param issuePartsOutDetailVO - 삭제할 정보가 담긴 IssuePartsOutDetailVO
     * @return 삭제된 목록수
     */
    public int deleteIssuePartsOutDetail(IssuePartsOutDetailVO issuePartsOutDetailVO) throws Exception;

    /**
     * 부품출고 정보를 등록/수정/삭제 처리한다.
     * @param issuePartsOutDetailVO
     */
    public void multiIssuePartsOutDetails(BaseSaveVO<IssuePartsOutDetailVO> obj) throws Exception;

    /**
     * 부품출고 반품정보를 등록/수정/삭제 처리한다.
     * @param issuePartsOutDetailVO
     */
    public void multiIssuePartsOutReturnDetails(BaseSaveVO<IssuePartsOutDetailVO> obj) throws Exception;

    /**
     * 부품출고 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailVO
     */
    public void multiIssueReqPartsOutDetails(BaseSaveVO<IssueReqDetailVO> obj) throws Exception;

    /**
     * Key에 해당하는 부품출고 품목 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param giDocNo - 부품출고문서번호
     * @param giDocLineNo - 부품출고문서라인번호
     * @return 조회한 부품출고 품목 정보
     */
    public IssuePartsOutDetailVO selectIssuePartsOutDetailByKey(String dlrCd, String giDocNo, int giDocLineNo) throws Exception;

    /**
     * Key에 해당하는 부품출고 품목 세부정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품출고 품목 정보
     */
    public IssuePartsOutDetailItemVO selectIssuePartsOutDetailInfoByKey(String dlrCd, String itemCd) throws Exception;

    /**
     * 조회 조건에 해당하는 부품출고 품목 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutSearchVO
     * @return 조회 목록
     */
    public List<IssuePartsOutDetailVO> selectIssuePartsOutDetailsByCondition(IssuePartsOutDetailSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품출고 품목 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutSearchVO
     * @return 조회 목록 수
     */
    public int selectIssuePartsOutDetailsByConditionCnt(IssuePartsOutDetailSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는  부품출고 마지막 출고번호정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsOutSearchVO
     * @return 조회한 부품출고 품목 정보
     */
    public IssuePartsOutDetailVO selectIssuePartsOutDetailMaxGiDocNoByKey(IssuePartsOutDetailSearchVO searchVO) throws Exception;
}
