package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.part.dao.PartPartsVenderSalPriceTargetMasterDAO;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartPartsVenderSalPriceTargetMasterService;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeSearchVO;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.part.vo.PartsVenderSalPriceTargetExcelDownVO;
import chn.bhmc.dms.mob.api.part.vo.PartsVenderSalPriceTargetMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PartsVenderSalPriceTargetMasterVO;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;


/**
 * 판매가 대상선정 부품구매/판매가격 마스터 관리 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("PartPartsVenderSalPriceTargetMasterService")
public class PartPartsVenderSalPriceTargetMasterServiceImpl extends HService implements PartPartsVenderSalPriceTargetMasterService , JxlsSupport {

    /**
     * 부품가격 DAO
     */
    @Resource(name="PartPartsVenderSalPriceTargetMasterDAO")
    private PartPartsVenderSalPriceTargetMasterDAO PartPartsVenderSalPriceTargetMasterDAO;

  
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="PartStorageService")
    PartStorageService PartStorageService;
    

//    /**
//     * 부품마스터 관리 서비스
//     */
//    @Resource(name="itemMasterService")
//    ItemMasterService itemMasterService;


    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService#selectPartsVenderSalPriceTargetMastersByCondition(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO)
     */
    @Override
    public List<PartsVenderSalPriceTargetMasterVO> selectPartsVenderSalPriceTargetMastersByCondition(
            PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception {
        return PartPartsVenderSalPriceTargetMasterDAO.selectPartsVenderSalPriceTargetMastersByCondition(searchVO);
    }


    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService#selectPartsVenderSalPriceTargetMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO)
     */
    @Override
    public int selectPartsVenderSalPriceTargetMastersByConditionCnt(PartsVenderSalPriceTargetMasterSearchVO searchVO)
            throws Exception {
        return PartPartsVenderSalPriceTargetMasterDAO.selectPartsVenderSalPriceTargetMastersByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ArrayList<PartsVenderSalPriceTargetExcelDownVO> resultList = new ArrayList<PartsVenderSalPriceTargetExcelDownVO>();

        PartsVenderSalPriceTargetMasterSearchVO searchVO = new PartsVenderSalPriceTargetMasterSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsBpTp(params.get("sBpTp").toString());
        searchVO.setsBpCd(params.get("sBpCd").toString());
        searchVO.setsBpNm(params.get("sBpNm").toString());
        searchVO.setsItemCd(params.get("sItemCd").toString());
        searchVO.setsItemNm(params.get("sItemNm").toString());
        searchVO.setsAbcInd(params.get("sAbcInd").toString());
        searchVO.setsItemDstinCd(params.get("sItemDstinCd").toString());
        searchVO.setsCarlineCd(params.get("sCarlineCd").toString());
        searchVO.setsBasePrice(params.get("sBasePrice").toString());
        searchVO.setsStrgeCd(params.get("sStrgeCd").toString());
        searchVO.setsLocCd(params.get("sLocCd").toString());
        searchVO.setsStdPrcCd(params.get("sStdPrcCd").toString());
        searchVO.setsSalePrcAmtZeroYn01(params.get("sSalePrcAmtZeroYn01").toString());
        searchVO.setsSalePrcAmtZeroYn02(params.get("sSalePrcAmtZeroYn02").toString());
        searchVO.setsSalePrcAmtZeroYn03(params.get("sSalePrcAmtZeroYn03").toString());
        searchVO.setsSalePrcAmtZeroYn04(params.get("sSalePrcAmtZeroYn04").toString());

        searchVO.setsPrcTpFrom01(!params.get("sPrcTpFrom01").toString().equals("null") ? Double.parseDouble(params.get("sPrcTpFrom01").toString()) : 0.0);
        searchVO.setsPrcTpTo01(!params.get("sPrcTpTo01").toString().equals("null") ? Double.parseDouble(params.get("sPrcTpTo01").toString()) : 0.0);
        searchVO.setsPrcTpFrom02(!params.get("sPrcTpFrom02").toString().equals("null") ? Double.parseDouble(params.get("sPrcTpFrom02").toString()) : 0.0);
        searchVO.setsPrcTpTo02(!params.get("sPrcTpTo02").toString().equals("null")  ? Double.parseDouble(params.get("sPrcTpTo02").toString()) : 0.0);
        searchVO.setsPrcTpFrom03(!params.get("sPrcTpFrom03").toString().equals("null") ? Double.parseDouble(params.get("sPrcTpFrom03").toString()) : 0.0);
        searchVO.setsPrcTpTo03(!params.get("sPrcTpTo03").toString().equals("null") ? Double.parseDouble(params.get("sPrcTpTo03").toString()) : 0.0);

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        //langCd
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //부품구분 공통코드 조회.
        CommonCodeSearchVO itemDistinCdSearchVO = new CommonCodeSearchVO();
        itemDistinCdSearchVO.setsLangCd(langCd);
        itemDistinCdSearchVO.setsCmmGrpCd("PAR101");
        itemDistinCdSearchVO.setsUseYn("Y");
        itemDistinCdSearchVO.setsRemark1("PAR");

        List<CommonCodeVO> itemDstinCdList = PartCommonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO);

        //가격계산유형 공통코드정보 조회.
        List<CommonCodeVO> salePrcTpList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd);

        List<PartsVenderSalPriceTargetExcelDownVO> list = selectPartsVenderSalPriceTargetMastersExcelDownByCondition(searchVO);

        //창고정보 가져오기.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> strgeCdList     = new ArrayList<StorageVO>();

        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        strgeCdList = PartStorageService.selectStoragesByCondition(storageSearchVO);

        HashMap<String, String> storageMap = new HashMap<String, String>();
        for( StorageVO storageVO : strgeCdList ){
            storageMap.put(storageVO.getStrgeCd(), storageVO.getStrgeNm());
        }

        for(PartsVenderSalPriceTargetExcelDownVO partsVenderSalPriceTargetExcelDownVO : list){

            for(CommonCodeVO itemDstinCdVO :itemDstinCdList){
                if(StringUtil.nullConvert(partsVenderSalPriceTargetExcelDownVO.getItemDstinCd()).equals(itemDstinCdVO.getCmmCd())){
                    partsVenderSalPriceTargetExcelDownVO.setItemDstinCd(itemDstinCdVO.getCmmCdNm());
                    break;
                }
            }

            for(CommonCodeVO salePrcTpCdVO :salePrcTpList){
                if(StringUtil.nullConvert(partsVenderSalPriceTargetExcelDownVO.getStdPrcCd()).equals(salePrcTpCdVO.getCmmCd())){
                    partsVenderSalPriceTargetExcelDownVO.setStdPrcCd(salePrcTpCdVO.getCmmCdNm());
                    break;
                }
            }

            partsVenderSalPriceTargetExcelDownVO.setStrgeCd(storageMap.get(String.valueOf(partsVenderSalPriceTargetExcelDownVO.getStrgeCd())));
            resultList.add(partsVenderSalPriceTargetExcelDownVO);
        }

        context.putVar("items", resultList);
    }

    
    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService#selectPartsVenderSalPriceTargetMastersExcelDownByCondition(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO)
     */
    @Override
    public List<PartsVenderSalPriceTargetExcelDownVO> selectPartsVenderSalPriceTargetMastersExcelDownByCondition(
            PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception {
        return PartPartsVenderSalPriceTargetMasterDAO.selectPartsVenderSalPriceTargetMastersExcelDownByCondition(searchVO);
    }

   
}
