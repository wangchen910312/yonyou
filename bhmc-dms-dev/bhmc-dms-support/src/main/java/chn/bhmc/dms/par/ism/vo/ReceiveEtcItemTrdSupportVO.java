package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 기초재고입고 (정비수령)
 * </pre>
 *
 * @ClassName   : ReceiveEtcItemTrdSupportVO.java
 * @Description : ReceiveEtcItemTrdSupportVO.class
 * @author In Bo Shim
 * @since 2017. 8. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 15.     In Bo Shim     최초 생성
 * </pre>
 */

public class ReceiveEtcItemTrdSupportVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6270042512670229801L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 순번
     **/
    private int seqNo;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 입고예정수량
     **/
    private Double grScheQty = 0.0;

    /**
     * 출고예정수량
     **/
    private Double giScheQty = 0.0;

    /**
     * 최신입고가
     **/
    private Double giAmt = 0.0;

    /**
     * 최신입고일자
     **/
    private String giDt;

    /**
     * 적용여부
     **/
    private String applyYn;

    /**
     * 적용일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyDt;

    /**
     * 재고금액
     **/
    private Double stockAmt = 0.0;

    /**
     * 부품요청문서번호
     **/
    private String parReqDocNo;

    /**
     * RO문서번호
     **/
    private String roDocNo;

    /**
     * RO문서라인번호
     **/
    private int roLineNo = 0;

    /**
     * 적용여부
     **/
    private String applyGiYn;

    /**
     * 적용일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date applyGiDt;

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
     * @return the seqNo
     */
    public int getSeqNo() {
        return seqNo;
    }

    /**
     * @param seqNo the seqNo to set
     */
    public void setSeqNo(int seqNo) {
        this.seqNo = seqNo;
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
    public Double getGrScheQty() {
        return grScheQty;
    }

    /**
     * @param grScheQty the grScheQty to set
     */
    public void setGrScheQty(Double grScheQty) {
        this.grScheQty = grScheQty;
    }

    /**
     * @return the giScheQty
     */
    public Double getGiScheQty() {
        return giScheQty;
    }

    /**
     * @param giScheQty the giScheQty to set
     */
    public void setGiScheQty(Double giScheQty) {
        this.giScheQty = giScheQty;
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
     * @return the giDt
     */
    public String getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(String giDt) {
        this.giDt = giDt;
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
     * @return the stockAmt
     */
    public Double getStockAmt() {
        return stockAmt;
    }

    /**
     * @param stockAmt the stockAmt to set
     */
    public void setStockAmt(Double stockAmt) {
        this.stockAmt = stockAmt;
    }

    /**
     * @return the parReqDocNo
     */
    public String getParReqDocNo() {
        return parReqDocNo;
    }

    /**
     * @param parReqDocNo the parReqDocNo to set
     */
    public void setParReqDocNo(String parReqDocNo) {
        this.parReqDocNo = parReqDocNo;
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
     * @return the roLineNo
     */
    public int getRoLineNo() {
        return roLineNo;
    }

    /**
     * @param roLineNo the roLineNo to set
     */
    public void setRoLineNo(int roLineNo) {
        this.roLineNo = roLineNo;
    }

    /**
     * @return the applyGiYn
     */
    public String getApplyGiYn() {
        return applyGiYn;
    }

    /**
     * @param applyGiYn the applyGiYn to set
     */
    public void setApplyGiYn(String applyGiYn) {
        this.applyGiYn = applyGiYn;
    }

    /**
     * @return the applyGiDt
     */
    public Date getApplyGiDt() {
        return applyGiDt;
    }

    /**
     * @param applyGiDt the applyGiDt to set
     */
    public void setApplyGiDt(Date applyGiDt) {
        this.applyGiDt = applyGiDt;
    }
}
