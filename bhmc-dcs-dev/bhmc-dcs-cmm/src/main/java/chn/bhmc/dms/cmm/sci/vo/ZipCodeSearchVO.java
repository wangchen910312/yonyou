package chn.bhmc.dms.cmm.sci.vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ZipCodeSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ZipCodeSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 검색구분
     */
    @NotBlank
    private String sGubun;

    /**
     * 검색구분
     */
    @NotBlank
    private String sValue;

    /**
     * 우편번호
     */
    @NotBlank
    private String sZipCd;

    /**
     * 우편번호
     */
    @NotBlank
    private String sExtZipCd;

    /**
     * 성 코드
     */
    @Length(min=2, max=2)
    private String sSungCd;

    /**
     * 성 이름
     */
    @Length(min=2, max=2)
    private String sSungNm;


    /**
     * 도시 코드
     */
    @Length(min=0, max=2)
    private String sCityCd;


    /**
     * 도시 이름
     */
    @Length(min=0, max=2)
    private String sCityNm;

    /**
     * 지역명
     */
    @NotBlank
    private String sDistNm;

    /**
     * @return the sGubun
     */
    public String getsGubun() {
        return sGubun;
    }
    /**
     * @param sGubun the sGubun to set
     */
    public void setsGubun(String sGubun) {
        this.sGubun = sGubun;
    }
    /**
     * @return the sValue
     */
    public String getsValue() {
        return sValue;
    }
    /**
     * @param sValue the sValue to set
     */
    public void setsValue(String sValue) {
        this.sValue = sValue;
    }
    /**
     * @return the sZipCd
     */
    public String getsZipCd() {
        return sZipCd;
    }
    /**
     * @param sZipCd the sZipCd to set
     */
    public void setsZipCd(String sZipCd) {
        this.sZipCd = sZipCd;
    }
    /**
     * @return the sExtZipCd
     */
    public String getsExtZipCd() {
        return sExtZipCd;
    }
    /**
     * @param sExtZipCd the sExtZipCd to set
     */
    public void setsExtZipCd(String sExtZipCd) {
        this.sExtZipCd = sExtZipCd;
    }
    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }
    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
    }
    /**
     * @return the sSungNm
     */
    public String getsSungNm() {
        return sSungNm;
    }
    /**
     * @param sSungNm the sSungNm to set
     */
    public void setsSungNm(String sSungNm) {
        this.sSungNm = sSungNm;
    }
    /**
     * @return the sCityCd
     */
    public String getsCityCd() {
        return sCityCd;
    }
    /**
     * @param sCityCd the sCityCd to set
     */
    public void setsCityCd(String sCityCd) {
        this.sCityCd = sCityCd;
    }
    /**
     * @return the sCityNm
     */
    public String getsCityNm() {
        return sCityNm;
    }
    /**
     * @param sCityNm the sCityNm to set
     */
    public void setsCityNm(String sCityNm) {
        this.sCityNm = sCityNm;
    }
    /**
     * @return the sDistNm
     */
    public String getsDistNm() {
        return sDistNm;
    }
    /**
     * @param sDistNm the sDistNm to set
     */
    public void setsDistNm(String sDistNm) {
        this.sDistNm = sDistNm;
    }
}