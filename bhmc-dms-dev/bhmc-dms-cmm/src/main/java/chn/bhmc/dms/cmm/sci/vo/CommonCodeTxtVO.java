package chn.bhmc.dms.cmm.sci.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeTxtVO.java
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


public class CommonCodeTxtVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    /**
     * 공통코드그룹코드
     */
    @NotBlank
    private String cmmGrpCd;

    /**
     * 공통코드
     */

    private String cmmCd;

    /**
     * 언어코드
     */

    private String langCd;


    /**
     * 공통코드텍스트
     */

    private String cmmCdTxt;

    /**
     * @return the cmmGrpCd
     */
    public String getCmmGrpCd() {
        return cmmGrpCd;
    }

    /**
     * @param cmmGrpCd the cmmGrpCd to set
     */
    public void setCmmGrpCd(String cmmGrpCd) {
        this.cmmGrpCd = cmmGrpCd;
    }

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @return the cmmCdTxt
     */
    public String getCmmCdTxt() {
        return cmmCdTxt;
    }

    /**
     * @param cmmCdTxt the cmmCdTxt to set
     */
    public void setCmmCdTxt(String cmmCdTxt) {
        this.cmmCdTxt = cmmCdTxt;
    }

    /**
     * @param cmmCd the cmmCd to set
     */
    public void setCmmCd(String cmmCd) {
        this.cmmCd = cmmCd;
    }

    /**
     * @return the cmmCd
     */
    public String getCmmCd() {
        return cmmCd;
    }


}
