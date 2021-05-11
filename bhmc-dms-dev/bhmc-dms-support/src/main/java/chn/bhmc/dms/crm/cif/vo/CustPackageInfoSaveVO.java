package chn.bhmc.dms.crm.cif.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustPackageInfoSaveVO
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

public class CustPackageInfoSaveVO extends BaseSaveVO<CustPackageInfoVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4011120484362574710L;

    public List<CustPackageInfoVO> custPackageInfoList = new ArrayList<CustPackageInfoVO>();

    /**
     * @return the custPackageInfoList
     */
    public List<CustPackageInfoVO> getCustPackageInfoList() {
        return custPackageInfoList;
    }

    /**
     * @param custPackageInfoList the custPackageInfoList to set
     */
    public void setCustPackageInfoList(List<CustPackageInfoVO> custPackageInfoList) {
        this.custPackageInfoList = custPackageInfoList;
    }



}
