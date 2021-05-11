package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 판매가 대상 선정 마스터 VO
 *
 * @ClassName   : PartsVenderSalPriceTargetMasterVO.java
 * @Description : PartsVenderSalPriceTargetMasterVO Class
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim     최초 생성
 * </pre>
 */
public class PartsVenderSalPriceTargetMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3890703523599906800L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 거래처 유형
     */
    private String bpTp;

    /**
     * 거래처 코드
     */
    private String bpCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 라인번호
     */
    private int lineNo;

    /**
     * 적용유무
     */
    private String applyYn;

    /**
     * 판매단가금액
     */
    private double salPrcAmt;

    /**
     * 품목번호
     */
    private String itemCd;

    /**
     * 품목명
     */
    private String itemNm;

    /**
     * 재고창고코드
     */
    private String strgeCd;

    /**
     * 입고창고코드
     */
    private String grStrgeCd;

    /**
     * 위치코드
     */
    private String locCd;

    /**
     * 품목구분코드
     **/
    private String itemDstinCd;

    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * 차형
     **/
    private String carlineCd2;

    /**
     * ABC CLASS
     **/
    private String abcInd;

    /**
     * 구매단가유형
     */
    private String prcTp;

    /**
     * 판매단가금액
     */
    private double salePrcAmt;

    /**
     * 구매단가금액
     */
    private double purcPrc;

    /**
     * 단가수량
     */
    private double prcQty;
    /**
     * 단가수량단위코드
     */
    private String prcQtyUnitCd;

    /**
     * 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;
    /**
     * 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;

    /**
     * 적용일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyDt;

    /**
     * 삭제여부
     */
    private String delYn = "N";

    /**
     * 판매세금율
     */
    private double saleTaxRate;

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
     * 기타가격1
     */
    private double etcPrc1;

    /**
     * 기타가격2
     */
    private double etcPrc2;

    /**
     * 기타가격3
     */
    private double etcPrc3;

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
     * 세금공제기타가격1
     */
    private double taxDdctEtcPrc1;

    /**
     * 세금공제기타가격2
     */
    private double taxDdctEtcPrc2;

    /**
     * 세금공제기타가격3
     */
    private double taxDdctEtcPrc3;

    /**
     * 이동평균가
     */
    private double movingAvgPrc;

    /**
     * 이동평균가(세금불포함)
     */
    private double movingAvgTaxDdctPrc;

    /**
     * BMP건의가격
     */
    private double bmpOpnPrc;

    /**
     * 재고원가
     */
    private double stockGiPrc;

    /**
     * 최근입고가
     */
    private double rectGiPrc;

    /**
     * 기준가격
     */
    private double stdPrc;

    /**
     * 기준가격코드
     */
    private String stdPrcCd;

    /**
     * 소매추가세금율
     */
    private double retlAddTaxRate;

    /**
     * 도매추가세금율
     */
    private double whslAddTaxRate;

    /**
     * 보험추가세금율
     */
    private double incAddTaxRate;

    /**
     * 보증추가세금율
     */
    private double grteAddTaxRate;

    /**
     * 수정자
     */
    private String updtUsrNm;

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
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the applyYn
     */
    public String getApplyYn() {
        return applyYn;
    }

    /**
     * @param applyYn the applyYn to set
     */
    public void setApplyYn(String applyYn) {
        this.applyYn = applyYn;
    }

    /**
     * @return the salPrcAmt
     */
    public double getSalPrcAmt() {
        return salPrcAmt;
    }

    /**
     * @param salPrcAmt the salPrcAmt to set
     */
    public void setSalPrcAmt(double salPrcAmt) {
        this.salPrcAmt = salPrcAmt;
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
     * @return the carlineCd2
     */
    public String getCarlineCd2() {
        return carlineCd2;
    }

    /**
     * @param carlineCd2 the carlineCd2 to set
     */
    public void setCarlineCd2(String carlineCd2) {
        this.carlineCd2 = carlineCd2;
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
     * @return the prcQty
     */
    public double getPrcQty() {
        return prcQty;
    }

    /**
     * @param prcQty the prcQty to set
     */
    public void setPrcQty(double prcQty) {
        this.prcQty = prcQty;
    }

    /**
     * @return the prcQtyUnitCd
     */
    public String getPrcQtyUnitCd() {
        return prcQtyUnitCd;
    }

    /**
     * @param prcQtyUnitCd the prcQtyUnitCd to set
     */
    public void setPrcQtyUnitCd(String prcQtyUnitCd) {
        this.prcQtyUnitCd = prcQtyUnitCd;
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
     * @return the applyDt
     */
    public Date getApplyDt() {
        return applyDt;
    }

    /**
     * @param applyDt the applyDt to set
     */
    public void setApplyDt(Date applyDt) {
        this.applyDt = applyDt;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the saleTaxRate
     */
    public double getSaleTaxRate() {
        return saleTaxRate;
    }

    /**
     * @param saleTaxRate the saleTaxRate to set
     */
    public void setSaleTaxRate(double saleTaxRate) {
        this.saleTaxRate = saleTaxRate;
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
     * @return the etcPrc1
     */
    public double getEtcPrc1() {
        return etcPrc1;
    }

    /**
     * @param etcPrc1 the etcPrc1 to set
     */
    public void setEtcPrc1(double etcPrc1) {
        this.etcPrc1 = etcPrc1;
    }

    /**
     * @return the etcPrc2
     */
    public double getEtcPrc2() {
        return etcPrc2;
    }

    /**
     * @param etcPrc2 the etcPrc2 to set
     */
    public void setEtcPrc2(double etcPrc2) {
        this.etcPrc2 = etcPrc2;
    }

    /**
     * @return the etcPrc3
     */
    public double getEtcPrc3() {
        return etcPrc3;
    }

    /**
     * @param etcPrc3 the etcPrc3 to set
     */
    public void setEtcPrc3(double etcPrc3) {
        this.etcPrc3 = etcPrc3;
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
     * @return the taxDdctEtcPrc1
     */
    public double getTaxDdctEtcPrc1() {
        return taxDdctEtcPrc1;
    }

    /**
     * @param taxDdctEtcPrc1 the taxDdctEtcPrc1 to set
     */
    public void setTaxDdctEtcPrc1(double taxDdctEtcPrc1) {
        this.taxDdctEtcPrc1 = taxDdctEtcPrc1;
    }

    /**
     * @return the taxDdctEtcPrc2
     */
    public double getTaxDdctEtcPrc2() {
        return taxDdctEtcPrc2;
    }

    /**
     * @param taxDdctEtcPrc2 the taxDdctEtcPrc2 to set
     */
    public void setTaxDdctEtcPrc2(double taxDdctEtcPrc2) {
        this.taxDdctEtcPrc2 = taxDdctEtcPrc2;
    }

    /**
     * @return the taxDdctEtcPrc3
     */
    public double getTaxDdctEtcPrc3() {
        return taxDdctEtcPrc3;
    }

    /**
     * @param taxDdctEtcPrc3 the taxDdctEtcPrc3 to set
     */
    public void setTaxDdctEtcPrc3(double taxDdctEtcPrc3) {
        this.taxDdctEtcPrc3 = taxDdctEtcPrc3;
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
     * @return the bmpOpnPrc
     */
    public double getBmpOpnPrc() {
        return bmpOpnPrc;
    }

    /**
     * @param bmpOpnPrc the bmpOpnPrc to set
     */
    public void setBmpOpnPrc(double bmpOpnPrc) {
        this.bmpOpnPrc = bmpOpnPrc;
    }

    /**
     * @return the stockGiPrc
     */
    public double getStockGiPrc() {
        return stockGiPrc;
    }

    /**
     * @param stockGiPrc the stockGiPrc to set
     */
    public void setStockGiPrc(double stockGiPrc) {
        this.stockGiPrc = stockGiPrc;
    }

    /**
     * @return the rectGiPrc
     */
    public double getRectGiPrc() {
        return rectGiPrc;
    }

    /**
     * @param rectGiPrc the rectGiPrc to set
     */
    public void setRectGiPrc(double rectGiPrc) {
        this.rectGiPrc = rectGiPrc;
    }

    /**
     * @return the stdPrc
     */
    public double getStdPrc() {
        return stdPrc;
    }

    /**
     * @param stdPrc the stdPrc to set
     */
    public void setStdPrc(double stdPrc) {
        this.stdPrc = stdPrc;
    }

    /**
     * @return the stdPrcCd
     */
    public String getStdPrcCd() {
        return stdPrcCd;
    }

    /**
     * @param stdPrcCd the stdPrcCd to set
     */
    public void setStdPrcCd(String stdPrcCd) {
        this.stdPrcCd = stdPrcCd;
    }

    /**
     * @return the retlAddTaxRate
     */
    public double getRetlAddTaxRate() {
        return retlAddTaxRate;
    }

    /**
     * @param retlAddTaxRate the retlAddTaxRate to set
     */
    public void setRetlAddTaxRate(double retlAddTaxRate) {
        this.retlAddTaxRate = retlAddTaxRate;
    }

    /**
     * @return the whslAddTaxRate
     */
    public double getWhslAddTaxRate() {
        return whslAddTaxRate;
    }

    /**
     * @param whslAddTaxRate the whslAddTaxRate to set
     */
    public void setWhslAddTaxRate(double whslAddTaxRate) {
        this.whslAddTaxRate = whslAddTaxRate;
    }

    /**
     * @return the incAddTaxRate
     */
    public double getIncAddTaxRate() {
        return incAddTaxRate;
    }

    /**
     * @param incAddTaxRate the incAddTaxRate to set
     */
    public void setIncAddTaxRate(double incAddTaxRate) {
        this.incAddTaxRate = incAddTaxRate;
    }

    /**
     * @return the grteAddTaxRate
     */
    public double getGrteAddTaxRate() {
        return grteAddTaxRate;
    }

    /**
     * @param grteAddTaxRate the grteAddTaxRate to set
     */
    public void setGrteAddTaxRate(double grteAddTaxRate) {
        this.grteAddTaxRate = grteAddTaxRate;
    }

    /**
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }

}
