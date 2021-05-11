package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

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
 * @ClassName : ClaimReqVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since   author description
 * =========== ============= ===========================
 * 2016. 5. 17.  Kwon Ki Hyun  최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="vinNo", mesgKey="global.lbl.vinNo")
    ,@ValidField(field="claimDocNo", mesgKey="ser.lbl.claimNo")
})
public class ClaimReqVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6376396972524775416L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 클레임문서번호
     **/
    private String claimDocNo;

    /**
     * 차대번호
     **/
    @NotBlank
    private String vinNo;

    /**
     * RO문서번호
     **/
    @NotBlank
    private String roDocNo;

    /**
     * 클레임연도
     **/
    private String claimYy;

    /**
     * RO그룹번호
     **/
    private String roGrpNo;

    /**
     * RO유형
     **/
    @NotBlank
    private String roTp;

    /**
     * 클레임유형
     **/
    @NotBlank
    private String claimTp;

    /**
     * 클레임상태코드
     **/
    private String claimStatCd;

    /**
     * 클레임버전코드
     **/
    private String claimVerCd;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

    /**
     * LTS모델코드
     **/
    @NotBlank
    private String ltsModelCd;

    /**
     * LTS 모델명
     */
    private String ltsModelNm;

    /**
     * 엔진번호
     **/
    private String enginNo;

    /**
     * 차량소유자ID
     **/
    private String carOwnerId;

    /**
     * 차량소유자명
     **/
    private String carOwnerNm;

    /**
     * 차량소유자전화번호
     **/
    private String carOwnerTelNo;

    /**
     * 주행거리값
     **/
    private int  runDistVal;

    /**
     * 최종 주행거리값
     **/
    private int  lastDistVal;

    /**
     * 보증일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wartDt;

    /**
     * 차량구분코드
     **/
    private String carDstinCd;

    /**
     * 원인작업항목코드
     **/
    private String cauOperAtcCd;
    /**
     * 원인작업항목명
     **/
    private String cauOperAtcNm;

    /**
     * 원인품목코드
     **/
    private String cauItemCd;

    /**
     * 원인품목명
     **/
    private String cauItemNm;

    /**
     * 원인코드
     **/
    private String cauCd;

    /**
     * 원인명
     **/
    private String cauNm;

    /**
     * 현상코드
     **/
    private String phenCd;

    /**
     * 현상명
     **/
    private String phenNm;
    
    /**
     * 공임 구분코드
     */
    private String dstinCd;

    /**
     * RO시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roStartDt;

    /**
     * RO종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roEndDt;

    /**
     * 클레임시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimStartDt;

    /**
     * 클레임종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimEndDt;

    /**
     * PWA승인번호
     **/
    private String pwaApproveNo;

    /**
     * PWA승인번호
     **/
    private String pwaApproveNoYn;

    /**
     * PWA 문서번호
     */
    private String pwaDocNo;

    /**
     * 캠페인리콜번호
     **/
    private String crNo;

    /**
     * 예약문서번호
     **/
    private String resvDocNo;

    /**
     * 외주금액
     **/
    private Double subAmt;

    /**
     * 외주구분코드
     **/
    private String subDstinCd;

    /**
     * 이전RO일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date befRoDt;

    /**
     * 이전주행거리값
     **/
    private int  befRunDistVal;

    /**
     * 이전RO문서번호
     **/
    private String befRoDocNo;

    /**
     * 공임금액
     **/
    private Double lbrAmt;

    /**
     * 부품금액
     **/
    private Double itemAmt;

    /**
     * 부가가치세금액
     **/
    private Double vatAmt;

    /**
     * 외주공임금액
     **/
    private Double subLbrAmt;

    /**
     * 외주부품금액
     **/
    private Double subItemAmt;

    /**
     * 할인금액
     **/
    private Double dcAmt;

    /**
     * 총금액
     **/
    private Double totAmt;

    /**
     * 클레임청구일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimReqDt;

    /**
     * 청구공임금액
     **/
    private Double reqLbrAmt;

    /**
     * 청구부품금액
     **/
    private Double reqItemAmt;

    /**
     * 청구부가가치세금액
     **/
    private Double reqVatAmt;

    /**
     * 청구외주공임금액
     **/
    private Double reqSubLbrAmt;

    /**
     * 청구외주부품금액
     **/
    private Double reqSubItemAmt;

    /**
     * 클레임확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimConfirmDt;

    /**
     * 확정공임금액
     **/
    private Double comfirmLbrAmt;

    /**
     * 확정공임부가가치세금액
     **/
    private Double comfirmLbrVatAmt;

    /**
     * 확정부품금액
     **/
    private Double comfirmItemAmt;

    /**
     * 확정부품부가가치세금액
     **/
    private Double comfirmItemVatAmt;

    /**
     * 확정외주공임금액
     **/
    private Double comfirmSubLbrAmt;

    /**
     * 확정외주부품금액
     **/
    private Double comfirmSubItemAmt;

    /**
     * 인보이스번호
     **/
    private String invcNo;

    /**
     * 비고
     **/
    private String remark;

    /**
     * AS부품보증구분코드
     **/
    private String asParWartDstinCd;

    /**
     * 클레임기술자문번호
     **/
    private String claimTcavNo;


    /**
     * 클레임기술자문번호 수정여부
     **/
    private String claimTcavNoYn;



    /**
     * 파일키명
     **/
    private String fileKeyNm;

    /**
     * 브랜드코드
     **/
    private String brandCd;


    /**
     * 클레임 승인번호
     */
    private String claimApproveNo;

    /**
     * RO DATE
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roDt;
    /**
     * Claim 생성일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;
    /**
     * 저장 FLAG
     */
    private String crudStatCd;
    /**
     * RO 상태코드
     */
    private String roStatCd;

    /**
     * 고장현상1 코드 사용여부
     */
    private String dtc1UseYn;

    /**
     * 고장현상2 코드 사용여부
     */
    private String dtc2UseYn;

    /**
     * 고장현상3 코드 사용여부
     */
    private String dtc3UseYn;

    /**
     * 고장현상4 코드 사용여부
     */
    private String dtc4UseYn;

    /**
     * 고장현상코드1
     */
    private String dtc1Cd;

    /**
     * 고장현상코드2
     */
    private String dtc2Cd;

    /**
     * 고장현상코드3
     */
    private String dtc3Cd;

    /**
     * 고장현상코드4
     */
    private String dtc4Cd;

    private String ifResltYn;

    /**
     * 클레임 신청자ID
     */
    private String claimReqId;

    /**
     * 클레임 신청자
     */
    private String claimReqNm;

    /**
     * 클레임 작성자
     */
    private String wrtrNm;

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
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
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
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the claimYy
     */
    public String getClaimYy() {
        return claimYy;
    }

    /**
     * @param claimYy the claimYy to set
     */
    public void setClaimYy(String claimYy) {
        this.claimYy = claimYy;
    }

    /**
     * @return the roGrpNo
     */
    public String getRoGrpNo() {
        return roGrpNo;
    }

    /**
     * @param roGrpNo the roGrpNo to set
     */
    public void setRoGrpNo(String roGrpNo) {
        this.roGrpNo = roGrpNo;
    }

    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    /**
     * @return the claimTp
     */
    public String getClaimTp() {
        return claimTp;
    }

    /**
     * @param claimTp the claimTp to set
     */
    public void setClaimTp(String claimTp) {
        this.claimTp = claimTp;
    }

    /**
     * @return the claimStatCd
     */
    public String getClaimStatCd() {
        return claimStatCd;
    }

    /**
     * @param claimStatCd the claimStatCd to set
     */
    public void setClaimStatCd(String claimStatCd) {
        this.claimStatCd = claimStatCd;
    }

    /**
     * @return the claimVerCd
     */
    public String getClaimVerCd() {
        return claimVerCd;
    }

    /**
     * @param claimVerCd the claimVerCd to set
     */
    public void setClaimVerCd(String claimVerCd) {
        this.claimVerCd = claimVerCd;
    }

    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
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

    /**
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }

    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
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
     * @return the lastDistVal
     */
    public int getLastDistVal() {
        return lastDistVal;
    }

    /**
     * @param lastDistVal the lastDistVal to set
     */
    public void setLastDistVal(int lastDistVal) {
        this.lastDistVal = lastDistVal;
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
     * @return the carDstinCd
     */
    public String getCarDstinCd() {
        return carDstinCd;
    }

    /**
     * @param carDstinCd the carDstinCd to set
     */
    public void setCarDstinCd(String carDstinCd) {
        this.carDstinCd = carDstinCd;
    }

    /**
     * @return the cauOperAtcCd
     */
    public String getCauOperAtcCd() {
        return cauOperAtcCd;
    }

    /**
     * @param cauOperAtcCd the cauOperAtcCd to set
     */
    public void setCauOperAtcCd(String cauOperAtcCd) {
        this.cauOperAtcCd = cauOperAtcCd;
    }

    /**
     * @return the cauOperAtcNm
     */
    public String getCauOperAtcNm() {
        return cauOperAtcNm;
    }

    /**
     * @param cauOperAtcNm the cauOperAtcNm to set
     */
    public void setCauOperAtcNm(String cauOperAtcNm) {
        this.cauOperAtcNm = cauOperAtcNm;
    }

    /**
     * @return the cauItemCd
     */
    public String getCauItemCd() {
        return cauItemCd;
    }

    /**
     * @param cauItemCd the cauItemCd to set
     */
    public void setCauItemCd(String cauItemCd) {
        this.cauItemCd = cauItemCd;
    }

    /**
     * @return the cauItemNm
     */
    public String getCauItemNm() {
        return cauItemNm;
    }

    /**
     * @param cauItemNm the cauItemNm to set
     */
    public void setCauItemNm(String cauItemNm) {
        this.cauItemNm = cauItemNm;
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
     * @return the roStartDt
     */
    public Date getRoStartDt() {
        return roStartDt;
    }

    /**
     * @param roStartDt the roStartDt to set
     */
    public void setRoStartDt(Date roStartDt) {
        this.roStartDt = roStartDt;
    }

    /**
     * @return the roEndDt
     */
    public Date getRoEndDt() {
        return roEndDt;
    }

    /**
     * @param roEndDt the roEndDt to set
     */
    public void setRoEndDt(Date roEndDt) {
        this.roEndDt = roEndDt;
    }

    /**
     * @return the claimStartDt
     */
    public Date getClaimStartDt() {
        return claimStartDt;
    }

    /**
     * @param claimStartDt the claimStartDt to set
     */
    public void setClaimStartDt(Date claimStartDt) {
        this.claimStartDt = claimStartDt;
    }

    /**
     * @return the claimEndDt
     */
    public Date getClaimEndDt() {
        return claimEndDt;
    }

    /**
     * @param claimEndDt the claimEndDt to set
     */
    public void setClaimEndDt(Date claimEndDt) {
        this.claimEndDt = claimEndDt;
    }

    /**
     * @return the pwaApproveNo
     */
    public String getPwaApproveNo() {
        return pwaApproveNo;
    }

    /**
     * @param pwaApproveNo the pwaApproveNo to set
     */
    public void setPwaApproveNo(String pwaApproveNo) {
        this.pwaApproveNo = pwaApproveNo;
    }

    /**
     * @return the pwaDocNo
     */
    public String getPwaDocNo() {
        return pwaDocNo;
    }

    /**
     * @param pwaDocNo the pwaDocNo to set
     */
    public void setPwaDocNo(String pwaDocNo) {
        this.pwaDocNo = pwaDocNo;
    }

    /**
     * @return the crNo
     */
    public String getCrNo() {
        return crNo;
    }

    /**
     * @param crNo the crNo to set
     */
    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    /**
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
    }

    /**
     * @return the subAmt
     */
    public Double getSubAmt() {
        return subAmt;
    }

    /**
     * @param subAmt the subAmt to set
     */
    public void setSubAmt(Double subAmt) {
        this.subAmt = subAmt;
    }

    /**
     * @return the subDstinCd
     */
    public String getSubDstinCd() {
        return subDstinCd;
    }

    /**
     * @param subDstinCd the subDstinCd to set
     */
    public void setSubDstinCd(String subDstinCd) {
        this.subDstinCd = subDstinCd;
    }

    /**
     * @return the befRoDt
     */
    public Date getBefRoDt() {
        return befRoDt;
    }

    /**
     * @param befRoDt the befRoDt to set
     */
    public void setBefRoDt(Date befRoDt) {
        this.befRoDt = befRoDt;
    }

    /**
     * @return the befRunDistVal
     */
    public int getBefRunDistVal() {
        return befRunDistVal;
    }

    /**
     * @param befRunDistVal the befRunDistVal to set
     */
    public void setBefRunDistVal(int befRunDistVal) {
        this.befRunDistVal = befRunDistVal;
    }

    /**
     * @return the befRoDocNo
     */
    public String getBefRoDocNo() {
        return befRoDocNo;
    }

    /**
     * @param befRoDocNo the befRoDocNo to set
     */
    public void setBefRoDocNo(String befRoDocNo) {
        this.befRoDocNo = befRoDocNo;
    }

    /**
     * @return the lbrAmt
     */
    public Double getLbrAmt() {
        return lbrAmt;
    }

    /**
     * @param lbrAmt the lbrAmt to set
     */
    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    /**
     * @return the itemAmt
     */
    public Double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(Double itemAmt) {
        this.itemAmt = itemAmt;
    }

    /**
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    /**
     * @return the subLbrAmt
     */
    public Double getSubLbrAmt() {
        return subLbrAmt;
    }

    /**
     * @param subLbrAmt the subLbrAmt to set
     */
    public void setSubLbrAmt(Double subLbrAmt) {
        this.subLbrAmt = subLbrAmt;
    }

    /**
     * @return the subItemAmt
     */
    public Double getSubItemAmt() {
        return subItemAmt;
    }

    /**
     * @param subItemAmt the subItemAmt to set
     */
    public void setSubItemAmt(Double subItemAmt) {
        this.subItemAmt = subItemAmt;
    }

    /**
     * @return the dcAmt
     */
    public Double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the claimReqDt
     */
    public Date getClaimReqDt() {
        return claimReqDt;
    }

    /**
     * @param claimReqDt the claimReqDt to set
     */
    public void setClaimReqDt(Date claimReqDt) {
        this.claimReqDt = claimReqDt;
    }

    /**
     * @return the reqLbrAmt
     */
    public Double getReqLbrAmt() {
        return reqLbrAmt;
    }

    /**
     * @param reqLbrAmt the reqLbrAmt to set
     */
    public void setReqLbrAmt(Double reqLbrAmt) {
        this.reqLbrAmt = reqLbrAmt;
    }

    /**
     * @return the reqItemAmt
     */
    public Double getReqItemAmt() {
        return reqItemAmt;
    }

    /**
     * @param reqItemAmt the reqItemAmt to set
     */
    public void setReqItemAmt(Double reqItemAmt) {
        this.reqItemAmt = reqItemAmt;
    }

    /**
     * @return the reqVatAmt
     */
    public Double getReqVatAmt() {
        return reqVatAmt;
    }

    /**
     * @param reqVatAmt the reqVatAmt to set
     */
    public void setReqVatAmt(Double reqVatAmt) {
        this.reqVatAmt = reqVatAmt;
    }

    /**
     * @return the reqSubLbrAmt
     */
    public Double getReqSubLbrAmt() {
        return reqSubLbrAmt;
    }

    /**
     * @param reqSubLbrAmt the reqSubLbrAmt to set
     */
    public void setReqSubLbrAmt(Double reqSubLbrAmt) {
        this.reqSubLbrAmt = reqSubLbrAmt;
    }

    /**
     * @return the reqSubItemAmt
     */
    public Double getReqSubItemAmt() {
        return reqSubItemAmt;
    }

    /**
     * @param reqSubItemAmt the reqSubItemAmt to set
     */
    public void setReqSubItemAmt(Double reqSubItemAmt) {
        this.reqSubItemAmt = reqSubItemAmt;
    }

    /**
     * @return the claimConfirmDt
     */
    public Date getClaimConfirmDt() {
        return claimConfirmDt;
    }

    /**
     * @param claimConfirmDt the claimConfirmDt to set
     */
    public void setClaimConfirmDt(Date claimConfirmDt) {
        this.claimConfirmDt = claimConfirmDt;
    }

    /**
     * @return the comfirmLbrAmt
     */
    public Double getComfirmLbrAmt() {
        return comfirmLbrAmt;
    }

    /**
     * @param comfirmLbrAmt the comfirmLbrAmt to set
     */
    public void setComfirmLbrAmt(Double comfirmLbrAmt) {
        this.comfirmLbrAmt = comfirmLbrAmt;
    }

    /**
     * @return the comfirmLbrVatAmt
     */
    public Double getComfirmLbrVatAmt() {
        return comfirmLbrVatAmt;
    }

    /**
     * @param comfirmLbrVatAmt the comfirmLbrVatAmt to set
     */
    public void setComfirmLbrVatAmt(Double comfirmLbrVatAmt) {
        this.comfirmLbrVatAmt = comfirmLbrVatAmt;
    }

    /**
     * @return the comfirmItemAmt
     */
    public Double getComfirmItemAmt() {
        return comfirmItemAmt;
    }

    /**
     * @param comfirmItemAmt the comfirmItemAmt to set
     */
    public void setComfirmItemAmt(Double comfirmItemAmt) {
        this.comfirmItemAmt = comfirmItemAmt;
    }

    /**
     * @return the comfirmItemVatAmt
     */
    public Double getComfirmItemVatAmt() {
        return comfirmItemVatAmt;
    }

    /**
     * @param comfirmItemVatAmt the comfirmItemVatAmt to set
     */
    public void setComfirmItemVatAmt(Double comfirmItemVatAmt) {
        this.comfirmItemVatAmt = comfirmItemVatAmt;
    }

    /**
     * @return the comfirmSubLbrAmt
     */
    public Double getComfirmSubLbrAmt() {
        return comfirmSubLbrAmt;
    }

    /**
     * @param comfirmSubLbrAmt the comfirmSubLbrAmt to set
     */
    public void setComfirmSubLbrAmt(Double comfirmSubLbrAmt) {
        this.comfirmSubLbrAmt = comfirmSubLbrAmt;
    }

    /**
     * @return the comfirmSubItemAmt
     */
    public Double getComfirmSubItemAmt() {
        return comfirmSubItemAmt;
    }

    /**
     * @param comfirmSubItemAmt the comfirmSubItemAmt to set
     */
    public void setComfirmSubItemAmt(Double comfirmSubItemAmt) {
        this.comfirmSubItemAmt = comfirmSubItemAmt;
    }

    /**
     * @return the invcNo
     */
    public String getInvcNo() {
        return invcNo;
    }

    /**
     * @param invcNo the invcNo to set
     */
    public void setInvcNo(String invcNo) {
        this.invcNo = invcNo;
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
     * @return the asParWartDstinCd
     */
    public String getAsParWartDstinCd() {
        return asParWartDstinCd;
    }

    /**
     * @param asParWartDstinCd the asParWartDstinCd to set
     */
    public void setAsParWartDstinCd(String asParWartDstinCd) {
        this.asParWartDstinCd = asParWartDstinCd;
    }

    /**
     * @return the claimTcavNo
     */
    public String getClaimTcavNo() {
        return claimTcavNo;
    }

    /**
     * @param claimTcavNo the claimTcavNo to set
     */
    public void setClaimTcavNo(String claimTcavNo) {
        this.claimTcavNo = claimTcavNo;
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
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    /**
     * @return the claimApproveNo
     */
    public String getClaimApproveNo() {
        return claimApproveNo;
    }

    /**
     * @param claimApproveNo the claimApproveNo to set
     */
    public void setClaimApproveNo(String claimApproveNo) {
        this.claimApproveNo = claimApproveNo;
    }

    /**
     * @return the roDt
     */
    public Date getRoDt() {
        return roDt;
    }

    /**
     * @param roDt the roDt to set
     */
    public void setRoDt(Date roDt) {
        this.roDt = roDt;
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
     * @return the crudStatCd
     */
    public String getCrudStatCd() {
        return crudStatCd;
    }

    /**
     * @param crudStatCd the crudStatCd to set
     */
    public void setCrudStatCd(String crudStatCd) {
        this.crudStatCd = crudStatCd;
    }

    /**
     * @return the roStatCd
     */
    public String getRoStatCd() {
        return roStatCd;
    }

    /**
     * @param roStatCd the roStatCd to set
     */
    public void setRoStatCd(String roStatCd) {
        this.roStatCd = roStatCd;
    }

    /**
     * @return the dtc1UseYn
     */
    public String getDtc1UseYn() {
        return dtc1UseYn;
    }

    /**
     * @param dtc1UseYn the dtc1UseYn to set
     */
    public void setDtc1UseYn(String dtc1UseYn) {
        this.dtc1UseYn = dtc1UseYn;
    }

    /**
     * @return the dtc2UseYn
     */
    public String getDtc2UseYn() {
        return dtc2UseYn;
    }

    /**
     * @param dtc2UseYn the dtc2UseYn to set
     */
    public void setDtc2UseYn(String dtc2UseYn) {
        this.dtc2UseYn = dtc2UseYn;
    }

    /**
     * @return the dtc3UseYn
     */
    public String getDtc3UseYn() {
        return dtc3UseYn;
    }

    /**
     * @param dtc3UseYn the dtc3UseYn to set
     */
    public void setDtc3UseYn(String dtc3UseYn) {
        this.dtc3UseYn = dtc3UseYn;
    }

    /**
     * @return the dtc4UseYn
     */
    public String getDtc4UseYn() {
        return dtc4UseYn;
    }

    /**
     * @param dtc4UseYn the dtc4UseYn to set
     */
    public void setDtc4UseYn(String dtc4UseYn) {
        this.dtc4UseYn = dtc4UseYn;
    }

    /**
     * @return the dtc1Cd
     */
    public String getDtc1Cd() {
        return dtc1Cd;
    }

    /**
     * @param dtc1Cd the dtc1Cd to set
     */
    public void setDtc1Cd(String dtc1Cd) {
        this.dtc1Cd = dtc1Cd;
    }

    /**
     * @return the dtc2Cd
     */
    public String getDtc2Cd() {
        return dtc2Cd;
    }

    /**
     * @param dtc2Cd the dtc2Cd to set
     */
    public void setDtc2Cd(String dtc2Cd) {
        this.dtc2Cd = dtc2Cd;
    }

    /**
     * @return the dtc3Cd
     */
    public String getDtc3Cd() {
        return dtc3Cd;
    }

    /**
     * @param dtc3Cd the dtc3Cd to set
     */
    public void setDtc3Cd(String dtc3Cd) {
        this.dtc3Cd = dtc3Cd;
    }

    /**
     * @return the dtc4Cd
     */
    public String getDtc4Cd() {
        return dtc4Cd;
    }

    /**
     * @param dtc4Cd the dtc4Cd to set
     */
    public void setDtc4Cd(String dtc4Cd) {
        this.dtc4Cd = dtc4Cd;
    }

    /**
     * @return the pwaApproveNoYn
     */
    public String getPwaApproveNoYn() {
        return pwaApproveNoYn;
    }

    /**
     * @param pwaApproveNoYn the pwaApproveNoYn to set
     */
    public void setPwaApproveNoYn(String pwaApproveNoYn) {
        this.pwaApproveNoYn = pwaApproveNoYn;
    }

    /**
     * @return the claimTcavNoYn
     */
    public String getClaimTcavNoYn() {
        return claimTcavNoYn;
    }

    /**
     * @param claimTcavNoYn the claimTcavNoYn to set
     */
    public void setClaimTcavNoYn(String claimTcavNoYn) {
        this.claimTcavNoYn = claimTcavNoYn;
    }

    /**
     * @return the ifResltYn
     */
    public String getIfResltYn() {
        return ifResltYn;
    }

    /**
     * @param ifResltYn the ifResltYn to set
     */
    public void setIfResltYn(String ifResltYn) {
        this.ifResltYn = ifResltYn;
    }

    /**
     * @return the claimReqId
     */
    public String getClaimReqId() {
        return claimReqId;
    }

    /**
     * @param claimReqId the claimReqId to set
     */
    public void setClaimReqId(String claimReqId) {
        this.claimReqId = claimReqId;
    }

    /**
     * @return the claimReqNm
     */
    public String getClaimReqNm() {
        return claimReqNm;
    }

    /**
     * @param claimReqNm the claimReqNm to set
     */
    public void setClaimReqNm(String claimReqNm) {
        this.claimReqNm = claimReqNm;
    }

    /**
     * @return the wrtrNm
     */
    public String getWrtrNm() {
        return wrtrNm;
    }

    /**
     * @param wrtrNm the wrtrNm to set
     */
    public void setWrtrNm(String wrtrNm) {
        this.wrtrNm = wrtrNm;
    }

    public String getDstinCd() {
        return dstinCd;
    }

    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }



}
