package chn.bhmc.dms.par.ism.vo;

import java.util.List;

/**
 * 부품수령헤더/상세 저장 VO
 *
 * @ClassName   : IssueReqResvSaveVO.java
 * @Description : IssueReqResvSaveVO Class
 * @author In Bo Shim
 * @since 2016. 8. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 15.     In Bo Shim     최초 생성
 * </pre>
 */
public class IssueReqResvSaveVO {

    /**
     * 부품수령 헤더 VO
     **/
    private IssueReqResvVO issueReqResvVO;

    /**
     * 구매요청 상세 목록 VO
     **/
    private List<IssueReqDetailVO> issueReqDetailVO;

    /**
     * @return the issueReqResvVO
     */
    public IssueReqResvVO getIssueReqResvVO() {
        return issueReqResvVO;
    }

    /**
     * @param issueReqResvVO the issueReqResvVO to set
     */
    public void setIssueReqResvVO(IssueReqResvVO issueReqResvVO) {
        this.issueReqResvVO = issueReqResvVO;
    }

    /**
     * @return the issueReqDetailVO
     */
    public List<IssueReqDetailVO> getIssueReqDetailVO() {
        return issueReqDetailVO;
    }

    /**
     * @param issueReqDetailVO the issueReqDetailVO to set
     */
    public void setIssueReqDetailVO(List<IssueReqDetailVO> issueReqDetailVO) {
        this.issueReqDetailVO = issueReqDetailVO;
    }

}
