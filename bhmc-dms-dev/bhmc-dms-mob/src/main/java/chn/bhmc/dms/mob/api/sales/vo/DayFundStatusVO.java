package chn.bhmc.dms.mob.api.sales.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DayFundStatusVO
 * @Description : 일자금현황 조회 VO
 * @author Kim Jin Suk
 * @since 2016. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 8. 18.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class DayFundStatusVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8881925161563218725L;

    private String dlrCd;       // 딜러코드
    private String yyMm;        // 조회 년월일
    private String lastDt;      // 해당월 마지막일

    private String yyMmDd;      // 년월일
    private String yy;          // 년
    private String mm;          // 월
    private String dd;          // 일

    // 차종
    private String carlineCd;
    private String carlineNm;

    // 모델
    private String modelCd;
    private String modelNm;

    // ocn
    private String ocnCd;
    private String ocnNm;

    // 외장색
    private String extColorCd;
    private String extColorNm;

    // 내장색
    private String intColorCd;
    private String intColorNm;

    // 오더유형
    private String ordTpCd;
    private String ordTpNm;

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
     * @return the yyMm
     */
    public String getYyMm() {
        return yyMm;
    }
    /**
     * @param yyMm the yyMm to set
     */
    public void setYyMm(String yyMm) {
        this.yyMm = yyMm;
    }
    /**
     * @return the lastDt
     */
    public String getLastDt() {
        return lastDt;
    }
    /**
     * @param lastDt the lastDt to set
     */
    public void setLastDt(String lastDt) {
        this.lastDt = lastDt;
    }
    /**
     * @return the yyMmDd
     */
    public String getYyMmDd() {
        return yyMmDd;
    }
    /**
     * @param yyMmDd the yyMmDd to set
     */
    public void setYyMmDd(String yyMmDd) {
        this.yyMmDd = yyMmDd;
    }
    /**
     * @return the yy
     */
    public String getYy() {
        return yy;
    }
    /**
     * @param yy the yy to set
     */
    public void setYy(String yy) {
        this.yy = yy;
    }
    /**
     * @return the mm
     */
    public String getMm() {
        return mm;
    }
    /**
     * @param mm the mm to set
     */
    public void setMm(String mm) {
        this.mm = mm;
    }
    /**
     * @return the dd
     */
    public String getDd() {
        return dd;
    }
    /**
     * @param dd the dd to set
     */
    public void setDd(String dd) {
        this.dd = dd;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }
    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
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
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
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
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the ordTpCd
     */
    public String getOrdTpCd() {
        return ordTpCd;
    }
    /**
     * @param ordTpCd the ordTpCd to set
     */
    public void setOrdTpCd(String ordTpCd) {
        this.ordTpCd = ordTpCd;
    }
    /**
     * @return the ordTpNm
     */
    public String getOrdTpNm() {
        return ordTpNm;
    }
    /**
     * @param ordTpNm the ordTpNm to set
     */
    public void setOrdTpNm(String ordTpNm) {
        this.ordTpNm = ordTpNm;
    }
}
