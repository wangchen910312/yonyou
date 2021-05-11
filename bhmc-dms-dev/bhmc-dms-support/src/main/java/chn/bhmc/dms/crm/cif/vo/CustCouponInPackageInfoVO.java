package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustCouponInPackageInfoVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public class CustCouponInPackageInfoVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7336697923387726089L;
    /**
    * 딜러코드
    **/
    //@NotEmpty

    private  int         seq;
    private  String     dlrCd;

    /**
    * 패키지일련번호
    **/
    //@NotEmpty

    private  int        pkgSeq;

    /**
    * 쿠폰일련번호
    **/
    //@NotEmpty

    private  int        cupnSeq;

    /**
    * 등록자ID
    **/
    //@NotEmpty

    private  String     regUsrId;

    /**
    * 등록일자
    **/
    //@NotEmpty
    //@JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       regDt;

    /**
    * 수정자ID
    **/
    //UPDT_USR_ID

    private  String     updtUsrId;

    /**
    * 수정일자
    **/
    //UPDT_DT
    //@JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       updtDt;

    /**
     * 쿠폰명
     **/
     //CUPN_NM

     private  String         cupnNm;

     /**
     * 할인방식
     **/
     //DC_CD

     private  String         dcCd;

     /**
     * 할인사용구분
     **/
     //DC_USE_TP

     private  String         dcUseTp;

     /**
     * 사용여부
     **/
     //@NotEmpty

     private  String         useYn;

     /**
     * 유효시작일
     **/
     //CUPN_FROM_DT
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date           cupnFromDt;

     /**
     * 유효종료일
     **/
     //CUPN_TO_DT
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date           cupnToDt;

     /**
     * 기본유효일자
     **/
     //CUPN_VALID_PRID

     private  int            cupnValidPrid;

     /**
     * 공임할일율
     **/
     //LBR_DC_RATE

     private  Double         lbrDcRate;

     /**
     * 공임할인금액
     **/
     //LBR_DC_AMT

     private  Double         lbrDcAmt;

     /**
      * 부품할인율
      **/
     //PAR_DC_RATE

     private  Double         parDcRate;

     /**
      * 부품할인금액
      **/
     //LBR_DC_AMT

     private  Double         parDcAmt;

     /**
      * 총액할인율
      **/
     //TOT_DC_RATE

     private  Double         totDcRate;

     /**
      * 총액할인금액
      **/
     //TOT_DC_AMT

     private  Double         totDcAmt;

     private  String         itemCd;
     private  String         itemNm;
     private  int         goodsCnt;

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
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
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
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
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
     * @return the dcCd
     */
    public String getDcCd() {
        return dcCd;
    }

    /**
     * @param dcCd the dcCd to set
     */
    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    /**
     * @return the dcUseTp
     */
    public String getDcUseTp() {
        return dcUseTp;
    }

    /**
     * @param dcUseTp the dcUseTp to set
     */
    public void setDcUseTp(String dcUseTp) {
        this.dcUseTp = dcUseTp;
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
     * @return the cupnFromDt
     */
    public Date getCupnFromDt() {
        return cupnFromDt;
    }

    /**
     * @param cupnFromDt the cupnFromDt to set
     */
    public void setCupnFromDt(Date cupnFromDt) {
        this.cupnFromDt = cupnFromDt;
    }

    /**
     * @return the cupnToDt
     */
    public Date getCupnToDt() {
        return cupnToDt;
    }

    /**
     * @param cupnToDt the cupnToDt to set
     */
    public void setCupnToDt(Date cupnToDt) {
        this.cupnToDt = cupnToDt;
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
     * @return the lbrDcRate
     */
    public Double getLbrDcRate() {
        return lbrDcRate;
    }

    /**
     * @param lbrDcRate the lbrDcRate to set
     */
    public void setLbrDcRate(Double lbrDcRate) {
        this.lbrDcRate = lbrDcRate;
    }

    /**
     * @return the lbrDcAmt
     */
    public Double getLbrDcAmt() {
        return lbrDcAmt;
    }

    /**
     * @param lbrDcAmt the lbrDcAmt to set
     */
    public void setLbrDcAmt(Double lbrDcAmt) {
        this.lbrDcAmt = lbrDcAmt;
    }

    /**
     * @return the parDcRate
     */
    public Double getParDcRate() {
        return parDcRate;
    }

    /**
     * @param parDcRate the parDcRate to set
     */
    public void setParDcRate(Double parDcRate) {
        this.parDcRate = parDcRate;
    }

    /**
     * @return the parDcAmt
     */
    public Double getParDcAmt() {
        return parDcAmt;
    }

    /**
     * @param parDcAmt the parDcAmt to set
     */
    public void setParDcAmt(Double parDcAmt) {
        this.parDcAmt = parDcAmt;
    }

    /**
     * @return the totDcRate
     */
    public Double getTotDcRate() {
        return totDcRate;
    }

    /**
     * @param totDcRate the totDcRate to set
     */
    public void setTotDcRate(Double totDcRate) {
        this.totDcRate = totDcRate;
    }

    /**
     * @return the totDcAmt
     */
    public Double getTotDcAmt() {
        return totDcAmt;
    }

    /**
     * @param totDcAmt the totDcAmt to set
     */
    public void setTotDcAmt(Double totDcAmt) {
        this.totDcAmt = totDcAmt;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the goodsCnt
     */
    public int getGoodsCnt() {
        return goodsCnt;
    }

    /**
     * @param goodsCnt the goodsCnt to set
     */
    public void setGoodsCnt(int goodsCnt) {
        this.goodsCnt = goodsCnt;
    }


}
