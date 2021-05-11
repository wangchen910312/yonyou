package chn.bhmc.dms.crm.crq.service.impl;

import java.util.*;

import javax.annotation.*;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.*;
import org.jxls.common.*;
import org.springframework.context.i18n.*;
import org.springframework.stereotype.*;

import able.com.service.*;
import able.com.util.fmt.*;
import able.com.vo.*;
import chn.bhmc.dms.cmm.ath.service.*;
import chn.bhmc.dms.cmm.ath.vo.*;
import chn.bhmc.dms.cmm.nms.service.*;
import chn.bhmc.dms.cmm.nms.service.impl.*;
import chn.bhmc.dms.cmm.nms.vo.*;
import chn.bhmc.dms.cmm.sci.vo.*;
import chn.bhmc.dms.core.*;
import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.crm.cif.service.*;
import chn.bhmc.dms.crm.cif.vo.*;
import chn.bhmc.dms.crm.crq.service.*;
import chn.bhmc.dms.crm.crq.service.dao.*;
import chn.bhmc.dms.crm.crq.vo.*;

import com.ibm.icu.util.Calendar;

import egovframework.rte.fdl.cmmn.exception.*;
import egovframework.rte.fdl.idgnr.*;

/**
 * VOC 관리 서비스 구현 클래스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 *
 * 20160926 : VOC 작업 반영 -> sieble 과 동일하게 개발
 * 20161102 : 제조사처리배정 팝업 추가
 * 20170201 : 딜러 입력인경우 접수 완료(03) 상태 삭제후 바로 배정으로 처리 (1103 : 19, 20 참고) / 딜러 처리인 선택시 처리인의 부서 자동선택(1103 : 18 참고) / 등록시 바로 처리대기 상태로
 * 20170210 : VOC 관리 수정 - 1103 : 13, 18- 처리부문 자동 설정 추가
 * 20170210 : 처리 결과 등.. 처리할때 text append service 처리 에서 jsp 처리로 변경.
 * 20170317 : 딜러는 알람 삭제, 제조사는 IF 배치돌때만 알람, 대상자를 정책에서 등록한 사람으로 지정
 * 20170319 : 고객번호가 없을경우 고객명/전화번호로 회원자동가입 / 20170227 VOC에서 연계인 등록 삭제
 * 20170606 : [제] 클레임 > 고객내방대기방안 > 검토중인방안 에도 입력
 * 20170606 : [제] 문/평/요 저장시 활동에 입력하도록 수정 ( 기존 appen jsp에서 하던걸 service 에서 하도록 로 다시 원복)
 * 20170922 : VOC 처리 결과 입력시 VOC 활동 - [활동결과,활동내용]에 입력 -> [활동결과] 로 수정
 * </pre>
 */

@Service("vocMgmtService")
public class VocMgmtServiceImpl extends HService implements VocMgmtService, JxlsSupport{

    @Resource(name="vocNoIdgenService")
    EgovIdGnrService vocNoIdgenService;

    /**
     * VOC 관리 DAO
     */
    @Resource(name="vocMgmtDAO")
    VocMgmtDAO vocMgmtDAO;

    /**
     * notificationMessageService
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    /**
     * VOC I/F 서비스
     */
    @Resource(name="vocInterFaceService")
    VocInterFaceService vocInterFaceService;

    /**
     * 고객 정보관리 Service
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name = "userService")
    UserService userService;

    /**
     * VOC 등록
     */
    @Override
    public String insertVocMgmt(VocMgmtVO vocMgmtVO) throws Exception {

        if(StringUtil.isEmpty(vocMgmtVO.getBhmcYn())){
            vocMgmtVO.setBhmcYn("N");           //BHMC여부
        }
        if(StringUtil.isEmpty(vocMgmtVO.getParOrdYn())){
            vocMgmtVO.setParOrdYn("N");     //부품 오더 여부
        }
        if(StringUtil.isEmpty(vocMgmtVO.getCmplReAcptYn())){
            vocMgmtVO.setCmplReAcptYn("N");     //불만 재 접수 여부
        }

        String regId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        //VOC번호 생성
        vocMgmtVO.setVocNo(selectNextVocNo());
        vocMgmtVO.setRegUsrId(regId);
        vocMgmtVO.setDlrCd(dlrCd);

        // 20170201 수정 - 등록시 바로 처리대기 상태로
        if ( "03".equals(vocMgmtVO.getVocStatCd()) ) {

            if ( !StringUtil.isEmpty(vocMgmtVO.getPprocId()) || !StringUtil.isEmpty(vocMgmtVO.getRealPprocId()) ) {
                // 심사배정 상태로 변경할경우 처리인, 심사인, 심사배정일자 입력
                vocMgmtVO.setPevalId(regId);
            }
        };

        // 고객번호가 업는경우 고객등록. ( 20170319 추가 )
        if (StringUtils.isEmpty(vocMgmtVO.getCustNo()) ) {

            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
            customerInfoVO.setDlrCd(dlrCd);//*
            customerInfoVO.setCustNm(vocMgmtVO.getCustNm());//*
            customerInfoVO.setCustTp("01");   // 01 개인//*
            customerInfoVO.setCustCd("01");   // 01 잠재고객//*
            customerInfoVO.setHpNo(vocMgmtVO.getReceiveTelNo());//*
            customerInfoVO.setPrefCommMthCd("01");//*
            customerInfoVO.setPrefCommNo(vocMgmtVO.getReceiveTelNo());// *
            customerInfoVO = customerInfoService.insertCustomer(customerInfoVO);

            // 고객등록후 고객번호 set
            vocMgmtVO.setCustNo(customerInfoVO.getCustNo());

        };

        int resultCnt = 0;
        resultCnt += vocMgmtDAO.insertVocMgmt(vocMgmtVO);

        // VOC I/F 에 인서트
        if ( "Y".equals(vocMgmtVO.getBhmcYn()) && StringUtils.isNotEmpty(vocMgmtVO.getBhmcVocNo()) ) {
            VocMgmtSearchVO searchVO = new VocMgmtSearchVO();
            searchVO.setsBhmcVocNo(vocMgmtVO.getBhmcVocNo());
            searchVO.setsDlrCd(vocMgmtVO.getDlrCd());
            vocMgmtIF(searchVO);
        }

        String vocNo = "";
        if ( resultCnt > 0 ) {

            vocNo = vocMgmtVO.getVocNo();
        }

        // VOC 생성
        return vocNo;
    }

    @Override
    public int updateVocMgmt(VocMgmtVO vocMgmtVO) throws Exception {

        /**
         * BHMC VOC 데이터 인경우 수정이 아니라 처리결과만 입력받아서 저장해야함. ( updateBhmcVocProce 참고 )
         */
        if( "Y".equals(vocMgmtVO.getBhmcYn()) || StringUtils.isNotEmpty(vocMgmtVO.getBhmcVocNo()) ){
            // [BHMC여부]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.bhmcyn", null, LocaleContextHolder.getLocale())});
        }

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(vocMgmtVO.getDlrCd())){vocMgmtVO.setDlrCd(LoginUtil.getDlrCd());}

        String regId = LoginUtil.getUserId();
        vocMgmtVO.setUpdtUsrId(regId);

        if("".equals(vocMgmtVO.getCmplReAcptYn())){
            vocMgmtVO.setCmplReAcptYn("N");     //불만 재 접수 여부
        }
        if("".equals(vocMgmtVO.getParOrdYn())){
            vocMgmtVO.setParOrdYn("N");     //부품 오더 여부
        }

        //유형코드가 [02 불만신고]일 경우 및 아닐 경우 값 셋팅.
        if("02".equals(vocMgmtVO.getVocTpCd())){
            //vocMgmtVO.setEmgcCallNm(null);      //긴급전화 첫 연결
            //vocMgmtVO.setCauNm(null);           //원인코드
            //vocMgmtVO.setEmgcRescStsfNm(null);  //긴급구조 만족도 코드
            //vocMgmtVO.setCustRescLocCont(null); //고객구조 위치내용

            vocMgmtVO.setVocTpSubCd(null); //VOC 하위유형
            vocMgmtVO.setDlrCmpCommYn("N"); //딜러사 연락여부
            vocMgmtVO.setRepairBookId(null); //정비예약ID
            vocMgmtVO.setSendCd(null); //자료배송상태

            vocMgmtVO.setSalesActiveSrcCd(null); //영업활동정보출처
            vocMgmtVO.setRelSalesActiveNo(null); //관계영업활동번호

        }else{

            vocMgmtVO.setCmplCauCd(null); //불만이유
            vocMgmtVO.setMthAchvHm(null); //방안달성시간
            vocMgmtVO.setTraceDt(null); //추적시간
            vocMgmtVO.setTraceRsltCont(null); //추적결과
            vocMgmtVO.setRevMthCont(null); //검토중인방안

            vocMgmtVO.setSerReqNo(null); //불만 재 접수 횟수
            vocMgmtVO.setCmplReAcptCnt(0); //불만 재 접수 횟수
            vocMgmtVO.setCmplReAcptYn("N"); //불만 재 접수 여부
            vocMgmtVO.setCmplDlDeptNm(null); //불만전달 부서
            vocMgmtVO.setCmplDlEmpId(null); //불만전달 자
            vocMgmtVO.setCmplDlEmpNm(null); //불만전달 자
            vocMgmtVO.setDstbNo(null); //물류번호

            //vocMgmtVO.setProcLmtCd(null);       //처리시한
            //vocMgmtVO.setCmplStsfNm(null);      //불만 만족도
            //vocMgmtVO.setSaleDt(null);          //판매일자
            //vocMgmtVO.setParOrdYn("N");         //부품 오더 여부
            //vocMgmtVO.setParOrdDt(null);        //오더시간
            //vocMgmtVO.setParArrvDt(null);       //도착시간
            //vocMgmtVO.setItemCd(null);          //부품번호
        }

        // 20170201 수정 - 등록시 바로 처리대기 상태로
        if ( "03".equals(vocMgmtVO.getVocStatCd()) ) {

            if ( !StringUtil.isEmpty(vocMgmtVO.getPprocId()) || !StringUtil.isEmpty(vocMgmtVO.getRealPprocId()) ) {

                // 심사배정 상태로 변경할경우 처리인, 심사인, 심사배정일자 입력
                vocMgmtVO.setPevalId(regId);
            }

        };

        int resultCnt = vocMgmtDAO.updateVocMgmt(vocMgmtVO);

        // VOC I/F 에 인서트
        if ( "Y".equals(vocMgmtVO.getBhmcYn()) && StringUtils.isNotEmpty(vocMgmtVO.getBhmcVocNo()) ) {
            VocMgmtSearchVO searchVO = new VocMgmtSearchVO();
            searchVO.setsBhmcVocNo(vocMgmtVO.getBhmcVocNo());
            searchVO.setsDlrCd(vocMgmtVO.getDlrCd());
            vocMgmtIF(searchVO);
        }

        return resultCnt;
    }

    /**
     * SUB 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<CommonCodeVO> selectVocTpSubCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        searchVO.setLangCd(LoginUtil.getLangCd());
        return vocMgmtDAO.selectVocTpSubCdListByCondition(searchVO);
    }

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<CommonCodeVO> selectSungCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        return vocMgmtDAO.selectSungCdListByCondition(searchVO);
    }

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<CommonCodeVO> selectCityCdListByCondition(VocMgmtSearchVO searchVO) throws Exception {
        return vocMgmtDAO.selectCityCdListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextVocNo() throws Exception {
        try {
            return vocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiActives(VocActiveSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String bhmcVocNo = saveVO.getVocMgmtVO().getBhmcVocNo();

        for(VocActiveVO insertVO : saveVO.getInsertList()){
            /*
             * dlrCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(insertVO.getDlrCd())){insertVO.setDlrCd(LoginUtil.getDlrCd());}

            insertVO.setBhmcVocNo(bhmcVocNo);
            insertVO.setRegUsrId(userId);
            insertActive(insertVO);

        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<VocActiveVO> selectActivesByCondition(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setLangCd(LoginUtil.getLangCd());

        return vocMgmtDAO.selectActivesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectActivesByConditionCnt(VocMgmtSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return vocMgmtDAO.selectActivesByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    public int updateActive(VocActiveVO vocActiveVO) throws Exception {

        return vocMgmtDAO.updateActive(vocActiveVO);
    }


     /*
      * VOC 상태 변경
      *
      */
     @Override
     public int updateVocStatCd(VocMgmtVO vocMgmtVO) throws Exception {

         int result = 0;
         String appenTxt;
         String regId = LoginUtil.getUserId();

         if ( "94".equals(vocMgmtVO.getVocStatCd()) ) {

             // 처리인이 비어있는 경우 로그인 사용자로 처리한다. pprocId (처리인), PprocDeptNm(처리인부서)를 셋팅한다. -- 서정훈 20180718
             if (StringUtil.isEmpty(vocMgmtVO.getPprocId())) {
                 vocMgmtVO.setPprocId(regId);
                 UserVO userData = userService.selectUserByKey(regId);
                 vocMgmtVO.setPprocDeptNm(userData.getDeptNm());
             }

             if ( !StringUtil.isEmpty(vocMgmtVO.getPprocId()) || !StringUtil.isEmpty(vocMgmtVO.getRealPprocId()) ) {
                 // 심사배정 상태로 변경할경우 처리인, 심사인, 심사배정일자 입력
                 vocMgmtVO.setPevalId(regId);
             }
             vocMgmtVO.setVocStatCd("03");

         } else if ( "05".equals(vocMgmtVO.getVocStatCd()) ) {

             //05 처리결과 procRsltContAppend procRsltCont
           String procRsltContAppend = vocMgmtVO.getProcRsltContAppend();
           String procRsltCont = vocMgmtVO.getProcRsltCont();
           if( StringUtils.isNotEmpty(procRsltContAppend) ){
               appenTxt = vocTxtAppend(procRsltCont, procRsltContAppend);
               vocMgmtVO.setProcRsltCont(appenTxt);
               int length = StringUtils.length(appenTxt);
               if(length > 1300){
            	   throw processException("global.err.chkGreateParam", new String[]{messageSource.getMessage("par.title.procRsltCont", null, LocaleContextHolder.getLocale()),"1300"});
               }
           }

             // 처리완료 설문대기 상태로 변경할경우 실처리자 아이디, 처리일자 입력
             vocMgmtVO.setRealPprocId(regId);

         } else if ( "06".equals(vocMgmtVO.getVocStatCd()) ) {

             //06 만족도 조사 결과 stsfIvstRsltContAppend stsfIvstRsltCont

           String stsfIvstRsltContAppend = vocMgmtVO.getStsfIvstRsltContAppend();
           String stsfIvstRsltCont = vocMgmtVO.getStsfIvstRsltCont();
           if( StringUtils.isNotEmpty(stsfIvstRsltContAppend) ){
               appenTxt = vocTxtAppend(stsfIvstRsltCont, stsfIvstRsltContAppend);
               vocMgmtVO.setStsfIvstRsltCont(appenTxt);
               int length = StringUtils.length(appenTxt);
               if(length > 2000){
            	   throw processException("global.err.chkGreateParam", new String[]{messageSource.getMessage("crm.lbl.stsfIvstRsltCont", null, LocaleContextHolder.getLocale()),"2000"});
               }
           }

         } else if ( "96".equals(vocMgmtVO.getVocStatCd()) ) {

             vocMgmtVO.setVocStatCd("09");   // VOC 상태가 처리상태로 반송 (96) 이면 고객F/U로 반송(09) 로 상태 변경

         } else if ( "95".equals(vocMgmtVO.getVocStatCd()) ) {

             vocMgmtVO.setVocStatCd("03");

         } else if ( "97".equals(vocMgmtVO.getVocStatCd()) ) {

           String stsfIvstRsltContAppend = vocMgmtVO.getStsfIvstRsltContAppend();
           String stsfIvstRsltCont = vocMgmtVO.getStsfIvstRsltCont();
           if( StringUtils.isNotEmpty(stsfIvstRsltContAppend) ){
               appenTxt = vocTxtAppend(stsfIvstRsltCont, stsfIvstRsltContAppend);
               vocMgmtVO.setStsfIvstRsltCont(appenTxt);
               int length = StringUtils.length(appenTxt);
               if(length > 2000){
            	   throw processException("global.err.chkGreateParam", new String[]{messageSource.getMessage("crm.lbl.stsfIvstRsltCont", null, LocaleContextHolder.getLocale()),"2000"});
               }   
           }

             vocMgmtVO.setVocStatCd("03");

         } else if ( "99".equals(vocMgmtVO.getVocStatCd()) ) {

             //99 반송원인  returnCauContAppend, returnCauCont
            String returnCauContAppend = vocMgmtVO.getReturnCauContAppend();
            String returnCauCont = vocMgmtVO.getReturnCauCont();
            if( StringUtils.isNotEmpty(returnCauContAppend) ){
                appenTxt = vocTxtAppend(returnCauCont, returnCauContAppend);
                vocMgmtVO.setStsfIvstRsltCont(appenTxt);
            }

             vocMgmtVO.setVocStatCd("01");   // VOC 상태가 반송(99) 이면 접수 (01) 로 상태 변경

         //20170606 [제]처리대기 -> 고객내방대기  ( 클레임 ) 20170606 고객내방대기 팝업 처리시 > 고객내방대기방안 - 검토중인방안에 append
         } else if ( "08".equals(vocMgmtVO.getVocStatCd()) ) {
             vocMgmtVO.setRevMthCont(vocMgmtVO.getCustVsitPlan());
         };

         vocMgmtVO.setUpdtUsrId(regId);
         result = vocMgmtDAO.updateVocStatCd(vocMgmtVO);

         // I/F에 인서트 (BHMC_VOC_NO 인경우 본테이블 -> IS 테이블로 인서트 )
         if ( "Y".equals(vocMgmtVO.getBhmcYn()) && StringUtils.isNotEmpty(vocMgmtVO.getBhmcVocNo()) ) {

             VocMgmtSearchVO searchVO = new VocMgmtSearchVO();
             searchVO.setsBhmcVocNo(vocMgmtVO.getBhmcVocNo());
             searchVO.setsDlrCd(vocMgmtVO.getDlrCd());
             vocMgmtIF(searchVO);

         };

         // 저장시 VOC 상태가 변경되면 VOC 활동에 추가 ( 제조사 VOC는 처리대기 -> 처리완료 접수대기 상태 변경일경우에만 )
         if ( !vocMgmtVO.getVocStatCd().equals(vocMgmtVO.getBfVocStatCd()) /*|| "03".equals(vocMgmtVO.getVocStatCd()) || "09".equals(vocMgmtVO.getVocStatCd()) */) {

             if ( StringUtil.isEmpty(vocMgmtVO.getVocNo()) ) {
                 // [VOC 번호]을(를) 확인하여 주세요.
                 throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.vocNo", null, LocaleContextHolder.getLocale())});
             }

             VocActiveVO vocActiveVO = new VocActiveVO();

             if ( StringUtil.isEmpty(vocMgmtVO.getVinNo()) ) {
                 vocActiveVO.setActiveTpCd("08");
                 vocActiveVO.setActiveTpSubCd("27");
                 vocActiveVO.setActiveStatCd("01");
             };

             // 02 : 접수 -> 심사대기
             if ( "02".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("13");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");

             // 99 : 반송
             } else if ( "99".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("01");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");

             // 03 : 심사대기 -> 심사배정(처리대기)  ( 제조사 데이터는 처리만 활동에 입력 )
             } else if ( "03".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("02");
                 vocActiveVO.setActiveTpSubCd("02");
                 vocActiveVO.setActiveStatCd("02");
             // 05 : 처리대기 -> 처리완료설문대기
             } else if ( "05".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("04");
                 vocActiveVO.setActiveTpSubCd("10");
                 vocActiveVO.setActiveStatCd("02");;
                 vocActiveVO.setActiveRsltCont(vocMgmtVO.getProcRsltContAppend());
             // 06 : 처리완료설문대기 -> 설문완료Close
             } else if ( "06".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("10");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");
                 vocActiveVO.setActiveRsltCont(vocMgmtVO.getStsfIvstRsltContAppend());

             // 97 : 처리완료설문대기 -> 처리대기로 반송(03)
             } else if ( "97".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("10");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");

                 vocActiveVO.setActiveRsltCont(vocMgmtVO.getStsfIvstRsltContAppend());

             // 95 : 고객내방대기 -> 고객F/U중 ( 클레임 ) -> 처리대기로 반송(03)
             } else if ( "95".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("10");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");

             // 96 : 처리완료설문대기 -> 고객F/U로 반송
             } else if ( "96".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("10");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");
                 //if ( "02".equals(vocMgmtVO.getVocTpCd()) )  {

                     //vocMgmtVO.setVocStatCd("08");   // VOC 유형이 클레임이면  / 상태가 처리상태로 반송 (96) 이면 고객내방대기 (08) 로 상태 변경

                 //} else {



                 //}

                 // TODO 설문결과 및 만족도 결과를 입력 해야 하나???

                 vocActiveVO.setActiveRsltCont(vocMgmtVO.getStsfIvstRsltContAppend());

             // 07 : 처리완료설문대기 -> 설문안하고 Close
             } else if ( "07".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveStatCd("02");

             // 08 : 처리대기 -> 고객내방대기  ( 클레임 )
             } else if ( "08".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("12");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");
                 // 고객내방대기 일경우 고객내방대기 방안을 활동에 입력한다.
                 vocActiveVO.setActiveRsltCont(vocMgmtVO.getCustVsitPlan());
             // 고객F/U
             } else if ( "09".equals(vocMgmtVO.getVocStatCd()) )  {
                 vocActiveVO.setActiveTpCd("18");
                 vocActiveVO.setActiveTpSubCd("");
                 vocActiveVO.setActiveStatCd("02");
                 // 고객 F/U 일경우 고객F/U 결과를 입력한다.
                 vocActiveVO.setActiveRsltCont(vocMgmtVO.getCustFUResult());

             }

             // VOC -> VOC ACTIVE 매핑후 입력
             vocActiveVO.setDlrCd(vocMgmtVO.getDlrCd());
             vocActiveVO.setVocNo(vocMgmtVO.getVocNo());
             vocActiveVO.setBhmcVocNo(vocMgmtVO.getBhmcVocNo());
             vocActiveVO.setRegUsrId(regId);
             vocActiveVO.setRegUsrNm(LoginUtil.getUserNm());
             vocActiveVO.setOwnerNm(LoginUtil.getUserNm());
             vocActiveVO.setCustNo(vocMgmtVO.getCustNo());
             vocActiveVO.setCustNm(vocMgmtVO.getCustNm());
             vocActiveVO.setPconCustNo(vocMgmtVO.getPconCustNo());
             vocActiveVO.setPconCustNm(vocMgmtVO.getPconCustNm());
             vocActiveVO.setVocStatCd(vocMgmtVO.getVocStatCd());
             vocActiveVO.setRegDeptNm((vocMgmtVO.getPprocDeptNm()));

             result =+ insertActive(vocActiveVO);

         }

         return result;

     }

     /**
      * 알람을 보낸다.
      */
     public void pushSignAlarms(String vocNo, String pprocId, String pprocNm) throws Exception {

         List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
         NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
         targetVO.setUsrId(pprocId);
         targetVO.setUsrNm(pprocNm);
         targetUsers.add(targetVO);
         targetVO.setMesgTmplTpList("W,P");//W:웹 / P:APP TODO - 공통 - 알람에 정책을 등록해야하나? 우선순위는?

         String sysCd = Constants.SYS_CD_DLR;
         String alrtPolicyGrpId = "CRM-03-001";
         String dlrCd = LoginUtil.getDlrCd();
         NotificationMessageContext context = new NotificationMessageContext();
         context.getVelocityContext().put("vocNo", vocNo);

         notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
     }



     /**
      * VOC 일별/월별 수량을 조회한다.
      * [일/월별 등록 수량]
      * @param VocMgmtSearchVO - sDlrCd / sDtType / sRegDt
      * @return [일/월별] 등록 수량
      */
     @Override
     public int selectVocDateTpRegCnt(VocMgmtSearchVO searchVO) throws Exception {

         /*
          * dlrCd 체크해서 기본 셋팅 시작
          */
         if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

         // 검색 날짜 타입 필수 ( D : day / M : month )
         if( !"M".equals(searchVO.getsDateTp()) && !"D".equals(searchVO.getsDateTp())){
             // {날짜 조회 타입}을(를) 확인하여 주세요.
             throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dtType", null, LocaleContextHolder.getLocale())});
         }

         /******************************************
          *** 날짜 검색 조건 시작  ( 날짜 조건이 안들어오면 당일 검색 )
          ******************************************/
         Calendar startCal = Calendar.getInstance();
         if(searchVO.getsRegDt() == null ){
             searchVO.setsRegDt(startCal.getTime());
         }
         int year;
         int month;
         int day;
         startCal.setTime(searchVO.getsRegDt());
         year = startCal.get(Calendar.YEAR);
         month = startCal.get(Calendar.MONTH);
         day = startCal.get(Calendar.DATE);

         startCal.set(year, month, day, 00, 00, 00);
         searchVO.setsRegDt(startCal.getTime());
         /******************************************
          *** 날짜 검색 조건 시작 ***********************
          ******************************************/

         return vocMgmtDAO.selectVocDateTpRegCnt(searchVO);
     }


     /**
      * VOC 목록 수량 조회
      */
     @Override
     public int selectVocMgmtsByConditionCnt(VocMgmtSearchVO searchVO) throws Exception {

         /*
          * dlrCd 체크해서 기본 셋팅 시작
          */
         if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

         return vocMgmtDAO.selectVocMgmtsByConditionCnt(searchVO);
     }

     /**
      * VOC 목록 조회
      */
     @Override
     public List<VocMgmtVO> selectVocMgmtsByCondition(VocMgmtSearchVO searchVO) throws Exception {

         /*
          * dlrCd 체크해서 기본 셋팅 시작
          */
         if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

         String langCd = LocaleContextHolder.getLocale().getLanguage();
         searchVO.setLangCd(langCd);

         return vocMgmtDAO.selectVocMgmtsByCondition(searchVO);
     }


     /**
      * VOC 상세 정보를 조회한다.
      * @param VocMgmtSearchVO - VOC_NO, DLR_CD
      * @return
      */
     @Override
     public VocMgmtVO selectVocMgmtByKey(VocMgmtSearchVO searchVO) throws Exception{

         /*
          * dlrCd 체크해서 기본 셋팅 시작
          */
         if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
         if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

         if( StringUtils.isEmpty(searchVO.getsVocNo()) ){
             // [VOC 번호]을(를) 확인하여 주세요.
             throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.vocNo", null, LocaleContextHolder.getLocale())});
         }

         return vocMgmtDAO.selectVocMgmtByKey(searchVO);
     }


     /**
      * Siebel 에서 전송된 정보만 I/F 보낸다. (0601T -> 0601IS , BhmcVocNo 있는경우)
      * 무조건 삭제후 인서트
      * @param VocMgmtSearchVO - sDlrCd, sBhmcVocNo
      * @return 등록 수량
      */
     @Override
     public int vocMgmtIF(VocMgmtSearchVO searchVO) throws Exception {

         int result = 0;

         if ( StringUtils.isEmpty(searchVO.getsDlrCd()) ) {
             // [딜러코드]을(를) 확인하여 주세요.
             throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.dlrCd", null, LocaleContextHolder.getLocale())});

         };

         if ( StringUtils.isEmpty(searchVO.getsDlrCd()) ) {
             // [BHMCVOC번호]을(를) 확인하여 주세요.
             throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.BhmcVocNo", null, LocaleContextHolder.getLocale())});

         };

         vocInterFaceService.deleteVocMgmtIF(searchVO);
         result = vocInterFaceService.insertVocMgmtIF(searchVO);

         if ( result != 1 ) {
             // DCS I/F 오류({0}: {1})
             throw processException("global.err.dcsIfErrMsg", new String[]{});
         };

         return result;

     };


     /**
      * VOC text area text append
      */
     @Override
     public String vocTxtAppend(String preTxt, String appendTxt) throws Exception {


         String resultTxt;

         if ( StringUtils.isEmpty(preTxt) ) {
             resultTxt = appendTxt;
         } else {
             resultTxt = preTxt+System.lineSeparator()+appendTxt;
         }

         return resultTxt;

     }


     /**
      * VOC 활동 입력
      *  -> 제조사 VOC && 상태가 처리대기 -> 처리완료 일때만 I/F에 입력
      */
     @Override
     public int insertActive(VocActiveVO vocActiveVO) throws Exception {

         // I/F에 인서트 (BHMC_VOC_NO 인경우 본테이블 -> IS 테이블로 인서트 )

         int result = 0;


         Calendar startCal = Calendar.getInstance();

         if( vocActiveVO.getStartDt() == null){
             vocActiveVO.setStartDt(startCal.getTime());
         }
         if( vocActiveVO.getEndDt() == null){
             vocActiveVO.setEndDt(startCal.getTime());
         }
         if( vocActiveVO.getRegDt() == null){
             vocActiveVO.setRegDt(startCal.getTime());
         }

         if ( StringUtils.isNotEmpty(vocActiveVO.getBhmcVocNo()) ) {
             vocActiveVO.setRegUsrId(vocActiveVO.getRegUsrNm());
             vocActiveVO.setOwnerId(vocActiveVO.getOwnerNm());
         }

         result = vocMgmtDAO.insertActive(vocActiveVO);

         if ( StringUtils.isNotEmpty(vocActiveVO.getBhmcVocNo()) /*&& "05".equals(vocActiveVO.getVocStatCd()) */) {
             vocInterFaceService.insertVocActiveIF(vocActiveVO);
         }

         return result;
     }


     /*
      * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
      */
     @Override
     public void initJxlsContext(Context context, HMap params) throws Exception {
    	 //2018-11-08 add byfengdequan 增加下载按钮 start
	     String sListType = (String)params.get("sListType");
	     VocMgmtSearchVO searchVO = new VocMgmtSearchVO();
    	 if(StringUtil.nullConvert(sListType).equals("RS")) {
    		 
    		 if(!StringUtils.isBlank(params.get("sDlrCd").toString())){
                 String sDlrCd = params.get("sDlrCd").toString();
                 searchVO.setsDlrCd(sDlrCd);
             }
             if(!StringUtils.isBlank(params.get("sVocNo").toString())){
                 String sVocNo = params.get("sVocNo").toString();
                 searchVO.setsVocNo(sVocNo);
             }
             if(!StringUtils.isBlank(params.get("sBhmcVocNo").toString())){
                 String sBhmcVocNo = params.get("sBhmcVocNo").toString();
                 searchVO.setsBhmcVocNo(sBhmcVocNo);
             }
             ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
             if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
             searchVO.setLangCd(LoginUtil.getLangCd());
    	        

	         List<VocActiveVO> list = vocMgmtDAO.selectActivesByConditionExport(searchVO);
	         
	         if( list.size() == 0 ){
	
	         } else {
	             context.putVar("items", list);
	         }
	   }else {
	    	 
	     //2018-11-08 add byfengdequan 增加下载按钮 end
	    	 
	         // 엑셀 export는 a href 이기 때문에 exception 메시지는 notification 이 아닌 json 새창으로 나옴 앞단에서 처리해야함.
	       
	     		
	    	 ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
	
	         if ( !"null".equals((String)params.get("sRegStartDt")) && params.get("sRegStartDt") != null  ) {
	             searchVO.setsRegStartDt(DateUtil.convertToDate((String)params.get("sRegStartDt")));
	         }
	         if ( !"null".equals((String)params.get("sRegEndDt")) && params.get("sRegEndDt") != null ) {
	             searchVO.setsRegEndDt(DateUtil.convertToDate((String)params.get("sRegEndDt")));
	         }
	         
	         if ( !"null".equals((String)params.get("sEvalAllocDtStart")) && params.get("sEvalAllocDtStart") != null  ) {
	             searchVO.setsEvalAllocDtStart(DateUtil.convertToDate((String)params.get("sEvalAllocDtStart")));
	         }
	         if ( !"null".equals((String)params.get("sEvalAllocDtEnd")) && params.get("sEvalAllocDtEnd") != null ) {
	             searchVO.setsEvalAllocDtEnd(DateUtil.convertToDate((String)params.get("sEvalAllocDtEnd")));
	         }
	
	
	         /******************************************
	          *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
	          ******************************************/
	         Calendar startStartCal = Calendar.getInstance();
	         if(searchVO.getsRegStartDt() != null || searchVO.getsRegEndDt() != null ){
	
	             int year;
	             int month;
	             int day;
	
	             if(searchVO.getsRegStartDt() == searchVO.getsRegEndDt()){
	                 // 시작일 = 종료일 동일한경우
	                 startStartCal.setTime(searchVO.getsRegStartDt());
	                 year = startStartCal.get(Calendar.YEAR);
	                 month = startStartCal.get(Calendar.MONTH);
	                 day = startStartCal.get(Calendar.DATE);
	                 startStartCal.set(year, month, day+1, 00, 00, 00);
	                 searchVO.setsRegEndDt(startStartCal.getTime());             // 종료일 설정 ( 시작일 + 1일 )   2016-06-06 00:00:00
	             }else if(searchVO.getsRegEndDt() != null){
	                 // 종료일이 있는경우
	                 Calendar startEndCal = Calendar.getInstance();
	                 startEndCal.setTime(searchVO.getsRegEndDt());
	                 year = startEndCal.get(Calendar.YEAR);
	                 month = startEndCal.get(Calendar.MONTH);
	                 day = startEndCal.get(Calendar.DATE);
	                 startEndCal.set(year, month, day+1, 00, 00, 00);
	                 searchVO.setsRegEndDt(startEndCal.getTime());               // 종료일 설정( 종료일 + 1일 )        2016-06-06 00:00:00
	             }
	         }
	         /******************************************
	          *** 날짜 검색 조건 종료 ***********************
	          ******************************************/
	
	         List<VocMgmtVO> list = selectVocMgmtsByCondition(searchVO);
	
	         if( list.size() == 0 ){
	
	             // 추출할 대상자가 존재하지 않습니다.
	             //throw processException("crm.err.targetEmptyUsr");
	
	         } else {
	
	             context.putVar("items", list);
	
	         }
	    	}

     }

     /**
      * VOC 요약정보 조회 ( 진행중인 상태의 전체 목록 / 검색조건이랑 상관없음 )
      * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
      * @return
      */
    @Override
    public VocTpCdSummeryVO selectVocTpCdSummeryCnt(VocMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return vocMgmtDAO.selectVocTpCdSummeryCnt(searchVO);
    }


}