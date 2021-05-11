package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.CouponSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CouponVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CouponService.java
 * @Description : 클래스 설명을 기술합니다.
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

public interface CouponService {
    /**
     * 조회 조건에 해당하는 패키지 쿠폰 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return
     */
    public int selectCouponsByConditionCnt(CouponSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 패키지쿠폰 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return 조회 목록
     */
    public List<CouponVO> selectCouponsByCondition(CouponSearchVO searchVO) throws Exception;

    /**
     * 쿠폰 정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiCoupons(BaseSaveVO<CouponVO> saveVO) throws Exception;

    /**
     * 쿠폰 정보를 등록한다.
     * @param couponVO - 등록할 정보가 담긴 CouponVO
     * @return 등록된 목록수
     */
    public int insertCoupon(CouponVO couponVO) throws Exception;

    /**
     * 쿠폰 정보를 수정한다.
     * @param couponVO - 수정할 정보가 담긴 CouponVO
     * @return 수정된 목록수
     */
    public int updateCoupon(CouponVO couponVO) throws Exception;

    /**
     * 쿠폰 정보를 삭제한다.
     * @param couponVO - 삭제할 정보가 담긴 CouponVO
     * @return 삭제된 목록수
     */
    public int deleteCoupon(CouponVO couponVO) throws Exception;
}
