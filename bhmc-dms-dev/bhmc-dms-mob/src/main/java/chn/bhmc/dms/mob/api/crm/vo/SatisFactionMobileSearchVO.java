package chn.bhmc.dms.mob.api.crm.vo;

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
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 일련번호
     **/
    private int sSeq;

    /**
     * 설문템플릿일련번호
     **/
    private int sSubyTmplSeq;

    /**
     * 만족도조사결과일련번호
     **/
    private int sStsfIvstRsltSeq;

    /**
     * 조사유형
     **/
    private String sStsfIvstMthCd;

    /**
     * 답변유형
     **/
    private String sQestTp; // M : 단답형, 다답형 / C : 주관식

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
     * @return the sStsfIvstRsltSeq
     */
    public int getsStsfIvstRsltSeq() {
        return sStsfIvstRsltSeq;
    }





    /**
     * @param sStsfIvstRsltSeq the sStsfIvstRsltSeq to set
     */
    public void setsStsfIvstRsltSeq(int sStsfIvstRsltSeq) {
        this.sStsfIvstRsltSeq = sStsfIvstRsltSeq;
    }





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
     * @return the sQestTp
     */
    public String getsQestTp() {
        return sQestTp;
    }





    /**
     * @param sQestTp the sQestTp to set
     */
    public void setsQestTp(String sQestTp) {
        this.sQestTp = sQestTp;
    }





    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
