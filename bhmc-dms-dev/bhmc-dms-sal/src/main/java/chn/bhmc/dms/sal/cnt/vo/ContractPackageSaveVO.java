package chn.bhmc.dms.sal.cnt.vo;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractPackageSaveVO
 * @Description : 집단판매 save VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 26.    Kim Jin Suk        최초 생성
 * </pre>
 */

public class ContractPackageSaveVO extends BaseSaveVO<ContractPackageItemVO>{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3272305443628982273L;

    // 계약정보
    @Valid
    private ContractPackageVO packageVO;

    // create, update Flag
    private String multiFlag = "";

    /**
     * @return the packageVO
     */
    public ContractPackageVO getPackageVO() {
        return packageVO;
    }

    /**
     * @param packageVO the packageVO to set
     */
    public void setPackageVO(ContractPackageVO packageVO) {
        this.packageVO = packageVO;
    }

    /**
     * @return the multiFlag
     */
    public String getMultiFlag() {
        return multiFlag;
    }

    /**
     * @param multiFlag the multiFlag to set
     */
    public void setMultiFlag(String multiFlag) {
        this.multiFlag = multiFlag;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
