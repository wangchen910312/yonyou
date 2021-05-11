package chn.bhmc.dms.mob.api.repair.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarInfoSearchVO
 * @Description : 차량 정보 조회 VO
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

public class CarInfoSearchVO extends SearchVO{
    private static final long serialVersionUID = 4887887191344680404L;

    private String dlrCd;           // 딜러코드
    private String carlineCd;       // 차종코드
    private String modelCd;         // 모델CD
    private String optionTp;        // 옵션구분
    private String useYn = "Y";     // 사용여부
    private String ocnCd;           // OCN
    private String fscCd;           // OCN
    private String barCode;         // 모바일 바코드

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
     * @return the optionTp
     */
    public String getOptionTp() {
        return optionTp;
    }
    /**
     * @param optionTp the optionTp to set
     */
    public void setOptionTp(String optionTp) {
        this.optionTp = optionTp;
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
     * @return the barCode
     */
    public String getBarCode() {
        return barCode;
    }
    /**
     * @param barCode the barCode to set
     */
    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
