package chn.bhmc.dms.sal.cnt.vo;

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
 * @ClassName   : ContractPayInfoVO
 * @Description : 계약 입출금 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 14.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo"      , mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="seq"             , mesgKey="sal.lbl.seq")
   ,@ValidField(field="rcvTp"           , mesgKey="sal.lbl.rcvTp")
   ,@ValidField(field="dpstWdrwTp"      , mesgKey="sal.lbl.dpstWdrwTp")
   ,@ValidField(field="dpstWdrwDt"      , mesgKey="sal.lbl.dpstWdrwDt")
   ,@ValidField(field="dpstWdrwTargTp"  , mesgKey="sal.lbl.dpstWdrwTargTp")
   ,@ValidField(field="dpstWdrwAmt"     , mesgKey="sal.lbl.dpstWdrwAmt")
   ,@ValidField(field="remark"          , mesgKey="sal.lbl.remark")
   ,@ValidField(field="regUsrId"        , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"           , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"       , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"          , mesgKey="sal.lbl.updtDt")
   })
public class ContractPayInfoVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6802658294213167928L;

    /**
     * 딜러코드
     **/
    private  String           dlrCd;

    /**
     * 계약번호
     **/
    private  String           contractNo;

    /**
     * 일련번호
     **/
    private  int              seq;

    /**
     * 수납유형
     **/
    //RCV_TP
    private  String           rcvTp;

    /**
     * 입출금유형
     **/
    //DPST_WDRW_TP
    private  String           dpstWdrwTp;

    /**
     * 입출금일자
     **/
    //DPST_WDRW_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             dpstWdrwDt;

    /**
     * 입출금대상유형
     **/
    //DPST_WDRW_TARG_TP
    private  String           dpstWdrwTargTp;

    /**
     * 입출금금액
     **/
    //DPST_WDRW_AMT
    private  Double           dpstWdrwAmt;

    /**
     * 비고
     **/
    //REMARK
    private  String           remark;

    /**
     * 등록자ID
     **/
    private  String           regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             regDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String           updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             updtDt;

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
     * @return the rcvTp
     */
    public String getRcvTp() {
        return rcvTp;
    }

    /**
     * @param rcvTp the rcvTp to set
     */
    public void setRcvTp(String rcvTp) {
        this.rcvTp = rcvTp;
    }

    /**
     * @return the dpstWdrwTp
     */
    public String getDpstWdrwTp() {
        return dpstWdrwTp;
    }

    /**
     * @param dpstWdrwTp the dpstWdrwTp to set
     */
    public void setDpstWdrwTp(String dpstWdrwTp) {
        this.dpstWdrwTp = dpstWdrwTp;
    }

    /**
     * @return the dpstWdrwDt
     */
    public Date getDpstWdrwDt() {
        return dpstWdrwDt;
    }

    /**
     * @param dpstWdrwDt the dpstWdrwDt to set
     */
    public void setDpstWdrwDt(Date dpstWdrwDt) {
        this.dpstWdrwDt = dpstWdrwDt;
    }

    /**
     * @return the dpstWdrwTargTp
     */
    public String getDpstWdrwTargTp() {
        return dpstWdrwTargTp;
    }

    /**
     * @param dpstWdrwTargTp the dpstWdrwTargTp to set
     */
    public void setDpstWdrwTargTp(String dpstWdrwTargTp) {
        this.dpstWdrwTargTp = dpstWdrwTargTp;
    }

    /**
     * @return the dpstWdrwAmt
     */
    public Double getDpstWdrwAmt() {
        return dpstWdrwAmt;
    }

    /**
     * @param dpstWdrwAmt the dpstWdrwAmt to set
     */
    public void setDpstWdrwAmt(Double dpstWdrwAmt) {
        this.dpstWdrwAmt = dpstWdrwAmt;
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
