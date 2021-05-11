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
 * @ClassName   : MembershipGradeChgVO.java
 * @Description : 멤버십 등급변경 VO.
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

public class MembershipGradeChgVO extends BaseVO {




        /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4235921367719768470L;

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

        /* 추가 */
        private String custNm; //고객명
        private String custNo; //고객일련번호
        private String gradeCd; //등급코드
        @NotEmpty
        private String membershipNo; //멤버십 일련번호
        @NotEmpty
        private String aftGradeCd; //예상회원등급
        private String befGradeCd; //이전등급
        private int vsitCnt; //방문횟수
        private int purcCnt; //구매횟수
        private int purcAmt; //구매금액
        private int rchgAmt; //충전금액
        private String applyYn; //적용여부

        /* 프로시저 결과 */
        private String result;

        /**
         * 멤버십 등급변경 일련번호
         **/
        private  int membershipGradeChgSeq;

        /**
         * 멤버십 등급변경 일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date membershipGradeChgDt;
        private  String membershipGradeChgDtStr;




        /**
         * @return the dlrCd
         */
        public String getDlrCd() {
            return dlrCd;
        }



        /**
         * @return the applyYn
         */
        public String getApplyYn() {
            return applyYn;
        }



        /**
         * @param applyYn the applyYn to set
         */
        public void setApplyYn(String applyYn) {
            this.applyYn = applyYn;
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
         * @return the membershipGradeChgSeq
         */
        public int getMembershipGradeChgSeq() {
            return membershipGradeChgSeq;
        }



        /**
         * @param membershipGradeChgSeq the membershipGradeChgSeq to set
         */
        public void setMembershipGradeChgSeq(int membershipGradeChgSeq) {
            this.membershipGradeChgSeq = membershipGradeChgSeq;
        }



        /**
         * @return the membershipGradeChgDt
         */
        public Date getMembershipGradeChgDt() {
            return membershipGradeChgDt;
        }



        /**
         * @param membershipGradeChgDt the membershipGradeChgDt to set
         */
        public void setMembershipGradeChgDt(Date membershipGradeChgDt) {
            this.membershipGradeChgDt = membershipGradeChgDt;
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
         * @return the gradeCd
         */
        public String getGradeCd() {
            return gradeCd;
        }



        /**
         * @param gradeCd the gradeCd to set
         */
        public void setGradeCd(String gradeCd) {
            this.gradeCd = gradeCd;
        }



        /**
         * @return the membershipNo
         */
        public String getMembershipNo() {
            return membershipNo;
        }



        /**
         * @param membershipNo the membershipNo to set
         */
        public void setMembershipNo(String membershipNo) {
            this.membershipNo = membershipNo;
        }



        /**
         * @return the aftGradeCd
         */
        public String getAftGradeCd() {
            return aftGradeCd;
        }



        /**
         * @param aftGradeCd the aftGradeCd to set
         */
        public void setAftGradeCd(String aftGradeCd) {
            this.aftGradeCd = aftGradeCd;
        }



        /**
         * @return the befGradeCd
         */
        public String getBefGradeCd() {
            return befGradeCd;
        }



        /**
         * @param befGradeCd the befGradeCd to set
         */
        public void setBefGradeCd(String befGradeCd) {
            this.befGradeCd = befGradeCd;
        }



        /**
         * @return the vsitCnt
         */
        public int getVsitCnt() {
            return vsitCnt;
        }



        /**
         * @param vsitCnt the vsitCnt to set
         */
        public void setVsitCnt(int vsitCnt) {
            this.vsitCnt = vsitCnt;
        }



        /**
         * @return the purcCnt
         */
        public int getPurcCnt() {
            return purcCnt;
        }



        /**
         * @param purcCnt the purcCnt to set
         */
        public void setPurcCnt(int purcCnt) {
            this.purcCnt = purcCnt;
        }



        /**
         * @return the purcAmt
         */
        public int getPurcAmt() {
            return purcAmt;
        }



        /**
         * @param purcAmt the purcAmt to set
         */
        public void setPurcAmt(int purcAmt) {
            this.purcAmt = purcAmt;
        }



        /**
         * @return the rchgAmt
         */
        public int getRchgAmt() {
            return rchgAmt;
        }



        /**
         * @param rchgAmt the rchgAmt to set
         */
        public void setRchgAmt(int rchgAmt) {
            this.rchgAmt = rchgAmt;
        }


        /**
         * @return the result
         */
        public String getResult() {
            return result;
        }



        /**
         * @param result the result to set
         */
        public void setResult(String result) {
            this.result = result;
        }



        /**
         * @return the membershipGradeChgDtStr
         */
        public String getMembershipGradeChgDtStr() {
            return membershipGradeChgDtStr;
        }



        /**
         * @param membershipGradeChgDtStr the membershipGradeChgDtStr to set
         */
        public void setMembershipGradeChgDtStr(String membershipGradeChgDtStr) {
            this.membershipGradeChgDtStr = membershipGradeChgDtStr;
        }



        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

}
