package chn.bhmc.dms.crm.css.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionManageService;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.SurveyQuestionService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionMobileResultDAO;
import chn.bhmc.dms.crm.css.service.dao.SurveyQuestionDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionManageVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionSearchVO;
import chn.bhmc.dms.crm.css.vo.SurveySatisFactionVO;

/**
 * 만족도설문결과  서비스
 *
 * @author hyun ho kim
 * @since 2016. 03. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.18         hyun ho kim            최초 생성
 * </pre>
 */

@Service("satisFactionMobileResultService")
public class SatisFactionMobileResultServiceImpl extends HService implements SatisFactionMobileResultService, JxlsSupport {
    /**
     * 만족도 결과 DAO
     */
    @Resource(name="satisFactionMobileResultDAO")
    SatisFactionMobileResultDAO satisFactionMobileResultDAO;

    /**
     * 설문 질문 서비스
     */
    @Resource(name="satisFactionManageService")
    SatisFactionManageService satisFactionManageService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;
    @Resource(name="surveyQuestionDAO")
	SurveyQuestionDAO surveyQuestionDAO;
    /**
     * 만족도설문결과 정보를 등록한다.
     * @param satisFactionMobileResultVO - 등록할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    @Override
    public int insertSurveyResult(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {

        return satisFactionMobileResultDAO.insertSurveyResult(satisFactionMobileResultVO);
    }

    /**
     * 만족도설문 결과 등록을 위한 시퀀스 추출
     * @param satisFactionMonileSearchVO - 조회할 정보가 담긴 atisFactionMonileSearchVO
     * @return 등록된 일련번호
     */
    @Override
    public int selectStsfIvstRsltSeq(SatisFactionMobileResultSearchVO satisFactionMobileSearchVO) throws Exception {
        return satisFactionMobileResultDAO.selectStsfIvstRsltSeq(satisFactionMobileSearchVO);
    }

    /**
     * 설문결과가 있는지 확인여부
     * @param satisFactionMobileSearchVO - 조회할 정보가 담긴 SatisFactionMobileResultSearchVO
     * @return 확인여부
     */
    @Override
    public int selectUseSurvey(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        return satisFactionMobileResultDAO.selectUseSurvey(searchVO);
    }

    /**
     * 설문결과 응답한 문항까지 있는지 확인여부
     * @param satisFactionMobileSearchVO - 조회할 정보가 담긴 SatisFactionMobileResultSearchVO
     * @return 확인여부
     */
    @Override
    public int selectUseSurveyDetail(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        return satisFactionMobileResultDAO.selectUseSurveyDetail(searchVO);
    }

    /**
     * 만족도 조사 결과 현황, 만족도조사 낮은점수 처리 관리 목록 수량 ( VOC_YN으로 나뉘어짐 )
     * @param SatisFactionMobileResultSearchVO - 조회할 정보가 담긴 SatisFactionMobileResultSearchVO
     * @return 만족도 조사 결과, 만족도 조사 낮은점수 처리 관리 목록 수량
     */
    @Override
    public int selectSatisFactionPresentsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectSatisFactionPresentsByConditionCnt(searchVO);
    }

    /**
     * 만족도 조사 결과 현황, 만족도조사 낮은점수 처리 관리 목록 ( VOC_YN으로 나뉘어짐 )
     * @param SatisFactionMobileResultSearchVO - 조회할 정보가 담긴 SatisFactionMobileResultSearchVO
     * @return 만족도 조사 결과, 만족도 조사 낮은점수 처리 관리 목록
     */
    @Override
    public List<SatisFactionMobileResultVO> selectSatisFactionPresentsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectSatisFactionPresentsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSurveyResultsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public List<SatisFactionMobileResultVO> selectSurveyResultsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectSurveyResultsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#updateSatisFactionPresent(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
    @Override
    public int updateSatisFactionPresent(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        satisFactionMobileResultVO.setUpdtUsrId(LoginUtil.getUserId());
        return satisFactionMobileResultDAO.updateSatisFactionPresent(satisFactionMobileResultVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSurveyCustResultsByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public int selectSurveyCustResultsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectSurveyCustResultsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSurveyCustResultsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public List<SatisFactionMobileResultVO> selectSurveyCustResultsByCondition(SatisFactionMobileResultSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectSurveyCustResultsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#insertSatisFactionManageTargExtUsr(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
    @Override
    public int insertSatisFactionManageTargExtUsr(SatisFactionMobileResultVO resultVO)
            throws Exception {
        return satisFactionMobileResultDAO.insertSatisFactionManageTargExtUsr(resultVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#multiExtrUsrs(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiExtrUsrs(BaseSaveVO<SatisFactionMobileResultVO> obj) throws Exception {
        SatisFactionMobileResultSearchVO searchVO = new SatisFactionMobileResultSearchVO();
        //삭제할 대상자 인원수만큼 for
        for(SatisFactionMobileResultVO resultVO : obj.getDeleteList()){

            // 삭제전 해당 인원이 설문을 진행했는지 확인
            searchVO.setsDlrCd(resultVO.getDlrCd());
            searchVO.setsStsfIvstRsltSeq(resultVO.getStsfIvstRsltSeq());
            searchVO.setsStsfIvstSeq(resultVO.getStsfIvstSeq());
            searchVO.setsSubyTmplSeq(resultVO.getSubyTmplSeq());
            searchVO.setsCustNo(resultVO.getCustNo());
            int cnt = satisFactionMobileResultDAO.selectUseSurveyDetail(searchVO);
            if(cnt == 0){
                deleteSatisFactionMobileResult(resultVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#deleteSatisFactionMobileResult(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
    @Override
    public int deleteSatisFactionMobileResult(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        return satisFactionMobileResultDAO.deleteSatisFactionMobileResult(satisFactionMobileResultVO);
    }

    /*  20170705 이인문 사용안함
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#updateCallCenRslt(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
//    @Override
//    public int updateCallCenRslt(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
//        return satisFactionMobileResultDAO.updateCallCenRslt(satisFactionMobileResultVO);
//    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#updateStsfResultInvalidity(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
    @Override
    public int updateStsfResultInvalidity(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        satisFactionMobileResultVO.setUpdtUsrId(LoginUtil.getUserId());
        return satisFactionMobileResultDAO.updateStsfResultInvalidity(satisFactionMobileResultVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#multiStsfResultInvalidity(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiStsfResultInvalidity(BaseSaveVO<SatisFactionMobileResultVO> obj) throws Exception {
        //수정할 조사결과 무효처리 인원수만큼 for
        for(SatisFactionMobileResultVO resultVO : obj.getUpdateList()){
            updateStsfResultInvalidity(resultVO);
        }
        //[TODO]조사결과 무효처리를 하고 다시 조회하여 점수를 재 계산한다.(아직 픽스되지 않아서 추후로직 추가해야함)
    }


    /**
     * 만족도 설문결과 점수정보를 수정한다.
     * @param satisFactionMobileResultVO - 수정할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    @Override
    public int updateSurveyResultScore(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        return satisFactionMobileResultDAO.updateSurveyResultScore(satisFactionMobileResultVO);
    }

    /**
     * 만족도설문결과 정보를 등록한다.
     * @param satisFactionMobileResultVO - 등록할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    @Override
    public int updateVocResult(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        if(satisFactionMobileResultVO.getVocProcId() == null || satisFactionMobileResultVO.getVocProcId() == ""){
            satisFactionMobileResultVO.setVocProcId(LoginUtil.getUserNm());
        }
        satisFactionMobileResultVO.setUpdtUsrId(LoginUtil.getUserId());
        return satisFactionMobileResultDAO.updateVocResult(satisFactionMobileResultVO);
    }

    /*
     * 콜센터 콜처리완료여부(CALL_PROC_END_YN)가 Y 이면 콜내용(CALL_CONT)을 각 업무 콜센터결과내용(CALL_CEN_RSLT_CONT) 에 업데이트 해준다.
     */
    @Override
    public int updateCallCenRsltCont(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        return satisFactionMobileResultDAO.updateCallCenRsltCont(satisFactionMobileResultVO);
    }

    /**
     * 만족도 조사 객관식 답안결과 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SatisFactionMobileResultSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SurveySatisFactionVO> selectShortQuestionResultsByCondition(SurveySatisFactionSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectShortQuestionResultsByCondition(searchVO);
    }

    /**
     * 만족도 조사 결과 상세 목록
     * @param searchVO - sStsfIvstSeq(만족도 조사 일련번호), sQestTp(질문유형)
     * @return 질문 목록을 컬럼으로 변경 + 만족도 조사 정보 및 답변
     */
    @Override
    public Map<String, List> selectSurveyResultDtlCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception {

        if( StringUtils.isEmpty(searchVO.getsQestTp()) ){
            // [질문유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.qestTpCd", null, LocaleContextHolder.getLocale())});
        };

        if( searchVO.getsStsfIvstSeq() < 0 ){
            // [만족도 조사 일련번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.stsfIvstSeq", null, LocaleContextHolder.getLocale())});
        };

        Map<String, List> map = new HashMap<String, List>();

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}

        // 만족도 조사 상세 정보 목록 ( 대상자 )
        List<SatisFactionMobileResultVO> voList = selectSurveyResultDtlInfoByCondition(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;
        
        //-----liuxueying update start
        List<String> questContList = new ArrayList<String>();
        List<String> questSeqsList = new ArrayList<String>();
        
        SurveySatisFactionSearchVO schVO = new SurveySatisFactionSearchVO();
        if(voList != null && voList.size() > 0){
        	schVO.setsSeq(voList.get(0).getStsfIvstSeq());
            schVO.setsSubyTmplSeq(voList.get(0).getSubyTmplSeq());
            schVO.setsQestTp(searchVO.getsQestTp());
            schVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        List<SurveySatisFactionVO> questionList  = surveyQuestionDAO.selectSurveyQuestionViewByCondition(schVO);
        for(int i =0 ;i<questionList.size();i++){
        	 String questStr = "Q"+(i+1)+". "+questionList.get(i).getQestCont();
        	 questContList.add(questStr);
        	 questSeqsList.add(""+questionList.get(i).getSubyTmplQestSeq());
        }
        //------liuxueying update end
        
        for(SatisFactionMobileResultVO infoVO : voList) {

            // 답변 요약 정보를 을 생성한다.
            hMap = new HashMap<String, String>();
            hMap.put("dlrCd", infoVO.getDlrCd()); // 딜러코드
            hMap.put("rnum", String.valueOf(infoVO.getRnum())); // No
            hMap.put("custNm", infoVO.getCustNm()); // 고객명
            hMap.put("hpNo", infoVO.getHpNo()); // 휴대전화
            hMap.put("stsfIvstDt", DateUtil.getDate(infoVO.getStsfIvstDt(),systemConfigInfoService.selectStrValueByKey("dateFormat") + " " + systemConfigInfoService.selectStrValueByKey("timeFormat")));   // 만족도 조사일
            hMap.put("usrNm", infoVO.getUsrNm()); // 만족도 조사인
            hMap.put("stsfIvstYnNm", infoVO.getStsfIvstYnNm()); // 만족여부
            hMap.put("cmplReasonCont", infoVO.getCmplReasonCont()); // 총결

            hMap.put("purcMngNm", infoVO.getPurcMngNm()); // 구매담당자 명
            hMap.put("useCustNm", infoVO.getUseCustNm()); // 방문자명
            hMap.put("useHpNo", infoVO.getUseHpNo()); // 방문자 이동전화
            hMap.put("mngUsrNm", infoVO.getMngUsrNm()); // 담당자

            // 만족도 조사 질문 목록
            searchVO.setsStsfIvstSeq(infoVO.getStsfIvstSeq());
            searchVO.setsSubyTmplSeq(infoVO.getSubyTmplSeq());
            searchVO.setsStsfIvstRsltSeq(infoVO.getStsfIvstRsltSeq());
            List<SatisFactionMobileResultVO> answerList = satisFactionMobileResultDAO.selectSurveyResultDtlByCondition(searchVO);
            for (SatisFactionMobileResultVO answVO : answerList) {
            	int questIdx = questSeqsList.indexOf(""+answVO.getSubyTmplQestSeq())+1;
                 // 主观题
                if ( "03".equals(answVO.getQestTpCd()) ) {
                    hMap.put("Q"+questIdx, answVO.getSbjvAnswCont());
                } else {//客观题
                    hMap.put("Q"+questIdx, answVO.getAnswCont());
                };

            };
            // 답변 요약 목에 담는다
            resultList.add(hMap);
        };
        map.put("columnList", questContList);
        map.put("dataSet", resultList);

        return map;

    };

    /**
     * 만족도 조사 결과 대상자 정보 목록 수량
     * @param searchVO
     * @return 만족도 조사 결과 대상자 정보 목록 수량
     */
    @Override
    public int selectSurveyResultDtlInfoByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectSurveyResultDtlInfoByConditionCnt(searchVO);
    }

    /**
     * 만족도 조사 결과 대상자 정보 목록
     * @param searchVO
     * @return 만족도 조사 결과 대상자 정보 목록
     */
    @Override
    public List<SatisFactionMobileResultVO> selectSurveyResultDtlInfoByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        return satisFactionMobileResultDAO.selectSurveyResultDtlInfoByCondition(searchVO);
    }



    /*  만족도 조사결과 현황 엑셀 export
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {


        // 엑셀 export는 a href 이기 때문에 exception 메시지는 notification 이 아닌 json 새창으로 나옴 앞단에서 처리해야함.
        SatisFactionMobileResultSearchVO searchVO = new SatisFactionMobileResultSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if ( "M".equals((String)params.get("sExportTp")) || "C".equals((String)params.get("sExportTp")) )  {

            searchVO.setsDlrCd((String)params.get("sDlrCd"));
            searchVO.setsStsfIvstSeq(Integer.parseInt((String)params.get("sStsfIvstSeq")));
            searchVO.setsQestTp((String)params.get("sQestTp"));
            Map<String, List> map = selectSurveyResultDtlCondition(searchVO);

            Map<String, String> qMap = new HashMap<String, String>();
            qMap.put("rnum", "序号");                   // No
            qMap.put("custNm", "客户名");                 // 고객명
            qMap.put("hpNo", "移动电话");                 // 휴대전화
            qMap.put("purcMngNm", "公司联系人"); // 구매담당자 명
            qMap.put("useCustNm", "送修人"); // 방문자명
            qMap.put("useHpNo", "送修人移动电话"); // 방문자 이동전화
            qMap.put("mngUsrNm", "服务顾问/销售顾问"); // 담당자
            qMap.put("stsfIvstDt", "满意度调查日期");      // 만족도 조사일
            qMap.put("usrNm", "满意度调查人");            // 만족도 조사인
            qMap.put("stsfIvstYnNm", "是否满意");       // 만족여부
            qMap.put("cmplReasonCont", "总结");       // 총결

            List<?> qList = map.get("columnList");

            if ( qList != null ) {

                for(int i=0; i<qList.size(); i++){
                    qMap.put("Q"+(i+1), String.valueOf(qList.get(i)));
                }
                List qnaList =  map.get("dataSet");
                qnaList.add(0, qMap);
                context.putVar("items", qnaList);

            }


        } else if ( "S".equals((String)params.get("sExportTp")))  {

            searchVO.setsStsfIvstSeq(Integer.parseInt((String)params.get("sStsfIvstSeq")));

            SatisFactionMobileSearchVO schMobileVO = new SatisFactionMobileSearchVO();
            schMobileVO.setsDlrCd((String)params.get("sDlrCd"));
            schMobileVO.setsSeq(Integer.parseInt((String)params.get("sStsfIvstSeq")));
            schMobileVO.setsQestTp("M");

            SatisFactionManageVO manageVO = satisFactionManageService.selectSurveyCdByKey(schMobileVO);

            if ( manageVO != null) {

                //만족도에 매핑된 설문조사 조회후 키값을 setting
                SurveySatisFactionSearchVO schVO = new SurveySatisFactionSearchVO();
                schVO.setsDlrCd((manageVO.getDlrCd()));
                schVO.setsSubyTmplSeq(Integer.parseInt(manageVO.getSubyTmplSeq()));
                schVO.setsQestTp((String)params.get("sExportTp"));
                schVO.setsStsfIvstSeq(manageVO.getSeq());

                //2. setting된 key값으로 AnswerList조회
                List<SurveySatisFactionVO> answerList = new ArrayList<SurveySatisFactionVO>();
                answerList = selectShortQuestionResultsByCondition(schVO);

                if ( answerList.size() > 0 ) {

                    List<SurveySatisFactionVO> stsfIvstYNList = new ArrayList<SurveySatisFactionVO>();

                    SurveySatisFactionVO stsfIvstYN = new SurveySatisFactionVO();
                    stsfIvstYN.setRnum(answerList.size()+1); // 만족여부
                    stsfIvstYN.setQestCont("是否满意"); // 만족여부
                    stsfIvstYN.setAnswCont("满意");   // 만족
                    stsfIvstYN.setResultCnt(Integer.parseInt(manageVO.getStsfIvstY()));
                    stsfIvstYNList.add(stsfIvstYN);

                    stsfIvstYN = new SurveySatisFactionVO();
                    stsfIvstYN.setRnum(answerList.size()+2); // 만족여부
                    stsfIvstYN.setQestCont("是否满意"); // 만족여부
                    stsfIvstYN.setAnswCont("不满意");  // 불만족
                    stsfIvstYN.setResultCnt(Integer.parseInt(manageVO.getStsfIvstN()));
                    stsfIvstYNList.add(stsfIvstYN);

                    answerList.addAll(stsfIvstYNList);

                    context.putVar("items", answerList);

                }

            }

        } else {

            if ( !"null".equals((String)params.get("sStartDt")) && params.get("sStartDt") != null  ) {
                searchVO.setsStartDt(DateUtil.convertToDate((String)params.get("sStartDt")));
            }
            if ( !"null".equals((String)params.get("sEndDt")) && params.get("sEndDt") != null  ) {
                searchVO.setsEndDt(DateUtil.convertToDate((String)params.get("sEndDt")));
            }
            if ( !"null".equals((String)params.get("sStartVocRegDt")) && params.get("sStartVocRegDt") != null  ) {
                searchVO.setsStartVocRegDt(DateUtil.convertToDate((String)params.get("sStartVocRegDt")));
            }
            if ( !"null".equals((String)params.get("sEndVocRegDt")) && params.get("sEndVocRegDt") != null  ) {
                searchVO.setsEndVocRegDt(DateUtil.convertToDate((String)params.get("sEndVocRegDt")));
            }

            List<SatisFactionMobileResultVO> list = selectSatisFactionPresentsByCondition(searchVO);

            if( list.size() > 0 ){
                context.putVar("items", list);
            }
        }




    }

    /**
     * 만족도 조사 결과 정보
     * @param searchVO
     * @return 만족도 조사 결과 정보
     */
    @Override
    public SatisFactionMobileResultVO selectSurveyResultInfoByKey(SatisFactionMobileResultSearchVO searchVO)
            throws Exception {

        SatisFactionMobileResultVO satisFactionMobileResultVO = new SatisFactionMobileResultVO();

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        satisFactionMobileResultVO = satisFactionMobileResultDAO.selectSurveyResultInfoByKey(searchVO);

        return satisFactionMobileResultVO;

    }

}