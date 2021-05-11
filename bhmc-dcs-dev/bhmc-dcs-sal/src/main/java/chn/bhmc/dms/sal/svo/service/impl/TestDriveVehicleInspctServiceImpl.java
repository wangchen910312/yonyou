package chn.bhmc.dms.sal.svo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
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

    // EAI 호출
    @Resource(name="salesCommonCamelService")
    SalesCommonCamelService salesCommonCamelService;

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

        testDriveVehicleInspctDAO.deleteConfirmPolicy(saveVO);
        testDriveVehicleInspctDAO.confirmPolicyInputPopupInsert(saveVO);

		/*
        if(testDriveVehicleInspctDAO.selectReqTestDriveVehiclePopupContsByConditionCnt(searchVO) > 0){
            testDriveVehicleInspctDAO.confirmPolicyInputPopupUpdate(saveVO);
        }else{
            testDriveVehicleInspctDAO.confirmPolicyInputPopupInsert(saveVO);
        }
		*/

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

        ReqTestDriveVehicleSearchVO searchVO = new ReqTestDriveVehicleSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsUserId(LoginUtil.getUserId());
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsUsrId(saveVO.getUsrId());
        searchVO.setsReqNo(saveVO.getReqNo());
        List<ReqTestDriveVehicleVO> searchList = selectTestDriveVehicleInspctByCondition(searchVO);

        if(searchList != null && searchList.size() > 0){
            ReqTestDriveVehicleVO vehicleVO = searchList.get(0);

            String maxEval = "";

            if(StringUtils.isEmpty(vehicleVO.getMaxEval())){
                maxEval = "0";
            }else{
                maxEval = vehicleVO.getMaxEval();
            }

            if( vehicleVO.getSpcOrdSeq() == Integer.parseInt(maxEval)){
                LastconfirmTestDriveVehicle(saveVO);
            }else{

                if( !"Y".equals(saveVO.getEvalRsltYn()) ){
                    saveVO.setApproveCd("D");
                    testDriveVehicleInspctDAO.updateTestDriveVehicleInspctHeader(saveVO);
                }
            }
        }

        //프로시저 추가
        testDriveVehicleInspctDAO.procTestDriveInspct(saveVO);

        return 1;
    }

    /**
     * 최종 차수 심사
     */
    private int LastconfirmTestDriveVehicle(TestDriveVehicleInspctSaveVO saveVO) throws Exception{

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
                         int ordNo = Integer.parseInt(ORD_NO);
                         weekVO.setOrdNo(ORD_NO);

                         //인터페이스 전송 메세지
                         int cnt = 0;

                         // 특수차 딜러 오더 생성
                         for (AskHelpCarPopupCarVO carVO : helpCarList) {
                             carVO.setTpCd( strTpCd );
                             carVO.setOrdYyMmDt( weekVO.getOrdYyMmDt() );
                             carVO.setOrdPrid( weekVO.getOrdPrid() );
                             carVO.setOrdNo( ORD_NO );
                             carVO.setRegUsrId( LoginUtil.getUserId() );
                             carVO.setUpdtUsrId( LoginUtil.getUserId() );
                             cnt++;
                             ordNo++;

                             // SA_0417T : 특수차 심사 후 딜러오더 생성
                             askHelpCarService.insertHelpCarDrlOrd( carVO );

                             // ERP 호출
                             salesCommonCamelService.executeWebSeviceEaiCall("ERP", "SAL059", "SAL", buildMessage(carVO, cnt), "Y");

                             //SA_0417IS  : 특수차 심사 후 딜러오더 생성
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

        saveVO.setLastApproveCnt(saveVO.getSpcOrdSeq());    // 최종 승인 차수(현재 1차 승인)
        testDriveVehicleInspctDAO.updateTestDriveVehicleInspctHeader(saveVO);

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

        searchVO.setsUserId(LoginUtil.getUserId());

        if (StringUtils.isNotEmpty((String)params.get("sStartReqDt")) && !"NULL".equals(((String)params.get("sStartReqDt")).toUpperCase())) {
            searchVO.setsStartReqDt(DateUtil.convertToDate((String)params.get("sStartReqDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sEndReqDt")) && !"NULL".equals(((String)params.get("sEndReqDt")).toUpperCase())) {
            searchVO.setsEndReqDt(DateUtil.convertToDate((String)params.get("sEndReqDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sStartEvalDt")) && !"NULL".equals(((String)params.get("sStartEvalDt")).toUpperCase())) {
            searchVO.setsStartEvalDt(DateUtil.convertToDate((String)params.get("sStartEvalDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sEndEvalDt")) && !"NULL".equals(((String)params.get("sEndEvalDt")).toUpperCase())) {
            searchVO.setsEndEvalDt(DateUtil.convertToDate((String)params.get("sEndEvalDt")));
        }

        //List<ReqTestDriveVehicleVO> list = selectTestDriveVehicleInspctByCondition(searchVO);
        List<ReqTestDriveVehicleVO> list = selectTestDriveVehicleExportByCondition(searchVO);

        context.putVar("items", list);
    }

    private Map<String, Object> buildMessage(AskHelpCarPopupCarVO vo, int cnt){
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("SEQ", DateUtil.getDate("yyyyMMddHHmmss" +StringUtils.leftPad(cnt+"", 4, "0")));
        message.put("DLR_CD", vo.getDlrCd());
        message.put("ORD_TP", vo.getTpCd());
        message.put("ORD_YY_MM_DT", vo.getOrdYyMmDt());
        message.put("ORD_PRID", vo.getOrdPrid());
        message.put("ORD_NO", vo.getOrdNo());
        message.put("CARLINE_CD", vo.getCarlineCd());
        message.put("MODEL_CD", vo.getModelCd());
        message.put("OCN_CD", vo.getOcnCd());
        message.put("EXT_COLOR_CD", vo.getExtColorCd());
        message.put("INT_COLOR_CD", vo.getIntColorCd());
        message.put("ORD_QTY", "1");
        message.put("FST_CONFIRM_QTY", 0);
        message.put("SCND_CONFIRM_QTY", 0);
        message.put("SCND_PAR_ISFF_ADJ_QTY", 0);
        message.put("ORD_GRADE_CD", "");
        message.put("ORD_PROR_CD", "");

        message.put("TRSF_DLR_CD", vo.getDlrCd());
        message.put("DL_DIST_CD", "");

        message.put("ORD_STAT_CD", "1D");
        message.put("ORD_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
        message.put("PROD_ARRG_YN", "N");

        message.put("PFP_EXAM_DT", null);
        message.put("ERP_TARG_YN", "Y");
        message.put("ERP_TRSF_DT", null);
        message.put("ERP_SEND_YN", "N");
        message.put("SCND_CONFIRM_DT", null);
        message.put("FST_CONFIRM_DT", null);
        message.put("NAPPROVE_REASON_CD", null);
        message.put("SCRN_ID", null);
        message.put("APPLY_STAT_CD", null);
        message.put("SALE_RGST_ID", null);
        message.put("REMARK", null);
        message.put("OCN_CD_OLD", null);
        message.put("EX_COLOR_CD_OLD", null);
        message.put("REG_USR_ID", vo.getRegUsrId());
        message.put("REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
        message.put("UPDT_USR_ID", vo.getUpdtUsrId());
        message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));

        return message;
    }
}
