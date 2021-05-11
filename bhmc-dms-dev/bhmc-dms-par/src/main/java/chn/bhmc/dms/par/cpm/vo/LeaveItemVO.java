package chn.bhmc.dms.par.cpm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 방치품 아이템 VO.
 *
 * @ClassName   : LeaveItemVO.java
 * @Description : LeaveItemVO Class
 * @author In Bo Shim
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     In Bo Shim     최초 생성
 * </pre>
 */

public class LeaveItemVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1150198558617483605L;

    /**
     * 딜러번호
     **/
    private String dlrCd = "";

    /**
     * 부품번호
     **/
    private String itemCd = "";

    /**
     * 부품명
     **/
    private String itemNm = "";

    /**
     * 품목구분코드
     **/
    private String itemDstinCd = "";

    /**
     * 방치품
     **/
    private String nonMovingItemCd = "";

    /**
     * 방치품 구분자
     **/
    private String nonMovingFlg = "N";

    /**
     * 차종
     **/
    private String carlineCd = "";

    /**
     * 업체코드
     **/
    private String bpCd = "";

    /**
     * 업체명
     **/
    private String bpNm = "";

    /**
     * 창고
     **/
    private String strgeCd = "";

    /**
     * 재고원가
     */
    private double stockGiPrc = 0.0;

    /**
     * 구매단가금액
     */
    private double purcPrc = 0.0;

    /**
     * 창고리스트 STRGE_CD_LIST
     **/
    private String strgeCdList;

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
     * 최근입고일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGrDt;

    /**
     * 최근출고일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGiDt;

    /**
     * 가용재고수량
     */
    private double avlbStockQty = 0.0;

    /**
     * 재고금액
     */
    private double stockAmt = 0.0;

    /**
     * 가격
     */
    private double stockPrc = 0.0;

    /**
     * 파일번호
     */
    private String fileDocNo = "";

    /**
     * 파일명
     */
    private String fileName = "";

    /**
     * 파일데이터내용
     **/
    private byte[] fileDataCont;

    /**
     * 파일데이터Base64
     **/
    private String fileDataContBase64 = "";

    /**
     * 파일 Width
     **/
    private String fileWidth = "";

    /**
     * 파일 Height
     **/
    private String fileHeight = "";

    /**
     * Is Primary
     **/
    private String isPrimary = "";

    /**
     * 파일 Desc
     **/
    private String desc = "";

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
     * @return the nonMovingItemCd
     */
    public String getNonMovingItemCd() {
        return nonMovingItemCd;
    }

    /**
     * @param nonMovingItemCd the nonMovingItemCd to set
     */
    public void setNonMovingItemCd(String nonMovingItemCd) {
        this.nonMovingItemCd = nonMovingItemCd;
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
     * @return the stockPrc
     */
    public double getStockPrc() {
        return stockPrc;
    }

    /**
     * @param stockPrc the stockPrc to set
     */
    public void setStockPrc(double stockPrc) {
        this.stockPrc = stockPrc;
    }

    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }

    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }

    /**
     * @return the fileName
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName the fileName to set
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * @return the fileDataCont
     */
    public byte[] getFileDataCont() {
        return fileDataCont;
    }

    /**
     * @param fileDataCont the fileDataCont to set
     */
    public void setFileDataCont(byte[] fileDataCont) {
        this.fileDataCont = fileDataCont;
    }

    /**
     * @return the fileDataContBase64
     */
    public String getFileDataContBase64() {
        return fileDataContBase64;
    }

    /**
     * @param fileDataContBase64 the fileDataContBase64 to set
     */
    public void setFileDataContBase64(String fileDataContBase64) {
        this.fileDataContBase64 = fileDataContBase64;
    }

    /**
     * @return the fileWidth
     */
    public String getFileWidth() {
        return fileWidth;
    }

    /**
     * @param fileWidth the fileWidth to set
     */
    public void setFileWidth(String fileWidth) {
        this.fileWidth = fileWidth;
    }

    /**
     * @return the fileHeight
     */
    public String getFileHeight() {
        return fileHeight;
    }

    /**
     * @param fileHeight the fileHeight to set
     */
    public void setFileHeight(String fileHeight) {
        this.fileHeight = fileHeight;
    }

    /**
     * @return the isPrimary
     */
    public String getIsPrimary() {
        return isPrimary;
    }

    /**
     * @param isPrimary the isPrimary to set
     */
    public void setIsPrimary(String isPrimary) {
        this.isPrimary = isPrimary;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the strgeCdList
     */
    public String getStrgeCdList() {
        return strgeCdList;
    }
    /**
     * @param strgeCdList the strgeCdList to set
     */
    public void setStrgeCdList(String strgeCdList) {
        this.strgeCdList = strgeCdList;
    }
}
