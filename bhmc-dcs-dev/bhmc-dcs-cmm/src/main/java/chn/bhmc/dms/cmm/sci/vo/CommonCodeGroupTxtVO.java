package chn.bhmc.dms.cmm.sci.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeGroupTxtVO.java
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


public class CommonCodeGroupTxtVO extends BaseVO {


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
     * 언어코드
     */

    private String langCd;


    /**
     * 공통코드그룹명텍스트
     */

    private String cmmGrpCdTxt;

    /**
     * 비고 제목 명
     */

    private String remarkTitleNm;



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
     * @return the cmmGrpCdNmTxt
     */
    public String getCmmGrpCdTxt() {
        return cmmGrpCdTxt;
    }

    /**
     * @param cmmGrpCdNmTxt the cmmGrpCdNmTxt to set
     */
    public void setCmmGrpCdTxt(String cmmGrpCdTxt) {
        this.cmmGrpCdTxt = cmmGrpCdTxt;
    }

    /**
     * @param remarkTitleNm the remarkTitleNm to set
     */
    public void setRemarkTitleNm(String remarkTitleNm) {
        this.remarkTitleNm = remarkTitleNm;
    }

    /**
     * @return the remarkTitleNm
     */
    public String getRemarkTitleNm() {
        return remarkTitleNm;
    }


}
