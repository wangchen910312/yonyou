package chn.bhmc.dms.sal.svo.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkEvlVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSaveVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSearchVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageWorkDAO
 * @Description : 집단판매업무 신청 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("packageWorkDAO")
public interface PackageWorkDAO {

    /**
     * 조회 조건에 해당하는 집단판매업무 신청 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    public List<PackageSalesWorkVO> selectPackageSalesWorksByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 집단판매업무 신청 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectPackageSalesWorksByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 신청 팝업 내역 총 갯수조회한다.
     */
    public int selectPackageSalesWorkPopupContainsByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 신청 팝업 내역 조회한다.
     */
    public List<PackageSalesWorkVO> selectPackageSalesWorkPopupContainsByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 신청 팝업 상세 내역 조회한다.
     */
    public PackageSalesWorkVO selectPackageSalesWorkPopupContainsByKey(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 신청 팝업 - 심사내역조회
     */
    public int selectPackageSalesWorkPopupEvlsByConditionCnt(PackageSalesWorkSearchVO search) throws Exception;
    public List<PackageSalesWorkEvlVO> selectPackageSalesWorkPopupEvlsByCondition(PackageSalesWorkSearchVO search) throws Exception;

    /**
     * 집단판매업무 신청 팝업 - 심사내역조회
     */
    public int selectPackageSalesWorkPopupVehicleByConditionCnt(PackageSalesWorkSearchVO search) throws Exception;
    public List<PackageSalesWorkEvlVO> selectPackageSalesWorkPopupVehicleByCondition(PackageSalesWorkSearchVO search) throws Exception;


    /**
     * 집단판매업무 신청 팝업 저장
     */
    public int insertPackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception;

    /**
     * 집단판매업무 신청 팝업 수정
     */
    public int updatePackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception;

    /**
     * 집단판매업무 신청 삭제
     */
    public int deletePackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception;
    /**
     * 집단판매업무 신청 확정
     */
    public int confirmPackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception;


    /**
     * 집단판매업무 신청 삭제
     */
    public int deletePackageSalesWorkPopupsVeh (PackageSalesWorkVO saveVO) throws Exception;

    /**
    *
    * 집단판매업무 신청 확정을 프로시져로 등록한다.
    * 집단판매업무신청(대고객할인적용요청)정보수신
    * @param PackageSalesWorkVO
    * @return bindingResult
    * @throws Exception
    */
    public int procBigClientDcReq(PackageSalesWorkVO saveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 집단판매업무심사 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    public List<PackageSalesWorkVO> selectPackageSalesWorkJudgesByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 집단판매업무심사 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return
     */
    public int selectPackageSalesWorkJudgesByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 심사 팝업 내역 총 갯수조회한다.
     */
    public int selectPackageSalesWorkJudgePopupContainsByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 심사 팝업 내역 조회한다.
     */
    public List<PackageSalesWorkVO> selectPackageSalesWorkJudgePopupContainsByCondition(PackageSalesWorkSearchVO searchVO) throws Exception;

    /**
     * 집단판매업무 심사 확정.
     */
    public int insertPackageSalesWorkJudge(PackageSalesWorkVO confirmVO) throws Exception;

    /**
     * 집단판매업무 심사 승인/불승인 여부 저장
     */
    public int updatePackageSalesWorkJudgeHeader(PackageSalesWorkVO confirmVO) throws Exception;

    // 집단판업무 결과 송신 프로시저
    public int procPackageReq(PackageSalesWorkVO confirmVO) throws Exception;



    /**
     * 집단판매업무신청 차량내역 등록한다.
     * @param PackageSalesWorkVO - 등록할 정보가 담긴 PackageSalesWorkVO
     * @return 등록된 목록수
     */
    public int insertPackageSalesWorkVehicle(PackageSalesWorkVO vo) throws Exception;



    /**
     * 집단판매업무신청 차량내역 주키로 검색한다.
     * @param PackageSalesWorkVO - 등록할 정보가 담긴 PackageSalesWorkVO
     * @return 검색된 목록수
     */
    public PackageSalesWorkVO selectVehicleByKey(PackageSalesWorkVO vo) throws Exception;



    /**
     * 집단판매업무신청 차량내역 수정한다.
     * @param PackageSalesWorkVO - 등록할 정보가 담긴 PackageSalesWorkVO
     * @return 수정된 목록수
     */
    public int updatePackageSalesWorkVehicle(PackageSalesWorkVO codeVO) throws Exception;


    /**
     * 집단판매업무신청 차량내역 삭제한다.
     * @param PackageSalesWorkVO - 등록할 정보가 담긴 PackageSalesWorkVO
     * @return 수정된 목록수
     */
    public int deletePackageSalesWorkVehicle(PackageSalesWorkVO codeVO) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void procBigClientDcReq(PackageSalesWorkSaveVO saveVO);


}