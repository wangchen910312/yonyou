package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeTxtSearchVO.java
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

public class CommonCodeTxtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;


    /**
     * 공통코드그룹코드
     */
    private String sCmmGrpCd;

    /**
     * 공통코드
     */

    private String sCmmCd;


    /**
     * 언어코드
     */

    private String sLangCd;

    /**
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }

    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }

    /**
     * 공통코드그룹명
     */

    private String sCmmGrpCdNmTxt;


    /**
     * @return the sCmmGrpCd
     */
    public String getsCmmGrpCd() {
        return sCmmGrpCd;
    }

    /**
     * @param sCmmGrpCd the sCmmGrpCd to set
     */
    public void setsCmmGrpCd(String sCmmGrpCd) {
        this.sCmmGrpCd = sCmmGrpCd;
    }

    /**
     * @return the sCmmGrpCdNmTxt
     */
    public String getsCmmGrpCdNmTxt() {
        return sCmmGrpCdNmTxt;
    }

    /**
     * @param sCmmGrpCdNmTxt the sCmmGrpCdNmTxt to set
     */
    public void setsCmmGrpCdNmTxt(String sCmmGrpCdNmTxt) {
        this.sCmmGrpCdNmTxt = sCmmGrpCdNmTxt;
    }

    /**
     * @param sCmmCd the sCmmCd to set
     */
    public void setsCmmCd(String sCmmCd) {
        this.sCmmCd = sCmmCd;
    }

    /**
     * @return the sCmmCd
     */
    public String getsCmmCd() {
        return sCmmCd;
    }
}
