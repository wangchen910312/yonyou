package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BinLocationMasterTreeListVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo ShimS
 * @since 2016. 3. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 15.     In Bo ShimS     최초 생성
 * </pre>
 */

public class BinLocationMasterTreeListVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1759233908981813334L;
    /**
     * ID(LVL_ID)
     **/
    private String id = null;

    /**
     * 레벨ID
     **/
    private int lvlId = 0;

    /**
     * 위치ID
     **/
    private String locId = "";

    /**
     * 위치코드
     **/
    private String locCd = "";
    /**
     * 위치명
     **/
    private String locNm = "";
    /**
     * UPPER_LOC_ID
     **/
    private String parentId = null;

    /**
     * 부품코드
     **/
    private String itemCd = "";

    /**
     * 메인위치여부
     **/
    private String mainLocYn = "N";

    /**
     * 최종레벨여부
     **/
    private String lastLvlYn = "N";

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
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
}
