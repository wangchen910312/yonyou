package chn.bhmc.dms.crm.mcm.service.impl;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;

import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.context.WebContext;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.fileUpload.FileUploadSaveHandler;
import chn.bhmc.dms.core.support.fileUpload.FileUploadUtils;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtVO;
import chn.bhmc.dms.crm.mcm.service.MarketingCampaignService;
import chn.bhmc.dms.crm.mcm.service.dao.MarketingCampaignCopyDAO;
import chn.bhmc.dms.crm.mcm.service.dao.MarketingCampaignDAO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSaveExVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 마케팅 캠페인 관리 서비스 구현 클래스
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

@Service("marketingCampaignService")
public class MarketingCampaignServiceImpl extends HService implements MarketingCampaignService, JxlsSupport {

    public FileUploadSaveHandler dataSaveStrategy = new FileUploadSaveHandler(){

        @Override
        public Map<String, Object> save(File file) {
            String new_path = file.getAbsolutePath().substring(0, file.getAbsolutePath().length() - ".temp".length());
            file.renameTo(new File(new_path));

            return null;
        }

    };

    public Map<String, Object> saveFileInfo;

    @Resource(name="makNoIdgenService")
    EgovIdGnrService makNoIdgenService;


    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     * 마케팅 캠페인 관리 DAO
     */
    @Resource(name="marketingCampaignDAO")
    MarketingCampaignDAO marketingCampaignDAO;

    /**
     * 마케팅 캠페인 복사 관리 DAO
     */
    @Resource(name="marketingCampaignCopyDAO")
    MarketingCampaignCopyDAO marketingCampaignCopyDAO;

    /**
     * 판매기회 확보유형관리
     */
    @Resource(name="salesOpptHoldTypeMgmtService")
    SalesOpptHoldTypeMgmtService salesOpptHoldTypeMgmtService;

    /**
     * 고객정보관리
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 고객정보관리
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /**
     * 푸쉬알림 service
     */
    @Autowired
    NotificationMessageService notificationMessageService;

    /**
     * 마케팅 캠페인 목록 수량 조회
     */
    @Override
    public int selectMarketingCampaignsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectMarketingCampaignsByConditionCnt(searchVO);
    }

    /**
     * 마케팅 캠페인 목록 조회
     */
    @Override
    public List<MarketingCampaignVO> selectMarketingCampaignsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return marketingCampaignDAO.selectMarketingCampaignsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextMakNo() throws Exception {
        try {
            return makNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
        }
    }

    /**
     * 마케팅 캠페인 등록
     */
    @Override
    public String insertMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception {

        marketingCampaignVO.setMakCd(selectNextMakNo());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        marketingCampaignVO.setLangCd(langCd);

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

        if("".equals(marketingCampaignVO.getRcpeAutoYn())){
            marketingCampaignVO.setRcpeAutoYn("N");           //대상자자동추출여부
        }

//        int duplChk = selectTdrvResvByKeyCnt(testDriveResvVO);
//        if(duplChk > 0) {
            //중복된 데이터가 존재합니다.
//            throw processException("global.err.duplicate");
//        }

        // 마케팅 캠페인 생성
        marketingCampaignDAO.insertMarketingCampaign(marketingCampaignVO);

        // 마케팅 캠페인 신규등록시 기본목표를 자동으로 등록한다.
        marketingCampaignDAO.insertDefaultGoal(marketingCampaignVO);

        return marketingCampaignVO.getMakCd();
    }

    /**
     * 마케팅 캠페인 수정
     */
    @Override
    public String updateMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

        if("".equals(marketingCampaignVO.getRcpeAutoYn())){
            marketingCampaignVO.setRcpeAutoYn("N");           //대상자자동추출여부
        }

//        int duplChk = selectTdrvResvByKeyCnt(testDriveResvVO);
//        if(duplChk > 0) {
            //중복된 데이터가 존재합니다.
//            throw processException("global.err.duplicate");
//        }

        marketingCampaignDAO.updateMarketingCampaign(marketingCampaignVO);

        if("03".equals(marketingCampaignVO.getStatCd())){
            // 확보유형에 등록하기
            MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
            marketingCampaignSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            marketingCampaignSearchVO.setsMakCd(marketingCampaignVO.getMakCd());
            MarketingCampaignVO mCampaignVO = marketingCampaignDAO.selectMarketingCampaignByKey(marketingCampaignSearchVO);

            SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();
            salesOpptHoldTypeMgmtSearchVO.setsDlrCd(marketingCampaignSearchVO.getsDlrCd());
            salesOpptHoldTypeMgmtSearchVO.setsRemark(mCampaignVO.getMakCd());
            int holdTpMgmtCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);

            SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO = new SalesOpptHoldTypeMgmtVO();
            if (holdTpMgmtCnt == 0) {
             // 판매기회 확보유형관리 신규등록
                salesOpptHoldTypeMgmtVO.setHoldTp("03");
                salesOpptHoldTypeMgmtVO.setHoldDetlTpNm(mCampaignVO.getMakNm());
                salesOpptHoldTypeMgmtVO.setRemark(mCampaignVO.getMakCd());
                salesOpptHoldTypeMgmtVO.setDelYn("Y");
                salesOpptHoldTypeMgmtVO.setSortOrder(0);
                salesOpptHoldTypeMgmtVO.setStartDt(mCampaignVO.getStartDt());
                salesOpptHoldTypeMgmtVO.setEndDt(mCampaignVO.getEndDt());
                salesOpptHoldTypeMgmtService.insertSalesOpptHoldType(salesOpptHoldTypeMgmtVO);

            } else {
                List<SalesOpptHoldTypeMgmtVO> salesOpptHoldTypeMgmtVOList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
                // 판매기회 확보유형관리 업데이트
                salesOpptHoldTypeMgmtVO.setHoldSeq(salesOpptHoldTypeMgmtVOList.get(0).getHoldSeq());
                salesOpptHoldTypeMgmtVO.setHoldTp("03");
                salesOpptHoldTypeMgmtVO.setHoldDetlTpNm(mCampaignVO.getMakNm());
                salesOpptHoldTypeMgmtVO.setRemark(mCampaignVO.getMakCd());
                salesOpptHoldTypeMgmtVO.setDelYn("Y");
                salesOpptHoldTypeMgmtVO.setSortOrder(0);
                salesOpptHoldTypeMgmtVO.setStartDt(mCampaignVO.getStartDt());
                salesOpptHoldTypeMgmtVO.setEndDt(mCampaignVO.getEndDt());
                salesOpptHoldTypeMgmtService.updateSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
            }

        }

        // 수정시 마케팅 유형이 다른경우 목표 삭제후 다시 입력
        if ( !marketingCampaignVO.getMakTpCd().equals(marketingCampaignVO.getBefMakTpCd()) ) {
            if( marketingCampaignDAO.deleteDefaultGoal(marketingCampaignVO) > 0 ){
                marketingCampaignDAO.insertDefaultGoal(marketingCampaignVO);
            };
        };

        return marketingCampaignVO.getMakCd();
    }

    /**
     * 마케팅 캠페인 삭제
     */
    @Override
    public int deleteMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

        marketingCampaignDAO.deleteDefaultGoal(marketingCampaignVO);

        return marketingCampaignDAO.deleteMarketingCampaign(marketingCampaignVO);
    }

    /**
     * 마케팅 캠페인 상세조회
     */
    @Override
    public MarketingCampaignVO selectMarketingCampaignByKey(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectMarketingCampaignByKey(searchVO);
    }

    /**
     * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<MarketingCampaignVO> selectMakTpCdListByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return marketingCampaignDAO.selectMakTpCdListByCondition(searchVO);
    }




    /**
     * {@inheritDoc}
     */
    @Override
    public int insertActive(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.insertActive(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateActive(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.updateActive(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteActive(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.deleteActive(marketingCampaignVO);
    }

    /**
     * 마케팅 캠페인 수정(활동방안 탭)
     */
    @Override
    public int updateMarketingCampaignActive(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.updateMarketingCampaignActive(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiActives(MarketingCampaignSaveExVO saveVO) throws Exception {

        MarketingCampaignVO marketingCampaignVO = saveVO.getMarketingCampaignVO();

        String userId = LoginUtil.getUserId();

        marketingCampaignVO.setRegUsrId(userId);
        marketingCampaignVO.setUpdtUsrId(userId);

        updateMarketingCampaignActive(marketingCampaignVO);

        multiActiveExs(saveVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiActiveExs(MarketingCampaignSaveExVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        BaseSaveVO<MarketingCampaignVO>  obj = saveVO.getMarketingCampaignSaveVO();
        String[] lblList = new String[1];

        for(MarketingCampaignVO marketingCampaignVO : obj.getInsertList()){

            // 차종코드 유효성 체크.
            if(marketingCampaignVO.getCarlineCd().equals("")){
                lblList[0] = messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale());  // 차종
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 모델코드 유효성 체크.
            if(marketingCampaignVO.getModelCd().equals("")){
                lblList[0] = messageSource.getMessage("global.lbl.model", null, LocaleContextHolder.getLocale());  // 모델
                throw processException("par.info.issueCheckMsg", lblList);
            }

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setRegUsrId(userId);
            insertActive(marketingCampaignVO);
        }
        for(MarketingCampaignVO marketingCampaignVO : obj.getUpdateList()){

            // 차종코드 유효성 체크.
            if(marketingCampaignVO.getCarlineCd().equals("")){
                lblList[0] = messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale());  // 차종
                throw processException("par.info.issueCheckMsg", lblList);
            }

            // 모델코드 유효성 체크.
            if(marketingCampaignVO.getModelCd().equals("")){
                lblList[0] = messageSource.getMessage("global.lbl.model", null, LocaleContextHolder.getLocale());  // 모델
                throw processException("par.info.issueCheckMsg", lblList);
            }

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setUpdtUsrId(userId);
            updateActive(marketingCampaignVO);
        }

        for(MarketingCampaignVO marketingCampaignVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            deleteActive(marketingCampaignVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectActivesByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectActivesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectActivesByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectActivesByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTalkPlansByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectTalkPlansByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectTalkPlansByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectTalkPlansByCondition(searchVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int insertGoal(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.insertGoal(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateGoal(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.updateGoal(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteGoal(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.deleteGoal(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiGoals(BaseSaveVO<MarketingCampaignVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(MarketingCampaignVO marketingCampaignVO : obj.getInsertList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setRegUsrId(userId);
            insertGoal(marketingCampaignVO);
        }
        for(MarketingCampaignVO marketingCampaignVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setUpdtUsrId(userId);
            updateGoal(marketingCampaignVO);
        }

        for(MarketingCampaignVO marketingCampaignVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            deleteGoal(marketingCampaignVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return marketingCampaignDAO.selectGoalsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectGoalsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectGoalsByConditionCnt(searchVO);
    }





    /**
     * 마케팅 캠페인(대상자) 목록 수량 조회
     * @param MarketingCampaignSearchVO - 마케팅 캠페인
     */
    @Override
    public int selectTargetsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignDAO.selectTargetsByConditionCnt(searchVO);
    }

    /**
     * 마케팅 캠페인(대상자) 목록 조회
     * @param MarketingCampaignSearchVO - 마케팅 캠페인
     */
    @Override
    public List<MarketingCampaignVO> selectTargetsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignDAO.selectTargetsByCondition(searchVO);
    }

    /**
       * 마케팅 캠페인(대상자) 저장
       * @param MarketingCampaignVO - 마케팅 캠페인
       */
    //@Override
    public int multiTargets(MarketingCampaignVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        saveVO.setDlrCd(dlrCd);
        saveVO.setRegUsrId(userId);
        saveVO.setUpdtUsrId(userId);

        int resultCnt = 0;
        int extrDgreCnt = saveVO.getExtrDgreCnt();

        // 고객추출자동여부가 'Y'일 경우
        if ( "Y".equals(saveVO.getCustExtrAutoYn()) ) {

            /*
             * ######################################################   추출주기설정 저장 시작
             */
            if ( "S".equals(saveVO.getCustExtrCycleTp()) ) {

                if ( saveVO.getCustExtrCycleDt() == null){
                    // TODO 메시지 [------ ]을(를) 확인하여 주세요.
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
                };

//                SimpleDateFormat convertDt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
                DateFormat convertString = new SimpleDateFormat("yyyyMMdd");

                boolean isFirst = true;
                String dateToString = "";

                // List TO String
                for (Date getDate : saveVO.getCustExtrCycleDt()) {
                    if(!isFirst){
                        dateToString += ", ";
                    }
                    dateToString += convertString.format(getDate);
                    isFirst = false;

                }

                saveVO.setCustExtrCycleCont(dateToString);

            } else if ( "W".equals(saveVO.getCustExtrCycleTp()) ) {

                if ( saveVO.getCustExtrCycleWeek() == null){
                    // TODO 메시지 [------ ]을(를) 확인하여 주세요.
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermCd", null, LocaleContextHolder.getLocale())});
                };

                // Week List TO String
                boolean isFirst = true;
                String weekToString = "";
                for (String getWeek : saveVO.getCustExtrCycleWeek()) {
                    if(!isFirst){
                        weekToString += ", ";
                    }
                    weekToString += getWeek;
                    isFirst = false;
                }

                saveVO.setCustExtrCycleCont(weekToString);

            }
            /*
             * ######################################################   추출주기설정 저장 종료
             */

        }else{
            //고객추출자동여부가 'Y'이 아닐 경우 고객추출유형 및 고객추출주기 값을 초기화 시킨다.
            saveVO.setCustExtrCycleTp("");
            saveVO.setCustExtrCycleCont("");
        }

        // 마케팅 캠페인(대상자) 저장
//        if ( extrDgreCnt > 0 ) {
//            resultCnt = updateTarget(saveVO);
//        } else {
            resultCnt = insertTarget(saveVO);
            extrDgreCnt = saveVO.getExtrDgreCnt();        // selectKey 로 seq 받아온다
//        }

        if(resultCnt < 1){
            // 고객추출조건 등록 실패되었습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("crm.lbl.custExtrTermNo", null, LocaleContextHolder.getLocale())});
        }

        return extrDgreCnt;
    }

    /**
     * 마케팅 캠페인(대상자) 등록
     * @param MarketingCampaignVO - 마케팅 캠페인
     */
    //@Override
    public int insertTarget(MarketingCampaignVO activeVO) throws Exception {
        return marketingCampaignDAO.insertTarget(activeVO);
    }

    /**
     * 마케팅 캠페인(대상자) 수정
     * @param MarketingCampaignVO - 마케팅 캠페인
     */
    //@Override
    public int updateTarget(MarketingCampaignVO activeVO) throws Exception {
        return marketingCampaignDAO.updateTarget(activeVO);
    }

    /**
     * 마케팅 캠페인(대상자) 정보를 삭제 한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    @Override
    public int deleteTarget(MarketingCampaignVO activeVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(activeVO.getDlrCd())){activeVO.setDlrCd(LoginUtil.getDlrCd());}


        if ( activeVO.getExtrDgreCnt() == 0 ) {
            // 추출차수 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.extrDgreCnt", null, LocaleContextHolder.getLocale())});
        }

        int resultCnt = 0;

        resultCnt = marketingCampaignDAO.deleteTarget(activeVO);

        if ( resultCnt != 1 ) {
            // 추출차수 / 삭제 실패하였습니다.
            throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("crm.lbl.extrDgreCnt", null, LocaleContextHolder.getLocale())});
        }

        return resultCnt;
    }

    /**
     * 마케팅 캠페인(대상자) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignSaveExVO
     * @return 등록된 목록수
     */
    @Override
    public int insertTargetExcelData(MarketingCampaignSaveExVO saveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        saveVO.setRegUsrId(userId);

        // 대상자 마스터 저장
        marketingCampaignDAO.insertTargetExcelMaster(saveVO);


        // 대상자 데테일 저장
        int i = 0;

        for(MarketingCampaignVO marketingCampaignVO : saveVO.getInsertTargetVO()){

            ;
            marketingCampaignVO.setExtrDgreCnt(saveVO.gettExtrDgreCnt());
            marketingCampaignVO.setRegUsrId(userId);
            if (marketingCampaignVO.getErrorCount() == 0) {
                marketingCampaignDAO.insertTargetExcelDetail(marketingCampaignVO);
                i++;
            }
        }

        return i;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiCrmTargExtractDetails(BaseSaveVO<MarketingCampaignVO> obj) throws Exception {

        for(MarketingCampaignVO marketingCampaignVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            deleteTargetDetail(marketingCampaignVO);
        }
    }

    /**
     * 마케팅 캠페인(대상자 디테일 - CR_0710T) 정보를 삭제한다.
     */
    @Override
    public int deleteTargetDetail(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.deleteTargetDetail(marketingCampaignVO);
    }

    /**
     * 마케팅 캠페인(대상자 디테일 - CR_0710T) 정보를 등록한다.(수동으로 대상자 추출버튼을 통해 생성)
     */
    @Override
    public int insertTargetExtractSave(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.insertTargetExtractSave(marketingCampaignVO);
    }

    /**
     * 마케팅 캠페인(대상자) 정보를 수정한다.(대상자 추출버튼을 통한 대상자 마스터 업데이트)
     */
    @Override
    public int updateTargetExtractMaster(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.updateTargetExtractMaster(marketingCampaignVO);
    }

    /**
     * 마케팅 캠페인(대상자 마스터/디테일) 정보를 삭제한다.(추출조건차수을 삭제할때 추출조건차수에 대상자가 존재하면 같이 삭제.)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    @Override
    public int deleteTargetEx(MarketingCampaignVO activeVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(activeVO.getDlrCd())){activeVO.setDlrCd(LoginUtil.getDlrCd());}


        if ( activeVO.getExtrDgreCnt() == 0 ) {
            // 추출차수 / 을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.extrDgreCnt", null, LocaleContextHolder.getLocale())});
        }

        int resultCnt = 0;

        resultCnt = marketingCampaignDAO.deleteTarget(activeVO);
        marketingCampaignDAO.deleteTargetDetailEx(activeVO);

        if ( resultCnt != 1 ) {
            // 추출차수 / 삭제 실패하였습니다.
            throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("crm.lbl.extrDgreCnt", null, LocaleContextHolder.getLocale())});
        }

        return resultCnt;
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int insertBudget(MarketingCampaignVO marketingCampaignVO) throws Exception {

        MarketingCampaignVO obj = selectBudgetByKey(marketingCampaignVO);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return marketingCampaignDAO.insertBudget(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateBudget(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.updateBudget(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteBudget(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.deleteBudget(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public MarketingCampaignVO selectBudgetByKey(MarketingCampaignVO marketingCampaignVO) throws Exception {
        return marketingCampaignDAO.selectBudgetByKey(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiBudgets(BaseSaveVO<MarketingCampaignVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(MarketingCampaignVO marketingCampaignVO : obj.getInsertList()){

            // 예산코드 유효성 체크.
            if(marketingCampaignVO.getBudgetCd().equals("")){
                String budgetCd = messageSource.getMessage("global.lbl.budgetCd", null, LocaleContextHolder.getLocale());  // 예산
                throw processException("par.info.issueCheckMsg", new String[]{budgetCd});
            }

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setRegUsrId(userId);
            insertBudget(marketingCampaignVO);
        }
        for(MarketingCampaignVO marketingCampaignVO : obj.getUpdateList()){

            // 예산코드 유효성 체크.
            if(marketingCampaignVO.getBudgetCd().equals("")){
                String budgetCd = messageSource.getMessage("global.lbl.budgetCd", null, LocaleContextHolder.getLocale());  // 예산
                throw processException("par.info.issueCheckMsg", new String[]{budgetCd});
            }

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setUpdtUsrId(userId);
            updateBudget(marketingCampaignVO);
        }

        for(MarketingCampaignVO marketingCampaignVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            deleteBudget(marketingCampaignVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectBudgetsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return marketingCampaignDAO.selectBudgetsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectBudgetsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectBudgetsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String sExcelTp = "";
        if (StringUtils.isNotEmpty((String)params.get("sExcelTp"))) {
            sExcelTp = (String)params.get("sExcelTp");
            params.remove("sExcelTp");
        }

        MarketingCampaignSearchVO searchVO = new MarketingCampaignSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        if (StringUtils.isNotEmpty((String)params.get("sStartDt"))) {
            searchVO.setsStartDt(DateUtil.convertToDate((String)params.get("sStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sEndDt"))) {
            searchVO.setsEndDt(DateUtil.convertToDate((String)params.get("sEndDt")));
        }
        List<MarketingCampaignVO> list = null;
        if (StringUtils.isNotEmpty(sExcelTp)) {
            if ("CampaignExtractCustRlt".equals(sExcelTp)) {  // 참여대상 다운로드
                list = selectCrmTargExtractPopupsByCondition(searchVO);
            } else if ("CampaignMgmtList".equals(sExcelTp)) {  // 캠페인 관리
                list = selectMarketingCampaignsByCondition(searchVO);
            }
        } else {  // 예산 다운로드
            list = selectBudgetsByCondition(searchVO);
        }

        context.putVar("items", list);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetExsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        int cnt = 0;

        cnt = marketingCampaignDAO.selectTargetsByConditionCnt(searchVO);

        if(cnt <= 0){
            throw processException("crm.err.signTargetEmpty");
        }

        return cnt;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectWorkItemsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        int cnt = 0;

        cnt = marketingCampaignDAO.selectWorkItemsByConditionCnt(searchVO);

        if(cnt > 0){
            //공임코드별로 부품이 등록되면 원인부품도 등록되어야 합니다. 다시 확인하시기 바랍니다.
            throw processException("crm.err.workItemEmpty");
        }

        return cnt;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateApprDocNo(MarketingCampaignVO marketingCampaignVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.updateApprDocNo(marketingCampaignVO);
    }

    /**
     * 결재할 사람에게 알람을 보낸다.
     *
    @Override
    public void pushSignAlarms(SignVO signVO) throws Exception {

        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();

        for(SignLineVO signLineVO : signVO.getSignLines()){
            NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
            targetVO.setUsrId(signLineVO.getSignUsrId());
            targetVO.setUsrNm(signLineVO.getSignUsrNm());
            targetVO.setMesgTmplTpList("W");//여러개일 경우 구분자를 , 로 입력.

            targetUsers.add(targetVO);
        }

        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "CRM-01-001";
        String dlrCd = LoginUtil.getDlrCd();
        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("makNm", signVO.getReqTitleNm());

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }
    */

    /**
     * {@inheritDoc}
     */
    @Override
    public SignVO selectSignExByKey(SignSearchVO searchVO) throws Exception {

        return marketingCampaignDAO.selectSignExByKey(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public MarketingCampaignVO selectMakCdByKey(MarketingCampaignSearchVO searchVO) throws Exception {

        return marketingCampaignDAO.selectMakCdByKey(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateStatCd(MarketingCampaignVO marketingCampaignVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

        if("03".equals(marketingCampaignVO.getStatCd())){
            // 확보유형에 등록하기
            MarketingCampaignSearchVO marketingCampaignSearchVO = new MarketingCampaignSearchVO();
            marketingCampaignSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            marketingCampaignSearchVO.setsMakCd(marketingCampaignVO.getMakCd());
            MarketingCampaignVO mCampaignVO = marketingCampaignDAO.selectMarketingCampaignByKey(marketingCampaignSearchVO);

            SalesOpptHoldTypeMgmtSearchVO salesOpptHoldTypeMgmtSearchVO = new SalesOpptHoldTypeMgmtSearchVO();
            salesOpptHoldTypeMgmtSearchVO.setsDlrCd(marketingCampaignSearchVO.getsDlrCd());
            salesOpptHoldTypeMgmtSearchVO.setsRemark(mCampaignVO.getMakCd());
            int holdTpMgmtCnt = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByConditionCnt(salesOpptHoldTypeMgmtSearchVO);

            SalesOpptHoldTypeMgmtVO salesOpptHoldTypeMgmtVO = new SalesOpptHoldTypeMgmtVO();
            if (holdTpMgmtCnt == 0) {
             // 판매기회 확보유형관리 신규등록
                salesOpptHoldTypeMgmtVO.setHoldTp("03");
                salesOpptHoldTypeMgmtVO.setHoldDetlTpNm(mCampaignVO.getMakNm());
                salesOpptHoldTypeMgmtVO.setRemark(mCampaignVO.getMakCd());
                salesOpptHoldTypeMgmtVO.setDelYn("Y");
                salesOpptHoldTypeMgmtVO.setSortOrder(0);
                salesOpptHoldTypeMgmtVO.setStartDt(mCampaignVO.getStartDt());
                salesOpptHoldTypeMgmtVO.setEndDt(mCampaignVO.getEndDt());
                salesOpptHoldTypeMgmtService.insertSalesOpptHoldType(salesOpptHoldTypeMgmtVO);

            } else {
                List<SalesOpptHoldTypeMgmtVO> salesOpptHoldTypeMgmtVOList = salesOpptHoldTypeMgmtService.selectSalesOpptHoldTypeMgmtsByCondition(salesOpptHoldTypeMgmtSearchVO);
                // 판매기회 확보유형관리 업데이트
                salesOpptHoldTypeMgmtVO.setHoldSeq(salesOpptHoldTypeMgmtVOList.get(0).getHoldSeq());
                salesOpptHoldTypeMgmtVO.setHoldTp("03");
                salesOpptHoldTypeMgmtVO.setHoldDetlTpNm(mCampaignVO.getMakNm());
                salesOpptHoldTypeMgmtVO.setRemark(mCampaignVO.getMakCd());
                salesOpptHoldTypeMgmtVO.setDelYn("Y");
                salesOpptHoldTypeMgmtVO.setSortOrder(0);
                salesOpptHoldTypeMgmtVO.setStartDt(mCampaignVO.getStartDt());
                salesOpptHoldTypeMgmtVO.setEndDt(mCampaignVO.getEndDt());
                salesOpptHoldTypeMgmtService.updateSalesOpptHoldType(salesOpptHoldTypeMgmtVO);
            }

        }

        return marketingCampaignDAO.updateStatCd(marketingCampaignVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectResultGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectResultGoalsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectResultCorpsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectResultCorpsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectResultPersonsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isBlank(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectResultPersonsByCondition(searchVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int selectWorkByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectWorkByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectWorkByCondition(MarketingCampaignSearchVO searchVO) throws Exception {
        if (StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectWorkByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertWork(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.insertWork(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateWork(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.updateWork(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteWork(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.deleteWork(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiWorks(BaseSaveVO<MarketingCampaignVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(MarketingCampaignVO marketingCampaignVO : obj.getInsertList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setRegUsrId(userId);
            insertWork(marketingCampaignVO);
        }
        for(MarketingCampaignVO marketingCampaignVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setUpdtUsrId(userId);
            updateWork(marketingCampaignVO);
        }

        for(MarketingCampaignVO marketingCampaignVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            deleteWork(marketingCampaignVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int selectVinByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);
        if(StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectVinByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectVinByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);
        if(StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectVinByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectVinTmpByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);
        if(StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectVinTmpByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectVinTmpByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);
        if(StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectVinTmpByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertVinExcelData(MarketingCampaignSaveExVO saveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        // VIN정보 저장
        int i = 0;
        /*for(MarketingCampaignVO marketingCampaignVO : saveVO.getInsertTargetVO()){
            marketingCampaignVO.setRegUsrId(userId);
            marketingCampaignDAO.insertVinExcelData(marketingCampaignVO);
            i++;
        }*/

        MarketingCampaignVO marketingCampaignVO = new MarketingCampaignVO();
        marketingCampaignVO.setRegUsrId(userId);
        marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());
        marketingCampaignVO.setMakCd(saveVO.getInsertTargetVO().get(0).getMakCd());
        i =  marketingCampaignDAO.insertVinExcelData(marketingCampaignVO);

        return i;
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int insertVinTmpExcelData(MarketingCampaignVO marketingCampaignVO) throws Exception {
        String userId = LoginUtil.getUserId();

        // VIN정보 저장
        marketingCampaignVO.setRegUsrId(userId);
        int i = marketingCampaignDAO.insertVinTmpExcelData(marketingCampaignVO);
        return i;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteVinTmpExcelData(MarketingCampaignVO marketingCampaignVO) throws Exception {
        String userId = LoginUtil.getUserId();

        // VIN정보 삭제
        marketingCampaignVO.setRegUsrId(userId);
        int i = marketingCampaignDAO.deleteVinTmpExcelData(marketingCampaignVO);
        return i;
    }


    /**
     * 마케팅 캠페인(LTS MODEL 정보 - SE_1074T) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertLtsModelExcelData(MarketingCampaignSaveExVO saveVO) throws Exception{

        String userId = LoginUtil.getUserId();

        // LTS MODEL CD 정보 저장
        int i = 0;

        for(MarketingCampaignVO marketingCampaignVO : saveVO.getInsertTargetVO()){

            marketingCampaignVO.setRegUsrId(userId);

            marketingCampaignDAO.insertLtsModelExcelData(marketingCampaignVO);

            i++;
        }

        return i;

    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int selectLaborByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectLaborByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectLaborByCondition(MarketingCampaignSearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return marketingCampaignDAO.selectLaborByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateLabor(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.updateLabor(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiLabor(BaseSaveVO<MarketingCampaignVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(MarketingCampaignVO marketingCampaignVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setUpdtUsrId(userId);
            updateLabor(marketingCampaignVO);
        }
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public int selectItemsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return marketingCampaignDAO.selectItemsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectItemsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return marketingCampaignDAO.selectItemsByCondition(searchVO);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDlrItemsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return marketingCampaignDAO.selectDlrItemsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectDlrItemsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return marketingCampaignDAO.selectDlrItemsByCondition(searchVO);
    }

    /**
     * 공임코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<MarketingCampaignVO> selectLbrCdListByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        return marketingCampaignDAO.selectLbrCdListByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertItems(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.insertItems(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteItems(MarketingCampaignVO marketingCampaignVO) throws Exception {

        return marketingCampaignDAO.deleteItems(marketingCampaignVO);
    }

    /**
     * 캠페인 대상 부품정보를 수정한다.(정비 캠페인)
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateItems(MarketingCampaignVO marketingCampaignVO) throws Exception{

        return marketingCampaignDAO.updateItems(marketingCampaignVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiItems(BaseSaveVO<MarketingCampaignVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(MarketingCampaignVO marketingCampaignVO : obj.getInsertList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            marketingCampaignVO.setRegUsrId(userId);
            insertItems(marketingCampaignVO);
        }

        for(MarketingCampaignVO marketingCampaignVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            updateItems(marketingCampaignVO);
        }
        for(MarketingCampaignVO marketingCampaignVO : obj.getDeleteList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(marketingCampaignVO.getDlrCd())){marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(marketingCampaignVO.getPltCd())){marketingCampaignVO.setPltCd(LoginUtil.getPltCd());}

            deleteItems(marketingCampaignVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDealersByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignDAO.selectDealersByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectDealersByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignDAO.selectDealersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDlrsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectDlrsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectDlrsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectDlrsByCondition(searchVO);
    }

    /**
     * 마케팅 캠페인(대상 딜러) 정보를 등록한다.(삭제 및 신규저장)
     * @param MarketingCampaignSaveExVO
     * @return 등록된 목록수
     */
    @Override
    public int saveDlrCdData(MarketingCampaignSaveExVO saveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        saveVO.setRegUsrId(userId);

        MarketingCampaignVO dlrVO = new MarketingCampaignVO();

        dlrVO.setDlrCd(saveVO.gettDlrCd());
        dlrVO.setMakCd(saveVO.gettMakCd());

        // 대상 딜러 삭제
        deleteDlr(dlrVO);


        // 대상 딜러 신규저장
        int i = 0;

        for(MarketingCampaignVO marketingCampaignVO : saveVO.getInsertDlrCdVO()){

            marketingCampaignVO.setRegUsrId(userId);

            //대상여부가 'Y'인 데이터만 신규저장한다.
            if("Y".equals(marketingCampaignVO.getTargYn())){
                insertDlr(marketingCampaignVO);
                i++;
            }
        }

        return i;
    }

    /**
     * 마케팅 캠페인(대상 딜러) 등록
     * @param MarketingCampaignVO - 마케팅 캠페인
     */
    //@Override
    public int insertDlr(MarketingCampaignVO saveVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(saveVO.getDlrCd())){saveVO.setDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignDAO.insertDlr(saveVO);
    }

    /**
     * 마케팅 캠페인(대상 딜러) 정보를 삭제 한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    @Override
    public int deleteDlr(MarketingCampaignVO saveVO) throws Exception {

        /*
         * dlrCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(saveVO.getDlrCd())){saveVO.setDlrCd(LoginUtil.getDlrCd());}

        return marketingCampaignDAO.deleteDlr(saveVO);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCrmTargExtractPopupsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return marketingCampaignDAO.selectCrmTargExtractPopupsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<MarketingCampaignVO> selectCrmTargExtractPopupsByCondition(MarketingCampaignSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return marketingCampaignDAO.selectCrmTargExtractPopupsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.mcm.service.MarketingCampaignService#selectCustomerInfoChkByExcelImp(chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO)
     */
    @Override
    public List<MarketingCampaignVO> selectCustomerInfoChkByExcelImp(List<MarketingCampaignVO> list)
            throws Exception {
/*
        String userId = LoginUtil.getUserId();
        String dataChk = "";  // U :Update, D:Duplicate, N:New
        int i = 0;

        List<ExcelUploadError> errors = null;
        CustomerInfoSearchVO customerInfoSearchVO = null;
        CustomerInfoVO customerInfoVO = null;
        for(MarketingCampaignVO marketingCampaignVO : list) {
            customerInfoSearchVO = new CustomerInfoSearchVO();
            customerInfoVO = new CustomerInfoVO();
            errors = new ArrayList<ExcelUploadError>();

            customerInfoSearchVO.setsCustNo(marketingCampaignVO.getCustNo());
            customerInfoSearchVO.setsSelCondi("MARKCUSTIMP");

            i = customerInfoOutBoundService.selectCustomerInfoByConditionCnt(customerInfoSearchVO);

            if (i != 0) {
                customerInfoVO = customerInfoService.selectCustomerInfoByKey(customerInfoSearchVO);
                marketingCampaignVO.setDlrCd(customerInfoVO.getDlrCd());
                marketingCampaignVO.setCustNm(customerInfoVO.getCustNm());
                marketingCampaignVO.setTelNo(customerInfoVO.getTelNo());
                marketingCampaignVO.setHpNo(customerInfoVO.getHpNo());
                marketingCampaignVO.setWechatId(customerInfoVO.getWechatId());
                marketingCampaignVO.setEmailNm(customerInfoVO.getEmailNm());
                marketingCampaignVO.setSungNm(customerInfoVO.getSungNm());
                marketingCampaignVO.setCityNm(customerInfoVO.getCityNm());
                marketingCampaignVO.setDistNm(customerInfoVO.getDistNm());
                marketingCampaignVO.setZipCd(customerInfoVO.getZipCd());
                marketingCampaignVO.setAddrNm(customerInfoVO.getAddrFull());
                marketingCampaignVO.setAddrDetlCont(customerInfoVO.getAddrDetlCont());
                marketingCampaignVO.setCarRegNo(customerInfoVO.getCarRegNo());
                marketingCampaignVO.setCarlineCd(customerInfoVO.getCarlineCd());
                marketingCampaignVO.setModelCd(customerInfoVO.getModelCd());
                if (StringUtils.isEmpty(customerInfoVO.getDlrMbrYn())) {
                    marketingCampaignVO.setMembershipYn("N");
                } else {
                    marketingCampaignVO.setMembershipYn("Y");
                }
                if (StringUtils.isEmpty(customerInfoVO.getBlueMembershipNo())) {
                    marketingCampaignVO.setBlueMembershipYn("N");
                } else {
                    marketingCampaignVO.setBlueMembershipYn("Y");
                }
            } else {
                errors.add(new ExcelUploadError(
                        messageSource.getMessage("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, Locale.CHINA)
                        )
                );
                marketingCampaignVO.setErrors(errors);
            }
            marketingCampaignVO.setErrorCount(marketingCampaignVO.getErrors().size());
        }
*/

        return list;
    }

    /**
     * 마케팅 캠페인 정보를 복사 한다.
     * @param searchVO - makCd
     * @return 캠페인 번호
     */
    @Override
    public String copyMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception {

        if ( StringUtils.isEmpty(marketingCampaignVO.getMakCd()) ) {
            // {캠페인번호}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.makCd", null, LocaleContextHolder.getLocale())});
        };

/*        if ( !"02".equals(marketingCampaignVO.getHostCd()) ) {
            //주최가 [제조사]인 캠페인은 해당 화면에서 신규저장이 불가능 하므로 복사할 수 없습니다.
            throw processException("crm.info.noMakeCorpCopy");
        };*/

        String copyNewMakCd = selectNextMakNo();
        String usrId = LoginUtil.getUserId();
        marketingCampaignVO.setDlrCd(LoginUtil.getDlrCd());
        marketingCampaignVO.setRegUsrId(usrId);
        marketingCampaignVO.setCopyNewMakCd(copyNewMakCd);

        // 파일 복사 시작
        String fileDocNo = marketingCampaignVO.getActiveFileDocNo();
        if ( StringUtils.isNotEmpty(fileDocNo) ) {

            String uploadPath = WebContext.getInitParameter("FILE_UPLOAD_PATH");

            List<FileItemVO> list = null;

            if(StringUtils.isEmpty(fileDocNo)){
                list = new ArrayList<FileItemVO>();
            } else {
                list = fileMgrService.selectFileItemsByFileDocNo(fileDocNo);
            }

            if (list.size() > 0 ) {

                // 파입업로드 문서번호 생성
                String copyFileDocNo = fileMgrService.selectNextFileDocNo();

                String dir = DateUtil.getDate("/yyyy/MM/dd");
                String copyFilePath = Constants.FILE_UPLOAD_DATA_FOLDER_NAME + dir;
                FileUploadUtils.mkdirs(copyFilePath);

                for (FileItemVO fileItemVO : list) {

                    String oriFilePath = uploadPath + "/" + fileItemVO.getFileData();
                    String copyFileName = FileUploadUtils.randomFileName(copyFilePath);
                    String copyFileData = copyFilePath + "/" + copyFileName;

                    // 원본 파일 확인
                    File file = new File(oriFilePath);
                    if(file.isFile()){

                        Path oriFile = Paths.get(oriFilePath);
                        Path copyFile = Paths.get(uploadPath + "/" + copyFileData );

                        try{
                            // 파일복사
                            Files.copy(oriFile, copyFile);

                            fileItemVO.setFileDocNo(copyFileDocNo);
                            fileItemVO.setFileData("/"+copyFileData);

                            fileMgrService.insertFileDocAndItem(copyFileDocNo, "N", usrId, fileItemVO);

                        }catch(Exception e){};

                    } else {
                        // {파일}을(를) 확인하여 주세요.
                        throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.file", null, LocaleContextHolder.getLocale())});
                    };

                };

                // 파일 복사가 완료되면 파일문서 번호 set
                marketingCampaignVO.setActiveFileDocNo(copyFileDocNo);

            };

        };
        // 파일 복사 종료

        int insertResultCnt = 0;

        // 마케팅 정보 복사 : 기본정보
        insertResultCnt += marketingCampaignCopyDAO.copyMarketingCampaign(marketingCampaignVO);

        if ( insertResultCnt != 1 ) {
            // {복사} 에 실패하였습니다.
            throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("crm.info.copy", null, LocaleContextHolder.getLocale())});
        } else {

            // 마케팅 캠페인 복사 : 목표
            insertResultCnt += marketingCampaignCopyDAO.copyMarketingCampaignGoal(marketingCampaignVO);

            // 마케팅 캠페인 복사 : 대상 > 추출실행 목록 목표
            insertResultCnt += marketingCampaignCopyDAO.copyMarketingCampaignTarget(marketingCampaignVO);

            // 마케팅 캠페인 복사 : 예산 > 예산(위안)정보
            insertResultCnt += marketingCampaignCopyDAO.copyMarketingCampaignBudget(marketingCampaignVO);

        };

        return copyNewMakCd;
    }


}
