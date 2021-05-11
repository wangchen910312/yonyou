package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 작업중지 VO
 * </pre>
 *
 * @ClassName   : WorkPauseVO.java
 * @Description : 작업배정 VO.
 * @author Yin Xueyuan
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class WorkPauseVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4537327758954400432L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * RO문서번호
     */
    @NotBlank
    private String roDocNo;

    /**
     * RO그룹번호
     */
    private String roGrpNo;

    /**
     * RO그룹번호
     */
    private String roTp;

    /**
     * RO그룹번호
     */
    private String lbrTp;

    /**
     * 수리유형코드
     */
    private String lbrTpNm;

    /**
     * RO그룹번호
     */
    private double lbrPrc;

    /**
     * RO그룹번호
     */
    private double dcAmt;

    /**
     * RO그룹번호
     */
    private double expcLbrAmt;

    /**
     * 라인번호
     */
    private String lineNo;

    /**
     * 베이번호
     */
    private String bayNo;

    /**
     * 베이명
     */
    private String bayNm;

    /**
     * 수리유형
     */
    private String rpirTp;

    /**
     * 수리코드
     */
    @NotBlank
    private String rpirCd;

    /**
     * 수리명
     */
    private String rpirNm;

    /**
     * 수리코드
     */
    private String lbrCd;

    /**
     * 수리명
     */
    private String lbrNm;

    /**
     * 공임시간
     */
    private double lbrHm;

    /**
     * 수리구분코드
     */
    private String rpirDstinCd;

    /**
     * 작업상태코드
     */
    private String wrkStatCd;

    /**
     * 품질검사코드
     */
    private String qtTestCd;

    /**
     * 실TecMan
     */
    private String realTecId;

     /**
     * 실TecMan
     */
    private String realTecNm;

    /**
     * 작업시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date operStartDt;

    /**
     * 작업종료일자
     */
    @NotNull
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date operEndDt;

    /**
     * 배정시작일자
     */
    private Date allocStartDt;

    /**
     * 배정종료일자
     */
    private Date allocEndDt;

    /**
     * 계획시간
     */
    private double planHm;

    /**
     * 배정시간
     */
    private double allocHm;

    /**
     * 배정자 아이디
     */
    private String saId;

    /**
     * 배정자 아이디
     */
    private String saNm;

    /**
     * 배정상태코드
     */
    private String allocStatCd;

    /**
     * 배정자 명칭
     */
    private String pauseCauCd;

    /**
     * 배정자 명칭
     */
    private String pauseRemark;

    /**
     * 세차상태코드
     */
    private String carWashStatCd;

    /**
     * 페인트상태코드
     */
    private String paintStatCd;

    /**
     * 품질검사상태코드
     */
    private String qtTestStatCd;

    /**
     * 소조번호
     */
    private String wkgrpNo;

    /**
     * 소조명
     */
    private String wkgrpNm;

    /**
     * 페인트수량
     **/
    private double paintCnt;

    /**
     * 판금수량
     **/
    private double shtCnt;

    /**
     * 공임계수
     **/
    private double lbrCnt;

    /**
     * 난의도
     **/
    private double diffVal;

    /**
     * 페인트색상코드
     **/
    private String paintColorCd;

    /**
     * 차량색상코드
     **/
    private String carColorCd;

    /**
     * 페인트유형
     **/
    private String paintTp;

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
     * @return the lineNo
     */
    public String getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(String lineNo) {
        this.lineNo = lineNo;
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
     * @return the bayNm
     */
    public String getBayNm() {
        return bayNm;
    }

    /**
     * @param bayNm the bayNm to set
     */
    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
    }

    /**
     * @return the rpirTp
     */
    public String getRpirTp() {
        return rpirTp;
    }

    /**
     * @param rpirTp the rpirTp to set
     */
    public void setRpirTp(String rpirTp) {
        this.rpirTp = rpirTp;
    }

    /**
     * @return the rpirCd
     */
    public String getRpirCd() {
        return rpirCd;
    }

    /**
     * @param rpirCd the rpirCd to set
     */
    public void setRpirCd(String rpirCd) {
        this.rpirCd = rpirCd;
    }

    /**
     * @return the rpirNm
     */
    public String getRpirNm() {
        return rpirNm;
    }

    /**
     * @param rpirNm the rpirNm to set
     */
    public void setRpirNm(String rpirNm) {
        this.rpirNm = rpirNm;
    }


    /**
     * @return the rpirDstinCd
     */
    public String getRpirDstinCd() {
        return rpirDstinCd;
    }

    /**
     * @param rpirDstinCd the rpirDstinCd to set
     */
    public void setRpirDstinCd(String rpirDstinCd) {
        this.rpirDstinCd = rpirDstinCd;
    }

    /**
     * @return the wrkStatCd
     */
    public String getWrkStatCd() {
        return wrkStatCd;
    }

    /**
     * @param wrkStatCd the wrkStatCd to set
     */
    public void setWrkStatCd(String wrkStatCd) {
        this.wrkStatCd = wrkStatCd;
    }

    /**
     * @return the qtTestCd
     */
    public String getQtTestCd() {
        return qtTestCd;
    }

    /**
     * @param qtTestCd the qtTestCd to set
     */
    public void setQtTestCd(String qtTestCd) {
        this.qtTestCd = qtTestCd;
    }

    /**
     * @return the realTecId
     */
    public String getRealTecId() {
        return realTecId;
    }

    /**
     * @param realTecId the realTecId to set
     */
    public void setRealTecId(String realTecId) {
        this.realTecId = realTecId;
    }

    /**
     * @return the realTecNm
     */
    public String getRealTecNm() {
        return realTecNm;
    }

    /**
     * @param realTecNm the realTecNm to set
     */
    public void setRealTecNm(String realTecNm) {
        this.realTecNm = realTecNm;
    }

    /**
     * @return the operStartDt
     */
    public Date getOperStartDt() {
        return operStartDt;
    }

    /**
     * @param operStartDt the operStartDt to set
     */
    public void setOperStartDt(Date operStartDt) {
        this.operStartDt = operStartDt;
    }

    /**
     * @return the operEndDt
     */
    public Date getOperEndDt() {
        return operEndDt;
    }

    /**
     * @param operEndDt the operEndDt to set
     */
    public void setOperEndDt(Date operEndDt) {
        this.operEndDt = operEndDt;
    }

    /**
     * @return the allocStartDt
     */
    public Date getAllocStartDt() {
        return allocStartDt;
    }

    /**
     * @param allocStartDt the allocStartDt to set
     */
    public void setAllocStartDt(Date allocStartDt) {
        this.allocStartDt = allocStartDt;
    }

    /**
     * @return the allocEndDt
     */
    public Date getAllocEndDt() {
        return allocEndDt;
    }

    /**
     * @param allocEndDt the allocEndDt to set
     */
    public void setAllocEndDt(Date allocEndDt) {
        this.allocEndDt = allocEndDt;
    }

    /**
     * @return the planHm
     */
    public double getPlanHm() {
        return planHm;
    }

    /**
     * @param planHm the planHm to set
     */
    public void setPlanHm(double planHm) {
        this.planHm = planHm;
    }

    /**
     * @return the allocHm
     */
    public double getAllocHm() {
        return allocHm;
    }

    /**
     * @param allocHm the allocHm to set
     */
    public void setAllocHm(double allocHm) {
        this.allocHm = allocHm;
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
     * @return the allocStatCd
     */
    public String getAllocStatCd() {
        return allocStatCd;
    }

    /**
     * @param allocStatCd the allocStatCd to set
     */
    public void setAllocStatCd(String allocStatCd) {
        this.allocStatCd = allocStatCd;
    }

    /**
     * @return the pauseCauCd
     */
    public String getPauseCauCd() {
        return pauseCauCd;
    }

    /**
     * @param pauseCauCd the pauseCauCd to set
     */
    public void setPauseCauCd(String pauseCauCd) {
        this.pauseCauCd = pauseCauCd;
    }



    /**
     * @return the pauseRemark
     */
    public String getPauseRemark() {
        return pauseRemark;
    }

    /**
     * @param pauseRemark the pauseRemark to set
     */
    public void setPauseRemark(String pauseRemark) {
        this.pauseRemark = pauseRemark;
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
     * @return the wkgrpNo
     */
    public String getWkgrpNo() {
        return wkgrpNo;
    }

    /**
     * @param wkgrpNo the wkgrpNo to set
     */
    public void setWkgrpNo(String wkgrpNo) {
        this.wkgrpNo = wkgrpNo;
    }

    /**
     * @return the wkgrpNm
     */
    public String getWkgrpNm() {
        return wkgrpNm;
    }

    /**
     * @param wkgrpNm the wkgrpNm to set
     */
    public void setWkgrpNm(String wkgrpNm) {
        this.wkgrpNm = wkgrpNm;
    }

    /**
     * @return the paintCnt
     */
    public double getPaintCnt() {
        return paintCnt;
    }

    /**
     * @param paintCnt the paintCnt to set
     */
    public void setPaintCnt(double paintCnt) {
        this.paintCnt = paintCnt;
    }

    /**
     * @return the shtCnt
     */
    public double getShtCnt() {
        return shtCnt;
    }

    /**
     * @param shtCnt the shtCnt to set
     */
    public void setShtCnt(double shtCnt) {
        this.shtCnt = shtCnt;
    }

    /**
     * @return the lbrCnt
     */
    public double getLbrCnt() {
        return lbrCnt;
    }

    /**
     * @param lbrCnt the lbrCnt to set
     */
    public void setLbrCnt(double lbrCnt) {
        this.lbrCnt = lbrCnt;
    }

    /**
     * @return the diffVal
     */
    public double getDiffVal() {
        return diffVal;
    }

    /**
     * @param diffVal the diffVal to set
     */
    public void setDiffVal(double diffVal) {
        this.diffVal = diffVal;
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
     * @return the lbrTp
     */
    public String getLbrTp() {
        return lbrTp;
    }

    /**
     * @param lbrTp the lbrTp to set
     */
    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    /**
     * @return the lbrPrc
     */
    public double getLbrPrc() {
        return lbrPrc;
    }

    /**
     * @param lbrPrc the lbrPrc to set
     */
    public void setLbrPrc(double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    /**
     * @return the dcAmt
     */
    public double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the expcLbrAmt
     */
    public double getExpcLbrAmt() {
        return expcLbrAmt;
    }

    /**
     * @param expcLbrAmt the expcLbrAmt to set
     */
    public void setExpcLbrAmt(double expcLbrAmt) {
        this.expcLbrAmt = expcLbrAmt;
    }

    /**
     * @return the lbrCd
     */
    public String getLbrCd() {
        return lbrCd;
    }

    /**
     * @param lbrCd the lbrCd to set
     */
    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    /**
     * @return the lbrNm
     */
    public String getLbrNm() {
        return lbrNm;
    }

    /**
     * @param lbrNm the lbrNm to set
     */
    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    /**
     * @return the lbrHm
     */
    public double getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(double lbrHm) {
        this.lbrHm = lbrHm;
    }

    public String getLbrTpNm() {
        return lbrTpNm;
    }

    public void setLbrTpNm(String lbrTpNm) {
        this.lbrTpNm = lbrTpNm;
    }



}
