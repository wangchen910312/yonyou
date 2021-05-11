package chn.bhmc.dms.cmm.sms.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;


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
    private String dlrCd;

    /**
     * SMS전송구분코드
     **/
    @NotEmpty
    private String smsSendDstinCd;

    /**
     * 전화번호
     **/
    @NotEmpty
    private String telNo;

    /**
     * SMS내용
     **/
    @NotEmpty
    private String smsCont;

    /**
     * 예약일시
     **/
    private String resvDt;
    
    /**
     * 고객번호
     */
    private String custNo;

    /**
     * APP 구분코드(1:알림메시지, 2: 고객케어, 3: 캠페인, 4:만족도조사)
     **/
    private String appDstinCd;

    /**
     * APP 일련번호
     **/
    private String appSeq;

    /**
     * 등록자ID
     **/
    @NotEmpty
    private  String regUsrId;

    /**
     * @return the dlrCd
     */
    @NotEmpty
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

    public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}


	/**
     * @return the appDstnCd
     */
    public String getAppDstinCd() {
        return appDstinCd;
    }


    /**
     * @param appDstnCd the appDstnCd to set
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SmsMessageIFVO [dlrCd=" + dlrCd + ", smsSendDstinCd=" + smsSendDstinCd + ", telNo=" + telNo
                + ", smsCont=" + smsCont + ", resvDt=" + resvDt + ", regUsrId=" + regUsrId + ", appDstinCd=" + appDstinCd
                + ", appSeq=" + appSeq + "]";
    }

}
