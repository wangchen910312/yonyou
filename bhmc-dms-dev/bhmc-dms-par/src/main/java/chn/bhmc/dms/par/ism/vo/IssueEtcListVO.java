package chn.bhmc.dms.par.ism.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IssueEtcListVO.java
 * @Description : IssueEtcListVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */
public class IssueEtcListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2791818344189396054L;

    /**
     * 기타출고VO
     */
    private  IssueEtcVO issueEtcVO;

    /**
     * 기타품목출고VO
     */
    private  List<IssueEtcItemVO> issueEtcItemList;

    /**
     * @return the issueEtcVO
     */
    public IssueEtcVO getIssueEtcVO() {
        return issueEtcVO;
    }

    /**
     * @param issueEtcVO the issueEtcVO to set
     */
    public void setIssueEtcVO(IssueEtcVO issueEtcVO) {
        this.issueEtcVO = issueEtcVO;
    }

    /**
     * @return the issueEtcItemList
     */
    public List<IssueEtcItemVO> getIssueEtcItemList() {
        return issueEtcItemList;
    }

    /**
     * @param purcOrdItemList the purcOrdItemList to set
     */
    public void setIssueEtcItemList(List<IssueEtcItemVO> issueEtcItemList) {
        this.issueEtcItemList = issueEtcItemList;
    }

}
