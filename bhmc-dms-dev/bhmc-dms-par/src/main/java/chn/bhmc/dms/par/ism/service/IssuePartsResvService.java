package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsResvSearchVO;
import chn.bhmc.dms.par.ism.vo.IssuePartsResvVO;
import chn.bhmc.dms.par.ism.vo.IssueReqDetailVO;

/**
 * 부품예약 서비스
 *
 * @author In Bo Shim
 * @since 2016. 2. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 18.     In Bo Shim      최초 생성
 * </pre>
 */

public interface IssuePartsResvService {

    /**
     * 부품예약 정보를 등록한다.
     * @param issuePartsResvVO 등록할 정보가 담긴 IssuePartsResvVO
     * @return 등록된 목록수
     */
    public int insertIssuePartsResv(IssuePartsResvVO issuePartsResvVO) throws Exception;

    /**
     * 부품예약 정보를 수정한다.
     * @param issuePartsResvVO - 수정할 정보가 담긴 IssuePartsResvVO
     * @return 수정된 목록수
     */
    public int updateIssuePartsResv(IssuePartsResvVO issuePartsResvVO) throws Exception;

    /**
     * 부품예약 정보를 삭제한다.
     * @param issuePartsResvVO - 삭제할 정보가 담긴 IssuePartsResvVO
     * @return 삭제된 목록수
     */
    public int deleteIssuePartsResv(IssuePartsResvVO issuePartsResvVO) throws Exception;

    /**
     * 부품예약 정보를 등록/수정/삭제 처리한다.
     * @param issuePartsResvSaveVO
     */
    public void multiIssuePartsResves(BaseSaveVO<IssuePartsResvVO> obj) throws Exception;

    /**
     * 부품예약 정보를 등록/수정/삭제 처리한다.
     * @param issueReqDetailVO
     */
    public void multiIssueReqDetailPartsResves(BaseSaveVO<IssueReqDetailVO> obj) throws Exception;

    /**
     * Key에 해당하는 부품예약 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 부품예약 정보
     */
    public IssuePartsResvVO selectIssuePartsResvByKey(String dlrCd, String pltCd, String strgeCd, String itemCd, String resvDocNo, int resvDocLineNo) throws Exception;

    /**
     * 조회 조건에 해당하는 부품예약 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsResvSearchVO
     * @return 조회 목록
     */
    public List<IssuePartsResvVO> selectIssuePartsResvesByCondition(IssuePartsResvSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품예약 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssuePartsResvSearchVO
     * @return 조회 목록 수
     */
    public int selectIssuePartsResvesByConditionCnt(IssuePartsResvSearchVO searchVO) throws Exception;
}
