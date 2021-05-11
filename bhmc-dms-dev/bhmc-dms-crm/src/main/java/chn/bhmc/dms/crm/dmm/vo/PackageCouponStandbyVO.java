package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponStandbyVO.java
 * @Description : 무료 패키지쿠폰 결재VO
 * @author Kim Hyun Ho
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.     Kim Hyun Ho     최초 생성
 * </pre>
 */

    @ValidDescriptor({
    @ValidField(field="dlrCd"         , mesgKey="crm.lbl.dlrCd")
    ,@ValidField(field="cupnPrenSeq"   , mesgKey="crm.lbl.cupnPrenSeq")
    ,@ValidField(field="membershipNo"  , mesgKey="crm.lbl.membershipNo")
    ,@ValidField(field="signDocNo"     , mesgKey="crm.lbl.signDocNo")
    ,@ValidField(field="pkgSeq"        , mesgKey="crm.lbl.pkgSeq")
    ,@ValidField(field="pkgNm"         , mesgKey="crm.lbl.pkgNm")
    ,@ValidField(field="pkgAmt"        , mesgKey="crm.lbl.pkgAmt")
    ,@ValidField(field="pkgCont"       , mesgKey="crm.lbl.pkgCont")
    ,@ValidField(field="cupnSeq"       , mesgKey="crm.lbl.cupnSeq")
    ,@ValidField(field="cupnNo"        , mesgKey="crm.lbl.cupnNo")
    ,@ValidField(field="cupnNm"        , mesgKey="crm.lbl.cupnNm")
    ,@ValidField(field="cupnCont"      , mesgKey="crm.lbl.cupnCont")
    ,@ValidField(field="cupnExtcDt"    , mesgKey="crm.lbl.cupnExtcDt")
    ,@ValidField(field="cupnValidPrid" , mesgKey="crm.lbl.cupnValidPrid")
    ,@ValidField(field="regUsrId"      , mesgKey="crm.lbl.regUsrId")
    ,@ValidField(field="regDt"         , mesgKey="crm.lbl.regDt")
    ,@ValidField(field="updtUsrId"     , mesgKey="crm.lbl.updtUsrId")
    ,@ValidField(field="updtDt"        , mesgKey="crm.lbl.updtDt")
    })
public class PackageCouponStandbyVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3869153199688277155L;


        /**
        * 딜러코드
        **/
        private  String         dlrCd;

        /**
        * 쿠폰증정일련번호
        **/
        private  int            cupnPrenSeq;

        /**
        * 멤버쉽번호
        **/
        private  String         membershipNo;

        /**
        * 결제문서번호
        **/
        private  String         signDocNo;

        /**
        * 패키지일련번호
        **/
        private  int            pkgSeq;

        /**
        * 패키지명
        **/
        private  String         pkgNm;

        /**
        * 패키지금액
        **/
        private  int            pkgAmt;

        /**
        * 패키지내용
        **/
        private  String         pkgCont;

        /**
        * 쿠폰일련번호
        **/
        private  int            cupnSeq;

        /**
        * 쿠폰번호
        **/
        private  String         cupnNo;

        /**
        * 쿠폰명
        **/
        private  String         cupnNm;

        /**
        * 쿠폰내용
        **/
        private  String         cupnCont;

        /**
        * 쿠폰소멸일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date           cupnExtcDt;

        /**
        * 쿠폰유효기간
        **/
        private  int            cupnValidPrid;



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
         * @return the cupnPrenSeq
         */
        public int getCupnPrenSeq() {
            return cupnPrenSeq;
        }



        /**
         * @param cupnPrenSeq the cupnPrenSeq to set
         */
        public void setCupnPrenSeq(int cupnPrenSeq) {
            this.cupnPrenSeq = cupnPrenSeq;
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
         * @return the pkgSeq
         */
        public int getPkgSeq() {
            return pkgSeq;
        }



        /**
         * @param pkgSeq the pkgSeq to set
         */
        public void setPkgSeq(int pkgSeq) {
            this.pkgSeq = pkgSeq;
        }



        /**
         * @return the pkgNm
         */
        public String getPkgNm() {
            return pkgNm;
        }



        /**
         * @param pkgNm the pkgNm to set
         */
        public void setPkgNm(String pkgNm) {
            this.pkgNm = pkgNm;
        }



        /**
         * @return the pkgAmt
         */
        public int getPkgAmt() {
            return pkgAmt;
        }



        /**
         * @param pkgAmt the pkgAmt to set
         */
        public void setPkgAmt(int pkgAmt) {
            this.pkgAmt = pkgAmt;
        }



        /**
         * @return the pkgCont
         */
        public String getPkgCont() {
            return pkgCont;
        }



        /**
         * @param pkgCont the pkgCont to set
         */
        public void setPkgCont(String pkgCont) {
            this.pkgCont = pkgCont;
        }



        /**
         * @return the cupnSeq
         */
        public int getCupnSeq() {
            return cupnSeq;
        }



        /**
         * @param cupnSeq the cupnSeq to set
         */
        public void setCupnSeq(int cupnSeq) {
            this.cupnSeq = cupnSeq;
        }



        /**
         * @return the cupnNo
         */
        public String getCupnNo() {
            return cupnNo;
        }



        /**
         * @param cupnNo the cupnNo to set
         */
        public void setCupnNo(String cupnNo) {
            this.cupnNo = cupnNo;
        }



        /**
         * @return the cupnNm
         */
        public String getCupnNm() {
            return cupnNm;
        }



        /**
         * @param cupnNm the cupnNm to set
         */
        public void setCupnNm(String cupnNm) {
            this.cupnNm = cupnNm;
        }



        /**
         * @return the cupnCont
         */
        public String getCupnCont() {
            return cupnCont;
        }



        /**
         * @param cupnCont the cupnCont to set
         */
        public void setCupnCont(String cupnCont) {
            this.cupnCont = cupnCont;
        }



        /**
         * @return the cupnExtcDt
         */
        public Date getCupnExtcDt() {
            return cupnExtcDt;
        }



        /**
         * @param cupnExtcDt the cupnExtcDt to set
         */
        public void setCupnExtcDt(Date cupnExtcDt) {
            this.cupnExtcDt = cupnExtcDt;
        }



        /**
         * @return the cupnValidPrid
         */
        public int getCupnValidPrid() {
            return cupnValidPrid;
        }



        /**
         * @param cupnValidPrid the cupnValidPrid to set
         */
        public void setCupnValidPrid(int cupnValidPrid) {
            this.cupnValidPrid = cupnValidPrid;
        }



        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }
}
