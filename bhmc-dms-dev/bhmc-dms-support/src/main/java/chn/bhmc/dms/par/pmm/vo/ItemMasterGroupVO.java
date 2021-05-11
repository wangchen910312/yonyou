package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 부품정보관리 부품유형 VO
 *
 * @ClassName   : ItemMasterGroupVO.java
 * @Description : ItemMasterGroupVO Class
 * @author In Bo Shim
 * @since 2016. 8. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 5.     In Bo Shim     최초 생성
 * </pre>
 */

public class ItemMasterGroupVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6977968219619754115L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 부품코드
     **/
    @NotEmpty
    private String itemCd;

    /**
     * 품목그룹코드1
     **/
    private String itemGrpCd1;

    /**
     * 품목그룹코드2
     **/
    private String itemGrpCd2;

    /**
     * 품목그룹코드3
     **/
    private String itemGrpCd3;

    /**
     * 품목그룹코드4
     **/
    private String itemGrpCd4;

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
     * @return the itemGrpCd1
     */
    public String getItemGrpCd1() {
        return itemGrpCd1;
    }

    /**
     * @param itemGrpCd1 the itemGrpCd1 to set
     */
    public void setItemGrpCd1(String itemGrpCd1) {
        this.itemGrpCd1 = itemGrpCd1;
    }

    /**
     * @return the itemGrpCd2
     */
    public String getItemGrpCd2() {
        return itemGrpCd2;
    }

    /**
     * @param itemGrpCd2 the itemGrpCd2 to set
     */
    public void setItemGrpCd2(String itemGrpCd2) {
        this.itemGrpCd2 = itemGrpCd2;
    }

    /**
     * @return the itemGrpCd3
     */
    public String getItemGrpCd3() {
        return itemGrpCd3;
    }

    /**
     * @param itemGrpCd3 the itemGrpCd3 to set
     */
    public void setItemGrpCd3(String itemGrpCd3) {
        this.itemGrpCd3 = itemGrpCd3;
    }

    /**
     * @return the itemGrpCd4
     */
    public String getItemGrpCd4() {
        return itemGrpCd4;
    }

    /**
     * @param itemGrpCd4 the itemGrpCd4 to set
     */
    public void setItemGrpCd4(String itemGrpCd4) {
        this.itemGrpCd4 = itemGrpCd4;
    }
}
