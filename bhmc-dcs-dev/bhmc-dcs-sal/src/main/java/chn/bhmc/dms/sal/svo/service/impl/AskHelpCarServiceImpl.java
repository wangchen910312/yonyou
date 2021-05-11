package chn.bhmc.dms.sal.svo.service.impl;

import java.util.Date;
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
import chn.bhmc.dms.sal.svo.service.dao.AskHelpCarDAO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarJudgeSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupCarVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupEvlVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSearchVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AskHelpCarServiceImpl
 * @Description : 구원차/대부차신청
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.02.23          최초 생성
 * </pre>
 */

@Service("askHelpCarService")
public class AskHelpCarServiceImpl extends HService implements AskHelpCarService, JxlsSupport {

    /**
     * 구원차/대부차신청 DAO 선언
     */
    @Resource(name="askHelpCarDAO")
    AskHelpCarDAO askHelpCarDAO;


    // id Gen 서비스
    @Resource(name="salHelpCarNoIdGenService")
    EgovIdGnrService salHelpCarNoIdGenService;

    @Resource(name="askHelpCarService")
    private AskHelpCarService askHelpCarService;

    // EAI 호출
    @Resource(name="salesCommonCamelService")
    SalesCommonCamelService salesCommonCamelService;


    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<AskHelpCarVO> selectAskHelpCarsByCondition(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectAskHelpCarsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 구원차/대부차 세부정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectAskHelpCarPopupContainsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupContainsByConditionCnt(searchVO);
    }
    @Override
    public List<AskHelpCarVO> selectAskHelpCarPopupContainsByCondition(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupContainsByCondition(searchVO);
    }


    /**
     * 구원차/대부차신청 팝업 차량유형설명 정보 조회
     */
    @Override
    public int selectAskHelpCarPopupContsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupContsByConditionCnt(searchVO);
    }
    @Override
    public List<AskHelpCarPopupCarVO> selectAskHelpCarPopupContsByCondition(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupContsByCondition(searchVO);
    }

    /**
     * 구원차/대부차량신청 팝업 차량내역 조회
     */
    @Override
    public int selectAskHelpCarPopupCarsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupCarsByConditionCnt(searchVO);
    }
    @Override
    public List<AskHelpCarPopupCarVO> selectAskHelpCarPopupCarsByCondition(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupCarsByCondition(searchVO);
    }


    /**
     * 구원차/대부차량신청 팝업 심사내역 조회
     */
    @Override
    public int selectAskHelpCarPopupEvlsByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupEvlsByConditionCnt(searchVO);
    }
    @Override
    public List<AskHelpCarPopupEvlVO> selectAskHelpCarPopupEvlsByCondition(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarPopupEvlsByCondition(searchVO);
    }


    /**
     * 구원차/대부차량 신청팝업 저장
     */
    @Override
    public int multiAskHelpCarPopups(AskHelpCarSaveVO saveVO) throws Exception{

        AskHelpCarVO contVO = saveVO.getAskHelpCarVO();
        int reqNo = 0;

        if(!(contVO.getReqNo() > 0)){
            // id gen 키생성
            reqNo = salHelpCarNoIdGenService.getNextIntegerId() ;
        }else{
            reqNo = contVO.getReqNo();
        }

        // SA_0422T 특수차판매신청 detail
        for(AskHelpCarPopupCarVO insertVO : saveVO.getInsertHelpCarList()){
            insertVO.setDlrCd( LoginUtil.getDlrCd() );
            insertVO.setRegUsrId( LoginUtil.getUserId() );
            insertVO.setUpdtUsrId( LoginUtil.getUserId() );
            insertVO.setReqNo(reqNo);

            askHelpCarDAO.insertAskHelpCarPopupCars(insertVO);

            //프로시저 추가[구원차/대부차주문신청정보수신1]
            askHelpCarDAO.procSpCarReq1(insertVO);
        }

        for(AskHelpCarPopupCarVO updateVO : saveVO.getUpdateHelpCarList()){
            updateVO.setUpdtUsrId( LoginUtil.getUserId() );
            askHelpCarDAO.updateAskHelpCarPopupCars(updateVO);

            //프로시저 추가[구원차/대부차주문신청정보수신1]
            askHelpCarDAO.procSpCarReq1(updateVO);
        }

        for(AskHelpCarPopupCarVO deleteVO : saveVO.getDeleteHelpCarList()){
            askHelpCarDAO.deleteAskHelpCarPopupCars(deleteVO);

            //프로시저 추가[구원차/대부차주문신청정보수신1]
            askHelpCarDAO.procSpCarReq1(deleteVO);
        }

        // SA_0424T 특수차 header
        // 수정
        if(contVO.getReqNo() > 0){
            contVO.setRegUsrId( LoginUtil.getUserId() );
            askHelpCarDAO.updateAskHelpCars(contVO);

        }else{
            contVO.setDlrCd( LoginUtil.getDlrCd() );
            contVO.setRegUsrId( LoginUtil.getUserId() );
            contVO.setUpdtUsrId( LoginUtil.getUserId() );
            contVO.setReqNo(reqNo);

            askHelpCarDAO.insertAskHelpCars(contVO);

        }
        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(contVO);

        return reqNo;
    }

    /**
     * 구원차/대부차신청팝업 삭제
     */
    @Override
    public int deleteAskHelpCars(AskHelpCarSearchVO deleteVO) throws Exception{
        askHelpCarDAO.deleteAskHelpCars(deleteVO);
        return 0;
    }

    /**
     * 구원차/대부차 신청팝업 확정
     */
    @Override
    public int confirmAskHelpCars(AskHelpCarSearchVO deleteVO) throws Exception{
        askHelpCarDAO.confirmAskHelpCars(deleteVO);

        AskHelpCarVO contVO = new AskHelpCarVO();
        contVO.setDlrCd(deleteVO.getsDlrCd());
        contVO.setUsrId(deleteVO.getsUsrId());
        contVO.setReqNo(deleteVO.getsReqNo());

        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(contVO);

        return 0;
    }

    /**
     * 구원차/대부차신청 차량등록 관련 서류 갱신
     */
    @Override
    public void updateCarRegDoc(AskHelpCarVO updateVO) throws Exception{
        askHelpCarDAO.updateCarRegDoc(updateVO);

        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(updateVO);
    }

    /**
     * 구원차/대부차신청 갱신심사 서류 갱신
     */
    @Override
    public void updateCarRcpDoc(AskHelpCarVO updateVO) throws Exception{
        askHelpCarDAO.updateCarRcpDoc(updateVO);

        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(updateVO);
    }

    /**
     * 구원차/대부차신청 인수차량 이미지 갱신
     */
    @Override
    public void updateCarImgDoc(AskHelpCarVO updateVO) throws Exception{
        askHelpCarDAO.updateCarImgDoc(updateVO);

        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(updateVO);
    }

    /**
     * 구원차/대부차 심사의 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<AskHelpCarVO> selectAskHelpCarJudgesByCondition(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarJudgesByCondition(searchVO);
    }

    /**
     * 구원차/대부차 심사의 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectAskHelpCarJudgesByConditionCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarJudgesByConditionCnt(searchVO);
    }

    /**
     * 구원차/대부차 심사 팝업(1) 차량유형 - 정책입력
     */
    @Override
    public int confirmPolicyInputPopup(AskHelpCarPopupCarVO saveVO) throws Exception{
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );

        AskHelpCarSearchVO searchVO = new AskHelpCarSearchVO();
        searchVO.setsTpCd( saveVO.getTpCd() );

        askHelpCarDAO.insertCarPopupContHists(saveVO);

	    //최신 정책 삭제 후 등록
        askHelpCarDAO.deleteConfirmPolicyPopup(saveVO);
        askHelpCarDAO.confirmPolicyInputPopupInsert(saveVO);

		/*
        if(askHelpCarDAO.selectAskHelpCarPopupContsByConditionCnt(searchVO) > 0){
            askHelpCarDAO.confirmPolicyInputPopupUpdate(saveVO);
        }else{
            askHelpCarDAO.confirmPolicyInputPopupInsert(saveVO);
        }
		*/

        //DMS인터페이스용프로시저
        return askHelpCarDAO.procCarPopupContHists(saveVO);
    }

    /**
     * 구원차/대부차 심사 팝업(2) 심사정보 조회
     */
    @Override
    public int selectAskHelpCarJudgePopupContainCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarJudgePopupContainCnt(searchVO);
    }
    @Override
    public List<AskHelpCarVO> selectAskHelpCarJudgePopupContain(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectAskHelpCarJudgePopupContain(searchVO);
    }

    /**
     * 구원차/대부차 심사 확정 처리
     */
    @Override
    public synchronized int confirmAskHelpCarJudge(AskHelpCarJudgeSaveVO saveVO) throws Exception {
        saveVO.setRegUsrId( LoginUtil.getUserId() );
        saveVO.setUpdtUsrId( LoginUtil.getUserId() );

        // SA_0423T : 특수차 심사정보
        askHelpCarDAO.insertAskHelpCarJudgeDetail(saveVO);

        AskHelpCarSearchVO searchVO = new AskHelpCarSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsUserId(LoginUtil.getUserId());
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsUsrId(saveVO.getUsrId());
        searchVO.setsReqNo(saveVO.getReqNo());
        List<AskHelpCarVO> searchList = selectAskHelpCarJudgesByCondition(searchVO);

        if(searchList != null && searchList.size() > 0){
            AskHelpCarVO askVO = searchList.get(0);

            String maxEval = "";

            if(StringUtils.isEmpty(askVO.getMaxEval())){
                maxEval = "0";
            }else{
                maxEval = askVO.getMaxEval();
            }

            if( askVO.getSpcOrdSeq() == Integer.parseInt(maxEval)){
                LastconfirmAskHelpCarJudge(saveVO);
            }else{

                if( !"Y".equals(saveVO.getEvalRsltYn()) ){
                    saveVO.setApproveCd("D");
                    askHelpCarDAO.updateAskHelpCarJudgeHeader(saveVO);
                }
            }
        }

        //프로시저 추가[특수차심사결과정보송신]
        askHelpCarDAO.procAskHelpCarJudge(saveVO);

        return 1;
    }


    /**
     * 최종 차수 심사
     */
    private int LastconfirmAskHelpCarJudge(AskHelpCarJudgeSaveVO saveVO) throws Exception{
        if( "Y".equals(saveVO.getEvalRsltYn()) ){   // 승인
            saveVO.setApproveCd("C");

            AskHelpCarSearchVO searchVO = new AskHelpCarSearchVO();
            searchVO.setsDlrCd(saveVO.getDlrCd());  // 딜러코드
            searchVO.setsUsrId(saveVO.getUsrId());  // 유저코드
            searchVO.setsReqNo(saveVO.getReqNo());
            searchVO.setsTpCd(saveVO.getTpCd());    // 차량유형
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
                         weekVO.setTpCd(saveVO.getTpCd());
                         weekVO.setReqNo(saveVO.getReqNo());

                         String ORD_NO = askHelpCarService.selectOrdNo(weekVO);
                         int ordNo = Integer.parseInt(ORD_NO);
                         weekVO.setOrdNo(ORD_NO);

                         //인터페이스 전송 메세지
                         int cnt = 0;

                         // 특수차 딜러 오더 생성
                         for (AskHelpCarPopupCarVO carVO : helpCarList) {
                             carVO.setTpCd( saveVO.getTpCd() );
                             carVO.setOrdYyMmDt( weekVO.getOrdYyMmDt() );
                             carVO.setOrdPrid( weekVO.getOrdPrid() );
                             carVO.setOrdNo( ORD_NO );
                             carVO.setRegUsrId( LoginUtil.getUserId() );
                             carVO.setUpdtUsrId( LoginUtil.getUserId() );
                             cnt++;
                             ordNo++;

                             // SA_0417T : 특수차 심사 후 딜러오더 생성
                             askHelpCarService.insertHelpCarDrlOrd(carVO);

                             // ERP 호출
                             salesCommonCamelService.executeWebSeviceEaiCall("ERP", "SAL059", "SAL" , buildMessage(carVO, cnt), "Y");

                             //SA_0417IS : 특수차 심사 후 딜러오더 생성
                             askHelpCarService.insertHelpCarDrlOrdInterface(carVO);
                         }

                         // SA_0422T : 오더번호 업데이트
                         askHelpCarService.updateAskHelpCarOrdNo(weekVO);

                     }else{
                         // msg : 주차정보가 없습니다.
                         throw processException("sal.err.weeklyInfoNotFoundMsg");
                     }
                 }else{
                     // msg : 주차정보가 없습니다.
                     throw processException("sal.err.weeklyInfoNotFoundMsg");
                 }
             }else{
                 // msg : 차량내역이 없습니다.
                 throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.carCnt", null, LocaleContextHolder.getLocale())});
             }
        }else{      // 불승인
            saveVO.setApproveCd("D");
        }

        askHelpCarDAO.updateAskHelpCarJudgeHeader(saveVO);

        return 1;
    }

    /**
     * 특수차 주차 조회(딜러오더 생성시 키로 사용)
     */
    @Override
    public AskHelpCarPopupCarVO selectWeek(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectWeek(searchVO);
    }
    @Override
    public int selectWeekCnt(AskHelpCarSearchVO searchVO) throws Exception{
        return askHelpCarDAO.selectWeekCnt(searchVO);
    }

    /**
     * 딜러오더 키 조회
     */
    @Override
    public String selectOrdNo(AskHelpCarPopupCarVO searchVO) throws Exception{
        return askHelpCarDAO.selectOrdNo(searchVO);
    }

    /**
     * 특수차 심사 후 딜러오더 생성
     */
    @Override
    public int insertHelpCarDrlOrd(AskHelpCarPopupCarVO saveVO) throws Exception{
        int i = askHelpCarDAO.insertHelpCarDrlOrd(saveVO);

        return i;
    }

    /**
     * 특수차 심사 후 딜러오더 생성 interfaceTable
     */
    @Override
    public int insertHelpCarDrlOrdInterface(AskHelpCarPopupCarVO saveVO) throws Exception{
        int i = askHelpCarDAO.insertHelpCarDrlOrdInterface(saveVO);
        return i;
    }

    /**
     * 특수차 심사확정- 승인 처리 시, 오더번호 업데이트
     */
    @Override
    public int updateAskHelpCarOrdNo(AskHelpCarPopupCarVO saveVO) throws Exception{
        return askHelpCarDAO.updateAskHelpCarOrdNo(saveVO);
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

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        AskHelpCarSearchVO searchVO = new AskHelpCarSearchVO();

        searchVO.setsUserId(LoginUtil.getUserId());
        //searchVO.setsUsrId(LoginUtil.getUserId());
        searchVO.setsLangCd(langCd);
        //searchVO.setsReqNo(saveVO.getReqNo());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if(!StringUtils.isBlank(params.get("sStartReqDt").toString())){
            String sStartReqDt = params.get("sStartReqDt").toString();
            Date startReqDt = DateUtil.convertToDate(sStartReqDt);
            searchVO.setsStartReqDt(startReqDt);
        }
        if(!StringUtils.isBlank(params.get("sEndReqDt").toString())){
            String sEndReqDt = params.get("sEndReqDt").toString();
            Date endReqDt = DateUtil.convertToDate(sEndReqDt);
            searchVO.setsEndReqDt(endReqDt);
        }

        List<AskHelpCarVO> list = askHelpCarDAO.selectAskHelpCarJudgesExcelByCondition(searchVO);

        context.putVar("items", list);
    }

}
