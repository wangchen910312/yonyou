package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="pkgItemCd", mesgKey="global.lbl.packageCd")

})
public class PackageSaveVO  extends BaseSaveVO<Object> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6057362774317112438L;

    public int pkgDocNo;
    
    PackageMasterVO packageMasterVO;
    
    BaseSaveVO<PackageLtsVO> packageLtsVO;

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
     * @return the packageLtsVO
     */
    public BaseSaveVO<PackageLtsVO> getPackageLtsVO() {
        return packageLtsVO;
    }

    /**
     * @param packageLtsVO the packageLtsVO to set
     */
    public void setPackageLtsVO(BaseSaveVO<PackageLtsVO> packageLtsVO) {
        this.packageLtsVO = packageLtsVO;
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

    /**
     * @return the pkgDocNo
     */
    public int getPkgDocNo() {
        return pkgDocNo;
    }

    /**
     * @param pkgDocNo the pkgDocNo to set
     */
    public void setPkgDocNo(int pkgDocNo) {
        this.pkgDocNo = pkgDocNo;
    }



}
