package chn.bhmc.dms.cmm.cmp.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 사무소정보 VO
 * </pre>
 *
 * @ClassName   : OfficeVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class OfficeVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5874985072890326152L;

    /**
     * 사업부코드
     */
    @NotBlank
    @Length(max=10)
    private String diviCd;

    /**
     * 사업부명
     */
    private String diviNm;

    /**
     * 사무소코드
     */
    @NotBlank
    @Length(max=10)
    private String offCd;

    /**
     * 사무소명
     */
    @NotBlank
    @Length(max=128)
    private String offNm;

    /**
     * @return the diviCd
     */
    public String getDiviCd() {
        return diviCd;
    }

    /**
     * @param diviCd the diviCd to set
     */
    public void setDiviCd(String diviCd) {
        this.diviCd = diviCd;
    }

    /**
     * @return the diviNm
     */
    public String getDiviNm() {
        return diviNm;
    }

    /**
     * @param diviNm the diviNm to set
     */
    public void setDiviNm(String diviNm) {
        this.diviNm = diviNm;
    }

    /**
     * @return the offCd
     */
    public String getOffCd() {
        return offCd;
    }

    /**
     * @param offCd the offCd to set
     */
    public void setOffCd(String offCd) {
        this.offCd = offCd;
    }

    /**
     * @return the offNm
     */
    public String getOffNm() {
        return offNm;
    }

    /**
     * @param offNm the offNm to set
     */
    public void setOffNm(String offNm) {
        this.offNm = offNm;
    }

}
