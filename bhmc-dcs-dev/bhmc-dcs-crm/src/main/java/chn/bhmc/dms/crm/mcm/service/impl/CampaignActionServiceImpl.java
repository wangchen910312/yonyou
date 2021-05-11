package chn.bhmc.dms.crm.mcm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.mcm.service.CampaignActionService;
import chn.bhmc.dms.crm.mcm.service.dao.CampaignActionDAO;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionVO;

/**
 * 캠페인실행 관리 서비스 구현 클래스
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

@Service("campaignActionService")
public class CampaignActionServiceImpl extends HService implements CampaignActionService{

    /**
     * 캠페인실행 관리 DAO
     */
    @Resource(name="campaignActionDAO")
    CampaignActionDAO campaignActionDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignActionsByConditionCnt(CampaignActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignActionDAO.selectCampaignActionsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CampaignActionVO> selectCampaignActionsByCondition(CampaignActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignActionDAO.selectCampaignActionsByCondition(searchVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int selectActionsByConditionCnt(CampaignActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignActionDAO.selectActionsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CampaignActionVO> selectActionsByCondition(CampaignActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignActionDAO.selectActionsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateCampaignExtrTargetSmsSend(CampaignActionVO campaignActionVO) throws Exception {

        if (StringUtils.isEmpty(campaignActionVO.getDlrCd())){campaignActionVO.setDlrCd(LoginUtil.getDlrCd());}
        return campaignActionDAO.updateCampaignExtrTargetSmsSend(campaignActionVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateGroupCampaignExtrTargetSmsSend(CampaignActionVO campaignActionVO) throws Exception {

        if (StringUtils.isEmpty(campaignActionVO.getDlrCd())){campaignActionVO.setDlrCd(LoginUtil.getDlrCd());}
        return campaignActionDAO.updateGroupCampaignExtrTargetSmsSend(campaignActionVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int selectActionRecordsByConditionCnt(CampaignActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignActionDAO.selectActionRecordsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CampaignActionVO> selectActionRecordsByCondition(CampaignActionSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return campaignActionDAO.selectActionRecordsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CampaignActionVO selectCallCenterSends(CampaignActionVO campaignActionVO) throws Exception {

/*
        {call P_CALLCENTER_SEND (
          #{dlrCd, mode=IN, jdbcType=VARCHAR}                   // 딜러코드
        , #{custExtrTermNo, mode=IN, jdbcType=VARCHAR}          // 고객추출조건번호
        , #{refKeyNm, mode=IN, jdbcType=VARCHAR}                // 고객케어 일련번호
        , #{extrDgreCnt, mode=IN, jdbcType=VARCHAR}             // 추출차수
        , #{bizCd, mode=IN, jdbcType=VARCHAR}                   // 업무코드
        , #{regUsrId, mode=IN, jdbcType=VARCHAR}                // 등록
        , #{updtUsrId, mode=IN, jdbcType=VARCHAR}               // 수정
        , #{result, mode=OUT, jdbcType=VARCHAR}                 // 성공 : 00  / 실패 : 다른숫자.
        )}
        */

        campaignActionDAO.selectCallCenterSends(campaignActionVO);

        return campaignActionVO;
    }

    /*
     * 콜센터 콜처리완료여부(CALL_PROC_END_YN)가 Y 이면 콜내용(CALL_CONT)을 각 업무 콜센터결과내용(CALL_CEN_RSLT_CONT) 에 업데이트 해준다.
     */
    @Override
    public int updateCallCenRsltCont(CampaignActionVO campaignActionVO) throws Exception {
        return campaignActionDAO.updateCallCenRsltCont(campaignActionVO);
    }

    /*
     * 판매결과내용(SALE_RSLT_CONT)을 업데이트 해준다.
     */
    @Override
    public int updateSaleRsltCont(CampaignActionVO campaignActionVO) throws Exception {
        return campaignActionDAO.updateSaleRsltCont(campaignActionVO);
    }

    /*
     * 정비결과내용(SER_RSLT_CONT)을 업데이트 해준다.
     */
    @Override
    public int updateSerRsltCont(CampaignActionVO campaignActionVO) throws Exception {
        return campaignActionDAO.updateSerRsltCont(campaignActionVO);
    }

    /**
     * 조회 조건에 해당하는 캠페인실행자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return 조회 목록
     */
    @Override
    public CampaignActionVO selectActionByKey(CampaignActionSearchVO searchVO) throws Exception {
 
        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}
        
        return campaignActionDAO.selectActionByKey(searchVO);
    }
}