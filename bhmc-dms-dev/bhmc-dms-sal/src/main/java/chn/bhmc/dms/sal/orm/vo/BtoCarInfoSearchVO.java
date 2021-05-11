package chn.bhmc.dms.sal.orm.vo;

import chn.bhmc.dms.core.datatype.BaseSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BtoCarInfoSearchVO
 * @Description : BTO 차량 정보 조회 VO
 * @author Kim Jin Suk
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class BtoCarInfoSearchVO extends BaseSearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2807368896257486392L;

    private String dlrCd;           // 딜러코드
    private String carlineCd;       // 차종코드
    private String modelCd;         // 모델CD
    private String useYn = "Y";     // 사용여부
    private String ocnCd;           // OCN
    private String extColorCd;      // 외장색코드
    private String fscCd;      // 외장색코드
    private String fscpChmMmm;
    private String fscpMotpCd;

    /**
     * @return the fscpMotpCd
     */
    public String getFscpMotpCd() {
        return fscpMotpCd;
    }
    /**
     * @param fscpMotpCd the fscpMotpCd to set
     */
    public void setFscpMotpCd(String fscpMotpCd) {
        this.fscpMotpCd = fscpMotpCd;
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
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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
}
