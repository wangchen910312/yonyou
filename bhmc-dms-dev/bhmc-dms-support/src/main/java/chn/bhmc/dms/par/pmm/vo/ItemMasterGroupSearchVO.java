package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 부품정보관리 부품유형 검색 VO
 *
 * @ClassName   : ItemMasterGroupSearchVO.java
 * @Description : ItemMasterGroupSearchVO Class
 * @author In Bo Shim
 * @since 2016. 8. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 5.     In Bo Shim      최초 생성
 * </pre>
 */

public class ItemMasterGroupSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7792860273351133519L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 품목그룹코드1
     **/
    private String sItemGrpCd1;

    /**
     * 품목그룹코드2
     **/
    private String sItemGrpCd2;

    /**
     * 품목그룹코드3
     **/
    private String sItemGrpCd3;

    /**
     * 품목그룹코드4
     **/
    private String sItemGrpCd4;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sItemGrpCd1
     */
    public String getsItemGrpCd1() {
        return sItemGrpCd1;
    }

    /**
     * @param sItemGrpCd1 the sItemGrpCd1 to set
     */
    public void setsItemGrpCd1(String sItemGrpCd1) {
        this.sItemGrpCd1 = sItemGrpCd1;
    }

    /**
     * @return the sItemGrpCd2
     */
    public String getsItemGrpCd2() {
        return sItemGrpCd2;
    }

    /**
     * @param sItemGrpCd2 the sItemGrpCd2 to set
     */
    public void setsItemGrpCd2(String sItemGrpCd2) {
        this.sItemGrpCd2 = sItemGrpCd2;
    }

    /**
     * @return the sItemGrpCd3
     */
    public String getsItemGrpCd3() {
        return sItemGrpCd3;
    }

    /**
     * @param sItemGrpCd3 the sItemGrpCd3 to set
     */
    public void setsItemGrpCd3(String sItemGrpCd3) {
        this.sItemGrpCd3 = sItemGrpCd3;
    }

    /**
     * @return the sItemGrpCd4
     */
    public String getsItemGrpCd4() {
        return sItemGrpCd4;
    }

    /**
     * @param sItemGrpCd4 the sItemGrpCd4 to set
     */
    public void setsItemGrpCd4(String sItemGrpCd4) {
        this.sItemGrpCd4 = sItemGrpCd4;
    }
}
