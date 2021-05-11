package chn.bhmc.dms.sal.svo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.PackageWorkService;
import chn.bhmc.dms.sal.svo.service.dao.PackageWorkDAO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkEvlVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSaveVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkSearchVO;
import chn.bhmc.dms.sal.svo.vo.PackageSalesWorkVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PackageWorkServiceImpl
 * @Description : 집단판매업무신청
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.16          최초 생성
 * </pre>
 */

@Service("packageWorkService")
public class PackageWorkServiceImpl extends HService implements PackageWorkService {

    /**
     * 구원차/대부차신청 DAO 선언
     */
    @Resource(name="packageWorkDAO")
    PackageWorkDAO packageWorkDAO;


    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageSalesWorkVO> selectPackageSalesWorksByCondition(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorksByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return
     */
    @Override
    public int selectPackageSalesWorksByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorksByConditionCnt(searchVO);
    }


    /**
     * 집단판매업무 신청 팝업 내역 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageSalesWorkVO> selectPackageSalesWorkPopupContainsByCondition(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkPopupContainsByCondition(searchVO);
    }

    /**
     * 집단판매업무 신청 팝업 상세 내역 조회한다.
     */
    public PackageSalesWorkVO selectPackageSalesWorkPopupContainsByKey(PackageSalesWorkSearchVO searchVO) throws Exception{

        return packageWorkDAO.selectPackageSalesWorkPopupContainsByKey(searchVO);
    }

    /**
     * 집단판매업무 신청 팝업 내역 총 갯수조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return
     */
    @Override
    public int selectPackageSalesWorkPopupContainsByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkPopupContainsByConditionCnt(searchVO);
    }


    /**
     * 집단판매업무 신청 팝업 - 심사내역 내역 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageSalesWorkEvlVO> selectPackageSalesWorkPopupEvlsByCondition(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkPopupEvlsByCondition(searchVO);
    }

    /**
     * 집단판매업무 신청 팝업 - 심사내역 총 갯수조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return
     */
    @Override
    public int selectPackageSalesWorkPopupEvlsByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkPopupEvlsByConditionCnt(searchVO);
    }


    /**
     * 집단판매업무 신청 팝업 - 차량내역 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageSalesWorkEvlVO> selectPackageSalesWorkPopupVehicleByCondition(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkPopupVehicleByCondition(searchVO);
    }

    /**
     * 집단판매업무 신청 팝업 - 차량내역 총 갯수조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return
     */
    @Override
    public int selectPackageSalesWorkPopupVehicleByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkPopupVehicleByConditionCnt(searchVO);
    }



    /**
     * 집단판매업무 신청 팝업 저장
     */
    @Override
    public int multiPackageSalesWorkPopups (PackageSalesWorkSaveVO saveVO) throws Exception{

        PackageSalesWorkVO vo = saveVO.getPackageSaleWorkVO();
        String usrId = LoginUtil.getUserId();
        vo.setUpdtUsrId(usrId);
        vo.setRegUsrId(usrId);
        if(saveVO.getPackageSaleWorkVO().getSubmitGubun().equals("save")){
        	vo.setApproveCd("A");
        	if(saveVO.getPackageSaleWorkVO().getReqSeq() > 0 ){
                packageWorkDAO.updatePackageSalesWorkPopups(vo);
            }else{
                packageWorkDAO.insertPackageSalesWorkPopups(vo);
            }


        	for(PackageSalesWorkVO packageSalesWorkVO : saveVO.getVehicleVO().getInsertList()){
        		packageSalesWorkVO.setRegUsrId(usrId);
        		packageSalesWorkVO.setReqSeq(saveVO.getPackageSaleWorkVO().getReqSeq());
                insertPackageSalesWorkVehicle(packageSalesWorkVO);

            }

            for(PackageSalesWorkVO packageSalesWorkVO : saveVO.getVehicleVO().getUpdateList()){
                vo.setUpdtUsrId(usrId);
                updatePackageSalesWorkVehicle(packageSalesWorkVO);

            }

            for(PackageSalesWorkVO packageSalesWorkVO : saveVO.getVehicleVO().getDeleteList()){
                deletePackageSalesWorkVehicle(packageSalesWorkVO);

            }
        }else if(saveVO.getPackageSaleWorkVO().getSubmitGubun().equals("confirm")){
        	vo.setApproveCd("B");
        	if(saveVO.getPackageSaleWorkVO().getReqSeq() > 0 ){
                packageWorkDAO.updatePackageSalesWorkPopups(vo);
            }else{
                packageWorkDAO.insertPackageSalesWorkPopups(vo);
            }

        	packageWorkDAO.procBigClientDcReq(vo);              //집단판매업무신청(대고객할인적용요청)정보수신


        	for(PackageSalesWorkVO packageSalesWorkVO : saveVO.getVehicleVO().getInsertList()){
        		packageSalesWorkVO.setRegUsrId(usrId);
        		packageSalesWorkVO.setReqSeq(saveVO.getPackageSaleWorkVO().getReqSeq());
                insertPackageSalesWorkVehicle(packageSalesWorkVO);

                //인터페이스 테이블 저장
                packageWorkDAO.procBigClientDcReq(vo);
            }

            for(PackageSalesWorkVO packageSalesWorkVO : saveVO.getVehicleVO().getUpdateList()){
                vo.setUpdtUsrId(usrId);
                updatePackageSalesWorkVehicle(packageSalesWorkVO);

                //인터페이스 테이블 저장
                packageWorkDAO.procBigClientDcReq(packageSalesWorkVO);
            }

            for(PackageSalesWorkVO packageSalesWorkVO : saveVO.getVehicleVO().getDeleteList()){
                deletePackageSalesWorkVehicle(packageSalesWorkVO);

                //인터페이스 테이블 저장
                packageWorkDAO.procBigClientDcReq(packageSalesWorkVO);
            }
        }

        return saveVO.getPackageSaleWorkVO().getReqSeq();
    }

    /**
     * 집단판매업무 신청 삭제
     */
    @Override
    public int deletePackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        packageWorkDAO.deletePackageSalesWorkPopups(saveVO);
        packageWorkDAO.deletePackageSalesWorkPopupsVeh(saveVO);

        return 1;
    }

    /**
     * 집단판매업무 신청 확정
     */
    @Override
    public int confirmPackageSalesWorkPopups (PackageSalesWorkVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        packageWorkDAO.confirmPackageSalesWorkPopups(saveVO);

        packageWorkDAO.procBigClientDcReq(saveVO);              //집단판매업무신청(대고객할인적용요청)정보수신

        return 1;
    }


    /**
     * 조회 조건에 해당하는 집단판매심사 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageSalesWorkVO> selectPackageSalesWorkJudgesByCondition(PackageSalesWorkSearchVO searchVO) throws Exception{


        searchVO.setsApporveDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApporveUsrId(LoginUtil.getUserId());

        return packageWorkDAO.selectPackageSalesWorkJudgesByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 집단판매심사 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return
     */
    @Override
    public int selectPackageSalesWorkJudgesByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception{

        searchVO.setsApporveDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApporveUsrId(LoginUtil.getUserId());
        return packageWorkDAO.selectPackageSalesWorkJudgesByConditionCnt(searchVO);
    }


    /**
     * 집단판매업무 심사 팝업 내역 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageSalesWorkVO> selectPackageSalesWorkJudgePopupContainsByCondition(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkJudgePopupContainsByCondition(searchVO);
    }

    /**
     * 집단판매업무 심사 팝업 내역 총 갯수조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return
     */
    @Override
    public int selectPackageSalesWorkJudgePopupContainsByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkJudgePopupContainsByConditionCnt(searchVO);
    }

    /**
     * 집단판매업무 심사 확정한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkVO
     * @return
     */
    @Override
    public int confirmPackageSalesWorkJudgePopups (PackageSalesWorkVO confirmVO) throws Exception{
        confirmVO.setRegUsrId(LoginUtil.getUserId());
        confirmVO.setUpdtUsrId(LoginUtil.getUserId());
        confirmVO.setPevalId(LoginUtil.getUserId());

        // SA_0410T : 심사확정
        packageWorkDAO.insertPackageSalesWorkJudge(confirmVO);

 /*       if( "Y".equals(confirmVO.getEvalRsltYn()) ){   // 승인
            confirmVO.setApproveCd("C");
        }else{      //불승인
            confirmVO.setApproveCd("D");
        }*/

        // SA_0411T : 상태변경.
        packageWorkDAO.updatePackageSalesWorkJudgeHeader(confirmVO);

        //프로시저 추가[집단판업무 결과 송신]
        packageWorkDAO.procPackageReq(confirmVO);
        return 1;
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int insertPackageSalesWorkVehicle(PackageSalesWorkVO vo) throws Exception {

        PackageSalesWorkVO obj = selectVehicleByKey(vo);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return packageWorkDAO.insertPackageSalesWorkVehicle(vo);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public PackageSalesWorkVO selectVehicleByKey(PackageSalesWorkVO vo) throws Exception {
        return packageWorkDAO.selectVehicleByKey(vo);
    }



    /**
     * {@inheritDoc}
     */
    @Override
    public int updatePackageSalesWorkVehicle(PackageSalesWorkVO vo) throws Exception {
        return packageWorkDAO.updatePackageSalesWorkVehicle(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int deletePackageSalesWorkVehicle(PackageSalesWorkVO vo) throws Exception {
        return packageWorkDAO.deletePackageSalesWorkVehicle(vo);
    }

}
