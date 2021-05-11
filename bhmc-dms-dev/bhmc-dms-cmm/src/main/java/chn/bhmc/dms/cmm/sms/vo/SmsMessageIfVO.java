package chn.bhmc.dms.cmm.sms.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;


import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SmsMessageIfVO.java
 * @Description : SMS 전송을 위한 IF VO
 * @author Choi Kyung Yong
 * @since 2016. 9. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since           author              description
 *  ===========    =============    ===========================
 *  2016. 9. 1.     Choi KyungYong           최초 생성
 * </pre>
 */

public class SmsMessageIfVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1824543553014496576L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private  String      dlrCd;

    /**
     * seq
     **/
    private  String      seq;

    /**
     * SMS전송구분코드
     **/
    @NotEmpty
    private  String      smsSendDstinCd;

    /**
     * 전화번호
     **/
    @NotEmpty
    private  String      telNo;

    /**
     * SMS내용
     **/
    @NotEmpty
    private  String      smsCont;

    /**
     * 예약일시
     **/
    private  String      resvDt;

    /**
     * APP 구분코드(1:알림메시지, 2: 고객케어, 3: 캠페인, 4:만족도조사)
     **/
    private  String      appDstinCd;

    /**
     * APP 일련번호
     **/
    private  String      appSeq;

    /**
     * 등록자ID
     **/
    @NotEmpty
    private  String      regUsrId;

    /**
     * 수신결과코드
     **/
    private  String      receiveRsltCd;

    /**
     * 고객번호
     **/
    private String       custNo;
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  regDt;
    
    
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;
    
    
   

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public Date getUpdtDt() {
		return updtDt;
	}

	public void setUpdtDt(Date updtDt) {
		this.updtDt = updtDt;
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
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the smsSendDstinCd
     */
    public String getSmsSendDstinCd() {
        return smsSendDstinCd;
    }

    /**
     * @param smsSendDstinCd the smsSendDstinCd to set
     */
    public void setSmsSendDstinCd(String smsSendDstinCd) {
        this.smsSendDstinCd = smsSendDstinCd;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the smsCont
     */
    public String getSmsCont() {
        return smsCont;
    }

    /**
     * @param smsCont the smsCont to set
     */
    public void setSmsCont(String smsCont) {
        this.smsCont = smsCont;
    }

    /**
     * @return the resvDt
     */
    public String getResvDt() {
        return resvDt;
    }

    /**
     * @param resvDt the resvDt to set
     */
    public void setResvDt(String resvDt) {
        this.resvDt = resvDt;
    }

    /**
     * @return the appDstinCd
     */
    public String getAppDstinCd() {
        return appDstinCd;
    }

    /**
     * @param appDstinCd the appDstinCd to set
     */
    public void setAppDstinCd(String appDstinCd) {
        this.appDstinCd = appDstinCd;
    }

    /**
     * @return the appSeq
     */
    public String getAppSeq() {
        return appSeq;
    }

    /**
     * @param appSeq the appSeq to set
     */
    public void setAppSeq(String appSeq) {
        this.appSeq = appSeq;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the receiveRsltCd
     */
    public String getReceiveRsltCd() {
        return receiveRsltCd;
    }

    /**
     * @param receiveRsltCd the receiveRsltCd to set
     */
    public void setReceiveRsltCd(String receiveRsltCd) {
        this.receiveRsltCd = receiveRsltCd;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /*
     * @see java.lang.Object#toString()
     */
	@Override
	public String toString() {
		return "SmsMessageIfVO [dlrCd=" + dlrCd + ", seq=" + seq + ", smsSendDstinCd=" + smsSendDstinCd + ", telNo="
				+ telNo + ", smsCont=" + smsCont + ", resvDt=" + resvDt + ", appDstinCd=" + appDstinCd + ", appSeq="
				+ appSeq + ", regUsrId=" + regUsrId + ", receiveRsltCd=" + receiveRsltCd + ", custNo=" + custNo
				+ ", regDt=" + regDt + ", updtDt=" + updtDt + "]";
	}

   
    
    
}
