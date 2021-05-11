package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

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
 * @ClassName   : TestDriveVehicleInspctSaveVO
 * @Description : 시승차량 심사 VO
 * @author Bong
 * @since 2016. 3. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.03.08        Bong             최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"          , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="usrId"          , mesgKey="sal.lbl.usrId")
   ,@ValidField(field="reqNo"         , mesgKey="sal.lbl.reqNo")


   ,@ValidField(field="approveCd"      , mesgKey="sal.lbl.approveCd")
   ,@ValidField(field="approveEndDt"   , mesgKey="sal.lbl.approveEndDt")

   ,@ValidField(field="regUsrId"       , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"          , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"      , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"         , mesgKey="sal.lbl.updtDt")
   })
public class TestDriveVehicleInspctSaveVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2396054457495152808L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private  String          dlrCd;

    /**
     * 사용자ID
     **/
    private  String          usrId;

    /**
     * 요청일련번호
     **/
    private  int             reqNo;
    private  int             spcOrdSeq;

    /**
     * 승인여부
     **/
    private  String          approveCd;

    /**
     * 승인종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            approveEndDt;

    /**
     * 최종승인차수
     */
    private  int             lastApproveCnt;

    /**
     * 최종승인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            lastApproveDt;
    
    /**
     * 승인여부
     */
    private String evalRsltYn;

    /**
     * 심사평가
     */
    private String remark;

    /**
     * 합격여부
     */
    private String fsdmAgrYn;

    /**
     * 심사비고
     */
    private String fsdmAgrRemark;

    /**
     * 등록자ID
     **/
    private  String          regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            regDt;

    /**
     * 수정자ID
     **/
    private  String          updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            updtDt;


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
     * @return the spcOrdSeq
     */
    public int getSpcOrdSeq() {
        return spcOrdSeq;
    }

    /**
     * @param spcOrdSeq the spcOrdSeq to set
     */
    public void setSpcOrdSeq(int spcOrdSeq) {
        this.spcOrdSeq = spcOrdSeq;
    }

    /**
     * @return the approveCd
     */
    public String getApproveCd() {
        return approveCd;
    }

    /**
     * @param approveCd the approveCd to set
     */
    public void setApproveCd(String approveCd) {
        this.approveCd = approveCd;
    }

    /**
     * @return the approveEndDt
     */
    public Date getApproveEndDt() {
        return approveEndDt;
    }

    /**
     * @param approveEndDt the approveEndDt to set
     */
    public void setApproveEndDt(Date approveEndDt) {
        this.approveEndDt = approveEndDt;
    }

    /**
     * @return the lastApproveCnt
     */
    public int getLastApproveCnt() {
        return lastApproveCnt;
    }

    /**
     * @param lastApproveCnt the lastApproveCnt to set
     */
    public void setLastApproveCnt(int lastApproveCnt) {
        this.lastApproveCnt = lastApproveCnt;
    }

    /**
     * @return the lastApproveDt
     */
    public Date getLastApproveDt() {
        return lastApproveDt;
    }

    /**
     * @param lastApproveDt the lastApproveDt to set
     */
    public void setLastApproveDt(Date lastApproveDt) {
        this.lastApproveDt = lastApproveDt;
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
     * @return the fsdmAgrYn
     */
    public String getFsdmAgrYn() {
        return fsdmAgrYn;
    }

    /**
     * @param fsdmAgrYn the fsdmAgrYn to set
     */
    public void setFsdmAgrYn(String fsdmAgrYn) {
        this.fsdmAgrYn = fsdmAgrYn;
    }

    /**
     * @return the fsdmAgrRemark
     */
    public String getFsdmAgrRemark() {
        return fsdmAgrRemark;
    }

    /**
     * @param fsdmAgrRemark the fsdmAgrRemark to set
     */
    public void setFsdmAgrRemark(String fsdmAgrRemark) {
        this.fsdmAgrRemark = fsdmAgrRemark;
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
