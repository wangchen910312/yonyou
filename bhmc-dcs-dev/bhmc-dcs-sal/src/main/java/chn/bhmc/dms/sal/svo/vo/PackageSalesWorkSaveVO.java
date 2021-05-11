package chn.bhmc.dms.sal.svo.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeadlineCtrlMngSaveVO.java
 * @Description : 신청차량내역 저장용
 * @author Kim yewon
 * @since 2016. 7. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 5.     Kim yewon              최초 생성
 * </pre>
 */
public class PackageSalesWorkSaveVO extends BaseSaveVO<PackageSalesWorkVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;


    PackageSalesWorkVO packageSaleWorkVO;

    BaseSaveVO<PackageSalesWorkVO> vehicleVO;

    /**
     * @return the packageSaleWorkVO
     */
    public PackageSalesWorkVO getPackageSaleWorkVO() {
        return packageSaleWorkVO;
    }

    /**
     * @param packageSaleWorkVO the packageSaleWorkVO to set
     */
    public void setPackageSaleWorkVO(PackageSalesWorkVO packageSaleWorkVO) {
        this.packageSaleWorkVO = packageSaleWorkVO;
    }

    /**
     * @return the vehicleVO
     */
    public BaseSaveVO<PackageSalesWorkVO> getVehicleVO() {
        return vehicleVO;
    }

    /**
     * @param vehicleVO the vehicleVO to set
     */
    public void setVehicleVO(BaseSaveVO<PackageSalesWorkVO> vehicleVO) {
        this.vehicleVO = vehicleVO;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
