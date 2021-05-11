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
 * @ClassName   : MembershipPointExtVO.java
 * @Description : 포인트소멸 VO.
 * @author Kim Hyun Ho
 * @since 2016. 5. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 13.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"            , mesgKey="CR_0811T.lbl.dlrCd")
    ,@ValidField(field="extcSeq"          , mesgKey="CR_0811T.lbl.extcSeq")
    ,@ValidField(field="pointExtcExpcDt"  , mesgKey="CR_0811T.lbl.pointExtcExpcDt")
    ,@ValidField(field="membershipNo"     , mesgKey="CR_0811T.lbl.membershipNo")
    ,@ValidField(field="extcPointVal"     , mesgKey="CR_0811T.lbl.extcPointVal")
    ,@ValidField(field="rmnPointVal"      , mesgKey="CR_0811T.lbl.rmnPointVal")
    ,@ValidField(field="smsSendYn"        , mesgKey="CR_0811T.lbl.smsSendYn")
    ,@ValidField(field="smsSendDt"        , mesgKey="CR_0811T.lbl.smsSendDt")
    ,@ValidField(field="regUsrId"         , mesgKey="CR_0811T.lbl.regUsrId")
    ,@ValidField(field="regDt"            , mesgKey="CR_0811T.lbl.regDt")
    ,@ValidField(field="updtUsrId"        , mesgKey="CR_0811T.lbl.updtUsrId")
    ,@ValidField(field="updtDt"           , mesgKey="CR_0811T.lbl.updtDt")
    })
public class MembershipPointExtVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7887078665920865241L;


        /**
        * 딜러코드
        **/
        private  String            dlrCd;

        /**
        * 소멸일련번호
        **/
        private  int               extcSeq;

        /**
        * 포인트소멸예정일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date              pointExtcExpcDt;

        /**
        * 멤버쉽번호
        **/
        private  String            membershipNo;

        /**
        * 소멸포인트값
        **/
        private  int               extcPointVal;

        /**
        * 잔여포인트값
        **/
        private  int               rmnPointVal;

        /**
        * SMS발송여부
        **/
        private  String            smsSendYn;

        /**
        * SMS발송일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date              smsSendDt;

        //추가 Data
        private String hpNo; //핸드폰번호
        private String custNo; //고객번호
        private String custNm; //고객명
        private String usrNm; //조작인
        private String vinNo; //차대번호
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private Date membershipRegDt; //멤버십 등록일자
        private int pointExtUsrCnt; // 대상고객수
        private int totalExtcPointVal; //소멸예상 포인트
        private int totalRmnPointVal; //현시점 포인트
        private int smsTmplUserSeq; //sms임시보관 일련번호

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
         * @return the extcSeq
         */
        public int getExtcSeq() {
            return extcSeq;
        }

        /**
         * @param extcSeq the extcSeq to set
         */
        public void setExtcSeq(int extcSeq) {
            this.extcSeq = extcSeq;
        }

        /**
         * @return the pointExtcExpcDt
         */
        public Date getPointExtcExpcDt() {
            return pointExtcExpcDt;
        }

        /**
         * @param pointExtcExpcDt the pointExtcExpcDt to set
         */
        public void setPointExtcExpcDt(Date pointExtcExpcDt) {
            this.pointExtcExpcDt = pointExtcExpcDt;
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
         * @return the extcPointVal
         */
        public int getExtcPointVal() {
            return extcPointVal;
        }

        /**
         * @param extcPointVal the extcPointVal to set
         */
        public void setExtcPointVal(int extcPointVal) {
            this.extcPointVal = extcPointVal;
        }

        /**
         * @return the rmnPointVal
         */
        public int getRmnPointVal() {
            return rmnPointVal;
        }

        /**
         * @param rmnPointVal the rmnPointVal to set
         */
        public void setRmnPointVal(int rmnPointVal) {
            this.rmnPointVal = rmnPointVal;
        }

        /**
         * @return the smsSendYn
         */
        public String getSmsSendYn() {
            return smsSendYn;
        }

        /**
         * @param smsSendYn the smsSendYn to set
         */
        public void setSmsSendYn(String smsSendYn) {
            this.smsSendYn = smsSendYn;
        }

        /**
         * @return the smsSendDt
         */
        public Date getSmsSendDt() {
            return smsSendDt;
        }

        /**
         * @param smsSendDt the smsSendDt to set
         */
        public void setSmsSendDt(Date smsSendDt) {
            this.smsSendDt = smsSendDt;
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
         * @return the vinNo
         */
        public String getVinNo() {
            return vinNo;
        }

        /**
         * @param vinNo the vinNo to set
         */
        public void setVinNo(String vinNo) {
            this.vinNo = vinNo;
        }



        /**
         * @return the membershipRegDt
         */
        public Date getMembershipRegDt() {
            return membershipRegDt;
        }

        /**
         * @param membershipRegDt the membershipRegDt to set
         */
        public void setMembershipRegDt(Date membershipRegDt) {
            this.membershipRegDt = membershipRegDt;
        }



        /**
         * @return the pointExtUsrCnt
         */
        public int getPointExtUsrCnt() {
            return pointExtUsrCnt;
        }

        /**
         * @param pointExtUsrCnt the pointExtUsrCnt to set
         */
        public void setPointExtUsrCnt(int pointExtUsrCnt) {
            this.pointExtUsrCnt = pointExtUsrCnt;
        }

        /**
         * @return the totalExtcPointVal
         */
        public int getTotalExtcPointVal() {
            return totalExtcPointVal;
        }

        /**
         * @param totalExtcPointVal the totalExtcPointVal to set
         */
        public void setTotalExtcPointVal(int totalExtcPointVal) {
            this.totalExtcPointVal = totalExtcPointVal;
        }

        /**
         * @return the totalRmnPointVal
         */
        public int getTotalRmnPointVal() {
            return totalRmnPointVal;
        }

        /**
         * @param totalRmnPointVal the totalRmnPointVal to set
         */
        public void setTotalRmnPointVal(int totalRmnPointVal) {
            this.totalRmnPointVal = totalRmnPointVal;
        }

        /**
         * @return the smsTmplUserSeq
         */
        public int getSmsTmplUserSeq() {
            return smsTmplUserSeq;
        }

        /**
         * @param smsTmplUserSeq the smsTmplUserSeq to set
         */
        public void setSmsTmplUserSeq(int smsTmplUserSeq) {
            this.smsTmplUserSeq = smsTmplUserSeq;
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

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

}
