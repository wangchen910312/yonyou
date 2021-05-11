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
 * @ClassName   : MembershipGradeHisVO.java
 * @Description : 멤버십 등급이력VO
 * @author Kim Hyun Ho
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="CR_0804T.lbl.dlrCd")
    ,@ValidField(field="membershipNo"    , mesgKey="CR_0804T.lbl.membershipNo")
    ,@ValidField(field="gradeChgHisSeq"  , mesgKey="CR_0804T.lbl.gradeChgHisSeq")
    ,@ValidField(field="befGradeCd"      , mesgKey="CR_0804T.lbl.befGradeCd")
    ,@ValidField(field="aftGradeCd"      , mesgKey="CR_0804T.lbl.aftGradeCd")
    ,@ValidField(field="gradeChgDt"      , mesgKey="CR_0804T.lbl.gradeChgDt")
    ,@ValidField(field="useYn"           , mesgKey="CR_0804T.lbl.useYn")
    ,@ValidField(field="regUsrId"        , mesgKey="CR_0804T.lbl.regUsrId")
    ,@ValidField(field="regDt"           , mesgKey="CR_0804T.lbl.regDt")
    ,@ValidField(field="updtUsrId"       , mesgKey="CR_0804T.lbl.updtUsrId")
    ,@ValidField(field="updtDt"          , mesgKey="CR_0804T.lbl.updtDt")
    })
public class MembershipGradeHisVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4918575611874896301L;

        /**
        * 딜러코드
        **/
        private  String dlrCd;

        /**
        * 멤버쉽번호
        **/
        private  String membershipNo;

        /**
        * 등급변경이력일련번호
        **/
        private  int gradeChgHisSeq;

        /**
        * 이전등급코드
        **/
        private  String befGradeCd;

        /**
        * 이후등급코드
        **/
        private  String aftGradeCd;

        /**
        * 등급변경일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date gradeChgDt;

        /**
        * 사용여부
        **/
        private  String useYn;
        private  String usrNm; //등급변경자



        private  String custNo; //고객번호
        private  String custNm; //고객명
        private  String hpNo;   //휴대전화

        private  String gradeChgTp;   //조정유형 ( A:자동 / M:수동 )



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
         * @return the gradeChgHisSeq
         */
        public int getGradeChgHisSeq() {
            return gradeChgHisSeq;
        }



        /**
         * @param gradeChgHisSeq the gradeChgHisSeq to set
         */
        public void setGradeChgHisSeq(int gradeChgHisSeq) {
            this.gradeChgHisSeq = gradeChgHisSeq;
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
         * @return the gradeChgDt
         */
        public Date getGradeChgDt() {
            return gradeChgDt;
        }



        /**
         * @param gradeChgDt the gradeChgDt to set
         */
        public void setGradeChgDt(Date gradeChgDt) {
            this.gradeChgDt = gradeChgDt;
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
         * @return the gradeChgTp
         */
        public String getGradeChgTp() {
            return gradeChgTp;
        }



        /**
         * @param gradeChgTp the gradeChgTp to set
         */
        public void setGradeChgTp(String gradeChgTp) {
            this.gradeChgTp = gradeChgTp;
        }



        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }
}
