package chn.bhmc.dms.sal.cnt.vo;

import java.io.Serializable;
import java.util.Date;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;




/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   :
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.    Kim Jin Suk      최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"     , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo", mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="seq"       , mesgKey="sal.lbl.seq")
   ,@ValidField(field="optionCd"  , mesgKey="sal.lbl.optionCd")
   ,@ValidField(field="optionNm"  , mesgKey="sal.lbl.optionNm")
   ,@ValidField(field="optionAmt" , mesgKey="sal.lbl.optionAmt")
   ,@ValidField(field="instReqDt" , mesgKey="sal.lbl.instReqDt")
   ,@ValidField(field="regUsrId"  , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"     , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId" , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"    , mesgKey="sal.lbl.updtDt")
   })
public class ContractLocalOptionVO implements Serializable{
   /**
    * Statements
    * (long)serialVersionUID
    */
   private static final long serialVersionUID = -2474628404854510454L;


   /**
    * 딜러코드
    **/
   private  String     dlrCd;

   /**
    * 계약번호
    **/
   private  String     contractNo;

   /**
    * 일련번호
    **/
   private  int        seq;

   /**
    * 옵션코드
    **/
   private  String     optionCd;

   private  String     optionNm;

   /**
    * 옵션금액
    **/
   //OPTION_AMT
   private  Double     optionAmt;

   /**
    * 장착요청일자
    **/
   //INST_REQ_DT
   private  Date       instReqDt;

   /**
    * 등록자ID
    **/
   private  String     regUsrId;

   /**
    * 등록일자
    **/
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
   private  Date       updtDt;

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
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the optionCd
     */
    public String getOptionCd() {
        return optionCd;
    }

    /**
     * @param optionCd the optionCd to set
     */
    public void setOptionCd(String optionCd) {
        this.optionCd = optionCd;
    }

    /**
     * @return the optionNm
     */
    public String getOptionNm() {
        return optionNm;
    }

    /**
     * @param optionNm the optionNm to set
     */
    public void setOptionNm(String optionNm) {
        this.optionNm = optionNm;
    }

    /**
     * @return the optionAmt
     */
    public Double getOptionAmt() {
        return optionAmt;
    }

    /**
     * @param optionAmt the optionAmt to set
     */
    public void setOptionAmt(Double optionAmt) {
        this.optionAmt = optionAmt;
    }

    /**
     * @return the instReqDt
     */
    public Date getInstReqDt() {
        return instReqDt;
    }

    /**
     * @param instReqDt the instReqDt to set
     */
    public void setInstReqDt(Date instReqDt) {
        this.instReqDt = instReqDt;
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
