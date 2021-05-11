package chn.bhmc.dms.bat.cmm.sms.vo;

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
 * @ClassName   : SmsMessageResultVO.java
 * @Description : SMS 전송을 결과를 저장하기 위한 VO
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

public class SmsMessageResultVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3763970979012428081L;

    /**
     * 전송메세지ID
     **/
    private  String      sendMesgId;

    /**
     * 전송일자
     **/
    private  String      sendDt;

    /**
     * 예약일자
     **/
    private  String      resvDt;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private  String      dlrCd;

    /**
     * 전송결과코드
     **/
    @NotEmpty
    private  String      sendRsltCd;

    /**
     * 전송결과상세내용
     **/
    private  String      sendRsltDetlCont;

    /**
     * 수신결과코드
     **/
    @NotEmpty
    private  String      receiveRsltCd;

    /**
     * 수신결과상세내용
     **/
    private  String      receiveRsltDetlCont;

    /**
     * 등록자ID
     **/
    private  String      regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        regDt;

    /**
     * 수정자ID
     **/
    private  String      updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        updtDt;

    /**
     * @return the sendMesgId
     */
    public String getSendMesgId() {
        return sendMesgId;
    }

    /**
     * @param sendMesgId the sendMesgId to set
     */
    public void setSendMesgId(String sendMesgId) {
        this.sendMesgId = sendMesgId;
    }

    /**
     * @return the sendDt
     */
    public String getSendDt() {
        return sendDt;
    }

    /**
     * @param sendDt the sendDt to set
     */
    public void setSendDt(String sendDt) {
        this.sendDt = sendDt;
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
     * @return the sendRsltCd
     */
    public String getSendRsltCd() {
        return sendRsltCd;
    }

    /**
     * @param sendRsltCd the sendRsltCd to set
     */
    public void setSendRsltCd(String sendRsltCd) {
        this.sendRsltCd = sendRsltCd;
    }

    /**
     * @return the sendRsltDetlCont
     */
    public String getSendRsltDetlCont() {
        return sendRsltDetlCont;
    }

    /**
     * @param sendRsltDetlCont the sendRsltDetlCont to set
     */
    public void setSendRsltDetlCont(String sendRsltDetlCont) {
        this.sendRsltDetlCont = sendRsltDetlCont;
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
     * @return the receiveRsltDetlCont
     */
    public String getReceiveRsltDetlCont() {
        return receiveRsltDetlCont;
    }

    /**
     * @param receiveRsltDetlCont the receiveRsltDetlCont to set
     */
    public void setReceiveRsltDetlCont(String receiveRsltDetlCont) {
        this.receiveRsltDetlCont = receiveRsltDetlCont;
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
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
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
        return "SmsMessageResultVO [sendMesgId=" + sendMesgId + ", sendDt=" + sendDt + ", resvDt=" + resvDt
                + ", dlrCd=" + dlrCd + ", sendRsltCd=" + sendRsltCd + ", sendRsltDetlCont=" + sendRsltDetlCont
                + ", receiveRsltCd=" + receiveRsltCd + ", receiveRsltDetlCont=" + receiveRsltDetlCont + ", regUsrId="
                + regUsrId + ", regDt=" + regDt + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt + "]";
    }

}
