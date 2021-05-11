package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 컨택 히스토리 VO
 *
 * @ClassName   : ContactHistoryVO.java
 * @Description : ContactHistoryVO Class
 * @author in moon lee
 * @since 2016.04.06.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.06     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"        , mesgKey="global.lbl.dlrCd")          // 딜러코드
   ,@ValidField(field="custNo"       , mesgKey="global.lbl.custNo")         // 고객번호
   ,@ValidField(field="contactStatCd" , mesgKey="global.lbl.contactStatCd") // 접촉상태
   ,@ValidField(field="contactTp"     , mesgKey="global.lbl.contactTp")     // 접촉유형
   ,@ValidField(field="contactBizCd"  , mesgKey="global.lbl.wrkTp")         // 업무유형
   ,@ValidField(field="contactCont"  , mesgKey="global.lbl.contactCont")    // 접촉내용
   ,@ValidField(field="refTableNm"   , mesgKey="global.lbl.refTableNm")     // 출처테이블
   ,@ValidField(field="refKeyNm"     , mesgKey="global.lbl.refKeyNm")       // 출처키
})

public class ContactHistoryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8263262454729969828L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private  String        dlrCd;


    /**
     * 활동번호
     **/
    @NotEmpty
    private  String        contactNo;

    /**
     * 고객번호
     **/
    @NotEmpty
    private  String        custNo;

    /**
     * 활동입출력코드 IN / OUT
     **/
    @NotEmpty
    private  String        contactStatCd;

    /**
     * 활동유형 (문자,WECHAT,EMAIL,전화)
     **/
    @NotEmpty
    private  String        contactTp;

    /**
     * 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)
     **/
    @NotEmpty
    private  String        contactBizCd;


    /**
     * 컨택히스토리 내용
     **/
    private  String        contactCont;

    /**
     * 출처참조테이블명
     **/
    @NotEmpty
    private  String        refTableNm;

    /**
     * 출처참조키명
     **/
    @NotEmpty
    private  String        refKeyNm;

    /**
     * 등록자ID
     **/
    private  String        regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          regDt;

    /**
     * 수정자ID
     **/
    private  String        updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          updtDt;

    /**
     * 전송일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          sendDt;


    private  int               smsTmplUserSeq;  // SMS 전송 대상자 임시 SEQ

    private String contactTpNm;             //접촉유형 (CRM321 : 활동형태 ) ( 01:전화 / 02:방문 / 03:EMAIL / 04:SMS / 05:현장접수 / 06:WeChat )
    private String contactBizCdNm;          //업무(고객,리드,기회,VOC,만족도,캠페인,멤버십
    private String receiveRsltCdNm;          //업무(고객,리드,기회,VOC,만족도,캠페인,멤버십

    private String smsSendSeq;          //업무(고객,리드,기회,VOC,만족도,캠페인,멤버십




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
     * @return the contactNo
     */
    public String getContactNo() {
        return contactNo;
    }

    /**
     * @param contactNo the contactNo to set
     */
    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
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

    /**
     * @return the contactStatCd
     */
    public String getContactStatCd() {
        return contactStatCd;
    }

    /**
     * @param contactStatCd the contactStatCd to set
     */
    public void setContactStatCd(String contactStatCd) {
        this.contactStatCd = contactStatCd;
    }

    /**
     * @return the contactTp
     */
    public String getContactTp() {
        return contactTp;
    }

    /**
     * @param contactTp the contactTp to set
     */
    public void setContactTp(String contactTp) {
        this.contactTp = contactTp;
    }

    /**
     * @return the contactBizCd
     */
    public String getContactBizCd() {
        return contactBizCd;
    }

    /**
     * @param contactBizCd the contactBizCd to set
     */
    public void setContactBizCd(String contactBizCd) {
        this.contactBizCd = contactBizCd;
    }

    /**
     * @return the refTableNm
     */
    public String getRefTableNm() {
        return refTableNm;
    }

    /**
     * @param refTableNm the refTableNm to set
     */
    public void setRefTableNm(String refTableNm) {
        this.refTableNm = refTableNm;
    }

    /**
     * @return the refKeyNm
     */
    public String getRefKeyNm() {
        return refKeyNm;
    }

    /**
     * @param refKeyNm the refKeyNm to set
     */
    public void setRefKeyNm(String refKeyNm) {
        this.refKeyNm = refKeyNm;
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
     * @return the contactCont
     */
    public String getContactCont() {
        return contactCont;
    }

    /**
     * @param contactCont the contactCont to set
     */
    public void setContactCont(String contactCont) {
        this.contactCont = contactCont;
    }

    /**
     * @return the smsTmplUserSeq
     */
    public int getSmsTmplUserSeq() {
        return smsTmplUserSeq;
    }

    /**
     * @param smsTmplUserSeq the smsTmplUserSeq to set
     */
    public void setSmsTmplUserSeq(int smsTmplUserSeq) {
        this.smsTmplUserSeq = smsTmplUserSeq;
    }

    /**
     * @return the contactTpNm
     */
    public String getContactTpNm() {
        return contactTpNm;
    }

    /**
     * @param contactTpNm the contactTpNm to set
     */
    public void setContactTpNm(String contactTpNm) {
        this.contactTpNm = contactTpNm;
    }

    /**
     * @return the contactBizCdNm
     */
    public String getContactBizCdNm() {
        return contactBizCdNm;
    }

    /**
     * @param contactBizCdNm the contactBizCdNm to set
     */
    public void setContactBizCdNm(String contactBizCdNm) {
        this.contactBizCdNm = contactBizCdNm;
    }


    /**
     * @return the smsSendSeq
     */
    public String getSmsSendSeq() {
        return smsSendSeq;
    }

    /**
     * @param smsSendSeq the smsSendSeq to set
     */
    public void setSmsSendSeq(String smsSendSeq) {
        this.smsSendSeq = smsSendSeq;
    }



    /**
     * @return the receiveRsltCdNm
     */
    public String getReceiveRsltCdNm() {
        return receiveRsltCdNm;
    }

    /**
     * @param receiveRsltCdNm the receiveRsltCdNm to set
     */
    public void setReceiveRsltCdNm(String receiveRsltCdNm) {
        this.receiveRsltCdNm = receiveRsltCdNm;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "ContactHistoryVO [dlrCd=" + dlrCd + ", contactNo=" + contactNo + ", custNo=" + custNo
                + ", contactStatCd=" + contactStatCd + ", contactTp=" + contactTp + ", contactBizCd=" + contactBizCd
                + ", contactCont=" + contactCont + ", refTableNm=" + refTableNm + ", refKeyNm=" + refKeyNm
                + ", regUsrId=" + regUsrId + ", regDt=" + regDt + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt
                + ", smsTmplUserSeq=" + smsTmplUserSeq + ", contactTpNm=" + contactTpNm + ", contactBizCdNm="
                + contactBizCdNm + ", receiveRsltCdNm=" + receiveRsltCdNm + ", smsSendSeq=" + smsSendSeq + "]";
    }

    /**
     * @return the sendDt
     */
    public Date getSendDt() {
        return sendDt;
    }

    /**
     * @param sendDt the sendDt to set
     */
    public void setSendDt(Date sendDt) {
        this.sendDt = sendDt;
    }
}