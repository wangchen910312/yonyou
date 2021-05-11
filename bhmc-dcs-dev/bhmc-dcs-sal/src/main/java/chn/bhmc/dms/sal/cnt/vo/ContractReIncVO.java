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
 * @ClassName   : ContractIncVO
 * @Description : 계약 보험 조회 VO
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
    @ValidField(field="dlrCd"      , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo" , mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="incTp"      , mesgKey="sal.lbl.incTp")
   ,@ValidField(field="incExpcAmt" , mesgKey="sal.lbl.incExpcAmt")
   ,@ValidField(field="realIncAmt" , mesgKey="sal.lbl.realIncAmt")
   ,@ValidField(field="incPrid"    , mesgKey="sal.lbl.incPrid")
   ,@ValidField(field="incStartDt" , mesgKey="sal.lbl.incStartDt")
   ,@ValidField(field="incEndDt"   , mesgKey="sal.lbl.incEndDt")
   ,@ValidField(field="remark"     , mesgKey="sal.lbl.remark")
   ,@ValidField(field="regUsrId"   , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"      , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"  , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"     , mesgKey="sal.lbl.updtDt")
   })
public class ContractReIncVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5762647302422712954L;

    /**
     * 딜러코드
     **/
    private  String      dlrCd;

    /**
     * 계약번호
     **/
    private  String      contractNo;

    /**
     * 보험유형
     **/
    private  String      incTp;

    /**
     * 보험예상금액
     **/
    private  Double      incExpcAmt;

    /**
     * 실보험금액
     **/
    private  Double      realIncAmt;

    /**
     * 보험기간
     **/
    private  int         incPrid;

    /**
     * 보험시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        incStartDt;

    /**
     * 보험종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        incEndDt;

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
     * @return the incTp
     */
    public String getIncTp() {
        return incTp;
    }

    /**
     * @param incTp the incTp to set
     */
    public void setIncTp(String incTp) {
        this.incTp = incTp;
    }

    /**
     * @return the incExpcAmt
     */
    public Double getIncExpcAmt() {
        return incExpcAmt;
    }

    /**
     * @param incExpcAmt the incExpcAmt to set
     */
    public void setIncExpcAmt(Double incExpcAmt) {
        this.incExpcAmt = incExpcAmt;
    }

    /**
     * @return the realIncAmt
     */
    public Double getRealIncAmt() {
        return realIncAmt;
    }

    /**
     * @param realIncAmt the realIncAmt to set
     */
    public void setRealIncAmt(Double realIncAmt) {
        this.realIncAmt = realIncAmt;
    }

    /**
     * @return the incPrid
     */
    public int getIncPrid() {
        return incPrid;
    }

    /**
     * @param incPrid the incPrid to set
     */
    public void setIncPrid(int incPrid) {
        this.incPrid = incPrid;
    }

    /**
     * @return the incStartDt
     */
    public Date getIncStartDt() {
        return incStartDt;
    }

    /**
     * @param incStartDt the incStartDt to set
     */
    public void setIncStartDt(Date incStartDt) {
        this.incStartDt = incStartDt;
    }

    /**
     * @return the incEndDt
     */
    public Date getIncEndDt() {
        return incEndDt;
    }

    /**
     * @param incEndDt the incEndDt to set
     */
    public void setIncEndDt(Date incEndDt) {
        this.incEndDt = incEndDt;
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
