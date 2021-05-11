package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 구매요청 VO
 *
 * @ClassName   : PurcRgstVO.java
 * @Description : PurcRgstVO Class
 * @author In Bo Shim
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="purcReqNo", mesgKey="par.lbl.purcReqNo")
    ,@ValidField(field="purcReqLineNo", mesgKey="par.lbl.purcReqLineNo")
    ,@ValidField(field="purcReqTp", mesgKey="par.lbl.purcReqTp")
    ,@ValidField(field="purcReqStatCd", mesgKey="par.lbl.purcReqStatCd")
    ,@ValidField(field="refDocNo", mesgKey="par.lbl.refDocNo")
    ,@ValidField(field="refDocLineNo", mesgKey="par.lbl.refDocLineNo")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="strgeCd", mesgKey="par.lbl.strgeCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="itemNm", mesgKey="par.lbl.itemNm")
    ,@ValidField(field="purcReqQty", mesgKey="par.lbl.purcReqQty")
    ,@ValidField(field="purcReqUnitCd", mesgKey="par.lbl.purcReqUnitCd")
    ,@ValidField(field="purcReqDt", mesgKey="par.lbl.purcReqDt")
    ,@ValidField(field="delYn", mesgKey="par.lbl.delYn")
})
public class PurcRqstVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7235006647354352397L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 구매요청번호
     **/
    @NotEmpty
    private String purcReqNo;

    /**
     * 구매요청라인번호
     **/
    @NotEmpty
    private int purcReqLineNo;

    /**
     * 구매요청유형
     **/
    private String purcReqTp;

    /**
     * 구매요청상태코드
     **/
    private String purcReqStatCd;

    /**
     * 참조문서번호
     **/
    private String refDocNo;

    /**
     * 참조문서라인번호
     **/
    private int refDocLineNo;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 구매요청수량
     **/
    private Double purcReqQty;

    /**
     * 구매단가
     **/
    private Double purcPrc;

    /**
     * 구매요청금액
     **/
    private Double purcAmt;

    /**
     * 구매리드타임
     **/
    private int purcLeadHm;

    /**
     * 구매요청단위코드
     **/
    private String purcReqUnitCd;

    /**
     * 구매요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date purcReqDt;

    /**
     * ABC CLASS
     **/
    private String abcInd;

    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * 공급처
     **/
    private String bpCd;

    /**
     * 공급처명
     **/
    private String bpNm;

    /**
     * 입고창고
     **/
    private String grStrgeCd;

    /**
     * 요청자명
     **/
    private String regUsrNm;

    /**
     * 삭제여부
     **/
    @NotEmpty
    private String delYn;

    /**
     * 최소구매수량
     **/
    private double minPurcQty;

    /**
     * 가용재고
     **/
    private double avlbStockQty;

    /**
     * 예약수량
     **/
    private double resvStockQty;

    /**
     * 보류수량
     **/
    private double clamStockQty;

    /**
     * 차입수량
     **/
    private double borrowQty;

    /**
     * 대여수량
     **/
    private double rentQty;

    /**
     * 재고수량
     **/
    private double stockQty;

    /**
     * 부품특성코드
     **/
    private String parSpecCd;

    /**
     * SUC 코드
     **/
    private String sucCd;

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
     * @return the purcReqNo
     */
    public String getPurcReqNo() {
        return purcReqNo;
    }

    /**
     * @param purcReqNo the purcReqNo to set
     */
    public void setPurcReqNo(String purcReqNo) {
        this.purcReqNo = purcReqNo;
    }

    /**
     * @return the purcReqLineNo
     */
    public int getPurcReqLineNo() {
        return purcReqLineNo;
    }

    /**
     * @param purcReqLineNo the purcReqLineNo to set
     */
    public void setPurcReqLineNo(int purcReqLineNo) {
        this.purcReqLineNo = purcReqLineNo;
    }

    /**
     * @return the purcReqTp
     */
    public String getPurcReqTp() {
        return purcReqTp;
    }

    /**
     * @param purcReqTp the purcReqTp to set
     */
    public void setPurcReqTp(String purcReqTp) {
        this.purcReqTp = purcReqTp;
    }

    /**
     * @return the purcReqStatCd
     */
    public String getPurcReqStatCd() {
        return purcReqStatCd;
    }

    /**
     * @param purcReqStatCd the purcReqStatCd to set
     */
    public void setPurcReqStatCd(String purcReqStatCd) {
        this.purcReqStatCd = purcReqStatCd;
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
     * @return the purcReqQty
     */
    public Double getPurcReqQty() {
        return purcReqQty;
    }

    /**
     * @param purcReqQty the purcReqQty to set
     */
    public void setPurcReqQty(Double purcReqQty) {
        this.purcReqQty = purcReqQty;
    }

    /**
     * @return the purcPrc
     */
    public Double getPurcPrc() {
        return purcPrc;
    }

    /**
     * @param purcPrc the purcPrc to set
     */
    public void setPurcPrc(Double purcPrc) {
        this.purcPrc = purcPrc;
    }

    /**
     * @return the purcAmt
     */
    public Double getPurcAmt() {
        return purcAmt;
    }

    /**
     * @param purcAmt the purcAmt to set
     */
    public void setPurcAmt(Double purcAmt) {
        this.purcAmt = purcAmt;
    }

    /**
     * @return the purcLeadHm
     */
    public int getPurcLeadHm() {
        return purcLeadHm;
    }

    /**
     * @param purcLeadHm the purcLeadHm to set
     */
    public void setPurcLeadHm(int purcLeadHm) {
        this.purcLeadHm = purcLeadHm;
    }

    /**
     * @return the purcReqUnitCd
     */
    public String getPurcReqUnitCd() {
        return purcReqUnitCd;
    }

    /**
     * @param purcReqUnitCd the purcReqUnitCd to set
     */
    public void setPurcReqUnitCd(String purcReqUnitCd) {
        this.purcReqUnitCd = purcReqUnitCd;
    }

    /**
     * @return the purcReqDt
     */
    public Date getPurcReqDt() {
        return purcReqDt;
    }

    /**
     * @param purcReqDt the purcReqDt to set
     */
    public void setPurcReqDt(Date purcReqDt) {
        this.purcReqDt = purcReqDt;
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
     * @return the parSpecCd
     */
    public String getParSpecCd() {
        return parSpecCd;
    }

    /**
     * @param parSpecCd the parSpecCd to set
     */
    public void setParSpecCd(String parSpecCd) {
        this.parSpecCd = parSpecCd;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the sucCd
     */
    public String getSucCd() {
        return sucCd;
    }

    /**
     * @param sucCd the sucCd to set
     */
    public void setSucCd(String sucCd) {
        this.sucCd = sucCd;
    }
}
