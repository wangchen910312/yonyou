package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

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
 * @ClassName   : PackageSalesWorkEvlVO
 * @Description : 집단판매업무신청 심사내역 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.03.16      Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"      , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="usrId"      , mesgKey="sal.lbl.usrId")
   ,@ValidField(field="reqSeq"     , mesgKey="sal.lbl.reqSeq")
   ,@ValidField(field="reqNo"      , mesgKey="sal.lbl.reqNo")
   ,@ValidField(field="evalRsltYn" , mesgKey="sal.lbl.evalRsltYn")
   ,@ValidField(field="pevalId"    , mesgKey="sal.lbl.pevalId")
   ,@ValidField(field="evalDt"     , mesgKey="sal.lbl.evalDt")
   ,@ValidField(field="remark"     , mesgKey="sal.lbl.remark")
   ,@ValidField(field="regUsrId"   , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"      , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"  , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"     , mesgKey="sal.lbl.updtDt")
   })
public class PackageSalesWorkEvlVO extends BaseVO{
   /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3311390188261905299L;

/**
    * 딜러코드
    **/
   private  String      dlrCd;

   /**
    * 사용자ID
    **/
   private  String      usrId;

   /**
    * 요청번호
    **/
   private  int         reqSeq;

   /**
    * 요청일련번호
    **/
   private  int         reqNo;

   /**
    * 심사결과여부
    **/
   private  String      evalRsltYn;

   /**
    * 심사자ID
    **/
   private  String      pevalId;

   /**
    * 심사일자
    **/
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date        evalDt;

   /**
    * 비고
    **/
   private  String      remark;

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
 * @return the usrId
 */
public String getUsrId() {
    return usrId;
}

/**
 * @param usrId the usrId to set
 */
public void setUsrId(String usrId) {
    this.usrId = usrId;
}

/**
 * @return the reqSeq
 */
public int getReqSeq() {
    return reqSeq;
}

/**
 * @param reqSeq the reqSeq to set
 */
public void setReqSeq(int reqSeq) {
    this.reqSeq = reqSeq;
}

/**
 * @return the reqNo
 */
public int getReqNo() {
    return reqNo;
}

/**
 * @param reqNo the reqNo to set
 */
public void setReqNo(int reqNo) {
    this.reqNo = reqNo;
}

/**
 * @return the evalRsltYn
 */
public String getEvalRsltYn() {
    return evalRsltYn;
}

/**
 * @param evalRsltYn the evalRsltYn to set
 */
public void setEvalRsltYn(String evalRsltYn) {
    this.evalRsltYn = evalRsltYn;
}

/**
 * @return the pevalId
 */
public String getPevalId() {
    return pevalId;
}

/**
 * @param pevalId the pevalId to set
 */
public void setPevalId(String pevalId) {
    this.pevalId = pevalId;
}

/**
 * @return the evalDt
 */
public Date getEvalDt() {
    return evalDt;
}

/**
 * @param evalDt the evalDt to set
 */
public void setEvalDt(Date evalDt) {
    this.evalDt = evalDt;
}

/**
 * @return the remark
 */
public String getRemark() {
    return remark;
}

/**
 * @param remark the remark to set
 */
public void setRemark(String remark) {
    this.remark = remark;
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

}
