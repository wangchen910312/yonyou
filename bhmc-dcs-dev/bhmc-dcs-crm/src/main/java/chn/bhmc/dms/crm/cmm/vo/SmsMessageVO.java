package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MessageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2016.04.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.05.     In Moon Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    // 20160629 메시지 등록 완료
     @ValidField(field="smsTp"          , mesgKey="crm.lbl.smsTp")          // SMS 발송타입
    ,@ValidField(field="resvDt"         , mesgKey="crm.lbl.resvDt")         // 예약시간
    ,@ValidField(field="mesgTmplNo"     , mesgKey="global.lbl.mesgTmpl")    // 메세지템플릿
    ,@ValidField(field="contactBizCd"   , mesgKey="global.lbl.wrkTp")       // 업무유형
    ,@ValidField(field="refTableNm"     , mesgKey="global.lbl.refTableNm")  // 출처테이블
    ,@ValidField(field="refKeyNm"       , mesgKey="global.lbl.refKeyNm")    // 출처키
    ,@ValidField(field="smsTmplMsg"     , mesgKey="global.lbl.message")     // 메시지

})

public class SmsMessageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4002947992396710187L;

    //SMS 발송 타입 ( N:즉시전송 / R:예약전송 )
    @NotEmpty
    private  String        smsTp;

    //SMS 메시지
    @NotEmpty
    private  String        smsTmplMsg;

    // 예약전송일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          resvDt;

    // sms 대상자 그룹 시퀀스
    private  int           smsTmplUserSeq;

    // 메시지 템플릿 번호
    private  int           mesgTmplNo;

    // 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)
    @NotEmpty
    private  String        contactBizCd;

    // 출처테이블
    @NotEmpty
    private  String        refTableNm;

    // 출처 키
    @NotEmpty
    private  String        refKeyNm;

    // SMS 전송 대상자 목록
    private  List<SmsTmplUserVO> insertSms;

    /**
     * @return the smsTp
     */
    public String getSmsTp() {
        return smsTp;
    }

    /**
     * @param smsTp the smsTp to set
     */
    public void setSmsTp(String smsTp) {
        this.smsTp = smsTp;
    }

    /**
     * @return the resvDt
     */
    public Date getResvDt() {
        return resvDt;
    }

    /**
     * @param resvDt the resvDt to set
     */
    public void setResvDt(Date resvDt) {
        this.resvDt = resvDt;
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
     * @return the mesgTmplNo
     */
    public int getMesgTmplNo() {
        return mesgTmplNo;
    }

    /**
     * @param mesgTmplNo the mesgTmplNo to set
     */
    public void setMesgTmplNo(int mesgTmplNo) {
        this.mesgTmplNo = mesgTmplNo;
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
     * @return the insertSms
     */
    public List<SmsTmplUserVO> getInsertSms() {
        return insertSms;
    }

    /**
     * @param insertSms the insertSms to set
     */
    public void setInsertSms(List<SmsTmplUserVO> insertSms) {
        this.insertSms = insertSms;
    }

    /**
     * @return the smsTmplMsg
     */
    public String getSmsTmplMsg() {
        return smsTmplMsg;
    }

    /**
     * @param smsTmplMsg the smsTmplMsg to set
     */
    public void setSmsTmplMsg(String smsTmplMsg) {
        this.smsTmplMsg = smsTmplMsg;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SmsMessageVO [smsTp=" + smsTp + ", smsTmplMsg=" + smsTmplMsg + ", resvDt=" + resvDt
                + ", smsTmplUserSeq=" + smsTmplUserSeq + ", mesgTmplNo=" + mesgTmplNo + ", contactBizCd="
                + contactBizCd + ", refTableNm=" + refTableNm + ", refKeyNm=" + refKeyNm + ", insertSms=" + insertSms
                + "]";
    }

}
