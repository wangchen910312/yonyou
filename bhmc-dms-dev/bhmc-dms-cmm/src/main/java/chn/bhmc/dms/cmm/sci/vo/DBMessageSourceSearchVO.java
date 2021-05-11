package chn.bhmc.dms.cmm.sci.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DBMessageSourceSearchVO.java
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

public class DBMessageSourceSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 번들명
     */
    private String sBundleNm;

    /**
     * 메세지키
     */
    private String sMesgKey;

    /**
     * 메세지
     */
    private String sMesgTxt;

    /**
     * 사용여부
     */
    private String sUseYn = "Y";

    /**
     * @return the sBundleNm
     */
    public String getsBundleNm() {
        return sBundleNm;
    }
    /**
     * @param sBundleNm the sBundleNm to set
     */
    public void setsBundleNm(String sBundleNm) {
        this.sBundleNm = sBundleNm;
    }
    /**
     * @return the sMesgKey
     */
    public String getsMesgKey() {
        return sMesgKey;
    }
    /**
     * @param sMesgKey the sMesgKey to set
     */
    public void setsMesgKey(String sMesgKey) {
        this.sMesgKey = sMesgKey;
    }
    /**
     * @return the sMesgTxt
     */
    public String getsMesgTxt() {
        return sMesgTxt;
    }
    /**
     * @param sMesgTxt the sMesgTxt to set
     */
    public void setsMesgTxt(String sMesgTxt) {
        this.sMesgTxt = sMesgTxt;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }
    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
