package chn.bhmc.dms.par.ism.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderLaborVO;

/**
 * 구매요청헤더/상세 저장 VO
 *
 * @ClassName   : IssueReqSaveVO.java
 * @Description : IssueReqSaveVO Class
 * @author In Bo Shim
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     In Bo Shim     최초 생성
 * </pre>
 */
public class IssueReqDetailSaveVO {

    /**
     * 구매요청 헤더 VO
     **/
    private IssueReqVO issueReqVO;

    /**
     * 구매요청 상세 목록 VO
     **/
    private BaseSaveVO<IssueReqDetailVO> issueReqDetailVO;

    /**
     * 서비스 공임 목록 VO
     **/
    private List<RepairOrderLaborVO> repairOrderLaborVO;

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
    public BaseSaveVO<IssueReqDetailVO> getIssueReqDetailVO() {
        return issueReqDetailVO;
    }

    /**
     * @param issueReqDetailVO the issueReqDetailVO to set
     */
    public void setIssueReqDetailVO(BaseSaveVO<IssueReqDetailVO> issueReqDetailVO) {
        this.issueReqDetailVO = issueReqDetailVO;
    }

    /**
     * @return the repairOrderLaborVO
     */
    public List<RepairOrderLaborVO> getRepairOrderLaborVO() {
        return repairOrderLaborVO;
    }

    /**
     * @param repairOrderLaborVO the repairOrderLaborVO to set
     */
    public void setRepairOrderLaborVO(List<RepairOrderLaborVO> repairOrderLaborVO) {
        this.repairOrderLaborVO = repairOrderLaborVO;
    }
}
