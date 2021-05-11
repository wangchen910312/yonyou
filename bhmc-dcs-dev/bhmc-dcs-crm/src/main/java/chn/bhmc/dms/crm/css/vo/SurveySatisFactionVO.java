package chn.bhmc.dms.crm.css.vo;

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
    private  int qestWgtVal;
    private  String qestTpCd;
    private  String answCont;
    private  int answScoreVal;
    private  String usrNm;
    private  int tmplResultCnt;




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



    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }


}