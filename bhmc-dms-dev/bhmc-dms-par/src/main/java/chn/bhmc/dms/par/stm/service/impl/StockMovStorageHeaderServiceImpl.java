package chn.bhmc.dms.par.stm.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService;
import chn.bhmc.dms.par.stm.service.dao.StockMovStorageDAO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageDetailVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageSaveVO;
import chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 재고이동 헤더 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 5. 12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 12.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("stockMovStorageHeaderService")
public class StockMovStorageHeaderServiceImpl extends HService implements StockMovStorageHeaderService  , JxlsSupport {

    /**
     * StockMovStorageHeader DAO : 창고이동 헤더
     */
    @Resource(name="stockMovStorageDAO")
    private StockMovStorageDAO stockMovStorageDAO;

    /**
     * MvtDocService : 수불문서
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * EtcGiDocNoIdgenService : 기타입출고문서키생성
     */
    @Resource(name="etcGiDocNoIdgenService")
    EgovIdGnrService etcGiDocNoIdgenService;

    /**
     * 창고관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * CommonCodeService : 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 부품이동평균가격 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;


    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /**
     *  SystemConfigInfoService : 시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#insertStockMovStorageHeader(chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO)
     */
    @Override
    public int insertStockMovStorageHeader(StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception {
        stockMovStorageHeaderVO.setDlrCd(LoginUtil.getDlrCd());
        stockMovStorageHeaderVO.setRegUsrId(LoginUtil.getUserId());
        return stockMovStorageDAO.insertStockMovStorageHeader(stockMovStorageHeaderVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#insertStockMovStorageSave(chn.bhmc.dms.par.stm.vo.StockMovStorageSaveVO)
     */
    @Override
    public StockMovStorageSaveVO insertStockMovStorageSave(StockMovStorageSaveVO stockMovStorageSaveVO) throws Exception {

        return stockMovStorageSaveVO;
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#createStockMovStorageReg(java.util.List, chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO)
     */
    @Override
    public StockMovStorageHeaderVO createStockMovStorageReg(List<StockMovStorageDetailVO> list,
            StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception {


        try{
            int issueEtcLineNo = 1;
            int resultCnt = 0;
            double qty = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd = LoginUtil.getDlrCd();
            String pltCd = LoginUtil.getPltCd();

            StockMovStorageSearchVO searchVO = new StockMovStorageSearchVO();

            //유효성 Array
            String[] lblList = new String[1];

            // 1. 기타출고 번호를 생성한다.
            String issueEtcNo =  etcGiDocNoIdgenService.getNextStringId();
            stockMovStorageHeaderVO.setEtcGiDocNo(issueEtcNo);

            // 2. 기타출고 상태를 설정한다.
            stockMovStorageHeaderVO.setStatCd("01"); //"01" 등록상태.

            // 3. 기타출고 헤더를 생성한다.
            stockMovStorageHeaderVO.setDlrCd(dlrCd);
            stockMovStorageHeaderVO.setPltCd(pltCd);
            stockMovStorageHeaderVO.setRegUsrId(userId);
            resultCnt = stockMovStorageDAO.insertStockMovStorageHeader(stockMovStorageHeaderVO);

            if(resultCnt < 1){
                //기타출고 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                qty = list.get(i).getStrgeMoveStockQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if( (list.get(i).getGiStrgeCd() == null) || (list.get(i).getGiStrgeCd().isEmpty())){
                    lblList[0] = messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale()); //출고창고
                    throw processException("par.info.issueCheckMsg", lblList);
                }

                if( (list.get(i).getGrStrgeCd() == null) || (list.get(i).getGrStrgeCd().isEmpty())){
                    lblList[0] = messageSource.getMessage("par.lbl.grStrgeCd", null, LocaleContextHolder.getLocale()); //출고창고
                    throw processException("par.info.issueCheckMsg", lblList);
                }

                if( (list.get(i).getGrStrgeCd().equals(list.get(i).getGiStrgeCd()))){
                    throw processException("par.err.chkStockMoveSameStrgeCd");
                }

                //이동수량체크
                if(list.get(i).getStrgeMoveStockQty() > list.get(i).getStrgeStockQty()){
                    lblList = new String[2];
                    lblList[0] = messageSource.getMessage("par.lbl.strgeMoveStockQty", null, LocaleContextHolder.getLocale()); //로케이션재고수량
                    lblList[1] = messageSource.getMessage("par.lbl.strgeStockQty", null, LocaleContextHolder.getLocale());     //이동수량
                    throw processException("par.info.itemReqCntMsg", lblList);
                }

                //amt = qty * list.get(i).getPrc();

                list.get(i).setEtcGiDocNo(issueEtcNo);
                list.get(i).setEtcGiDocLineNo(issueEtcLineNo);
                list.get(i).setCancYn("N");
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setGiStatCd("01");

                resultCnt = stockMovStorageDAO.insertStockMovStorageDetail(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                issueEtcLineNo = issueEtcLineNo + 1;
            }

            searchVO.setsDlrCd(dlrCd);
            searchVO.setsEtcGiDocNo(issueEtcNo);
            stockMovStorageHeaderVO = stockMovStorageDAO.selectStockMovStorageHeaderByKey(searchVO);

            return stockMovStorageHeaderVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#createStockMovStorageCnfm(java.util.List, chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO)
     */
    @Override
    public StockMovStorageHeaderVO createStockMovStorageCnfm(List<StockMovStorageDetailVO> list,
            StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception {


        try{
            int resultCnt = 0;
            double qty = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd = LoginUtil.getDlrCd();
            String pltCd = LoginUtil.getPltCd();

            //수불 생성(기타출고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            StockMovStorageDetailVO stockMovStorageDetailVO = new StockMovStorageDetailVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();
            MvtDocItemVO mvtDocItemInfoVO = new MvtDocItemVO();

            mvtDocVO.setMvtTp(stockMovStorageHeaderVO.getMvtTp());

            stockMovStorageHeaderVO.setDlrCd(dlrCd);
            stockMovStorageHeaderVO.setRegUsrId(userId);

            chkStockMovStorageUpdateSomebody(stockMovStorageHeaderVO);

            mvtDocVO.setBpCd(dlrCd);

            VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
            VatInfoVO vatInfoVO = new VatInfoVO();
            int vatInfoCnt = 0;

            vatInfoSearchVO.setsVatId("V01");
            vatInfoSearchVO.setsVatTypeCd("ALL");

            vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

            if(vatInfoCnt == 1){
                vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
            }else{
                vatInfoVO.setVatApplyRate(0.16);
            }

            // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                qty = list.get(i).getStrgeMoveStockQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(list.get(i).getMovingAvgPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getGrReasonCd() == null) || (list.get(i).getGrReasonCd().isEmpty())){
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getGrStrgeCd().equals(list.get(i).getGiStrgeCd()))){
                    throw processException("par.err.chkStockMoveSameStrgeCd");
                }


                list.get(i).setGiStatCd("02");
                list.get(i).setRegUsrId(userId);
                list.get(i).setDlrCd(dlrCd);

                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(pltCd);
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setFrStrgeCd(list.get(i).getGiStrgeCd());//확정 시from창고가 출고창고
                mvtDocItemVO.setToStrgeCd(list.get(i).getGrStrgeCd());//확정 시to창고가 입고창고
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(qty);
                mvtDocItemVO.setSalePrc(list.get(i).getMovingAvgPrc());
                mvtDocItemVO.setSaleAmt(list.get(i).getMovingAvgAmt());
                mvtDocItemVO.setRefDocNo(stockMovStorageHeaderVO.getEtcGiDocNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getEtcGiDocLineNo());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGrReasonCd());

                mvtItemList.add(mvtDocItemVO);

                resultCnt = stockMovStorageDAO.updateCnfmStockMovStorageItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }
            }

            stockMovStorageHeaderVO.setStatCd("02");
            resultCnt = stockMovStorageDAO.updateStockMovStorage(stockMovStorageHeaderVO);

            if(resultCnt < 1){
                //기타출고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //기타출고부품의 출고 확정이 처리되지 않았습니다.
               throw processException("par.err.failedEtcIssueMsg");
            }

            //생성된 수불 정보를 기타출고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                if(mvtSaveItemList.get(i).getAutoCreYn() != "Y"){
                    stockMovStorageDetailVO = new StockMovStorageDetailVO();
                    mvtDocItemInfoVO = new MvtDocItemVO();

                    stockMovStorageDetailVO.setDlrCd(dlrCd);
                    stockMovStorageDetailVO.setRegUsrId(userId);
                    stockMovStorageDetailVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                    stockMovStorageDetailVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                    stockMovStorageDetailVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());


                    mvtDocItemInfoVO = mvtDocService.selectMvtDocItem(dlrCd, mvtSaveItemList.get(i).getMvtDocYyMm(), mvtSaveItemList.get(i).getMvtDocNo(), mvtSaveItemList.get(i).getMvtDocLineNo());
                    stockMovStorageDetailVO.setMovingAvgPrc(mvtDocItemInfoVO.getMovingAvgPrc());
                    stockMovStorageDetailVO.setMovingAvgAmt(mvtDocItemInfoVO.getMovingAvgAmt());

                    if(stockMovStorageHeaderVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
                        stockMovStorageDetailVO.setEtcGiDocNo(stockMovStorageHeaderVO.getEtcGiDocNo());
                        stockMovStorageDetailVO.setEtcGiDocLineNo(i + 1);
                    }else{
                        stockMovStorageDetailVO.setEtcGiDocNo(mvtSaveItemList.get(i).getRefDocNo());
                        stockMovStorageDetailVO.setEtcGiDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());
                    }

                    resultCnt = stockMovStorageDAO.updateStockMovStorageItemMvtInfo(stockMovStorageDetailVO);

                    if(resultCnt < 1){
                        //기타출고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                    }
                }
            }
            return stockMovStorageHeaderVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#multiStockMovStorages(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO)
     */
    @Override
    public void multiStockMovStorages(BaseSaveVO<StockMovStorageDetailVO> obj,
            StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception {

        try{
            int resultCnt = 0;
            double qty = 0;
            int issueEtcLineNo = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd = LoginUtil.getDlrCd();

            stockMovStorageHeaderVO.setDlrCd(dlrCd);
            stockMovStorageHeaderVO.setRegUsrId(userId);

            chkStockMovStorageUpdateSomebody(stockMovStorageHeaderVO);

            issueEtcLineNo = stockMovStorageDAO.selectStockMovStorageMaxLineNo(stockMovStorageHeaderVO);

            for(StockMovStorageDetailVO itemVO : obj.getInsertList()){

                qty = itemVO.getStrgeMoveStockQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if( (itemVO.getGrReasonCd() == null) || (itemVO.getGrReasonCd().isEmpty())){
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                }

                if( (itemVO.getGrStrgeCd().equals(itemVO.getGiStrgeCd()))){
                    throw processException("par.err.chkStockMoveSameStrgeCd");
                }

                itemVO.setEtcGiDocNo(stockMovStorageHeaderVO.getEtcGiDocNo());
                itemVO.setEtcGiDocLineNo(issueEtcLineNo);
                itemVO.setCancYn("N");
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setGiStatCd("01");

                resultCnt = stockMovStorageDAO.insertStockMovStorageDetail(itemVO);

                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

                issueEtcLineNo = issueEtcLineNo + 1;
            }

            for(StockMovStorageDetailVO itemVO : obj.getUpdateList()){

                qty = itemVO.getStrgeMoveStockQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if( (itemVO.getGrReasonCd() == null) || (itemVO.getGrReasonCd().isEmpty())){
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                }

                if( (itemVO.getGrStrgeCd().equals(itemVO.getGiStrgeCd()))){
                    throw processException("par.err.chkStockMoveSameStrgeCd");
                }

                itemVO.setDlrCd(dlrCd);
                itemVO.setUpdtUsrId(userId);

                resultCnt = stockMovStorageDAO.updateStockMovStorageItem(itemVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(StockMovStorageDetailVO itemVO : obj.getDeleteList()){
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setGiStatCd("03");

                resultCnt = stockMovStorageDAO.deleteRegStockMovStorageItem(itemVO);

                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            resultCnt = stockMovStorageDAO.updateStockMovStorage(stockMovStorageHeaderVO);

            if(resultCnt < 1){
              //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#cancelStockMovStorage(java.util.List, chn.bhmc.dms.par.stm.vo.StockMovStorageHeaderVO)
     */
    @Override
    public int cancelStockMovStorage(List<StockMovStorageDetailVO> list, StockMovStorageHeaderVO stockMovStorageHeaderVO)
            throws Exception {

        try{
            int resultCnt = 0;
            double qty = 0;
            String dlrCd  = LoginUtil.getDlrCd();
            int lstSize = list.size();

            // 유효성 Array

            stockMovStorageHeaderVO.setStatCd("03"); //취소상태로 수정
            stockMovStorageHeaderVO.setRegUsrId(LoginUtil.getUserId());
            stockMovStorageHeaderVO.setDlrCd(LoginUtil.getDlrCd());
            stockMovStorageHeaderVO.setPltCd(LoginUtil.getPltCd());

            // 수불 생성(기타출고 취소)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            chkStockMovStorageUpdateSomebody(stockMovStorageHeaderVO);

            mvtDocVO.setMvtTp(stockMovStorageHeaderVO.getMvtTp());
            mvtDocVO.setBpCd(dlrCd);

            VatInfoSearchVO vatInfoSearchVO = new VatInfoSearchVO();;
            VatInfoVO vatInfoVO = new VatInfoVO();
            int vatInfoCnt = 0;

            vatInfoSearchVO.setsVatId("V01");
            vatInfoSearchVO.setsVatTypeCd("ALL");

            vatInfoCnt = vatInfoService.selectVatByDateCnt(vatInfoSearchVO);

            if(vatInfoCnt == 1){
                vatInfoVO = vatInfoService.selectVatByDate(vatInfoSearchVO);
            }else{
                vatInfoVO.setVatApplyRate(0.16);
            }

            // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < lstSize; i++){
                mvtDocItemVO = new MvtDocItemVO();

                qty = list.get(i).getStrgeMoveStockQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(i == 0){
                    mvtDocVO.setMvtDocYyMm(list.get(i).getMvtDocYyMm());
                    mvtDocVO.setMvtDocNo(list.get(i).getMvtDocNo());
                }

                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setGiStatCd("03");
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                resultCnt = stockMovStorageDAO.deleteStockMovStorageItem(list.get(i));

                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{list.get(i).getItemCd()});
                }


                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(stockMovStorageHeaderVO.getPltCd());
                mvtDocItemVO.setCancStmtYn("Y");
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(qty);
                mvtDocItemVO.setSalePrc(list.get(i).getMovingAvgPrc());
                mvtDocItemVO.setSaleAmt(list.get(i).getMovingAvgAmt());
                mvtDocItemVO.setToStrgeCd(list.get(i).getGiStrgeCd());//취소 시 to창고가 입고창고(확정시 출고된 정보가 취소시 입고정보가됨)
                mvtDocItemVO.setFrStrgeCd(list.get(i).getGrStrgeCd());//취소 시 from창고가 출고창고(확정시 입고된 정보가 취소시 출고정보가됨)
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGrReasonCd());
                mvtDocItemVO.setRefDocNo(list.get(i).getMvtDocNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getMvtDocLineNo());
                mvtDocItemVO.setGiDocNo(list.get(i).getEtcGiDocNo());
                mvtDocItemVO.setGiDocLineNo(list.get(i).getEtcGiDocLineNo());

                mvtItemList.add(mvtDocItemVO);

            }

            resultCnt = stockMovStorageDAO.cancelStockMovStorage(stockMovStorageHeaderVO);

            if(resultCnt < 1){
                //기타출고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiCnclMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //기타출고부품의 출고 확정이 처리되지 않았습니다.
               throw processException("par.err.failedEtcIssueMsg");
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }


    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageByKey(java.lang.String, java.lang.String)
     */
    @Override
    public StockMovStorageHeaderVO selectStockMovStorageHeaderByKey(StockMovStorageSearchVO searchVO) throws Exception {
        return stockMovStorageDAO.selectStockMovStorageHeaderByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageHeadersByCondition(chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO)
     */
    @Override
    public List<StockMovStorageHeaderVO> selectStockMovStorageHeadersByCondition(StockMovStorageSearchVO searchVO)
            throws Exception {
        return stockMovStorageDAO.selectStockMovStorageByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageHeadersByConditionCnt(chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO)
     */
    @Override
    public int selectStockMovStorageHeadersByConditionCnt(StockMovStorageSearchVO searchVO) throws Exception {
        return stockMovStorageDAO.selectStockMovStorageByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageDetailSummaryListByCondition(chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO)
     */
    @Override
    public List<StockMovStorageDetailVO> selectStockMovStorageDetailSummaryListByCondition(
            StockMovStorageSearchVO searchVO) throws Exception {
        return stockMovStorageDAO.selectStockMovStorageDetailSummaryListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageDetailSummaryListByConditionCnt(chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO)
     */
    @Override
    public int selectStockMovStorageDetailSummaryListByConditionCnt(StockMovStorageSearchVO searchVO) throws Exception {
        return stockMovStorageDAO.selectStockMovStorageDetailSummaryListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageListSummaryByCondition(chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO)
     */
    @Override
    public List<StockMovStorageHeaderVO> selectStockMovStorageListSummaryByCondition(StockMovStorageSearchVO searchVO)
            throws Exception {
        return stockMovStorageDAO.selectStockMovStorageListSummaryByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageListSummaryByConditionCnt(chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO)
     */
    @Override
    public int selectStockMovStorageListSummaryByConditionCnt(StockMovStorageSearchVO searchVO) throws Exception {
        return stockMovStorageDAO.selectStockMovStorageListSummaryByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageItemByKey(chn.bhmc.dms.par.stm.vo.StockMovStorageSearchVO)
     */
    @Override
    public List<StockMovStorageDetailVO> selectStockMovStorageItemByKey(StockMovStorageSearchVO searchVO)
            throws Exception {
        return stockMovStorageDAO.selectStockMovStorageItemByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockMovStorageHeaderService#selectStockMovStorageItemExcelUploadByKey(chn.bhmc.dms.par.stm.vo.StockMovStorageDetailVO)
     */
    @Override
    public StockMovStorageDetailVO selectStockMovStorageItemExcelUploadByKey(
            StockMovStorageDetailVO stockMovStorageDetailVO) throws Exception {

        return stockMovStorageDAO.selectStockMovStorageItemExcelUploadByKey(stockMovStorageDetailVO);
    }

    public void chkStockMovStorageUpdateSomebody(StockMovStorageHeaderVO stockMovStorageHeaderVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = stockMovStorageDAO.selectStockMovStorageUpdtDtByKey(stockMovStorageHeaderVO);

            if(!updtDtStrNow.equals(stockMovStorageHeaderVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.strgeMoveDocNo", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.strgeMoveDocNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        StockMovStorageSearchVO searchVO = new StockMovStorageSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        searchVO.setsItemCd(params.get("sItemCd").toString());
        searchVO.setsItemNm(params.get("sItemNm").toString());

        searchVO.setsEtcGiDocNo(params.get("sEtcGiDocNo").toString());
        searchVO.setsGrStrgeCd(params.get("sGrStrgeCd").toString());
        searchVO.setsGiStrgeCd(params.get("sGiStrgeCd").toString());
        searchVO.setsMvtTp(params.get("sMvtTp").toString());

        if(!StringUtils.isBlank(params.get("sRegDtFr").toString())){
            String sRegDtFr = params.get("sRegDtFr").toString();
            Date dReqStartDt = Date.valueOf(sRegDtFr);
            searchVO.setsRegDtFr(dReqStartDt);
        }

        if(!StringUtils.isBlank(params.get("sRegDtTo").toString())){
            String sRegDtTo = params.get("sRegDtTo").toString();
            Date dRegDtTo = Date.valueOf(sRegDtTo);
            searchVO.setsRegDtTo(dRegDtTo);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        //재고이동현황 or 재고이동명세 조회 구분자(boolean)
        if(!searchVO.issStockMovStorageHeaderFlag()){
            //재고이동상태
            List<CommonCodeVO> statCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR403", null, langCd);

            //재고이동현황 조회.
            List<StockMovStorageHeaderVO> list = selectStockMovStorageListSummaryByCondition(searchVO);

            //공통코드 또는 코드 명칭  변환 처리.
            for(StockMovStorageHeaderVO stockMovStorageHeaderVO : list){
                //statCd
                for(CommonCodeVO statCdVO : statCdList){
                    if(statCdVO.getCmmCd().equals(stockMovStorageHeaderVO.getStatCd())){
                        stockMovStorageHeaderVO.setStatCd(statCdVO.getCmmCdNm());
                        break;
                    }
                }

                String grDtString = DateUtil.convertToString(stockMovStorageHeaderVO.getGrDt(), dateFormat);
                stockMovStorageHeaderVO.setGrDtString(grDtString);
            }

            context.putVar("items", list);

        }else{//재고이동상세

            //재고이동명세 조회.
            List<StockMovStorageDetailVO> list = selectStockMovStorageDetailSummaryListByCondition(searchVO);

            StorageSearchVO storageSearchVO = new StorageSearchVO();
            storageSearchVO.setsPltCd(LoginUtil.getPltCd());
            storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());

            //공통코드 또는 코드 명칭  변환 처리.
            for(StockMovStorageDetailVO stockMovStorageDetailVO : list){

                String grDtString = DateUtil.convertToString(stockMovStorageDetailVO.getGrDt(), dateFormat);
                stockMovStorageDetailVO.setGrDtString(grDtString);
            }

            context.putVar("items", list);
        }
    }


}
