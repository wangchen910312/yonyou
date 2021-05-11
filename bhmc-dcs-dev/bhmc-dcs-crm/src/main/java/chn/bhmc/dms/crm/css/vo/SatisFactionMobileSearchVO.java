package chn.bhmc.dms.crm.css.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionMobileSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 03. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 15.     Kim Hyun Ho     최초 생성
 * </pre>
 */
public class SatisFactionMobileSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 610174278359378819L;

    /**
     * 조사유형
     **/
    private  String sStsfIvstMthCd;

    /**
     * 설문템플릿일련번호
     **/
     private  int sSubyTmplSeq;

     /**
      * 일련번호
      **/
     private  int sSeq;

     /**
      * 딜러코드
      **/
     private  String                sDlrCd;

     /**
      * 사업장코드
      **/
     private  String                sPltCd;

    /**
     * @return the sStsfIvstMthCd
     */
    public String getsStsfIvstMthCd() {
        return sStsfIvstMthCd;
    }

    /**
     * @param sStsfIvstMthCd the sStsfIvstMthCd to set
     */
    public void setsStsfIvstMthCd(String sStsfIvstMthCd) {
        this.sStsfIvstMthCd = sStsfIvstMthCd;
    }

    /**
     * @return the sSubyTmplSeq
     */
    public int getsSubyTmplSeq() {
        return sSubyTmplSeq;
    }

    /**
     * @param sSubyTmplSeq the sSubyTmplSeq to set
     */
    public void setsSubyTmplSeq(int sSubyTmplSeq) {
        this.sSubyTmplSeq = sSubyTmplSeq;
    }

    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
