package chn.bhmc.dms.sal.svo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.svo.service.AskHelpCarService;
import chn.bhmc.dms.sal.svo.service.TestDriveVehicleInspctService;
import chn.bhmc.dms.sal.svo.service.dao.AskHelpCarDAO;
import chn.bhmc.dms.sal.svo.service.dao.TestDriveVehicleInspctDAO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupCarVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehiclePopupCarVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleSearchVO;
import chn.bhmc.dms.sal.svo.vo.ReqTestDriveVehicleVO;
import chn.bhmc.dms.sal.svo.vo.TestDriveVehicleInspctSaveVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TestDriveVehicleInspctServiceImpl
 * @Description : 시승차량 심사
 * @author
 * @since 2016. 3. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.08        Bong               최초 생성
 * </pre>
 */

@Service("testDriveVehicleInspctService")
public class TestDriveVehicleInspctServiceImpl extends HService implements TestDriveVehicleInspctService, JxlsSupport{

    /**
     * 구원차/대부차신청 DAO 선언
     */
    @Resource(name="askHelpCarDAO")
    AskHelpCarDAO askHelpCarDAO;

    /**
     * 시승차량 심사 DAO 선언
     */
    @Resource(name="testDriveVehicleInspctDAO")
    TestDriveVehicleInspctDAO testDriveVehicleInspctDAO;


    // id Gen 서비스
    @Resource(name="salHelpCarNoIdGenService")
    EgovIdGnrService salHelpCarNoIdGenService;

    @Resource(name="askHelpCarService")
    private AskHelpCarService askHelpCarService;


    /**
     * 시승차량 심사의 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleInspctByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return testDriveVehicleInspctDAO.selectTestDriveVehicleInspctByCondition(searchVO);
    }

    /**
     * 시승차량 심사의 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectTestDriveVehicleInspctByConditionCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return testDriveVehicleInspctDAO.selectTestDriveVehicleInspctByConditionCnt(searchVO);
    }

    /**
     * 시승차량 심사의 조건에 해당하는 엑셀 목록 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleExportByCondition(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return testDriveVehicleInspctDAO.selectTestDriveVehicleExportByCondition(searchVO);
    }

    /**
     * 시승차량 심사 팝업(1) 차량유형 - 정책입력
     */
    @Override
    public int confirmPolicyInputPopup(ReqTestDriveVehiclePopupCarVO saveVO) throws Exception{
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );

        ReqTestDriveVehicleSearchVO searchVO = new ReqTestDriveVehicleSearchVO();
        searchVO.setsTpCd( saveVO.getTpCd() );

        testDriveVehicleInspctDAO.insertCarPopupContHists(saveVO);

        if(testDriveVehicleInspctDAO.selectReqTestDriveVehiclePopupContsByConditionCnt(searchVO) > 0){
            testDriveVehicleInspctDAO.confirmPolicyInputPopupUpdate(saveVO);
        }else{
            testDriveVehicleInspctDAO.confirmPolicyInputPopupInsert(saveVO);
        }

        //DMS인터페이스용프로시저
        return testDriveVehicleInspctDAO.procCarPopupContHists(saveVO);
    }

    /**
     * 시승차량 심사 팝업(2) 심사정보 조회
     */
    @Override
    public int selectTestDriveVehicleInspctPopupContainCnt(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return testDriveVehicleInspctDAO.selectTestDriveVehicleInspctPopupContainCnt(searchVO);
    }
    @Override
    public List<ReqTestDriveVehicleVO> selectTestDriveVehicleInspctPopupContain(ReqTestDriveVehicleSearchVO searchVO) throws Exception{
        return testDriveVehicleInspctDAO.selectTestDriveVehicleInspctPopupContain(searchVO);
    }

    /**
     * 시승차량 심사 확정 처리
     */
    @Override
    public int confirmTestDriveVehicleInspct(TestDriveVehicleInspctSaveVO saveVO) throws Exception {
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );

        testDriveVehicleInspctDAO.insertTestDriveVehicleInspctDetail(saveVO);

        if( "Y".equals(saveVO.getEvalRsltYn()) ){
            saveVO.setApproveCd("C");

            String strTpCd = "N7";

            AskHelpCarSearchVO searchVO = new AskHelpCarSearchVO();
            searchVO.setsDlrCd(saveVO.getDlrCd());  // 딜러코드
            searchVO.setsUsrId(saveVO.getUsrId());  // 유저코드
            searchVO.setsReqNo(saveVO.getReqNo());
            searchVO.setsTpCd(strTpCd);    // 차량유형 (시승차)
            List<AskHelpCarPopupCarVO> helpCarList = null;
            AskHelpCarPopupCarVO weekVO = null;

             // 승인된 차량내역 조회(SA_0422T)
             if( askHelpCarDAO.selectAskHelpCarPopupCarsByConditionCnt(searchVO) > 0){
                 helpCarList = askHelpCarDAO.selectAskHelpCarPopupCarsByCondition(searchVO);

                 //특수차 주차 조회 (딜러오더 KEY생성 시 사용)
                 if(askHelpCarService.selectWeekCnt(searchVO) > 0){
                     weekVO = askHelpCarService.selectWeek(searchVO);

                     if( !"".equals(weekVO.getOrdYyMmDt()) && !"".equals(weekVO.getOrdPrid()) ){
                         weekVO.setDlrCd(saveVO.getDlrCd());
                         weekVO.setUsrId(saveVO.getUsrId());
                         weekVO.setTpCd(strTpCd);
                         weekVO.setReqNo(saveVO.getReqNo());

                         String ORD_NO = askHelpCarService.selectOrdNo(weekVO);
                         weekVO.setOrdNo(ORD_NO);

                         // 특수차 딜러 오더 생성
                         for (AskHelpCarPopupCarVO carVO : helpCarList) {
                             carVO.setTpCd( strTpCd );
                             carVO.setOrdYyMmDt( weekVO.getOrdYyMmDt() );
                             carVO.setOrdPrid( weekVO.getOrdPrid() );
                             carVO.setOrdNo( ORD_NO );
                             carVO.setRegUsrId( LoginUtil.getUserId() );
                             carVO.setUpdtUsrId( LoginUtil.getUserId() );

                             // SA_0417T : 특수차 심사 후 딜러오더 생성
                             askHelpCarService.insertHelpCarDrlOrd( carVO );

                             //SA_0417T : 특수차 심사 후 딜러오더 생성
                             askHelpCarService.insertHelpCarDrlOrdInterface(carVO);
                         }

                         // SA_0422T : 오더번호 업데이트
                         askHelpCarService.updateAskHelpCarOrdNo(weekVO);

                     }else{
                         // msg : 주차정보가 없습니다.
                         throw processException("sal.err.weeklyInfoNotFound");
                     }
                 }else{
                     // msg : 주차정보가 없습니다.
                     throw processException("sal.err.weeklyInfoNotFound");
                 }
             }else{
                 // msg : 차량내역이 없습니다.
                 throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.carCnt", null, LocaleContextHolder.getLocale())});
             }
        }else{
            saveVO.setApproveCd("D");
        }

        saveVO.setLastApproveCnt(1);    // 최종 승인 차수(현재 1차 승인)
        testDriveVehicleInspctDAO.updateTestDriveVehicleInspctHeader(saveVO);

        //프로시저 추가
        testDriveVehicleInspctDAO.procTestDriveInspct(saveVO);

        return 1;
    }

    /**
     * 시승차 합격여부 저장
     */
    public int secondConfirmTestDriveVehiclePopup(TestDriveVehicleInspctSaveVO saveVO)throws Exception{
        testDriveVehicleInspctDAO.secondConfirmTestDriveVehiclePopup(saveVO);

        testDriveVehicleInspctDAO.procTestDriveInspct(saveVO);
        return 1;
    }


    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ReqTestDriveVehicleSearchVO searchVO = new ReqTestDriveVehicleSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        //List<ReqTestDriveVehicleVO> list = selectTestDriveVehicleInspctByCondition(searchVO);
        List<ReqTestDriveVehicleVO> list = selectTestDriveVehicleExportByCondition(searchVO);

        context.putVar("items", list);
    }

}
