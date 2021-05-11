package chn.bhmc.dms.sal.svo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
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

    @Autowired
    SalesCommonCamelService salesCommonCamelService;


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

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
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

        PackageSalesWorkVO packageSalesWorkVO = saveVO.getPackageSaleWorkVO();
        BaseSaveVO<PackageSalesWorkVO> packageSalesWorkListVO = saveVO.getVehicleListVO();


        String usrId = LoginUtil.getUserId();
        packageSalesWorkVO.setUpdtUsrId(usrId);
        packageSalesWorkVO.setRegUsrId(usrId);

        if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
            packageSalesWorkVO.setDlrCd(LoginUtil.getDlrCd());
        }

        if(packageSalesWorkVO.getApproveCd().equals("A")){ //저장

            //집단업무 판매신청 저장
            if(StringUtil.nullConvert(packageSalesWorkVO.getReqSalNo()).equals("")){
                packageWorkDAO.insertPackageSalesWorkPopups(packageSalesWorkVO);
            }else{
                packageWorkDAO.updatePackageSalesWorkPopups(packageSalesWorkVO);
            }
            
            deletePackageSalesWorkVehicle(packageSalesWorkVO);
            
            for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getInsertList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageSalesWorkVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setRegUsrId(usrId);
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                insertPackageSalesWorkVehicle(packageVehicleVO);

            }
            //차종 저장
            /*
             for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getInsertList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageSalesWorkVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setRegUsrId(usrId);
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                insertPackageSalesWorkVehicle(packageVehicleVO);

            }

            for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getUpdateList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageVehicleVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                packageSalesWorkVO.setUpdtUsrId(usrId);
                updatePackageSalesWorkVehicle(packageVehicleVO);

            }

            for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getDeleteList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageVehicleVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                deletePackageSalesWorkVehicle(packageVehicleVO);
            }
            */

        }else{
            //상신

          //집단업무 판매신청 저장
            if(StringUtil.nullConvert(packageSalesWorkVO.getReqSalNo()).equals("")){
                packageWorkDAO.insertPackageSalesWorkPopups(packageSalesWorkVO);
            }else{
                packageWorkDAO.updatePackageSalesWorkPopups(packageSalesWorkVO);
            }
            
            deletePackageSalesWorkVehicle(packageSalesWorkVO);
            
            for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getInsertList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageSalesWorkVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setRegUsrId(usrId);
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                insertPackageSalesWorkVehicle(packageVehicleVO);

            }

            /*
            for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getInsertList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageSalesWorkVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setRegUsrId(usrId);
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                insertPackageSalesWorkVehicle(packageVehicleVO);


            }

            for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getUpdateList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageVehicleVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                packageSalesWorkVO.setUpdtUsrId(usrId);
                updatePackageSalesWorkVehicle(packageSalesWorkVO);


            }

            for(PackageSalesWorkVO packageVehicleVO : packageSalesWorkListVO.getDeleteList()){
                if( (StringUtil.nullConvert(packageSalesWorkVO.getDlrCd()).equals(""))){
                    packageVehicleVO.setDlrCd(LoginUtil.getDlrCd());
                }
                packageVehicleVO.setReqSeq(packageSalesWorkVO.getReqSeq());
                deletePackageSalesWorkVehicle(packageVehicleVO);
            }
            
            */

            //인터페이스 테이블 저장
            packageWorkDAO.procBigClientDcReq(packageSalesWorkVO);              //집단판매업무신청(대고객할인적용요청)정보수신

            try{
                //Carmel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();
                salesCommonCamelService.executeCamelClent(message,"SAL085");
                salesCommonCamelService.executeCamelClent(message,"SAL130");
            }catch(Exception e){

                packageWorkDAO.procBigClientDcReqRollBack(packageSalesWorkVO);
                log.error(e.getMessage(),e);
                throw e;
            }

        }
        return packageSalesWorkVO.getReqSeq();
    }

    /**
     * 집단판매업무 신청 삭제
     */
    @Override
    public int deletePackageSalesWorkPopups (PackageSalesWorkVO packageSalesWorkVO) throws Exception{
        packageSalesWorkVO.setUpdtUsrId(LoginUtil.getUserId());
        packageSalesWorkVO.setDlrCd(LoginUtil.getDlrCd());

        packageWorkDAO.deletePackageSalesWorkPopups(packageSalesWorkVO);
        packageWorkDAO.deletePackageSalesWorkPopupsVeh(packageSalesWorkVO);

        return 1;
    }

    /**
     * 집단판매업무 신청 확정
     */
    @Override
    public int confirmPackageSalesWorkPopups (PackageSalesWorkVO packageSalesWorkVO) throws Exception{
        packageSalesWorkVO.setUpdtUsrId(LoginUtil.getUserId());
        packageSalesWorkVO.setDlrCd(LoginUtil.getDlrCd());
        packageWorkDAO.confirmPackageSalesWorkPopups(packageSalesWorkVO);

        packageWorkDAO.procBigClientDcReq(packageSalesWorkVO);              //집단판매업무신청(대고객할인적용요청)정보수신

        return 1;
    }


    /**
     * 조회 조건에 해당하는 집단판매심사 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return 조회 목록
     */
    @Override
    public List<PackageSalesWorkVO> selectPackageSalesWorkJudgesByCondition(PackageSalesWorkSearchVO searchVO) throws Exception{
        return packageWorkDAO.selectPackageSalesWorkJudgesByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 집단판매심사 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PackageSalesWorkSearchVO
     * @return
     */
    @Override
    public int selectPackageSalesWorkJudgesByConditionCnt(PackageSalesWorkSearchVO searchVO) throws Exception{
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

        if( "Y".equals(confirmVO.getEvalRsltYn()) ){   // 승인
            confirmVO.setApproveCd("C");
        }else{      //불승인
            confirmVO.setApproveCd("D");
        }

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
