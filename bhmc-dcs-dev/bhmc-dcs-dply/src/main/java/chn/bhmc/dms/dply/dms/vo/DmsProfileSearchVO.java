package chn.bhmc.dms.dply.dms.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DmsProfileSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -9121474579253925863L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 딜러명
     */
    private String sDlrNm;


    /**
     *
     */
    private String sDeployTargYn;

    /**
    *
    */
   private String sLastAchkResCd;


    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrNm the sDlrNm to set
     */
    public void setsDlrNm(String sDlrNm) {
        this.sDlrNm = sDlrNm;
    }

    /**
     * @return the sDlrNm
     */
    public String getsDlrNm() {
        return sDlrNm;
    }

    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

    /**
     * @param sDeployTargYn the sDeployTargYn to set
     */
    public void setsDeployTargYn(String sDeployTargYn) {
        this.sDeployTargYn = sDeployTargYn;
    }

    /**
     * @return the sDeployTargYn
     */
    public String getsDeployTargYn() {
        return sDeployTargYn;
    }

    /**
     * @param sLastAchkResCd the sLastAchkResCd to set
     */
    public void setsLastAchkResCd(String sLastAchkResCd) {
        this.sLastAchkResCd = sLastAchkResCd;
    }

    /**
     * @return the sLastAchkResCd
     */
    public String getsLastAchkResCd() {
        return sLastAchkResCd;
    }

}
