package chn.bhmc.dms.par.stm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * 현재고 VO
 *
 * @ClassName   : StockInOutVO.java
 * @Description : StockInOutVO Class
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

public class StockInOutVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3974860811306749868L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 센터코드
     */
    private String pltCd;

    /**
     * 창고코드
     */
    private String strgeCd;

    /**
     * 부품별 창고 리스트
     */
    private String strgeNmList;

    /**
     * 부품번호
     */
    private String itemCd;

    /**
     * 부품명
     */
    private String itemNm;

    /**
     * 부품영문명
     */
    private String itemEnNm;

    /**
     * 재고수량
     */
    private double stockQty = 0.0;

    /**
     * 가용재고
     */
    private double avlbStockQty = 0.0;

    /**
     * 수량
     */
    private String qty;

    /**
     * 예약재고
     */
    private double exptStockQty = 0.0;

    /**
     * 예류재고
     */
    private double resvStockQty = 0.0;

    /**
     * 보류재고
     */
    private double clamStockQty = 0.0;

    /**
     * 입고예정수량
     */
    private double grScheQty = 0.0;


    /**
     * 출고예정수량
     */
    private double giScheQty = 0.0;

    /**
     * 구매 총 건수
     */
    private double purcTotCnt = 0.0;

    /**
     * 구매 총 금액
     */
    private double purcTotAmt = 0.0;

    /**
     * 판매 총 금액
     */
    private double saleTotAmt = 0.0;

    /**
     * 재고 총 금액
     */
    private double stockTotAmt = 0.0;


    /**
     * 전월마감이평가(세금미포함)
     **/
    private Double preMmDdlnMoveAvgTaxDdctPrc;

    /**
     * 전월마감재고금액(세금제외)
     **/
    private Double preMmDdlnStockTaxDdctAmt;

    /**
     * 당월마감이평가(세금제외)
     **/
    private Double psntMmDdlnMoveAvgTaxDdctPrc;

    /**
     * 당월마감재고금액(세금제외)
     **/
    private Double psntMmDdlnStockTaxDdctAmt;

    /**
     * 구매전월대비 상승여부
     */
    private String gubun;

    /**
     * 생성자ID
     */
    private String regUsrId;

    /**
     * 생성일시
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정자ID
     */
    private String updtUsrId;

    /**
     * 수정일시
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 재고단위코드
     */
    private String stockUnitCd;

    /**
     * 단위코드
     */
    private String unitCd;

    /**
     * 품목구분코드
     */
    private String itemDstinCd;

    /**
     * 품목그룹코드
     */
    private String itemGrpCd;

    /**
     * ABC CLASS
     */
    private String abcInd;

    /***
     * 차종코드
     */
    private String carlineCd;

    /***
     * 차형코드
     */
    private String modelCd;

    /***
     * NONMOVINGSTOCK
     */
    private String nonMovingFlg;

    /***
     * ENDYN
     */
    private String endYn;

    /***
     * LAST_GR_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGrDt;

    /***
     * LAST_GI_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGiDt;

    /**
     * 대기기간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date stayDt;

    /**
     * 대기일자
     */
    private int stayDay = 0;


    /**
     * 재고통재여부
     **/
    private String stockLockYn;

    /**
     * 로케이션코드
     **/
    private String locCd;

    /**
     * 로케이션코드 리스트
     **/
    private String locCdList;

    /**
     * 로케이션명
     **/
    private String locNm;

    /**
     * 로케이션명 리스트
     **/
    private String locNmList;

    /**
     * 로케이션MIG
     **/
    private String locCdMig;

    /**
     * 차입수량
     */
    private double borrowQty;

    /**
     * 대여수량
     */
    private double rentQty;

    /**
     * MOS
     */
    private double mos;

    /**
     * 재고회전율
     */
    private double inventoryTurnOverRatio;

    /**
     * 금액
     */
    private double amt;

    /**
     * 재고상태
     */
    private String stockStat;

    /**
     * 공급상코드
     */
    private String spyrCd;

    /**
     * 거래처코드
     */
    private String bpCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 거래처유형
     */
    private String bpTp;

    /**
     * 최대안전재고수량
     */
    private double maxSftyStockQty;

    /**
     * 최소안전재고수량
     */
    private double sftyStockQty;

    /**
     * 최소구매수량
     */
    private double minPurcQty;

    /**
     * 적정재고적용율
     */
    private double stdrdStockApplyRate;

    /**
     * 적정재고산출여부
     */
    private String stdrdStockCalcYn;

    /**
     * 적정재고량
     */
    private double stdrdStockQty;


    /**
     * 3개월평균수요량
     */
    private double mm3AvgDmndQty;

    /**
     * 6개월평균수요량
     */
    private double mm6AvgDmndQty;

    /**
     * 12개월평균수요량
     */
    private double mm12AvgDmndQty;

    /**
     * 입고창고
     */
    private String grStrgeCd;

    /**
     * 구매리드시간
     */
    private String purcLeadHm;

    /**
     * 주사용여부
     */
    private String mjrUseYn;

    /**
     * 도색여부
     */
    private String paintYn;

    /**
     * 구매소요량산출여부
     */
    private String purcCqtyCalcYn;

    /**
     * 이동평균가격
     */
    private double movingAvgPrc;

    /**
     * 세금제외 이동평균가격
     */
    private double movingAvgTaxDdctPrc;

    /**
     * 소매가격
     */
    private double retlPrc;

    /**
     * 도매가격
     */
    private double whslPrc;

    /**
     * 보험가격
     */
    private double incPrc;

    /**
     * 보증가격
     */
    private double grtePrc;

    /**
     * 세금공제소매가격
     */
    private double taxDdctRetlPrc;

    /**
     * 세금공제도매가격
     */
    private double taxDdctWhslPrc;

    /**
     * 세금공제보험가격
     */
    private double taxDdctIncPrc;

    /**
     * 세금공제보증가격
     */
    private double taxDdctGrtePrc;

    /**
     * 구매단가
     */
    private double purcPrc;

    /**
     * 재고금액(장면재고)
     */
    private double stockAmt = 0.0;

    /**
     * 재고금액(장면재고) 세금미포함
     */
    private double stockTaxDdctAmt = 0.0;

    /**
     * 재고금액(장면재고) 세금미포함
     */
    private double realStockTaxDdctAmt = 0.0;

    /**
     * 재고금액(장면재고)
     */
    private double realStockAmt = 0.0;

    /**
     * 세금제외 재고금액(장면재고)
     */
    private double taxDdctStockAmt = 0.0;

    /**
     * 재고금액(가용재고)
     */
    private double stockAvlbAmt = 0.0;

    /**
     * 기타 참조코드1
     */
    private String etcCd1;

    /**
     * 기타 참조코드2
     */
    private String etcCd2;

    /**
     * 기타1
     */
    private String etc1;

    /**
     * 기타2
     */
    private String etc2;

    /**
     * 기타3
     */
    private String etc3;

    /**
     * 브랜드
     */
    private String brandCd;


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
     * @return the strgeNmList
     */
    public String getStrgeNmList() {
        return strgeNmList;
    }

    /**
     * @param strgeNmList the strgeNmList to set
     */
    public void setStrgeNmList(String strgeNmList) {
        this.strgeNmList = strgeNmList;
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
     * @return the grScheQty
     */
    public double getGrScheQty() {
        return grScheQty;
    }

    /**
     * @param grScheQty the grScheQty to set
     */
    public void setGrScheQty(double grScheQty) {
        this.grScheQty = grScheQty;
    }

    /**
     * @return the giScheQty
     */
    public double getGiScheQty() {
        return giScheQty;
    }

    /**
     * @param giScheQty the giScheQty to set
     */
    public void setGiScheQty(double giScheQty) {
        this.giScheQty = giScheQty;
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
     * @return the resvStockQty
     */
    public double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the clamStockQty
     */
    public double getClamStockQty() {
        return clamStockQty;
    }

    /**
     * @param clamStockQty the clamStockQty to set
     */
    public void setClamStockQty(double clamStockQty) {
        this.clamStockQty = clamStockQty;
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
     * @return the itemEnNm
     */
    public String getItemEnNm() {
        return itemEnNm;
    }

    /**
     * @param itemEnNm the itemEnNm to set
     */
    public void setItemEnNm(String itemEnNm) {
        this.itemEnNm = itemEnNm;
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
     * @return the itemGrpCd
     */
    public String getItemGrpCd() {
        return itemGrpCd;
    }

    /**
     * @param itemGrpCd the itemGrpCd to set
     */
    public void setItemGrpCd(String itemGrpCd) {
        this.itemGrpCd = itemGrpCd;
    }

    /**
     * @return the abcInd
     */
    public String getAbcInd() {
        return abcInd;
    }

    /**
     * @param abcInd the abcInd to set
     */
    public void setAbcInd(String abcInd) {
        this.abcInd = abcInd;
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
     * @return the nonMovingFlg
     */
    public String getNonMovingFlg() {
        return nonMovingFlg;
    }

    /**
     * @param nonMovingFlg the nonMovingFlg to set
     */
    public void setNonMovingFlg(String nonMovingFlg) {
        this.nonMovingFlg = nonMovingFlg;
    }

    /**
     * @return the endYn
     */
    public String getEndYn() {
        return endYn;
    }

    /**
     * @param endYn the endYn to set
     */
    public void setEndYn(String endYn) {
        this.endYn = endYn;
    }

    /**
     * @return the lastGrDt
     */
    public Date getLastGrDt() {
        return lastGrDt;
    }

    /**
     * @param lastGrDt the lastGrDt to set
     */
    public void setLastGrDt(Date lastGrDt) {
        this.lastGrDt = lastGrDt;
    }

    /**
     * @return the lastGiDt
     */
    public Date getLastGiDt() {
        return lastGiDt;
    }

    /**
     * @param lastGiDt the lastGiDt to set
     */
    public void setLastGiDt(Date lastGiDt) {
        this.lastGiDt = lastGiDt;
    }

    /**
     * @return the stayDt
     */
    public Date getStayDt() {
        return stayDt;
    }

    /**
     * @param stayDt the stayDt to set
     */
    public void setStayDt(Date stayDt) {
        this.stayDt = stayDt;
    }

    /**
     * @return the stayDay
     */
    public int getStayDay() {
        return stayDay;
    }

    /**
     * @param stayDay the stayDay to set
     */
    public void setStayDay(int stayDay) {
        this.stayDay = stayDay;
    }

    /**
     * @return the stockLockYn
     */
    public String getStockLockYn() {
        return stockLockYn;
    }

    /**
     * @param stockLockYn the stockLockYn to set
     */
    public void setStockLockYn(String stockLockYn) {
        this.stockLockYn = stockLockYn;
    }

    /**
     * @return the borrowQty
     */
    public double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the rentQty
     */
    public double getRentQty() {
        return rentQty;
    }

    /**
     * @param rentQty the rentQty to set
     */
    public void setRentQty(double rentQty) {
        this.rentQty = rentQty;
    }

    /**
     * @return the stockStat
     */
    public String getStockStat() {
        return stockStat;
    }

    /**
     * @param stockStat the stockStat to set
     */
    public void setStockStat(String stockStat) {
        this.stockStat = stockStat;
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
     * @return the locCdList
     */
    public String getLocCdList() {
        return locCdList;
    }

    /**
     * @param locCdList the locCdList to set
     */
    public void setLocCdList(String locCdList) {
        this.locCdList = locCdList;
    }

    /**
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }

    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
    }

    /**
     * @return the locNmList
     */
    public String getLocNmList() {
        return locNmList;
    }

    /**
     * @param locNmList the locNmList to set
     */
    public void setLocNmList(String locNmList) {
        this.locNmList = locNmList;
    }

    /**
     * @return the locCdMig
     */
    public String getLocCdMig() {
        return locCdMig;
    }

    /**
     * @param locCdMig the locCdMig to set
     */
    public void setLocCdMig(String locCdMig) {
        this.locCdMig = locCdMig;
    }

    /**
     * @return the stockQty
     */
    public double getStockQty() {
        return stockQty;
    }

    /**
     * @param stockQty the stockQty to set
     */
    public void setStockQty(double stockQty) {
        this.stockQty = stockQty;
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
     * @return the amt
     */
    public double getAmt() {
        return amt;
    }

    /**
     * @param amt the amt to set
     */
    public void setAmt(double amt) {
        this.amt = amt;
    }

    /**
     * @return the spyrCd
     */
    public String getSpyrCd() {
        return spyrCd;
    }

    /**
     * @param spyrCd the spyrCd to set
     */
    public void setSpyrCd(String spyrCd) {
        this.spyrCd = spyrCd;
    }

    /**
     * @return the mm3AvgDmndQty
     */
    public double getMm3AvgDmndQty() {
        return mm3AvgDmndQty;
    }

    /**
     * @param mm3AvgDmndQty the mm3AvgDmndQty to set
     */
    public void setMm3AvgDmndQty(double mm3AvgDmndQty) {
        this.mm3AvgDmndQty = mm3AvgDmndQty;
    }

    /**
     * @return the mm6AvgDmndQty
     */
    public double getMm6AvgDmndQty() {
        return mm6AvgDmndQty;
    }

    /**
     * @param mm6AvgDmndQty the mm6AvgDmndQty to set
     */
    public void setMm6AvgDmndQty(double mm6AvgDmndQty) {
        this.mm6AvgDmndQty = mm6AvgDmndQty;
    }

    /**
     * @return the mm12AvgDmndQty
     */
    public double getMm12AvgDmndQty() {
        return mm12AvgDmndQty;
    }

    /**
     * @param mm12AvgDmndQty the mm12AvgDmndQty to set
     */
    public void setMm12AvgDmndQty(double mm12AvgDmndQty) {
        this.mm12AvgDmndQty = mm12AvgDmndQty;
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
     * @return the purcCqtyCalcYn
     */
    public String getPurcCqtyCalcYn() {
        return purcCqtyCalcYn;
    }

    /**
     * @param purcCqtyCalcYn the purcCqtyCalcYn to set
     */
    public void setPurcCqtyCalcYn(String purcCqtyCalcYn) {
        this.purcCqtyCalcYn = purcCqtyCalcYn;
    }

    /**
     * @return the maxSftyStockQty
     */
    public double getMaxSftyStockQty() {
        return maxSftyStockQty;
    }

    /**
     * @param maxSftyStockQty the maxSftyStockQty to set
     */
    public void setMaxSftyStockQty(double maxSftyStockQty) {
        this.maxSftyStockQty = maxSftyStockQty;
    }

    /**
     * @return the sftyStockQty
     */
    public double getSftyStockQty() {
        return sftyStockQty;
    }

    /**
     * @param sftyStockQty the sftyStockQty to set
     */
    public void setSftyStockQty(double sftyStockQty) {
        this.sftyStockQty = sftyStockQty;
    }

    /**
     * @return the minPurcQty
     */
    public double getMinPurcQty() {
        return minPurcQty;
    }

    /**
     * @param minPurcQty the minPurcQty to set
     */
    public void setMinPurcQty(double minPurcQty) {
        this.minPurcQty = minPurcQty;
    }

    /**
     * @return the stdrdStockApplyRate
     */
    public double getStdrdStockApplyRate() {
        return stdrdStockApplyRate;
    }

    /**
     * @param stdrdStockApplyRate the stdrdStockApplyRate to set
     */
    public void setStdrdStockApplyRate(double stdrdStockApplyRate) {
        this.stdrdStockApplyRate = stdrdStockApplyRate;
    }


    /**
     * @return the stdrdStockCalcYn
     */
    public String getStdrdStockCalcYn() {
        return stdrdStockCalcYn;
    }

    /**
     * @param stdrdStockCalcYn the stdrdStockCalcYn to set
     */
    public void setStdrdStockCalcYn(String stdrdStockCalcYn) {
        this.stdrdStockCalcYn = stdrdStockCalcYn;
    }

    /**
     * @return the stdrdStockQty
     */
    public double getStdrdStockQty() {
        return stdrdStockQty;
    }

    /**
     * @param stdrdStockQty the stdrdStockQty to set
     */
    public void setStdrdStockQty(double stdrdStockQty) {
        this.stdrdStockQty = stdrdStockQty;
    }

    /**
     * @return the movingAvgPrc
     */
    public double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the movingAvgTaxDdctPrc
     */
    public double getMovingAvgTaxDdctPrc() {
        return movingAvgTaxDdctPrc;
    }

    /**
     * @param movingAvgTaxDdctPrc the movingAvgTaxDdctPrc to set
     */
    public void setMovingAvgTaxDdctPrc(double movingAvgTaxDdctPrc) {
        this.movingAvgTaxDdctPrc = movingAvgTaxDdctPrc;
    }

    /**
     * @return the retlPrc
     */
    public double getRetlPrc() {
        return retlPrc;
    }

    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(double retlPrc) {
        this.retlPrc = retlPrc;
    }

    /**
     * @return the whslPrc
     */
    public double getWhslPrc() {
        return whslPrc;
    }

    /**
     * @param whslPrc the whslPrc to set
     */
    public void setWhslPrc(double whslPrc) {
        this.whslPrc = whslPrc;
    }

    /**
     * @return the incPrc
     */
    public double getIncPrc() {
        return incPrc;
    }

    /**
     * @param incPrc the incPrc to set
     */
    public void setIncPrc(double incPrc) {
        this.incPrc = incPrc;
    }

    /**
     * @return the grtePrc
     */
    public double getGrtePrc() {
        return grtePrc;
    }

    /**
     * @param grtePrc the grtePrc to set
     */
    public void setGrtePrc(double grtePrc) {
        this.grtePrc = grtePrc;
    }

    /**
     * @return the taxDdctRetlPrc
     */
    public double getTaxDdctRetlPrc() {
        return taxDdctRetlPrc;
    }

    /**
     * @param taxDdctRetlPrc the taxDdctRetlPrc to set
     */
    public void setTaxDdctRetlPrc(double taxDdctRetlPrc) {
        this.taxDdctRetlPrc = taxDdctRetlPrc;
    }

    /**
     * @return the taxDdctWhslPrc
     */
    public double getTaxDdctWhslPrc() {
        return taxDdctWhslPrc;
    }

    /**
     * @param taxDdctWhslPrc the taxDdctWhslPrc to set
     */
    public void setTaxDdctWhslPrc(double taxDdctWhslPrc) {
        this.taxDdctWhslPrc = taxDdctWhslPrc;
    }

    /**
     * @return the taxDdctIncPrc
     */
    public double getTaxDdctIncPrc() {
        return taxDdctIncPrc;
    }

    /**
     * @param taxDdctIncPrc the taxDdctIncPrc to set
     */
    public void setTaxDdctIncPrc(double taxDdctIncPrc) {
        this.taxDdctIncPrc = taxDdctIncPrc;
    }

    /**
     * @return the taxDdctGrtePrc
     */
    public double getTaxDdctGrtePrc() {
        return taxDdctGrtePrc;
    }

    /**
     * @param taxDdctGrtePrc the taxDdctGrtePrc to set
     */
    public void setTaxDdctGrtePrc(double taxDdctGrtePrc) {
        this.taxDdctGrtePrc = taxDdctGrtePrc;
    }

    /**
     * @return the purcPrc
     */
    public double getPurcPrc() {
        return purcPrc;
    }

    /**
     * @param purcPrc the purcPrc to set
     */
    public void setPurcPrc(double purcPrc) {
        this.purcPrc = purcPrc;
    }

    /**
     * @return the stockAmt
     */
    public double getStockAmt() {
        return stockAmt;
    }

    /**
     * @param stockAmt the stockAmt to set
     */
    public void setStockAmt(double stockAmt) {
        this.stockAmt = stockAmt;
    }

    /**
     * @return the stockTaxDdctAmt
     */
    public double getStockTaxDdctAmt() {
        return stockTaxDdctAmt;
    }

    /**
     * @param stockTaxDdctAmt the stockTaxDdctAmt to set
     */
    public void setStockTaxDdctAmt(double stockTaxDdctAmt) {
        this.stockTaxDdctAmt = stockTaxDdctAmt;
    }


    /**
     * @return the realStockTaxDdctAmt
     */
    public double getRealStockTaxDdctAmt() {
        return realStockTaxDdctAmt;
    }

    /**
     * @param realStockTaxDdctAmt the realStockTaxDdctAmt to set
     */
    public void setRealStockTaxDdctAmt(double realStockTaxDdctAmt) {
        this.realStockTaxDdctAmt = realStockTaxDdctAmt;
    }

    /**
     * @return the realStockAmt
     */
    public double getRealStockAmt() {
        return realStockAmt;
    }

    /**
     * @param realStockAmt the realStockAmt to set
     */
    public void setRealStockAmt(double realStockAmt) {
        this.realStockAmt = realStockAmt;
    }

    /**
     * @return the taxDdctStockAmt
     */
    public double getTaxDdctStockAmt() {
        return taxDdctStockAmt;
    }

    /**
     * @param taxDdctStockAmt the taxDdctStockAmt to set
     */
    public void setTaxDdctStockAmt(double taxDdctStockAmt) {
        this.taxDdctStockAmt = taxDdctStockAmt;
    }

    /**
     * @return the stockAvlbAmt
     */
    public double getStockAvlbAmt() {
        return stockAvlbAmt;
    }

    /**
     * @param stockAvlbAmt the stockAvlbAmt to set
     */
    public void setStockAvlbAmt(double stockAvlbAmt) {
        this.stockAvlbAmt = stockAvlbAmt;
    }

    /**
     * @return the exptStockQty
     */
    public double getExptStockQty() {
        return exptStockQty;
    }

    /**
     * @param exptStockQty the exptStockQty to set
     */
    public void setExptStockQty(double exptStockQty) {
        this.exptStockQty = exptStockQty;
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
     * @return the mos
     */
    public double getMos() {
        return mos;
    }

    /**
     * @param mos the mos to set
     */
    public void setMos(double mos) {
        this.mos = mos;
    }

    /**
     * @return the inventoryTurnOverRatio
     */
    public double getInventoryTurnOverRatio() {
        return inventoryTurnOverRatio;
    }

    /**
     * @param inventoryTurnOverRatio the inventoryTurnOverRatio to set
     */
    public void setInventoryTurnOverRatio(double inventoryTurnOverRatio) {
        this.inventoryTurnOverRatio = inventoryTurnOverRatio;
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
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the purcTotCnt
     */
    public double getPurcTotCnt() {
        return purcTotCnt;
    }

    /**
     * @param purcTotCnt the purcTotCnt to set
     */
    public void setPurcTotCnt(double purcTotCnt) {
        this.purcTotCnt = purcTotCnt;
    }

    /**
     * @return the saleTotAmt
     */
    public double getSaleTotAmt() {
        return saleTotAmt;
    }

    /**
     * @param saleTotAmt the saleTotAmt to set
     */
    public void setSaleTotAmt(double saleTotAmt) {
        this.saleTotAmt = saleTotAmt;
    }

    /**
     * @return the stockTotAmt
     */
    public double getStockTotAmt() {
        return stockTotAmt;
    }

    /**
     * @param stockTotAmt the stockTotAmt to set
     */
    public void setStockTotAmt(double stockTotAmt) {
        this.stockTotAmt = stockTotAmt;
    }

    /**
     * @return the purcTotAmt
     */
    public double getPurcTotAmt() {
        return purcTotAmt;
    }

    /**
     * @param purcTotAmt the purcTotAmt to set
     */
    public void setPurcTotAmt(double purcTotAmt) {
        this.purcTotAmt = purcTotAmt;
    }

    /**
     * @return the gubun
     */
    public String getGubun() {
        return gubun;
    }

    /**
     * @param gubun the gubun to set
     */
    public void setGubun(String gubun) {
        this.gubun = gubun;
    }

    /**
     * @return the mjrUseYn
     */
    public String getMjrUseYn() {
        return mjrUseYn;
    }

    /**
     * @param mjrUseYn the mjrUseYn to set
     */
    public void setMjrUseYn(String mjrUseYn) {
        this.mjrUseYn = mjrUseYn;
    }

    /**
     * @return the paintYn
     */
    public String getPaintYn() {
        return paintYn;
    }

    /**
     * @param paintYn the paintYn to set
     */
    public void setPaintYn(String paintYn) {
        this.paintYn = paintYn;
    }

    /**
     * @return the qty
     */
    public String getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(String qty) {
        this.qty = qty;
    }

    /**
     * @return the etcCd1
     */
    public String getEtcCd1() {
        return etcCd1;
    }

    /**
     * @param etcCd1 the etcCd1 to set
     */
    public void setEtcCd1(String etcCd1) {
        this.etcCd1 = etcCd1;
    }

    /**
     * @return the etcCd2
     */
    public String getEtcCd2() {
        return etcCd2;
    }

    /**
     * @param etcCd2 the etcCd2 to set
     */
    public void setEtcCd2(String etcCd2) {
        this.etcCd2 = etcCd2;
    }

    /**
     * @return the etc1
     */
    public String getEtc1() {
        return etc1;
    }

    /**
     * @param etc1 the etc1 to set
     */
    public void setEtc1(String etc1) {
        this.etc1 = etc1;
    }

    /**
     * @return the etc2
     */
    public String getEtc2() {
        return etc2;
    }

    /**
     * @param etc2 the etc2 to set
     */
    public void setEtc2(String etc2) {
        this.etc2 = etc2;
    }

    /**
     * @return the etc3
     */
    public String getEtc3() {
        return etc3;
    }

    /**
     * @param etc3 the etc3 to set
     */
    public void setEtc3(String etc3) {
        this.etc3 = etc3;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
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
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setStrgeCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setQty(ExcelDataBinderUtil.toString(value)); break;
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();


        return errors;
    }



}
