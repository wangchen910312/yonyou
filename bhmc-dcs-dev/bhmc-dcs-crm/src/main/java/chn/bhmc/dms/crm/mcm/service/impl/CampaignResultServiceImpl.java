package chn.bhmc.dms.crm.mcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;
import chn.bhmc.dms.crm.mcm.service.CampaignResultService;
import chn.bhmc.dms.crm.mcm.service.dao.CampaignResultDAO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;

/**
 * 캠페인결과 관리 서비스 구현 클래스
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
 * </pre>
 */

@Service("campaignResultService")
public class CampaignResultServiceImpl extends HService implements CampaignResultService, JxlsSupport {

    /**
     * 캠페인결과 관리 DAO
     */
    @Resource(name="campaignResultDAO")
    CampaignResultDAO campaignResultDAO;

    /**
     * 만족도결과  서비스
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 마케팅 캠페인 목록 수량 조회
     */
    @Override
    public int selectCampaignResultsByConditionCnt(CampaignResultSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignResultDAO.selectCampaignResultsByConditionCnt(searchVO);
    }

    /**
     * 캠페인결과 목록 조회
     */
    @Override
    public List<CampaignResultVO> selectCampaignResultsByCondition(CampaignResultSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignResultDAO.selectCampaignResultsByCondition(searchVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int selectGoalResultsByConditionCnt(CampaignResultSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignResultDAO.selectGoalResultsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CampaignResultVO> selectGoalResultsByCondition(CampaignResultSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignResultDAO.selectGoalResultsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateGoalResult(CampaignResultVO campaignResultVO) throws Exception {

        return campaignResultDAO.updateGoalResult(campaignResultVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiGoalResults(BaseSaveVO<CampaignResultVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(CampaignResultVO campaignResultVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(campaignResultVO.getDlrCd())){campaignResultVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(campaignResultVO.getPltCd())){campaignResultVO.setPltCd(LoginUtil.getPltCd());}

            campaignResultVO.setUpdtUsrId(userId);
            updateGoalResult(campaignResultVO);
        }
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public CampaignResultVO selectSurveyByKey(String sDlrCd,String sPltCd,int sSeq) throws Exception {
        return campaignResultDAO.selectSurveyByKey(sDlrCd, sPltCd, sSeq);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CampaignResultVO selectSurveyMakCdByKey(CampaignResultSearchVO searchVO) throws Exception {


        if (StringUtils.isEmpty(searchVO.getsEmpId())){searchVO.setsEmpId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if ( StringUtils.isEmpty(searchVO.getsMakCd())) {
            // {캠페인번호}을(를) 확인하여 주세요.
            throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("global.lbl.crNo", null, LocaleContextHolder.getLocale())});

        }

        return campaignResultDAO.selectSurveyMakCdByKey(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CampaignResultVO> selectSurveyQuestionByCondition(CampaignResultSearchVO searchVO) throws Exception {
        return campaignResultDAO.selectSurveyQuestionByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CampaignResultVO> selectSurveyAnswerByCondition(CampaignResultSearchVO searchVO) throws Exception {
        return campaignResultDAO.selectSurveyAnswerByCondition(searchVO);
    }

    /**
     * 설문에 응답한 답변들을 등록 처리한다.(업체평가)
     * @param CampaignResultVO
     */
    @Override
    public void multiCampaign01AnswerSurveys(BaseSaveVO<CampaignResultVO> obj) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        CampaignResultSearchVO surveySearchVO = new CampaignResultSearchVO();

        surveySearchVO.setsDlrCd(dlrCd);
        surveySearchVO.setsIvstTp("01");
        surveySearchVO.setsMakCd(obj.getInsertList().get(0).getMakCd());
        CampaignResultVO campaignResultByKey = selectSurveyMakCdByKey(surveySearchVO);
        if ( campaignResultByKey != null ) {
            // {설문결과}가 중복됩니다.
            throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("crm.lbl.stsfIvstRsltCont", null, LocaleContextHolder.getLocale())});
        };

        if (obj.getInsertList().size() <= 0 ) {
         // {설문결과}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.stsfIvstRsltCont", null, LocaleContextHolder.getLocale())});
        }

        //1. 설문결과 Seq생성
        SatisFactionMobileResultSearchVO searchVO = new SatisFactionMobileResultSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsPltCd(pltCd);
        int stsfIvstRsltSeq = satisFactionMobileResultService.selectStsfIvstRsltSeq(searchVO);


        //2. 설문응답 상세등록
        double tmpTotScore = 0;
        int tmpQestWgtVal = 0;
        int tmpStsfIvstSeq = 0;
        int tmpSubyTmplSeq = 0;
        String tmpCustNo = "";
        String stsfIvstYn = "";
        String cmplReasonCont = "";
        String makCd = "";
        double score = 0;
        double sc = 0;
        double ts = 0;

        //응답한 답변 갯수만큼 for
        for(CampaignResultVO campaignResultVO : obj.getInsertList()){
            campaignResultVO.setRegUsrId(LoginUtil.getUserId());
            campaignResultVO.setDlrCd(dlrCd);
            campaignResultVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);

            // 질문유형 코드 : qestTpCd
            // 가중치 : qestWgtVal
            // 설문지 일련번호 : subyTmplSeq
            // 질문 일련번호 : qestSeq
            // 답변 일련번호 : answSeq
            // 답변점수 : answScoreVal

            tmpQestWgtVal = campaignResultVO.getQestWgtVal();//가중치값 setting
            tmpStsfIvstSeq = campaignResultVO.getStsfIvstSeq();//만족도조사 일련번호
            tmpSubyTmplSeq = campaignResultVO.getSubyTmplSeq();//설문지 일련번호
            tmpCustNo = campaignResultVO.getEmpId();//사원ID
            stsfIvstYn = campaignResultVO.getStsfIvstYn();//만족여부
            cmplReasonCont = campaignResultVO.getCmplReasonCont();//총결
            makCd = campaignResultVO.getMakCd(); //캠페인코드

            if("01".equals(campaignResultVO.getQestTpCd())){
                // 01:객관식 단답형
                score = campaignResultVO.getAnswScoreVal();
                sc = (double)tmpQestWgtVal/100;
                ts =  score * sc;
                tmpTotScore += (double)(ts);

            }
            if("02".equals(campaignResultVO.getQestTpCd())){
                // 02:객관식 다답형(현재는 100점 만점의 기준이 없기 때문에 개별 선택한 값에서 개별 점수를 합산 - 추후 변경)

                //tmpTotScore += satisFactionMobileVO.getAnswScoreVal()*(tmpQestWgtVal/100);
                score = campaignResultVO.getAnswScoreVal();
                sc = (double)tmpQestWgtVal/100;
                ts =  score * sc;
                tmpTotScore += (double)(ts);

            }
            //설문 응답 상세정보 저장
            insertCampaignAnswerSurvey(campaignResultVO);
        }

        //3. 설문결과 합산점수 등록
        SatisFactionMobileResultVO resultVO = new SatisFactionMobileResultVO();
        resultVO.setDlrCd(dlrCd);//딜러코드
        resultVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);//만족도조사 결과일련번호
        resultVO.setStsfIvstSeq(tmpStsfIvstSeq);//만족도조사 일련번호
        resultVO.setSubyTmplSeq(tmpSubyTmplSeq);//설문템플릿 일련번호
        resultVO.setEmpId(tmpCustNo);//고객번호
        resultVO.setStsfIvstScoreVal(tmpTotScore); // 만족도조사 점수값
        resultVO.setStsfIvstEmpId(LoginUtil.getUserId());
        resultVO.setRegUsrId(LoginUtil.getUserId());
        resultVO.setStsfIvstYn(stsfIvstYn);//만족여부
        resultVO.setCmplReasonCont(cmplReasonCont);//총결

        satisFactionMobileResultService.insertSurveyResult(resultVO);


        //4. 캠페인 설문결과 등록
        CampaignResultVO tempVO = new CampaignResultVO();
        tempVO.setDlrCd(dlrCd);//딜러코드
        tempVO.setMakCd(makCd);//캠페인코드
        tempVO.setIvstTp("01");//조사유형
        tempVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);//만족도조사 결과일련번호
        tempVO.setEmpId(tmpCustNo);//사원ID
        tempVO.setRegUsrId(LoginUtil.getUserId());

        campaignResultDAO.insertCropSaleEmpSurvey(tempVO);
    }

    /**
     * 설문에 응답한 답변들을 등록 처리한다.(영업사원 설문)
     * @param CampaignResultVO
     */
    @Override
    public void multiCampaign02AnswerSurveys(BaseSaveVO<CampaignResultVO> obj) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        //1. 설문결과 Seq생성
        SatisFactionMobileResultSearchVO searchVO = new SatisFactionMobileResultSearchVO();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsPltCd(pltCd);
        int stsfIvstRsltSeq = satisFactionMobileResultService.selectStsfIvstRsltSeq(searchVO);


        //2. 설문응답 상세등록
        double tmpTotScore = 0;
        int tmpQestWgtVal = 0;
        int tmpStsfIvstSeq = 0;
        int tmpSubyTmplSeq = 0;
        String tmpCustNo = "";
        String stsfIvstYn = "";
        String cmplReasonCont = "";
        String makCd = "";
        double score = 0;
        double sc = 0;
        double ts = 0;

        //응답한 답변 갯수만큼 for
        for(CampaignResultVO campaignResultVO : obj.getInsertList()){
            campaignResultVO.setRegUsrId(LoginUtil.getUserId());
            campaignResultVO.setDlrCd(dlrCd);
            campaignResultVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);

            // 질문유형 코드 : qestTpCd
            // 가중치 : qestWgtVal
            // 설문지 일련번호 : subyTmplSeq
            // 질문 일련번호 : qestSeq
            // 답변 일련번호 : answSeq
            // 답변점수 : answScoreVal

            tmpQestWgtVal = campaignResultVO.getQestWgtVal();//가중치값 setting
            tmpStsfIvstSeq = campaignResultVO.getStsfIvstSeq();//만족도조사 일련번호
            tmpSubyTmplSeq = campaignResultVO.getSubyTmplSeq();//설문지 일련번호
            tmpCustNo = campaignResultVO.getEmpId();//사원ID
            stsfIvstYn = campaignResultVO.getStsfIvstYn();//만족여부
            cmplReasonCont = campaignResultVO.getCmplReasonCont();//총결
            makCd = campaignResultVO.getMakCd(); //캠페인코드

            if("01".equals(campaignResultVO.getQestTpCd())){
                // 01:객관식 단답형
                score = campaignResultVO.getAnswScoreVal();
                sc = (double)tmpQestWgtVal/100;
                ts =  score * sc;
                tmpTotScore += (double)(ts);

            }
            if("02".equals(campaignResultVO.getQestTpCd())){
                // 02:객관식 다답형(현재는 100점 만점의 기준이 없기 때문에 개별 선택한 값에서 개별 점수를 합산 - 추후 변경)

                //tmpTotScore += satisFactionMobileVO.getAnswScoreVal()*(tmpQestWgtVal/100);
                score = campaignResultVO.getAnswScoreVal();
                sc = (double)tmpQestWgtVal/100;
                ts =  score * sc;
                tmpTotScore += (double)(ts);

            }
            //설문 응답 상세정보 저장
            insertCampaignAnswerSurvey(campaignResultVO);
        }

        //3. 설문결과 합산점수 등록
        SatisFactionMobileResultVO resultVO = new SatisFactionMobileResultVO();
        resultVO.setDlrCd(dlrCd);//딜러코드
        resultVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);//만족도조사 결과일련번호
        resultVO.setStsfIvstSeq(tmpStsfIvstSeq);//만족도조사 일련번호
        resultVO.setSubyTmplSeq(tmpSubyTmplSeq);//설문템플릿 일련번호
        resultVO.setEmpId(tmpCustNo);//고객번호
        resultVO.setStsfIvstScoreVal(tmpTotScore); // 만족도조사 점수값
        resultVO.setStsfIvstEmpId(LoginUtil.getUserId());
        resultVO.setRegUsrId(LoginUtil.getUserId());
        resultVO.setStsfIvstYn(stsfIvstYn);//만족여부
        resultVO.setCmplReasonCont(cmplReasonCont);//총결

        satisFactionMobileResultService.insertSurveyResult(resultVO);


        //4. 캠페인 설문결과 등록
        CampaignResultVO tempVO = new CampaignResultVO();
        tempVO.setDlrCd(dlrCd);//딜러코드
        tempVO.setMakCd(makCd);//캠페인코드
        tempVO.setIvstTp("02");//조사유형
        tempVO.setStsfIvstRsltSeq(stsfIvstRsltSeq);//만족도조사 결과일련번호
        tempVO.setEmpId(tmpCustNo);//사원ID
        tempVO.setRegUsrId(LoginUtil.getUserId());

        campaignResultDAO.insertCropSaleEmpSurvey(tempVO);
    }

    /**
     * 설문 응답 정보를 등록한다.
     * @param satisFactionMonileVO - 등록할 정보가 담긴 SatisFactionMobileVO
     * @return 등록된 목록수
     */
    @Override
    public int insertCampaignAnswerSurvey(CampaignResultVO campaignResultVO) throws Exception {
        dataSourceMessageSource.clearCache();

        return campaignResultDAO.insertCampaignAnswerSurvey(campaignResultVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public CampaignResultVO selectPrsnContByKey(CampaignResultSearchVO searchVO) throws Exception {
        return campaignResultDAO.selectPrsnContByKey(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertPrsnCont(CampaignResultVO campaignResultVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(campaignResultVO.getDlrCd())){campaignResultVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(campaignResultVO.getPltCd())){campaignResultVO.setPltCd(LoginUtil.getPltCd());}

        return campaignResultDAO.insertPrsnCont(campaignResultVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updatePrsnCont(CampaignResultVO campaignResultVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(campaignResultVO.getDlrCd())){campaignResultVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(campaignResultVO.getPltCd())){campaignResultVO.setPltCd(LoginUtil.getPltCd());}

        return campaignResultDAO.updatePrsnCont(campaignResultVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CampaignResultVO selectCrmDefultTargSum(CampaignResultVO campaignResultVO) throws Exception {

        campaignResultDAO.selectCrmDefultTargSum(campaignResultVO);

        return campaignResultVO;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        String sExcelTp = "";
        if (StringUtils.isNotEmpty((String)params.get("sExcelTp"))) {
            sExcelTp = (String)params.get("sExcelTp");
            params.remove("sExcelTp");
        }

        CampaignResultSearchVO searchVO = new CampaignResultSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        if (StringUtils.isNotEmpty((String)params.get("sStartDt"))) {
            searchVO.setsStartDt(DateUtil.convertToDate((String)params.get("sStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sEndDt"))) {
            searchVO.setsEndDt(DateUtil.convertToDate((String)params.get("sEndDt")));
        }
        List<CampaignResultVO> list = null;
        if (StringUtils.isNotEmpty(sExcelTp)) {
            if ("CampaignRltMgmtList".equals(sExcelTp)) {  // 캠페인결과 관리 다운로드
                list = selectCampaignResultsByCondition(searchVO);
            }
        }

        context.putVar("items", list);

    }
}