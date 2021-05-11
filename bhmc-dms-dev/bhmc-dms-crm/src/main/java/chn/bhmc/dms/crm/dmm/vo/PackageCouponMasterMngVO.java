package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

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
 * @ClassName   : PackageCouponMasterMngVO.java
 * @Description : 패키지쿠폰 Master 관리 VO
 * @author Kim Hyun Ho
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */


public class PackageCouponMasterMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 414609378346000687L;


        /**
        * 딜러코드
        **/
        private  String     dlrCd;

        /**
        * 패키지일련번호
        **/
        private  int        pkgSeq;

        /**
        * 패키지명
        **/
        @NotEmpty
        private  String     pkgNm;

        /**
        * 패키지금액
        **/
        @NotNull
        private  int        pkgAmt;

        /**
        * 패키지내용
        **/
        @NotEmpty
        private  String     pkgCont;

        /**
         * 등록일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date        regDt;

        /**
         * 수정일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date        updtDt;

        /**
         * 시작일
         **/
        @NotNull
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date        startDt;

        /**
         * 종료일
         **/
        @NotNull
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date        endDt;

        /**
         * 사용유무
         **/
        @NotEmpty
        private  String     useYn;


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
         * @return the regDt
         */
        public Date getRegDt() {
            return regDt;
        }



        /**
         * @param regDt the regDt to set
         */
        public void setRegDt(Date regDt) {
            this.regDt = regDt;
        }



        /**
         * @return the updtDt
         */
        public Date getUpdtDt() {
            return updtDt;
        }



        /**
         * @param updtDt the updtDt to set
         */
        public void setUpdtDt(Date updtDt) {
            this.updtDt = updtDt;
        }



        /**
         * @return the startDt
         */
        public Date getStartDt() {
            return startDt;
        }



        /**
         * @param startDt the startDt to set
         */
        public void setStartDt(Date startDt) {
            this.startDt = startDt;
        }



        /**
         * @return the endDt
         */
        public Date getEndDt() {
            return endDt;
        }



        /**
         * @param endDt the endDt to set
         */
        public void setEndDt(Date endDt) {
            this.endDt = endDt;
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



        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

}
