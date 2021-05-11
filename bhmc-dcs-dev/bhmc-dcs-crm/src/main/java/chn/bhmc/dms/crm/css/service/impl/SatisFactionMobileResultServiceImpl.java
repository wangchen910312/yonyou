package chn.bhmc.dms.crm.css.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionMobileResultDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO;

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
public class SatisFactionMobileResultServiceImpl extends HService implements SatisFactionMobileResultService {
    /**
     * 만족도 결과 DAO
     */
    @Resource(name="satisFactionMobileResultDAO")
    SatisFactionMobileResultDAO satisFactionMobileResultDAO;


    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 만족도설문결과 정보를 등록한다.
     * @param satisFactionMobileResultVO - 등록할 정보가 담긴 SatisFactionMobileResultVO
     * @return 등록된 목록수
     */
    @Override
    public int insertSurveyResult(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        dataSourceMessageSource.clearCache();

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

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSatisFactionPresentsByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public int selectSatisFactionPresentsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        // TODO 만족도 조사결과현황과,만족도 조사관리, 만족도조사 낮은 점수 처리관리에서 같이 사용하는 쿼리 VOC_YN으로 나뉘어짐
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionMobileResultDAO.selectSatisFactionPresentsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSatisFactionPresentsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public List<SatisFactionMobileResultVO> selectSatisFactionPresentsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        // TODO 만족도 조사결과현황과,만족도 조사관리, 만족도조사 낮은 점수 처리관리에서 같이 사용하는 쿼리 VOC_YN으로 나뉘어짐
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionMobileResultDAO.selectSatisFactionPresentsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSatisFactionPresentsByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public int selectSurveyResultsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionMobileResultDAO.selectSurveyResultsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSatisFactionPresentsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public List<SatisFactionMobileResultVO> selectSurveyResultsByCondition(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionMobileResultDAO.selectSurveyResultsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#updateSatisFactionPresent(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
    @Override
    public int updateSatisFactionPresent(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        // TODO Auto-generated method stub
        satisFactionMobileResultVO.setUpdtUsrId(LoginUtil.getUserId());
        return satisFactionMobileResultDAO.updateSatisFactionPresent(satisFactionMobileResultVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#selectSurveyCustResultsByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultSearchVO)
     */
    @Override
    public int selectSurveyCustResultsByConditionCnt(SatisFactionMobileResultSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
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
        // TODO Auto-generated method stub
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
        // TODO Auto-generated method stub
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
        // TODO Auto-generated method stub
        return satisFactionMobileResultDAO.deleteSatisFactionMobileResult(satisFactionMobileResultVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#updateCallCenRslt(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
    @Override
    public int updateCallCenRslt(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        // TODO Auto-generated method stub
        return satisFactionMobileResultDAO.updateCallCenRslt(satisFactionMobileResultVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionMobileResultService#updateStsfResultInvalidity(chn.bhmc.dms.crm.css.vo.SatisFactionMobileResultVO)
     */
    @Override
    public int updateStsfResultInvalidity(SatisFactionMobileResultVO satisFactionMobileResultVO) throws Exception {
        // TODO Auto-generated method stub
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
        // TODO Auto-generated method stub
        return satisFactionMobileResultDAO.updateCallCenRsltCont(satisFactionMobileResultVO);
    }


}
