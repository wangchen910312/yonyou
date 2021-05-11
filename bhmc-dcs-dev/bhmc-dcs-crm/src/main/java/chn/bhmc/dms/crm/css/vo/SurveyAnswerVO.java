package chn.bhmc.dms.crm.css.vo;

import javax.validation.constraints.Min;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 설문 보기 관리  VO
 *
 * @ClassName   : SurveyAnswerVO.java
 * @Description : SurveyAnswerVO Class
 * @author hyun ho kim
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since author     description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     hyun ho kim     최초 생성
 * </pre>
 */


public class SurveyAnswerVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */

    private static final long serialVersionUID = -1525141658879024332L;

        /**
         * 딜러코드
         **/
        private  String dlrCd;

        /**
        * 설문템플릿일련번호
        **/
        //@NotEmpty
        private  int      subyTmplSeq;

        /**
        * 설문템플릿질문일련번호
        **/
        //@NotEmpty
        private  int      subyTmplQestSeq;

        /**
        * 일련번호
        **/
        //@NotEmpty
        private  int      itemSeq;

        /**
        * 문항내용
        **/
        @NotEmpty
        private  String   answCont;

        /**
        * 문항점수값
        **/
        @Min(value = 0)
        private  int      answScoreVal;

        /**
        * 정렬순서
        **/
        @Min(value = 0)
        private  int      sortOrder;

        /**
         * 비고
         **/
        private  String   remark;




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