package chn.bhmc.dms.crm.dmm.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CardIssueVO.java
 * @Description : 카드발급이력VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"       , mesgKey="CR_0813T.lbl.dlrCd")
    ,@ValidField(field="membershipNo", mesgKey="CR_0813T.lbl.membershipNo")
    ,@ValidField(field="cardTpCd"    , mesgKey="CR_0813T.lbl.cardTpCd")
    ,@ValidField(field="cardNo"      , mesgKey="CR_0813T.lbl.cardNo")
    ,@ValidField(field="useYn"       , mesgKey="CR_0813T.lbl.useYn")
    ,@ValidField(field="regUsrId"    , mesgKey="CR_0813T.lbl.regUsrId")
    ,@ValidField(field="regDt"       , mesgKey="CR_0813T.lbl.regDt")
    ,@ValidField(field="updtUsrId"   , mesgKey="CR_0813T.lbl.updtUsrId")
    ,@ValidField(field="updtDt"      , mesgKey="CR_0813T.lbl.updtDt")
    })
public class CardIssueVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 575831790489134688L;

        /**
        * 딜러코드
        **/
        private  String       dlrCd;

        /**
        * 멤버쉽번호
        **/
        private  String       membershipNo;

        /**
        * 카드유형코드
        **/
        private  String       cardTpCd;

        /**
        * 카드번호
        **/
        private  String       cardNo;

        /**
        * 사용여부
        **/
        private  String       useYn;


        /*
         * [TODO] 추가
         */
        private int occrPointVal;
        private String extcTargYn;
        private int realTotAmt;


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
         * @return the useYn
         */
        public String getUseYn() {
            return useYn;
        }



        /**
         * @param useYn the useYn to set
         */
        public void setUseYn(String useYn) {
            this.useYn = useYn;
        }





        /**
         * @return the occrPointVal
         */
        public int getOccrPointVal() {
            return occrPointVal;
        }



        /**
         * @param occrPointVal the occrPointVal to set
         */
        public void setOccrPointVal(int occrPointVal) {
            this.occrPointVal = occrPointVal;
        }



        /**
         * @return the extcTargYn
         */
        public String getExtcTargYn() {
            return extcTargYn;
        }



        /**
         * @param extcTargYn the extcTargYn to set
         */
        public void setExtcTargYn(String extcTargYn) {
            this.extcTargYn = extcTargYn;
        }



        /**
         * @return the realTotAmt
         */
        public int getRealTotAmt() {
            return realTotAmt;
        }



        /**
         * @param realTotAmt the realTotAmt to set
         */
        public void setRealTotAmt(int realTotAmt) {
            this.realTotAmt = realTotAmt;
        }



        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

}
