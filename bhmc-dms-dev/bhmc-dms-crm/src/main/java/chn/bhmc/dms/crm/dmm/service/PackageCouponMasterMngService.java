package chn.bhmc.dms.crm.dmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponMasterMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageCouponMasterMngService.java
 * @Description : 패키지쿠폰 Master관리 interface
 * @author Kim Hyun Ho
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public interface PackageCouponMasterMngService {
    /**
     * 조회 조건에 해당하는 패키지 쿠폰 수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return
     */
    public int selectPackageCouponMasterMngsByConditionCnt(PackageCouponMasterMngSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 패키지쿠폰 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return 조회 목록
     */
    public List<PackageCouponMasterMngVO> selectPackageCouponMasterMngsByCondition(PackageCouponMasterMngSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 패키지 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageCouponMasterMngSearchVO
     * @return 조회 목록
     */
    public PackageCouponMasterMngVO selectPackageCouponMasterMngByKey(PackageCouponMasterMngSearchVO searchVO) throws Exception;

    /**
     * 패키지 정보를 등록/수정/삭제 처리한다.
     * @param SurveySatisFactionVO
     */
    public void multiPackageCouponMasterMngs(BaseSaveVO<PackageCouponMasterMngVO> saveVO) throws Exception;

    /**
     * 패키지 정보를 등록한다.
     * @param packageCouponMasterMngVO - 등록할 정보가 담긴 PackageCouponMasterMngVO
     * @return 등록된 목록수
     */
    public int insertPackageCouponMasterMng(PackageCouponMasterMngVO packageCouponMasterMngVO) throws Exception;

    /**
     * 패키지 정보를 수정한다.
     * @param packageCouponMasterMngVO - 수정할 정보가 담긴 PackageCouponMasterMngVO
     * @return 수정된 목록수
     */
    public int updatePackageCouponMasterMng(PackageCouponMasterMngVO packageCouponMasterMngVO) throws Exception;

    /**
     * 패키지 정보를 삭제한다.
     * @param packageCouponMasterMngVO - 삭제할 정보가 담긴 PackageCouponMasterMngVO
     * @return 삭제된 목록수
     */
    public int deletePackageCouponMasterMng(PackageCouponMasterMngVO packageCouponMasterMngVO) throws Exception;
}
