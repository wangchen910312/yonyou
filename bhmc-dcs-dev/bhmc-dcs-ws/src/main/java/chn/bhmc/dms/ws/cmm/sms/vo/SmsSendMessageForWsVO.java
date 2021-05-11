package chn.bhmc.dms.ws.cmm.sms.vo;

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
 * @ClassName   : SendSmsMessageVO.java
 * @Description : SMS 전송을 내역을 조회하기 위한 VO
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

public class SmsSendMessageForWsVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7506408383877659715L;

    /**
     * SEQ
     **/
    private  String      seq;

    /**
     * 딜러코드
     **/
    private  String      dlrCd;

    /**
     * SMS전송구분코드
     **/
    private  String      smsSendDstinCd;

    /**
     * 전화번호
     **/
    @NotEmpty
    private  String      telNo;

    /**
     * SMS내용
     **/
    private  String      smsCont;

    /**
     * 예약일자
     **/
    @NotEmpty
    private  String      resvDt;

    /**
     * SMS전송여부
     **/
    @NotEmpty
    private  String      smsSendYn;

    /**
     * 전송메세지ID
     **/
    private  String      sendMesgId;

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
     * @return the smsSendYn
     */
    public String getSmsSendYn() {
        return smsSendYn;
    }

    /**
     * @param smsSendYn the smsSendYn to set
     */
    public void setSmsSendYn(String smsSendYn) {
        this.smsSendYn = smsSendYn;
    }

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
        return "SendSmsMessageVO [seq=" + seq + ", dlrCd=" + dlrCd + ", smsSendDstinCd=" + smsSendDstinCd + ", telNo="
                + telNo + ", smsCont=" + smsCont + ", resvDt=" + resvDt + ", smsSendYn=" + smsSendYn + ", sendMesgId="
                + sendMesgId + ", regUsrId=" + regUsrId + ", regDt=" + regDt
                + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt + "]";
    }
}
