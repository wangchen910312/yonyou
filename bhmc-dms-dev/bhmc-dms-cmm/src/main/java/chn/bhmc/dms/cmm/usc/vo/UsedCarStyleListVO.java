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

public class UsedCarStyleListVO{

    private String year;

    private String styleNm;

    private String styleCd;

    /**
     * @return the year
     */
    public String getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(String year) {
        this.year = year;
    }

    /**
     * @return the styleNm
     */
    public String getStyleNm() {
        return styleNm;
    }

    /**
     * @param styleNm the styleNm to set
     */
    public void setStyleNm(String styleNm) {
        this.styleNm = styleNm;
    }

    /**
     * @return the styleCd
     */
    public String getStyleCd() {
        return styleCd;
    }

    /**
     * @param styleCd the styleCd to set
     */
    public void setStyleCd(String styleCd) {
        this.styleCd = styleCd;
    }


}