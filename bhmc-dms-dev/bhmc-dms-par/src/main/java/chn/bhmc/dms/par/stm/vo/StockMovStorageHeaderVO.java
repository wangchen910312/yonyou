package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * StockMovStorageHeader VO
 *
 * @ClassName   : StockMovStorageHeaderVO.java
 * @Description : StockMovStorageHeaderVO Class
 * @author In Bo Shim
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     In Bo Shim     최초 생성
 * </pre>
 */
public class StockMovStorageHeaderVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4864241474017113425L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 기타출고문서번호
     **/
    private String etcGiDocNo;

    /**
     * 상태코드
     **/
    private String statCd;

    /**
     * 수불유형
     **/
    private String mvtTp;

    /**
     *
     * 품목수
     **/
    private int itemCnt;

    /**
     *
     * 품목수량
     **/
    private double itemQty;

    /**
    *
    * 총금액
    **/
   private Double itemTotAmt = 0.0;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 위치코드
     **/
    private String locCd;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 등록자명
     **/
    private String regUsrNm;


    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;

    /**
     * 입고일자 문자열
     **/
    private String grDtString;

    /**
     * 결과
     **/
    private boolean resultYn;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    //UPDT_DT_STR
    private  String          updtDtStr;

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
     * @return the etcGiDocNo
     */
    public String getEtcGiDocNo() {
        return etcGiDocNo;
    }

    /**
     * @param etcGiDocNo the etcGiDocNo to set
     */
    public void setEtcGiDocNo(String etcGiDocNo) {
        this.etcGiDocNo = etcGiDocNo;
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
     * @return the mvtTp
     */
    public String getMvtTp() {
        return mvtTp;
    }

    /**
     * @param mvtTp the mvtTp to set
     */
    public void setMvtTp(String mvtTp) {
        this.mvtTp = mvtTp;
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
     * @return the resultYn
     */
    public boolean getResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
    }

    /**
     * @return the itemCnt
     */
    public int getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(int itemCnt) {
        this.itemCnt = itemCnt;
    }

    /**
     * @return the itemQty
     */
    public double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the itemTotAmt
     */
    public Double getItemTotAmt() {
        return itemTotAmt;
    }

    /**
     * @param itemTotAmt the itemTotAmt to set
     */
    public void setItemTotAmt(Double itemTotAmt) {
        this.itemTotAmt = itemTotAmt;
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
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }

    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
    }

    /**
     * @return the grDtString
     */
    public String getGrDtString() {
        return grDtString;
    }

    /**
     * @param grDtString the grDtString to set
     */
    public void setGrDtString(String grDtString) {
        this.grDtString = grDtString;
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

}
