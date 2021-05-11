 package chn.bhmc.dms.sal.inv.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockConditionVO
 * @Description : 재고현황 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class StockConditionVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5075882412737711824L;

    private int id;
    private String lvlId;
    private String locCd;
    private String locNm;
    private String mainLocYn;
    private String strgeCd;
    private String upperLocId;
    private String parentId;
    private int tot;
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    /**
     * @return the lvlId
     */
    public String getLvlId() {
        return lvlId;
    }
    /**
     * @param lvlId the lvlId to set
     */
    public void setLvlId(String lvlId) {
        this.lvlId = lvlId;
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
     * @return the parentId
     */
    public String getParentId() {
        return parentId;
    }
    /**
     * @param parentId the parentId to set
     */
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    /**
     * @return the tot
     */
    public int getTot() {
        return tot;
    }
    /**
     * @param tot the tot to set
     */
    public void setTot(int tot) {
        this.tot = tot;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}