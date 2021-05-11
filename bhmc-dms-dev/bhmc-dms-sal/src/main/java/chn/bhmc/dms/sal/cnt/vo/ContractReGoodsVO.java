package chn.bhmc.dms.sal.cnt.vo;

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
     * 체크표시
     */
    private  String        nChk;

    /**
     * 용품코드
     **/
    private  String        goodsCd;
    private  String        goodsNm;

    /**
     * 용품수
     **/
    private  double        goodsCnt;

    /**
     * 용품단위
     */
    private  String        goodsUnitCd;

    /**
     * 용품단가
     **/
    private  double        goodsPrc;

    /**
     * 할인율
     */
    private double         dcRate;

    /**
     * 용품금액
     **/
    private  double        goodsAmt;

    /**
     * 서비스여부
     */
    private String         serviceYn;

    /**
     * 실제용품금액
     **/
    private  double        realGoodsAmt;

    /**
     * 할인금액
     **/
    private  double        dcAmt;

    /**
     * 패키지품목코드
     */
    private String         pkgItemCd;

    /**
     * 수불문서년월일자
     */
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     */
    private String mvtDocNo;

    /**
     * 수불문서라인번호
     */
    private int mvtDocLineNo;

    /**
     * 예정출고완료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcGiEndDt;

    /**
     * 설치담당자id
     */
    private String eqipPrsnId;

    /**
     * 실제인도일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date realDlDt;

    /**
     * 설치비용
     */
    private double eqipCostAmt;
    private double totAmt;

    /**
     * 예정설치일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcEqipDt;

    /**
     * 설치완료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date eqipEndDt;
    
    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private  String updtDtStr;

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
     * 상태코드
     * '10':출고대기
     * '20':출고
     * '30':반품대기
     * '40':반품
     */
    private String statCd;

    /**
     * 참조문서번호
     **/
    private String refDocNo;

    /**
     * 참조문서라인번호
     **/
    private int refDocLineNo;

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
     * @return the nChk
     */
    public String getnChk() {
        return nChk;
    }

    /**
     * @param nChk the nChk to set
     */
    public void setnChk(String nChk) {
        this.nChk = nChk;
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
    public double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(double dcRate) {
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
     * @return the realDlDt
     */
    public Date getRealDlDt() {
        return realDlDt;
    }

    /**
     * @param realDlDt the realDlDt to set
     */
    public void setRealDlDt(Date realDlDt) {
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
     * @return the totAmt
     */
    public double getTotAmt() {
        return totAmt;
    }

    /**
     * @param totAmt the totAmt to set
     */
    public void setTotAmt(double totAmt) {
        this.totAmt = totAmt;
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
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
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

    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    /**
     * @return the refDocNo
     */
    public String getRefDocNo() {
        return refDocNo;
    }

    /**
     * @param refDocNo the refDocNo to set
     */
    public void setRefDocNo(String refDocNo) {
        this.refDocNo = refDocNo;
    }

    /**
     * @return the refDocLineNo
     */
    public int getRefDocLineNo() {
        return refDocLineNo;
    }

    /**
     * @param refDocLineNo the refDocLineNo to set
     */
    public void setRefDocLineNo(int refDocLineNo) {
        this.refDocLineNo = refDocLineNo;
    }
}
