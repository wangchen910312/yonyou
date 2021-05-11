package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
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
     @ValidField(field="custNo"      , mesgKey="global.lbl.custNo")              // 고객번호
    ,@ValidField(field="hpNo"       , mesgKey="global.lbl.hpNo")                // 휴대전화
    ,@ValidField(field="cont"       , mesgKey="global.lbl.cont")                // 내용
    ,@ValidField(field="messageTp"       , mesgKey="global.lbl.messageTp")      // 메시지타입 ( 접촉유형 )
    ,@ValidField(field="contactBizCd"  , mesgKey="global.lbl.wrkTp")            // 업무유형
    ,@ValidField(field="refTableNm"   , mesgKey="global.lbl.refTableNm")        // 출처테이블
    ,@ValidField(field="refKeyNm"     , mesgKey="global.lbl.refKeyNm")          // 출처키
})

public class MessageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8608631322615013224L;

   /**
    * 고객번호
    **/
   @NotEmpty
   private  String        custNo;

   /**
    * 휴대전화
    **/
   @NotEmpty
   private  String        hpNo;

   /**
    * 메시지 타입 ( 01:SMS / 02:EMAIL / 03:WeChat )
    **/
   @NotEmpty
   private  String        messageTp;

   /**
    * 내용
    **/
   @NotEmpty
   private  String        cont;

   @NotEmpty
   private  String        contactBizCd;       // 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)

   @NotEmpty
   private  String        refTableNm;       // 출처테이블

   @NotEmpty
   private  String        refKeyNm;         // 출처 키

   private  Date          regDt;
   private  String        regUsrId;
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
 * @return the hpNo
 */
public String getHpNo() {
    return hpNo;
}
/**
 * @param hpNo the hpNo to set
 */
public void setHpNo(String hpNo) {
    this.hpNo = hpNo;
}
/**
 * @return the messageTp
 */
public String getMessageTp() {
    return messageTp;
}
/**
 * @param messageTp the messageTp to set
 */
public void setMessageTp(String messageTp) {
    this.messageTp = messageTp;
}
/**
 * @return the cont
 */
public String getCont() {
    return cont;
}
/**
 * @param cont the cont to set
 */
public void setCont(String cont) {
    this.cont = cont;
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
/*
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
    return "MessageVO [custNo=" + custNo + ", hpNo=" + hpNo + ", messageTp=" + messageTp + ", cont=" + cont
            + ", contactBizCd=" + contactBizCd + ", refTableNm=" + refTableNm + ", refKeyNm=" + refKeyNm + ", regDt="
            + regDt + ", regUsrId=" + regUsrId + "]";
}


}
