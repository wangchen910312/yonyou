package chn.bhmc.dms.par.pmm.vo;

/**
 * 부품패키지 정보 및 패키지 헤더 저장 VO
 *
 * @ClassName   : ItemMasterPackageSaveVO.java
 * @Description : ItemMasterPackageSaveVO Class
 * @author In Bo Shim
 * @since 2016. 11. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 16.     In Bo Shim     최초 생성
 * </pre>
 */

public class ItemMasterPackageSaveVO {

    /**
     * 부품 마스터 VO
     **/
    private ItemMasterVO itemMasterVO;

    /**
     * 부품패키지 헤더
     **/
    private PackagePartsHeaderVO packagePartsHeaderVO;

    /**
     * @return the itemMasterVO
     */
    public ItemMasterVO getItemMasterVO() {
        return itemMasterVO;
    }

    /**
     * @param itemMasterVO the itemMasterVO to set
     */
    public void setItemMasterVO(ItemMasterVO itemMasterVO) {
        this.itemMasterVO = itemMasterVO;
    }

    /**
     * @return the packagePartsHeaderVO
     */
    public PackagePartsHeaderVO getPackagePartsHeaderVO() {
        return packagePartsHeaderVO;
    }

    /**
     * @param packagePartsHeaderVO the packagePartsHeaderVO to set
     */
    public void setPackagePartsHeaderVO(PackagePartsHeaderVO packagePartsHeaderVO) {
        this.packagePartsHeaderVO = packagePartsHeaderVO;
    }
}
