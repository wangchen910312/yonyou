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
import com.ibm.icu.util.TimeZone;

import chn.bhmc.dms.bat.mgr.service.BatchOperService;
import chn.bhmc.dms.bat.mgr.service.BatchScheduleService;
import chn.bhmc.dms.bat.mgr.vo.BatchOperVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionManageDAO;
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
     * 메시지 관리
     */
	@Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 배치작업 관리 서비스
     */
    @Resource(name="batchOperService")
    BatchOperService batchOperService;

    /**
     * 배치스케쥴 관리 서비스
     */
    @Resource(name="batchScheduleService")
    BatchScheduleService batchScheduleService;

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
     * 만족도관리 등록/수정/삭제 처리
     */
    @Override
    public void multiSatisFactionManages(BaseSaveVO<SatisFactionManageVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(SatisFactionManageVO satisFactionManageVO : obj.getInsertList()){
            satisFactionManageVO.setRegUsrId(userId);
            satisFactionManageVO.setDlrCd(LoginUtil.getDlrCd());
            insertSatisFactionManage(satisFactionManageVO);
        }

        for(SatisFactionManageVO satisFactionManageVO : obj.getUpdateList()){
            satisFactionManageVO.setUpdtUsrId(userId);
            updateSatisFactionManage(satisFactionManageVO);
        }

        for(SatisFactionManageVO satisFactionManageVO : obj.getDeleteList()){
            deleteSatisFactionManage(satisFactionManageVO);
        }
    }

    /**
     * 만족도관리 등록
     */
    @Override
    public int insertSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception {
        String userId = LoginUtil.getUserId();
        satisFactionManageVO.setRegUsrId(userId);
        satisFactionManageVO.setDlrCd(LoginUtil.getDlrCd());

        /*
         * ######################################################   추출주기설정 저장 시작
         */
        if ( "S".equals(satisFactionManageVO.getCustExtrCycleTp()) ) {

            if ( satisFactionManageVO.getCustExtrCycleDt() == null){
                // TODO 메시지 [------ ]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
            };

//            SimpleDateFormat convertDt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
            DateFormat convertString = new SimpleDateFormat("yyyyMMdd");

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
                // TODO 메시지 [------ ]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
            };

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

        //만족도조사 등록
        return satisFactionManageDAO.insertSatisFactionManage(satisFactionManageVO);
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
        if ( "S".equals(satisFactionManageVO.getCustExtrCycleTp()) ) {

            if ( satisFactionManageVO.getCustExtrCycleDt() == null){
                // TODO 메시지 [------ ]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
            };

//            SimpleDateFormat convertDt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
            DateFormat convertString = new SimpleDateFormat("yyyyMMdd");

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
                // TODO 메시지 [------ ]을(를) 확인하여 주세요.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
            };

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


        // 만족도조사 수정
        return satisFactionManageDAO.updateSatisFactionManage(satisFactionManageVO);
    }

    /**
     * 만족도관리 삭제
     */
    @Override
    public int deleteSatisFactionManage(SatisFactionManageVO satisFactionManageVO) throws Exception {
        return satisFactionManageDAO.deleteSatisFactionManage(satisFactionManageVO);
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
     * @see chn.bhmc.dms.crm.css.service.SatisFactionManageService#selectSatisFactionManageUsrsByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO)
     */
    @Override
    public int selectSatisFactionManageUsrsByConditionCnt(SatisFactionManageSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionManageDAO.selectSatisFactionManageUsrsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionManageService#selectSatisFactionManageUsrsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO)
     */
    @Override
    public List<SatisFactionManageVO> selectSatisFactionManageUsrsByCondition(SatisFactionManageSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionManageDAO.selectSatisFactionManageUsrsByCondition(searchVO);
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
     * @see chn.bhmc.dms.crm.css.service.SatisFactionManageService#selectSatisFactionPresentResultsByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO)
     */
    @Override
    public int selectSatisFactionPresentResultsByConditionCnt(SatisFactionManageSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionManageDAO.selectSatisFactionPresentResultsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionManageService#selectSatisFactionPresentResultsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO)
     */
    @Override
    public List<SatisFactionManageVO> selectSatisFactionPresentResultsByCondition(SatisFactionManageSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionManageDAO.selectSatisFactionPresentResultsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionManageService#selectCallRcpeExtrMapping(chn.bhmc.dms.crm.css.vo.SatisFactionManageSearchVO)
     */
    @Override
    public int selectCallRcpeExtrMapping(SatisFactionManageVO stsfMngVO) throws Exception {

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
        resultVO.setStsfIvstSeq(stsfMngVO.getStsfIvstSeq());//만족도조사일련번호
        resultVO.setSubyTmplSeq(Integer.parseInt(stsfMngVO.getSubyTmplSeq()));//설문템플릿일련번호
        resultVO.setRegUsrId(LoginUtil.getUserId());//등록자
        resultVO.setCustExtrTermNo(stsfMngVO.getRcpeExtrSeq());//고객추출조건번호
        resultVO.setDlrCd(stsfMngVO.getDlrCd());
        resultVO.setSeq(cteVO.getSeq()); //본래 seq는 만족도조사일련번호로 사용 하였으나 여기선 대상자추출 테이블의 조회 key 값으로 사용한다.
        satisFactionMobileResultService.insertSatisFactionManageTargExtUsr(resultVO);

        // 3. 추출된 대상자를 콜센터로 이관
        SatisFactionManageSearchVO sfmSearchVO = new SatisFactionManageSearchVO();
        sfmSearchVO.setsDlrCd(stsfMngVO.getDlrCd());//딜러코드
        sfmSearchVO.setsRcpeExtrSeq(stsfMngVO.getRcpeExtrSeq());//고객추출조건번호
        sfmSearchVO.setsSeq(stsfMngVO.getStsfIvstSeq()); //만족도조사 일련번호
        selectCallSenProc(sfmSearchVO);

        // 4. 해당 tmp table에서 data삭제
        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO ();
        searchVO.setsDlrCd(stsfMngVO.getDlrCd());
        searchVO.setsSeq(cteVO.getSeq());
        crmTargExtractService.deleteTempList(searchVO);

        // 5. 만족도조사 의 마지막 추출일 update
        satisFactionManageDAO.updateLastExtrDt(stsfMngVO);

        return 0;
    }

    /**
     * 만족도조사 관리 - 배치 자동 등록
     * @param SatisFactionManageVO - 만족도조사 관리 정보
     */
    public void insertSatisFactionManageBatch(SatisFactionManageVO satisFactionManageVO) throws Exception {

        String userId = LoginUtil.getUserId();

        // 배치작업 정보를 저장, 수정, 삭제한다.
        BatchOperVO batchOperVO = new BatchOperVO();
        batchOperVO.setBatOperNm(messageSource.getMessage("crm.btn.rcpeExtrMapping", null, LocaleContextHolder.getLocale())/*+" - "+batchId*/);//만족도조사 대상자 추출 - batchId배치작업명
        batchOperVO.setBatTp("01");                                     // QuartzJob
        batchOperVO.setBatPrgmNm("chn.bhmc.dms.bat.BatchSampleJobBean");
        batchOperVO.setBatParamVal("");
        batchOperVO.setBatEnabledYn(satisFactionManageVO.getUseYn());
        batchOperVO.setRegUsrId(userId);

//        String batOperId = batchOperService.insertBatchOper(batchOperVO);


        //배치 등록후 배치 아이디 set
//        satisFactionManageVO.setBatOperId(batOperId);

        // 배치스케쥴 정보를 저장,수정,삭제 한다.
        BatchScheduleVO batchScheduleVO = new BatchScheduleVO();

//        batchScheduleVO.setBatOperId(batOperId);
        //batchScheduleVO.setCronExpressionTxt(satisFactionManageVO.getCustExtrCycleCont());
        batchScheduleVO.setTimezoneId(TimeZone.getDefault().getID());
        batchScheduleVO.setRegUsrId(userId);
        batchScheduleService.insertBatchSchedule(batchScheduleVO);
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

}
