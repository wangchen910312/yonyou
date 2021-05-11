package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
/**
 * 재고실사 VO
 *
 * @ClassName   : StockDdlnItemVO.java
 * @Description : StockDdlnItemVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class StockDdlnItemVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 218491767419593775L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 로케이션코드
     **/
    private String locCd;

    /**
     * 년월
     **/
    private String yyMm;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목코드
     **/
    private String itemNm;

    /**
     * 단위
     **/
    private String unitCd;

    /**
     * 부품1등급분류
     **/
    private String firstTp;

    /**
     * 부품2등급분류
     **/
    private String secondTp;

    /**
     * 부품3등급분류
     **/
    private String thirdTp;

    /**
     * 품목유형
     **/
    private String itemTp;

    /**
     * 품목유형
     **/
    private String itemDstinCd;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 차종코드
     **/
    private String carlineCd;

    /**
     * 모델코드
     **/
    private String modelCd;

    /**
     * 전월마감재고수량
     **/
    private double preMmDdlnStockQty;

    /**
     * 전월마감재고금액
     **/
    private Double preMmDdlnStockAmt;

    /**
     * 전월마감이평가(세금미포함)
     **/
    private Double preMmDdlnMoveAvgTaxDdctPrc;

    /**
     * 전월마감재고단가
     **/
    private Double preMmDdlnStockPrc;

    /**
     * 전월마감재고단가
     **/
    private Double calcPreMmDdlnStockPrc;

    /**
     * 기말재고단가
     **/
    private Double psntMmDdlnStockPrc;

    /**
     * 입고수량
     **/
    private double grQty;

    /**
     * 입고금액
     **/
    private Double grAmt;

    /**
     * 출고수량
     **/
    private double giQty;

    /**
     * 출고금액
     **/
    private Double giAmt;

    /**
     * 출고원가금액
     **/
    private Double giBaseAmt;

    /**
     * 구매입고수량
     **/
    private double purcGrQty;

    /**
     * 구매입고금액
     **/
    private Double purcGrAmt;

    /**
     * 조달입고수량
     **/
    private double obtGrQty;

    /**
     * 조달입고금액
     **/
    private Double obtGrAmt;

    /**
     * 손익입고수량
     **/
    private double palGrQty;

    /**
     * 손익입고금액
     **/
    private Double palGrAmt;

    /**
     * 창고이동입고수량
     **/
    private double strgeMoveGrQty;

    /**
     * 창고이동입고금액
     **/
    private Double strgeMoveGrAmt;

    /**
     * 기타입고수량
     **/
    private double etcGrQty;

    /**
     * 기타입고금액
     **/
    private Double etcGrAmt;

    /**
     * 이동평균단가(현재)
     **/
    private Double currentMovingAvgPrc;

    /**
     * 이동평균단가
     **/
    private Double movingAvgPrc;

    /**
     * 이동평균단가(세금제외)
     **/
    private Double movingAvgTaxDdctPrc;

    /**
     * 입고이동평균단가
     **/
    private Double grMovingAvgPrc;

    /**
     * 입고이동평균단가(세금제외)
     **/
    private Double grMovingAvgTaxDdctPrc;

    /**
     * 출고이동평균단가
     **/
    private Double giMovingAvgPrc;

    /**
     * 출고이동평균단가(세금제외)
     **/
    private Double giMovingAvgTaxDdctPrc;

    /**
     * 이동평균금액
     **/
    private Double movingAvgAmt;

    /**
     * 이동평균금액(세금제외)
     **/
    private Double movingAvgTaxDdctAmt;

    /**
     * 입고이동평균금액
     **/
    private Double grMovingAvgAmt;

    /**
     * 입고이동평균금액(세금제외)
     **/
    private Double grMovingAvgTaxDdctAmt;

    /**
     * 출고이동평균금액
     **/
    private Double giMovingAvgAmt;

    /**
     * 출고이동평균금액(세금제외)
     **/
    private Double giMovingAvgTaxDdctAmt;

    /**
     * COUNTER판매수량
     **/
    private double ctSaleQty;

    /**
     * COUNTER판매금액
     **/
    private Double ctSaleAmt;

    /**
     * COUNTER판매원가금액
     **/
    private Double ctSaleBaseAmt;

    /**
     * WORKSHOP판매수량
     **/
    private double wksSaleQty;

    /**
     * WORKSHOP판매금액
     **/
    private Double wksSaleAmt;

    /**
     * WORKSHOP판매원가금액
     **/
    private Double wksSaleBaseAmt;

    /**
     * 정비판매수량
     **/
    private double serSaleQty;

    /**
     * 정비판매금액
     **/
    private Double serSaleAmt;

    /**
     * 정비판매원가금액
     **/
    private Double serSaleBaseAmt;

    /**
     * 부품판매수량
     **/
    private double parSaleQty;

    /**
     * 부품판매금액
     **/
    private Double parSaleAmt;

    /**
     * 부품판매원가금액
     **/
    private Double parSaleBaseAmt;

    /**
     * 창고이동출고수량
     **/
    private double strgeMoveGiQty;

    /**
     * 창고이동출고원가금액
     **/
    private Double strgeMoveGiBaseAmt;

    /**
     * 내부수령출고수량
     **/
    private double intRcvGiQty;

    /**
     * 내부수령출고금액
     **/
    private Double intRcvGiAmt;

    /**
     * 내부수령출고원가금액
     **/
    private Double intRcvGiBaseAmt;

    /**
     * 조달출고수량
     **/
    private double obtGiQty;

    /**
     * 조달출고금액
     **/
    private Double obtGiAmt;

    /**
     * 조달출고원가금액
     **/
    private Double obtGiBaseAmt;

    /**
     * 손실출고수량
     **/
    private double lossGiQty;

    /**
     * 손실출고원가금액
     **/
    private Double lossGiBaseAmt;

    /**
     * 기타출고수량
     **/
    private double etcGiQty;

    /**
     * 기타출고금액
     **/
    private Double etcGiAmt;

    /**
     * 기타출고원가금액
     **/
    private Double etcGiBaseAmt;

    /**
     * 당월마감재고수량
     **/
    private double psntMmDdlnStockQty;

    /**
     * 당월마감재고금액
     **/
    private Double psntMmDdlnStockAmt;

    /**
     * 당월마감재고수량
     **/
    private double calcPsntMmDdlnStockQty;

    /**
     * 당월마감재고금액
     **/
    private Double calcPsntMmDdlnStockAmt;

    /**
     * 당월마감재고단가
     **/
    private Double calcPsntMmDdlnStockPrc;

    /**
     * 마감완료여부
     **/
    private String ddlnEndYn;

    /**
     * 마감일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ddlnDt;

    /**
     * 이동창고금액 불포함
     **/
    private Double giMvDiffAmt;

    /**
     * 이동창고 입금금액 불포함
     **/
    private Double grMvDiffAmt;

    /**
     * 이동출고 원가금액 불포함
     **/
    private Double giBaseMvDiffAmt;

    /**
     * 이동입고 금액
     **/
    private Double strgeMvGrAmt;

    /**
     * 이동출고 금액
     **/
    private Double strgeMvGiBaseAmt;

    /**
     * 실사손익 금액
     **/
    private Double palLossAmt;


    /**
     * 전월마감재고금액(세금제외)
     **/
    private Double preMmDdlnStockTaxDdctAmt;

    /**
     * 출고금액(세금제외)
     **/
    private Double giTaxDdctAmt;

    /**
     * 출고원가금액(세금제외)
     **/
    private Double giBaseTaxDdctAmt;

    /**
     * 구매입고금액(세금제외)
     **/
    private Double purcGrTaxDdctAmt;

    /**
     * 조달입고금액(세금제외)
     **/
    private Double obtGrTaxDdctAmt;

    /**
     * 손익입고금액(세금제외)
     **/
    private Double palGrTaxDdctAmt;

    /**
     * 창고이동입고금액(세금제외)
     **/
    private Double strgeMoveGrTaxDdctAmt;

    /**
     * 기타입고금액(세금제외)
     **/
    private Double etcGrTaxDdctAmt;

    /**
     * 이동평균단가(세금제외)
     **/
    private Double moveAvgTaxDdctPrc;

    /**
     * COUNTER판매금액(세금제외)
     **/
    private Double ctSaleTaxDdctAmt;

    /**
     * COUNTER판매원가금액(세금제외)
     **/
    private Double ctSaleBaseTaxDdctAmt;

    /**
     * WORKSHOP판매금액(세금제외)
     **/
    private Double wksSaleTaxDdctAmt;

    /**
     * WORKSHOP판매원가금액(세금제외)
     **/
    private Double wksSaleBaseTaxDdctAmt;

    /**
     * 창고이동출고원가금액(세금제외)
     **/
    private Double strgeMoveGiBaseTaxDdctAmt;

    /**
     * 내부수령출고금액(세금제외)
     **/
    private Double intRcvGiTaxDdctAmt;

    /**
     * 내부수령출고원가금액(세금제외)
     **/
    private Double intRcvGiBaseTaxDdctAmt;

    /**
     * 조달출고금액(세금제외)
     **/
    private Double obtGiTaxDdctAmt;

    /**
     * 조달출고원가금액(세금제외)
     **/
    private Double obtGiBaseTaxDdctAmt;

    /**
     * 손실출고원가금액(세금제외)
     **/
    private Double lossGiBaseTaxDdctAmt;

    /**
     * 기타출고금액(세금제외)
     **/
    private Double etcGiTaxDdctAmt;

    /**
     * 기타출고원가금액(세금제외)
     **/
    private Double etcGiBaseTaxDdctAmt;

    /**
     * 당월마감재고금액(세금제외)
     **/
    private Double psntMmDdlnStockTaxDdctAmt;

    /**
     * 당월마감이평가(세금제외)
     **/
    private Double psntMmDdlnMoveAvgTaxDdctPrc;

    /**
     * 정비판매금액(세금제외)
     **/
    private Double serSaleTaxDdctAmt;

    /**
     * 정비판매원가금액(세금제외)
     **/
    private Double serSaleBaseTaxDdctAmt;

    /**
     * 입고금액(세금제외)
     **/
    private Double grTaxDdctAmt;

    /**
     * @return the giMvDiffAmt
     */
    public Double getGiMvDiffAmt() {
        return giMvDiffAmt;
    }

    /**
     * @param giMvDiffAmt the giMvDiffAmt to set
     */
    public void setGiMvDiffAmt(Double giMvDiffAmt) {
        this.giMvDiffAmt = giMvDiffAmt;
    }

    /**
     * @return the grMvDiffAmt
     */
    public Double getGrMvDiffAmt() {
        return grMvDiffAmt;
    }

    /**
     * @param grMvDiffAmt the grMvDiffAmt to set
     */
    public void setGrMvDiffAmt(Double grMvDiffAmt) {
        this.grMvDiffAmt = grMvDiffAmt;
    }

    /**
     * @return the giBaseMvDiffAmt
     */
    public Double getGiBaseMvDiffAmt() {
        return giBaseMvDiffAmt;
    }

    /**
     * @param giBaseMvDiffAmt the giBaseMvDiffAmt to set
     */
    public void setGiBaseMvDiffAmt(Double giBaseMvDiffAmt) {
        this.giBaseMvDiffAmt = giBaseMvDiffAmt;
    }

    /**
     * @return the strgeMvGrAmt
     */
    public Double getStrgeMvGrAmt() {
        return strgeMvGrAmt;
    }

    /**
     * @param strgeMvGrAmt the strgeMvGrAmt to set
     */
    public void setStrgeMvGrAmt(Double strgeMvGrAmt) {
        this.strgeMvGrAmt = strgeMvGrAmt;
    }

    /**
     * @return the strgeMvGiBaseAmt
     */
    public Double getStrgeMvGiBaseAmt() {
        return strgeMvGiBaseAmt;
    }

    /**
     * @param strgeMvGiBaseAmt the strgeMvGiBaseAmt to set
     */
    public void setStrgeMvGiBaseAmt(Double strgeMvGiBaseAmt) {
        this.strgeMvGiBaseAmt = strgeMvGiBaseAmt;
    }

    /**
     * @return the palLossAmt
     */
    public Double getPalLossAmt() {
        return palLossAmt;
    }

    /**
     * @param palLossAmt the palLossAmt to set
     */
    public void setPalLossAmt(Double palLossAmt) {
        this.palLossAmt = palLossAmt;
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
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the yyMm
     */
    public String getYyMm() {
        return yyMm;
    }

    /**
     * @param yyMm the yyMm to set
     */
    public void setYyMm(String yyMm) {
        this.yyMm = yyMm;
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
     * @return the itemTp
     */
    public String getItemTp() {
        return itemTp;
    }

    /**
     * @param itemTp the itemTp to set
     */
    public void setItemTp(String itemTp) {
        this.itemTp = itemTp;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }

    /**
     * @return the preMmDdlnStockQty
     */
    public double getPreMmDdlnStockQty() {
        return preMmDdlnStockQty;
    }

    /**
     * @param preMmDdlnStockQty the preMmDdlnStockQty to set
     */
    public void setPreMmDdlnStockQty(double preMmDdlnStockQty) {
        this.preMmDdlnStockQty = preMmDdlnStockQty;
    }

    /**
     * @return the preMmDdlnStockAmt
     */
    public Double getPreMmDdlnStockAmt() {
        return preMmDdlnStockAmt;
    }

    /**
     * @param preMmDdlnStockAmt the preMmDdlnStockAmt to set
     */
    public void setPreMmDdlnStockAmt(Double preMmDdlnStockAmt) {
        this.preMmDdlnStockAmt = preMmDdlnStockAmt;
    }

    /**
     * @return the grQty
     */
    public double getGrQty() {
        return grQty;
    }

    /**
     * @param grQty the grQty to set
     */
    public void setGrQty(double grQty) {
        this.grQty = grQty;
    }

    /**
     * @return the grAmt
     */
    public Double getGrAmt() {
        return grAmt;
    }

    /**
     * @param grAmt the grAmt to set
     */
    public void setGrAmt(Double grAmt) {
        this.grAmt = grAmt;
    }

    /**
     * @return the giQty
     */
    public double getGiQty() {
        return giQty;
    }

    /**
     * @param giQty the giQty to set
     */
    public void setGiQty(double giQty) {
        this.giQty = giQty;
    }

    /**
     * @return the giAmt
     */
    public Double getGiAmt() {
        return giAmt;
    }

    /**
     * @param giAmt the giAmt to set
     */
    public void setGiAmt(Double giAmt) {
        this.giAmt = giAmt;
    }

    /**
     * @return the giBaseAmt
     */
    public Double getGiBaseAmt() {
        return giBaseAmt;
    }

    /**
     * @param giBaseAmt the giBaseAmt to set
     */
    public void setGiBaseAmt(Double giBaseAmt) {
        this.giBaseAmt = giBaseAmt;
    }

    /**
     * @return the purcGrQty
     */
    public double getPurcGrQty() {
        return purcGrQty;
    }

    /**
     * @param purcGrQty the purcGrQty to set
     */
    public void setPurcGrQty(double purcGrQty) {
        this.purcGrQty = purcGrQty;
    }

    /**
     * @return the purcGrAmt
     */
    public Double getPurcGrAmt() {
        return purcGrAmt;
    }

    /**
     * @param purcGrAmt the purcGrAmt to set
     */
    public void setPurcGrAmt(Double purcGrAmt) {
        this.purcGrAmt = purcGrAmt;
    }

    /**
     * @return the obtGrQty
     */
    public double getObtGrQty() {
        return obtGrQty;
    }

    /**
     * @param obtGrQty the obtGrQty to set
     */
    public void setObtGrQty(double obtGrQty) {
        this.obtGrQty = obtGrQty;
    }

    /**
     * @return the obtGrAmt
     */
    public Double getObtGrAmt() {
        return obtGrAmt;
    }

    /**
     * @param obtGrAmt the obtGrAmt to set
     */
    public void setObtGrAmt(Double obtGrAmt) {
        this.obtGrAmt = obtGrAmt;
    }

    /**
     * @return the palGrQty
     */
    public double getPalGrQty() {
        return palGrQty;
    }

    /**
     * @param palGrQty the palGrQty to set
     */
    public void setPalGrQty(double palGrQty) {
        this.palGrQty = palGrQty;
    }

    /**
     * @return the palGrAmt
     */
    public Double getPalGrAmt() {
        return palGrAmt;
    }

    /**
     * @param palGrAmt the palGrAmt to set
     */
    public void setPalGrAmt(Double palGrAmt) {
        this.palGrAmt = palGrAmt;
    }

    /**
     * @return the strgeMoveGrQty
     */
    public double getStrgeMoveGrQty() {
        return strgeMoveGrQty;
    }

    /**
     * @param strgeMoveGrQty the strgeMoveGrQty to set
     */
    public void setStrgeMoveGrQty(double strgeMoveGrQty) {
        this.strgeMoveGrQty = strgeMoveGrQty;
    }

    /**
     * @return the strgeMoveGrAmt
     */
    public Double getStrgeMoveGrAmt() {
        return strgeMoveGrAmt;
    }

    /**
     * @param strgeMoveGrAmt the strgeMoveGrAmt to set
     */
    public void setStrgeMoveGrAmt(Double strgeMoveGrAmt) {
        this.strgeMoveGrAmt = strgeMoveGrAmt;
    }

    /**
     * @return the etcGrQty
     */
    public double getEtcGrQty() {
        return etcGrQty;
    }

    /**
     * @param etcGrQty the etcGrQty to set
     */
    public void setEtcGrQty(double etcGrQty) {
        this.etcGrQty = etcGrQty;
    }

    /**
     * @return the etcGrAmt
     */
    public Double getEtcGrAmt() {
        return etcGrAmt;
    }

    /**
     * @param etcGrAmt the etcGrAmt to set
     */
    public void setEtcGrAmt(Double etcGrAmt) {
        this.etcGrAmt = etcGrAmt;
    }

    /**
     * @return the ctSaleQty
     */
    public double getCtSaleQty() {
        return ctSaleQty;
    }

    /**
     * @param ctSaleQty the ctSaleQty to set
     */
    public void setCtSaleQty(double ctSaleQty) {
        this.ctSaleQty = ctSaleQty;
    }

    /**
     * @return the ctSaleAmt
     */
    public Double getCtSaleAmt() {
        return ctSaleAmt;
    }

    /**
     * @param ctSaleAmt the ctSaleAmt to set
     */
    public void setCtSaleAmt(Double ctSaleAmt) {
        this.ctSaleAmt = ctSaleAmt;
    }

    /**
     * @return the ctSaleBaseAmt
     */
    public Double getCtSaleBaseAmt() {
        return ctSaleBaseAmt;
    }

    /**
     * @param ctSaleBaseAmt the ctSaleBaseAmt to set
     */
    public void setCtSaleBaseAmt(Double ctSaleBaseAmt) {
        this.ctSaleBaseAmt = ctSaleBaseAmt;
    }

    /**
     * @return the wksSaleQty
     */
    public double getWksSaleQty() {
        return wksSaleQty;
    }

    /**
     * @param wksSaleQty the wksSaleQty to set
     */
    public void setWksSaleQty(double wksSaleQty) {
        this.wksSaleQty = wksSaleQty;
    }

    /**
     * @return the wksSaleAmt
     */
    public Double getWksSaleAmt() {
        return wksSaleAmt;
    }

    /**
     * @param wksSaleAmt the wksSaleAmt to set
     */
    public void setWksSaleAmt(Double wksSaleAmt) {
        this.wksSaleAmt = wksSaleAmt;
    }

    /**
     * @return the wksSaleBaseAmt
     */
    public Double getWksSaleBaseAmt() {
        return wksSaleBaseAmt;
    }

    /**
     * @param wksSaleBaseAmt the wksSaleBaseAmt to set
     */
    public void setWksSaleBaseAmt(Double wksSaleBaseAmt) {
        this.wksSaleBaseAmt = wksSaleBaseAmt;
    }

    /**
     * @return the strgeMoveGiQty
     */
    public double getStrgeMoveGiQty() {
        return strgeMoveGiQty;
    }

    /**
     * @param strgeMoveGiQty the strgeMoveGiQty to set
     */
    public void setStrgeMoveGiQty(double strgeMoveGiQty) {
        this.strgeMoveGiQty = strgeMoveGiQty;
    }

    /**
     * @return the strgeMoveGiBaseAmt
     */
    public Double getStrgeMoveGiBaseAmt() {
        return strgeMoveGiBaseAmt;
    }

    /**
     * @param strgeMoveGiBaseAmt the strgeMoveGiBaseAmt to set
     */
    public void setStrgeMoveGiBaseAmt(Double strgeMoveGiBaseAmt) {
        this.strgeMoveGiBaseAmt = strgeMoveGiBaseAmt;
    }

    /**
     * @return the intRcvGiQty
     */
    public double getIntRcvGiQty() {
        return intRcvGiQty;
    }

    /**
     * @param intRcvGiQty the intRcvGiQty to set
     */
    public void setIntRcvGiQty(double intRcvGiQty) {
        this.intRcvGiQty = intRcvGiQty;
    }

    /**
     * @return the intRcvGiAmt
     */
    public Double getIntRcvGiAmt() {
        return intRcvGiAmt;
    }

    /**
     * @param intRcvGiAmt the intRcvGiAmt to set
     */
    public void setIntRcvGiAmt(Double intRcvGiAmt) {
        this.intRcvGiAmt = intRcvGiAmt;
    }

    /**
     * @return the intRcvGiBaseAmt
     */
    public Double getIntRcvGiBaseAmt() {
        return intRcvGiBaseAmt;
    }

    /**
     * @param intRcvGiBaseAmt the intRcvGiBaseAmt to set
     */
    public void setIntRcvGiBaseAmt(Double intRcvGiBaseAmt) {
        this.intRcvGiBaseAmt = intRcvGiBaseAmt;
    }

    /**
     * @return the obtGiQty
     */
    public double getObtGiQty() {
        return obtGiQty;
    }

    /**
     * @param obtGiQty the obtGiQty to set
     */
    public void setObtGiQty(double obtGiQty) {
        this.obtGiQty = obtGiQty;
    }

    /**
     * @return the obtGiAmt
     */
    public Double getObtGiAmt() {
        return obtGiAmt;
    }

    /**
     * @param obtGiAmt the obtGiAmt to set
     */
    public void setObtGiAmt(Double obtGiAmt) {
        this.obtGiAmt = obtGiAmt;
    }

    /**
     * @return the obtGiBaseAmt
     */
    public Double getObtGiBaseAmt() {
        return obtGiBaseAmt;
    }

    /**
     * @param obtGiBaseAmt the obtGiBaseAmt to set
     */
    public void setObtGiBaseAmt(Double obtGiBaseAmt) {
        this.obtGiBaseAmt = obtGiBaseAmt;
    }

    /**
     * @return the lossGiQty
     */
    public double getLossGiQty() {
        return lossGiQty;
    }

    /**
     * @param lossGiQty the lossGiQty to set
     */
    public void setLossGiQty(double lossGiQty) {
        this.lossGiQty = lossGiQty;
    }

    /**
     * @return the lossGiBaseAmt
     */
    public Double getLossGiBaseAmt() {
        return lossGiBaseAmt;
    }

    /**
     * @param lossGiBaseAmt the lossGiBaseAmt to set
     */
    public void setLossGiBaseAmt(Double lossGiBaseAmt) {
        this.lossGiBaseAmt = lossGiBaseAmt;
    }

    /**
     * @return the etcGiQty
     */
    public double getEtcGiQty() {
        return etcGiQty;
    }

    /**
     * @param etcGiQty the etcGiQty to set
     */
    public void setEtcGiQty(double etcGiQty) {
        this.etcGiQty = etcGiQty;
    }

    /**
     * @return the etcGiAmt
     */
    public Double getEtcGiAmt() {
        return etcGiAmt;
    }

    /**
     * @param etcGiAmt the etcGiAmt to set
     */
    public void setEtcGiAmt(Double etcGiAmt) {
        this.etcGiAmt = etcGiAmt;
    }

    /**
     * @return the etcGiBaseAmt
     */
    public Double getEtcGiBaseAmt() {
        return etcGiBaseAmt;
    }

    /**
     * @param etcGiBaseAmt the etcGiBaseAmt to set
     */
    public void setEtcGiBaseAmt(Double etcGiBaseAmt) {
        this.etcGiBaseAmt = etcGiBaseAmt;
    }

    /**
     * @return the psntMmDdlnStockQty
     */
    public double getPsntMmDdlnStockQty() {
        return psntMmDdlnStockQty;
    }

    /**
     * @param psntMmDdlnStockQty the psntMmDdlnStockQty to set
     */
    public void setPsntMmDdlnStockQty(double psntMmDdlnStockQty) {
        this.psntMmDdlnStockQty = psntMmDdlnStockQty;
    }

    /**
     * @return the psntMmDdlnStockAmt
     */
    public Double getPsntMmDdlnStockAmt() {
        return psntMmDdlnStockAmt;
    }

    /**
     * @param psntMmDdlnStockAmt the psntMmDdlnStockAmt to set
     */
    public void setPsntMmDdlnStockAmt(Double psntMmDdlnStockAmt) {
        this.psntMmDdlnStockAmt = psntMmDdlnStockAmt;
    }

    /**
     * @return the ddlnEndYn
     */
    public String getDdlnEndYn() {
        return ddlnEndYn;
    }

    /**
     * @param ddlnEndYn the ddlnEndYn to set
     */
    public void setDdlnEndYn(String ddlnEndYn) {
        this.ddlnEndYn = ddlnEndYn;
    }

    /**
     * @return the ddlnDt
     */
    public Date getDdlnDt() {
        return ddlnDt;
    }

    /**
     * @param ddlnDt the ddlnDt to set
     */
    public void setDdlnDt(Date ddlnDt) {
        this.ddlnDt = ddlnDt;
    }

    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }

    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
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
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }

    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }

    /**
     * @return the firstTp
     */
    public String getFirstTp() {
        return firstTp;
    }

    /**
     * @param firstTp the firstTp to set
     */
    public void setFirstTp(String firstTp) {
        this.firstTp = firstTp;
    }

    /**
     * @return the secondTp
     */
    public String getSecondTp() {
        return secondTp;
    }

    /**
     * @param secondTp the secondTp to set
     */
    public void setSecondTp(String secondTp) {
        this.secondTp = secondTp;
    }

    /**
     * @return the thirdTp
     */
    public String getThirdTp() {
        return thirdTp;
    }

    /**
     * @param thirdTp the thirdTp to set
     */
    public void setThirdTp(String thirdTp) {
        this.thirdTp = thirdTp;
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
     * @return the preMmDdlnStockPrc
     */
    public Double getPreMmDdlnStockPrc() {
        return preMmDdlnStockPrc;
    }

    /**
     * @param preMmDdlnStockPrc the preMmDdlnStockPrc to set
     */
    public void setPreMmDdlnStockPrc(Double preMmDdlnStockPrc) {
        this.preMmDdlnStockPrc = preMmDdlnStockPrc;
    }

    /**
     * @return the calcPreMmDdlnStockPrc
     */
    public Double getCalcPreMmDdlnStockPrc() {
        return calcPreMmDdlnStockPrc;
    }

    /**
     * @param calcPreMmDdlnStockPrc the calcPreMmDdlnStockPrc to set
     */
    public void setCalcPreMmDdlnStockPrc(Double calcPreMmDdlnStockPrc) {
        this.calcPreMmDdlnStockPrc = calcPreMmDdlnStockPrc;
    }

    /**
     * @return the serSaleQty
     */
    public double getSerSaleQty() {
        return serSaleQty;
    }

    /**
     * @param serSaleQty the serSaleQty to set
     */
    public void setSerSaleQty(double serSaleQty) {
        this.serSaleQty = serSaleQty;
    }

    /**
     * @return the serSaleAmt
     */
    public Double getSerSaleAmt() {
        return serSaleAmt;
    }

    /**
     * @param serSaleAmt the serSaleAmt to set
     */
    public void setSerSaleAmt(Double serSaleAmt) {
        this.serSaleAmt = serSaleAmt;
    }

    /**
     * @return the serSaleBaseAmt
     */
    public Double getSerSaleBaseAmt() {
        return serSaleBaseAmt;
    }

    /**
     * @param serSaleBaseAmt the serSaleBaseAmt to set
     */
    public void setSerSaleBaseAmt(Double serSaleBaseAmt) {
        this.serSaleBaseAmt = serSaleBaseAmt;
    }

    /**
     * @return the parSaleQty
     */
    public double getParSaleQty() {
        return parSaleQty;
    }

    /**
     * @param parSaleQty the parSaleQty to set
     */
    public void setParSaleQty(double parSaleQty) {
        this.parSaleQty = parSaleQty;
    }

    /**
     * @return the parSaleAmt
     */
    public Double getParSaleAmt() {
        return parSaleAmt;
    }

    /**
     * @param parSaleAmt the parSaleAmt to set
     */
    public void setParSaleAmt(Double parSaleAmt) {
        this.parSaleAmt = parSaleAmt;
    }

    /**
     * @return the parSaleBaseAmt
     */
    public Double getParSaleBaseAmt() {
        return parSaleBaseAmt;
    }

    /**
     * @param parSaleBaseAmt the parSaleBaseAmt to set
     */
    public void setParSaleBaseAmt(Double parSaleBaseAmt) {
        this.parSaleBaseAmt = parSaleBaseAmt;
    }

    /**
     * @return the itemDstinCd
     */
    public String getItemDstinCd() {
        return itemDstinCd;
    }

    /**
     * @param itemDstinCd the itemDstinCd to set
     */
    public void setItemDstinCd(String itemDstinCd) {
        this.itemDstinCd = itemDstinCd;
    }

    /**
     * @return the psntMmDdlnStockPrc
     */
    public Double getPsntMmDdlnStockPrc() {
        return psntMmDdlnStockPrc;
    }

    /**
     * @param psntMmDdlnStockPrc the psntMmDdlnStockPrc to set
     */
    public void setPsntMmDdlnStockPrc(Double psntMmDdlnStockPrc) {
        this.psntMmDdlnStockPrc = psntMmDdlnStockPrc;
    }

    /**
     * @return the movingAvgPrc
     */
    public Double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(Double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the currentMovingAvgPrc
     */
    public Double getCurrentMovingAvgPrc() {
        return currentMovingAvgPrc;
    }

    /**
     * @param currentMovingAvgPrc the currentMovingAvgPrc to set
     */
    public void setCurrentMovingAvgPrc(Double currentMovingAvgPrc) {
        this.currentMovingAvgPrc = currentMovingAvgPrc;
    }

    /**
     * @return the movingAvgTaxDdctPrc
     */
    public Double getMovingAvgTaxDdctPrc() {
        return movingAvgTaxDdctPrc;
    }

    /**
     * @param movingAvgTaxDdctPrc the movingAvgTaxDdctPrc to set
     */
    public void setMovingAvgTaxDdctPrc(Double movingAvgTaxDdctPrc) {
        this.movingAvgTaxDdctPrc = movingAvgTaxDdctPrc;
    }

    /**
     * @return the movingAvgAmt
     */
    public Double getMovingAvgAmt() {
        return movingAvgAmt;
    }

    /**
     * @param movingAvgAmt the movingAvgAmt to set
     */
    public void setMovingAvgAmt(Double movingAvgAmt) {
        this.movingAvgAmt = movingAvgAmt;
    }

    /**
     * @return the movingAvgTaxDdctAmt
     */
    public Double getMovingAvgTaxDdctAmt() {
        return movingAvgTaxDdctAmt;
    }

    /**
     * @param movingAvgTaxDdctAmt the movingAvgTaxDdctAmt to set
     */
    public void setMovingAvgTaxDdctAmt(Double movingAvgTaxDdctAmt) {
        this.movingAvgTaxDdctAmt = movingAvgTaxDdctAmt;
    }

    /**
     * @return the grMovingAvgPrc
     */
    public Double getGrMovingAvgPrc() {
        return grMovingAvgPrc;
    }

    /**
     * @param grMovingAvgPrc the grMovingAvgPrc to set
     */
    public void setGrMovingAvgPrc(Double grMovingAvgPrc) {
        this.grMovingAvgPrc = grMovingAvgPrc;
    }

    /**
     * @return the grMovingAvgTaxDdctPrc
     */
    public Double getGrMovingAvgTaxDdctPrc() {
        return grMovingAvgTaxDdctPrc;
    }

    /**
     * @param grMovingAvgTaxDdctPrc the grMovingAvgTaxDdctPrc to set
     */
    public void setGrMovingAvgTaxDdctPrc(Double grMovingAvgTaxDdctPrc) {
        this.grMovingAvgTaxDdctPrc = grMovingAvgTaxDdctPrc;
    }

    /**
     * @return the giMovingAvgPrc
     */
    public Double getGiMovingAvgPrc() {
        return giMovingAvgPrc;
    }

    /**
     * @param giMovingAvgPrc the giMovingAvgPrc to set
     */
    public void setGiMovingAvgPrc(Double giMovingAvgPrc) {
        this.giMovingAvgPrc = giMovingAvgPrc;
    }

    /**
     * @return the giMovingAvgTaxDdctPrc
     */
    public Double getGiMovingAvgTaxDdctPrc() {
        return giMovingAvgTaxDdctPrc;
    }

    /**
     * @param giMovingAvgTaxDdctPrc the giMovingAvgTaxDdctPrc to set
     */
    public void setGiMovingAvgTaxDdctPrc(Double giMovingAvgTaxDdctPrc) {
        this.giMovingAvgTaxDdctPrc = giMovingAvgTaxDdctPrc;
    }

    /**
     * @return the grMovingAvgAmt
     */
    public Double getGrMovingAvgAmt() {
        return grMovingAvgAmt;
    }

    /**
     * @param grMovingAvgAmt the grMovingAvgAmt to set
     */
    public void setGrMovingAvgAmt(Double grMovingAvgAmt) {
        this.grMovingAvgAmt = grMovingAvgAmt;
    }

    /**
     * @return the grMovingAvgTaxDdctAmt
     */
    public Double getGrMovingAvgTaxDdctAmt() {
        return grMovingAvgTaxDdctAmt;
    }

    /**
     * @param grMovingAvgTaxDdctAmt the grMovingAvgTaxDdctAmt to set
     */
    public void setGrMovingAvgTaxDdctAmt(Double grMovingAvgTaxDdctAmt) {
        this.grMovingAvgTaxDdctAmt = grMovingAvgTaxDdctAmt;
    }

    /**
     * @return the giMovingAvgAmt
     */
    public Double getGiMovingAvgAmt() {
        return giMovingAvgAmt;
    }

    /**
     * @param giMovingAvgAmt the giMovingAvgAmt to set
     */
    public void setGiMovingAvgAmt(Double giMovingAvgAmt) {
        this.giMovingAvgAmt = giMovingAvgAmt;
    }

    /**
     * @return the giMovingAvgTaxDdctAmt
     */
    public Double getGiMovingAvgTaxDdctAmt() {
        return giMovingAvgTaxDdctAmt;
    }

    /**
     * @param giMovingAvgTaxDdctAmt the giMovingAvgTaxDdctAmt to set
     */
    public void setGiMovingAvgTaxDdctAmt(Double giMovingAvgTaxDdctAmt) {
        this.giMovingAvgTaxDdctAmt = giMovingAvgTaxDdctAmt;
    }

    /**
     * @return the calcPsntMmDdlnStockQty
     */
    public double getCalcPsntMmDdlnStockQty() {
        return calcPsntMmDdlnStockQty;
    }

    /**
     * @param calcPsntMmDdlnStockQty the calcPsntMmDdlnStockQty to set
     */
    public void setCalcPsntMmDdlnStockQty(double calcPsntMmDdlnStockQty) {
        this.calcPsntMmDdlnStockQty = calcPsntMmDdlnStockQty;
    }

    /**
     * @return the calcPsntMmDdlnStockAmt
     */
    public Double getCalcPsntMmDdlnStockAmt() {
        return calcPsntMmDdlnStockAmt;
    }

    /**
     * @param calcPsntMmDdlnStockAmt the calcPsntMmDdlnStockAmt to set
     */
    public void setCalcPsntMmDdlnStockAmt(Double calcPsntMmDdlnStockAmt) {
        this.calcPsntMmDdlnStockAmt = calcPsntMmDdlnStockAmt;
    }

    /**
     * @return the calcPsntMmDdlnStockPrc
     */
    public Double getCalcPsntMmDdlnStockPrc() {
        return calcPsntMmDdlnStockPrc;
    }

    /**
     * @param calcPsntMmDdlnStockPrc the calcPsntMmDdlnStockPrc to set
     */
    public void setCalcPsntMmDdlnStockPrc(Double calcPsntMmDdlnStockPrc) {
        this.calcPsntMmDdlnStockPrc = calcPsntMmDdlnStockPrc;
    }

    /**
     * @return the preMmDdlnStockTaxDdctAmt
     */
    public Double getPreMmDdlnStockTaxDdctAmt() {
        return preMmDdlnStockTaxDdctAmt;
    }

    /**
     * @param preMmDdlnStockTaxDdctAmt the preMmDdlnStockTaxDdctAmt to set
     */
    public void setPreMmDdlnStockTaxDdctAmt(Double preMmDdlnStockTaxDdctAmt) {
        this.preMmDdlnStockTaxDdctAmt = preMmDdlnStockTaxDdctAmt;
    }

    /**
     * @return the giTaxDdctAmt
     */
    public Double getGiTaxDdctAmt() {
        return giTaxDdctAmt;
    }

    /**
     * @param giTaxDdctAmt the giTaxDdctAmt to set
     */
    public void setGiTaxDdctAmt(Double giTaxDdctAmt) {
        this.giTaxDdctAmt = giTaxDdctAmt;
    }

    /**
     * @return the giBaseTaxDdctAmt
     */
    public Double getGiBaseTaxDdctAmt() {
        return giBaseTaxDdctAmt;
    }

    /**
     * @param giBaseTaxDdctAmt the giBaseTaxDdctAmt to set
     */
    public void setGiBaseTaxDdctAmt(Double giBaseTaxDdctAmt) {
        this.giBaseTaxDdctAmt = giBaseTaxDdctAmt;
    }

    /**
     * @return the purcGrTaxDdctAmt
     */
    public Double getPurcGrTaxDdctAmt() {
        return purcGrTaxDdctAmt;
    }

    /**
     * @param purcGrTaxDdctAmt the purcGrTaxDdctAmt to set
     */
    public void setPurcGrTaxDdctAmt(Double purcGrTaxDdctAmt) {
        this.purcGrTaxDdctAmt = purcGrTaxDdctAmt;
    }

    /**
     * @return the obtGrTaxDdctAmt
     */
    public Double getObtGrTaxDdctAmt() {
        return obtGrTaxDdctAmt;
    }

    /**
     * @param obtGrTaxDdctAmt the obtGrTaxDdctAmt to set
     */
    public void setObtGrTaxDdctAmt(Double obtGrTaxDdctAmt) {
        this.obtGrTaxDdctAmt = obtGrTaxDdctAmt;
    }

    /**
     * @return the palGrTaxDdctAmt
     */
    public Double getPalGrTaxDdctAmt() {
        return palGrTaxDdctAmt;
    }

    /**
     * @param palGrTaxDdctAmt the palGrTaxDdctAmt to set
     */
    public void setPalGrTaxDdctAmt(Double palGrTaxDdctAmt) {
        this.palGrTaxDdctAmt = palGrTaxDdctAmt;
    }

    /**
     * @return the strgeMoveGrTaxDdctAmt
     */
    public Double getStrgeMoveGrTaxDdctAmt() {
        return strgeMoveGrTaxDdctAmt;
    }

    /**
     * @param strgeMoveGrTaxDdctAmt the strgeMoveGrTaxDdctAmt to set
     */
    public void setStrgeMoveGrTaxDdctAmt(Double strgeMoveGrTaxDdctAmt) {
        this.strgeMoveGrTaxDdctAmt = strgeMoveGrTaxDdctAmt;
    }

    /**
     * @return the etcGrTaxDdctAmt
     */
    public Double getEtcGrTaxDdctAmt() {
        return etcGrTaxDdctAmt;
    }

    /**
     * @param etcGrTaxDdctAmt the etcGrTaxDdctAmt to set
     */
    public void setEtcGrTaxDdctAmt(Double etcGrTaxDdctAmt) {
        this.etcGrTaxDdctAmt = etcGrTaxDdctAmt;
    }

    /**
     * @return the moveAvgTaxDdctPrc
     */
    public Double getMoveAvgTaxDdctPrc() {
        return moveAvgTaxDdctPrc;
    }

    /**
     * @param moveAvgTaxDdctPrc the moveAvgTaxDdctPrc to set
     */
    public void setMoveAvgTaxDdctPrc(Double moveAvgTaxDdctPrc) {
        this.moveAvgTaxDdctPrc = moveAvgTaxDdctPrc;
    }

    /**
     * @return the ctSaleTaxDdctAmt
     */
    public Double getCtSaleTaxDdctAmt() {
        return ctSaleTaxDdctAmt;
    }

    /**
     * @param ctSaleTaxDdctAmt the ctSaleTaxDdctAmt to set
     */
    public void setCtSaleTaxDdctAmt(Double ctSaleTaxDdctAmt) {
        this.ctSaleTaxDdctAmt = ctSaleTaxDdctAmt;
    }

    /**
     * @return the ctSaleBaseTaxDdctAmt
     */
    public Double getCtSaleBaseTaxDdctAmt() {
        return ctSaleBaseTaxDdctAmt;
    }

    /**
     * @param ctSaleBaseTaxDdctAmt the ctSaleBaseTaxDdctAmt to set
     */
    public void setCtSaleBaseTaxDdctAmt(Double ctSaleBaseTaxDdctAmt) {
        this.ctSaleBaseTaxDdctAmt = ctSaleBaseTaxDdctAmt;
    }

    /**
     * @return the wksSaleTaxDdctAmt
     */
    public Double getWksSaleTaxDdctAmt() {
        return wksSaleTaxDdctAmt;
    }

    /**
     * @param wksSaleTaxDdctAmt the wksSaleTaxDdctAmt to set
     */
    public void setWksSaleTaxDdctAmt(Double wksSaleTaxDdctAmt) {
        this.wksSaleTaxDdctAmt = wksSaleTaxDdctAmt;
    }

    /**
     * @return the wksSaleBaseTaxDdctAmt
     */
    public Double getWksSaleBaseTaxDdctAmt() {
        return wksSaleBaseTaxDdctAmt;
    }

    /**
     * @param wksSaleBaseTaxDdctAmt the wksSaleBaseTaxDdctAmt to set
     */
    public void setWksSaleBaseTaxDdctAmt(Double wksSaleBaseTaxDdctAmt) {
        this.wksSaleBaseTaxDdctAmt = wksSaleBaseTaxDdctAmt;
    }

    /**
     * @return the strgeMoveGiBaseTaxDdctAmt
     */
    public Double getStrgeMoveGiBaseTaxDdctAmt() {
        return strgeMoveGiBaseTaxDdctAmt;
    }

    /**
     * @param strgeMoveGiBaseTaxDdctAmt the strgeMoveGiBaseTaxDdctAmt to set
     */
    public void setStrgeMoveGiBaseTaxDdctAmt(Double strgeMoveGiBaseTaxDdctAmt) {
        this.strgeMoveGiBaseTaxDdctAmt = strgeMoveGiBaseTaxDdctAmt;
    }

    /**
     * @return the intRcvGiTaxDdctAmt
     */
    public Double getIntRcvGiTaxDdctAmt() {
        return intRcvGiTaxDdctAmt;
    }

    /**
     * @param intRcvGiTaxDdctAmt the intRcvGiTaxDdctAmt to set
     */
    public void setIntRcvGiTaxDdctAmt(Double intRcvGiTaxDdctAmt) {
        this.intRcvGiTaxDdctAmt = intRcvGiTaxDdctAmt;
    }

    /**
     * @return the intRcvGiBaseTaxDdctAmt
     */
    public Double getIntRcvGiBaseTaxDdctAmt() {
        return intRcvGiBaseTaxDdctAmt;
    }

    /**
     * @param intRcvGiBaseTaxDdctAmt the intRcvGiBaseTaxDdctAmt to set
     */
    public void setIntRcvGiBaseTaxDdctAmt(Double intRcvGiBaseTaxDdctAmt) {
        this.intRcvGiBaseTaxDdctAmt = intRcvGiBaseTaxDdctAmt;
    }

    /**
     * @return the obtGiTaxDdctAmt
     */
    public Double getObtGiTaxDdctAmt() {
        return obtGiTaxDdctAmt;
    }

    /**
     * @param obtGiTaxDdctAmt the obtGiTaxDdctAmt to set
     */
    public void setObtGiTaxDdctAmt(Double obtGiTaxDdctAmt) {
        this.obtGiTaxDdctAmt = obtGiTaxDdctAmt;
    }

    /**
     * @return the obtGiBaseTaxDdctAmt
     */
    public Double getObtGiBaseTaxDdctAmt() {
        return obtGiBaseTaxDdctAmt;
    }

    /**
     * @param obtGiBaseTaxDdctAmt the obtGiBaseTaxDdctAmt to set
     */
    public void setObtGiBaseTaxDdctAmt(Double obtGiBaseTaxDdctAmt) {
        this.obtGiBaseTaxDdctAmt = obtGiBaseTaxDdctAmt;
    }

    /**
     * @return the lossGiBaseTaxDdctAmt
     */
    public Double getLossGiBaseTaxDdctAmt() {
        return lossGiBaseTaxDdctAmt;
    }

    /**
     * @param lossGiBaseTaxDdctAmt the lossGiBaseTaxDdctAmt to set
     */
    public void setLossGiBaseTaxDdctAmt(Double lossGiBaseTaxDdctAmt) {
        this.lossGiBaseTaxDdctAmt = lossGiBaseTaxDdctAmt;
    }

    /**
     * @return the etcGiTaxDdctAmt
     */
    public Double getEtcGiTaxDdctAmt() {
        return etcGiTaxDdctAmt;
    }

    /**
     * @param etcGiTaxDdctAmt the etcGiTaxDdctAmt to set
     */
    public void setEtcGiTaxDdctAmt(Double etcGiTaxDdctAmt) {
        this.etcGiTaxDdctAmt = etcGiTaxDdctAmt;
    }

    /**
     * @return the etcGiBaseTaxDdctAmt
     */
    public Double getEtcGiBaseTaxDdctAmt() {
        return etcGiBaseTaxDdctAmt;
    }

    /**
     * @param etcGiBaseTaxDdctAmt the etcGiBaseTaxDdctAmt to set
     */
    public void setEtcGiBaseTaxDdctAmt(Double etcGiBaseTaxDdctAmt) {
        this.etcGiBaseTaxDdctAmt = etcGiBaseTaxDdctAmt;
    }

    /**
     * @return the psntMmDdlnStockTaxDdctAmt
     */
    public Double getPsntMmDdlnStockTaxDdctAmt() {
        return psntMmDdlnStockTaxDdctAmt;
    }

    /**
     * @param psntMmDdlnStockTaxDdctAmt the psntMmDdlnStockTaxDdctAmt to set
     */
    public void setPsntMmDdlnStockTaxDdctAmt(Double psntMmDdlnStockTaxDdctAmt) {
        this.psntMmDdlnStockTaxDdctAmt = psntMmDdlnStockTaxDdctAmt;
    }

    /**
     * @return the serSaleTaxDdctAmt
     */
    public Double getSerSaleTaxDdctAmt() {
        return serSaleTaxDdctAmt;
    }

    /**
     * @param serSaleTaxDdctAmt the serSaleTaxDdctAmt to set
     */
    public void setSerSaleTaxDdctAmt(Double serSaleTaxDdctAmt) {
        this.serSaleTaxDdctAmt = serSaleTaxDdctAmt;
    }

    /**
     * @return the serSaleBaseTaxDdctAmt
     */
    public Double getSerSaleBaseTaxDdctAmt() {
        return serSaleBaseTaxDdctAmt;
    }

    /**
     * @param serSaleBaseTaxDdctAmt the serSaleBaseTaxDdctAmt to set
     */
    public void setSerSaleBaseTaxDdctAmt(Double serSaleBaseTaxDdctAmt) {
        this.serSaleBaseTaxDdctAmt = serSaleBaseTaxDdctAmt;
    }

    /**
     * @return the grTaxDdctAmt
     */
    public Double getGrTaxDdctAmt() {
        return grTaxDdctAmt;
    }

    /**
     * @param grTaxDdctAmt the grTaxDdctAmt to set
     */
    public void setGrTaxDdctAmt(Double grTaxDdctAmt) {
        this.grTaxDdctAmt = grTaxDdctAmt;
    }

    /**
     * @return the psntMmDdlnMoveAvgTaxDdctPrc
     */
    public Double getPsntMmDdlnMoveAvgTaxDdctPrc() {
        return psntMmDdlnMoveAvgTaxDdctPrc;
    }

    /**
     * @param psntMmDdlnMoveAvgTaxDdctPrc the psntMmDdlnMoveAvgTaxDdctPrc to set
     */
    public void setPsntMmDdlnMoveAvgTaxDdctPrc(Double psntMmDdlnMoveAvgTaxDdctPrc) {
        this.psntMmDdlnMoveAvgTaxDdctPrc = psntMmDdlnMoveAvgTaxDdctPrc;
    }

    /**
     * @return the preMmDdlnMoveAvgTaxDdctPrc
     */
    public Double getPreMmDdlnMoveAvgTaxDdctPrc() {
        return preMmDdlnMoveAvgTaxDdctPrc;
    }

    /**
     * @param preMmDdlnMoveAvgTaxDdctPrc the preMmDdlnMoveAvgTaxDdctPrc to set
     */
    public void setPreMmDdlnMoveAvgTaxDdctPrc(Double preMmDdlnMoveAvgTaxDdctPrc) {
        this.preMmDdlnMoveAvgTaxDdctPrc = preMmDdlnMoveAvgTaxDdctPrc;
    }

}
