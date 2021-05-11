package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponHisService.java
 * @Description : 패키지 쿠폰 이력 서비스
 * @author Kim Hyun Ho
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface PackageCouponHisService {
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
     * 조회 조건에 해당하는 패키지쿠폰 이력 상세정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return 조회 목록
     */
    public PackageCouponHisVO selectPackageCouponHisByKey(PackageCouponHisSearchVO searchVO) throws Exception;

    /**
     * 패키지 쿠폰이력 정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiPackageCouponHiss(BaseSaveVO<PackageCouponHisVO> saveVO) throws Exception;

    /**
     * 패키지 쿠폰이력 정보를 등록한다.
     * @param packageCouponHisVO - 등록할 정보가 담긴 PackageCouponHisVO
     * @return 등록된 목록수
     */
    public int insertPackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception;

    /**
     * 패키지 쿠폰이력  정보를 수정한다.
     * @param packageCouponHisVO - 수정할 정보가 담긴 PackageCouponHisVO
     * @return 수정된 목록수
     */
    public int updatePackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception;

    /**
     * 패키지 쿠폰이력  정보를 삭제한다.
     * @param packageCouponHisVO - 삭제할 정보가 담긴 PackageCouponHisVO
     * @return 삭제된 목록수
     */
    public int deletePackageCouponHis(PackageCouponHisVO packageCouponHisVO) throws Exception;
}
