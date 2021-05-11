package chn.bhmc.dms.crm.cif.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInPackageInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustCouponInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustPackageInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPackageInfoVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO;
import chn.bhmc.dms.crm.cif.vo.PackageCustInfoVO;
import chn.bhmc.dms.crm.cif.vo.PackageVinInfoVO;
import chn.bhmc.dms.crm.cif.vo.VinCouponInfoVO;
//import chn.bhmc.dms.crm.cif.vo.CustomerRelInfoVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerCouponMgmtService
 * @Description : 고객쿠폰관리서비스
 * @author Kyo Jin Lee
 * @since 2016. 5. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 30.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public interface CustomerCouponMgmtService {

    /**
     * 쿠폰 서비스 시작
     */

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustCouponInfoByConditionCnt(CustCouponInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustCouponInfoVO> selectCustCouponInfoByCondition(CustCouponInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustCouponInfoVO selectCustCouponInfoByConditionByKey(CustCouponInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCustCoupon(CustCouponInfoVO custCouponInfoVO) throws Exception;


    /**
     * 패키지 서비스 시작
     */

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustCouponPackageInfoByConditionCnt(CustPackageInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustPackageInfoVO> selectCustCouponPackageInfoByCondition(CustPackageInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustPackageInfoVO selectCustCouponPackageInfoByConditionByKey(CustPackageInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCustPackage(CustPackageInfoVO custPackageInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCustPackage(CustPackageInfoVO custPackageInfoVO) throws Exception;


    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCustPackage(CustPackageInfoVO custPackageInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param obj
     * @throws Exception
     */
    public void multiCustPackage(BaseSaveVO<CustPackageInfoVO> obj) throws Exception;

    /**
     * 쿠폰 in 패키지 서비스 시작
     */

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCouponInPackageInfoByConditionCnt(CustCouponInPackageInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustCouponInPackageInfoVO> selectCouponInPackageInfoByCondition(CustCouponInPackageInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustCouponInPackageInfoVO selectCouponInPackageInfoByConditionByKey(CustCouponInPackageInfoSearchVO searchVO) throws Exception;


    /**
     * Statements
     *
     * @param obj
     * @throws Exception
     */
    public void multiCouponInPackage(BaseSaveVO<CustCouponInPackageInfoVO> obj) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCouponInPackage(CustCouponInPackageInfoVO custCouponInPackageInfoVO) throws Exception;


    /**
     * 발행 서비스 시작
     */

    /**
     * 발행번호를 발행한다.
     *
     * @param null
     * @return 발행번호 딜러번호(4),할인사용구분(2),할인방식(2),날짜(8),시리얼(7) = 23자리
     */
    public String selectNextPubliNo(CustPublishInfoVO custPublishInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCustCouponPublishInfoByConditionCnt(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CustPublishInfoVO> selectCustCouponPublishInfoByCondition(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public CustPublishInfoVO selectCustCouponPublishInfoByConditionByKey(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int insertCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int updateCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception;

    /**
     * @param dbMessageSourceSaveVO
     */
    public void multiCustCouponPublish(BaseSaveVO<CustPublishInfoVO> custPublishInfoVO) throws Exception;


    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int deleteCustCouponPublish(CustPublishInfoVO custPublishInfoVO) throws Exception;

    /**
     * Statements
     *
     * @param list
     * @return
     * @throws Exception
     */
    public List<CustCouponInfoVO> selectCouponCustomerInfoChkByExcelImp(List<CustCouponInfoVO> list) throws Exception;

    /**
     * Statements
     *
     * @param list
     * @return
     * @throws Exception
     */
    public List<VinCouponInfoVO> selectCouponVinInfoChkByExcelImp(List<VinCouponInfoVO> list)throws Exception;



    public List<PackageCustInfoVO> selectPackageCustomerInfoChkByExcelImp(List<PackageCustInfoVO> list)throws Exception;

    public List<PackageVinInfoVO> selectPackageVinInfoChkByExcelImp(List<PackageVinInfoVO> list)throws Exception;

    /**
     * Statements
     * 멤버십 기준에 따른 조회 (건수)
     * @param searchVO
     * @return
     */
    public int selectCouponCustConfigByConditionCnt(CustPublishInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     * 멤버십 기준에 따른 조회 (목록)
     * @param searchVO
     * @return
     */
    public List<CustPublishInfoVO> selectCouponCustConfigByCondition(CustPublishInfoSearchVO searchVO) throws Exception;

}
