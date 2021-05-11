package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

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
 * @ClassName   : BlueMembershipJoinVO.java
 * @Description : 블루멤버십 가입신청 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="CR_0807T.lbl.dlrCd")
    ,@ValidField(field="custNo"          , mesgKey="CR_0807T.lbl.custNo")
    ,@ValidField(field="custNm"          , mesgKey="CR_0807T.lbl.custNm")
    ,@ValidField(field="custTp"          , mesgKey="CR_0807T.lbl.custTp")
    ,@ValidField(field="carOwnYn"        , mesgKey="CR_0807T.lbl.carOwnYn")
    ,@ValidField(field="hpNo"            , mesgKey="CR_0807T.lbl.hpNo")
    ,@ValidField(field="mathDocTp"       , mesgKey="CR_0807T.lbl.mathDocTp")
    ,@ValidField(field="ssnCrnNo"        , mesgKey="CR_0807T.lbl.ssnCrnNo")
    ,@ValidField(field="sungNm"          , mesgKey="CR_0807T.lbl.sungNm")
    ,@ValidField(field="cityNm"          , mesgKey="CR_0807T.lbl.cityNm")
    ,@ValidField(field="distNm"          , mesgKey="CR_0807T.lbl.distNm")
    ,@ValidField(field="zipCd"           , mesgKey="CR_0807T.lbl.zipCd")
    ,@ValidField(field="extZipCd"        , mesgKey="CR_0807T.lbl.extZipCd")
    ,@ValidField(field="addrNm"          , mesgKey="CR_0807T.lbl.addrNm")
    ,@ValidField(field="addrDetlCont"    , mesgKey="CR_0807T.lbl.addrDetlCont")
    ,@ValidField(field="joinDlrCd"       , mesgKey="CR_0807T.lbl.joinDlrCd")
    ,@ValidField(field="joinReqAgreeYn"  , mesgKey="CR_0807T.lbl.joinReqAgreeYn")
    ,@ValidField(field="policyAgreeYn"   , mesgKey="CR_0807T.lbl.policyAgreeYn")
    ,@ValidField(field="joinApproveYn"   , mesgKey="CR_0807T.lbl.joinApproveYn")
    ,@ValidField(field="joinApproveDt"   , mesgKey="CR_0807T.lbl.joinApproveDt")
    ,@ValidField(field="regUsrId"        , mesgKey="CR_0807T.lbl.regUsrId")
    ,@ValidField(field="regDt"           , mesgKey="CR_0807T.lbl.regDt")
    ,@ValidField(field="updtUsrId"       , mesgKey="CR_0807T.lbl.updtUsrId")
    ,@ValidField(field="updtDt"          , mesgKey="CR_0807T.lbl.updtDt")
    })
public class BlueMembershipJoinVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8817130645475573968L;

        /**
        * 딜러코드
        **/
        private  String           dlrCd;

        /**
        * 고객번호
        **/
        @NotEmpty
        private  String           custNo;

        /**
        * 고객명
        **/
        private  String           custNm;
        /**
        * 고객유형
        **/
        private  String           custTp;

        /**
        * 차량소유여부
        **/
        @NotEmpty
        private  String           carOwnYn;

        /**
        * 휴대폰번호
        **/
        private  String           hpNo;

        /**
        * 주요인증문서유형
        **/
        private  String           mathDocTp;

        /**
        * 주민사업자등록번호
        **/
        private  String           ssnCrnNo;

        /**
        * 성명
        **/
        private  String           sungNm;

        /**
        * 도시명
        **/
        private  String           cityNm;

        /**
        * 지역명
        **/
        private  String           distNm;

        /**
        * 우편번호
        **/
        private  String           zipCd;

        /**
        * 확장우편번호
        **/
        private  String           extZipCd;

        /**
        * 주소명
        **/
        private  String           addrNm;

        /**
        * 주소상세내용
        **/
        private  String           addrDetlCont;

        /**
        * 가입딜러코드
        **/
        private  String           joinDlrCd;

        /**
        * 가입요청동의여부
        **/
        @NotEmpty
        private  String           joinReqAgreeYn;

        /**
        * 정책동의여부
        **/
        @NotEmpty
        private  String           policyAgreeYn;

        /**
        * 가입승인여부
        **/
        @NotEmpty
        private  String           joinApproveYn;

        /**
        * 가입승인일자
        **/
        //JOIN_APPROVE_DT
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date             joinApproveDt;

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
         * @return the custTp
         */
        public String getCustTp() {
            return custTp;
        }

        /**
         * @param custTp the custTp to set
         */
        public void setCustTp(String custTp) {
            this.custTp = custTp;
        }

        /**
         * @return the carOwnYn
         */
        public String getCarOwnYn() {
            return carOwnYn;
        }

        /**
         * @param carOwnYn the carOwnYn to set
         */
        public void setCarOwnYn(String carOwnYn) {
            this.carOwnYn = carOwnYn;
        }

        /**
         * @return the hpNo
         */
        public String getHpNo() {
            return hpNo;
        }

        /**
         * @param hpNo the hpNo to set
         */
        public void setHpNo(String hpNo) {
            this.hpNo = hpNo;
        }

        /**
         * @return the mathDocTp
         */
        public String getMathDocTp() {
            return mathDocTp;
        }

        /**
         * @param mathDocTp the mathDocTp to set
         */
        public void setMathDocTp(String mathDocTp) {
            this.mathDocTp = mathDocTp;
        }

        /**
         * @return the ssnCrnNo
         */
        public String getSsnCrnNo() {
            return ssnCrnNo;
        }

        /**
         * @param ssnCrnNo the ssnCrnNo to set
         */
        public void setSsnCrnNo(String ssnCrnNo) {
            this.ssnCrnNo = ssnCrnNo;
        }

        /**
         * @return the sungNm
         */
        public String getSungNm() {
            return sungNm;
        }

        /**
         * @param sungNm the sungNm to set
         */
        public void setSungNm(String sungNm) {
            this.sungNm = sungNm;
        }

        /**
         * @return the cityNm
         */
        public String getCityNm() {
            return cityNm;
        }

        /**
         * @param cityNm the cityNm to set
         */
        public void setCityNm(String cityNm) {
            this.cityNm = cityNm;
        }

        /**
         * @return the distNm
         */
        public String getDistNm() {
            return distNm;
        }

        /**
         * @param distNm the distNm to set
         */
        public void setDistNm(String distNm) {
            this.distNm = distNm;
        }

        /**
         * @return the zipCd
         */
        public String getZipCd() {
            return zipCd;
        }

        /**
         * @param zipCd the zipCd to set
         */
        public void setZipCd(String zipCd) {
            this.zipCd = zipCd;
        }

        /**
         * @return the extZipCd
         */
        public String getExtZipCd() {
            return extZipCd;
        }

        /**
         * @param extZipCd the extZipCd to set
         */
        public void setExtZipCd(String extZipCd) {
            this.extZipCd = extZipCd;
        }

        /**
         * @return the addrNm
         */
        public String getAddrNm() {
            return addrNm;
        }

        /**
         * @param addrNm the addrNm to set
         */
        public void setAddrNm(String addrNm) {
            this.addrNm = addrNm;
        }

        /**
         * @return the addrDetlCont
         */
        public String getAddrDetlCont() {
            return addrDetlCont;
        }

        /**
         * @param addrDetlCont the addrDetlCont to set
         */
        public void setAddrDetlCont(String addrDetlCont) {
            this.addrDetlCont = addrDetlCont;
        }

        /**
         * @return the joinDlrCd
         */
        public String getJoinDlrCd() {
            return joinDlrCd;
        }

        /**
         * @param joinDlrCd the joinDlrCd to set
         */
        public void setJoinDlrCd(String joinDlrCd) {
            this.joinDlrCd = joinDlrCd;
        }

        /**
         * @return the joinReqAgreeYn
         */
        public String getJoinReqAgreeYn() {
            return joinReqAgreeYn;
        }

        /**
         * @param joinReqAgreeYn the joinReqAgreeYn to set
         */
        public void setJoinReqAgreeYn(String joinReqAgreeYn) {
            this.joinReqAgreeYn = joinReqAgreeYn;
        }

        /**
         * @return the policyAgreeYn
         */
        public String getPolicyAgreeYn() {
            return policyAgreeYn;
        }

        /**
         * @param policyAgreeYn the policyAgreeYn to set
         */
        public void setPolicyAgreeYn(String policyAgreeYn) {
            this.policyAgreeYn = policyAgreeYn;
        }

        /**
         * @return the joinApproveYn
         */
        public String getJoinApproveYn() {
            return joinApproveYn;
        }

        /**
         * @param joinApproveYn the joinApproveYn to set
         */
        public void setJoinApproveYn(String joinApproveYn) {
            this.joinApproveYn = joinApproveYn;
        }

        /**
         * @return the joinApproveDt
         */
        public Date getJoinApproveDt() {
            return joinApproveDt;
        }

        /**
         * @param joinApproveDt the joinApproveDt to set
         */
        public void setJoinApproveDt(Date joinApproveDt) {
            this.joinApproveDt = joinApproveDt;
        }

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }


}
