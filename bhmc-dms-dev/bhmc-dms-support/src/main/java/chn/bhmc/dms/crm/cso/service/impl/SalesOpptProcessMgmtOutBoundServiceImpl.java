package chn.bhmc.dms.crm.cso.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.RegularExpressionService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtFinishService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOpptProcessMgmtDAO;
import chn.bhmc.dms.crm.cso.service.dao.ShowRoomStatsMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtFinishVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtHistVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.cso.vo.ShowRoomMgmtSearchVO;


/**
 * 판매기회 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 * version 운영 배포쪽  :  36187
 */

@Service("salesOpptProcessMgmtOutBoundService")
public class SalesOpptProcessMgmtOutBoundServiceImpl extends HService implements SalesOpptProcessMgmtOutBoundService {

    /**
     * Common Management
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 판매기회프로세스 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtDAO")
    SalesOpptProcessMgmtDAO salesOpptProcessMgmtDAO;

    /**
     * 판매기회진행이력 관리
     */
    @Resource(name="salesOpptProcessMgmtFinishService")
    SalesOpptProcessMgmtFinishService salesOpptProcessMgmtFinishService;

    /**
     * 전시장 유동량 (건수확인용)
     */
    @Resource(name="showRoomStatsMgmtDAO")
    ShowRoomStatsMgmtDAO showRoomStatsMgmtDAO;

    /**
     * RegularExpressionService
     */
    @Resource(name="regularExpressionService")
    RegularExpressionService regularExpressionService;

    /*
     * 고객정보 관리 DAO
     */
    @Resource(name="customerInfoDAO")
    CustomerInfoDAO customerInfoDAO;

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService#updateSalesOpptProcessMgmt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     */
    @Override
    public int updateSalesOpptProcessMgmt(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {

        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getDlrCd())){salesOpptProcessMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getUpdtUsrId())) {salesOpptProcessMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}

        String regExpRlt = "";
        int rtlCnt = 0;

        String currLeadStatCd = "";     // 현재 DB에 있는 LeadStatCd
        String nextLeadStatCd = "";     // 화면또는 다른곳에서 보내는 LeadStatCd
        String currMngScId = "";        // 현재 DB에 있는 MngScId
        String nextMngScId = "";        // 화면또는 다른곳에서 보내는 MngScId
        Date currentDate = new Date();

        //핸드폰 번호 제한 걸기 11자리 안 되면 리턴
        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getHpNo())) {
            if (salesOpptProcessMgmtVO.getHpNo().length() <= 10) {
                throw processException("crm.info.hpno11DigitRequired");
            }

            regExpRlt = regularExpressionService.selectRegularExpressionByHpNo(salesOpptProcessMgmtVO.getHpNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpHpNo"); // 이동전화 번호가 규칙에 맞지 않습니다.
            }
        }

        /*
         * ==============================================
         *  정규식 체크 - 시작
         * ==============================================
         */

        // emailNm
        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getEmailNm())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByEmail(salesOpptProcessMgmtVO.getEmailNm());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpEmail"); // 이메일이 규칙에 맞지 않습니다.
            }
        }

        // telNo
        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }

        // officeTelNo
        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getOfficeTelNo())) {
            regExpRlt = regularExpressionService.selectRegularExpressionByTelNo(salesOpptProcessMgmtVO.getOfficeTelNo());
            if ("FALSE".equals(regExpRlt)){
                throw processException("crm.info.regExpTelNo"); // 전화번호가 규칙에 맞지 않습니다.
            }
        }
        // ssnCrnNo
        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getSsnCrnNo())) {
            if("01".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 15) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo15Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                    }

                } else if (salesOpptProcessMgmtVO.getSsnCrnNo().length() == 18) {
                    regExpRlt = regularExpressionService.selectRegularExpressionByRegiNo18Digit(salesOpptProcessMgmtVO.getSsnCrnNo());
                    if ("FALSE".equals(regExpRlt)){
                        throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                    }
                } else {
                    throw processException("crm.info.regExpRegiNo"); // 신분증이 규칙에 맞지 않습니다.
                }
            } else if("08".equals(salesOpptProcessMgmtVO.getMathDocTp())) {
                regExpRlt = regularExpressionService.selectRegularExpressionByCorpNo(salesOpptProcessMgmtVO.getSsnCrnNo());
                if ("FALSE".equals(regExpRlt)){
                    throw processException("crm.info.regExpRegiNo"); // 법인번호가 규칙에 맞지 않습니다.
                }
            }
        }

        if ( salesOpptProcessMgmtVO.getHoldTp() != null && "03".equals(salesOpptProcessMgmtVO.getHoldTp()) ) {
            if ( salesOpptProcessMgmtVO.getHoldDetlTpSeq() == null ) {
                // 리드출처상세는 필수 입니다.
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.approchLocationDtl", null, LocaleContextHolder.getLocale())});
            }
        }

        /*
         * ==============================================
         *  정규식 체크 - 끝
         * ==============================================
         */

        if (salesOpptProcessMgmtVO.getVsitPrsnCnt() != null) {
            if (salesOpptProcessMgmtVO.getVsitPrsnCnt() == 0){
                salesOpptProcessMgmtVO.setVsitPrsnCnt(1);
            }
        }

        // 필수체크
        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getLeadStatCd())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.step", null, LocaleContextHolder.getLocale())});
        }

        // 의향차종
//        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getIntrCarlineCd())) {
//            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.intentionCarline", null, LocaleContextHolder.getLocale())});
//        }

        // 업데이트 할 판매기회 단계
        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getLeadStatCd()) ) {
            nextLeadStatCd = salesOpptProcessMgmtVO.getLeadStatCd();
            salesOpptProcessMgmtVO.setNextLeadStatCd(nextLeadStatCd);
        }

        // 업데이트 할 책임자
        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getMngScId()) ) {
            nextMngScId = salesOpptProcessMgmtVO.getMngScId();
            salesOpptProcessMgmtVO.setNextMngScId(nextMngScId);
        }


        // 현재 DB에 있는 판매기회 정보를 조회한다.
        SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
        if (StringUtils.isEmpty(salesOpptProcessMgmtSearchVO.getsDlrCd())){salesOpptProcessMgmtSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptProcessMgmtSearchVO.getsLangCd())){salesOpptProcessMgmtSearchVO.setsLangCd(LoginUtil.getLangCd());}

        salesOpptProcessMgmtSearchVO.setsCustNo(salesOpptProcessMgmtVO.getCustNo());
        salesOpptProcessMgmtSearchVO.setsSeq(salesOpptProcessMgmtVO.getSeq());
        List<SalesOpptProcessMgmtVO> salesOpptProcessMgmtBeforeVO = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByCondition(salesOpptProcessMgmtSearchVO);


/*        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getBefLeadStatCd())) {
        }*/
        currLeadStatCd = salesOpptProcessMgmtBeforeVO.get(0).getLeadStatCd();
        nextLeadStatCd = salesOpptProcessMgmtVO.getLeadStatCd();
        salesOpptProcessMgmtVO.setCurrLeadStatCd(currLeadStatCd);

        if (!salesOpptProcessMgmtVO.getLeadStatCd().equals(salesOpptProcessMgmtBeforeVO.get(0).getLeadStatCd())) {
            salesOpptProcessMgmtVO.setBefLeadStatCd(salesOpptProcessMgmtBeforeVO.get(0).getLeadStatCd());
/*          currLeadStatCd = salesOpptProcessMgmtBeforeVO.get(0).getLeadStatCd();
            nextLeadStatCd = salesOpptProcessMgmtVO.getLeadStatCd();
            salesOpptProcessMgmtVO.setCurrLeadStatCd(currLeadStatCd);*/
        }

        currMngScId = salesOpptProcessMgmtBeforeVO.get(0).getMngScId();
        salesOpptProcessMgmtVO.setCurrMngScId(currMngScId);
        //增加 空值 null 判断条件 贾明 2018年9月25日 start
        if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getMngScId())){
        	 if (!salesOpptProcessMgmtVO.getMngScId().equals(salesOpptProcessMgmtBeforeVO.get(0).getMngScId())) {
                 salesOpptProcessMgmtVO.setBefMngScId(salesOpptProcessMgmtBeforeVO.get(0).getMngScId());
          /*   currMngScId = salesOpptProcessMgmtBeforeVO.get(0).getMngScId();
                 salesOpptProcessMgmtVO.setCurrMngScId(currMngScId);
             */
                
             }
        }
      //增加 空值 null 判断条件 贾明 2018年9月25日 end
       

/*        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getBefMngScId())) {
            salesOpptProcessMgmtVO.setBefMngScId(salesOpptProcessMgmtBeforeVO.get(0).getMngScId());
        }*/


/*        if (StringUtils.isNotEmpty(salesOpptProcessMgmtBeforeVO.get(0).getLeadStatCd()) ) {
            currLeadStatCd = salesOpptProcessMgmtBeforeVO.get(0).getLeadStatCd();
            salesOpptProcessMgmtVO.setCurrLeadStatCd(currLeadStatCd);
        }

        if (StringUtils.isNotEmpty(salesOpptProcessMgmtBeforeVO.get(0).getMngScId()) ) {
            currMngScId = salesOpptProcessMgmtBeforeVO.get(0).getMngScId();
            salesOpptProcessMgmtVO.setCurrMngScId(currMngScId);
        }*/

        if (!currLeadStatCd.equals(nextLeadStatCd) ) {
            if ("09".equals(nextLeadStatCd)) {
                if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getFailCauCd())) {
                    salesOpptProcessMgmtVO.setFailCauCd("08"); // 계약취소인 경우 전패 원인을 '계약패기'로 한다. CRM369
                }
            }

            //단계가 변경되는 경우 제출일(submitDt)을 셋팅한다.
            if (salesOpptProcessMgmtVO.getSubmitDt() == null) {
                salesOpptProcessMgmtVO.setSubmitDt(currentDate);
            }
        }

        SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO = new SalesOpptProcessMgmtFinishVO();
        salesOpptProcessMgmtFinishVO.setSeq(salesOpptProcessMgmtVO.getSeq());

        if ("Y".equals(salesOpptProcessMgmtVO.getReviveOppt())) {

            if ("Y".equals(salesOpptProcessMgmtVO.getReSetYn())) {
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmtReSet(salesOpptProcessMgmtVO);
            } else {
                salesOpptProcessMgmtVO.setLeadStartDt(currentDate);
                salesOpptProcessMgmtVO.setSiebelLeadRowId(""); /* SIEBEL_LEAD_ROW_ID 를 지워준다. */
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
            }

            /* 신규 & 실패에서 1,2,4단계로 업데이트 시 판매기회이력관리에 추가를 하고
             * 추가한 키값을(C_SEQ)를 다시 판매기회에 업데이트 한다.
             */
            salesOpptProcessMgmtFinishService.insertSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
            salesOpptProcessMgmtVO.setcSeq(salesOpptProcessMgmtFinishVO.getcSeq());

            if ("Y".equals(salesOpptProcessMgmtVO.getReSetYn())) {
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmtReSet(salesOpptProcessMgmtVO);
            } else {
                salesOpptProcessMgmtVO.setLeadStartDt(currentDate);
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
            }

        } else {
/*
            salesOpptProcessMgmtVO.setLeadStatCd(null);  merge 하기 전에 상태를 업데이트 하지 않음.
            salesOpptProcessMgmtVO.setNextLeadStatCd(null);  merge 하기 전에 상태를 업데이트 하지 않음.
            rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
            salesOpptProcessMgmtFinishService.mergeSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);

            if ( salesOpptProcessMgmtVO.getLeadStartDt() != null ) {
                salesOpptProcessMgmtVO.setSiebelLeadRowId("");  SIEBEL_LEAD_ROW_ID 를 지워준다.
                salesOpptProcessMgmtVO.setLeadStatCd(nextLeadStatCd);
                salesOpptProcessMgmtVO.setBefLeadStatCd(currLeadStatCd);
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                salesOpptProcessMgmtFinishService.insertSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
                salesOpptProcessMgmtVO.setcSeq(salesOpptProcessMgmtFinishVO.getcSeq());
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
            }
*/

            rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

            if ( salesOpptProcessMgmtVO.getLeadStartDt() != null )  {
                salesOpptProcessMgmtFinishVO.setReviveOppt("Y");
            }
            salesOpptProcessMgmtFinishService.mergeSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);

            if ( salesOpptProcessMgmtVO.getLeadStartDt() != null ) {
                salesOpptProcessMgmtVO.setSiebelLeadRowId("");
                //salesOpptProcessMgmtVO.setLeadStatCd(null);
                //salesOpptProcessMgmtVO.setBefLeadStatCd(null);
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
                salesOpptProcessMgmtFinishService.insertSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);
                salesOpptProcessMgmtVO.setcSeq(salesOpptProcessMgmtFinishVO.getcSeq());
                rtlCnt = salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);
            }

        }

        rtlCnt = insertSalesOpptProcessMgmtHist(salesOpptProcessMgmtVO);

        return rtlCnt;
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService#selectShowRoomVisitCnt(chn.bhmc.dms.crm.cso.vo.ShowRoomMgmtSearchVO)
     */
    @Override
    public int selectShowRoomVisitCnt(ShowRoomMgmtSearchVO searchVO) throws Exception {
        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

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

        return showRoomStatsMgmtDAO.selectSalesOpptShowRoomMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService#selectSalesOpptProcessCreatedCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptProcessMgmtsByConditionStatsCnt(SalesOpptProcessMgmtSearchVO searchVO)
            throws Exception {
        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}

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

        return salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByConditionStatsCnt(searchVO);
    }

    /*
     * 회전이력
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService#insertSalesOpptProcessMgmtHist(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     */
    public int insertSalesOpptProcessMgmtHist(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {

        SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
        if (StringUtils.isEmpty(salesOpptProcessMgmtSearchVO.getsDlrCd())){salesOpptProcessMgmtSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOpptProcessMgmtSearchVO.getsLangCd())){salesOpptProcessMgmtSearchVO.setsLangCd(LoginUtil.getLangCd());}

        int rltCnt = 0;
        String currLeadStatCd = "";     // 현재 DB에 있는 LeadStatCd
        String nextLeadStatCd = salesOpptProcessMgmtVO.getNextLeadStatCd();     // 화면또는 다른곳에서 보내는 LeadStatCd
        String currMngScId = "";        // 현재 DB에 있는 MngScId
        String nextMngScId = salesOpptProcessMgmtVO.getNextMngScId();        // 화면또는 다른곳에서 보내는 MngScId

        salesOpptProcessMgmtSearchVO.setsCustNo(salesOpptProcessMgmtVO.getCustNo());
        salesOpptProcessMgmtSearchVO.setsSeq(salesOpptProcessMgmtVO.getSeq());
        List<SalesOpptProcessMgmtVO> salesOpptProcessMgmtBeforeVO = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByCondition(salesOpptProcessMgmtSearchVO);

        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getCurrLeadStatCd()) ){
            currLeadStatCd = salesOpptProcessMgmtBeforeVO.get(0).getBefLeadStatCd();
        } else {
            currLeadStatCd = salesOpptProcessMgmtVO.getCurrLeadStatCd();
        }

        if (StringUtils.isEmpty(salesOpptProcessMgmtVO.getCurrMngScId()) ){
            currMngScId = salesOpptProcessMgmtBeforeVO.get(0).getCurrMngScId();
        } else {
            currMngScId = salesOpptProcessMgmtVO.getCurrMngScId();
        }



//        String beforeLeadStatCd = salesOpptProcessMgmtBeforeVO.get(0).getBefLeadStatCd();
//        String beforeMngScId = "";
//        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getBefMngScId()) ) {
//            beforeMngScId = salesOpptProcessMgmtVO.getBefMngScId();
//        }
//        salesOpptProcessMgmtVO.setBefLeadStatCd(beforeLeadStatCd);

        /*
         *  판매기회 이력 등록
         *  상태 또는 담당자가 변경 되었을때만 이력을 남긴다.
         */
//        String mngScId = "";
//        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getMngScId()) ) {
//            mngScId = salesOpptProcessMgmtVO.getMngScId();
//        }
//        if (StringUtils.isNotEmpty(beforeMngScId) ) {
//            beforeMngScId = salesOpptProcessMgmtVO.getMngScId();
//        }
//        String leadStatCd = "";
//        if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getLeadStatCd()) ) {
//            leadStatCd = salesOpptProcessMgmtVO.getLeadStatCd();
//        }

        if ( !(currLeadStatCd.equals(nextLeadStatCd))
                || !(currMngScId.equals(nextMngScId)) ) {

            SalesOpptProcessMgmtHistVO salesOpptProcessMgmtHistVO = new SalesOpptProcessMgmtHistVO();

//            String sysMesgCont = "";
//            String leadStatCont = "";
//            String leadStatChange = "";
//            String sysDateY = DateUtil.getDate("yyyy");
//            String sysDateM = DateUtil.getDate("MM");
//            String sysDateD = DateUtil.getDate("dd");
//
//            //sysMesgCont = messageSource.getMessage("crm.info.yyyymmdd" , new String[]{ sysDateY, sysDateM, sysDateD} , LocaleContextHolder.getLocale().CHINA );
//            sysMesgCont = messageSource.getMessage("crm.info.yyyymmdd" , new String[]{ sysDateY, sysDateM, sysDateD} , Locale.CHINA );
//
//            leadStatCont = commonCodeService.selectCommonCodeName("CRM375", currLeadStatCd, "zh");
//
//            if (!(currLeadStatCd.equals(nextLeadStatCd)) ){
//                leadStatChange = messageSource.getMessage("crm.info.fromChange" , new String[]{ leadStatCont } , Locale.CHINA );
//                sysMesgCont = sysMesgCont + leadStatChange;
//            }

//            leadStatCont += " --> ";
//            leadStatCont += commonCodeService.selectCommonCodeName("CRM375", nextLeadStatCd, "zh");
//
//            if ("SYSTEM".equals(salesOpptProcessMgmtVO.getUpdtUsrId()) ) {
//                if (StringUtils.isNotEmpty(leadStatChange)) {
//                    sysMesgCont += " , ";
//                }
//                sysMesgCont += messageSource.getMessage("crm.info.systemCompulsion", null, Locale.CHINA);
//            } else {
//                if (!(beforeMngScId.equals(salesOpptProcessMgmtVO.getMngScId()))){
//                String mngScId = "";
//                if (StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getMngScId())) {
//                    mngScId = salesOpptProcessMgmtVO.getMngScId();
//                }
//                if (!(mngScId.equals(beforeMngScId))){
//                    if (StringUtils.isNotEmpty(leadStatChange)) {
//                        sysMesgCont += " , ";
//                    }
//                    sysMesgCont += messageSource.getMessage("crm.info.idAssign", null, Locale.CHINA);
//                }
//            }

            //salesOpptProcessMgmtHistVO.setLeadStatCont(leadStatCont);
            //salesOpptProcessMgmtHistVO.setSysMesgCont(sysMesgCont);

            salesOpptProcessMgmtHistVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());
            salesOpptProcessMgmtHistVO.setSaleOpptSeq(salesOpptProcessMgmtVO.getSeq());
            salesOpptProcessMgmtHistVO.setRegUsrId(LoginUtil.getUserId());
            salesOpptProcessMgmtHistVO.setUpdtUsrId(LoginUtil.getUserId());
            salesOpptProcessMgmtHistVO.setBefLeadStatCd(currLeadStatCd);
            salesOpptProcessMgmtHistVO.setLeadStatCd(nextLeadStatCd);
            salesOpptProcessMgmtHistVO.setBefMngScId(currMngScId);
            salesOpptProcessMgmtHistVO.setMngScId(nextMngScId);
            salesOpptProcessMgmtHistVO.setcSeq(salesOpptProcessMgmtBeforeVO.get(0).getcSeq());

            if (salesOpptProcessMgmtVO.getSubmitDt() == null) {
                Date currentDt = new Date();
                salesOpptProcessMgmtHistVO.setRegDt(currentDt);
            } else {
                salesOpptProcessMgmtHistVO.setRegDt(salesOpptProcessMgmtVO.getSubmitDt());
            }

            if("09".equals(nextLeadStatCd) ) {
                if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getFailCauCd())) {
                    salesOpptProcessMgmtHistVO.setFailCauCd(salesOpptProcessMgmtVO.getFailCauCd());
                }
            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getOtherBrandCd())) {
                salesOpptProcessMgmtHistVO.setOtherBrandCd(salesOpptProcessMgmtVO.getOtherBrandCd());

            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getFailCauReasonCont())) {
                salesOpptProcessMgmtHistVO.setFailCauReasonCont(salesOpptProcessMgmtVO.getFailCauReasonCont());

            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getPurcSelCarlineCd())) {
                salesOpptProcessMgmtHistVO.setPurcSelCarlineCd(salesOpptProcessMgmtVO.getPurcSelCarlineCd());

            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getPurcSelModelCd())) {
                salesOpptProcessMgmtHistVO.setPurcSelModelCd(salesOpptProcessMgmtVO.getPurcSelModelCd());

            }

            if(salesOpptProcessMgmtVO.getExpcPurcDt() != null) {
                salesOpptProcessMgmtHistVO.setExpcPurcDt(salesOpptProcessMgmtVO.getExpcPurcDt());

            }

            if(salesOpptProcessMgmtVO.getExpcDealPrc() != null ) {
                salesOpptProcessMgmtHistVO.setExpcDealPrc(salesOpptProcessMgmtVO.getExpcDealPrc());

            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getInfoTp())) {
                salesOpptProcessMgmtHistVO.setInfoTp(salesOpptProcessMgmtVO.getInfoTp());

            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getHoldTp())) {
                salesOpptProcessMgmtHistVO.setHoldTp(salesOpptProcessMgmtVO.getHoldTp());
            }

            if(salesOpptProcessMgmtVO.getHoldDetlTpSeq() != null ) {
                salesOpptProcessMgmtHistVO.setHoldDetlTpSeq(salesOpptProcessMgmtVO.getHoldDetlTpSeq());
            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getIntrCarlineCd())) {
                salesOpptProcessMgmtHistVO.setIntrCarlineCd(salesOpptProcessMgmtVO.getIntrCarlineCd());
            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getIntrModelCd())) {
                salesOpptProcessMgmtHistVO.setIntrModelCd(salesOpptProcessMgmtVO.getIntrModelCd());
            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getContractNo())) {
                salesOpptProcessMgmtHistVO.setContractNo(salesOpptProcessMgmtVO.getContractNo());
            }

            if(StringUtils.isNotEmpty(salesOpptProcessMgmtVO.getBeforeNo()) ) {
                salesOpptProcessMgmtHistVO.setBeforeNo(salesOpptProcessMgmtVO.getBeforeNo());
            }

            rltCnt = salesOpptProcessMgmtDAO.insertSalesOpptProcessMgmtHist(salesOpptProcessMgmtHistVO);
        }

        return rltCnt;
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService#updateSalesOpptProcessAndInsertHist(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     */
    @Override
    public int updateSalesOpptProcessAndInsertHist(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {
        try {

            return updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

            //return insertSalesOpptProcessMgmtHist(salesOpptProcessMgmtVO);

        } catch(Exception e) {
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService#updateSalesOpptFromOutService(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     * 고객쪽에서 담당자 업데이트 할때 사용함.
     */
    @Override
    public int updateSalesOpptFromOutService(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO) throws Exception {

        int rtlCnt = 0;
        // 판매기회 정보를 조횐한다.
        SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
        salesOpptProcessMgmtSearchVO.setsCustNo(salesOpptProcessMgmtVO.getCustNo());
        salesOpptProcessMgmtSearchVO.setsDlrCd(salesOpptProcessMgmtVO.getDlrCd());

        int salesOpptMgmtCnt = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByConditionCnt(salesOpptProcessMgmtSearchVO);

        if (salesOpptMgmtCnt > 0) {
            List<SalesOpptProcessMgmtVO> salesOpptProcessMgmtListVO = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByCondition(salesOpptProcessMgmtSearchVO);

            // 업데이트 조건을 확인한다. (05단계만 업데이트)
            if ( "05".equals(salesOpptProcessMgmtListVO.get(0).getLeadStatCd()) ) {

                if ( salesOpptProcessMgmtVO.getHoldTp() != null && "03".equals(salesOpptProcessMgmtVO.getHoldTp()) ) {
                    if ( salesOpptProcessMgmtVO.getHoldDetlTpSeq() == null ) {
                        // 리드출처상세는 필수 입니다.
                        throw processException("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.approchLocationDtl", null, LocaleContextHolder.getLocale())});
                    }
                }

                salesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

                SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO = new SalesOpptProcessMgmtFinishVO();
                salesOpptProcessMgmtFinishVO.setSeq(salesOpptProcessMgmtListVO.get(0).getSeq());
                salesOpptProcessMgmtFinishService.mergeSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);

                salesOpptProcessMgmtVO.setCurrLeadStatCd(salesOpptProcessMgmtListVO.get(0).getLeadStatCd());
                salesOpptProcessMgmtVO.setNextLeadStatCd(salesOpptProcessMgmtListVO.get(0).getLeadStatCd());
                //salesOpptProcessMgmtVO.setMngScId(salesOpptProcessMgmtVO.getMngScId());
                salesOpptProcessMgmtVO.setSeq(salesOpptProcessMgmtListVO.get(0).getSeq());
                salesOpptProcessMgmtVO.setCurrMngScId(salesOpptProcessMgmtListVO.get(0).getMngScId());
                salesOpptProcessMgmtVO.setNextMngScId(salesOpptProcessMgmtVO.getMngScId());

                rtlCnt = insertSalesOpptProcessMgmtHist(salesOpptProcessMgmtVO);

            }

        }

        return rtlCnt;
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService#updateSalesOpptProcessMgmtCancelDelivery(chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO)
     */
    @Override
    public SalesOpptProcessMgmtVO updateSalesOpptProcessMgmtCancelDelivery(SalesOpptProcessMgmtVO salesOpptProcessMgmtVO)
            throws Exception {

        updateSalesOpptProcessMgmt(salesOpptProcessMgmtVO);

        SalesOpptProcessMgmtFinishVO salesOpptProcessMgmtFinishVO = new SalesOpptProcessMgmtFinishVO();

        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getDlrCd())) {
            salesOpptProcessMgmtFinishVO.setDlrCd(LoginUtil.getDlrCd());
        }

        if (StringUtils.isBlank(salesOpptProcessMgmtVO.getcSeq())) {
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("crm.lbl.c_seq", null, LocaleContextHolder.getLocale())});
        }

        SalesOpptProcessMgmtSearchVO salesOpptProcessMgmtSearchVO = new SalesOpptProcessMgmtSearchVO();
        salesOpptProcessMgmtSearchVO.setsDlrCd(salesOpptProcessMgmtVO.getDlrCd());
        salesOpptProcessMgmtSearchVO.setsSeq(salesOpptProcessMgmtVO.getSeq());

        SalesOpptProcessMgmtVO salesOpptProcessMgmtRltVO = salesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByKey(salesOpptProcessMgmtSearchVO);

        // 입력한 Param의 C_SEQ와 현재 진행중인 판매기회의 C_SEQ가 다른 경우만 판매기회 이력 상태를 업데이트 한다.
        if (!salesOpptProcessMgmtVO.getcSeq().equals(salesOpptProcessMgmtRltVO.getcSeq())) {
            salesOpptProcessMgmtFinishVO.setSeq(salesOpptProcessMgmtVO.getSeq());
            salesOpptProcessMgmtFinishVO.setcSeq(salesOpptProcessMgmtVO.getcSeq());
            salesOpptProcessMgmtFinishVO.setLeadStatCd("08"); // 인도완료 후 취소시 이전 판매기회 이력은 전출 처리한다. (CRM375 - 08 전출)

            salesOpptProcessMgmtFinishService.updateSalesOpptProcessMgmtFinish(salesOpptProcessMgmtFinishVO);

            // 계약에서 넘어오는 판매고문을 고객의 판매고문으로 업데이트
            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
            customerInfoVO.setDlrCd(salesOpptProcessMgmtVO.getDlrCd());

            if (StringUtils.isBlank(customerInfoVO.getDlrCd())) {
                customerInfoVO.setDlrCd(LoginUtil.getDlrCd());
            }

            customerInfoVO.setCustNo(salesOpptProcessMgmtRltVO.getCustNo());
            customerInfoVO.setMngScId(salesOpptProcessMgmtVO.getMngScId());
            customerInfoVO.setUpdtUsrId(LoginUtil.getUserId());

            customerInfoDAO.updateCustomerMngScAssign(customerInfoVO);
        }

        return salesOpptProcessMgmtRltVO;
    }

}
