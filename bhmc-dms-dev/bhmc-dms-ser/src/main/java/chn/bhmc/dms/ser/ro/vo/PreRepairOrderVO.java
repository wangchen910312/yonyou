package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderVO.java
 * @Description : RO마스터 VO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

public class PreRepairOrderVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2251377407572090894L;

    /**
     * PREFIX
     **/
    private String preFixId;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 이전RO문서번호
     **/
    private String preRoDocNo;

    /**
     * RO유형
     **/
    //RO_TP
    private String preRoTp;

    /**
     * RO상태코드
     **/
    //RO_STAT_CD
    private String preRoStatCd;

    /**
     * RO일자
     **/
    //RO_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preRoDt;

    /**
     * RO문서번호
     **/
    //RO_DOC_NO
    private String roDocNo;

    /**
     * RO그룹번호
     **/
    //RO_GRP_NO
    private String roGrpNo;

    /**
     * 예약문서번호
     **/
    //RESV_DOC_NO
    private String resvDocNo;

    /**
     * 차대번호
     **/
    //VIN_NO
    private String vinNo;

    /**
     * 차량등록번호
     **/
    //CAR_REG_NO
    private String carRegNo;

    /**
     * 엔진번호
     **/
    //ENGIN_NO
    private String enginNo;

    /**
     * 차량소유자ID
     **/
    //CAR_OWNER_ID
    private String carOwnerId;

    /**
     * 차량소유자명
     **/
    //CAR_OWNER_NM
    private String carOwnerNm;

    /**
     * 운전자ID
     **/
    //DRIVER_ID
    private String driverId;

    /**
     * 운전자명
     **/
    //DRIVER_NM
    private String driverNm;

    /**
     * 예약유형
     **/
    //RESV_TP
    private String resvTp;

    /**
     * 예약일자
     **/
    //RESV_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date resvDt;

    /**
     * 베이번호
     **/
    //BAY_NO
    private String bayNo;

    /**
     * TechManID
     **/
    //TEC_ID
    private String tecId;

    /**
     * TechMan명
     **/
    //TEC_NM
    private String tecNm;

    /**
     * SAID
     **/
    //SA_ID
    private String saId;

    /**
     * SA명
     **/
    //SA_NM
    private String saNm;

    /**
     * 작업예약일자
     **/
    //OPER_RESV_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date operResvDt;

    /**
     * 서비스예약시작일자
     **/
    //SER_RESV_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serResvStartDt;

    /**
     * 부품금액
     **/
    //PAR_AMT
    private Double parAmt;

    /**
     * 공임금액
     **/
    //LBR_AMT
    private Double lbrAmt;

    /**
     * 기타금액
     **/
    //ETC_AMT
    private Double etcAmt;

    /**
     * 할인금액
     **/
    //DC_AMT
    private Double dcAmt;

    /**
     * 합계금액
     **/
    //SUM_AMT
    private Double sumAmt;

    /**
     * 부가가치세금액
     **/
    //VAT_AMT
    private Double vatAmt;

    /**
     * 총금액
     **/
    //TOT_AMT
    private Double totAmt;

    /**
     * 예치금액
     **/
    //BAL_AMT
    private Double balAmt;

    /**
     * 취소사유코드
     **/
    //CANC_REASON_CD
    private String cancReasonCd;

    /**
     * 취소사유내용
     **/
    //CANC_REASON_CONT
    private String cancReasonCont;

    /**
     * 거리단위코드
     **/
    //DIST_UNIT_CD
    private String distUnitCd;

    /**
     * 주행거리값
     **/
    //RUN_DIST_VAL
    private int runDistVal;

    /**
     * 최종 주행거리값
     **/
    private int lastRunDistVal;

    /**
     * 진단문서번호
     **/
    //DIAG_DOC_NO
    private String diagDocNo;

    /**
     * 원RO번호
     **/
    //BASE_RO_NO
    private String baseRoNo;

    /**
     * 보험신청번호
     **/
    //INC_REQ_NO
    private String incReqNo;

    /**
     * 고객대기방법코드
     **/
    //CUST_WAIT_MTH_CD
    private String custWaitMthCd;

    /**
     * 고품처리유형
     **/
    //ATQ_PROC_TP
    private String atqProcTp;

    /**
     * 차량세차유형
     **/
    //CAR_WASH_TP
    private String carWashTp;

    /**
     * 차량시승요청유형
     **/
    //CAR_DRIVE_REQ_TP
    private String carDriveReqTp;

    /**
     * 예정인도일자
     **/
    //EXPC_DL_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcDlDt;

    /**
     * 고품처리여부
     **/
    private String atqProcYn;

    /**
     * 차량세차여부
     **/
    private String carWashYn;

    /**
     * 방문차량수령일자
     **/
    //VSIT_CAR_RECEIVE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitCarReceiveDt;

    /**
     * 방문차량수령연계인명
     **/
    //VSIT_CAR_RECEIVE_IF_NM
    private String vsitCarReceiveIfNm;

    /**
     * 방문차량수령연락처번호
     **/
    //VSIT_CAR_RECEIVE_CI_NO
    private String vsitCarReceiveCiNo;

    /**
     * 방문차량수령주소명
     **/
    //VSIT_CAR_RECEIVE_ADDR_NM
    private String vsitCarReceiveAddrNm;

    /**
     * 차량수령일자
     **/
    //CAR_RECEIVE_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carReceiveDt;

    /**
     * 방문인도연계인명
     **/
    //VSIT_DL_IF_NM
    private String vsitDlIfNm;

    /**
     * 방문인도연락처번호
     **/
    //VSIT_DL_CI_NO
    private String vsitDlCiNo;

    /**
     * 방문인도주소명
     **/
    //VSIT_DL_ADDR_NM
    private String vsitDlAddrNm;

    /**
     * 방문일자
     **/
    //VSIT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitDt;

    /**
     * 방문연계인명
     **/
    //VSIT_IF_NM
    private String vsitIfNm;

    /**
     * 방문연락처번호
     **/
    //VSIT_CI_NO
    private String vsitCiNo;

    /**
     * 방문주소명
     **/
    //VSIT_ADDR_NM
    private String vsitAddrNm;

    /**
     * 배정자ID
     **/
    //ALLOC_EMP_ID
    private String allocEmpId;

    /**
     * 서비스예약종료일자
     **/
    //SER_RESV_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serResvEndDt;

    /**
     * 보험신청일자
     **/
    //INC_REQ_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incReqDt;

    /**
     * 세차상태코드
     **/
    //CAR_WASH_STAT_CD
    private String carWashStatCd;

    /**
     * 페인트상태코드
     **/
    //PAINT_STAT_CD
    private String paintStatCd;

    /**
     * 품질검사상태코드
     **/
    //QT_TEST_STAT_CD
    private String qtTestStatCd;

    /**
     * 페인트수량
     **/
    //PAINT_QTY
    private int paintQty;

    /**
     * 페인트색상코드
     **/
    //PAINT_COLOR_CD
    private String paintColorCd;

    /**
     * 차량색상코드
     **/
    //CAR_COLOR_CD
    private String carColorCd;

    /**
     * 페인트유형
     **/
    //PAINT_TP
    private String paintTp;

    /**
     * RO시작일자
     **/
    //RO_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roStartDt;

    /**
     * RO종료일자
     **/
    //RO_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roEndDt;

    /**
     * RO비고
     **/
    //RO_REMARK
    private String roRemark;

    /**
     * 작업배정여부
     **/
    private String wrkAllocYn;

    /**
     * 품질검사방법코드
     **/
    //QT_TEST_MTH_CD
    private String qtTestMthCd;

    /**
     * 변경예정인도일자
     **/
    //CHG_EXPC_DL_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date chgExpcDlDt;

    /**
     * 원인코드1
     **/
    //CAU_CD1
    private String cauCd1;

    /**
     * 원인명1
     **/
    //CAU_NM1
    private String cauNm1;

    /**
     * 현상코드1
     **/
    //PHEN_CD1
    private String phenCd1;

    /**
     * 현상명1
     **/
    //PHEN_NM1
    private String phenNm1;

    /**
     * 원인코드2
     **/
    //CAU_CD2
    private String cauCd2;

    /**
     * 원인명2
     **/
    //CAU_NM2
    private String cauNm2;

    /**
     * 현상코드2
     **/
    //PHEN_CD2
    private String phenCd2;

    /**
     * 현상명2
     **/
    //PHEN_NM2
    private String phenNm2;

    /**
     * 품질검사시작일자
     **/
    //QT_TEST_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestStartDt;

    /**
     * 품질검사종료일자
     **/
    //QT_TEST_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestEndDt;

    /**
     * 품질검사담당자코드
     **/
    //QT_TEST_PRSN_CD
    private String qtTestPrsnCd;

    /**
     * 품질검사담당자명
     **/
    //QT_TEST_PRSN_NM
    private String qtTestPrsnNm;

    /**
     * 차량세차시작일자
     **/
    //CAR_WASH_START_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carWashStartDt;

    /**
     * 차량세차종료일자
     **/
    //CAR_WASH_END_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carWashEndDt;

    /**
     * 차량세차담당자코드
     **/
    //CAR_WASH_PRSN_CD
    private String carWashPrsnCd;

    /**
     * 차량세차담당자명
     **/
    //CAR_WASH_PRSN_NM
    private String carWashPrsnNm;

    /**
     * 도로검사코드
     **/
    //ROAD_TEST_CD
    private String roadTestCd;

    /**
     * 선수금금액
     **/
    //PRE_AMT
    private Double preAmt;

    /**
     * LTS MODEL CD
     */
    private String ltsModelCd;



    /**
     * 차종명
     */
    private String carlineNm;

    /**
     * 모델명
     */
    private String modelNm;

    private String regUsrNm;

    /**
     * RO 취소자
     */
    private String roCancNm;

    /**
     * RO 취소일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roCancDt;



    /**
     * @return the roCancNm
     */
    public String getRoCancNm() {
        return roCancNm;
    }

    /**
     * @param roCancNm the roCancNm to set
     */
    public void setRoCancNm(String roCancNm) {
        this.roCancNm = roCancNm;
    }

    /**
     * @return the roCancDt
     */
    public Date getRoCancDt() {
        return roCancDt;
    }

    /**
     * @param roCancDt the roCancDt to set
     */
    public void setRoCancDt(Date roCancDt) {
        this.roCancDt = roCancDt;
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
     * @return the preRoDocNo
     */
    public String getPreRoDocNo() {
        return preRoDocNo;
    }

    /**
     * @param preRoDocNo the preRoDocNo to set
     */
    public void setPreRoDocNo(String preRoDocNo) {
        this.preRoDocNo = preRoDocNo;
    }

    /**
     * @return the preRoTp
     */
    public String getPreRoTp() {
        return preRoTp;
    }

    /**
     * @param preRoTp the preRoTp to set
     */
    public void setPreRoTp(String preRoTp) {
        this.preRoTp = preRoTp;
    }

    /**
     * @return the preRoStatCd
     */
    public String getPreRoStatCd() {
        return preRoStatCd;
    }

    /**
     * @param preRoStatCd the preRoStatCd to set
     */
    public void setPreRoStatCd(String preRoStatCd) {
        this.preRoStatCd = preRoStatCd;
    }

    /**
     * @return the preRoDt
     */
    public Date getPreRoDt() {
        return preRoDt;
    }

    /**
     * @param preRoDt the preRoDt to set
     */
    public void setPreRoDt(Date preRoDt) {
        this.preRoDt = preRoDt;
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
     * @return the resvTp
     */
    public String getResvTp() {
        return resvTp;
    }

    /**
     * @param resvTp the resvTp to set
     */
    public void setResvTp(String resvTp) {
        this.resvTp = resvTp;
    }

    /**
     * @return the resvDt
     */
    public Date getResvDt() {
        return resvDt;
    }

    /**
     * @param resvDt the resvDt to set
     */
    public void setResvDt(Date resvDt) {
        this.resvDt = resvDt;
    }

    /**
     * @return the bayNo
     */
    public String getBayNo() {
        return bayNo;
    }

    /**
     * @param bayNo the bayNo to set
     */
    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
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
     * @return the operResvDt
     */
    public Date getOperResvDt() {
        return operResvDt;
    }

    /**
     * @param operResvDt the operResvDt to set
     */
    public void setOperResvDt(Date operResvDt) {
        this.operResvDt = operResvDt;
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
     * @return the parAmt
     */
    public Double getParAmt() {
        return parAmt;
    }

    /**
     * @param parAmt the parAmt to set
     */
    public void setParAmt(Double parAmt) {
        this.parAmt = parAmt;
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
     * @return the etcAmt
     */
    public Double getEtcAmt() {
        return etcAmt;
    }

    /**
     * @param etcAmt the etcAmt to set
     */
    public void setEtcAmt(Double etcAmt) {
        this.etcAmt = etcAmt;
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
     * @return the sumAmt
     */
    public Double getSumAmt() {
        return sumAmt;
    }

    /**
     * @param sumAmt the sumAmt to set
     */
    public void setSumAmt(Double sumAmt) {
        this.sumAmt = sumAmt;
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
     * @return the balAmt
     */
    public Double getBalAmt() {
        return balAmt;
    }

    /**
     * @param balAmt the balAmt to set
     */
    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    /**
     * @return the cancReasonCd
     */
    public String getCancReasonCd() {
        return cancReasonCd;
    }

    /**
     * @param cancReasonCd the cancReasonCd to set
     */
    public void setCancReasonCd(String cancReasonCd) {
        this.cancReasonCd = cancReasonCd;
    }

    /**
     * @return the cancReasonCont
     */
    public String getCancReasonCont() {
        return cancReasonCont;
    }

    /**
     * @param cancReasonCont the cancReasonCont to set
     */
    public void setCancReasonCont(String cancReasonCont) {
        this.cancReasonCont = cancReasonCont;
    }

    /**
     * @return the distUnitCd
     */
    public String getDistUnitCd() {
        return distUnitCd;
    }

    /**
     * @param distUnitCd the distUnitCd to set
     */
    public void setDistUnitCd(String distUnitCd) {
        this.distUnitCd = distUnitCd;
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
     * @return the lastRunDistVal
     */
    public int getLastRunDistVal() {
        return lastRunDistVal;
    }

    /**
     * @param lastRunDistVal the lastRunDistVal to set
     */
    public void setLastRunDistVal(int lastRunDistVal) {
        this.lastRunDistVal = lastRunDistVal;
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
     * @return the baseRoNo
     */
    public String getBaseRoNo() {
        return baseRoNo;
    }

    /**
     * @param baseRoNo the baseRoNo to set
     */
    public void setBaseRoNo(String baseRoNo) {
        this.baseRoNo = baseRoNo;
    }

    /**
     * @return the incReqNo
     */
    public String getIncReqNo() {
        return incReqNo;
    }

    /**
     * @param incReqNo the incReqNo to set
     */
    public void setIncReqNo(String incReqNo) {
        this.incReqNo = incReqNo;
    }

    /**
     * @return the custWaitMthCd
     */
    public String getCustWaitMthCd() {
        return custWaitMthCd;
    }

    /**
     * @param custWaitMthCd the custWaitMthCd to set
     */
    public void setCustWaitMthCd(String custWaitMthCd) {
        this.custWaitMthCd = custWaitMthCd;
    }

    /**
     * @return the atqProcTp
     */
    public String getAtqProcTp() {
        return atqProcTp;
    }

    /**
     * @param atqProcTp the atqProcTp to set
     */
    public void setAtqProcTp(String atqProcTp) {
        this.atqProcTp = atqProcTp;
    }

    /**
     * @return the carWashTp
     */
    public String getCarWashTp() {
        return carWashTp;
    }

    /**
     * @param carWashTp the carWashTp to set
     */
    public void setCarWashTp(String carWashTp) {
        this.carWashTp = carWashTp;
    }

    /**
     * @return the carDriveReqTp
     */
    public String getCarDriveReqTp() {
        return carDriveReqTp;
    }

    /**
     * @param carDriveReqTp the carDriveReqTp to set
     */
    public void setCarDriveReqTp(String carDriveReqTp) {
        this.carDriveReqTp = carDriveReqTp;
    }

    /**
     * @return the expcDlDt
     */
    public Date getExpcDlDt() {
        return expcDlDt;
    }

    /**
     * @param expcDlDt the expcDlDt to set
     */
    public void setExpcDlDt(Date expcDlDt) {
        this.expcDlDt = expcDlDt;
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
     * @return the carWashYn
     */
    public String getCarWashYn() {
        return carWashYn;
    }

    /**
     * @param carWashYn the carWashYn to set
     */
    public void setCarWashYn(String carWashYn) {
        this.carWashYn = carWashYn;
    }

    /**
     * @return the vsitCarReceiveDt
     */
    public Date getVsitCarReceiveDt() {
        return vsitCarReceiveDt;
    }

    /**
     * @param vsitCarReceiveDt the vsitCarReceiveDt to set
     */
    public void setVsitCarReceiveDt(Date vsitCarReceiveDt) {
        this.vsitCarReceiveDt = vsitCarReceiveDt;
    }

    /**
     * @return the vsitCarReceiveIfNm
     */
    public String getVsitCarReceiveIfNm() {
        return vsitCarReceiveIfNm;
    }

    /**
     * @param vsitCarReceiveIfNm the vsitCarReceiveIfNm to set
     */
    public void setVsitCarReceiveIfNm(String vsitCarReceiveIfNm) {
        this.vsitCarReceiveIfNm = vsitCarReceiveIfNm;
    }

    /**
     * @return the vsitCarReceiveCiNo
     */
    public String getVsitCarReceiveCiNo() {
        return vsitCarReceiveCiNo;
    }

    /**
     * @param vsitCarReceiveCiNo the vsitCarReceiveCiNo to set
     */
    public void setVsitCarReceiveCiNo(String vsitCarReceiveCiNo) {
        this.vsitCarReceiveCiNo = vsitCarReceiveCiNo;
    }

    /**
     * @return the vsitCarReceiveAddrNm
     */
    public String getVsitCarReceiveAddrNm() {
        return vsitCarReceiveAddrNm;
    }

    /**
     * @param vsitCarReceiveAddrNm the vsitCarReceiveAddrNm to set
     */
    public void setVsitCarReceiveAddrNm(String vsitCarReceiveAddrNm) {
        this.vsitCarReceiveAddrNm = vsitCarReceiveAddrNm;
    }

    /**
     * @return the carReceiveDt
     */
    public Date getCarReceiveDt() {
        return carReceiveDt;
    }

    /**
     * @param carReceiveDt the carReceiveDt to set
     */
    public void setCarReceiveDt(Date carReceiveDt) {
        this.carReceiveDt = carReceiveDt;
    }

    /**
     * @return the vsitDlIfNm
     */
    public String getVsitDlIfNm() {
        return vsitDlIfNm;
    }

    /**
     * @param vsitDlIfNm the vsitDlIfNm to set
     */
    public void setVsitDlIfNm(String vsitDlIfNm) {
        this.vsitDlIfNm = vsitDlIfNm;
    }

    /**
     * @return the vsitDlCiNo
     */
    public String getVsitDlCiNo() {
        return vsitDlCiNo;
    }

    /**
     * @param vsitDlCiNo the vsitDlCiNo to set
     */
    public void setVsitDlCiNo(String vsitDlCiNo) {
        this.vsitDlCiNo = vsitDlCiNo;
    }

    /**
     * @return the vsitDlAddrNm
     */
    public String getVsitDlAddrNm() {
        return vsitDlAddrNm;
    }

    /**
     * @param vsitDlAddrNm the vsitDlAddrNm to set
     */
    public void setVsitDlAddrNm(String vsitDlAddrNm) {
        this.vsitDlAddrNm = vsitDlAddrNm;
    }

    /**
     * @return the vsitDt
     */
    public Date getVsitDt() {
        return vsitDt;
    }

    /**
     * @param vsitDt the vsitDt to set
     */
    public void setVsitDt(Date vsitDt) {
        this.vsitDt = vsitDt;
    }

    /**
     * @return the vsitIfNm
     */
    public String getVsitIfNm() {
        return vsitIfNm;
    }

    /**
     * @param vsitIfNm the vsitIfNm to set
     */
    public void setVsitIfNm(String vsitIfNm) {
        this.vsitIfNm = vsitIfNm;
    }

    /**
     * @return the vsitCiNo
     */
    public String getVsitCiNo() {
        return vsitCiNo;
    }

    /**
     * @param vsitCiNo the vsitCiNo to set
     */
    public void setVsitCiNo(String vsitCiNo) {
        this.vsitCiNo = vsitCiNo;
    }

    /**
     * @return the vsitAddrNm
     */
    public String getVsitAddrNm() {
        return vsitAddrNm;
    }

    /**
     * @param vsitAddrNm the vsitAddrNm to set
     */
    public void setVsitAddrNm(String vsitAddrNm) {
        this.vsitAddrNm = vsitAddrNm;
    }

    /**
     * @return the allocEmpId
     */
    public String getAllocEmpId() {
        return allocEmpId;
    }

    /**
     * @param allocEmpId the allocEmpId to set
     */
    public void setAllocEmpId(String allocEmpId) {
        this.allocEmpId = allocEmpId;
    }

    /**
     * @return the serResvEndDt
     */
    public Date getSerResvEndDt() {
        return serResvEndDt;
    }

    /**
     * @param serResvEndDt the serResvEndDt to set
     */
    public void setSerResvEndDt(Date serResvEndDt) {
        this.serResvEndDt = serResvEndDt;
    }

    /**
     * @return the incReqDt
     */
    public Date getIncReqDt() {
        return incReqDt;
    }

    /**
     * @param incReqDt the incReqDt to set
     */
    public void setIncReqDt(Date incReqDt) {
        this.incReqDt = incReqDt;
    }

    /**
     * @return the carWashStatCd
     */
    public String getCarWashStatCd() {
        return carWashStatCd;
    }

    /**
     * @param carWashStatCd the carWashStatCd to set
     */
    public void setCarWashStatCd(String carWashStatCd) {
        this.carWashStatCd = carWashStatCd;
    }

    /**
     * @return the paintStatCd
     */
    public String getPaintStatCd() {
        return paintStatCd;
    }

    /**
     * @param paintStatCd the paintStatCd to set
     */
    public void setPaintStatCd(String paintStatCd) {
        this.paintStatCd = paintStatCd;
    }

    /**
     * @return the qtTestStatCd
     */
    public String getQtTestStatCd() {
        return qtTestStatCd;
    }

    /**
     * @param qtTestStatCd the qtTestStatCd to set
     */
    public void setQtTestStatCd(String qtTestStatCd) {
        this.qtTestStatCd = qtTestStatCd;
    }

    /**
     * @return the paintQty
     */
    public int getPaintQty() {
        return paintQty;
    }

    /**
     * @param paintQty the paintQty to set
     */
    public void setPaintQty(int paintQty) {
        this.paintQty = paintQty;
    }

    /**
     * @return the paintColorCd
     */
    public String getPaintColorCd() {
        return paintColorCd;
    }

    /**
     * @param paintColorCd the paintColorCd to set
     */
    public void setPaintColorCd(String paintColorCd) {
        this.paintColorCd = paintColorCd;
    }

    /**
     * @return the carColorCd
     */
    public String getCarColorCd() {
        return carColorCd;
    }

    /**
     * @param carColorCd the carColorCd to set
     */
    public void setCarColorCd(String carColorCd) {
        this.carColorCd = carColorCd;
    }

    /**
     * @return the paintTp
     */
    public String getPaintTp() {
        return paintTp;
    }

    /**
     * @param paintTp the paintTp to set
     */
    public void setPaintTp(String paintTp) {
        this.paintTp = paintTp;
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
     * @return the roRemark
     */
    public String getRoRemark() {
        return roRemark;
    }

    /**
     * @param roRemark the roRemark to set
     */
    public void setRoRemark(String roRemark) {
        this.roRemark = roRemark;
    }

    /**
     * @return the wrkAllocYn
     */
    public String getWrkAllocYn() {
        return wrkAllocYn;
    }

    /**
     * @param wrkAllocYn the wrkAllocYn to set
     */
    public void setWrkAllocYn(String wrkAllocYn) {
        this.wrkAllocYn = wrkAllocYn;
    }

    /**
     * @return the qtTestMthCd
     */
    public String getQtTestMthCd() {
        return qtTestMthCd;
    }

    /**
     * @param qtTestMthCd the qtTestMthCd to set
     */
    public void setQtTestMthCd(String qtTestMthCd) {
        this.qtTestMthCd = qtTestMthCd;
    }

    /**
     * @return the chgExpcDlDt
     */
    public Date getChgExpcDlDt() {
        return chgExpcDlDt;
    }

    /**
     * @param chgExpcDlDt the chgExpcDlDt to set
     */
    public void setChgExpcDlDt(Date chgExpcDlDt) {
        this.chgExpcDlDt = chgExpcDlDt;
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
     * @return the qtTestStartDt
     */
    public Date getQtTestStartDt() {
        return qtTestStartDt;
    }

    /**
     * @param qtTestStartDt the qtTestStartDt to set
     */
    public void setQtTestStartDt(Date qtTestStartDt) {
        this.qtTestStartDt = qtTestStartDt;
    }

    /**
     * @return the qtTestEndDt
     */
    public Date getQtTestEndDt() {
        return qtTestEndDt;
    }

    /**
     * @param qtTestEndDt the qtTestEndDt to set
     */
    public void setQtTestEndDt(Date qtTestEndDt) {
        this.qtTestEndDt = qtTestEndDt;
    }

    /**
     * @return the qtTestPrsnCd
     */
    public String getQtTestPrsnCd() {
        return qtTestPrsnCd;
    }

    /**
     * @param qtTestPrsnCd the qtTestPrsnCd to set
     */
    public void setQtTestPrsnCd(String qtTestPrsnCd) {
        this.qtTestPrsnCd = qtTestPrsnCd;
    }

    /**
     * @return the qtTestPrsnNm
     */
    public String getQtTestPrsnNm() {
        return qtTestPrsnNm;
    }

    /**
     * @param qtTestPrsnNm the qtTestPrsnNm to set
     */
    public void setQtTestPrsnNm(String qtTestPrsnNm) {
        this.qtTestPrsnNm = qtTestPrsnNm;
    }

    /**
     * @return the carWashStartDt
     */
    public Date getCarWashStartDt() {
        return carWashStartDt;
    }

    /**
     * @param carWashStartDt the carWashStartDt to set
     */
    public void setCarWashStartDt(Date carWashStartDt) {
        this.carWashStartDt = carWashStartDt;
    }

    /**
     * @return the carWashEndDt
     */
    public Date getCarWashEndDt() {
        return carWashEndDt;
    }

    /**
     * @param carWashEndDt the carWashEndDt to set
     */
    public void setCarWashEndDt(Date carWashEndDt) {
        this.carWashEndDt = carWashEndDt;
    }

    /**
     * @return the carWashPrsnCd
     */
    public String getCarWashPrsnCd() {
        return carWashPrsnCd;
    }

    /**
     * @param carWashPrsnCd the carWashPrsnCd to set
     */
    public void setCarWashPrsnCd(String carWashPrsnCd) {
        this.carWashPrsnCd = carWashPrsnCd;
    }

    /**
     * @return the carWashPrsnNm
     */
    public String getCarWashPrsnNm() {
        return carWashPrsnNm;
    }

    /**
     * @param carWashPrsnNm the carWashPrsnNm to set
     */
    public void setCarWashPrsnNm(String carWashPrsnNm) {
        this.carWashPrsnNm = carWashPrsnNm;
    }

    /**
     * @return the roadTestCd
     */
    public String getRoadTestCd() {
        return roadTestCd;
    }

    /**
     * @param roadTestCd the roadTestCd to set
     */
    public void setRoadTestCd(String roadTestCd) {
        this.roadTestCd = roadTestCd;
    }

    /**
     * @return the preAmt
     */
    public Double getPreAmt() {
        return preAmt;
    }

    /**
     * @param preAmt the preAmt to set
     */
    public void setPreAmt(Double preAmt) {
        this.preAmt = preAmt;
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



}