package chn.bhmc.dms.crm.css.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionResultMgmtDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultVO;

/**
 * 만족도 조사 결과 관리에 관한 데이터처리 매퍼 클래스
 *
 *    File Name : SatisFactionResultMgmtDAO
 *    Description : 만족도 조사 결과관리
 *    author LEE Kyo Jin
 *    since 2016. 03. 04.
 *    version 1.0
 *    Modification Information
 *       since          author              description
 *    ===========    =============    ===========================
 *    2016. 03. 04.    LEE Kyo Jin    최초 생성
 */

@Service("satisFactionResultMgmtService")
public class SatisFactionResultMgmtServiceImpl extends HService implements SatisFactionResultMgmtService {

    /**
     * 만족도 조사 결과 관리 DAO
     */
    @Resource(name="satisFactionResultMgmtDAO")
    SatisFactionResultMgmtDAO satisFactionResultMgmtDAO;

    /**
     * 만족도 설문 결과 DAO
     */
    @Resource(name="satisFactionMobileResultService")
    SatisFactionMobileResultService satisFactionMobileResultService;


    /**
     * 설문 질문 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 설문 질문 서비스
     */
    @Resource(name="surveyQuestionService")
    SurveyQuestionService surveyQuestionService;

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultMgmtByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO)
     */
    @Override
    public int selectSatisFactionResultMgmtByConditionCnt(SatisFactionResultMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultMgmtByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultMgmtByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO)
     */
    @Override
    public List<SatisFactionResultMgmtVO> selectSatisFactionResultMgmtByCondition(
            SatisFactionResultMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#insertSatisFactionResultMgmt(chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO)
     */
    @Override
    public int insertSatisFactionResultMgmt(SatisFactionResultMgmtVO satisFactionResultMgmtVO) throws Exception {

        if (StringUtils.isEmpty(satisFactionResultMgmtVO.getDlrCd())){satisFactionResultMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(satisFactionResultMgmtVO.getRegUsrId())){satisFactionResultMgmtVO.setRegUsrId(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(satisFactionResultMgmtVO.getUpdtUsrId())){satisFactionResultMgmtVO.setUpdtUsrId(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.insertSatisFactionResultMgmt(satisFactionResultMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultDtlMgmtByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO)
     */
    @Override
    public int selectSatisFactionResultDtlMgmtByConditionCnt(SatisFactionResultDtlMgmtSearchVO searchVO)
            throws Exception {

        /**
         * DCS에서는 딜러코드 셋팅하면 안됨.
         * DMS에만 딜러코드 셋팅
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultDtlMgmtByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultDtlMgmtByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO)
     */
    @Override
    public List<SatisFactionResultDtlMgmtVO> selectSatisFactionResultDtlMgmtByCondition(
            SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultDtlMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#insertSatisFactionResultDtlMgmt(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO)
     */
    @Override
    public int insertSatisFactionResultDtlMgmt(SatisFactionResultDtlMgmtVO satisFactionResultDtlMgmtVO)
            throws Exception {
        if (StringUtils.isEmpty(satisFactionResultDtlMgmtVO.getRegUsrId())){satisFactionResultDtlMgmtVO.setRegUsrId(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(satisFactionResultDtlMgmtVO.getUpdtUsrId())){satisFactionResultDtlMgmtVO.setUpdtUsrId(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.insertSatisFactionResultDtlMgmt(satisFactionResultDtlMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultDtlHeaderMgmtByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO)
     */
    @Override
    public List<String> selectSatisFactionResultDtlHeaderMgmtByCondition(
            SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return satisFactionResultMgmtDAO.selectSatisFactionResultDtlHeaderMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectStrOrdOcnBlockingsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO)
     */
    @Override
    public Map<String, List> selectSatisFactionResultDtlDataSetMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO)
            throws Exception {

        Map<String, List> map = new HashMap<String, List>();

        /**
         * DCS에서는 딜러코드 셋팅하면 안됨.
         * DMS에만 딜러코드 셋팅
         */
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<String> columnList = satisFactionResultMgmtDAO.selectSatisFactionResultDtlHeaderMgmtByCondition(searchVO);

        int maxSize = columnList.size();

        map.put("columnList", columnList);

        List<SatisFactionResultDtlMgmtVO> voList = satisFactionResultMgmtDAO.selectSatisFactionResultDtlMgmtByCondition(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;

        for(SatisFactionResultDtlMgmtVO vo : voList) {
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            hMap.put("dlrCd", vo.getDlrCd());
            hMap.put("C"+columnList.indexOf(vo.getHeaderCont()), vo.getVal());

            if (count == maxSize) {
                resultList.add(hMap);
                count = 0;
            }
        }

        map.put("dataSet", resultList);

        return map;
    }

    /**
     * 만족도 조사 결과 데이터를 조회한다. - 만족도 조사 설문지 및 결과 조회 [OB실행>상세팝업>만족도조사탭], [캠페인결과관리>업체평가], ]캠페인관리>결과>업체평가 ]
     *
     * @return
     */
    @Override
    public Map<String, Object> selectSurveyAnswerResultByCodition(CampaignResultSearchVO searchVO) throws Exception {

        int seq = searchVO.getsSeq();
        int stsfIvstRsltSeq = searchVO.getsStsfIvstRsltSeq();
        int subyTmplSeq = 0;

        SatisFactionMobileSearchVO schMobileVO = new SatisFactionMobileSearchVO();
        schMobileVO.setsSeq(seq);
        SatisFactionManageVO manageVO = satisFactionManageService.selectSurveyCdByKey(schMobileVO);

        subyTmplSeq = Integer.parseInt(manageVO.getSubyTmplSeq());

        //만족도에 매핑된 설문조사 조회후 키값을 setting
        SurveySatisFactionSearchVO schVO = new SurveySatisFactionSearchVO();
        schVO.setsSeq(seq);
        schVO.setsSubyTmplSeq(subyTmplSeq);

        //1. setting된 key값으로 QustionList조회
        List<SurveySatisFactionVO> questionList = new ArrayList<SurveySatisFactionVO>();
        Map<String, Object> result = new HashMap<String, Object>();
        questionList = surveyQuestionService.selectSurveyQuestionViewByCondition(schVO);
        if(questionList != null && questionList.size() != 0){
            result.put("questionList",questionList);
        }

        //2. setting된 key값으로 AnswerList조회
        List<CampaignResultVO> answerList = new ArrayList<CampaignResultVO>();
        CampaignResultSearchVO campaignResultSearchVO = new CampaignResultSearchVO();
        campaignResultSearchVO.setsSeq(seq);
        campaignResultSearchVO.setsSubyTmplSeq(subyTmplSeq);
        campaignResultSearchVO.setsCallSeq(searchVO.getsCallSeq());
        campaignResultSearchVO.setsBizCd(searchVO.getsBizCd());
        campaignResultSearchVO.setsIvstTp(searchVO.getsIvstTp());
        campaignResultSearchVO.setsMakCd(searchVO.getsMakCd());
        campaignResultSearchVO.setsEmpId(searchVO.getsEmpId());


        answerList = surveyQuestionService.selectSurveyAnswerByCondition(campaignResultSearchVO);
        if(answerList != null && answerList.size() != 0){
            result.put("answerList",answerList);
        }

        result.put("subyTmplSeq",manageVO.getSubyTmplSeq()); //설문 템플릿 일련번호

        // 만족도조사 결과 조회
        SatisFactionMobileResultSearchVO satisFactionMobileResultSearchVO = new SatisFactionMobileResultSearchVO();
        satisFactionMobileResultSearchVO.setsStsfIvstSeq(seq);
        satisFactionMobileResultSearchVO.setsSubyTmplSeq(subyTmplSeq);
        satisFactionMobileResultSearchVO.setsStsfIvstRsltSeq(stsfIvstRsltSeq);
        SatisFactionMobileResultVO satisFactionMobileResultVO = satisFactionMobileResultService.selectSurveyResultInfoByKey(satisFactionMobileResultSearchVO);
        if ( satisFactionMobileResultVO != null ) {
            result.put("satisFactionMobileResultVO",satisFactionMobileResultVO);
        };

        return result;
    }

}
