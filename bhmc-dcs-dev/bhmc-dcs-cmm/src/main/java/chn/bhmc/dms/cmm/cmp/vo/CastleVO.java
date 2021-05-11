package chn.bhmc.dms.cmm.cmp.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 성정보정보 VO
 * </pre>
 *
 * @ClassName   : CastleVO.java
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

public class CastleVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1167769304403676751L;

    /**
     * 성정보코드
     */
    @NotBlank
    @Length(max=10)
    private String cstlCd;

    /**
     * 성정보명
     */
    @NotBlank
    @Length(max=128)
    private String cstlNm;

    /**
     * 성 코드
     */
    @NotBlank
    private String sungCd;

    /**
     * 성 이름
     */
    @NotBlank
    private String sungNm;


    /**
     * 도시 코드
     */
    @NotBlank
    private String cityCd;


    /**
     * 도시 이름
     */
    @NotBlank
    private String cityNm;

    /**
     * @return the cstlCd
     */
    public String getCstlCd() {
        return cstlCd;
    }

    /**
     * @param cstlCd the cstlCd to set
     */
    public void setCstlCd(String cstlCd) {
        this.cstlCd = cstlCd;
    }

    /**
     * @return the cstlNm
     */
    public String getCstlNm() {
        return cstlNm;
    }

    /**
     * @param cstlNm the cstlNm to set
     */
    public void setCstlNm(String cstlNm) {
        this.cstlNm = cstlNm;
    }

    /**
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }

    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }

    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }

    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }

    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }

}
