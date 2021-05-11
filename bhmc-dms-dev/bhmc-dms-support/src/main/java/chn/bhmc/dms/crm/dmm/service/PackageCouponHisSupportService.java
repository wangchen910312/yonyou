package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponHisSupportService.java
 * @Description : 패키지 쿠폰 이력 서비스
 * @author Lee In Moon
 * @since 2016.09.03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.03.     Lee In Moon     최초 생성
 * </pre>
 */

public interface PackageCouponHisSupportService {


    /**
     * 조회 조건에 해당하는 패키지 쿠폰 이력 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return
     */
    public int selectPackageCouponHissByConditionCnt(PackageCouponHisSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 패키지쿠폰 이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return 조회 목록
     */
    public List<PackageCouponHisVO> selectPackageCouponHissByCondition(PackageCouponHisSearchVO searchVO) throws Exception;

    /**
     * 타시스템에서 사용 : 패키지 쿠폰에 대한 사용여부를 조회한다.
     * @param packageCouponHisVO - 수정할 정보가 담긴 PackageCouponHisVO
     * @return 조회된 목록수
     */
    public List<PackageCouponHisVO> selectPackageCouponHisUseCondition(PackageCouponHisSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param packageCouponHisVO
     * @return
     */
    public int updatePackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception ;
}
