package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.CampaignVinManageService;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.RateManageService;
import chn.bhmc.dms.ser.svi.service.dao.CampaignVinManageDAO;
import chn.bhmc.dms.ser.svi.vo.CampaignDetailVO;
import chn.bhmc.dms.ser.svi.vo.CampaignMasterVO;
import chn.bhmc.dms.ser.svi.vo.CampaignSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignVinManageServiceImpl.java
 * @Description : 캠페인 빈 정보 구현 클래스
 * @author Kwon Ki Hyun
 * @since 2016. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 22.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("campaignVinManageService")
public class CampaignVinManageServiceImpl extends HService implements CampaignVinManageService{



    @Resource(name="campaignVinManageDAO")
    CampaignVinManageDAO campaignVinManageDAO;



    /**
     * LTS MODEL MAPPING 서비스
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    /**
     * 임률관리 서비스
     */
    @Autowired
    RateManageService rateManageService;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignVinInfosCnt(CampaignSearchVO searchVO) throws Exception {

        return campaignVinManageDAO.selectCampaignVinInfosCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignDetailVO> selectCampaignVinInfos(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return campaignVinManageDAO.selectCampaignVinInfos(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignLbrInfosCnt(CampaignSearchVO searchVO) throws Exception {

        return campaignVinManageDAO.selectCampaignLbrInfosCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignDetailVO> selectCampaignLbrInfos(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return campaignVinManageDAO.selectCampaignLbrInfos(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignItemsCnt(CampaignSearchVO searchVO) throws Exception {

        return campaignVinManageDAO.selectCampaignItemsCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignDetailVO> selectCampaignItems(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return campaignVinManageDAO.selectCampaignItems(searchVO);
    }

    /**
     * VIN에 해당하는 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 정보
     */
    public List<CampaignMasterVO> selectCampaignForVinInfos(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        /*String ltsModelCd = ltsModelMappingService.selectLtsModelMapping(searchVO.getsVinNo());
        log.debug("vin="+searchVO.getsVinNo()+"/ ltsModelCd="+ltsModelCd);
        searchVO.setsLtsModelCd(ltsModelCd );*/


        return campaignVinManageDAO.selectCampaignForVinInfos(searchVO);
    }

    /**
     * VIN에 해당하는 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 정보
     */
    public int selectCampaignForVinInfosCnt(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        /*String ltsModelCd = ltsModelMappingService.selectLtsModelMapping(searchVO.getsVinNo());
        log.debug("vin="+searchVO.getsVinNo()+"/ ltsModelCd="+ltsModelCd);
        searchVO.setsLtsModelCd(ltsModelCd );*/


        return campaignVinManageDAO.selectCampaignForVinInfosCnt(searchVO);
    }

    /**
     *  캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보
     */
    public List<CampaignDetailVO> selectCampaignLbrInfoPopup(CampaignSearchVO searchVO) throws Exception {


        if(StringUtil.nullConvert(searchVO.getsCarBrandCd()).equals("")){
            searchVO.setsCarBrandCd("HD");
        }
        String dlrCd = LoginUtil.getDlrCd();
        //딜러별 임률관리 데이터 조회
        //딜러별 임률이 있을경우 딜러의 데이터를 사용하고 딜러별 임률데이터가 없으면 법인(A07AA)의 데이터를 사용한다.
/*        RateMasterSearchVO rateSearchVO = new RateMasterSearchVO();
        rateSearchVO.setsDlrCd(dlrCd);
        rateSearchVO.setsBrandCd(searchVO.getsCarBrandCd());
        rateSearchVO.setsRoTp("02"); // 보증수리 타입만 사용
        RateMasterVO rateMasterVO = rateMasterService.selectDlrRateByKey(rateSearchVO);
*/
        RateManageSearchVO rateSearchVO = new RateManageSearchVO();

        rateSearchVO.setsDlrCd(dlrCd);
        rateSearchVO.setsBrandCd(searchVO.getsCarBrandCd());
        rateSearchVO.setsRpirTp("02");
        rateSearchVO.setsDstinCd("H");
        RateManageVO rateManageVO = rateManageService.selectDlrRateByKey(rateSearchVO);

        if(rateManageVO.getDlrCd().equals(dlrCd)){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }else{
            //TODO [권기현] 법인딜러코드 A07AA 값 디폴트로 설정
            searchVO.setsDlrCd("A07AA");
        }

        return campaignVinManageDAO.selectCampaignLbrInfoPopup(searchVO);
    }

    /**
     *  캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보
     */
    public List<CampaignDetailVO> selectCampaignPartInfoPopup(CampaignSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsCarBrandCd()).equals("")){
            searchVO.setsCarBrandCd("HD");
        }

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return campaignVinManageDAO.selectCampaignPartInfoPopup(searchVO);
    }





}
