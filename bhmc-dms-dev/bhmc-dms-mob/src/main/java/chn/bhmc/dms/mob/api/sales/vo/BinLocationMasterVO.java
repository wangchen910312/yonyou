package chn.bhmc.dms.mob.api.sales.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 로케이션 마스터 VO
 *
 * @ClassName   : BinLocationMasterVO.java
 * @Description : BinLocationMasterVO Class
 * @author In Bo Shim
 * @since 2016. 1. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim     최초 생성
 * </pre>
 */

public class BinLocationMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -771173841617373430L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * DB저장위치ID
     **/
    @NotEmpty
    private String dbLocId;

    /**
     * 위치ID
     **/
    @NotEmpty
    private String locId;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 창고코드
     **/
    private String strgeCd;

    /**
     * 레벨ID
     **/
    private int lvlId;

    /**
     * 트리레벨ID
     **/
    private int baseLvlId;

    /**
     * 상위레벨ID
     **/
    private int upperLvlId;

    /**
     * 위치코드
     **/
    private String locCd;

    /**
     * DB저장 위치코드
     **/
    private String dbLocCd;

    /**
     * 위치명
     **/
    private String locNm = "";

    /**
     * 상위위치ID
     **/
    private String upperLocId;

    /**
     * 최종레벨여부
     **/
    private String lastLvlYn;

    /**
     * 한계관리여부
     **/
    private String lmtMngYn;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 최대량
     **/
    private Double maxQty;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 메인위치여부
     **/
    private String mainLocYn;

    /**
     * 가용재고량
     **/
    private Double avlbStockQty;

    /**
     * 예약재고량
     **/
    private Double resvStockQty;

    /**
     * 보류재고량
     **/
    private Double clamStockQty;

    /**
     * DB 저장여부
     **/
    private String dbYn;

    /**
     * 길이수
     **/
    private int lgthCnt = 0;

    /**
     * 코드유형
     **/
    private String cdTp;

    /**
     * 로케이션정의 상위 레벨ID
     **/
    private String upperLvlTxt;

    /**
     * 로케이션정의 레벨ID
     **/
    private String lvlTxt;

    /**
     * 로케이션 CRUD
     **/
    private String cudType;

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
     * @return the dbLocId
     */
    public String getDbLocId() {
        return dbLocId;
    }

    /**
     * @param dbLocId the dbLocId to set
     */
    public void setDbLocId(String dbLocId) {
        this.dbLocId = dbLocId;
    }

    /**
     * @return the locId
     */
    public String getLocId() {
        return locId;
    }

    /**
     * @param locId the locId to set
     */
    public void setLocId(String locId) {
        this.locId = locId;
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
     * @return the lvlId
     */
    public int getLvlId() {
        return lvlId;
    }

    /**
     * @param lvlId the lvlId to set
     */
    public void setLvlId(int lvlId) {
        this.lvlId = lvlId;
    }

    /**
     * @return the baseLvlId
     */
    public int getBaseLvlId() {
        return baseLvlId;
    }

    /**
     * @param baseLvlId the baseLvlId to set
     */
    public void setBaseLvlId(int baseLvlId) {
        this.baseLvlId = baseLvlId;
    }

    /**
     * @return the upperLvlId
     */
    public int getUpperLvlId() {
        return upperLvlId;
    }

    /**
     * @param upperLvlId the upperLvlId to set
     */
    public void setUpperLvlId(int upperLvlId) {
        this.upperLvlId = upperLvlId;
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
     * @return the dbLocCd
     */
    public String getDbLocCd() {
        return dbLocCd;
    }

    /**
     * @param dbLocCd the dbLocCd to set
     */
    public void setDbLocCd(String dbLocCd) {
        this.dbLocCd = dbLocCd;
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
     * @return the upperLocId
     */
    public String getUpperLocId() {
        return upperLocId;
    }

    /**
     * @param upperLocId the upperLocId to set
     */
    public void setUpperLocId(String upperLocId) {
        this.upperLocId = upperLocId;
    }

    /**
     * @return the lastLvlYn
     */
    public String getLastLvlYn() {
        return lastLvlYn;
    }

    /**
     * @param lastLvlYn the lastLvlYn to set
     */
    public void setLastLvlYn(String lastLvlYn) {
        this.lastLvlYn = lastLvlYn;
    }

    /**
     * @return the lmtMngYn
     */
    public String getLmtMngYn() {
        return lmtMngYn;
    }

    /**
     * @param lmtMngYn the lmtMngYn to set
     */
    public void setLmtMngYn(String lmtMngYn) {
        this.lmtMngYn = lmtMngYn;
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
     * @return the maxQty
     */
    public Double getMaxQty() {
        return maxQty;
    }

    /**
     * @param maxQty the maxQty to set
     */
    public void setMaxQty(Double maxQty) {
        this.maxQty = maxQty;
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
     * @return the mainLocYn
     */
    public String getMainLocYn() {
        return mainLocYn;
    }

    /**
     * @param mainLocYn the mainLocYn to set
     */
    public void setMainLocYn(String mainLocYn) {
        this.mainLocYn = mainLocYn;
    }

    /**
     * @return the avlbStockQty
     */
    public Double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(Double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }

    /**
     * @return the resvStockQty
     */
    public Double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(Double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the clamStockQty
     */
    public Double getClamStockQty() {
        return clamStockQty;
    }

    /**
     * @param clamStockQty the clamStockQty to set
     */
    public void setClamStockQty(Double clamStockQty) {
        this.clamStockQty = clamStockQty;
    }

    /**
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }

    /**
     * @return the lgthCnt
     */
    public int getLgthCnt() {
        return lgthCnt;
    }

    /**
     * @param lgthCnt the lgthCnt to set
     */
    public void setLgthCnt(int lgthCnt) {
        this.lgthCnt = lgthCnt;
    }

    /**
     * @return the cdTp
     */
    public String getCdTp() {
        return cdTp;
    }

    /**
     * @param cdTp the cdTp to set
     */
    public void setCdTp(String cdTp) {
        this.cdTp = cdTp;
    }

    /**
     * @return the upperLvlTxt
     */
    public String getUpperLvlTxt() {
        return upperLvlTxt;
    }

    /**
     * @param upperLvlTxt the upperLvlTxt to set
     */
    public void setUpperLvlTxt(String upperLvlTxt) {
        this.upperLvlTxt = upperLvlTxt;
    }

    /**
     * @return the lvlTxt
     */
    public String getLvlTxt() {
        return lvlTxt;
    }

    /**
     * @param lvlTxt the lvlTxt to set
     */
    public void setLvlTxt(String lvlTxt) {
        this.lvlTxt = lvlTxt;
    }

    /**
     * @return the cudType
     */
    public String getCudType() {
        return cudType;
    }

    /**
     * @param cudType the cudType to set
     */
    public void setCudType(String cudType) {
        this.cudType = cudType;
    }
}
