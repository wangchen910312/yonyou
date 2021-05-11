package chn.bhmc.dms.sal.orm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BtoCarInfoVO
 * @Description : BTO 차량정보VO ( 사용자 코드식 )
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.   Kang Seok Han     최초 생성
 * </pre>
 */

public class BtoCarInfoVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4048454400880993757L;
    // 차종리스트
    private String carlineCd;          // 코드
    private String carlineNm;          // 명칭
    private String carlineNmNc;        // 명칭
    private String carlineEnNm;        // 영문명칭

    // 모델리스트
    private String modelCd;           // 코드
    private String modelNm;           // 명칭
    private String modelNmNc;         // 명칭
    private String modelEnNm;         // 영문명칭

    // OCN리스트
    private String ocnCd;             // 코드
    private String ocnNm;             // 명칭
    private String ocnNmPur;          // 명칭2
    private String ocnNmNc;           // 명칭
    private String ocnEnNm;           // 영문
    private double whPrc;             // 도매가격
    private double msPrc;             // 소매가격

    // 외장색
    private String extColorCd;        // 코드
    private String extColorNm;        // 명칭
    private String extColorNmNc;      // 명칭
    private String extColorEnNm;      // 영문

    // 내장색
    private String intColorCd;        // 코드
    private String intColorNm;        // 명칭
    private String intColorNmNc;      // 명칭
    private String intColorEnNm;      // 영문

    private int    modelCnt;

    /**
     * @return the modelCnt
     */
    public int getModelCnt() {
        return modelCnt;
    }
    /**
     * @param modelCnt the modelCnt to set
     */
    public void setModelCnt(int modelCnt) {
        this.modelCnt = modelCnt;
    }
    /**
     * @return the fscNm
     */
    public String getFscNm() {
        return fscNm;
    }
    /**
     * @param fscNm the fscNm to set
     */
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
    }
    private String fscCd;      // 차관
    private String fscNm;      // 차관
    /**
     * @return the fscCd
     */
    public String getFscCd() {
        return fscCd;
    }
    /**
     * @param fscCd the fscCd to set
     */
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
    }
    /**
     * @return the fscpChmMmm
     */
    public String getFscpChmMmm() {
        return fscpChmMmm;
    }
    /**
     * @param fscpChmMmm the fscpChmMmm to set
     */
    public void setFscpChmMmm(String fscpChmMmm) {
        this.fscpChmMmm = fscpChmMmm;
    }
    private String fscpChmMmm;      // 영문

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
     * @return the carlineNmNc
     */
    public String getCarlineNmNc() {
        return carlineNmNc;
    }
    /**
     * @param carlineNmNc the carlineNmNc to set
     */
    public void setCarlineNmNc(String carlineNmNc) {
        this.carlineNmNc = carlineNmNc;
    }
    /**
     * @return the carlineEnNm
     */
    public String getCarlineEnNm() {
        return carlineEnNm;
    }
    /**
     * @param carlineEnNm the carlineEnNm to set
     */
    public void setCarlineEnNm(String carlineEnNm) {
        this.carlineEnNm = carlineEnNm;
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
     * @return the modelNmNc
     */
    public String getModelNmNc() {
        return modelNmNc;
    }
    /**
     * @param modelNmNc the modelNmNc to set
     */
    public void setModelNmNc(String modelNmNc) {
        this.modelNmNc = modelNmNc;
    }
    /**
     * @return the modelEnNm
     */
    public String getModelEnNm() {
        return modelEnNm;
    }
    /**
     * @param modelEnNm the modelEnNm to set
     */
    public void setModelEnNm(String modelEnNm) {
        this.modelEnNm = modelEnNm;
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
     * @return the ocnNmNc
     */
    public String getOcnNmNc() {
        return ocnNmNc;
    }
    /**
     * @param ocnNmNc the ocnNmNc to set
     */
    public void setOcnNmNc(String ocnNmNc) {
        this.ocnNmNc = ocnNmNc;
    }
    /**
     * @return the ocnEnNm
     */
    public String getOcnEnNm() {
        return ocnEnNm;
    }
    /**
     * @param ocnEnNm the ocnEnNm to set
     */
    public void setOcnEnNm(String ocnEnNm) {
        this.ocnEnNm = ocnEnNm;
    }
    /**
     * @return the whPrc
     */
    public double getWhPrc() {
        return whPrc;
    }
    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(double whPrc) {
        this.whPrc = whPrc;
    }
    /**
     * @return the msPrc
     */
    public double getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(double msPrc) {
        this.msPrc = msPrc;
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
     * @return the extColorNmNc
     */
    public String getExtColorNmNc() {
        return extColorNmNc;
    }
    /**
     * @param extColorNmNc the extColorNmNc to set
     */
    public void setExtColorNmNc(String extColorNmNc) {
        this.extColorNmNc = extColorNmNc;
    }
    /**
     * @return the extColorEnNm
     */
    public String getExtColorEnNm() {
        return extColorEnNm;
    }
    /**
     * @param extColorEnNm the extColorEnNm to set
     */
    public void setExtColorEnNm(String extColorEnNm) {
        this.extColorEnNm = extColorEnNm;
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
     * @return the intColorNmNc
     */
    public String getIntColorNmNc() {
        return intColorNmNc;
    }
    /**
     * @param intColorNmNc the intColorNmNc to set
     */
    public void setIntColorNmNc(String intColorNmNc) {
        this.intColorNmNc = intColorNmNc;
    }
    /**
     * @return the intColorEnNm
     */
    public String getIntColorEnNm() {
        return intColorEnNm;
    }
    /**
     * @param intColorEnNm the intColorEnNm to set
     */
    public void setIntColorEnNm(String intColorEnNm) {
        this.intColorEnNm = intColorEnNm;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the ocnNmPur
     */
    public String getOcnNmPur() {
        return ocnNmPur;
    }
    /**
     * @param ocnNmPur the ocnNmPur to set
     */
    public void setOcnNmPur(String ocnNmPur) {
        this.ocnNmPur = ocnNmPur;
    }

}
