package chn.bhmc.dms.sal.svo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.AskHelpCarService;
import chn.bhmc.dms.sal.svo.service.dao.AskHelpCarDAO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarJudgeSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupCarVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarPopupEvlVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSaveVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarSearchVO;
import chn.bhmc.dms.sal.svo.vo.AskHelpCarVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
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
public class AskHelpCarServiceImpl extends HService implements AskHelpCarService {

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

    @Autowired
    ServiceCommonService serviceCommonService;



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
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
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

        }

        for(AskHelpCarPopupCarVO updateVO : saveVO.getUpdateHelpCarList()){
            updateVO.setUpdtUsrId( LoginUtil.getUserId() );
            askHelpCarDAO.updateAskHelpCarPopupCars(updateVO);

        }

        for(AskHelpCarPopupCarVO deleteVO : saveVO.getDeleteHelpCarList()){
            askHelpCarDAO.deleteAskHelpCarPopupCars(deleteVO);

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

        AskHelpCarPopupCarVO carVO = new AskHelpCarPopupCarVO();
        carVO.setDlrCd(contVO.getDlrCd());
        carVO.setUsrId(contVO.getUsrId());
        carVO.setReqNo(contVO.getReqNo());

        //프로시저 추가[구원차/대부차주문신청정보수신1]
        askHelpCarDAO.procSpCarReq1(carVO);
        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(contVO);

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL094"); // SA_0422_1IS
        serviceCommonService.executeCamelClent(message,"SAL095"); // SA_0424_1IS
//            serviceCommonService.executeCamelClent(message,"SAL091"); // SA_0422IS : 시승
//            serviceCommonService.executeCamelClent(message,"SAL092"); // SA_0424IS : 시승

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

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL095"); // SA_0424_1IS
        return 1;
    }

    /**
     * 구원차/대부차신청 차량등록 관련 서류 갱신
     */
    @Override
    public void updateCarRegDoc(AskHelpCarVO updateVO) throws Exception{
        askHelpCarDAO.updateCarRegDoc(updateVO);

        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(updateVO);

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL095"); // SA_0424_1IS
    }

    /**
     * 구원차/대부차신청 갱신심사 서류 갱신
     */
    @Override
    public void updateCarRcpDoc(AskHelpCarVO updateVO) throws Exception{
        askHelpCarDAO.updateCarRcpDoc(updateVO);

        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(updateVO);

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL095"); // SA_0424_1IS
    }

    /**
     * 구원차/대부차신청 인수차량 이미지 갱신
     */
    @Override
    public void updateCarImgDoc(AskHelpCarVO updateVO) throws Exception{
        askHelpCarDAO.updateCarImgDoc(updateVO);

        //프로시저 추가[구원차/대부차주문신청정보수신2]
        askHelpCarDAO.procSpCarReq2(updateVO);

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL095"); // SA_0424_1IS
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

        if(askHelpCarDAO.selectAskHelpCarPopupContsByConditionCnt(searchVO) > 0){
            askHelpCarDAO.confirmPolicyInputPopupUpdate(saveVO);
        }else{
            askHelpCarDAO.confirmPolicyInputPopupInsert(saveVO);
        }

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

        //프로시저 추가[시승차주문심사결과정보송신]
        askHelpCarDAO.procAskHelpCarJudge(saveVO);

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
                         weekVO.setOrdNo(ORD_NO);

                         // 특수차 딜러 오더 생성
                         for (AskHelpCarPopupCarVO carVO : helpCarList) {
                             carVO.setTpCd( saveVO.getTpCd() );
                             carVO.setOrdYyMmDt( weekVO.getOrdYyMmDt() );
                             carVO.setOrdPrid( weekVO.getOrdPrid() );
                             carVO.setOrdNo( ORD_NO );
                             carVO.setRegUsrId( LoginUtil.getUserId() );
                             carVO.setUpdtUsrId( LoginUtil.getUserId() );

                             // SA_0417T : 특수차 심사 후 딜러오더 생성
                             askHelpCarService.insertHelpCarDrlOrd(carVO);

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

}
