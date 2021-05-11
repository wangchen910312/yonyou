package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeMngVO.java
 * @Description : 멤버십 등급 설정VO.
 * @author Kim Hyun Ho
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipGradeMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3131011560224791800L;


        /**
        * 딜러코드
        **/
        private  String dlrCd;

        /**
        * 등급일련번호
        **/
        private  String gradeSeq;

        /**
        * 등급명
        **/
        @NotEmpty
        private  String gradeNm;

        /**
        * 방문시작횟수
        **/
        private  int vsitStartCnt;

        /**
        * 방문종료횟수
        **/
        private  int vsitEndCnt;

        /**
        * 방문조건코드
        **/
        private  String vsitTermCd;

        /**
        * 구매시작횟수
        **/
        private  int purcStartCnt;

        /**
        * 구매종료횟수
        **/
        private  int purcEndCnt;

        /**
        * 구매조건코드
        **/
        @NotEmpty
        private  String purcTermCd;

        /**
        * 구매시작금액
        **/
        private  int purcStartAmt;

        /**
        * 구매종료금액
        **/
        private  int purcEndAmt;

        /**
        * 구매조건금액코드
        **/
        @NotEmpty
        private  String purcTermAmtCd;

        /**
        * 충전시작금액
        **/
        private  int rchgStartAmt;

        /**
        * 충전종료금액
        **/
        private  int rchgEndAmt;

        /**
        * 적립율
        **/
        private  int accuRate;

        /**
         * 기준최근
         **/
        private  int stdPridMonth;

        /**
         * 등급순서
         **/
        private  int gradeOrderNo;

        /**
         * 정비공임할인율
         **/
        private  int serLbrDcRate;

        /**
         * 정비부품할인율
         **/
        private  int serParDcRate;

        /**
         * 정비총금액할인율
         **/
        private  int serTotDcRate;


        /**
        * 판매시작일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date saleStartDt;

        /**
        * 판매종료일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date saleEndDt;

        /**
        * 판매일자조건코드
        **/
        private  String saleEndDtCd;

        /**
        * 정비금액from
        **/
        private  int             serStartAmt;

        /**
        * 정비금액to
        **/
        private  int             serEndAmt;

        /**
        * 정비금액조건코드
        **/
        private  String          serAmtTermCd;

        /**
        * 정비시작건수
        **/
        private  int             serStartCnt;

        /**
        * 정비종료건수
        **/
        private  int             serEndCnt;

        /**
        * 정비건수조건코드
        **/
        private  String          serCntTermCd;

        /**
         *  //추가[TODO]
         */
        private  String saleStartDtStr;
        private  String saleEndDtStr;


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
         * @return the gradeSeq
         */
        public String getGradeSeq() {
            return gradeSeq;
        }



        /**
         * @param gradeSeq the gradeSeq to set
         */
        public void setGradeSeq(String gradeSeq) {
            this.gradeSeq = gradeSeq;
        }



        /**
         * @return the gradeNm
         */
        public String getGradeNm() {
            return gradeNm;
        }



        /**
         * @param gradeNm the gradeNm to set
         */
        public void setGradeNm(String gradeNm) {
            this.gradeNm = gradeNm;
        }



        /**
         * @return the vsitStartCnt
         */
        public int getVsitStartCnt() {
            return vsitStartCnt;
        }



        /**
         * @param vsitStartCnt the vsitStartCnt to set
         */
        public void setVsitStartCnt(int vsitStartCnt) {
            this.vsitStartCnt = vsitStartCnt;
        }



        /**
         * @return the vsitEndCnt
         */
        public int getVsitEndCnt() {
            return vsitEndCnt;
        }



        /**
         * @param vsitEndCnt the vsitEndCnt to set
         */
        public void setVsitEndCnt(int vsitEndCnt) {
            this.vsitEndCnt = vsitEndCnt;
        }



        /**
         * @return the vsitTermCd
         */
        public String getVsitTermCd() {
            return vsitTermCd;
        }



        /**
         * @param vsitTermCd the vsitTermCd to set
         */
        public void setVsitTermCd(String vsitTermCd) {
            this.vsitTermCd = vsitTermCd;
        }



        /**
         * @return the purcStartCnt
         */
        public int getPurcStartCnt() {
            return purcStartCnt;
        }



        /**
         * @param purcStartCnt the purcStartCnt to set
         */
        public void setPurcStartCnt(int purcStartCnt) {
            this.purcStartCnt = purcStartCnt;
        }



        /**
         * @return the purcEndCnt
         */
        public int getPurcEndCnt() {
            return purcEndCnt;
        }



        /**
         * @param purcEndCnt the purcEndCnt to set
         */
        public void setPurcEndCnt(int purcEndCnt) {
            this.purcEndCnt = purcEndCnt;
        }



        /**
         * @return the purcTermCd
         */
        public String getPurcTermCd() {
            return purcTermCd;
        }



        /**
         * @param purcTermCd the purcTermCd to set
         */
        public void setPurcTermCd(String purcTermCd) {
            this.purcTermCd = purcTermCd;
        }



        /**
         * @return the purcStartAmt
         */
        public int getPurcStartAmt() {
            return purcStartAmt;
        }



        /**
         * @param purcStartAmt the purcStartAmt to set
         */
        public void setPurcStartAmt(int purcStartAmt) {
            this.purcStartAmt = purcStartAmt;
        }



        /**
         * @return the purcEndAmt
         */
        public int getPurcEndAmt() {
            return purcEndAmt;
        }



        /**
         * @param purcEndAmt the purcEndAmt to set
         */
        public void setPurcEndAmt(int purcEndAmt) {
            this.purcEndAmt = purcEndAmt;
        }



        /**
         * @return the purcTermAmtCd
         */
        public String getPurcTermAmtCd() {
            return purcTermAmtCd;
        }



        /**
         * @param purcTermAmtCd the purcTermAmtCd to set
         */
        public void setPurcTermAmtCd(String purcTermAmtCd) {
            this.purcTermAmtCd = purcTermAmtCd;
        }



        /**
         * @return the rchgStartAmt
         */
        public int getRchgStartAmt() {
            return rchgStartAmt;
        }



        /**
         * @param rchgStartAmt the rchgStartAmt to set
         */
        public void setRchgStartAmt(int rchgStartAmt) {
            this.rchgStartAmt = rchgStartAmt;
        }



        /**
         * @return the rchgEndAmt
         */
        public int getRchgEndAmt() {
            return rchgEndAmt;
        }



        /**
         * @param rchgEndAmt the rchgEndAmt to set
         */
        public void setRchgEndAmt(int rchgEndAmt) {
            this.rchgEndAmt = rchgEndAmt;
        }



        /**
         * @return the accuRate
         */
        public int getAccuRate() {
            return accuRate;
        }



        /**
         * @param accuRate the accuRate to set
         */
        public void setAccuRate(int accuRate) {
            this.accuRate = accuRate;
        }




        /**
         * @return the stdPridMonth
         */
        public int getStdPridMonth() {
            return stdPridMonth;
        }



        /**
         * @param stdPridMonth the stdPridMonth to set
         */
        public void setStdPridMonth(int stdPridMonth) {
            this.stdPridMonth = stdPridMonth;
        }



        /**
         * @return the gradeOrderNo
         */
        public int getGradeOrderNo() {
            return gradeOrderNo;
        }



        /**
         * @param gradeOrderNo the gradeOrderNo to set
         */
        public void setGradeOrderNo(int gradeOrderNo) {
            this.gradeOrderNo = gradeOrderNo;
        }



        /**
         * @return the serLbrDcRate
         */
        public int getSerLbrDcRate() {
            return serLbrDcRate;
        }



        /**
         * @param serLbrDcRate the serLbrDcRate to set
         */
        public void setSerLbrDcRate(int serLbrDcRate) {
            this.serLbrDcRate = serLbrDcRate;
        }



        /**
         * @return the serParDcRate
         */
        public int getSerParDcRate() {
            return serParDcRate;
        }



        /**
         * @param serParDcRate the serParDcRate to set
         */
        public void setSerParDcRate(int serParDcRate) {
            this.serParDcRate = serParDcRate;
        }



        /**
         * @return the serTotDcRate
         */
        public int getSerTotDcRate() {
            return serTotDcRate;
        }



        /**
         * @param serTotDcRate the serTotDcRate to set
         */
        public void setSerTotDcRate(int serTotDcRate) {
            this.serTotDcRate = serTotDcRate;
        }



        /**
         * @return the saleStartDt
         */
        public Date getSaleStartDt() {
            return saleStartDt;
        }



        /**
         * @param saleStartDt the saleStartDt to set
         */
        public void setSaleStartDt(Date saleStartDt) {
            this.saleStartDt = saleStartDt;
        }



        /**
         * @return the saleEndDt
         */
        public Date getSaleEndDt() {
            return saleEndDt;
        }



        /**
         * @param saleEndDt the saleEndDt to set
         */
        public void setSaleEndDt(Date saleEndDt) {
            this.saleEndDt = saleEndDt;
        }




        /**
         * @return the saleEndDtCd
         */
        public String getSaleEndDtCd() {
            return saleEndDtCd;
        }



        /**
         * @param saleEndDtCd the saleEndDtCd to set
         */
        public void setSaleEndDtCd(String saleEndDtCd) {
            this.saleEndDtCd = saleEndDtCd;
        }



        /**
         * @return the saleStartDtStr
         */
        public String getSaleStartDtStr() {
            return saleStartDtStr;
        }



        /**
         * @param saleStartDtStr the saleStartDtStr to set
         */
        public void setSaleStartDtStr(String saleStartDtStr) {
            this.saleStartDtStr = saleStartDtStr;
        }



        /**
         * @return the saleEndDtStr
         */
        public String getSaleEndDtStr() {
            return saleEndDtStr;
        }



        /**
         * @param saleEndDtStr the saleEndDtStr to set
         */
        public void setSaleEndDtStr(String saleEndDtStr) {
            this.saleEndDtStr = saleEndDtStr;
        }



        /**
         * @return the serAmtTermCd
         */
        public String getSerAmtTermCd() {
            return serAmtTermCd;
        }



        /**
         * @param serAmtTermCd the serAmtTermCd to set
         */
        public void setSerAmtTermCd(String serAmtTermCd) {
            this.serAmtTermCd = serAmtTermCd;
        }



        /**
         * @return the serStartCnt
         */
        public int getSerStartCnt() {
            return serStartCnt;
        }



        /**
         * @param serStartCnt the serStartCnt to set
         */
        public void setSerStartCnt(int serStartCnt) {
            this.serStartCnt = serStartCnt;
        }



        /**
         * @return the serEndCnt
         */
        public int getSerEndCnt() {
            return serEndCnt;
        }



        /**
         * @param serEndCnt the serEndCnt to set
         */
        public void setSerEndCnt(int serEndCnt) {
            this.serEndCnt = serEndCnt;
        }



        /**
         * @return the serCntTermCd
         */
        public String getSerCntTermCd() {
            return serCntTermCd;
        }



        /**
         * @param serCntTermCd the serCntTermCd to set
         */
        public void setSerCntTermCd(String serCntTermCd) {
            this.serCntTermCd = serCntTermCd;
        }



        /**
         * @return the serStartAmt
         */
        public int getSerStartAmt() {
            return serStartAmt;
        }



        /**
         * @param serStartAmt the serStartAmt to set
         */
        public void setSerStartAmt(int serStartAmt) {
            this.serStartAmt = serStartAmt;
        }



        /**
         * @return the serEndAmt
         */
        public int getSerEndAmt() {
            return serEndAmt;
        }



        /**
         * @param serEndAmt the serEndAmt to set
         */
        public void setSerEndAmt(int serEndAmt) {
            this.serEndAmt = serEndAmt;
        }



        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

}
