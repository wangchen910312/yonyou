package chn.bhmc.dms.crm.dmm.vo;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

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



        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

}
