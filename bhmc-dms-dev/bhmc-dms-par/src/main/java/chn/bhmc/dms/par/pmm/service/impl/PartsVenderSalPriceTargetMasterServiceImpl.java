package chn.bhmc.dms.par.pmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceMasterService;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetHistoryService;
import chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService;
import chn.bhmc.dms.par.pmm.service.dao.PartsVenderSalPriceTargetMasterDAO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceMasterVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetExcelDownVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetExcelVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetHistoryVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetSaveVO;

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
@Service("partsVenderSalPriceTargetMasterService")
public class PartsVenderSalPriceTargetMasterServiceImpl extends HService implements PartsVenderSalPriceTargetMasterService , JxlsSupport {

    /**
     * 부품가격 DAO
     */
    @Resource(name="partsVenderSalPriceTargetMasterDAO")
    private PartsVenderSalPriceTargetMasterDAO partsVenderSalPriceTargetMasterDAO;

    /**
     * 부품가격 서비스
     */
    @Resource(name="partsVenderSalPriceMasterService")
    PartsVenderSalPriceMasterService partsVenderSalPriceMasterService;

    /**
     * 부품가격 히스토리 서비스
     */
    @Resource(name="partsVenderSalPriceTargetHistoryService")
    PartsVenderSalPriceTargetHistoryService partsVenderSalPriceTargetHistoryService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 부품마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    ItemMasterService itemMasterService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService#multiPartsVenderSalPriceTargetMaster(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiPartsVenderSalPriceTargetMaster(PartsVenderSalPriceTargetSaveVO obj)
            throws Exception {

        // 판매가 생성 대상선정 헤더 VO
        PartsVenderSalPriceTargetHistoryVO partsVenderSalPriceTargetHistoryVO;
        //판매가 생성 대상선정 상세 VO
        List<PartsVenderSalPriceTargetMasterVO> partsVenderSalPriceTargetMasterDetailVO = new ArrayList<PartsVenderSalPriceTargetMasterVO>();
        // 저장 데이타 가져오기.
        partsVenderSalPriceTargetHistoryVO = obj.getPartsVenderSalPriceTargetHistoryVO();
        partsVenderSalPriceTargetMasterDetailVO = obj.getPartsVenderSalPriceTargetMasterDetailVO();

        for(PartsVenderSalPriceTargetMasterVO partsVenderSalPriceTargetMasterItemVO : partsVenderSalPriceTargetMasterDetailVO){

            PartsVenderSalPriceMasterSearchVO searchVO = new PartsVenderSalPriceMasterSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());//딜러코드
            searchVO.setsPrcTp("01");//가격유형
            searchVO.setsItemCdOnly(partsVenderSalPriceTargetMasterItemVO.getItemCd());//부품코드
            searchVO.setsStrgeCd(partsVenderSalPriceTargetMasterItemVO.getStrgeCd());//창고코드

            partsVenderSalPriceTargetMasterItemVO.setDlrCd(LoginUtil.getDlrCd());

            if(partsVenderSalPriceMasterService.selectPartsVenderSalPriceMastersByConditionCnt(searchVO) > 0){
                // 수정
                try{
                    partsVenderSalPriceMasterService.updatePartsVenderSalPriceTargetMaster(partsVenderSalPriceTargetMasterItemVO);
                    //2020.09.10 update by tjx 修改售后服务中维修组合中的配件价格
                    partsVenderSalPriceMasterService.updatePackagePar(partsVenderSalPriceTargetMasterItemVO);
                }catch(Exception ex){
                }

            }else{
                // 추가
                partsVenderSalPriceMasterService.insertPartsVenderSalPriceTargetMaster(partsVenderSalPriceTargetMasterItemVO);
            }
            // 소매가 판매가격 히스토리 VO 생성.
            PartsVenderSalPriceTargetHistoryVO partsVenderSalPriceTargetHistoryItemVO = new PartsVenderSalPriceTargetHistoryVO();

            // 딜러코드,부품코드,가격유형,라인번호,적용여부,판매단가,구매수량,부품단위,시작일자,종료일자
            partsVenderSalPriceTargetHistoryItemVO.setDlrCd(LoginUtil.getDlrCd());
            partsVenderSalPriceTargetHistoryItemVO.setItemCd(partsVenderSalPriceTargetMasterItemVO.getItemCd());
            partsVenderSalPriceTargetHistoryItemVO.setStrgeCd(partsVenderSalPriceTargetMasterItemVO.getStrgeCd());
            partsVenderSalPriceTargetHistoryItemVO.setPrcTp("01");
            partsVenderSalPriceTargetHistoryItemVO.setLineNo(1);
            partsVenderSalPriceTargetHistoryItemVO.setApplyYn("Y");
            partsVenderSalPriceTargetHistoryItemVO.setSalePrcAmt(partsVenderSalPriceTargetMasterItemVO.getPurcPrc());//구매단가  = 판매단가
            partsVenderSalPriceTargetHistoryItemVO.setPrcQty(partsVenderSalPriceTargetMasterItemVO.getPurcPrc());
            partsVenderSalPriceTargetHistoryItemVO.setPrcQtyUnitCd(partsVenderSalPriceTargetMasterItemVO.getPrcQtyUnitCd());
            partsVenderSalPriceTargetHistoryItemVO.setStartDt(partsVenderSalPriceTargetMasterItemVO.getStartDt());
            partsVenderSalPriceTargetHistoryItemVO.setEndDt(partsVenderSalPriceTargetMasterItemVO.getEndDt());

            // 삭제여부,적용일자,판매세금율
            partsVenderSalPriceTargetHistoryItemVO.setDelYn("N");
            partsVenderSalPriceTargetHistoryItemVO.setApplyDt(partsVenderSalPriceTargetHistoryVO.getApplyDt());
            partsVenderSalPriceTargetHistoryItemVO.setSaleTaxRate(partsVenderSalPriceTargetMasterItemVO.getSaleTaxRate());

            //판매가격 : 도매,소매,보험,보증
            partsVenderSalPriceTargetHistoryItemVO.setRetlPrc(partsVenderSalPriceTargetMasterItemVO.getRetlPrc());
            partsVenderSalPriceTargetHistoryItemVO.setWhslPrc(partsVenderSalPriceTargetMasterItemVO.getWhslPrc());
            partsVenderSalPriceTargetHistoryItemVO.setIncPrc(partsVenderSalPriceTargetMasterItemVO.getIncPrc());
            partsVenderSalPriceTargetHistoryItemVO.setGrtePrc(partsVenderSalPriceTargetMasterItemVO.getGrtePrc());

            //추가 세금율 : 도매,소매,보험,보증
            partsVenderSalPriceTargetHistoryItemVO.setRetlAddTaxRate(partsVenderSalPriceTargetMasterItemVO.getRetlAddTaxRate());
            partsVenderSalPriceTargetHistoryItemVO.setWhslAddTaxRate(partsVenderSalPriceTargetMasterItemVO.getWhslAddTaxRate());
            partsVenderSalPriceTargetHistoryItemVO.setIncAddTaxRate(partsVenderSalPriceTargetMasterItemVO.getIncAddTaxRate());
            partsVenderSalPriceTargetHistoryItemVO.setGrteAddTaxRate(partsVenderSalPriceTargetMasterItemVO.getGrteAddTaxRate());

            // 세금공제가격 : 도매,소매,보험,보증
            partsVenderSalPriceTargetHistoryItemVO.setTaxDdctRetlPrc(partsVenderSalPriceTargetMasterItemVO.getTaxDdctRetlPrc());
            partsVenderSalPriceTargetHistoryItemVO.setTaxDdctWhslPrc(partsVenderSalPriceTargetMasterItemVO.getTaxDdctWhslPrc());
            partsVenderSalPriceTargetHistoryItemVO.setTaxDdctIncPrc(partsVenderSalPriceTargetMasterItemVO.getTaxDdctIncPrc());
            partsVenderSalPriceTargetHistoryItemVO.setTaxDdctGrtePrc(partsVenderSalPriceTargetMasterItemVO.getTaxDdctGrtePrc());

            // 기타가격
            partsVenderSalPriceTargetHistoryItemVO.setEtcPrc1(partsVenderSalPriceTargetMasterItemVO.getEtcPrc1());
            partsVenderSalPriceTargetHistoryItemVO.setEtcPrc2(partsVenderSalPriceTargetMasterItemVO.getEtcPrc2());
            partsVenderSalPriceTargetHistoryItemVO.setEtcPrc3(partsVenderSalPriceTargetMasterItemVO.getEtcPrc3());
            // 기타세금공제가격
            partsVenderSalPriceTargetHistoryItemVO.setTaxDdctEtcPrc1(partsVenderSalPriceTargetMasterItemVO.getTaxDdctEtcPrc1());
            partsVenderSalPriceTargetHistoryItemVO.setTaxDdctEtcPrc2(partsVenderSalPriceTargetMasterItemVO.getTaxDdctEtcPrc2());
            partsVenderSalPriceTargetHistoryItemVO.setTaxDdctEtcPrc3(partsVenderSalPriceTargetMasterItemVO.getTaxDdctEtcPrc3());

            partsVenderSalPriceTargetHistoryItemVO.setBmpOpnPrc(partsVenderSalPriceTargetMasterItemVO.getBmpOpnPrc());
            partsVenderSalPriceTargetHistoryItemVO.setRectGiPrc(partsVenderSalPriceTargetMasterItemVO.getRectGiPrc());
            partsVenderSalPriceTargetHistoryItemVO.setStdPrc(partsVenderSalPriceTargetMasterItemVO.getStdPrc());

            partsVenderSalPriceTargetHistoryItemVO.setRegUsrId(LoginUtil.getUserId());
            //소매가 히스토리 추가.
            partsVenderSalPriceTargetHistoryService.insertPartsVenderSalPriceTargetHistory(partsVenderSalPriceTargetHistoryItemVO);
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService#selectPartsVenderSalPriceTargetMastersByCondition(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO)
     */
    @Override
    public List<PartsVenderSalPriceTargetMasterVO> selectPartsVenderSalPriceTargetMastersByCondition(
            PartsVenderSalPriceTargetMasterSearchVO searchVO) throws Exception {
        return partsVenderSalPriceTargetMasterDAO.selectPartsVenderSalPriceTargetMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.PartsVenderSalPriceTargetMasterService#selectPartsVenderSalPriceTargetMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.PartsVenderSalPriceTargetMasterSearchVO)
     */
    @Override
    public int selectPartsVenderSalPriceTargetMastersByConditionCnt(PartsVenderSalPriceTargetMasterSearchVO searchVO)
            throws Exception {
        return partsVenderSalPriceTargetMasterDAO.selectPartsVenderSalPriceTargetMastersByConditionCnt(searchVO);
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

        List<CommonCodeVO> itemDstinCdList = commonCodeService.selectCommonCodesByCmmGrpCd(itemDistinCdSearchVO);

        //가격계산유형 공통코드정보 조회.
        List<CommonCodeVO> salePrcTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR133", null, langCd);

        List<PartsVenderSalPriceTargetExcelDownVO> list = selectPartsVenderSalPriceTargetMastersExcelDownByCondition(searchVO);

        //창고정보 가져오기.
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> strgeCdList     = new ArrayList<StorageVO>();

        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        strgeCdList = storageService.selectStoragesByCondition(storageSearchVO);

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
        return partsVenderSalPriceTargetMasterDAO.selectPartsVenderSalPriceTargetMastersExcelDownByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustDupCheck(java.util.List)
     */
    @SuppressWarnings("unused")
    @Override
    public List<PartsVenderSalPriceTargetExcelVO> selectPartsPriceExcelValidate(List<PartsVenderSalPriceTargetExcelVO> list) throws Exception {

        try {
            PartsVenderSalPriceTargetExcelVO partsVenderSalPriceTargetExcelVO = new PartsVenderSalPriceTargetExcelVO();
            List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
            List<PartsVenderSalPriceTargetExcelVO> resultList = new ArrayList<PartsVenderSalPriceTargetExcelVO>();
            String msg;
            String dlrCd = LoginUtil.getDlrCd();

            //창고정보 가져오기.
            StorageSearchVO storageSearchVO = new StorageSearchVO();
            storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            storageSearchVO.setsPltCd(LoginUtil.getPltCd());
            List<StorageVO> strgeCdList = storageService.selectStoragesByCondition(storageSearchVO);

            PartsVenderSalPriceMasterVO chkPrcItem = new PartsVenderSalPriceMasterVO();

            for(int i = 0;i < list.size();i++){
                partsVenderSalPriceTargetExcelVO = new PartsVenderSalPriceTargetExcelVO();
                errors = new ArrayList<ExcelUploadError>();
                int totErrCnt = 0;

                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                //부품코드 체크
                boolean bItemCdYn = false;

                //부품번호 없을때
                if(StringUtils.isBlank(list.get(i).getItemCd())){
                    msg = messageSource.getMessage("par.info.itemInsertNotMsg"
                            ,new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())}
                            ,LocaleContextHolder.getLocale()
                        );

                    errors.add(new ExcelUploadError(i, 24, null, msg));
                    totErrCnt = totErrCnt + 1;
                }else{//부품번호 있을 때

                    ItemMasterSearchVO itemMasterSearchVO = new ItemMasterSearchVO();
                    itemMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    itemMasterSearchVO.setsItemCdOnly(list.get(i).getItemCd());

                    int iItemCdUseYnCnt = itemMasterService.selectItemMastersByConditionCnt(itemMasterSearchVO);

                    if(iItemCdUseYnCnt > 0){
                        bItemCdYn = true;
                    }else{
                        msg = messageSource.getMessage("par.info.itemInsertNotMsg"
                                ,new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())}
                                ,LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 24, null, msg));
                        totErrCnt = totErrCnt + 1;
                    }
                }

                //창고명 체크
                boolean bStrgeCdYn = false;
                if(StringUtils.isBlank(list.get(i).getGrStrgeNm())){
                    msg = messageSource.getMessage("par.info.notStorgeMsg", null, LocaleContextHolder.getLocale());

                    errors.add(new ExcelUploadError(i, 14, list.get(i).getGrStrgeCd(), msg));
                    totErrCnt = totErrCnt + 1;

                }else{//창고명 기준 창고코드 넣기.
                    //창고명 가져오기.
                    String sStrgeCd = "";
                    for(StorageVO storageVO : strgeCdList){
                        if(storageVO.getStrgeNm().equals(list.get(i).getGrStrgeNm())){
                            sStrgeCd = storageVO.getStrgeCd();
                            list.get(i).setGrStrgeCd(storageVO.getStrgeCd());
                            bStrgeCdYn = true;
                            break;
                        }
                    }

                    if(!bStrgeCdYn){
                        msg = messageSource.getMessage("par.info.notStorgeMsg", null, LocaleContextHolder.getLocale());

                            errors.add(new ExcelUploadError(i, 14, list.get(i).getGrStrgeCd(), msg));
                            totErrCnt = totErrCnt + 1;
                    }
                }

                //부품가격 테이블 부품확인
                if(bItemCdYn && bStrgeCdYn){
                    chkPrcItem = new PartsVenderSalPriceMasterVO();

                    PartsVenderSalPriceTargetMasterSearchVO partsVenderSalPriceTargetMasterSearchVO = new PartsVenderSalPriceTargetMasterSearchVO();
                    partsVenderSalPriceTargetMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    partsVenderSalPriceTargetMasterSearchVO.setsItemCdOnly(list.get(i).getItemCd());
                    partsVenderSalPriceTargetMasterSearchVO.setsStrgeCd(list.get(i).getGrStrgeCd());

                    int iItemCdUseYnFromStrgeCd = partsVenderSalPriceTargetMasterDAO.selectPartsVenderSalPriceTargetMastersByConditionCnt(partsVenderSalPriceTargetMasterSearchVO);

                    //부품가격정보에  없는 부품 인 경우
                    if(iItemCdUseYnFromStrgeCd == 0){
                        //message : 창고에 해당 부품 정보 없음
                        msg = messageSource.getMessage("par.info.notItemInStrgeMsg", null, LocaleContextHolder.getLocale());

                        errors.add(new ExcelUploadError(i, 14, null, msg));
                        totErrCnt = totErrCnt + 1;
                    }
                }

                String payAmtChkTrue = "N";
                Double dChkVal = 0.0;
                //소매가격 체크.
                if(StringUtils.isBlank(list.get(i).getSalePriceCost01())){
                    msg = messageSource.getMessage("global.info.required.field"
                        ,new String[]{messageSource.getMessage("par.lbl.salePriceCost01", null, LocaleContextHolder.getLocale())}
                        ,LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 24, list.get(i).getSalePriceCost01(), msg));
                    totErrCnt = totErrCnt + 1;

                }else {//소매가격 숫자 체크.
                    payAmtChkTrue = "N";
                    //숫자 체크.
                    dChkVal = 0.0;
                    try{
                        dChkVal = Double.parseDouble(list.get(i).getSalePriceCost01());
                        if(dChkVal < 0){//마이너스 금액 시
                            list.get(i).setSalePriceCost01("0.0");
                        }
                        payAmtChkTrue = "Y";

                    }catch(NumberFormatException ex){
                        payAmtChkTrue = "N";
                        //값 초기화.
                        list.get(i).setSalePriceCost01(null);
                    }
                    //금액 숫자 체크 N 일때 에러 메시지 추가.
                    if("N".equals(payAmtChkTrue)){
                        msg = messageSource.getMessage("sal.info.exclNumberCheck"
                            ,new String[]{ messageSource.getMessage("par.lbl.salePriceCost01", null, LocaleContextHolder.getLocale())}
                            ,LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 24, null, msg));
                        totErrCnt = totErrCnt + 1;
                    }
                }
                //판매단가 체크
                if(StringUtils.isBlank(list.get(i).getSalePriceCost02())){
                    msg = messageSource.getMessage("global.info.required.field"
                        ,new String[]{messageSource.getMessage("par.lbl.salePriceCost02", null, LocaleContextHolder.getLocale())}
                        ,LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 24, list.get(i).getSalePriceCost02(), msg));
                    totErrCnt = totErrCnt + 1;

                }else {//판매단가 숫자 체크.
                    payAmtChkTrue = "N";
                    //숫자 체크.
                    dChkVal = 0.0;
                    try{
                        dChkVal = Double.parseDouble(list.get(i).getSalePriceCost02());
                        if(dChkVal < 0){//마이너스 금액 시
                            list.get(i).setSalePriceCost02("0.0");
                        }
                        payAmtChkTrue = "Y";
                    }catch(NumberFormatException ex){
                        payAmtChkTrue = "N";
                        //값 초기화.
                        list.get(i).setSalePriceCost02(null);
                    }
                    //금액 숫자 체크 N 일때 에러 메시지 추가.
                    if(payAmtChkTrue.equals("N")){
                        msg = messageSource.getMessage("sal.info.exclNumberCheck"
                            ,new String[]{messageSource.getMessage("par.lbl.salePriceCost02", null, LocaleContextHolder.getLocale())}
                            ,LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 24, null, msg));
                        totErrCnt = totErrCnt + 1;
                    }
                }
                //보험단가 체크
                if(StringUtils.isBlank(list.get(i).getSalePriceCost03())){
                    msg = messageSource.getMessage("global.info.required.field"
                        ,new String[]{messageSource.getMessage("par.lbl.salePriceCost03", null, LocaleContextHolder.getLocale())}
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 24, list.get(i).getSalePriceCost03(), msg));
                    totErrCnt = totErrCnt + 1;

                }else {//보험단가 숫자 체크.
                    payAmtChkTrue = "N";
                    //숫자 체크.
                    dChkVal = 0.0;
                    try{
                        dChkVal = Double.parseDouble(list.get(i).getSalePriceCost03());
                        if(dChkVal < 0){//마이너스 금액 시
                            list.get(i).setSalePriceCost03("0.0");
                        }
                        payAmtChkTrue = "Y";
                    }catch(NumberFormatException ex){
                        payAmtChkTrue = "N";
                        //값 초기화.
                        list.get(i).setSalePriceCost03(null);
                    }
                    //금액 숫자 체크 N 일때 에러 메시지 추가.
                    if("N".equals(payAmtChkTrue)){
                        msg = messageSource.getMessage("sal.info.exclNumberCheck"
                            ,new String[]{messageSource.getMessage("par.lbl.salePriceCost03", null, LocaleContextHolder.getLocale())}
                            ,LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 24, null, msg));
                        totErrCnt = totErrCnt + 1;
                    }
                }

                //에러데이타 넣기.
                list.get(i).setErrors(errors);
                list.get(i).setErrorCount(totErrCnt);

                //액셀결과 리스트 항목 추가.
                resultList.add(list.get(i));
            }

            return resultList;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * 부품가격 파일업로드(문건도입) 데이터 저장.
     */
    @Override
    public void updatePartsPriceUpload(List<PartsVenderSalPriceTargetExcelVO> list) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(PartsVenderSalPriceTargetExcelVO partsVenderSalPriceTargetExcelVO : list){
            partsVenderSalPriceTargetExcelVO.setDlrCd(dlrCd);
            partsVenderSalPriceTargetExcelVO.setUpdtUsrId(userId);

            //본테이블에 저장(PT_0214T)
            partsVenderSalPriceTargetMasterDAO.updatePartsPrice(partsVenderSalPriceTargetExcelVO);

        }
    }


}
