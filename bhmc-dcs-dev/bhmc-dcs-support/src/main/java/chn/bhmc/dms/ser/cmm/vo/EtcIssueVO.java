package chn.bhmc.dms.ser.cmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

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
public class EtcIssueVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2791252706910247992L;

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
    private String jobNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * 기타유형코드
     **/
    @NotEmpty
    private String etcTpCd;

    /**
     * 기타유형명
     **/
    @NotEmpty
    private String etcTpNm;

    /**
     * 기타요청내용
     **/
    private String etcReqCont;

    /**
     * 기타요청가격
     **/
    private Double etcReqPrc;

    /**
     * 결제유형
     **/
    private String paymTp;

    /**
     * 결제자명
     **/
    private String paymUsrNm;

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
     * @return the etcTpCd
     */
    public String getEtcTpCd() {
        return etcTpCd;
    }

    /**
     * @param etcTpCd the etcTpCd to set
     */
    public void setEtcTpCd(String etcTpCd) {
        this.etcTpCd = etcTpCd;
    }

    /**
     * @return the etcTpNm
     */
    public String getEtcTpNm() {
        return etcTpNm;
    }

    /**
     * @param etcTpNm the etcTpNm to set
     */
    public void setEtcTpNm(String etcTpNm) {
        this.etcTpNm = etcTpNm;
    }

    /**
     * @return the etcReqCont
     */
    public String getEtcReqCont() {
        return etcReqCont;
    }

    /**
     * @param etcReqCont the etcReqCont to set
     */
    public void setEtcReqCont(String etcReqCont) {
        this.etcReqCont = etcReqCont;
    }

    /**
     * @return the etcReqPrc
     */
    public Double getEtcReqPrc() {
        return etcReqPrc;
    }

    /**
     * @param etcReqPrc the etcReqPrc to set
     */
    public void setEtcReqPrc(Double etcReqPrc) {
        this.etcReqPrc = etcReqPrc;
    }

    /**
     * @return the paymTp
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * @param paymTp the paymTp to set
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    /**
     * @return the paymUsrNm
     */
    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    /**
     * @param paymUsrNm the paymUsrNm to set
     */
    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
    }

}
