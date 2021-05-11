package chn.bhmc.dms.cmm.usc.vo;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarBrandListVO.java
 * @Description :
 * @author Choi KyungYong
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 3. 3.     Choi KyungYong            최초 생성
 * </pre>
 */

public class UsedCarModelListVO{

    private String brandNm;

    private String carlineNm;

    private String carlineCd;

    private String useYn;

    /**
     * @return the brandNm
     */
    public String getBrandNm() {
        return brandNm;
    }

    /**
     * @param brandNm the brandNm to set
     */
    public void setBrandNm(String brandNm) {
        this.brandNm = brandNm;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "UsedCarModelListVO [carlineNm=" + carlineNm + ", carlineCd=" + carlineCd + ", useYn=" + useYn + "]";
    }

}