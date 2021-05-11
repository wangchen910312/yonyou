package chn.bhmc.dms.crm.css.vo;

import javax.validation.constraints.Min;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
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

public class SurveyQuestionVO extends BaseVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1998121694837476766L;

    /**
     * 딜러코드
     **/
    private  String dlrCd;

    /**
    * 설문템플릿일련번호
    **/
    private  int subyTmplSeq;

    /**
    * 설문템플릿 질문 일련번호
    **/
    private  int subyTmplQestSeq;

    /**
    * 질문내용
    **/
    @NotEmpty
    private  String qestCont;

    /**
    * 질문가중치값
    **/
    @Min(value=0)
    private  double qestWgtVal;

    /**
    * 질문유형코드
    **/
    @NotEmpty
    private  String qestTpCd;

    /**
    * 답변선택개수
    **/
    private  int answSelCnt;

    /**
    * 정렬순서
    **/
//    @NotNull
    @Min(value=0)
    private  int sortOrder;


    /**
    * 비고
    **/
    private  String remark;



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



    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }



    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }


}