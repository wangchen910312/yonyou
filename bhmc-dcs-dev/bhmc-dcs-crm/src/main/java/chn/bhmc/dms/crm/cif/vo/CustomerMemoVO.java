package chn.bhmc.dms.crm.cif.vo;

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
 * @ClassName   : CustomerRelInfoVO.java
 * @Description : 고객 연계인 정보를 관리한다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */



public class CustomerMemoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5395789311313323287L;


   /**
    * DLR_CD
    **/
   @NotEmpty

   private  String     dlrCd;

   /**
    * 고객번호
    **/
   @NotEmpty

   private  String     custNo;

   /**
    * 메모유형
    **/
   //MEMO_TP

   private  String     memoTp;

   /**
    * 메모내용
    **/
   //MEMO_CONT

   private  String     memoCont;

   /**
    * 공개여부
    **/
   @NotEmpty

   private  String     shareYn;

   /**
    * 등록자ID
    **/
   //REG_USR_ID

   private  String     regUsrId;

   /**
    * 등록일자
    **/
   //REG_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date       regDt;

   /**
    * 수정자ID
    **/
   //UPDT_USR_ID

   private  String     updtUsrId;

   /**
    * 수정일자
    **/
   //UPDT_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date       updtDt;

   private String      seq;

   private String      usrNm;
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
 * @return the memoTp
 */
public String getMemoTp() {
    return memoTp;
}

/**
 * @param memoTp the memoTp to set
 */
public void setMemoTp(String memoTp) {
    this.memoTp = memoTp;
}

/**
 * @return the memoCont
 */
public String getMemoCont() {
    return memoCont;
}

/**
 * @param memoCont the memoCont to set
 */
public void setMemoCont(String memoCont) {
    this.memoCont = memoCont;
}

/**
 * @return the shareYn
 */
public String getShareYn() {
    return shareYn;
}

/**
 * @param shareYn the shareYn to set
 */
public void setShareYn(String shareYn) {
    this.shareYn = shareYn;
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
 * @return the usrNm
 */
public String getUsrNm() {
    return usrNm;
}

/**
 * @param usrNm the usrNm to set
 */
public void setUsrNm(String usrNm) {
    this.usrNm = usrNm;
}



}
