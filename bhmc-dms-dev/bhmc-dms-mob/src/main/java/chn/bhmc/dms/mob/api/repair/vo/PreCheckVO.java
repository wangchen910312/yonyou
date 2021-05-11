package chn.bhmc.dms.mob.api.repair.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName: PreCheckVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * since author description
 * ===================================================
 * 2016. 3. 28. Kwon Ki Hyun 최초 생성
 * </pre>
 */

public class PreCheckVO extends BaseVO{



  /**
   * Statements
   * (long)serialVersionUID
   */
    private static final long serialVersionUID = -2375143456488245249L;


    /**
     * PREFIX
     **/
    private String preFixId;

    /**
     * CAR ID
     */
    private String carId;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 진단문서번호
     **/
    private String diagDocNo;

    /**
     * 예약문서번호
     **/
    private String resvDocNo;

    /**
     * 서비스예약시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serResvStartDt;

    /**
     * TecManID
     **/
    private String tecId;

    /**
     * TecMan명
     **/
    private String tecNm;

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

    /**
     * 차종유형
     **/
    private String carlineTp;

    /**
     * 주행거리값
     **/
    private int runDistVal;

    /**
     * 점검종합의견내용
     **/
    private String chkTotOpnCont;

    /**
     * 비고
     **/
    private String remark;

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
     * 운전자ID
     **/
    private String driverId;

    /**
     * 운전자명
     **/
    private String driverNm;

    /**
     * 고객의견내용
     **/
    private String custRemark;

    /**
     * 사전점검일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkDt;

    /**
     * 사전점검 종료 일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkEndDt;

    /**
     * 차량접수일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carAcceptDt;

    /**
     * RO그룹번호
     */
    private String roGrpNo;

    /**
     * CHK_OPN_CONT
     **/
    private String chkOpnCont;

    /**
     * 엔진번호
     */
    private String enginNo;

    /**
     * LTS MODEL CD
     */
    private String ltsModelCd;

    /**
     * 입고점검유형
     */
    private String carAcptTp;

    /**
     * 입고점검유형명
     */
    private String carAcptTpNm;

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
     * 이미지좌표내용
     */
    private String imgCrdnCont;

    /**
     * 파일키명
     */
    private String fileKeyNm;

    /**
     * 파일키명2(CarBodyImage)
     */
    private String fileKeyNm2;

    /**
     * 파일키명3(signImage)
     */
    private String fileKeyNm3;


    /**
     * 엔진룸 기타 내용
     */
    private String enginRoomEtcCont;

    /**
     * 사전전검상태코드
     */
    private String diagStatCd;

    /**
     * 사전전검상태코드명
     */
    private String diagStatCdNm;

    private String updtUsrNm;

    /**
     * 차종명
     */
    private String carlineNm;

    /**
     * 모델명
     */
    private String modelNm;

    private int carRunDistVal;

    private String regUsrNm;

    private String useYn;

    private String preChkCol;

    /**
     * 사전점검인쇄시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkPrintDt;

    /**
     * 사전점검취소시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkCancDt;
    /**
     * 사전점검취소자ID
     */
    private String preChkCancPrsnId;

    /**
     * 사전점검취소자명
     */
    private String preChkCancPrsnNm;

    /**
     * 사전점검취소코드
     */
    private String preChkCancReasonCd;

    /**
     * 사전점검취소코드명
     */
    private String preChkCancReasonCdNm;

    /**
     * 사전점검취소내용
     */
    private String preChkCancReasonCont;


    private String printYn;

    /**
     * 칸반 그룹번호
     */
    private String grpNo;

    /**
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }
    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
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
     * @return the carRunDistVal
     */
    public int getCarRunDistVal() {
        return carRunDistVal;
    }
    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(int carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }
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
     * @return the diagDocNo
     */
    public String getDiagDocNo() {
        return diagDocNo;
    }
    /**
     * @param diagDocNo the diagDocNo to set
     */
    public void setDiagDocNo(String diagDocNo) {
        this.diagDocNo = diagDocNo;
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
     * @return the serResvStartDt
     */
    public Date getSerResvStartDt() {
        return serResvStartDt;
    }
    /**
     * @param serResvStartDt the serResvStartDt to set
     */
    public void setSerResvStartDt(Date serResvStartDt) {
        this.serResvStartDt = serResvStartDt;
    }
    /**
     * @return the tecId
     */
    public String getTecId() {
        return tecId;
    }
    /**
     * @param tecId the tecId to set
     */
    public void setTecId(String tecId) {
        this.tecId = tecId;
    }
    /**
     * @return the tecNm
     */
    public String getTecNm() {
        return tecNm;
    }
    /**
     * @param tecNm the tecNm to set
     */
    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
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
     * @return the preChkDt
     */
    public Date getPreChkDt() {
        return preChkDt;
    }
    /**
     * @param preChkDt the preChkDt to set
     */
    public void setPreChkDt(Date preChkDt) {
        this.preChkDt = preChkDt;
    }
    /**
     * @return the preChkEndDt
     */
    public Date getPreChkEndDt() {
        return preChkEndDt;
    }
    /**
     * @param preChkEndDt the preChkEndDt to set
     */
    public void setPreChkEndDt(Date preChkEndDt) {
        this.preChkEndDt = preChkEndDt;
    }
    /**
     * @return the carAcceptDt
     */
    public Date getCarAcceptDt() {
        return carAcceptDt;
    }
    /**
     * @param carAcceptDt the carAcceptDt to set
     */
    public void setCarAcceptDt(Date carAcceptDt) {
        this.carAcceptDt = carAcceptDt;
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
     * @return the enginRoomEtcCont
     */
    public String getEnginRoomEtcCont() {
        return enginRoomEtcCont;
    }
    /**
     * @param enginRoomEtcCont the enginRoomEtcCont to set
     */
    public void setEnginRoomEtcCont(String enginRoomEtcCont) {
        this.enginRoomEtcCont = enginRoomEtcCont;
    }
    /**
     * @return the carAcptTp
     */
    public String getCarAcptTp() {
        return carAcptTp;
    }
    /**
     * @param carAcptTp the carAcptTp to set
     */
    public void setCarAcptTp(String carAcptTp) {
        this.carAcptTp = carAcptTp;
    }
    /**
     * @return the carAcptTpNm
     */
    public String getCarAcptTpNm() {
        return carAcptTpNm;
    }
    /**
     * @param carAcptTpNm the carAcptTpNm to set
     */
    public void setCarAcptTpNm(String carAcptTpNm) {
        this.carAcptTpNm = carAcptTpNm;
    }
    /**
     * @return the imgCrdnCont
     */
    public String getImgCrdnCont() {
        return imgCrdnCont;
    }
    /**
     * @param imgCrdnCont the imgCrdnCont to set
     */
    public void setImgCrdnCont(String imgCrdnCont) {
        this.imgCrdnCont = imgCrdnCont;
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
     * @param fileKeyNm2 the fileKeyNm2 to set
     */
    public void setFileKeyNm2(String fileKeyNm2) {
        this.fileKeyNm2 = fileKeyNm2;
    }
    /**
     * @return the fileKeyNm2
     */
    public String getFileKeyNm2() {
        return fileKeyNm2;
    }
    /**
     * @return the diagStatCd
     */
    public String getDiagStatCd() {
        return diagStatCd;
    }
    /**
     * @param diagStatCd the diagStatCd to set
     */
    public void setDiagStatCd(String diagStatCd) {
        this.diagStatCd = diagStatCd;
    }
    /**
     * @return the diagStatCdNm
     */
    public String getDiagStatCdNm() {
        return diagStatCdNm;
    }
    /**
     * @param diagStatCdNm the diagStatCdNm to set
     */
    public void setDiagStatCdNm(String diagStatCdNm) {
        this.diagStatCdNm = diagStatCdNm;
    }
    /**
     * @param fileKeyNm3 the fileKeyNm3 to set
     */
    public void setFileKeyNm3(String fileKeyNm3) {
        this.fileKeyNm3 = fileKeyNm3;
    }
    /**
     * @return the fileKeyNm3
     */
    public String getFileKeyNm3() {
        return fileKeyNm3;
    }
    public String getUseYn() {
        return useYn;
    }
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the preChkPrintDt
     */
    public Date getPreChkPrintDt() {
        return preChkPrintDt;
    }
    /**
     * @param preChkPrintDt the preChkPrintDt to set
     */
    public void setPreChkPrintDt(Date preChkPrintDt) {
        this.preChkPrintDt = preChkPrintDt;
    }
    /**
     * @return the preChkCancDt
     */
    public Date getPreChkCancDt() {
        return preChkCancDt;
    }
    /**
     * @param preChkCancDt the preChkCancDt to set
     */
    public void setPreChkCancDt(Date preChkCancDt) {
        this.preChkCancDt = preChkCancDt;
    }
    /**
     * @return the preChkCancPrsnId
     */
    public String getPreChkCancPrsnId() {
        return preChkCancPrsnId;
    }
    /**
     * @param preChkCancPrsnId the preChkCancPrsnId to set
     */
    public void setPreChkCancPrsnId(String preChkCancPrsnId) {
        this.preChkCancPrsnId = preChkCancPrsnId;
    }
    /**
     * @return the preChkCancPrsnNm
     */
    public String getPreChkCancPrsnNm() {
        return preChkCancPrsnNm;
    }
    /**
     * @param preChkCancPrsnNm the preChkCancPrsnNm to set
     */
    public void setPreChkCancPrsnNm(String preChkCancPrsnNm) {
        this.preChkCancPrsnNm = preChkCancPrsnNm;
    }
    /**
     * @return the preChkCancReasonCd
     */
    public String getPreChkCancReasonCd() {
        return preChkCancReasonCd;
    }
    /**
     * @param preChkCancReasonCd the preChkCancReasonCd to set
     */
    public void setPreChkCancReasonCd(String preChkCancReasonCd) {
        this.preChkCancReasonCd = preChkCancReasonCd;
    }
    /**
     * @return the preChkCancReasonCdNm
     */
    public String getPreChkCancReasonCdNm() {
        return preChkCancReasonCdNm;
    }
    /**
     * @param preChkCancReasonCdNm the preChkCancReasonCdNm to set
     */
    public void setPreChkCancReasonCdNm(String preChkCancReasonCdNm) {
        this.preChkCancReasonCdNm = preChkCancReasonCdNm;
    }
    /**
     * @return the preChkCancReasonCont
     */
    public String getPreChkCancReasonCont() {
        return preChkCancReasonCont;
    }
    /**
     * @param preChkCancReasonCont the preChkCancReasonCont to set
     */
    public void setPreChkCancReasonCont(String preChkCancReasonCont) {
        this.preChkCancReasonCont = preChkCancReasonCont;
    }

    public String getPreChkCol() {
        return preChkCol;
    }
    public void setPreChkCol(String preChkCol) {
        this.preChkCol = preChkCol;
    }
    /**
     * @return the printYn
     */
    public String getPrintYn() {
        return printYn;
    }
    /**
     * @param printYn the printYn to set
     */
    public void setPrintYn(String printYn) {
        this.printYn = printYn;
    }
    public String getGrpNo() {
        return grpNo;
    }
    public void setGrpNo(String grpNo) {
        this.grpNo = grpNo;
    }

}
