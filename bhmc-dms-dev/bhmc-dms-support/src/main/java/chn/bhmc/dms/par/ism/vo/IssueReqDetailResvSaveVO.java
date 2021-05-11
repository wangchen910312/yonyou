package chn.bhmc.dms.par.ism.vo;

import java.util.List;

import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;

/**
 * 구매요청헤더/상세 예약 저장 VO
 *
 * @ClassName   : IssueReqDetailResvSaveVO.java
 * @Description : IssueReqDetailResvSaveVO Class
 * @author In Bo Shim
 * @since 2016. 9. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 04.     In Bo Shim     최초 생성
 * </pre>
 */
public class IssueReqDetailResvSaveVO {

    /**
     * 부품요청 헤더 VO
     **/
    private IssueReqVO issueReqVO;

    /**
     * 부품요청 상세 리스트.
     **/
    private List<IssueReqDetailVO> issueReqDetailVO;

    /**
     * 서비스  RO 공임 목록 VO
     **/
    private List<ServiceLaborVO> repairOrderLaborVO;

    /**
     * 준비상태코드 : 기본상태 예류
     **/
    private String readyStatCd = "03";

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

    /**
     * @return the readyStatCd
     */
    public String getReadyStatCd() {
        return readyStatCd;
    }

    /**
     * @param readyStatCd the readyStatCd to set
     */
    public void setReadyStatCd(String readyStatCd) {
        this.readyStatCd = readyStatCd;
    }
}
