package chn.bhmc.dms.crm.css.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionMobileVO.java
 * @Description : 만족도 조사를 진행합니다.
 * @author hyun ho kim
 * @since 2016. 3. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since author     description
 *  ===========    =============    ===========================
 *  2016. 3. 17.     hyun ho kim     최초 생성
 * </pre>
 */

public class SatisFactionMobileVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4985905799299172343L;


     /**
     * 딜러코드
     **/
     private  String dlrCd;

     /**
     * 일련번호
     **/
     private  int seq;

     /**
     * 만족도조사결과일련번호
     **/
     private  int stsfIvstRsltSeq;

     /**
     * 만족도조사일련번호
     **/
     private  int stsfIvstSeq;

     /**
     * 설문템플릿일련번호
     **/
     private  int subyTmplSeq;

     /**
     * 질문일련번호
     **/
     private  int qestSeq;

     /**
     * 답변일련번호
     **/
     private  int answSeq;

     /**
     * 답변점수값
     **/
     private  int answScoreVal;

     /**
     * 주관식답변내용
     **/
     private  String sbjvAnswCont;

     /**
     * 질문가중치값
     **/
     private  int qestWgtVal;

     /**
     * 질문유형코드
     **/
     private  String qestTpCd;

     /**
     * 고객번호
     **/
     private  String custNo;

     /*
      * 추가
      */
     private String cmplReasonCont; //불만족 원인
     private String custNm; //고객명



    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }




    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }




    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }




    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }




    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }




    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }




    /**
     * @return the stsfIvstRsltSeq
     */
    public int getStsfIvstRsltSeq() {
        return stsfIvstRsltSeq;
    }




    /**
     * @param stsfIvstRsltSeq the stsfIvstRsltSeq to set
     */
    public void setStsfIvstRsltSeq(int stsfIvstRsltSeq) {
        this.stsfIvstRsltSeq = stsfIvstRsltSeq;
    }




    /**
     * @return the stsfIvstSeq
     */
    public int getStsfIvstSeq() {
        return stsfIvstSeq;
    }




    /**
     * @param stsfIvstSeq the stsfIvstSeq to set
     */
    public void setStsfIvstSeq(int stsfIvstSeq) {
        this.stsfIvstSeq = stsfIvstSeq;
    }




    /**
     * @return the subyTmplSeq
     */
    public int getSubyTmplSeq() {
        return subyTmplSeq;
    }




    /**
     * @param subyTmplSeq the subyTmplSeq to set
     */
    public void setSubyTmplSeq(int subyTmplSeq) {
        this.subyTmplSeq = subyTmplSeq;
    }




    /**
     * @return the qestSeq
     */
    public int getQestSeq() {
        return qestSeq;
    }




    /**
     * @param qestSeq the qestSeq to set
     */
    public void setQestSeq(int qestSeq) {
        this.qestSeq = qestSeq;
    }




    /**
     * @return the answSeq
     */
    public int getAnswSeq() {
        return answSeq;
    }




    /**
     * @param answSeq the answSeq to set
     */
    public void setAnswSeq(int answSeq) {
        this.answSeq = answSeq;
    }




    /**
     * @return the answScoreVal
     */
    public int getAnswScoreVal() {
        return answScoreVal;
    }




    /**
     * @param answScoreVal the answScoreVal to set
     */
    public void setAnswScoreVal(int answScoreVal) {
        this.answScoreVal = answScoreVal;
    }




    /**
     * @return the sbjvAnswCont
     */
    public String getSbjvAnswCont() {
        return sbjvAnswCont;
    }




    /**
     * @param sbjvAnswCont the sbjvAnswCont to set
     */
    public void setSbjvAnswCont(String sbjvAnswCont) {
        this.sbjvAnswCont = sbjvAnswCont;
    }




    /**
     * @return the qestWgtVal
     */
    public int getQestWgtVal() {
        return qestWgtVal;
    }




    /**
     * @param qestWgtVal the qestWgtVal to set
     */
    public void setQestWgtVal(int qestWgtVal) {
        this.qestWgtVal = qestWgtVal;
    }




    /**
     * @return the qestTpCd
     */
    public String getQestTpCd() {
        return qestTpCd;
    }




    /**
     * @param qestTpCd the qestTpCd to set
     */
    public void setQestTpCd(String qestTpCd) {
        this.qestTpCd = qestTpCd;
    }




    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }




    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }




    /**
     * @return the cmplReasonCont
     */
    public String getCmplReasonCont() {
        return cmplReasonCont;
    }




    /**
     * @param cmplReasonCont the cmplReasonCont to set
     */
    public void setCmplReasonCont(String cmplReasonCont) {
        this.cmplReasonCont = cmplReasonCont;
    }




    /*
       * @see java.lang.Object#toString()
       */
      @Override
      public String toString() {
          return ReflectionToStringBuilder.toString(this);
      }
}
