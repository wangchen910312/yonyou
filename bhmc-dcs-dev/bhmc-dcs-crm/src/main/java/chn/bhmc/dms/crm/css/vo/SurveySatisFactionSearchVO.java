package chn.bhmc.dms.crm.css.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 설문 템플릿 관리 SearchVO
 *
 * @ClassName   : SurveySatisFactionSearchVO.java
 * @Description : SurveySatisFactionSearchVO Class
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

public class SurveySatisFactionSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4033642692094550081L;

    /**
     * 만족도 조사 일련번호
     **/
     private  int sSeq;

     /**
     * 설문템플릿명
     **/
     private  String sSubyTmplNm;

     /**
     * 삭제여부
     **/
     private  String sDelYn;

     /**
     * 설문 템플릿 일련번호
     **/
     private  int sSubyTmplSeq;

     /**
      * 딜러코드
      **/
     private  String sDlrCd;

     /**
      * 사업장코드
      **/
     private  String sPltCd;


    /**
     * @return the sSubyTmplNm
     */
    public String getsSubyTmplNm() {
        return sSubyTmplNm;
    }


    /**
     * @param sSubyTmplNm the sSubyTmplNm to set
     */
    public void setsSubyTmplNm(String sSubyTmplNm) {
        this.sSubyTmplNm = sSubyTmplNm;
    }


    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }


    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
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