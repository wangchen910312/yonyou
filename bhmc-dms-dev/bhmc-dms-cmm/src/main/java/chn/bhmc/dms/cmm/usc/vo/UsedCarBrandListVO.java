package chn.bhmc.dms.cmm.usc.vo;

import java.io.Serializable;

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

public class UsedCarBrandListVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7291542829627382919L;

    private String carBrandCd;
    private String carBrandNm;

    /**
     * @return the carBrandCd
     */
    public String getCarBrandCd() {
        return carBrandCd;
    }
    /**
     * @param carBrandCd the carBrandCd to set
     */
    public void setCarBrandCd(String carBrandCd) {
        this.carBrandCd = carBrandCd;
    }
    /**
     * @return the carBrandNm
     */
    public String getCarBrandNm() {
        return carBrandNm;
    }
    /**
     * @param carBrandNm the carBrandNm to set
     */
    public void setCarBrandNm(String carBrandNm) {
        this.carBrandNm = carBrandNm;
    }


}