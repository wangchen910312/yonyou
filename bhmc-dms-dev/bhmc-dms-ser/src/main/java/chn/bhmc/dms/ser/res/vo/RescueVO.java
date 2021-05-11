 package chn.bhmc.dms.ser.res.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RescueVO.java
 * @Description : 구원 서비스 마스터 VO
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.    YIN XUEYUAN     최초 생성
 * </pre>
 */

public class RescueVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5525838343445910811L;

    /**
     * PREFIX
     **/
    private String preFixId;

    /**
    * 예약문서번호
    **/
    private String rescDocNo;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
    * 차대번호
    **/
    private String vinNo;

    /**
    * 차량등록번호
    **/
    private String carRegNo;

    /**
    * 엔진시리얼번호
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
    * 운전자ID
    **/
    private String driverId;

    /**
    * 운전자명
    **/
    private String driverNm;

    /**
    * 예약유형
    **/
    private String rescTp;

    /**
    * 예약일자
    **/
    private Date rescDt;

    /**
    * 베이번호
    **/
    private String bayNo;

    /**
    * TECMANID
    **/
    private String tecId;

    /**
    * TECMAN명
    **/
    private String tecNm;

    /**
    * SAID
    **/
    private String saId;

    /**
    * SA명
    **/
    private String saNm;

    /**
    * 희망예약일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date hopeRescDt;

    /**
    * 서비스예약시작일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serRescStartDt;

    /**
    * 서비스예약종료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serRescEndDt;

    /**
    * 부품금액
    **/
    private Double parAmt;

    /**
    * 공임금액
    **/
    private Double lbrAmt;

    /**
    * 기타금액
    **/
    private Double etcAmt;

    /**
    * 할인금액
    **/
    private Double dcAmt;

    /**
    * 합계금액
    **/
    private Double sumAmt;

    /**
    * 부가가치세금액
    **/
    private Double vatAmt;

    /**
    * 총합금액
    **/
    private Double totAmt;

    /**
    * 예치금액
    **/
    private Double balAmt;

    /**
    * 예약상태코드
    **/
    private String rescStatCd;

    /**
    * 고객비고
    **/
    private String custRemark;

    /**
    * 취소사유코드
    **/
    private String cancReasonCd;

    /**
    * 취소사유내용
    **/
    private String cancReasonCont;

    /**
    * 거리단위코드
    **/
    private String distUnitCd;

    /**
    * 방문차량수령시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitCarReceiveDt;

    /**
    * 방문차량수령연계인명
    **/
    private String vsitCarReceiveIfNm;

    /**
    * 방문차량수령연락처번호
    **/
    private String vsitCarReceiveCinoNo;

    /**
    * 방문차량수령주소명
    **/
    private String vsitCarReceiveAddrNm;

    /**
    * 차량수령일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carReceiveDt;

    /**
    * 방문인도연계인명
    **/
    private String vsitDlIfNm;

    /**
    * 방문인도연락처번호
    **/
    private String vsitDlCinoNo;

    /**
    * 방문인도주소명
    **/
    private String vsitDlAddrNm;

    /**
    * 방문일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitDt;

    /**
    * 방문연계인명
    **/
    private String vsitIfNm;

    /**
    * 방문연락처번호
    **/
    private String vsitCinoNo;

    /**
    * 방문주소명
    **/
    private String vsitAddrNm;

    /**
     * 예약불가 구분(01 or null:예약, 02:캘린더)
     */
    private String noResvTp;

    /**
     * RO그룹번호
     */
    private String roGrpNo;

    /**
     * 차량접수일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carAcceptDt;

    /**
    * 사전점검번호
    **/
    private String diagDocNo;

    /**
    * 사전점검시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkDt;

    /**
    * 예약접수상태
    **/
    private String rescReptStatCd;

    /**
    * 구원비고
    **/
    private String rescRemark;


    /**
    * 구원요청시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rescReqDt;


    /**
    * 예정출동시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcRescStartDt;


    /**
    * 구원조소
    **/
    private String rescAddrNm;

    /**
    * 구원출동시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rescStartDt;

    /**
    * 현장도착시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrvDt;

    /**
    * 현장leave시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rescEndDt;

    /**
     * 구원복귀시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rescReturnDt;

    /**
    * 구원방식
    **/
    private String rescMthCd;

    /**
    * 구원차량
    **/
    private String rescCarCd;

    /**
    * 출동주행거리
    **/
    private String moveRunDistVal;

    /**
    * 복귀주행거리
    **/
    private int returnRunDistVal;

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
     * 차종명
     */
    private String carlineNm;

    /**
     * 모델명
     */
    private String modelNm;

    private String regUsrNm;

    private String updtUsrNm;

    private int carRunDistVal;





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

    public String getRescDocNo() {
        return rescDocNo;
    }

    public void setRescDocNo(String rescDocNo) {
        this.rescDocNo = rescDocNo;
    }

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public String getCarRegNo() {
        return carRegNo;
    }

    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    public String getEnginNo() {
        return enginNo;
    }

    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }

    public String getCarOwnerId() {
        return carOwnerId;
    }

    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getDriverNm() {
        return driverNm;
    }

    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
    }


    public String getBayNo() {
        return bayNo;
    }

    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }

    public String getTecId() {
        return tecId;
    }

    public void setTecId(String tecId) {
        this.tecId = tecId;
    }

    public String getTecNm() {
        return tecNm;
    }

    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
    }

    public String getSaId() {
        return saId;
    }

    public void setSaId(String saId) {
        this.saId = saId;
    }

    public String getSaNm() {
        return saNm;
    }

    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }

    public Double getParAmt() {
        return parAmt;
    }

    public void setParAmt(Double parAmt) {
        this.parAmt = parAmt;
    }

    public Double getLbrAmt() {
        return lbrAmt;
    }

    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    public Double getEtcAmt() {
        return etcAmt;
    }

    public void setEtcAmt(Double etcAmt) {
        this.etcAmt = etcAmt;
    }

    public Double getDcAmt() {
        return dcAmt;
    }

    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    public Double getSumAmt() {
        return sumAmt;
    }

    public void setSumAmt(Double sumAmt) {
        this.sumAmt = sumAmt;
    }

    public Double getVatAmt() {
        return vatAmt;
    }

    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    public Double getTotAmt() {
        return totAmt;
    }

    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    public Double getBalAmt() {
        return balAmt;
    }

    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    public String getCustRemark() {
        return custRemark;
    }

    public void setCustRemark(String custRemark) {
        this.custRemark = custRemark;
    }

    public String getCancReasonCd() {
        return cancReasonCd;
    }

    public void setCancReasonCd(String cancReasonCd) {
        this.cancReasonCd = cancReasonCd;
    }

    public String getCancReasonCont() {
        return cancReasonCont;
    }

    public void setCancReasonCont(String cancReasonCont) {
        this.cancReasonCont = cancReasonCont;
    }

    public String getDistUnitCd() {
        return distUnitCd;
    }

    public void setDistUnitCd(String distUnitCd) {
        this.distUnitCd = distUnitCd;
    }

    public Date getVsitCarReceiveDt() {
        return vsitCarReceiveDt;
    }

    public void setVsitCarReceiveDt(Date vsitCarReceiveDt) {
        this.vsitCarReceiveDt = vsitCarReceiveDt;
    }

    public String getVsitCarReceiveIfNm() {
        return vsitCarReceiveIfNm;
    }

    public void setVsitCarReceiveIfNm(String vsitCarReceiveIfNm) {
        this.vsitCarReceiveIfNm = vsitCarReceiveIfNm;
    }

    public String getVsitCarReceiveCinoNo() {
        return vsitCarReceiveCinoNo;
    }

    public void setVsitCarReceiveCinoNo(String vsitCarReceiveCinoNo) {
        this.vsitCarReceiveCinoNo = vsitCarReceiveCinoNo;
    }

    public String getVsitCarReceiveAddrNm() {
        return vsitCarReceiveAddrNm;
    }

    public void setVsitCarReceiveAddrNm(String vsitCarReceiveAddrNm) {
        this.vsitCarReceiveAddrNm = vsitCarReceiveAddrNm;
    }

    public Date getCarReceiveDt() {
        return carReceiveDt;
    }

    public void setCarReceiveDt(Date carReceiveDt) {
        this.carReceiveDt = carReceiveDt;
    }

    public String getVsitDlIfNm() {
        return vsitDlIfNm;
    }

    public void setVsitDlIfNm(String vsitDlIfNm) {
        this.vsitDlIfNm = vsitDlIfNm;
    }

    public String getVsitDlCinoNo() {
        return vsitDlCinoNo;
    }

    public void setVsitDlCinoNo(String vsitDlCinoNo) {
        this.vsitDlCinoNo = vsitDlCinoNo;
    }

    public String getVsitDlAddrNm() {
        return vsitDlAddrNm;
    }

    public void setVsitDlAddrNm(String vsitDlAddrNm) {
        this.vsitDlAddrNm = vsitDlAddrNm;
    }

    public Date getVsitDt() {
        return vsitDt;
    }

    public void setVsitDt(Date vsitDt) {
        this.vsitDt = vsitDt;
    }

    public String getVsitIfNm() {
        return vsitIfNm;
    }

    public void setVsitIfNm(String vsitIfNm) {
        this.vsitIfNm = vsitIfNm;
    }

    public String getVsitCinoNo() {
        return vsitCinoNo;
    }

    public void setVsitCinoNo(String vsitCinoNo) {
        this.vsitCinoNo = vsitCinoNo;
    }

    public String getVsitAddrNm() {
        return vsitAddrNm;
    }

    public void setVsitAddrNm(String vsitAddrNm) {
        this.vsitAddrNm = vsitAddrNm;
    }

    public String getNoResvTp() {
        return noResvTp;
    }

    public void setNoResvTp(String noResvTp) {
        this.noResvTp = noResvTp;
    }

    public String getRoGrpNo() {
        return roGrpNo;
    }

    public void setRoGrpNo(String roGrpNo) {
        this.roGrpNo = roGrpNo;
    }

    public Date getCarAcceptDt() {
        return carAcceptDt;
    }

    public void setCarAcceptDt(Date carAcceptDt) {
        this.carAcceptDt = carAcceptDt;
    }

    public String getDiagDocNo() {
        return diagDocNo;
    }

    public void setDiagDocNo(String diagDocNo) {
        this.diagDocNo = diagDocNo;
    }

    public Date getPreChkDt() {
        return preChkDt;
    }

    public void setPreChkDt(Date preChkDt) {
        this.preChkDt = preChkDt;
    }

    public String getRescReptStatCd() {
        return rescReptStatCd;
    }

    public void setRescReptStatCd(String rescReptStatCd) {
        this.rescReptStatCd = rescReptStatCd;
    }

    public String getRescRemark() {
        return rescRemark;
    }

    public void setRescRemark(String rescRemark) {
        this.rescRemark = rescRemark;
    }

    public Date getRescReqDt() {
        return rescReqDt;
    }

    public void setRescReqDt(Date rescReqDt) {
        this.rescReqDt = rescReqDt;
    }

    public Date getExpcRescStartDt() {
        return expcRescStartDt;
    }

    public void setExpcRescStartDt(Date expcRescStartDt) {
        this.expcRescStartDt = expcRescStartDt;
    }

    public String getRescAddrNm() {
        return rescAddrNm;
    }

    public void setRescAddrNm(String rescAddrNm) {
        this.rescAddrNm = rescAddrNm;
    }

    public Date getRescStartDt() {
        return rescStartDt;
    }

    public void setRescStartDt(Date rescStartDt) {
        this.rescStartDt = rescStartDt;
    }

    public Date getArrvDt() {
        return arrvDt;
    }

    public void setArrvDt(Date arrvDt) {
        this.arrvDt = arrvDt;
    }

    public Date getRescEndDt() {
        return rescEndDt;
    }

    public void setRescEndDt(Date rescEndDt) {
        this.rescEndDt = rescEndDt;
    }

    public Date getRescReturnDt() {
        return rescReturnDt;
    }

    public void setRescReturnDt(Date rescReturnDt) {
        this.rescReturnDt = rescReturnDt;
    }

    public String getRescMthCd() {
        return rescMthCd;
    }

    public void setRescMthCd(String rescMthCd) {
        this.rescMthCd = rescMthCd;
    }

    public String getRescCarCd() {
        return rescCarCd;
    }

    public void setRescCarCd(String rescCarCd) {
        this.rescCarCd = rescCarCd;
    }

    public String getMoveRunDistVal() {
        return moveRunDistVal;
    }

    public void setMoveRunDistVal(String moveRunDistVal) {
        this.moveRunDistVal = moveRunDistVal;
    }

    public int getReturnRunDistVal() {
        return returnRunDistVal;
    }

    public void setReturnRunDistVal(int returnRunDistVal) {
        this.returnRunDistVal = returnRunDistVal;
    }

    public String getRescTp() {
        return rescTp;
    }

    public void setRescTp(String rescTp) {
        this.rescTp = rescTp;
    }

    public Date getRescDt() {
        return rescDt;
    }

    public void setRescDt(Date rescDt) {
        this.rescDt = rescDt;
    }

    public String getRescStatCd() {
        return rescStatCd;
    }

    public void setRescStatCd(String rescStatCd) {
        this.rescStatCd = rescStatCd;
    }

    public Date getHopeRescDt() {
        return hopeRescDt;
    }

    public void setHopeRescDt(Date hopeRescDt) {
        this.hopeRescDt = hopeRescDt;
    }

    public Date getSerRescStartDt() {
        return serRescStartDt;
    }

    public void setSerRescStartDt(Date serRescStartDt) {
        this.serRescStartDt = serRescStartDt;
    }

    public Date getSerRescEndDt() {
        return serRescEndDt;
    }

    public void setSerRescEndDt(Date serRescEndDt) {
        this.serRescEndDt = serRescEndDt;
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




}