package chn.bhmc.dms.ser.ro.vo;

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
 * @ClassName: CarCheckVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author KyungMok Kim
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since author description
 * ===================================================
 * 2016. 5. 25. KyungMok Kim 최초 생성
 * </pre>
 */

public class CarCheckVO extends BaseVO{



  /**
   * Statements
   * (long)serialVersionUID
   */
    private static final long serialVersionUID = -2375143975106445249L;

    /**
     * PREFIX
     **/
    private String preFixId;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 차량점검문서번호
     **/
    @NotEmpty
    private String carChkDocNo;

    /**
     * 예약문서번호
     **/
    private String resvDocNo;

    /**
     * RO그룹번호
     **/
    private String roGrpNo;

    /**
     * RO문서번호
     **/
    private String roDocNo;

    /**
     * RO유형
     **/
    private String roTp;

    /**
     * 점검유형
     **/
    private String chkTp;

    /**
     * 차량소유자ID
     **/
    private String carOwnerId;

    /**
     * 차량소유자명
     **/
    private String carOwnerNm;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

    /**
     * 휴대폰번호
     **/
    private String hpNo;

    /**
     * 차대번호
     **/
    private String vinNo;

    private String enginNo;

    private String ltsModelCd;

    /**
     * 차종유형
     **/
    private String carlineTp;

    /**
     * 운전자ID
     **/
    private String driverId;

    /**
     * 운전자명
     **/
    private String driverNm;

    /**
     * 점검종합의견내용
     **/
    private String chkTotOpnCont;

    /**
     * 점검의견내용
     **/
    private String chkOpnCont;

    /**
     * SAID
     **/
    private String saId;

    /**
     * SA명
     **/
    private String saNm;

    /**
     * RO완료여부
     **/
    private String roEndYn;

    /**
     * 고품처리여부
     **/
    private String atqProcYn;

    /**
     * 세차여부
     **/
    private String washYn;

    /**
     * 서비스표기여부
     **/
    private String serWrtYn;

    /**
     * 자체정의항목여부
     */
    private String selfDefAtcYn;

    /**
     * 비고
     **/
    private String custRemark;

    /**
     * 차량점검비고
     **/
    private String carChkRemark;

    /**
     * 원인코드1
     */
    private String cauCd1;
    /**
     * 원인코드명1
     */
    private String cauNm1;
    /**
     * 현상코드1
     */
    private String phenCd1;
    /**
     * 현상코드1
     */
    private String phenNm1;
    /**
     * 원인코드2
     */
    private String cauCd2;
    /**
     * 원인코드명2
     */
    private String cauNm2;
    /**
     * 현상코드2
     */
    private String phenCd2;
    /**
     * 현상코드2
     */
    private String phenNm2;
    /**
     * 점검인코드
     */
    private String carChkEmpCd;
    /**
     * 점검인명칭
     */
    private String carChkEmpNm;

    private String regUsrNm;

    /**
     * 차량점검상태
     */
    private String carChkStatCd;

    /**
     * 차량점검취소일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carChkCancDt;

    /**
     * 차량점검취소자 ID
     */
    private String carChkCancPrsnId;

    /**
     * 차량점검취소자
     */
    private String carChkCancPrsnNm;

    /**
     * 차량점검취소사유코드
     */
    private String carChkCancReasonCd;

    /**
     * 차량점검취소사유내용
     */
    private String carChkCancReasonCont;

    private String carlineNm;
    private String modelNm;
    private int preRunDistVal;
    private int carRunDistVal;
    private String carChkStatNm;
    private String chkTpNm;
    private String carChkPrintDt;
    private String updtUsrNm;
    private String carChkStartDt;
    private String carChkCmptDt;
    private String roTpNm;
    private String roDt;
    private String roRegUsrNm;


    /**
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }
    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }
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
     * @return the carChkDocNo
     */
    public String getCarChkDocNo() {
        return carChkDocNo;
    }
    /**
     * @param carChkDocNo the carChkDocNo to set
     */
    public void setCarChkDocNo(String carChkDocNo) {
        this.carChkDocNo = carChkDocNo;
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
     * @return the chkTp
     */
    public String getChkTp() {
        return chkTp;
    }
    /**
     * @param chkTp the chkTp to set
     */
    public void setChkTp(String chkTp) {
        this.chkTp = chkTp;
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
     * @return the carlineTp
     */
    public String getCarlineTp() {
        return carlineTp;
    }
    /**
     * @param carlineTp the carlineTp to set
     */
    public void setCarlineTp(String carlineTp) {
        this.carlineTp = carlineTp;
    }
    /**
     * @return the driverId
     */
    public String getDriverId() {
        return driverId;
    }
    /**
     * @param driverId the driverId to set
     */
    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }
    /**
     * @return the driverNm
     */
    public String getDriverNm() {
        return driverNm;
    }
    /**
     * @param driverNm the driverNm to set
     */
    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
    }
    /**
     * @return the chkTotOpnCont
     */
    public String getChkTotOpnCont() {
        return chkTotOpnCont;
    }
    /**
     * @param chkTotOpnCont the chkTotOpnCont to set
     */
    public void setChkTotOpnCont(String chkTotOpnCont) {
        this.chkTotOpnCont = chkTotOpnCont;
    }
    /**
     * @return the chkOpnCont
     */
    public String getChkOpnCont() {
        return chkOpnCont;
    }
    /**
     * @param chkOpnCont the chkOpnCont to set
     */
    public void setChkOpnCont(String chkOpnCont) {
        this.chkOpnCont = chkOpnCont;
    }
    /**
     * @return the saId
     */
    public String getSaId() {
        return saId;
    }
    /**
     * @param saId the saId to set
     */
    public void setSaId(String saId) {
        this.saId = saId;
    }
    /**
     * @return the saNm
     */
    public String getSaNm() {
        return saNm;
    }
    /**
     * @param saNm the saNm to set
     */
    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }
    /**
     * @return the roEndYn
     */
    public String getRoEndYn() {
        return roEndYn;
    }
    /**
     * @param roEndYn the roEndYn to set
     */
    public void setRoEndYn(String roEndYn) {
        this.roEndYn = roEndYn;
    }
    /**
     * @return the atqProcYn
     */
    public String getAtqProcYn() {
        return atqProcYn;
    }
    /**
     * @param atqProcYn the atqProcYn to set
     */
    public void setAtqProcYn(String atqProcYn) {
        this.atqProcYn = atqProcYn;
    }
    /**
     * @return the washYn
     */
    public String getWashYn() {
        return washYn;
    }
    /**
     * @param washYn the washYn to set
     */
    public void setWashYn(String washYn) {
        this.washYn = washYn;
    }
    /**
     * @return the serWrtYn
     */
    public String getSerWrtYn() {
        return serWrtYn;
    }
    /**
     * @param serWrtYn the serWrtYn to set
     */
    public void setSerWrtYn(String serWrtYn) {
        this.serWrtYn = serWrtYn;
    }
    /**
     * @return the selfDefAtcYn
     */
    public String getSelfDefAtcYn() {
        return selfDefAtcYn;
    }
    /**
     * @param selfDefAtcYn the selfDefAtcYn to set
     */
    public void setSelfDefAtcYn(String selfDefAtcYn) {
        this.selfDefAtcYn = selfDefAtcYn;
    }
    /**
     * @return the custRemark
     */
    public String getCustRemark() {
        return custRemark;
    }
    /**
     * @param custRemark the custRemark to set
     */
    public void setCustRemark(String custRemark) {
        this.custRemark = custRemark;
    }
    /**
     * @return the carChkRemark
     */
    public String getCarChkRemark() {
        return carChkRemark;
    }
    /**
     * @param carChkRemark the carChkRemark to set
     */
    public void setCarChkRemark(String carChkRemark) {
        this.carChkRemark = carChkRemark;
    }
    /**
     * @return the cauCd1
     */
    public String getCauCd1() {
        return cauCd1;
    }
    /**
     * @param cauCd1 the cauCd1 to set
     */
    public void setCauCd1(String cauCd1) {
        this.cauCd1 = cauCd1;
    }
    /**
     * @return the cauNm1
     */
    public String getCauNm1() {
        return cauNm1;
    }
    /**
     * @param cauNm1 the cauNm1 to set
     */
    public void setCauNm1(String cauNm1) {
        this.cauNm1 = cauNm1;
    }
    /**
     * @return the phenCd1
     */
    public String getPhenCd1() {
        return phenCd1;
    }
    /**
     * @param phenCd1 the phenCd1 to set
     */
    public void setPhenCd1(String phenCd1) {
        this.phenCd1 = phenCd1;
    }
    /**
     * @return the phenNm1
     */
    public String getPhenNm1() {
        return phenNm1;
    }
    /**
     * @param phenNm1 the phenNm1 to set
     */
    public void setPhenNm1(String phenNm1) {
        this.phenNm1 = phenNm1;
    }
    /**
     * @return the cauCd2
     */
    public String getCauCd2() {
        return cauCd2;
    }
    /**
     * @param cauCd2 the cauCd2 to set
     */
    public void setCauCd2(String cauCd2) {
        this.cauCd2 = cauCd2;
    }
    /**
     * @return the cauNm2
     */
    public String getCauNm2() {
        return cauNm2;
    }
    /**
     * @param cauNm2 the cauNm2 to set
     */
    public void setCauNm2(String cauNm2) {
        this.cauNm2 = cauNm2;
    }
    /**
     * @return the phenCd2
     */
    public String getPhenCd2() {
        return phenCd2;
    }
    /**
     * @param phenCd2 the phenCd2 to set
     */
    public void setPhenCd2(String phenCd2) {
        this.phenCd2 = phenCd2;
    }
    /**
     * @return the phenNm2
     */
    public String getPhenNm2() {
        return phenNm2;
    }
    /**
     * @param phenNm2 the phenNm2 to set
     */
    public void setPhenNm2(String phenNm2) {
        this.phenNm2 = phenNm2;
    }
    /**
     * @return the carChkEmpCd
     */
    public String getCarChkEmpCd() {
        return carChkEmpCd;
    }
    /**
     * @param carChkEmpCd the carChkEmpCd to set
     */
    public void setCarChkEmpCd(String carChkEmpCd) {
        this.carChkEmpCd = carChkEmpCd;
    }
    /**
     * @return the carChkEmpNm
     */
    public String getCarChkEmpNm() {
        return carChkEmpNm;
    }
    /**
     * @param carChkEmpNm the carChkEmpNm to set
     */
    public void setCarChkEmpNm(String carChkEmpNm) {
        this.carChkEmpNm = carChkEmpNm;
    }
    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }
    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }
    /**
     * @return the carChkStatCd
     */
    public String getCarChkStatCd() {
        return carChkStatCd;
    }
    /**
     * @param carChkStatCd the carChkStatCd to set
     */
    public void setCarChkStatCd(String carChkStatCd) {
        this.carChkStatCd = carChkStatCd;
    }
    /**
     * @return the carChkCancDt
     */
    public Date getCarChkCancDt() {
        return carChkCancDt;
    }
    /**
     * @param carChkCancDt the carChkCancDt to set
     */
    public void setCarChkCancDt(Date carChkCancDt) {
        this.carChkCancDt = carChkCancDt;
    }
    /**
     * @return the carChkCancPrsnId
     */
    public String getCarChkCancPrsnId() {
        return carChkCancPrsnId;
    }
    /**
     * @param carChkCancPrsnId the carChkCancPrsnId to set
     */
    public void setCarChkCancPrsnId(String carChkCancPrsnId) {
        this.carChkCancPrsnId = carChkCancPrsnId;
    }
    /**
     * @return the carChkCancPrsnNm
     */
    public String getCarChkCancPrsnNm() {
        return carChkCancPrsnNm;
    }
    /**
     * @param carChkCancPrsnNm the carChkCancPrsnNm to set
     */
    public void setCarChkCancPrsnNm(String carChkCancPrsnNm) {
        this.carChkCancPrsnNm = carChkCancPrsnNm;
    }
    /**
     * @return the carChkCancReasonCd
     */
    public String getCarChkCancReasonCd() {
        return carChkCancReasonCd;
    }
    /**
     * @param carChkCancReasonCd the carChkCancReasonCd to set
     */
    public void setCarChkCancReasonCd(String carChkCancReasonCd) {
        this.carChkCancReasonCd = carChkCancReasonCd;
    }
    /**
     * @return the carChkCancReasonCont
     */
    public String getCarChkCancReasonCont() {
        return carChkCancReasonCont;
    }
    /**
     * @param carChkCancReasonCont the carChkCancReasonCont to set
     */
    public void setCarChkCancReasonCont(String carChkCancReasonCont) {
        this.carChkCancReasonCont = carChkCancReasonCont;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the preRunDistVal
     */
    public int getPreRunDistVal() {
        return preRunDistVal;
    }
    /**
     * @param preRunDistVal the preRunDistVal to set
     */
    public void setPreRunDistVal(int preRunDistVal) {
        this.preRunDistVal = preRunDistVal;
    }
    /**
     * @return the lastRunDistVal
     */
    public int getCarRunDistVal() {
        return carRunDistVal;
    }
    /**
     * @param lastRunDistVal the lastRunDistVal to set
     */
    public void setCarRunDistVal(int carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }
    /**
     * @return the carChkStatNm
     */
    public String getCarChkStatNm() {
        return carChkStatNm;
    }
    /**
     * @param carChkStatNm the carChkStatNm to set
     */
    public void setCarChkStatNm(String carChkStatNm) {
        this.carChkStatNm = carChkStatNm;
    }
    /**
     * @return the chkTpNm
     */
    public String getChkTpNm() {
        return chkTpNm;
    }
    /**
     * @param chkTpNm the chkTpNm to set
     */
    public void setChkTpNm(String chkTpNm) {
        this.chkTpNm = chkTpNm;
    }
    /**
     * @return the carChkPrintDt
     */
    public String getCarChkPrintDt() {
        return carChkPrintDt;
    }
    /**
     * @param carChkPrintDt the carChkPrintDt to set
     */
    public void setCarChkPrintDt(String carChkPrintDt) {
        this.carChkPrintDt = carChkPrintDt;
    }
    /**
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }
    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }
    /**
     * @return the carChkStartDt
     */
    public String getCarChkStartDt() {
        return carChkStartDt;
    }
    /**
     * @param carChkStartDt the carChkStartDt to set
     */
    public void setCarChkStartDt(String carChkStartDt) {
        this.carChkStartDt = carChkStartDt;
    }
    /**
     * @return the carChkCmptDt
     */
    public String getCarChkCmptDt() {
        return carChkCmptDt;
    }
    /**
     * @param carChkCmptDt the carChkCmptDt to set
     */
    public void setCarChkCmptDt(String carChkCmptDt) {
        this.carChkCmptDt = carChkCmptDt;
    }
    /**
     * @return the roTpNm
     */
    public String getRoTpNm() {
        return roTpNm;
    }
    /**
     * @param roTpNm the roTpNm to set
     */
    public void setRoTpNm(String roTpNm) {
        this.roTpNm = roTpNm;
    }
    /**
     * @return the roDt
     */
    public String getRoDt() {
        return roDt;
    }
    /**
     * @param roDt the roDt to set
     */
    public void setRoDt(String roDt) {
        this.roDt = roDt;
    }
    /**
     * @return the roRegUsrNm
     */
    public String getRoRegUsrNm() {
        return roRegUsrNm;
    }
    /**
     * @param roRegUsrNm the roRegUsrNm to set
     */
    public void setRoRegUsrNm(String roRegUsrNm) {
        this.roRegUsrNm = roRegUsrNm;
    }


}
