package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageItemSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.     In Bo Shim     최초 생성
 * </pre>
 */

public class PackageItemSaveVO {

    PackageMasterVO packageMasterVO;

    BaseSaveVO<PackageParVO> packageParVO;

    /**
     * @return the packageMasterVO
     */
    public PackageMasterVO getPackageMasterVO() {
        return packageMasterVO;
    }

    /**
     * @param packageMasterVO the packageMasterVO to set
     */
    public void setPackageMasterVO(PackageMasterVO packageMasterVO) {
        this.packageMasterVO = packageMasterVO;
    }

    /**
     * @return the packageParVO
     */
    public BaseSaveVO<PackageParVO> getPackageParVO() {
        return packageParVO;
    }

    /**
     * @param packageParVO the packageParVO to set
     */
    public void setPackageParVO(BaseSaveVO<PackageParVO> packageParVO) {
        this.packageParVO = packageParVO;
    }

}
