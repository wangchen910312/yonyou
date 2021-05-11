package chn.bhmc.dms.mob.api.crm.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 설문 템플릿 관리  VO
 *
 * @ClassName   : SurveySatisFactionVO.java
 * @Description : SurveySatisFactionVO Class
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

public class SurveySatisFactionVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3188081763197962994L;

    /**
    * 설문템플릿 일련번호
    **/
    private  int subyTmplSeq;

    /**
    * 설문템플릿 명
    **/
    @NotEmpty
    @Length(min=1, max=100)
    private  String subyTmplNm;

    /**
    * 삭제여부(현제 사용여부로사용함)
    **/
    @NotEmpty
    private  String delYn;

    /**
     * 딜러코드
     **/
    private  String dlrCd;

    /* 설문 미리보기로 인하여 하단 추가 */
    private  int subyTmplQestSeq;
    private  String qestNum;
    private  int itemSeq;
    private  String qestCont;
    private  double qestWgtVal;
    private  String qestTpCd;
    private  String answCont;
    private  double answScoreVal;
    private  String usrNm;
    private  int tmplResultCnt;
    private  int answSelCnt;

    private int resultCnt;                 //만족도결과 참여인원
    private int resultPer;                 //만족도결과 참여퍼센트
    private int sortOrder;                 //만족도결과 참여퍼센트




    /**
     * @return the subyTmplQestSeq
     */
    public int getSubyTmplQestSeq() {
        return subyTmplQestSeq;
    }



    /**
     * @param subyTmplQestSeq the subyTmplQestSeq to set
     */
    public void setSubyTmplQestSeq(int subyTmplQestSeq) {
        this.subyTmplQestSeq = subyTmplQestSeq;
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
     * @return the subyTmplNm
     */
    public String getSubyTmplNm() {
        return subyTmplNm;
    }



    /**
     * @param subyTmplNm the subyTmplNm to set
     */
    public void setSubyTmplNm(String subyTmplNm) {
        this.subyTmplNm = subyTmplNm;
    }



    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }



    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }



    /**
     * @return the qestNum
     */
    public String getQestNum() {
        return qestNum;
    }



    /**
     * @param qestNum the qestNum to set
     */
    public void setQestNum(String qestNum) {
        this.qestNum = qestNum;
    }



    /**
     * @return the itemSeq
     */
    public int getItemSeq() {
        return itemSeq;
    }



    /**
     * @param itemSeq the itemSeq to set
     */
    public void setItemSeq(int itemSeq) {
        this.itemSeq = itemSeq;
    }



    /**
     * @return the qestCont
     */
    public String getQestCont() {
        return qestCont;
    }



    /**
     * @param qestCont the qestCont to set
     */
    public void setQestCont(String qestCont) {
        this.qestCont = qestCont;
    }



    /**
     * @return the qestWgtVal
     */
    public double getQestWgtVal() {
        return qestWgtVal;
    }



    /**
     * @param qestWgtVal the qestWgtVal to set
     */
    public void setQestWgtVal(double qestWgtVal) {
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
     * @return the answCont
     */
    public String getAnswCont() {
        return answCont;
    }



    /**
     * @param answCont the answCont to set
     */
    public void setAnswCont(String answCont) {
        this.answCont = answCont;
    }



    /**
     * @return the answScoreVal
     */
    public double getAnswScoreVal() {
        return answScoreVal;
    }



    /**
     * @param answScoreVal the answScoreVal to set
     */
    public void setAnswScoreVal(double answScoreVal) {
        this.answScoreVal = answScoreVal;
    }



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
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }



    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }



    /**
     * @return the tmplResultCnt
     */
    public int getTmplResultCnt() {
        return tmplResultCnt;
    }



    /**
     * @param tmplResultCnt the tmplResultCnt to set
     */
    public void setTmplResultCnt(int tmplResultCnt) {
        this.tmplResultCnt = tmplResultCnt;
    }



    /**
     * @return the answSelCnt
     */
    public int getAnswSelCnt() {
        return answSelCnt;
    }



    /**
     * @param answSelCnt the answSelCnt to set
     */
    public void setAnswSelCnt(int answSelCnt) {
        this.answSelCnt = answSelCnt;
    }





    /**
     * @return the resultCnt
     */
    public int getResultCnt() {
        return resultCnt;
    }



    /**
     * @param resultCnt the resultCnt to set
     */
    public void setResultCnt(int resultCnt) {
        this.resultCnt = resultCnt;
    }



    /**
     * @return the resultPer
     */
    public int getResultPer() {
        return resultPer;
    }



    /**
     * @param resultPer the resultPer to set
     */
    public void setResultPer(int resultPer) {
        this.resultPer = resultPer;
    }





    /**
     * @return the sortOrder
     */
    public int getSortOrder() {
        return sortOrder;
    }



    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }



    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }


}