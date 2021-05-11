package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;

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
 * @ClassName   : FincInfoMngItemVO
 * @Description : 경품판매관리 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"            , mesgKey="sal.lbl.dlrCd")
   })
public class AccessoryMngItemVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3400324686738395865L;

    /**
     * 딜러코드
     **/
    private  String           dlrCd;

    /**
     * 용품계약번호
     **/
    private  String           goodsContractNo;

    /**
     * 일련번호
     **/
    private  int              seq;

    /**
     * 차종
     */
    private  String           carlineCd;

    /**
     * 용품코드
     **/
    private  String           goodsCd;

    /**
     * 용품명
     */
    private  String           goodsNm;

    /**
     * 용품수량
     **/
    //GOODS_CNT
    private  int              goodsCnt;

    /**
     * 용품단위코드
     */
    private  String           goodsUnitCd;

    /**
     * 소매가격
     **/
    //RETL_PRC
    private  Double           retlPrc;

    /**
     * 할인율
     **/
    //DC_RATE
    private  int              dcRate;

    /**
     * 판매금액
     **/
    //SALE_AMT
    private  Double           saleAmt;

    /**
     * 지불유형
     **/
    //PAY_TP
    private  String           payTp;

    /**
     * 총금액
     **/
    //TOT_AMT
    private  Double           totAmt;

    /**
     * 패키지품목코드
     **/
    //PKG_ITEM_CD
    private  String           pkgItemCd;

    /**
     * 입고창고코드
     */
    private  String           grStrgeCd;

    /**
     * 출고창고코드
     */
    private  String           giStrgeCd;

    /**
     * 할인금액
     */
    private  double           dcAmt;

    /**
     * 표시
     */
    private  String           chk;

    /**
     * 수불문서년월
     */
    private  String           mvtDocYyMm;

    /**
     * 수불문서번호
     */
    private  String           mvtDocNo;

    /**
     * 수불문서라인번호
     */
    private  int             mvtDocLineNo;

    private  String          eqipPrsnId;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           expcGiEndDt;

    private  String           realDlDt;

    private  double         eqipCostAmt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           expcEqipDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           eqipEndDt;

    /**
     * @return the eqipPrsnId
     */
    public String getEqipPrsnId() {
        return eqipPrsnId;
    }

    /**
     * @param eqipPrsnId the eqipPrsnId to set
     */
    public void setEqipPrsnId(String eqipPrsnId) {
        this.eqipPrsnId = eqipPrsnId;
    }

    /**
     * @return the expcGiEndDt
     */
    public Date getExpcGiEndDt() {
        return expcGiEndDt;
    }

    /**
     * @param expcGiEndDt the expcGiEndDt to set
     */
    public void setExpcGiEndDt(Date expcGiEndDt) {
        this.expcGiEndDt = expcGiEndDt;
    }

    /**
     * @return the realDlDt
     */
    public String getRealDlDt() {
        return realDlDt;
    }

    /**
     * @param realDlDt the realDlDt to set
     */
    public void setRealDlDt(String realDlDt) {
        this.realDlDt = realDlDt;
    }

    /**
     * @return the eqipCostAmt
     */
    public double getEqipCostAmt() {
        return eqipCostAmt;
    }

    /**
     * @param eqipCostAmt the eqipCostAmt to set
     */
    public void setEqipCostAmt(double eqipCostAmt) {
        this.eqipCostAmt = eqipCostAmt;
    }

    /**
     * @return the expcEqipDt
     */
    public Date getExpcEqipDt() {
        return expcEqipDt;
    }

    /**
     * @param expcEqipDt the expcEqipDt to set
     */
    public void setExpcEqipDt(Date expcEqipDt) {
        this.expcEqipDt = expcEqipDt;
    }

    /**
     * @return the eqipEndDt
     */
    public Date getEqipEndDt() {
        return eqipEndDt;
    }

    /**
     * @param eqipEndDt the eqipEndDt to set
     */
    public void setEqipEndDt(Date eqipEndDt) {
        this.eqipEndDt = eqipEndDt;
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
     * @return the goodsContractNo
     */
    public String getGoodsContractNo() {
        return goodsContractNo;
    }

    /**
     * @param goodsContractNo the goodsContractNo to set
     */
    public void setGoodsContractNo(String goodsContractNo) {
        this.goodsContractNo = goodsContractNo;
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
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the goodsCd
     */
    public String getGoodsCd() {
        return goodsCd;
    }

    /**
     * @param goodsCd the goodsCd to set
     */
    public void setGoodsCd(String goodsCd) {
        this.goodsCd = goodsCd;
    }

    /**
     * @return the goodsNm
     */
    public String getGoodsNm() {
        return goodsNm;
    }

    /**
     * @param goodsNm the goodsNm to set
     */
    public void setGoodsNm(String goodsNm) {
        this.goodsNm = goodsNm;
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

    /**
     * @return the goodsUnitCd
     */
    public String getGoodsUnitCd() {
        return goodsUnitCd;
    }

    /**
     * @param goodsUnitCd the goodsUnitCd to set
     */
    public void setGoodsUnitCd(String goodsUnitCd) {
        this.goodsUnitCd = goodsUnitCd;
    }

    /**
     * @return the retlPrc
     */
    public Double getRetlPrc() {
        return retlPrc;
    }

    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(Double retlPrc) {
        this.retlPrc = retlPrc;
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
     * @return the saleAmt
     */
    public Double getSaleAmt() {
        return saleAmt;
    }

    /**
     * @param saleAmt the saleAmt to set
     */
    public void setSaleAmt(Double saleAmt) {
        this.saleAmt = saleAmt;
    }

    /**
     * @return the payTp
     */
    public String getPayTp() {
        return payTp;
    }

    /**
     * @param payTp the payTp to set
     */
    public void setPayTp(String payTp) {
        this.payTp = payTp;
    }

    /**
     * @return the totAmt
     */
    public Double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    /**
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    /**
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the dcAmt
     */
    public double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the chk
     */
    public String getChk() {
        return chk;
    }

    /**
     * @param chk the chk to set
     */
    public void setChk(String chk) {
        this.chk = chk;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the mvtDocLineNo
     */
    public int getMvtDocLineNo() {
        return mvtDocLineNo;
    }

    /**
     * @param mvtDocLineNo the mvtDocLineNo to set
     */
    public void setMvtDocLineNo(int mvtDocLineNo) {
        this.mvtDocLineNo = mvtDocLineNo;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
