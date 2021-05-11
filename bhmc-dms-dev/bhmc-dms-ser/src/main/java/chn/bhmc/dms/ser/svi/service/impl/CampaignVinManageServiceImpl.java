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
     * 임률관리 서비스
     */
    @Autowired
    RateManageService rateManageService;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignVinInfosCnt(CampaignSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return campaignVinManageDAO.selectCampaignVinInfosCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignDetailVO> selectCampaignVinInfos(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return campaignVinManageDAO.selectCampaignVinInfos(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignLbrInfosCnt(CampaignSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return campaignVinManageDAO.selectCampaignLbrInfosCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignDetailVO> selectCampaignLbrInfos(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return campaignVinManageDAO.selectCampaignLbrInfos(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCampaignItemsCnt(CampaignSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return campaignVinManageDAO.selectCampaignItemsCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CampaignDetailVO> selectCampaignItems(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return campaignVinManageDAO.selectCampaignItems(searchVO);
    }

    /**
     * VIN에 해당하는 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 정보
     */
    public List<CampaignMasterVO> selectCampaignForVinInfos(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return campaignVinManageDAO.selectCampaignForVinInfos(searchVO);
    }

    /**
     * VIN에 해당하는 캠페인 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return VIN 에 해당하는 캠페인 정보
     */
    public int selectCampaignForVinInfosCnt(CampaignSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
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

        RateManageSearchVO rateSearchVO = new RateManageSearchVO();

        rateSearchVO.setsDlrCd(dlrCd);
        rateSearchVO.setsBrandCd(searchVO.getsCarBrandCd());
        rateSearchVO.setsRpirTp("02");
        rateSearchVO.setsDstinCd("H");
        RateManageVO rateManageVO = rateManageService.selectDlrRateByKey(rateSearchVO);

        if(rateManageVO.getDlrCd().equals(dlrCd)){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }else{
            searchVO.setsDlrCd("A07AA");
        }

        return campaignVinManageDAO.selectCampaignLbrInfoPopup(searchVO);
    }

    /**
     *  딜러 캠페인 공임 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 공임 정보
     */
    public List<CampaignDetailVO> selectCampaignDlrLbrInfoPopup(CampaignSearchVO searchVO) throws Exception {


        if(StringUtil.nullConvert(searchVO.getsCarBrandCd()).equals("")){
            searchVO.setsCarBrandCd("HD");
        }
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return campaignVinManageDAO.selectCampaignDlrLbrInfoPopup(searchVO);
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


    /**
     * 딜러 캠페인 부품 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 캠페인 부품 정보
     */
    public List<CampaignDetailVO> selectCampaignDlrPartInfoPopup(CampaignSearchVO searchVO)throws Exception{

        if(StringUtil.nullConvert(searchVO.getsCarBrandCd()).equals("")){
            searchVO.setsCarBrandCd("HD");
        }

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return campaignVinManageDAO.selectCampaignDlrPartInfoPopup(searchVO);

    }


    /**
    *
    * 캠페인 사용 정보 등록
    *
    * @param campaignDetailVO
    * @throws Exception
    */
   public void insertUsedCamapaignInfo(CampaignSearchVO campaignSearchVO) throws Exception{

       if( StringUtil.nullConvert(campaignSearchVO.getsDlrCd()).equals("")){
           campaignSearchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       campaignVinManageDAO.insertUsedCamapaignInfo(campaignSearchVO);
   }

   /**
    *
    * 캠페인 사용 정보 삭제
    *
    * @param campaignDetailVO
    * @throws Exception
    */
   public void deleteUsedCamapaignInfo(CampaignDetailVO campaignDetailVO) throws Exception{

       if( StringUtil.nullConvert(campaignDetailVO.getDlrCd()).equals("")){
           campaignDetailVO.setDlrCd(LoginUtil.getDlrCd());
       }
       campaignVinManageDAO.deleteUsedCamapaignInfo(campaignDetailVO);
   }

    /**
     *
     * 캠페인 사용 정보 등록 여부
     *
     * @param campaignDetailVO
     * @throws Exception
    */
    public int selectCampaignUsedInfosCnt(CampaignSearchVO campaignSearchVO) throws Exception{


        campaignSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        return campaignVinManageDAO.selectCampaignUsedInfosCnt(campaignSearchVO);
    }

    /**
    *
    * 캠페인 면비보양 갯수 조회
    *
    * @param CampaignSearchVO
    * @throws Exception
    */
    public int selectFreeRoCnt(CampaignSearchVO campaignSearchVO) throws Exception{

       campaignSearchVO.setsDlrCd(LoginUtil.getDlrCd());
       return campaignVinManageDAO.selectFreeRoCnt(campaignSearchVO);
   }

    /**
    *
    * 캠페인 처음면비보양 판단을 위한 갯수 조회
    *
    * @param CampaignSearchVO
    * @throws Exception
    */
    public int selectFreeRoYnCnt(CampaignSearchVO campaignSearchVO) throws Exception{

       campaignSearchVO.setsDlrCd(LoginUtil.getDlrCd());
       return campaignVinManageDAO.selectFreeRoYnCnt(campaignSearchVO);
   }



}
