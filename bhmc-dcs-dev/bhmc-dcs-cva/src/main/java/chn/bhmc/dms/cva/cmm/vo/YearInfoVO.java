package chn.bhmc.dms.cva.cmm.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarInfoVO
 * @Description : 차량정보VO ( 사용자 코드식 )
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

public class YearInfoVO{

    // 차종리스트
    private int yearCd;          // 코드

    private int yearNm;          // 명칭
    /**
     * @return the yearCd
     */
    public int getYearCd() {
        return yearCd;
    }
    /**
     * @param yearCd the yearCd to set
     */
    public void setYearCd(int yearCd) {
        this.yearCd = yearCd;
    }
    /**
     * @return the yearNm
     */
    public int getYearNm() {
        return yearNm;
    }
    /**
     * @param yearNm the yearNm to set
     */
    public void setYearNm(int yearNm) {
        this.yearNm = yearNm;
    }


}
