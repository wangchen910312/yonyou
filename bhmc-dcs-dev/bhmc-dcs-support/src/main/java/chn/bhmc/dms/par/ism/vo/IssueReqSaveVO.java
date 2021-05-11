package chn.bhmc.dms.par.ism.vo;

import java.util.List;

/**
 * 구매요청헤더/상세 저장 VO
 *
 * @ClassName   : IssueReqSaveVO.java
 * @Description : IssueReqSaveVO Class
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim     최초 생성
 * </pre>
 */
public class IssueReqSaveVO {

    /**
     * 구매요청 헤더 VO
     **/
    private IssueReqVO issueReqVO;

    /**
     * 구매요청 상세 목록 VO
     **/
    private List<IssueReqDetailVO> issueReqDetailVO;

    /**
     * @return the issueReqVO
     */
    public IssueReqVO getIssueReqVO() {
        return issueReqVO;
    }

    /**
     * @param issueReqVO the issueReqVO to set
     */
    public void setIssueReqVO(IssueReqVO issueReqVO) {
        this.issueReqVO = issueReqVO;
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
