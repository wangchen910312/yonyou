package chn.bhmc.dms.ser.ro.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;


public class RepairOrderPartVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7094819649059054030L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * RO문서번호
     **/
    @NotEmpty
    private String roDocNo;

    /**
     * 예약문서번호
     **/
    private String resvDocNo;

    /**
     * 라인번호
     **/
    @NotEmpty
    private int lineNo;

    /**
     * RO유형
     **/
    private String roTp;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 패키지품목코드
     **/
    private String pkgItemCd;

    /**
     * 출고유형
     **/
    private String giTp;

    /**
     * 품목단가
     **/
    private Double itemPrc;

    /**
     * 품목수량
     **/
    private Double itemQty;

    /**
     * 품목판매단가
     **/
    private Double itemSalePrc;

    /**
     * 품목판매금액
     **/
    private Double itemSaleAmt;

    /**
     * 계산단위코드
     **/
    private String calcUnitCd;

    /**
     * 계산단위명
     **/
    private String calcUnitNm;

    /**
     * 요청수량
     **/
    private Double reqQty;

    /**
     * 출고수량
     **/
    private Double giQty;

    /**
     * 예정부품금액
     **/
    private Double expcParAmt;

    /**
     * 지불회사명
     **/
    private String payCmpNm;

    /**
     * 캠페인리콜일련번호
     **/
    private String crNo;

    /**
     * FMS쿠폰품목코드
     **/
    private String fmsCupnItemCd;

    /**
     * FMS품목코드
     **/
    private String fmsItemCd;

    /**
     * 로케이션코드
     */
    private String locCd;

    /**
     * 외주거래처코드
     **/
    private String subBpCd;

    /**
     * 외주거래처명
     **/
    private String subBpNm;

    /**
     * 요청창고코드
     **/
    private String reqStrgeCd;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd;

    /**
     * 출고창고코드
     **/
    private String giStrgeCd;

    /**
     * 비고
     **/
    private String remark;

    // 지우지말것
    private String stockStatCd;

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
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
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
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
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
     * @return the giTp
     */
    public String getGiTp() {
        return giTp;
    }

    /**
     * @param giTp the giTp to set
     */
    public void setGiTp(String giTp) {
        this.giTp = giTp;
    }

    /**
     * @return the itemPrc
     */
    public Double getItemPrc() {
        return itemPrc;
    }

    /**
     * @param itemPrc the itemPrc to set
     */
    public void setItemPrc(Double itemPrc) {
        this.itemPrc = itemPrc;
    }

    /**
     * @return the itemQty
     */
    public Double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(Double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the itemSalePrc
     */
    public Double getItemSalePrc() {
        return itemSalePrc;
    }

    /**
     * @param itemSalePrc the itemSalePrc to set
     */
    public void setItemSalePrc(Double itemSalePrc) {
        this.itemSalePrc = itemSalePrc;
    }

    /**
     * @return the itemSaleAmt
     */
    public Double getItemSaleAmt() {
        return itemSaleAmt;
    }

    /**
     * @param itemSaleAmt the itemSaleAmt to set
     */
    public void setItemSaleAmt(Double itemSaleAmt) {
        this.itemSaleAmt = itemSaleAmt;
    }

    /**
     * @return the calcUnitCd
     */
    public String getCalcUnitCd() {
        return calcUnitCd;
    }

    /**
     * @param calcUnitCd the calcUnitCd to set
     */
    public void setCalcUnitCd(String calcUnitCd) {
        this.calcUnitCd = calcUnitCd;
    }

    /**
     * @return the calcUnitNm
     */
    public String getCalcUnitNm() {
        return calcUnitNm;
    }

    /**
     * @param calcUnitNm the calcUnitNm to set
     */
    public void setCalcUnitNm(String calcUnitNm) {
        this.calcUnitNm = calcUnitNm;
    }

    /**
     * @return the reqQty
     */
    public Double getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(Double reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the giQty
     */
    public Double getGiQty() {
        return giQty;
    }

    /**
     * @param giQty the giQty to set
     */
    public void setGiQty(Double giQty) {
        this.giQty = giQty;
    }

    /**
     * @return the expcParAmt
     */
    public Double getExpcParAmt() {
        return expcParAmt;
    }

    /**
     * @param expcParAmt the expcParAmt to set
     */
    public void setExpcParAmt(Double expcParAmt) {
        this.expcParAmt = expcParAmt;
    }

    /**
     * @return the payCmpNm
     */
    public String getPayCmpNm() {
        return payCmpNm;
    }

    /**
     * @param payCmpNm the payCmpNm to set
     */
    public void setPayCmpNm(String payCmpNm) {
        this.payCmpNm = payCmpNm;
    }

    /**
     * @return the fmsCupnItemCd
     */
    public String getFmsCupnItemCd() {
        return fmsCupnItemCd;
    }

    /**
     * @param fmsCupnItemCd the fmsCupnItemCd to set
     */
    public void setFmsCupnItemCd(String fmsCupnItemCd) {
        this.fmsCupnItemCd = fmsCupnItemCd;
    }

    /**
     * @return the fmsItemCd
     */
    public String getFmsItemCd() {
        return fmsItemCd;
    }

    /**
     * @param fmsItemCd the fmsItemCd to set
     */
    public void setFmsItemCd(String fmsItemCd) {
        this.fmsItemCd = fmsItemCd;
    }

    /**
     * @return the subBpCd
     */
    public String getSubBpCd() {
        return subBpCd;
    }

    /**
     * @param subBpCd the subBpCd to set
     */
    public void setSubBpCd(String subBpCd) {
        this.subBpCd = subBpCd;
    }

    /**
     * @return the subBpNm
     */
    public String getSubBpNm() {
        return subBpNm;
    }

    /**
     * @param subBpNm the subBpNm to set
     */
    public void setSubBpNm(String subBpNm) {
        this.subBpNm = subBpNm;
    }

    /**
     * @return the reqStrgeCd
     */
    public String getReqStrgeCd() {
        return reqStrgeCd;
    }

    /**
     * @param reqStrgeCd the reqStrgeCd to set
     */
    public void setReqStrgeCd(String reqStrgeCd) {
        this.reqStrgeCd = reqStrgeCd;
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
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the crNo
     */
    public String getCrNo() {
        return crNo;
    }

    /**
     * @param crNo the crNo to set
     */
    public void setCrNo(String crNo) {
        this.crNo = crNo;
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
     * @return the stockStatCd
     */
    public String getStockStatCd() {
        return stockStatCd;
    }

    /**
     * @param stockStatCd the stockStatCd to set
     */
    public void setStockStatCd(String stockStatCd) {
        this.stockStatCd = stockStatCd;
    }

}