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
 * @ClassName   : CouponVO.java
 * @Description : 패키지 쿠폰의 쿠폰 VO
 * @author Kim Hyun Ho
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class CouponVO extends BaseVO {
    /*
     * [TODO] BaseVO를 바로 상속받지 않고 MasterVO를 상속 받음
     */

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2892950499369016673L;

        /**
         * 딜러코드
         **/
         private  String     dlrCd;

        /**
        * 쿠폰일련번호
        **/
        private  int        cupnSeq;

        /**
         * 패키지일련번호
         **/
         private  int        pkgSeq;

         /**
          * 쿠폰유효기간
          **/
         private  int        cupnValidPrid;

         /**
         * 패키지명
         **/
         private  String     pkgNm;

        /**
        * 쿠폰명
        **/
        @NotEmpty
        private  String     cupnNm;

        /**
        * 쿠폰내용
        **/
        @NotEmpty
        private  String     cupnCont;

        //[TODO] 추가항목

        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date cupnDestDt; //쿠폰소멸일자(sysdate+cupnValidPrid)

        @NotEmpty
        private  String     cupnTp;     //쿠폰유형
        private  int        dcRate;     //할인율
        private  int        dcAmt;      //상품권할인금액
        private  String     prenGoods;  //사은품용품
        private  String     prenGoodsNm;  //사은품용품
        private  int        prenCnt;    //사은품수량

        @NotEmpty
        private  String     useYn;      //사용유무

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

        /**
         * @return the cupnDestDt
         */
        public Date getCupnDestDt() {
            return cupnDestDt;
        }

        /**
         * @param cupnDestDt the cupnDestDt to set
         */
        public void setCupnDestDt(Date cupnDestDt) {
            this.cupnDestDt = cupnDestDt;
        }

        /**
         * @return the cupnTp
         */
        public String getCupnTp() {
            return cupnTp;
        }

        /**
         * @param cupnTp the cupnTp to set
         */
        public void setCupnTp(String cupnTp) {
            this.cupnTp = cupnTp;
        }

        /**
         * @return the dcRate
         */
        public int getDcRate() {
            return dcRate;
        }

        /**
         * @param dcRate the dcRate to set
         */
        public void setDcRate(int dcRate) {
            this.dcRate = dcRate;
        }

        /**
         * @return the dcAmt
         */
        public int getDcAmt() {
            return dcAmt;
        }

        /**
         * @param dcAmt the dcAmt to set
         */
        public void setDcAmt(int dcAmt) {
            this.dcAmt = dcAmt;
        }

        /**
         * @return the prenGoods
         */
        public String getPrenGoods() {
            return prenGoods;
        }

        /**
         * @param prenGoods the prenGoods to set
         */
        public void setPrenGoods(String prenGoods) {
            this.prenGoods = prenGoods;
        }

        /**
         * @return the prenCnt
         */
        public int getPrenCnt() {
            return prenCnt;
        }

        /**
         * @param prenCnt the prenCnt to set
         */
        public void setPrenCnt(int prenCnt) {
            this.prenCnt = prenCnt;
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
         * @return the prenGoodsNm
         */
        public String getPrenGoodsNm() {
            return prenGoodsNm;
        }

        /**
         * @param prenGoodsNm the prenGoodsNm to set
         */
        public void setPrenGoodsNm(String prenGoodsNm) {
            this.prenGoodsNm = prenGoodsNm;
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

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

}
