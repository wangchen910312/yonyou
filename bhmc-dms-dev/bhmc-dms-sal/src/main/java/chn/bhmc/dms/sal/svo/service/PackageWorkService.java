package chn.bhmc.dms.sal.svo.service;

import java.util.List;

import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkEvlVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSaveVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSearchVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageWorkService.java
 * @Description : 집단판매업무 서비스
 * @author Jin Suk Kim
 * @since 2016. 3. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 16.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface PackageWorkService {

    /**
     * 집단판매업무 신청 조회
     */
    public int selectPackageSalesWorksByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;
    public List<PackageSalesWorkVO> selectPackageSalesWorksByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 신청 팝업 내용 조회
     */
    public int selectPackageSalesWorkPopupContainsByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;
    public List<PackageSalesWorkVO> selectPackageSalesWorkPopupContainsByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 신청 팝업 - 심사내역조회
     */
    public int selectPackageSalesWorkPopupEvlsByConditionCnt(PackageSalesWorkSearchVO search) throws Exception;
    public List<PackageSalesWorkEvlVO> selectPackageSalesWorkPopupEvlsByCondition(PackageSalesWorkSearchVO search) throws Exception;

    /**
     * 집단판매업무 신청 팝업 - 차량내역조회
     */
    public int selectPackageSalesWorkPopupVehicleByConditionCnt(PackageSalesWorkSearchVO search) throws Exception;
    public List<PackageSalesWorkEvlVO> selectPackageSalesWorkPopupVehicleByCondition(PackageSalesWorkSearchVO search) throws Exception;



    /**
     * 집단판매업무 신청 팝업 저장
     */
    public int multiPackageSalesWorkPopups (PackageSalesWorkSaveVO saveVO) throws Exception;

    /**
     * 집단판매업무 신청 삭제
     */
    public int deletePackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception;
    /**
     * 집단판매업무 신청 확정
     */
    public int confirmPackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception;

    /**
     * 집단판매업무 심사 조회
     */
    public int selectPackageSalesWorkJudgesByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;
    public List<PackageSalesWorkVO> selectPackageSalesWorkJudgesByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 심사 팝업 내용 조회
     */
    public int selectPackageSalesWorkJudgePopupContainsByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;
    public List<PackageSalesWorkVO> selectPackageSalesWorkJudgePopupContainsByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 심사 확정 처리
     */
    public int confirmPackageSalesWorkJudgePopups(PackageSalesWorkVO confirmVO) throws Exception;


    /**
     * 집단판매업무 신청차량내역 등록한다.
     * @param PackageSalesWorkVO - 등록할 정보가 담긴 PackageSalesWorkVO
     * @return 등록된 목록수
     */
    public int insertPackageSalesWorkVehicle(PackageSalesWorkVO vo) throws Exception;

    /**
     * 집단판매업무 신청차량내역 수정한다.
     * @param PackageSalesWorkVO - 수정할 정보가 담긴 PackageSalesWorkVO
     * @return 수정된 목록수
     */
    public int updatePackageSalesWorkVehicle(PackageSalesWorkVO vo) throws Exception;


    /**
     * Key에 해당하는  집단판매업무 신청차량내역 조회한다.
     * @param PackageSalesWorkVO -
     * @return 조회한 마감시간 정보
     */
    public PackageSalesWorkVO selectVehicleByKey(PackageSalesWorkVO vo) throws Exception;


    /**
     * 집단판매업무 신청차량내역 삭제한다.
     * @param PackageSalesWorkVO - 수정할 정보가 담긴 PackageSalesWorkVO
     * @return 수정된 목록수
     */
    public int deletePackageSalesWorkVehicle(PackageSalesWorkVO vo) throws Exception;


}
