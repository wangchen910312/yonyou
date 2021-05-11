package chn.bhmc.dms.sal.cnt.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReGoodsVO
 * @Description : 용품 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 6. 17.    Kim Jin Suk           최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"        , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="contractNo"   , mesgKey="sal.lbl.contractNo")
   ,@ValidField(field="seq"          , mesgKey="sal.lbl.seq")
   ,@ValidField(field="goodsCd"      , mesgKey="sal.lbl.goodsCd")
   ,@ValidField(field="goodsPrc"     , mesgKey="sal.lbl.goodsPrc")
   ,@ValidField(field="goodsCnt"     , mesgKey="sal.lbl.goodsCnt")
   ,@ValidField(field="goodsAmt"     , mesgKey="sal.lbl.goodsAmt")
   ,@ValidField(field="dcAmt"        , mesgKey="sal.lbl.dcAmt")
   ,@ValidField(field="realGoodsAmt" , mesgKey="sal.lbl.realGoodsAmt")
   })
public class ContractReGoodsVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7794004787958991642L;


    /**
     * 딜러코드
     **/
    private  String        dlrCd;

    /**
     * 계약번호
     **/
    private  String        contractNo;

    /**
     * 일련번호
     **/
    private  int           seq;

    /**
     * 용품코드
     **/
    private  String        goodsCd;
    private  String        goodsNm;

    /**
     * 용품단가
     **/
    private  double        goodsPrc;

    /**
     * 용품수
     **/
    private  double        goodsCnt;

    /**
     * 용품금액
     **/
    private  double        goodsAmt;

    /**
     * 할인금액
     **/
    private  double        dcAmt;

    /**
     * 실제용품금액
     **/
    private  double        realGoodsAmt;

    /**
     * 서비스여부
     */
    private String         serviceYn;

    /**
     * 할인율
     */
    private long           dcRate;

    /**
     * 패키지품목코드
     */
    private String         pkgItemCd;


    /*************************************
     *  부품 - 품목리스트 팝업 Result VO
     *************************************/
    /**
     * 품목코드
     */
    private String itemCd;

    /**
     * 품목명
     */
    private String itemNm;

    /**
     * 재고단위
     */
    private String stockUnitCd;

    /**
     * 구매단가유형
     */
    private String prcTp;

    /**
     * 판매단가
     */
    private double salePrcAmt;

    /**
     * 차종
     */
    private String carlineCd;
    private String carlineNm;

    /**
     * 구매리드타임
     */
    private String purcLeadHm;

    /**
     * 입고창고
     */
    private String grStrgeCd;

    /**
     * 출고창고
     */
    private String giStrgeCd;

    /**
     * 가용재고
     */
    private double avlbStockQty;

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
     * @return the goodsPrc
     */
    public double getGoodsPrc() {
        return goodsPrc;
    }

    /**
     * @param goodsPrc the goodsPrc to set
     */
    public void setGoodsPrc(double goodsPrc) {
        this.goodsPrc = goodsPrc;
    }

    /**
     * @return the goodsCnt
     */
    public double getGoodsCnt() {
        return goodsCnt;
    }

    /**
     * @param goodsCnt the goodsCnt to set
     */
    public void setGoodsCnt(double goodsCnt) {
        this.goodsCnt = goodsCnt;
    }

    /**
     * @return the goodsAmt
     */
    public double getGoodsAmt() {
        return goodsAmt;
    }

    /**
     * @param goodsAmt the goodsAmt to set
     */
    public void setGoodsAmt(double goodsAmt) {
        this.goodsAmt = goodsAmt;
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
     * @return the realGoodsAmt
     */
    public double getRealGoodsAmt() {
        return realGoodsAmt;
    }

    /**
     * @param realGoodsAmt the realGoodsAmt to set
     */
    public void setRealGoodsAmt(double realGoodsAmt) {
        this.realGoodsAmt = realGoodsAmt;
    }


    /**
     * @return the serviceYn
     */
    public String getServiceYn() {
        return serviceYn;
    }

    /**
     * @param serviceYn the serviceYn to set
     */
    public void setServiceYn(String serviceYn) {
        this.serviceYn = serviceYn;
    }

    /**
     * @return the dcRate
     */
    public long getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(long dcRate) {
        this.dcRate = dcRate;
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
     * @return the stockUnitCd
     */
    public String getStockUnitCd() {
        return stockUnitCd;
    }

    /**
     * @param stockUnitCd the stockUnitCd to set
     */
    public void setStockUnitCd(String stockUnitCd) {
        this.stockUnitCd = stockUnitCd;
    }

    /**
     * @return the prcTp
     */
    public String getPrcTp() {
        return prcTp;
    }

    /**
     * @param prcTp the prcTp to set
     */
    public void setPrcTp(String prcTp) {
        this.prcTp = prcTp;
    }

    /**
     * @return the salePrcAmt
     */
    public double getSalePrcAmt() {
        return salePrcAmt;
    }

    /**
     * @param salePrcAmt the salePrcAmt to set
     */
    public void setSalePrcAmt(double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
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
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }

    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }

    /**
     * @return the purcLeadHm
     */
    public String getPurcLeadHm() {
        return purcLeadHm;
    }

    /**
     * @param purcLeadHm the purcLeadHm to set
     */
    public void setPurcLeadHm(String purcLeadHm) {
        this.purcLeadHm = purcLeadHm;
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
     * @return the avlbStockQty
     */
    public double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
