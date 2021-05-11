package chn.bhmc.dms.ser.wac.vo;

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
 * @ClassName  : FreeServicePartRequestVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since         author              description
 *  ===========    =============    ===========================
 *  2016. 8. 19.     Kwon ki hyun     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="vinNo", mesgKey="global.lbl.vinNo")
})
public class FreeServicePartRequestVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6035417666551235464L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 면비부품문서번호
     **/
    private String freeItemDocNo;

    /**
     * 차대번호
     **/
    @NotEmpty
    private String vinNo;

    /**
     * 면비부품상태
     **/
    private String freeItemStatCd;

    /**
     * 부품유형
     **/
    private String itemTp;

    /**
     * 부품번호
     **/
    private String itemCd;

    /**
     * 부품명
     **/
    private String itemNm;

    /**
     * 면비부품요청일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date freeItemReqDt;

    /**
     * BHMC 판정일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date bhmcConfirmDt;

    /**
     * BHMC 판정ID
     **/
    private String bhmcJudgId;

    /**
     * BHMC 판정명
     **/
    private String bhmcJudgNm;

    /**
     * BHMC 처리의견
     **/
    private String bhmcJudgProcCont;

    /**
     * 공급상 판정일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date spyrJudgDt;

    /**
     * 공급상 판정ID
     **/
    private String spyrJudgId;

    /**
     * 공급상 판정명
     **/
    private String spyrJudgNm;

    /**
     * 공급상 처리의견
     **/
    private String spyrProcCont;

    /**
     * 면비부품승인번호
     **/
    private String freeItemApproveNo;

    /**
     * LTS MODEL CD
     **/
    private String ltsModelCd;

    private String ltsModelNm;

    /**
     * 보증적용일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartDt;

    /**
     * 판매일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date saleDt;

    /**
     * 생산일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date creDt;

    /**
     * 운행월
     **/
    private String driveMonth;

    /**
     * 주행거리
     **/
    private int runDistVal;

    /**
     * 신청인
     **/
    private String reqUsrNm;

    /**
     * 신청인 전화번호
     **/
    private String reqUsrTelNo;

    /**
     * 소유자ID
     **/
    private String carOwnerId;

    /**
     * 소유자명
     **/
    private String carOwnerNm;

    /**
     * 고객전화
     **/
    private String carOwnerTelNo;

    /**
     * 이전신청딜러
     **/
    private String befReqDlrCd;

    /**
     * 이전신청부품
     **/
    private String befReqItemCd;

    /**
     * 부품업체
     **/
    private String itemCmp;

    /**
     * 작성일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrtrDt;

    /**
     * 원인코드
     **/
    private String cauCd;

    /**
     * 원인코드명
     **/
    private String cauNm;

    /**
     * 현상코드
     **/
    private String phenCd;

    /**
     * 현상코드명
     **/
    private String phenNm;

    /**
     * 고장현상설명
     **/
    private String errCauCont;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 파일키
     **/
    private String fileKeyNm;

    /**
     * 공금상면비부품발송일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date spyrFreeItemSendDt;

    /**
     * 딜러면비부품접수일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrFreeItemAcptDt;

    /**
     * 딜러고품반납송장번호
     **/
    private String dlrOldItemRtnInvc;

    /**
     * 공금상면비부품송장번호
     **/
    private String spyrFreeItemRtnInvc;

    /**
     * 딜러고품반납일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrOldItemRtnDt;

    /**
     * 면비부품발송택배회사명
     **/
    private String freeItemExpsCmpNm;

    /**
     * 고품반납택배회사명
     **/
    private String oldItemExpsCmpNm;

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
     * @return the freeItemDocNo
     */
    public String getFreeItemDocNo() {
        return freeItemDocNo;
    }

    /**
     * @param freeItemDocNo the freeItemDocNo to set
     */
    public void setFreeItemDocNo(String freeItemDocNo) {
        this.freeItemDocNo = freeItemDocNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the freeItemStatCd
     */
    public String getFreeItemStatCd() {
        return freeItemStatCd;
    }

    /**
     * @param freeItemStatCd the freeItemStatCd to set
     */
    public void setFreeItemStatCd(String freeItemStatCd) {
        this.freeItemStatCd = freeItemStatCd;
    }

    /**
     * @return the itemTp
     */
    public String getItemTp() {
        return itemTp;
    }

    /**
     * @param itemTp the itemTp to set
     */
    public void setItemTp(String itemTp) {
        this.itemTp = itemTp;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the freeItemReqDt
     */
    public Date getFreeItemReqDt() {
        return freeItemReqDt;
    }

    /**
     * @param freeItemReqDt the freeItemReqDt to set
     */
    public void setFreeItemReqDt(Date freeItemReqDt) {
        this.freeItemReqDt = freeItemReqDt;
    }

    /**
     * @return the bhmcConfirmDt
     */
    public Date getBhmcConfirmDt() {
        return bhmcConfirmDt;
    }

    /**
     * @param bhmcConfirmDt the bhmcConfirmDt to set
     */
    public void setBhmcConfirmDt(Date bhmcConfirmDt) {
        this.bhmcConfirmDt = bhmcConfirmDt;
    }

    /**
     * @return the bhmcJudgId
     */
    public String getBhmcJudgId() {
        return bhmcJudgId;
    }

    /**
     * @param bhmcJudgId the bhmcJudgId to set
     */
    public void setBhmcJudgId(String bhmcJudgId) {
        this.bhmcJudgId = bhmcJudgId;
    }

    /**
     * @return the bhmcJudgNm
     */
    public String getBhmcJudgNm() {
        return bhmcJudgNm;
    }

    /**
     * @param bhmcJudgNm the bhmcJudgNm to set
     */
    public void setBhmcJudgNm(String bhmcJudgNm) {
        this.bhmcJudgNm = bhmcJudgNm;
    }

    /**
     * @return the bhmcJudgProcCont
     */
    public String getBhmcJudgProcCont() {
        return bhmcJudgProcCont;
    }

    /**
     * @param bhmcJudgProcCont the bhmcJudgProcCont to set
     */
    public void setBhmcJudgProcCont(String bhmcJudgProcCont) {
        this.bhmcJudgProcCont = bhmcJudgProcCont;
    }

    /**
     * @return the spyrJudgDt
     */
    public Date getSpyrJudgDt() {
        return spyrJudgDt;
    }

    /**
     * @param spyrJudgDt the spyrJudgDt to set
     */
    public void setSpyrJudgDt(Date spyrJudgDt) {
        this.spyrJudgDt = spyrJudgDt;
    }

    /**
     * @return the spyrJudgId
     */
    public String getSpyrJudgId() {
        return spyrJudgId;
    }

    /**
     * @param spyrJudgId the spyrJudgId to set
     */
    public void setSpyrJudgId(String spyrJudgId) {
        this.spyrJudgId = spyrJudgId;
    }

    /**
     * @return the spyrJudgNm
     */
    public String getSpyrJudgNm() {
        return spyrJudgNm;
    }

    /**
     * @param spyrJudgNm the spyrJudgNm to set
     */
    public void setSpyrJudgNm(String spyrJudgNm) {
        this.spyrJudgNm = spyrJudgNm;
    }

    /**
     * @return the spyrProcCont
     */
    public String getSpyrProcCont() {
        return spyrProcCont;
    }

    /**
     * @param spyrProcCont the spyrProcCont to set
     */
    public void setSpyrProcCont(String spyrProcCont) {
        this.spyrProcCont = spyrProcCont;
    }

    /**
     * @return the freeItemApproveNo
     */
    public String getFreeItemApproveNo() {
        return freeItemApproveNo;
    }

    /**
     * @param freeItemApproveNo the freeItemApproveNo to set
     */
    public void setFreeItemApproveNo(String freeItemApproveNo) {
        this.freeItemApproveNo = freeItemApproveNo;
    }

    /**
     * @return the ltsModelCd
     */
    public String getLtsModelCd() {
        return ltsModelCd;
    }

    /**
     * @param ltsModelCd the ltsModelCd to set
     */
    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    /**
     * @return the wartDt
     */
    public Date getWartDt() {
        return wartDt;
    }

    /**
     * @param wartDt the wartDt to set
     */
    public void setWartDt(Date wartDt) {
        this.wartDt = wartDt;
    }

    /**
     * @return the saleDt
     */
    public Date getSaleDt() {
        return saleDt;
    }

    /**
     * @param saleDt the saleDt to set
     */
    public void setSaleDt(Date saleDt) {
        this.saleDt = saleDt;
    }

    /**
     * @return the creDt
     */
    public Date getCreDt() {
        return creDt;
    }

    /**
     * @param creDt the creDt to set
     */
    public void setCreDt(Date creDt) {
        this.creDt = creDt;
    }

    /**
     * @return the driveMonth
     */
    public String getDriveMonth() {
        return driveMonth;
    }

    /**
     * @param driveMonth the driveMonth to set
     */
    public void setDriveMonth(String driveMonth) {
        this.driveMonth = driveMonth;
    }

    /**
     * @return the runDistVal
     */
    public int getRunDistVal() {
        return runDistVal;
    }

    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }



    /**
     * @return the reqUsrNm
     */
    public String getReqUsrNm() {
        return reqUsrNm;
    }

    /**
     * @param reqUsrNm the reqUsrNm to set
     */
    public void setReqUsrNm(String reqUsrNm) {
        this.reqUsrNm = reqUsrNm;
    }

    /**
     * @return the reqUsrTelNo
     */
    public String getReqUsrTelNo() {
        return reqUsrTelNo;
    }

    /**
     * @param reqUsrTelNo the reqUsrTelNo to set
     */
    public void setReqUsrTelNo(String reqUsrTelNo) {
        this.reqUsrTelNo = reqUsrTelNo;
    }

    /**
     * @return the carOwnerId
     */
    public String getCarOwnerId() {
        return carOwnerId;
    }

    /**
     * @param carOwnerId the carOwnerId to set
     */
    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    /**
     * @return the carOwnerTelNo
     */
    public String getCarOwnerTelNo() {
        return carOwnerTelNo;
    }

    /**
     * @param carOwnerTelNo the carOwnerTelNo to set
     */
    public void setCarOwnerTelNo(String carOwnerTelNo) {
        this.carOwnerTelNo = carOwnerTelNo;
    }

    /**
     * @return the befReqDlrCd
     */
    public String getBefReqDlrCd() {
        return befReqDlrCd;
    }

    /**
     * @param befReqDlrCd the befReqDlrCd to set
     */
    public void setBefReqDlrCd(String befReqDlrCd) {
        this.befReqDlrCd = befReqDlrCd;
    }

    /**
     * @return the befReqItemCd
     */
    public String getBefReqItemCd() {
        return befReqItemCd;
    }

    /**
     * @param befReqItemCd the befReqItemCd to set
     */
    public void setBefReqItemCd(String befReqItemCd) {
        this.befReqItemCd = befReqItemCd;
    }

    /**
     * @return the itemCmp
     */
    public String getItemCmp() {
        return itemCmp;
    }

    /**
     * @param itemCmp the itemCmp to set
     */
    public void setItemCmp(String itemCmp) {
        this.itemCmp = itemCmp;
    }

    /**
     * @return the wrtrDt
     */
    public Date getWrtrDt() {
        return wrtrDt;
    }

    /**
     * @param wrtrDt the wrtrDt to set
     */
    public void setWrtrDt(Date wrtrDt) {
        this.wrtrDt = wrtrDt;
    }

    /**
     * @return the cauCd
     */
    public String getCauCd() {
        return cauCd;
    }

    /**
     * @param cauCd the cauCd to set
     */
    public void setCauCd(String cauCd) {
        this.cauCd = cauCd;
    }

    /**
     * @return the cauNm
     */
    public String getCauNm() {
        return cauNm;
    }

    /**
     * @param cauNm the cauNm to set
     */
    public void setCauNm(String cauNm) {
        this.cauNm = cauNm;
    }

    /**
     * @return the phenCd
     */
    public String getPhenCd() {
        return phenCd;
    }

    /**
     * @param phenCd the phenCd to set
     */
    public void setPhenCd(String phenCd) {
        this.phenCd = phenCd;
    }

    /**
     * @return the phenNm
     */
    public String getPhenNm() {
        return phenNm;
    }

    /**
     * @param phenNm the phenNm to set
     */
    public void setPhenNm(String phenNm) {
        this.phenNm = phenNm;
    }

    /**
     * @return the errCauCont
     */
    public String getErrCauCont() {
        return errCauCont;
    }

    /**
     * @param errCauCont the errCauCont to set
     */
    public void setErrCauCont(String errCauCont) {
        this.errCauCont = errCauCont;
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
     * @return the fileKeyNm
     */
    public String getFileKeyNm() {
        return fileKeyNm;
    }

    /**
     * @param fileKeyNm the fileKeyNm to set
     */
    public void setFileKeyNm(String fileKeyNm) {
        this.fileKeyNm = fileKeyNm;
    }

    /**
     * @return the spyrFreeItemSendDt
     */
    public Date getSpyrFreeItemSendDt() {
        return spyrFreeItemSendDt;
    }

    /**
     * @param spyrFreeItemSendDt the spyrFreeItemSendDt to set
     */
    public void setSpyrFreeItemSendDt(Date spyrFreeItemSendDt) {
        this.spyrFreeItemSendDt = spyrFreeItemSendDt;
    }

    /**
     * @return the dlrFreeItemAcptDt
     */
    public Date getDlrFreeItemAcptDt() {
        return dlrFreeItemAcptDt;
    }

    /**
     * @param dlrFreeItemAcptDt the dlrFreeItemAcptDt to set
     */
    public void setDlrFreeItemAcptDt(Date dlrFreeItemAcptDt) {
        this.dlrFreeItemAcptDt = dlrFreeItemAcptDt;
    }

    /**
     * @return the dlrOldItemRtnInvc
     */
    public String getDlrOldItemRtnInvc() {
        return dlrOldItemRtnInvc;
    }

    /**
     * @param dlrOldItemRtnInvc the dlrOldItemRtnInvc to set
     */
    public void setDlrOldItemRtnInvc(String dlrOldItemRtnInvc) {
        this.dlrOldItemRtnInvc = dlrOldItemRtnInvc;
    }

    /**
     * @return the spyrFreeItemRtnInvc
     */
    public String getSpyrFreeItemRtnInvc() {
        return spyrFreeItemRtnInvc;
    }

    /**
     * @param spyrFreeItemRtnInvc the spyrFreeItemRtnInvc to set
     */
    public void setSpyrFreeItemRtnInvc(String spyrFreeItemRtnInvc) {
        this.spyrFreeItemRtnInvc = spyrFreeItemRtnInvc;
    }

    /**
     * @return the dlrOldItemRtnDt
     */
    public Date getDlrOldItemRtnDt() {
        return dlrOldItemRtnDt;
    }

    /**
     * @param dlrOldItemRtnDt the dlrOldItemRtnDt to set
     */
    public void setDlrOldItemRtnDt(Date dlrOldItemRtnDt) {
        this.dlrOldItemRtnDt = dlrOldItemRtnDt;
    }

    /**
     * @return the freeItemExpsCmpNm
     */
    public String getFreeItemExpsCmpNm() {
        return freeItemExpsCmpNm;
    }

    /**
     * @param freeItemExpsCmpNm the freeItemExpsCmpNm to set
     */
    public void setFreeItemExpsCmpNm(String freeItemExpsCmpNm) {
        this.freeItemExpsCmpNm = freeItemExpsCmpNm;
    }

    /**
     * @return the oldItemExpsCmpNm
     */
    public String getOldItemExpsCmpNm() {
        return oldItemExpsCmpNm;
    }

    /**
     * @param oldItemExpsCmpNm the oldItemExpsCmpNm to set
     */
    public void setOldItemExpsCmpNm(String oldItemExpsCmpNm) {
        this.oldItemExpsCmpNm = oldItemExpsCmpNm;
    }

    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }

    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }



}
