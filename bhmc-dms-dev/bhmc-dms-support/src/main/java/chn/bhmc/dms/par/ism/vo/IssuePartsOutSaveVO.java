package chn.bhmc.dms.par.ism.vo;

import java.util.List;

import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;

/**
 * 부품출고헤더/품목 저장 VO
 *
 * @ClassName   : IssuePartsOutSaveVO.java
 * @Description : IssuePartsOutSaveVO Class
 * @author In Bo Shim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     In Bo Shim     최초 생성
 * </pre>
 */

public class IssuePartsOutSaveVO {

    /**
     * 부품출고 헤더 VO
     **/
    private IssuePartsOutVO issuePartsOutVO;

    /**
     * 부품출고 품목 목록 VO
     **/
    private List<IssueReqDetailVO> issueReqDetailVO;

    /**
     * 서비스  RO 공임 목록 VO
     **/
    private List<ServiceLaborVO> repairOrderLaborVO;

    /**
     * @return the issuePartsOutVO
     */
    public IssuePartsOutVO getIssuePartsOutVO() {
        return issuePartsOutVO;
    }

    /**
     * @param issuePartsOutVO the issuePartsOutVO to set
     */
    public void setIssuePartsOutVO(IssuePartsOutVO issuePartsOutVO) {
        this.issuePartsOutVO = issuePartsOutVO;
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

    /**
     * @return the repairOrderLaborVO
     */
    public List<ServiceLaborVO> getRepairOrderLaborVO() {
        return repairOrderLaborVO;
    }

    /**
     * @param repairOrderLaborVO the repairOrderLaborVO to set
     */
    public void setRepairOrderLaborVO(List<ServiceLaborVO> repairOrderLaborVO) {
        this.repairOrderLaborVO = repairOrderLaborVO;
    }
}
