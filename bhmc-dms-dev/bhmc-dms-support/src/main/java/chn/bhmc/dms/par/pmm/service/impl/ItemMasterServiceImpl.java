package chn.bhmc.dms.par.pmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.exception.FdlException;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.ism.service.IssueReqDetailService;
import chn.bhmc.dms.par.ism.vo.IssueReqSearchVO;
import chn.bhmc.dms.par.pmm.service.ItemMasterGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.PackagePartsHeaderService;
import chn.bhmc.dms.par.pmm.service.dao.ItemMasterDAO;
import chn.bhmc.dms.par.pmm.service.dao.MvtDocDAO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterExcelDownVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterExcelVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterPackageSaveVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocSearchVO;
import chn.bhmc.dms.par.pmm.vo.PackagePartsHeaderVO;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;

/**
 * 품목마스터 관리 서비스 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Service("itemMasterService")
public class ItemMasterServiceImpl extends HService implements ItemMasterService, JxlsSupport {

    /**
     * 품목마스터 관리 DAO
     */
	@Resource(name="itemMasterDAO")
	ItemMasterDAO itemMasterDAO;

	 /**
     * 수불마스터 관리 DAO
     */
	 @Resource(name="mvtDocDAO")
	 MvtDocDAO mvtDocDAO;

	 /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

	 /**
     * 부품유형 서비스
     */
	 @Resource(name="itemMasterGroupService")
	 ItemMasterGroupService itemMasterGroupService;

	 /**
     * 구매요청상세 서비스
     */
	 @Resource(name="issueReqDetailService")
     IssueReqDetailService issueReqDetailService;

	 /**
     * 패키지 헤더 서비스
     */
     @Resource(name="packagePartsHeaderService")
     PackagePartsHeaderService packagePartsHeaderService;


     /**
      * 현재고 서비스
      */
     @Resource(name="stockInOutService")
     StockInOutService stockInOutService;


	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertItemMaster(ItemMasterVO itemMasterVO) throws Exception {
        String[] lblList = new String[1];
        ItemMasterSearchVO itemMasterSearchVO = new ItemMasterSearchVO();
        itemMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        itemMasterSearchVO.setsItemCd(itemMasterVO.getItemCd());
        itemMasterSearchVO.setsGrStrgeCd(itemMasterVO.getGrStrgeCd());
        ItemMasterVO vo = selectItemMasterByKey(itemMasterSearchVO);

        StockInOutVO stockInOutInsertVO = new StockInOutVO();

        String sPartsMainStrgeCd = "WHP1";
        String sSaleMainStrgeCd = "WHC1";

        stockInOutInsertVO.setItemCd(itemMasterVO.getItemCd());

        if("20".equals(itemMasterVO.getItemDstinCd())){//용품영역

            if(StringUtils.isEmpty(itemMasterVO.getGrStrgeCd())){
                stockInOutInsertVO.setStrgeCd(sSaleMainStrgeCd);
                itemMasterVO.setGrStrgeCd(sSaleMainStrgeCd);
                itemMasterVO.setGiStrgeCd(sSaleMainStrgeCd);
            }else{
                stockInOutInsertVO.setStrgeCd(itemMasterVO.getGrStrgeCd());
            }
        }else{//부품영역

            //해당부품의 기준창고를 조회한다.(기준창고: 해당부품의 앞5자리로 모든 가용재고를 창고별로 조회및 SUM하여 가장 큰 창고)
            String standardStrgeCd = itemMasterDAO.selectStandardStrgeCdByItemCd(itemMasterSearchVO);

            if(standardStrgeCd == null){
                stockInOutInsertVO.setStrgeCd(sPartsMainStrgeCd);
                itemMasterVO.setGrStrgeCd(sPartsMainStrgeCd);
                itemMasterVO.setGiStrgeCd(sPartsMainStrgeCd);

            }else{
                stockInOutInsertVO.setStrgeCd(standardStrgeCd);
                itemMasterVO.setGrStrgeCd(standardStrgeCd);
                itemMasterVO.setGiStrgeCd(standardStrgeCd);
            }
        }

        // 빈재고 데이터 생성(기준 창고정보)
        //stockInOutService.insertEmptyStockInOut(stockInOutInsertVO);

        if(vo != null) {
            lblList[0] = itemMasterVO.getItemCd(); // 품목코드
            Exception e = processException("par.info.duplicatePartInfoChk", lblList);
            throw e;
        }
        //stockUnitCd empty
        if(StringUtils.isEmpty(itemMasterVO.getStockUnitCd())){
            itemMasterVO.setStockUnitCd("EA");//default stockUnitCd
        }
        //itemDstinCd empty
        if(StringUtils.isEmpty(itemMasterVO.getItemDstinCd())){
            itemMasterVO.setItemDstinCd("02");//default parts
        }

        return itemMasterDAO.insertItemMaster(itemMasterVO);
    }


    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#insertItemMaster(chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO)
     */
    @Override
    public int insertItemMaster(ItemMasterSaveVO itemMasterSaveVO) throws Exception {

        //부품기본정보 insert
        this.insertItemMaster(itemMasterSaveVO.getSaveVO());
        //부품기본정보 부품유형 insert and update
        itemMasterGroupService.multiItemMasterGroups(itemMasterSaveVO);

        return 1;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#insertItemMaster(chn.bhmc.dms.par.pmm.vo.ItemMasterPackageSaveVO)
     */
    @Override
    public int insertItemMaster(ItemMasterPackageSaveVO itemMasterPackageSaveVO) throws Exception {

        ItemMasterVO itemMasterVO = itemMasterPackageSaveVO.getItemMasterVO();
        itemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        itemMasterVO.setRegUsrId(LoginUtil.getUserId());

        ItemMasterSearchVO searchVO = new ItemMasterSearchVO();
        int itemCnt = itemMasterDAO.selectItemMastersByConditionCnt(searchVO);

        if(itemCnt == 0 ){
            //부품마스터 패키지 추가.
            this.insertItemMaster(itemMasterVO);
        }

        PackagePartsHeaderVO packagePartsHeaderVO = itemMasterPackageSaveVO.getPackagePartsHeaderVO();
        packagePartsHeaderVO.setDlrCd(LoginUtil.getDlrCd());
        packagePartsHeaderVO.setRegUsrId(LoginUtil.getUserId());

        //패키지 헤더 추가.
        packagePartsHeaderService.insertPackagePartsHeader(packagePartsHeaderVO);

        return 1;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#updateItemMasterPkg(chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO)
     */
    @Override
    public int updateItemMaster(ItemMasterPackageSaveVO itemMasterPackageSaveVO) throws Exception {

        PackagePartsHeaderVO packagePartsHeaderVO = itemMasterPackageSaveVO.getPackagePartsHeaderVO();
        packagePartsHeaderVO.setDlrCd(LoginUtil.getDlrCd());
        packagePartsHeaderVO.setUpdtUsrId(LoginUtil.getUserId());

        ItemMasterVO itemMasterVO = itemMasterPackageSaveVO.getItemMasterVO();
        itemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        itemMasterVO.setRegUsrId(LoginUtil.getUserId());

        chkItemMasterUpdateSomebody(itemMasterVO);

        //패키지 헤더 수정.
        packagePartsHeaderService.updatePackagePartsHeader(packagePartsHeaderVO);

        itemMasterDAO.updateItemByPackage(itemMasterVO);

        return 1;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateItemMaster(ItemMasterVO itemMasterVO) throws Exception {

        //stockUnitCd empty
        if(StringUtils.isEmpty(itemMasterVO.getStockUnitCd())){
            itemMasterVO.setStockUnitCd("EA");//default stockUnitCd
        }
        //itemDstinCd empty
        if(StringUtils.isEmpty(itemMasterVO.getItemDstinCd())){
            itemMasterVO.setItemDstinCd("02");//default parts
        }
        //grStrgeCd empty
        if(StringUtils.isEmpty(itemMasterVO.getGrStrgeCd())){
            itemMasterVO.setGrStrgeCd("WHP1");//default strgeCd
        }
        //set giStrgeCd
        itemMasterVO.setGiStrgeCd(itemMasterVO.getGrStrgeCd());

        chkItemMasterUpdateSomebody(itemMasterVO);

        return itemMasterDAO.updateItemMaster(itemMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#updateItemMaster(chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO)
     */
    @Override
    public int updateItemMaster(ItemMasterSaveVO itemMasterSaveVO) throws Exception {

        //부품기본정보 update
        this.updateItemMaster(itemMasterSaveVO.getSaveVO());
        //부품기본정보 부품유형 insert and update
        itemMasterGroupService.multiItemMasterGroups(itemMasterSaveVO);

        return 1;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#updateItemLocCdMaster(chn.bhmc.dms.par.pmm.vo.ItemMasterVO)
     */
    @Override
    public int updateItemLocCdMaster(ItemMasterVO itemMasterVO) throws Exception {
        itemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        itemMasterVO.setUpdtUsrId(LoginUtil.getUserId());

        chkItemMasterUpdateSomebody(itemMasterVO);

        return itemMasterDAO.updateItemLocCdMaster(itemMasterVO);
    }

    /**
     * {@inheritDoc}
     */
    public int deleteItemMaster(ItemMasterVO itemMasterVO) throws Exception {
        itemMasterVO.setDlrCd(LoginUtil.getDlrCd());
        itemMasterVO.setRegUsrId(LoginUtil.getUserId());

        chkItemMasterUpdateSomebody(itemMasterVO);

        return itemMasterDAO.deleteItemMaster(itemMasterVO);
    };

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#deleteLocalItemMaster(chn.bhmc.dms.par.pmm.vo.ItemMasterVO)
     */
    @Override
    public int deleteLocalItemMaster(ItemMasterVO itemMasterVO) throws Exception {

        String[] lblList = new String[1];
        StockInOutVO stockInOutDeleteVO = new StockInOutVO();
        //로컬부품인지 체크
        if(!"02".equals(itemMasterVO.getSpyrCd())){
            lblList[0] = messageSource.getMessage("par.lbl.localParts", null, LocaleContextHolder.getLocale());//로컬부품만
            //로컬 부품만 삭제가능 메시지.
            throw processException("par.info.localInfoForDelete", lblList);
        }

        MvtDocSearchVO mvtDocSearchVO = new MvtDocSearchVO();
        mvtDocSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        mvtDocSearchVO.setsItemCd(itemMasterVO.getItemCd());

        //chkItemMasterUpdateSomebody(itemMasterVO);

        //수불발생 입고확인
        if(mvtDocService.selectGrListForDeleteCnt(mvtDocSearchVO) > 0){
            lblList[0] = messageSource.getMessage("par.lbl.mvtPartsInfo", null, LocaleContextHolder.getLocale());//수불 부품
            //삭제불가 메시지.
            throw processException("par.info.existInfoForDelete", lblList);
        }

        //수불발생 출고확인
        if(mvtDocService.selectGiListForDeleteCnt(mvtDocSearchVO) > 0){
            lblList[0] = messageSource.getMessage("par.lbl.mvtPartsInfo", null, LocaleContextHolder.getLocale());//수불 부품
            //삭제불가 메시지.
            throw processException("par.info.existInfoForDelete", lblList);
        }

        IssueReqSearchVO issueReqSearchVO = new IssueReqSearchVO();
        issueReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        issueReqSearchVO.setsItemCd(itemMasterVO.getItemCd());
        issueReqSearchVO.setsParGiTp("SR");//부품예약
        if(issueReqDetailService.selectIssueReqDetailsByConditionForItemDeleteCnt(issueReqSearchVO) > 0){
            //부품예류 발생한 부품은 삭제 불가
            lblList[0] = messageSource.getMessage("par.lbl.issueResvParts", null, LocaleContextHolder.getLocale());//부품예류 부품
            //삭제불가 메시지.
            throw processException("par.info.issueResvInfoForDelete", lblList);
        }

        issueReqSearchVO.setsParGiTp("RO");//부품출고
        if(issueReqDetailService.selectIssueReqDetailsByConditionForItemDeleteCnt(issueReqSearchVO) > 0){
            //부품출고 발생한 부품은 삭제 불가
            lblList[0] = messageSource.getMessage("par.lbl.issueOutParts", null, LocaleContextHolder.getLocale());//부품출고 부품
            //삭제불가 메시지.
            throw processException("par.info.issueOutInfoForDelete", lblList);

        }

        stockInOutDeleteVO.setDlrCd(LoginUtil.getDlrCd());
        stockInOutDeleteVO.setPltCd(LoginUtil.getPltCd());
        stockInOutDeleteVO.setItemCd(itemMasterVO.getItemCd());
        stockInOutService.deleteStockInfo(stockInOutDeleteVO);

        return itemMasterDAO.deleteLocalItemMaster(itemMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#updateItemByPackage(chn.bhmc.dms.par.pmm.vo.ItemMasterVO)
     */
    @Override
    public int updateItemByPackage(ItemMasterVO itemMasterVO) throws Exception {
        return itemMasterDAO.updateItemByPackage(itemMasterVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public ItemMasterVO selectItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO) throws Exception {
        return itemMasterDAO.selectItemMasterByKey(itemMasterSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectMobileItemMasterByKey(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public ItemMasterVO selectMobileItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO) throws Exception {
        return itemMasterDAO.selectMobileItemMasterByKey(itemMasterSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ItemMasterVO> selectItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectPopItemMastersByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectPopItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectPopItemMastersByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectComItemMastersByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectComItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectComItemMastersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemMastersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectPopItemMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectPopItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectPopItemMastersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectComItemMastersByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectComItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectComItemMastersByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemPopupByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectItemPopupByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemPopupByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemPopupByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectItemPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemPopupByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemSalePrcPopupByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectItemSalePrcPopupByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemSalePrcPopupByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemSalePrcPopupByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectItemSalePrcPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemSalePrcPopupByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemGrtePrcPopupByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectItemGrtePrcPopupByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemGrtePrcPopupByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemGrtePrcPopupByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectItemGrtePrcPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemGrtePrcPopupByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemSalePrcForServicePopupByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectItemSalePrcForServicePopupByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemSalePrcForServicePopupByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemSalePrcForServicePopupByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectItemSalePrcForServicePopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemSalePrcForServicePopupByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemPopupByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectSearchItemPopupByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectSearchItemPopupByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemPopupByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectSearchItemPopupByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectSearchItemPopupByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectSearchItemPopupByQnACondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectSearchItemPopupByQnACondition(ItemMasterSearchVO searchVO) throws Exception {

        return itemMasterDAO.selectSearchItemPopupByQnACondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectSearchItemPopupByQnAConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectSearchItemPopupByQnAConditionCnt(ItemMasterSearchVO searchVO) throws Exception {

        return itemMasterDAO.selectSearchItemPopupByQnAConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectPurcPrcItemByKey(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public ItemMasterVO selectPurcPrcItemByKey(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectPurcPrcItemByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectPurcPrcItemByKeyCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectPurcPrcItemByKeyCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectPurcPrcItemByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectSalePrcItemByKey(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public ItemMasterVO selectSalePrcItemByKey(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectSalePrcItemByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectSalePrcItemByKeyCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectSalePrcItemByKeyCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectSalePrcItemByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectInventoryInfoByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectInventoryInfoByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectInventoryInfoByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectInventoryInfoByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectInventoryInfoByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectInventoryInfoByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectPurcPrcItemsForSuggest(java.lang.String, int)
     */
    @Override
    //public List<ItemMasterVO> selectPurcPrcItemsForSuggest(String query, int maxRows) throws Exception {
    public List<ItemMasterVO> selectPurcPrcItemsForSuggest(ItemMasterSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        if(StringUtils.isBlank(searchVO.getsItemCd())){
            return new ArrayList<ItemMasterVO>();
        }
        return itemMasterDAO.selectPurcPrcItemsForSuggest(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectSalePrcItemsForSuggest(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectSalePrcItemsForSuggest(ItemMasterSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        if(StringUtils.isBlank(searchVO.getsItemCd())){
            return new ArrayList<ItemMasterVO>();
        }
        return itemMasterDAO.selectSalePrcItemsForSuggest(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectIssueReqItemSalePrcByKeyIn(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectIssueReqItemSalePrcByKeyIn(ItemMasterSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return itemMasterDAO.selectIssueReqItemSalePrcByKeyIn(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ItemMasterSearchVO searchVO = new ItemMasterSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsItemCd(params.get("sItemCd").toString());
        searchVO.setsItemNm(params.get("sItemNm").toString());
        searchVO.setsItemDstinCd(params.get("sItemDstinCd").toString());
        searchVO.setsCarlineCd(params.get("sCarlineCd").toString());
        searchVO.setsCarlineCd2(params.get("sCarlineCd2").toString());
        searchVO.setsBpTp(params.get("sBpTp").toString());
        searchVO.setsBrandCd(params.get("sBrandCd").toString());
        searchVO.setsBpNm(params.get("sBpNm").toString());
        searchVO.setsAbcInd(params.get("sAbcInd").toString());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ItemMasterExcelDownVO> list = selectItemMastersExcelDownByCondition(searchVO);
        context.putVar("items", list);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemMastersExcelDownByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterExcelDownVO> selectItemMastersExcelDownByCondition(ItemMasterSearchVO searchVO) throws Exception {

        return itemMasterDAO.selectItemMastersExcelDownByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectStandardStrgeCdByItemCd(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public String selectStandardStrgeCdByItemCd(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectStandardStrgeCdByItemCd(searchVO);
    }

    public void chkItemMasterUpdateSomebody(ItemMasterVO itemMasterVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = itemMasterDAO.selectItemMasterUpdtDtByKey(itemMasterVO);

            if(!updtDtStrNow.equals(itemMasterVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#multiItemMasterExcelData(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiItemMasterExcelData(List<ItemMasterExcelVO> itemMasterExcelList) {

        ItemMasterSearchVO itemMasterSearchVO = new ItemMasterSearchVO();
        StockInOutVO stockInOutInsertVO = new StockInOutVO();
        String standardStrgeCd;

        //ItemMaster Insert or Update Data
        for(ItemMasterExcelVO itemMasterExcelVO : itemMasterExcelList){
            itemMasterExcelVO.setDlrCd(LoginUtil.getDlrCd());
            itemMasterExcelVO.setRegUsrId(LoginUtil.getUserId());
            itemMasterExcelVO.setUpdtUsrId(LoginUtil.getUserId());

            itemMasterSearchVO = new ItemMasterSearchVO();
            itemMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            itemMasterSearchVO.setsItemCd(itemMasterExcelVO.getItemCd());

            if(itemMasterExcelVO.getOldRplcParCmptYn().isEmpty()){
                itemMasterExcelVO.setOldRplcParCmptYn("N");
            }

            if(itemMasterExcelVO.getNewRplcParCmptYn().isEmpty()){
                itemMasterExcelVO.setNewRplcParCmptYn("N");
            }

            //stockUnitCd empty
            if(StringUtils.isEmpty(itemMasterExcelVO.getStockUnitCd())){
                itemMasterExcelVO.setStockUnitCd("EA");//default stockUnitCd
            }
            //itemDstinCd empty
            if(StringUtils.isEmpty(itemMasterExcelVO.getItemDstinCd())){
                itemMasterExcelVO.setItemDstinCd("02");//default parts
            }

            if(itemMasterDAO.selectItemMastersByConditionCnt(itemMasterSearchVO) == 0){
                stockInOutInsertVO = new StockInOutVO();

                standardStrgeCd = "";

                //해당부품의 기준창고를 조회한다.(기준창고: 해당부품의 앞5자리로 모든 가용재고를 창고별로 조회및 SUM하여 가장 큰 창고)
                standardStrgeCd = itemMasterDAO.selectStandardStrgeCdByItemCd(itemMasterSearchVO);

                if(standardStrgeCd == null){
                    stockInOutInsertVO.setStrgeCd("WHP1");
                    stockInOutInsertVO.setItemCd(itemMasterExcelVO.getItemCd());

                    itemMasterExcelVO.setGrStrgeCd("WHP1");
                    itemMasterExcelVO.setGiStrgeCd("WHP1");
                }else{
                    stockInOutInsertVO.setStrgeCd(standardStrgeCd);
                    stockInOutInsertVO.setItemCd(itemMasterExcelVO.getItemCd());

                    itemMasterExcelVO.setGrStrgeCd(standardStrgeCd);
                    itemMasterExcelVO.setGiStrgeCd(standardStrgeCd);
                }

                // 빈재고 데이터 생성(기준 창고정보)
                //stockInOutService.insertEmptyStockInOut(stockInOutInsertVO);

                itemMasterDAO.insertItemMasterExcel(itemMasterExcelVO);
            }else{
                itemMasterDAO.updateItemMasterExcel(itemMasterExcelVO);
            }
        }
    }
    
    /*
     * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemPopupByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> selectReceiveEtcBorrowByCondition(ItemMasterSearchVO searchVO) throws Exception {
    	return itemMasterDAO.selectReceiveEtcBorrowByCondition(searchVO);
    }
    
    /*
     * 借进登记入库修改弹出配件选择窗口 add by lyy 2018-09-07
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectItemPopupByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectReceiveEtcBorrowByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
    	return itemMasterDAO.selectReceiveEtcBorrowByConditionCnt(searchVO);
    }

}
