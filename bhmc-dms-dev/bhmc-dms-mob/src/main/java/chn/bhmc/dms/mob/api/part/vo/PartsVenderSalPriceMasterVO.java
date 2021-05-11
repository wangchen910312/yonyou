package chn.bhmc.dms.mob.api.part.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 공급처별 부품판매 가격마스터 VO
 *
 * @ClassName   : PartsVenderSalPriceMasterVO.java
 * @Description : PartsVenderSalPriceMasterVO Class
 * @author In Bo Shim
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"           , mesgKey="par.lbl.dlrCd")
   ,@ValidField(field="bpCd"            , mesgKey="par.lbl.bpCd")
   ,@ValidField(field="itemCd"          , mesgKey="par.lbl.itemCd")
   ,@ValidField(field="prcTp"           , mesgKey="par.lbl.purcPrcTp")
   ,@ValidField(field="lineNo"          , mesgKey="par.lbl.lineNo")
   ,@ValidField(field="applyYn"         , mesgKey="par.lbl.applyYn")
   ,@ValidField(field="salePrcAmt"         , mesgKey="par.lbl.salePrcAmt")
   ,@ValidField(field="prcQty"          , mesgKey="par.lbl.prcQty")
   ,@ValidField(field="prcQtyUnitCd"    , mesgKey="par.lbl.prcQtyUnitCd")
   ,@ValidField(field="startDt"         , mesgKey="par.lbl.startDt")
   ,@ValidField(field="endDt"           , mesgKey="par.lbl.endDt")
   ,@ValidField(field="delYn"           , mesgKey="par.lbl.delYn")
   })
public class PartsVenderSalPriceMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3033628775013954034L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 거래처 코드
     */
    private String bpCd;

    /**
     * 품목번호
     */
    private String itemCd;

    /**
     * 구매단가유형
     */
    private String prcTp;

    /**
     * 구매단가유형명
     */
    private String prcTpNm;

    /**
     * 가격변경 라인
     */
    private int lineNo = 1;

    /**
     * 적용여부
     */
    private String applyYn;

    /**
     * 판매단가
     */
    private double salePrcAmt;
    /**
     * 판매단가할인률
     */
    private double salePrcRate;

    /**
     * 판매단가(세금제외)
     */
    private double saleTaxDdctPrcAmt;

    /**
     * 단가
     */
    private double prc;

    /**
     * 단가수량
     */
    private double prcQty;

    /**
     * 단가수량단위
     */
    private String prcQtyUnitCd;

    /**
     * 효력시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;

    /**
     * 효력종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;

    /**
     * 삭제여부
     */
    private String delYn;

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
     * BMP건의가격
     */
    private double bmpOpnPrc;

    /**
     * 최근입고가격
     */
    private double rectGiPrc;

    /**
     * 기준가격
     */
    private double stdPrc;

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
     * @return the prcTpNm
     */
    public String getPrcTpNm() {
        return prcTpNm;
    }

    /**
     * @param prcTpNm the prcTpNm to set
     */
    public void setPrcTpNm(String prcTpNm) {
        this.prcTpNm = prcTpNm;
    }

    /**
     * @return the prc
     */
    public double getPrc() {
        return prc;
    }

    /**
     * @param prc the prc to set
     */
    public void setPrc(double prc) {
        this.prc = prc;
    }

    /**
     * @return the salePrcRate
     */
    public double getSalePrcRate() {
        return salePrcRate;
    }

    /**
     * @param salePrcRate the salePrcRate to set
     */
    public void setSalePrcRate(double salePrcRate) {
        this.salePrcRate = salePrcRate;
    }

    /**
     * @return the saleTaxDdctPrcAmt
     */
    public double getSaleTaxDdctPrcAmt() {
        return saleTaxDdctPrcAmt;
    }

    /**
     * @param saleTaxDdctPrcAmt the saleTaxDdctPrcAmt to set
     */
    public void setSaleTaxDdctPrcAmt(double saleTaxDdctPrcAmt) {
        this.saleTaxDdctPrcAmt = saleTaxDdctPrcAmt;
    }

}
