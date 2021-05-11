package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.IssueTypeSearchVO;
import chn.bhmc.dms.par.pmm.vo.IssueTypeVO;

/**
 * 출고유형
 *
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

public interface IssueTypeService {

    /**
     * 출고유형 정보를 등록한다.
     * @param issueTypeVO - 등록할 정보가 담긴 IssueTypeVO
     * @return 등록된 목록수
     */
    public int insertIssueType(IssueTypeVO issueTypeVO) throws Exception;

    /**
     * 출고유형 정보를 수정한다.
     * @param issueTypeVO - 수정할 정보가 담긴 IssueTypeVO
     * @return 수정된 목록수
     */
    public int updateIssueType(IssueTypeVO issueTypeVO) throws Exception;

    /**
     * 출고유형 정보를 삭제한다.
     * @param issueTypeVO - 삭제할 정보가 담긴 IssueTypeVO
     * @return 삭제된 목록수
     */
    public int deleteIssueType(IssueTypeVO issueTypeVO) throws Exception;

    /**
     * Key에 해당하는 출고유형 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param issueTp - 출고유형코드
     * @return 조회한 출고유형 정보
     */
    public IssueTypeVO selectIssueTypeByKey(String dlrCd, String issueTp) throws Exception;

    /**
     * 출고유형 정보를 등록/수정 처리한다.
     * @param saveVO - 등록/수정을 포함하는 IssueTypeSaveVO
     * @return 조회 목록
     */
    public void multiIssueTypes(BaseSaveVO<IssueTypeVO> issueTypeSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 출고유형 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueTypeSearchVO
     * @return 조회 목록
     */
    public List<IssueTypeVO> selectIssueTypesByCondition(IssueTypeSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 출고유형 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueTypeSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueTypesByConditionCnt(IssueTypeSearchVO searchVO) throws Exception;
}
