package chn.bhmc.dms.crm.cif.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustCouponInPackageInfoSaveVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public class CustCouponInPackageInfoSaveVO extends BaseSaveVO<CustCouponInPackageInfoVO> {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1278109013302379487L;

    public List<CustCouponInPackageInfoVO> custPackageInfoList = new ArrayList<CustCouponInPackageInfoVO>();

    /**
     * @return the custPackageInfoList
     */
    public List<CustCouponInPackageInfoVO> getCustPackageInfoList() {
        return custPackageInfoList;
    }

    /**
     * @param custPackageInfoList the custPackageInfoList to set
     */
    public void setCustPackageInfoList(List<CustCouponInPackageInfoVO> custPackageInfoList) {
        this.custPackageInfoList = custPackageInfoList;
    }




}
