package chn.bhmc.dms.crm.dmm.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpeciaslPointVO.java
 * @Description : 특별포인트 VO
 * @author Kim Hyun Ho
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"             , mesgKey="crm.lbl.dlrCd")
    ,@ValidField(field="seq"               , mesgKey="crm.lbl.seq")
    ,@ValidField(field="membershipNo"      , mesgKey="crm.lbl.membershipNo")
    ,@ValidField(field="providePointVal"   , mesgKey="crm.lbl.providePointVal")
    ,@ValidField(field="provideReasonCont" , mesgKey="crm.lbl.provideReasonCont")
    ,@ValidField(field="signDocNo"         , mesgKey="crm.lbl.signDocNo")
    })

public class SpecialPointVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7064760887488897653L;

        /**
        * 딜러코드
        **/
        private  String             dlrCd;

        /**
        * 일련번호
        **/
        private  int                seq;

        /**
        * 멤버쉽번호
        **/
        @NotEmpty
        private  String             membershipNo;

        /**
        * 부여포인트값
        **/
        @NotEmpty
        private  Double                providePointVal;


        private  String                providePointVal2;

        /**
        * 부여사유내용
        **/
        @NotEmpty
        private  String             provideReasonCont;
        /**
        * 결제문서번호
        **/
        private  String             signDocNo;

        /*
         * [TODO] 추가
         */

        private String cardNo; //카드번호
        private String cardTpCd; //카드유형코드
        private String regUsrNm; //등록자명
        private String pointCd; //포인트출처
        private String pointTp; //포인트유형

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
         * @return the providePointVal
         */
        public Double getProvidePointVal() {
            return providePointVal;
        }
        /**
         * @param providePointVal the providePointVal to set
         */
        public void setProvidePointVal(Double providePointVal) {
            this.providePointVal = providePointVal;
        }
        /**
         * @return the provideReasonCont
         */
        public String getProvideReasonCont() {
            return provideReasonCont;
        }
        /**
         * @param provideReasonCont the provideReasonCont to set
         */
        public void setProvideReasonCont(String provideReasonCont) {
            this.provideReasonCont = provideReasonCont;
        }
        /**
         * @return the signDocNo
         */
        public String getSignDocNo() {
            return signDocNo;
        }
        /**
         * @param signDocNo the signDocNo to set
         */
        public void setSignDocNo(String signDocNo) {
            this.signDocNo = signDocNo;
        }


        /**
         * @return the cardNo
         */
        public String getCardNo() {
            return cardNo;
        }
        /**
         * @param cardNo the cardNo to set
         */
        public void setCardNo(String cardNo) {
            this.cardNo = cardNo;
        }
        /**
         * @return the cardTpCd
         */
        public String getCardTpCd() {
            return cardTpCd;
        }
        /**
         * @param cardTpCd the cardTpCd to set
         */
        public void setCardTpCd(String cardTpCd) {
            this.cardTpCd = cardTpCd;
        }
        /**
         * @return the regUsrNm
         */
        public String getRegUsrNm() {
            return regUsrNm;
        }
        /**
         * @param regUsrNm the regUsrNm to set
         */
        public void setRegUsrNm(String regUsrNm) {
            this.regUsrNm = regUsrNm;
        }

        /**
         * @return the pointCd
         */
        public String getPointCd() {
            return pointCd;
        }
        /**
         * @param pointCd the pointCd to set
         */
        public void setPointCd(String pointCd) {
            this.pointCd = pointCd;
        }
        /**
         * @return the pointTp
         */
        public String getPointTp() {
            return pointTp;
        }
        /**
         * @param pointTp the pointTp to set
         */
        public void setPointTp(String pointTp) {
            this.pointTp = pointTp;
        }

        /**
         * @return the providePointVal2
         */
        public String getProvidePointVal2() {
            return providePointVal2;
        }
        /**
         * @param providePointVal2 the providePointVal2 to set
         */
        public void setProvidePointVal2(String providePointVal2) {
            this.providePointVal2 = providePointVal2;
        }
        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }


}
