package chn.bhmc.dms.ser.wac.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : ClaimReqPartVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *  since author  description * =========== ============= ===========================
 * 2016. 5. 17.  Kwon Ki Hyun  최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="roDocNo", mesgKey="ser.lbl.roDocNo")
    ,@ValidField(field="claimDocNo", mesgKey="ser.lbl.claimNo")
})
public class ClaimReqPartVO extends BaseVO{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4123566297978808762L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 클레임문서번호
     **/
    @NotBlank
    private String claimDocNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * RO문서번호
     **/
    @NotBlank
    private String roDocNo;

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
     * 품목단가
     **/
    private Double itemPrc;

    /**
     * 품목수량
     **/
    private Double itemQty;

    /**
     * 품목판매금액
     **/
    private Double itemSaleAmt;

    /**
     * 판매단위코드
     **/
    private String saleUnitCd;

    /**
     * 요청수량
     **/
    private int reqQty;

    /**
     * 부품금액
     **/
    private Double itemAmt;

    /**
     * 확정부품금액
     **/
    private Double confirmItemAmt;

    /**
     * 캠페인리콜번호
     **/
    private String crNo;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd;

    /**
     * 출고창고코드
     **/
    private String giStrgeCd;

    /**
     * 외주거래처코드
     **/
    private String subBpCd;

    /**
     * 외주거래처명
     **/
    private String subBpNm;

    /**
     * 원인부품여부
     **/
    private String cauItemYn;

    /**
     * 클레임연도
     **/
    private String claimYy;

    /**
     * NPN MAX AMT
     **/
    private Double npnpMaxAmt;

    /**
     * NPN Part YN
     */
    private String npnpYn;

    private String carDstinNm;

    private String modelNm;

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
     * @return the claimDocNo
     */
    public String getClaimDocNo() {
        return claimDocNo;
    }

    /**
     * @param claimDocNo the claimDocNo to set
     */
    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
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
     * @return the saleUnitCd
     */
    public String getSaleUnitCd() {
        return saleUnitCd;
    }

    /**
     * @param saleUnitCd the saleUnitCd to set
     */
    public void setSaleUnitCd(String saleUnitCd) {
        this.saleUnitCd = saleUnitCd;
    }

    /**
     * @return the reqQty
     */
    public int getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(int reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the itemAmt
     */
    public Double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(Double itemAmt) {
        this.itemAmt = itemAmt;
    }



    /**
     * @return the confirmItemAmt
     */
    public Double getConfirmItemAmt() {
        return confirmItemAmt;
    }

    /**
     * @param confirmItemAmt the confirmItemAmt to set
     */
    public void setConfirmItemAmt(Double confirmItemAmt) {
        this.confirmItemAmt = confirmItemAmt;
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
     * @return the cauItemYn
     */
    public String getCauItemYn() {
        return cauItemYn;
    }

    /**
     * @param cauItemYn the cauItemYn to set
     */
    public void setCauItemYn(String cauItemYn) {
        this.cauItemYn = cauItemYn;
    }

    /**
     * @return the claimYy
     */
    public String getClaimYy() {
        return claimYy;
    }

    /**
     * @param claimYy the claimYy to set
     */
    public void setClaimYy(String claimYy) {
        this.claimYy = claimYy;
    }

    public Double getNpnpMaxAmt() {
        return npnpMaxAmt;
    }

    public void setNpnpMaxAmt(Double npnpMaxAmt) {
        this.npnpMaxAmt = npnpMaxAmt;
    }

    public String getNpnpYn() {
        return npnpYn;
    }

    public void setNpnpYn(String npnpYn) {
        this.npnpYn = npnpYn;
    }

    /**
     * @return the carDstinNm
     */
    public String getCarDstinNm() {
        return carDstinNm;
    }

    /**
     * @param carDstinNm the carDstinNm to set
     */
    public void setCarDstinNm(String carDstinNm) {
        this.carDstinNm = carDstinNm;
    }

    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }

    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

}
