package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbySearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponStandbyVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponStandbyService.java
 * @Description : 패키지쿠폰 결재대기 서비스
 * @author Kim Hyun Ho
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface PackageCouponStandbyService {
    /**
     * 패키지 쿠폰의 금액이 0원일 경우 해당 정보에 대한 승인요청 처리를 한다.
     * @param SurveySatisFactionVO
     */
    public void multiPackageCouponStandbys(BaseSaveVO<PackageCouponStandbyVO> saveVO) throws Exception;

    /**
     * 패키지 쿠폰 결재대기 정보를 등록한다.
     * @param packageCouponStandbyVO - 등록할 정보가 담긴 PackageCouponStandbyVO
     * @return 등록된 목록수
     */
    public int insertPackageCouponStandby(PackageCouponStandbyVO packageCouponStandbyVO) throws Exception;

    /**
     * 조회 조건에 해당하는 패키지 쿠폰 결재대기 목록정보를 조회한다.
     * @param packageCouponStandbyVO - 등록할 정보가 담긴 PackageCouponStandbyVO
     * @return 조회된 목록수
     */
    public List<PackageCouponStandbyVO> selectPackageCouponStandbyCondition(PackageCouponStandbySearchVO searchVO) throws Exception;

}
