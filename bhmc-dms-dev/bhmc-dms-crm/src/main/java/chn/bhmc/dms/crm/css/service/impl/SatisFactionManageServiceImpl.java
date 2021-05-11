package chn.bhmc.dms.crm.css.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SatisFactionTargExtractService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionManageDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionCrmTargExtractSaveVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionVO;


/**
 * 만족도조사 관리 서비스 구현 클래스
 *
 * @author hyun ho kim
 * @since 2016. 03. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.11         hyun ho kim            최초 생성
 * </pre>
 */

@Service("satisFactionManageService")
public class SatisFactionManageServiceImpl extends HService implements SatisFactionManageService {

    /**
     * 설문 템플릿 관리 DAO
     */
    @Resource(name="satisFactionManageDAO")
    SatisFactionManageDAO satisFactionManageDAO;

    /**
     * 콜센터 이관(대상자) 서비스
     */
    @Resource(name="campaignActionService")
    CampaignActionService campaignActionService;

    /**
     * 만족도 설문조사 대상자 서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 대상자추출 서비스
     */
    @Resource(name="crmTargExtractService")
    CrmTargExtractService crmTargExtractService;

    /**
     * 대상자추출 서비스
     */
    @Resource(name="satisFactionTargExtractService")
    SatisFactionTargExtractService satisFactionTargExtractService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 설문 템플릿 목록 수량 조회
     */
    @Override
    public int selectSatisFactionManagesByConditionCnt(SatisFactionManageSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionManageDAO.selectSatisFactionManagesByConditionCnt(searchVO);
    }

    /**
     * 설문 테플릿 목록 조회
     */
    @Override
    public List<SatisFactionManageVO> selectSatisFactionManagesByCondition(SatisFactionManageSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionManageDAO.selectSatisFactionManagesByCondition(searchVO);
    }

    /**
     * 만족도관리 등록
     */
    @Override
    public int insertSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        satisFactionManageVO.setRegUsrId(userId);
        satisFactionManageVO.setDlrCd(dlrCd);

        /*
         * ######################################################   추출주기설정 저장 시작
         */
        if(satisFactionManageVO.getCustExtrAutoYn().equals("Y")){
            if ( "S".equals(satisFactionManageVO.getCustExtrCycleTp()) ) {

                if ( satisFactionManageVO.getCustExtrCycleDt() == null){
                    // [고객추출조건]을(를) 확인하여 주세요.
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
                }

                DateFormat convertString = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"), LocaleContextHolder.getLocale());

                boolean isFirst = true;
                String dateToString = "";

                // List TO String
                for (Date getDate : satisFactionManageVO.getCustExtrCycleDt()) {
                    if(!isFirst){
                        dateToString += ", ";
                    }
                    dateToString += convertString.format(getDate);
                    isFirst = false;

                }

                satisFactionManageVO.setCustExtrCycleCont(dateToString);

            } else if ( "W".equals(satisFactionManageVO.getCustExtrCycleTp()) ) {

                if ( satisFactionManageVO.getCustExtrCycleWeek() == null){
                    // [고객추출조건]을(를) 확인하여 주세요.
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
                }

                // Week List TO String
                boolean isFirst = true;
                String weekToString = "";
                for (String getWeek : satisFactionManageVO.getCustExtrCycleWeek()) {
                    if(!isFirst){
                        weekToString += ", ";
                    }
                    weekToString += getWeek;
                    isFirst = false;
                }

                satisFactionManageVO.setCustExtrCycleCont(weekToString);

            }
        }else{
            //대상자 추출이 수동일 경우 값을 빈값으로 Setting
            satisFactionManageVO.setCustExtrCycleCont("");
            satisFactionManageVO.setCustExtrCycleTp("");
        }

        satisFactionManageDAO.insertSatisFactionManage(satisFactionManageVO);
        int seq = satisFactionManageVO.getSeq();

        if (satisFactionManageVO.getStsfIvstTpCd().equals("01")) {

            //고객추출 저장 시작
            SatisFactionCrmTargExtractSaveVO saveVO = new SatisFactionCrmTargExtractSaveVO();
            saveVO.setExtractSaveList(satisFactionManageVO.getExtractSaveList());
            satisFactionTargExtractService.multiTargExtractExs(saveVO, seq);
            //고객추출 저장 종료

        }

        //만족도조사 등록
        return seq;
    }

    /**
     * 만족도관리 수정
     */
    @Override
    public int updateSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception {
        String userId = LoginUtil.getUserId();
        satisFactionManageVO.setUpdtUsrId(userId);

        /*
         * ######################################################   추출주기설정 저장 시작
         */
        if(satisFactionManageVO.getCustExtrAutoYn().equals("Y")){
            if ( "S".equals(satisFactionManageVO.getCustExtrCycleTp()) ) {

                if ( satisFactionManageVO.getCustExtrCycleDt() == null){
                    // [고객추출조건]을(를) 확인하여 주세요.
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
                }

                DateFormat convertString = new SimpleDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"), LocaleContextHolder.getLocale());

                boolean isFirst = true;
                String dateToString = "";

                // List TO String
                for (Date getDate : satisFactionManageVO.getCustExtrCycleDt()) {
                    if(!isFirst){
                        dateToString += ", ";
                    }
                    dateToString += convertString.format(getDate);
                    isFirst = false;

                }
                satisFactionManageVO.setCustExtrCycleCont(dateToString);

            } else if ( "W".equals(satisFactionManageVO.getCustExtrCycleTp()) ) {
                if ( satisFactionManageVO.getCustExtrCycleWeek() == null){
                    // 메시지 [고객추출조건]을(를) 확인하여 주세요.
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
                }

                // Week List TO String
                boolean isFirst = true;
                String weekToString = "";
                for (String getWeek : satisFactionManageVO.getCustExtrCycleWeek()) {
                    if(!isFirst){
                        weekToString += ", ";
                    }
                    weekToString += getWeek;
                    isFirst = false;
                }

                satisFactionManageVO.setCustExtrCycleCont(weekToString);

            }
            /*
             * ######################################################   추출주기설정 저장 종료
             */
        }else{
            //대상자 추출이 수동일 경우 값을 빈값으로 Setting
            satisFactionManageVO.setCustExtrCycleCont("");
            satisFactionManageVO.setCustExtrCycleTp("");
        }

        if (satisFactionManageVO.getStsfIvstTpCd().equals("01")) {

            //고객추출 저장 시작
            SatisFactionCrmTargExtractSaveVO saveVO = new SatisFactionCrmTargExtractSaveVO();
            saveVO.setExtractSaveList(satisFactionManageVO.getExtractSaveList());
            satisFactionTargExtractService.multiTargExtractExs(saveVO, satisFactionManageVO.getSeq());
            //고객추출 저장 종료

        }

        // 만족도조사 수정
        return satisFactionManageDAO.updateSatisFactionManage(satisFactionManageVO);
    }

    /**
     * 조회 조건에 해당하는 만족도 조사명 kendoDropDownList 구성목록을 조회한다.
     */
    @Override
    public List<SatisFactionManageVO> selectStsfIvstNmsByCondition(SatisFactionManageSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionManageDAO.selectStsfIvstNmsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public SatisFactionManageVO selectSurveyCdByKey(SatisFactionMobileSearchVO schMobileVO) throws Exception {
        if (StringUtils.isEmpty(schMobileVO.getsDlrCd())){schMobileVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionManageDAO.selectSurveyCdByKey(schMobileVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionManageService#selectCallSenProc(chn.bhmc.dms.crm.mcm.vo.CampaignActionVO)
     */
    @Override
    public String selectCallSenProc(SatisFactionManageSearchVO searchVO) throws Exception {

        CampaignActionVO campaignActionVO = new CampaignActionVO();
        campaignActionVO.setDlrCd(searchVO.getsDlrCd()); //딜러코드
        campaignActionVO.setCustExtrTermNo(searchVO.getsRcpeExtrSeq()); // 고객추출조건번호
        campaignActionVO.setRefKeyNm(searchVO.getsSeq()+"");//만족도 조사 일련번호(캠페인번호, 고개케어 일련번호, 만족도조사 일련번호)
        campaignActionVO.setExtrDgreCnt(1);//추출차수(캠페인/고객케어는 추출차수, 만족도조사는 무조건 1 을 넘김)
        campaignActionVO.setBizCd("05");//업무코드(캠페인->06, 고객케어->09, 만족도조사->05)
        campaignActionVO.setRegUsrId(LoginUtil.getUserId());
        campaignActionVO.setUpdtUsrId(LoginUtil.getUserId());

        CampaignActionVO resultVO = new CampaignActionVO();
        resultVO = campaignActionService.selectCallCenterSends(campaignActionVO);

        if(resultVO.getResult().equals("03")){
            //콜센터로 이관할 대상이 없습니다.
            throw processException("crm.err.callCenterUserEmpty");
        }else if(resultVO.getResult().equals("00")){
            SatisFactionManageVO stsfVO = new SatisFactionManageVO();
            stsfVO.setDlrCd(campaignActionVO.getDlrCd());//딜러코드
            stsfVO.setSeq(Integer.parseInt(campaignActionVO.getRefKeyNm()));//만족도조사 일련번호
            //satisFactionManageDAO.updateCallCenResult(stsfVO);
        }else{
            //콜센터로 이관할 수 없습니다.
            throw processException("crm.err.callCenterNoSend");
        }

        return resultVO.getResult();
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionManageService#selectCallRcpeExtrMapping(chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO)
     */
    @Override
    public int selectCallRcpeExtrMapping(SatisFactionManageVO stsfMngVO) throws Exception {

        SatisFactionManageSearchVO searchVO = new SatisFactionManageSearchVO();
        searchVO.setsSeq(stsfMngVO.getSeq());
        stsfMngVO = selectSatisFactionManageByKey(searchVO);
        if(stsfMngVO == null){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.stsfIvstSeq", null, LocaleContextHolder.getLocale())});
        }else{

            // 대상자 추출조건이 정비인경우는 null이기 때문에 따로 확인.
            if(stsfMngVO.getRcpeExtrSeqChkCnt()<1){
                // {대상자 추출조건}을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.rcpeExtrSeqCondition", null, LocaleContextHolder.getLocale())});
            };

            stsfMngVO.setStsfIvstSeq(stsfMngVO.getSeq()); //아래에서 만족도 조사 seq를 StsfIvstSeq 로 사용.

            if("03".equals(stsfMngVO.getStsfIvstTpCd()) || "02".equals(stsfMngVO.getStsfIvstTpCd()) ){ // 기타일경우
                // 1. 대상자 추출조건으로 대상자 추출 proc를 태운다.
                CrmTargExtractVO saveVO = new CrmTargExtractVO ();
                saveVO.setDlrCd(stsfMngVO.getDlrCd());
                saveVO.setCustExtrTermNo(stsfMngVO.getRcpeExtrSeq());
                saveVO.setRegUsrId(LoginUtil.getUserId());
                saveVO.setUpdtUsrId(LoginUtil.getUserId());
                CrmTargExtractVO cteVO = crmTargExtractService.selectTargetExtractSaveExcel(saveVO);

                if(cteVO.getResult().equals("02")){
                    //추출할 대상자가 존재하지 않습니다.
                    throw processException("crm.err.targetEmptyUsr");
                }else if(cteVO.getResult().equals("99")){
                    //대상자 추출을 진행할 수 없습니다.
                    throw processException("crm.info.noRcpeExtrMapping");
                }

                // 2. 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행(기준에 되는 1003T에서 insert select 실행)
                SatisFactionMobileResultVO resultVO = new SatisFactionMobileResultVO();
                resultVO.setStsfIvstSeq(stsfMngVO.getSeq());//만족도조사일련번호
                resultVO.setSubyTmplSeq(Integer.parseInt(stsfMngVO.getSubyTmplSeq()));//설문템플릿일련번호
                resultVO.setRegUsrId(LoginUtil.getUserId());//등록자
                resultVO.setCustExtrTermNo(stsfMngVO.getRcpeExtrSeq());//고객추출조건번호
                resultVO.setDlrCd(stsfMngVO.getDlrCd());
                resultVO.setSeq(cteVO.getSeq()); //본래 seq는 만족도조사일련번호로 사용 하였으나 여기선 대상자추출 테이블의 조회 key 값으로 사용한다.
                resultVO.setStsfIvstTpCd(stsfMngVO.getStsfIvstTpCd());//조사타입 01:정비 , 02:판매, 03:기타
                satisFactionMobileResultService.insertSatisFactionManageTargExtUsr(resultVO);

                // 4. 해당 tmp table에서 data삭제
                CrmTargExtractSearchVO targSearchVO = new CrmTargExtractSearchVO ();
                targSearchVO.setsDlrCd(stsfMngVO.getDlrCd());
                targSearchVO.setsSeq(cteVO.getSeq());
                crmTargExtractService.deleteTempList(targSearchVO);

            }else if("01".equals(stsfMngVO.getStsfIvstTpCd())){ // 정비 일경우    , 정비진행하고, 나중에 판매도 여기에 태울꺼야~!!
                //call 프로시저

                // 1. 대상자 추출조건으로 대상자 추출 proc를 태운다.
                CrmTargExtractVO saveVO = new CrmTargExtractVO ();
                saveVO.setDateFormat(systemConfigInfoService.selectStrValueByKey("dateFormat"));
                saveVO.setDlrCd(stsfMngVO.getDlrCd());
                saveVO.setSeq(stsfMngVO.getSeq());
                saveVO.setRegUsrId(LoginUtil.getUserId());

                CrmTargExtractVO cteVO = crmTargExtractService.selectTargetExtractSaveFromService(saveVO);

            }

            // 3. 추출된 대상자를 콜센터로 이관
            SatisFactionManageSearchVO sfmSearchVO = new SatisFactionManageSearchVO();
            sfmSearchVO.setsDlrCd(stsfMngVO.getDlrCd());//딜러코드
            sfmSearchVO.setsRcpeExtrSeq(stsfMngVO.getRcpeExtrSeq());//고객추출조건번호
            sfmSearchVO.setsSeq(stsfMngVO.getStsfIvstSeq()); //만족도조사 일련번호
            selectCallSenProc(sfmSearchVO);

            // 5. 만족도조사 의 마지막 추출일 update
            satisFactionManageDAO.updateLastExtrDt(stsfMngVO);
        }

        return 0;
    }

    /** ######################################################
     * 오늘 고객 추출 수량 조회 ( 배치에서 사용 )
     * @param searchVO - sDlrCd / sCurruntDt
     * @return 오늘 스케줄 돌아야 할 수량
     */
    @Override
    public int selectSatisFactionBatchCnt(SatisFactionManageSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        Calendar startCal = Calendar.getInstance();
        int year = startCal.get(Calendar.YEAR);
        int month = startCal.get(Calendar.MONTH);
        int day = startCal.get(Calendar.DATE);
        startCal.set(year, month, day, 00, 00, 00);
        searchVO.setsCurruntDt(startCal.getTime());

        int selectSatisFactionBatchCnt = satisFactionManageDAO.selectSatisFactionBatchCnt(searchVO);

        return selectSatisFactionBatchCnt;

    }

    /**
     * 만족도 조사 관리 상세정보를 조회한다.
     * @param SatisFactionManageSearchVO - 만족도 조사 번호
     * @return 만족도 조사 정보
     */
    @Override
    public SatisFactionManageVO selectSatisFactionManageByKey(SatisFactionManageSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        SatisFactionManageVO vo = null;

        if ( searchVO.getsSeq() > 0 ) {

            vo = satisFactionManageDAO.selectSatisFactionManageByKey(searchVO);

        } else {

            // [만족도 조사 일련번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.stsfIvstSeq", null, LocaleContextHolder.getLocale())});

        }

        return vo;
    }

    /**
     * 만족도 유형 데이터를 조회한다.
     * @param searchVO - 조사타입 공통코드
     * @return 만족도 유형 공통코드 목록
     */
    @Override
    public List<CommonCodeVO> selectStsfIvstMthCdList(SatisFactionManageSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LoginUtil.getLangCd());
        return satisFactionManageDAO.selectStsfIvstMthCdList(searchVO);
    }

}