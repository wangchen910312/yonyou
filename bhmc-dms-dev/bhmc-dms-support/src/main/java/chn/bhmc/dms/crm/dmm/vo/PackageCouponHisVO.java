package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponHisVO.java
 * @Description : 패키지쿠폰 이력 VO
 * @author Lee In Moon
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Lee In Moon     최초 생성
 * </pre>
 */
    @ValidDescriptor({
        @ValidField(field="dlrCd"       , mesgKey="crm.lbl.dlrCd")
        ,@ValidField(field="seq"         , mesgKey="crm.lbl.seq")
        ,@ValidField(field="membershipNo", mesgKey="crm.lbl.membershipNo")
        ,@ValidField(field="pkgSeq"      , mesgKey="crm.lbl.pkgSeq")
        ,@ValidField(field="pkgNm"       , mesgKey="crm.lbl.pkgNm")
        ,@ValidField(field="pkgAmt"      , mesgKey="crm.lbl.pkgAmt")
        ,@ValidField(field="pkgCont"     , mesgKey="crm.lbl.pkgCont")
        ,@ValidField(field="cupnSeq"     , mesgKey="crm.lbl.cupnSeq")
        ,@ValidField(field="cupnNm"      , mesgKey="crm.lbl.cupnNm")
        ,@ValidField(field="cupnCont"    , mesgKey="crm.lbl.cupnCont")
        ,@ValidField(field="cupnDestDt"  , mesgKey="crm.lbl.cupnDestDt")
        ,@ValidField(field="cupnUseYn"   , mesgKey="crm.lbl.cupnUseYn")
        ,@ValidField(field="cupnUseDt"   , mesgKey="crm.lbl.cupnUseDt")
        ,@ValidField(field="useDeptNm"   , mesgKey="crm.lbl.useDeptNm")
        ,@ValidField(field="usePrsnId"   , mesgKey="crm.lbl.usePrsnId")
        ,@ValidField(field="cupnNo"   , mesgKey="crm.lbl.cupnNo")
    })
public class PackageCouponHisVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1489868011703727198L;


        /**
        * 딜러코드
        **/
        private  String       dlrCd;

        /**
        * 일련번호
        **/
        private  int          seq;

        /**
        * 멤버쉽번호
        **/
        private  String       membershipNo;

        /**
        * 패키지일련번호
        **/
        private  int          pkgSeq;

        /**
        * 패키지명
        **/
        private  String       pkgNm;

        /**
        * 패키지금액
        **/
        private  int          pkgAmt;

        /**
        * 패키지내용
        **/
        private  String       pkgCont;

        /**
        * 쿠폰일련번호
        **/
        private  int          cupnSeq;

        /**
        * 쿠폰명
        **/
        private  String       cupnNm;

        /**
        * 쿠폰내용
        **/
        private  String       cupnCont;

        /**
        * 쿠폰소멸일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date         cupnDestDt;

        /**
        * 쿠폰사용여부
        **/
        @NotEmpty(groups={Draft.class})
        private  String       cupnUseYn;

        /**
        * 쿠폰사용일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date         cupnUseDt;

        /**
        * 사용부서명
        **/
        private  String       useDeptNm;

        /**
        * 사용담당자ID
        **/
        private  String       usePrsnId;

        /**
         * 쿠폰번호
         **/
        @NotEmpty
        private  String       cupnNo;

        //[추가]
        private int cupnValidPrid;
        private Boolean isResult;// 멤버십 조회 결과
        private String resultMsg;// 멤버십 결과 Message

        private String roDocNo;//RO문서번호
        private String contractNo;//계약번호


        private  String     cupnTp;     //쿠폰유형
        private  int        dcRate;     //할인율
        private  int        dcAmt;      //상품권할인금액
        private  String     prenGoods;  //사은품용품
        private  String     prenGoodsNm;  //사은품용품
        private  int        prenCnt;    //사은품수량
        private  String     useYn;    //사용유무

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
         * @return the cupnUseYn
         */
        public String getCupnUseYn() {
            return cupnUseYn;
        }

        /**
         * @param cupnUseYn the cupnUseYn to set
         */
        public void setCupnUseYn(String cupnUseYn) {
            this.cupnUseYn = cupnUseYn;
        }

        /**
         * @return the cupnUseDt
         */
        public Date getCupnUseDt() {
            return cupnUseDt;
        }

        /**
         * @param cupnUseDt the cupnUseDt to set
         */
        public void setCupnUseDt(Date cupnUseDt) {
            this.cupnUseDt = cupnUseDt;
        }

        /**
         * @return the useDeptNm
         */
        public String getUseDeptNm() {
            return useDeptNm;
        }

        /**
         * @param useDeptNm the useDeptNm to set
         */
        public void setUseDeptNm(String useDeptNm) {
            this.useDeptNm = useDeptNm;
        }

        /**
         * @return the usePrsnId
         */
        public String getUsePrsnId() {
            return usePrsnId;
        }

        /**
         * @param usePrsnId the usePrsnId to set
         */
        public void setUsePrsnId(String usePrsnId) {
            this.usePrsnId = usePrsnId;
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
         * @return the isResult
         */
        public Boolean getIsResult() {
            return isResult;
        }

        /**
         * @param isResult the isResult to set
         */
        public void setIsResult(Boolean isResult) {
            this.isResult = isResult;
        }

        /**
         * @return the resultMsg
         */
        public String getResultMsg() {
            return resultMsg;
        }

        /**
         * @param resultMsg the resultMsg to set
         */
        public void setResultMsg(String resultMsg) {
            this.resultMsg = resultMsg;
        }

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

        /**
         * @return the roDocNo
         */
        public String getRoDocNo() {
            return roDocNo;
        }

        /**
         * @param roDocNo the roDocNo to set
         */
        public void setRoDocNo(String roDocNo) {
            this.roDocNo = roDocNo;
        }

        /**
         * @return the contractNo
         */
        public String getContractNo() {
            return contractNo;
        }

        /**
         * @param contractNo the contractNo to set
         */
        public void setContractNo(String contractNo) {
            this.contractNo = contractNo;
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



}
