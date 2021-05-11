package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 부번별 로케이션 부품 VO
 *
 * @ClassName   : BinLocationItemVO.java
 * @Description : BinLocationItemVO Class
 * @author In Bo Shim
 * @since 2016. 6. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 15.     In Bo Shim     최초 생성
 * </pre>
 */

public class BinLocationMasterItemVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7073402764003977093L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * DB저장위치ID
     **/
    private String dbLocId = "";

    /**
     * 위치ID
     **/
    private String locId = "";

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 부품 마스터 창고코드
     **/
    private String grStrgeCd;

    /**
     * 로케이션 창고코드
     **/
    private String strgeCd;

    /**
     * 레벨ID
     **/
    private int lvlId;

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
    private String locNm;

    /**
     * 상위위치ID
     **/
    private String upperLocId;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * 품목구분
     **/
    private String itemDstinCd;

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
}
