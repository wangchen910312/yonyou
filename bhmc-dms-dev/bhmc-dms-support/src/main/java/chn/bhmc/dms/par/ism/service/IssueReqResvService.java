package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;
import chn.bhmc.dms.par.ism.vo.IssueReqResvSaveVO;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueReqVO;

/**
 * 부품 수령 서비스
 *
 * @author In Bo Shim
 * @since 2016. 8. 12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 12.     In Bo Shim      최초 생성
 * </pre>
 */

public interface IssueReqResvService {

    /**
     * 부품예약,부품예약상세 정보를 수정한다.
     * @param issueReqResvSaveVO 등록할 정보가 담긴 IsueReqResvSaveVO
     * @return
     */
    public void updateIssuePartsResves(IssueReqResvSaveVO issueReqResvSaveVO) throws Exception;

    /**
     * 부품예약리스트 , 부품예약상세 정보를 수정한다.
     * @param issueReqDetailSaveVO
     */
    public void multiIssuePartsResves(BaseSaveVO<IssueReqVO> issueReqSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청상세 단일정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public IssueReqVO selectIssueReqResvByKey(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록
     */
    public List<IssueReqDetailVO> selectIssueReqDetailResvesByCondition(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품요청상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueReqSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueReqDetailResvesByConditionCnt(IssueReqSearchVO searchVO) throws Exception;

    /**
     * 정비수령 부품출고 시 부품예류 상태정보를 수정한다.
     * @param issueReqDetailVO 등록할 정보가 담긴 IssueReqDetailVO
     * @return
     */
    public void updateIssuePartsReadyStatus(IssueReqDetailVO issueReqDetailVO) throws Exception;




}
