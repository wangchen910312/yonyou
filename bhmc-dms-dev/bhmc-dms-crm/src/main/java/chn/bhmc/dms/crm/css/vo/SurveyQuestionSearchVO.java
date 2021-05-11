package chn.bhmc.dms.crm.css.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 설문 질문 관리 SearchVO
 *
 * @ClassName   : SurveyQuestionSearchVO.java
 * @Description : SurveyQuestionSearchVO Class
 * @author hyun ho kim
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     hyun ho kim     최초 생성
 * </pre>
 */

public class SurveyQuestionSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -594472247085063683L;

    /**
     * 딜러코드
     **/
    private  String                sDlrCd;

    /**
     * 사업장코드
     **/
    private  String                sPltCd;

    /**
    * 설문템플릿일련번호
    **/
    private  int          sSubyTmplSeq;

    /**
    * 설문템플릿 질문 일련번호
    **/
    private  int          sSubyTmplQestSeq;
    private  String       sQestTp;      // M : 단답형, 다답형 / C : 주관식


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
     * @return the sSubyTmplQestSeq
     */
    public int getsSubyTmplQestSeq() {
        return sSubyTmplQestSeq;
    }


    /**
     * @param sSubyTmplQestSeq the sSubyTmplQestSeq to set
     */
    public void setsSubyTmplQestSeq(int sSubyTmplQestSeq) {
        this.sSubyTmplQestSeq = sSubyTmplQestSeq;
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