package chn.bhmc.dms.ser.cmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : CustDemandVO.java
 * @Description : 고객요구사항 VO
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since author description
 * =========== ============= ===========================
 * 2016. 7. 6. Kwon Ki Hyun 최초 생성
 * </pre>
 */
@ValidDescriptor({
  //  @ValidField(field="roDocNo", mesgKey="ser.lbl.roDocNo")
  //  ,@ValidField(field="claimDocNo", mesgKey="ser.lbl.claimNo")
})
public class CustDemandVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2791252562680247992L;

    /**
     * PREFIX ID
     **/
    @NotEmpty
    private String preFixId;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 업무번호
     **/
    @NotEmpty
    private String jobNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * 고객요청내용
     **/
    private String custReqCont;

    /**
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }

    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the jobNo
     */
    public String getJobNo() {
        return jobNo;
    }

    /**
     * @param jobNo the jobNo to set
     */
    public void setJobNo(String jobNo) {
        this.jobNo = jobNo;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the custReqCont
     */
    public String getCustReqCont() {
        return custReqCont;
    }

    /**
     * @param custReqCont the custReqCont to set
     */
    public void setCustReqCont(String custReqCont) {
        this.custReqCont = custReqCont;
    }



}
