package chn.bhmc.dms.par.stm.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.stm.vo.StockInOutCalcVO;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pmm.service.PartsPriceBwmsService;
import chn.bhmc.dms.par.pmm.service.dao.ItemMasterDAO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.PartsPriceBwmsItemVO;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.service.dao.StockInOutDAO;
import chn.bhmc.dms.par.stm.vo.ItemMovingAvgPrcVO;
import chn.bhmc.dms.par.stm.vo.StockInOutExcelVO;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceDlrInfoVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceResultVO;
import chn.bhmc.dms.par.stm.vo.StockInterfaceVO;



/**
 * 현재고 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("stockInOutService")
public class StockInOutServiceImpl extends HService implements StockInOutService , JxlsSupport {

    Logger logger = LoggerFactory.getLogger(StockInOutServiceImpl.class);

    @Resource(name="stockInOutDAO")
    private StockInOutDAO stockInOutDAO;

    /**
     * 품목마스터 관리 DAO
     */
    @Resource(name="itemMasterDAO")
    ItemMasterDAO itemMasterDAO;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 부품이동평균가격 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;

    /**
     * 부품 BWMS 보증가격 서비스
     */
    @Resource(name="partsPriceBwmsService")
    PartsPriceBwmsService partsPriceBwmsService;

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockInOutByKey(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public StockInOutVO selectStockInOutByKey(String dlrCd, String pltCd, String strgeCd, String itemCd) {
        return stockInOutDAO.selectStockInOutByKey(dlrCd, pltCd, strgeCd, itemCd);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#insertStockInOut(chn.bhmc.dms.par.stm.vo.StockInOutVO)
     */
    @Override
    public int insertStockInOut(StockInOutVO stockInOutInsertVO) {
        return stockInOutDAO.insertStockInOut(stockInOutInsertVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#updateStockInOut(chn.bhmc.dms.par.stm.vo.StockInOutVO)
     */
    @Override
    public int updateStockInOut(StockInOutVO stockInOutVO) {
        return stockInOutDAO.updateStockInOut(stockInOutVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#updateStockInOutByStockLockInfo(chn.bhmc.dms.par.stm.vo.StockInOutVO)
     */
    @Override
    public int updateStockInOutByStockLockInfo(StockInOutVO stockInOutVO) throws Exception {
        return stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#deleteStockInfo(chn.bhmc.dms.par.stm.vo.StockInOutVO)
     */
    @Override
    public int deleteStockInfo(StockInOutVO stockInOutVO) throws Exception {
        return stockInOutDAO.deleteStockInfo(stockInOutVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#multiSaveStockInOut(chn.bhmc.dms.core.datatype.BaseSaveVO)
     * [1]. 필수 값 점검.
     *   1) 딜러(dlrCd)/센터(pltCd)/창고(strgeCd)/품목번호(itemCd)
     *      /최근입출고일자 수정여부(rectGrGiDtUpdtYn)/수불입출고유형(mvtGrGiTp)/취소수불여부(cnclMvtYn)
     *      /재고상태(가용/예약/보류등)/수량(qty)/재고계산구분자(+/-)
     *   2) LOC코드는 옵션
     *
     * [2]. 유효성 점검 -StockInOutService.selectStockInOutByKey(딜러, 센터, 창고, 품목번호)     *
     *   1) 현재고 정보
     *      - 딜러코드(dlrCd), 센터(pltCd), 창고(strgeCd), 품목번호(itemCd)에 해당하는 현재고 정보가 있는지 확인.
     *        -> 없으면 현재고 정보 Insert
     *
     *      - 수불유형의 프로세스 유형(mvtTp)이 '판매'인 경우 고객(custNo) 필수
     *   2) Loc 품목 정보
     *      - Loc코드가 있는 경우: PT_0222T 정보조회
     *          딜러(dlrCd), 센터(pltCd), 창고(strgeCd), 로케이션(locCd), 품목번호(itemCd)
     *   3) 재고계산구분자
     *      - 공통코드그룹UPT11에 존재하는 값인지 점검
     *
     * [3]. 창고재고 점검
     *    1) 재고계산 구분자가 "-"일 경우
     *       현재고가 처리하고자 하는 수량보다 작은경우 오류
     *
     * [4]. Location 수불여부에 따른 처리
     *    1) 입력받은 LOC코드가 존재하면 Location수불처리.
     *    2) 재고구분자가 "-"일 경우
     *       Location마스터정보의 재고 수량이 처리하고자 하는 수량보다 작은경우 오류
     *    3) Loc마스터정보 Update
     *
     * [5]. 재고정보 수정
     *
     * [6]. 부품 최종 입출고 일자 수정
     *    1) rectGrGiDtUpdtYn(부품최종 입출고 일자) 수정여부에 따라
     *       부품마스터의 최종 입출고 일자 수정을 실행한다.
     *    2) 부품 최종 입출고 일자 수정여부가 'Y'인 경우
     *       mvtGrGiTp(수불입출고유형)에 따라 최종 입고일, 최종 출고일중
     *       어떤 항목을 수정할지 정한다.
     *    3) cnclMvtYn(취소수불여부)에 따라 수정 할지 수정 취소할 지 정한다.
     *
     *  [7]. 렌트유형(rentType)
     *     1) 차입, 차출 수불 발생 시 '35', '36', '47', '48' 대여, 반환 수량 수정을 위해 필요
     *
     *     2) 위 유형 외에는 빈값을 넘기고
     *        '35': 차입등기입고      'B' '+'
     *        '48': 차입반환 출고 시 'B' '-'
     *        '36': 차출반환입고      'R' '-'
     *        '47': 차출등기 출고 시 'R' '+'
     *  [8]. 재고금액(stockAmt)
     *     1) 수불 발생 시 재고 금액 수정 위해 필요
     *
     *     2) 입고는 구매입고...기타입고 등등 입력한 금액이 입고금액이되고
     *        반환 시 입력했던 입고 금액으로 (-)입고금액을 만든다.
     *        판매 및 출고는 이동평균금액을 기준으로 출고금액을 만들고
     *        반품 및 취소 시 판매(출고) 당시의 이동평균금액을 가지고와서
     *         (-)출고금액을 만든다.
     *       (창고 이동 시 가용 - > 예약, 가용 -> 보류 혹은 그 반대는 상태만 변경하는 것이기 때문에 재고금액이 0 임)
     *        *창고 이동 "21"[가용 -> 가용], "22"[취소(가용 -> 가용)]만 이동평균원가를 재고금액에 반영함.
     *
     *  [9]. 보증가 계산여부(grtePrcChkYn)
     *     1) 수불유형이 '31', '32' 즉 기초재고입고, 기초재고입고 취소를 통해 발생한 경우 보증가 계산을 제외한다.
     *     2) 그외의 모든 수불은 보증가 계산을 정상적으로 진행한다.
     */
    @Override
    public int multiSaveStockInOut(StockInOutCalcVO stockInOutCalcVO) throws Exception {
            //String dlrCd, String pltCd, String strgeCd, String itemCd, String rectGrGiDtUpdtYn,String mvtGrGiTp, String cnclMvtYn, String stockSt, double qty, double stockAmt, String calcTp, String rentType, String grtePrcChkYn) throws Exception {

        int insertCnt      = 0;
        int updateStockCnt = 0;
        int selectPrcCnt   = 0;
        StockInOutVO stockInOutVO       = null;
        StockInOutVO stockInOutInsertVO = new StockInOutVO(); //현재고 정보가 없는 경우 기본값 Insert하기 위해 사용되는 변수
        ItemMasterVO itemMasterVO       = new ItemMasterVO(); //최종입출고일자 수정을 위해 사용

        // [이동평균가격]부품이동평균가격정보
        ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        /*********************************************
         * 파라미터 필수값 점검
         *********************************************/
        if( (stockInOutCalcVO.getDlrCd() == null) || (stockInOutCalcVO.getDlrCd().isEmpty())){
            //딜러정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
        }
        if( (stockInOutCalcVO.getPltCd() == null) || (stockInOutCalcVO.getPltCd().isEmpty())){
            //센터정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
        }
        if( (stockInOutCalcVO.getStrgeCd() == null) || (stockInOutCalcVO.getStrgeCd().isEmpty())){
            //창고정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
        }
        if( (stockInOutCalcVO.getItemCd() == null) || (stockInOutCalcVO.getItemCd().isEmpty())){
            //품목정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
        }
        if( (stockInOutCalcVO.getStockSt() == null) || (stockInOutCalcVO.getStockSt().isEmpty())){
            //재고상태정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockStat", null, LocaleContextHolder.getLocale())});
        }
        /*if(stockInOutCalcVO.getQty() <= 0){
            //수량정보를 다시 확인해 주세요
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
        }*/
        /*
        if(stockInOutCalcVO.getStockAmt() <= 0){
            //재고금액정보를 다시 확인해 주세요
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockPrice", null, LocaleContextHolder.getLocale())});
        }
        */
        if( (stockInOutCalcVO.getCalcTp() == null) || (stockInOutCalcVO.getCalcTp().isEmpty())){
            //재고계산구분자 정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockCalcTp", null, LocaleContextHolder.getLocale())});
        }else{
           if(!stockInOutCalcVO.getCalcTp().equals("+") && !stockInOutCalcVO.getCalcTp().equals("-")){
               //재고계산구분자 정보를 확인해주세요..
               throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockCalcTp", null, LocaleContextHolder.getLocale())});
           }
        }
        /*********************************************
         * 파라미터 필수값 점검종료
         *********************************************/

        /*********************************************
         * 유효성 점검
         *********************************************/

        stockInOutVO  = stockInOutDAO.selectStockInOutByKey(stockInOutCalcVO.getDlrCd(), stockInOutCalcVO.getPltCd(), stockInOutCalcVO.getStrgeCd(), stockInOutCalcVO.getItemCd());

        itemMasterVO.setDlrCd(stockInOutCalcVO.getDlrCd());
        itemMasterVO.setItemCd(stockInOutCalcVO.getItemCd());
        itemMasterVO.setRegUsrId(LoginUtil.getUserId());


        //존재하는 재고정보인 경우
        if(stockInOutVO != null){

            //재고실사로 인하여 재고 통제가 걸린 경우 수불 생성 불가!
            if( stockInOutVO.getStockLockYn().equals("Y")){
                throw processException("par.err.stockLockMsgParam", new String[]{stockInOutVO.getItemCd()});
            }

        //현재고 정보가 존재하지 않을 경우
        }else{

            stockInOutInsertVO.setDlrCd(stockInOutCalcVO.getDlrCd());
            stockInOutInsertVO.setPltCd(stockInOutCalcVO.getPltCd());
            stockInOutInsertVO.setStrgeCd(stockInOutCalcVO.getStrgeCd());
            stockInOutInsertVO.setItemCd(stockInOutCalcVO.getItemCd());
            stockInOutInsertVO.setAvlbStockQty(0);
            stockInOutInsertVO.setClamStockQty(0);
            stockInOutInsertVO.setGiScheQty(0);
            stockInOutInsertVO.setGrScheQty(0);
            stockInOutInsertVO.setRentQty(0);
            stockInOutInsertVO.setBorrowQty(0);
            stockInOutInsertVO.setResvStockQty(0);
            stockInOutInsertVO.setRegUsrId(LoginUtil.getUserId());

            //기초재고 정보가 모두 0인 부품의 재고 정보를 생성한다.
            insertCnt = stockInOutDAO.insertStockInOut(stockInOutInsertVO);

            //등록된 건이 없거나 생각보다 많이 등록된 경우
            if(insertCnt != 1 ){
               //현재고의 정보가 제대로 등록되지 않았습니다.
               throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.currStock", null, LocaleContextHolder.getLocale())});
            }

            stockInOutVO = stockInOutInsertVO;
        }

        /********************************************************************
         * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
         * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
         * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
         * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
         ********************************************************************/
        searchItemMovingAvgPrcVO.setItemCd(stockInOutCalcVO.getItemCd()); //부품코드
        searchItemMovingAvgPrcVO.setStrgeCd(stockInOutCalcVO.getStrgeCd()); //창고코드
        searchItemMovingAvgPrcVO.setDlrCd(stockInOutCalcVO.getDlrCd()); //딜러코드

        selectPrcCnt = itemMovingAvgPrcService.selectPartsVenderSalPriceMastersByItemInfoCnt(searchItemMovingAvgPrcVO);

        //부품 SearchVO
        ItemMasterSearchVO itemSearchVO = new ItemMasterSearchVO();
        itemSearchVO.setsDlrCd(stockInOutCalcVO.getDlrCd());
        itemSearchVO.setsGrStrgeCd(stockInOutCalcVO.getStrgeCd());
        itemSearchVO.setsItemCd(stockInOutCalcVO.getItemCd());

        /*
         * 보증부품 & 마크업 정보 확인 후 보증가격정보 가져오기.
         * */

        PartsPriceBwmsItemVO partsPriceBwmsItemVO = new PartsPriceBwmsItemVO();
        if(stockInOutCalcVO.getGrtePrcChkYn() == "Y"){
            try{
                partsPriceBwmsItemVO = partsPriceBwmsService.selectBwmsItemCdByKey(itemSearchVO);
                if(partsPriceBwmsItemVO != null){
                    //보증가격
                    partsPriceBwmsItemVO.setGrtePrc(partsPriceBwmsItemVO.getMarkUpPrc());
                    //bmp구매원가
                    partsPriceBwmsItemVO.setBmpPurcPrc(partsPriceBwmsItemVO.getSalePrcAmtTax());
                    //bmp구매가.(세금포함)
                }

            }catch(Exception ex){}

            /*********************************************
             * 부품가격 처리 보증가
             *********************************************/

            if("R".equals(stockInOutCalcVO.getMvtGrGiTp())){//입고시에 보증가격 수정(수불유형코드예정).
                if(partsPriceBwmsService.selectItemPriceItemCdByCnt(itemSearchVO) > 0){
                    if(partsPriceBwmsItemVO != null){
                        //부품가격 보증가 수정.
                        partsPriceBwmsItemVO.setDlrCd(stockInOutCalcVO.getDlrCd());
                        partsPriceBwmsItemVO.setItemCd(stockInOutCalcVO.getItemCd());
                        partsPriceBwmsItemVO.setRegUsrId(LoginUtil.getUserId());
                        partsPriceBwmsItemVO.setUpdtUsrId(LoginUtil.getUserId());

                        partsPriceBwmsService.updateItemPriceItemCdGrtePrc(partsPriceBwmsItemVO);
                    }
                }
            }
        }



        if(selectPrcCnt < 1){
            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

            //이동평균가격 정보가 존재하는 경우
            if(itemMovingAvgPrcVO != null){
                if(stockInOutCalcVO.getGrtePrcChkYn() == "Y"){
                    double bmpPurcPrc   = 0.0;

                    bmpPurcPrc = itemMovingAvgPrcService.selectBmpPurcPrcByItemCd(itemMovingAvgPrcVO);

                    if(bmpPurcPrc <= 0){
                        bmpPurcPrc = 0.0;
                    }

                    //부품가격 보증가 넣기.
                    if(partsPriceBwmsItemVO != null){
                        //보증가
                        itemMovingAvgPrcVO.setGrtePrc(partsPriceBwmsItemVO.getMarkUpPrc());
                        //BMP구매원가
                        itemMovingAvgPrcVO.setBmpPurcPrc(partsPriceBwmsItemVO.getSalePrcAmtTax());
                        //BMP구매가.(세금포함)
                        itemMovingAvgPrcVO.setSalePrcAmt(partsPriceBwmsItemVO.getSalePrcAmt());
                    }
                }


                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                itemMovingAvgPrcService.insertPartsVenderSalPriceTargetMaster(itemMovingAvgPrcVO);

              //이동평균가격 정보가 없는 경우
            }else{
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }
        }

        /*********************************************
         * 유효성 점검종료
         *********************************************/

        /*********************************************
         * 창고재고 점검
         *********************************************/
        //재고 수량을 "-"처리해야 하는 경우
        if(stockInOutCalcVO.getCalcTp().equals("-")){
            //재고 상태가 가용재고(01)인 경우
            if(stockInOutCalcVO.getStockSt().equals("01")){
                if(stockInOutVO.getAvlbStockQty() <  stockInOutCalcVO.getQty()){
                    //가용재고가 처리할 수량보다 적습니다.
                    throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale())});
                }

            //재고 상태가 예약재고(02)인 경우
            }else if(stockInOutCalcVO.getStockSt().equals("02")){
                if(stockInOutVO.getResvStockQty() <  stockInOutCalcVO.getQty()){
                    //예약재고가 처리할 수량보다 적습니다.
                    throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.resvStockQty", null, LocaleContextHolder.getLocale())});
                }

            //재고 상태가 보류재고(03)인 경우
            }else if(stockInOutCalcVO.getStockSt().equals("03")){
                if(stockInOutVO.getClamStockQty() <  stockInOutCalcVO.getQty()){
                    //보류재고가 처리할 수량보다 적습니다.
                    throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.clamStockQty", null, LocaleContextHolder.getLocale())});
                }

            }else{
                //재고 상태 값을 확인해주세요.(입고예정, 출고예정수량)
                throw processException("global.info.confirmMsgParam", new String[]{"par.lbl.stockStat"});
            }
        }
        /*********************************************
         * 창고재고 점검종료
         *********************************************/

        /*********************************************
         * 현재고 정보 수정
         *********************************************/
        if(stockInOutCalcVO.getCalcTp().equals("-")){
            //재고 상태가 가용재고(01)인 경우
            if(stockInOutCalcVO.getStockSt().equals("01")){
                stockInOutVO.setAvlbStockQty(stockInOutVO.getAvlbStockQty() - stockInOutCalcVO.getQty());

            //재고 상태가 예약재고(02)인 경우
            }else if(stockInOutCalcVO.getStockSt().equals("02")){
                stockInOutVO.setResvStockQty(stockInOutVO.getResvStockQty() - stockInOutCalcVO.getQty());

            //재고 상태가 보류재고(03)인 경우
            }else if(stockInOutCalcVO.getStockSt().equals("03")){
                stockInOutVO.setClamStockQty(stockInOutVO.getClamStockQty() - stockInOutCalcVO.getQty());

            }else{
                //재고 상태 값을 확인해주세요.(입고예정, 출고예정수량)
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockStat", null, LocaleContextHolder.getLocale())});
            }

            if(stockInOutCalcVO.getRentType().equals("B")){ //차입인 경우
                stockInOutVO.setBorrowQty(stockInOutVO.getBorrowQty() - stockInOutCalcVO.getQty());
            }else if(stockInOutCalcVO.getRentType().equals("R")){ //대여인 경우
                stockInOutVO.setRentQty(stockInOutVO.getRentQty() + stockInOutCalcVO.getQty());
            }

            stockInOutVO.setStockAmt(stockInOutVO.getStockAmt() - stockInOutCalcVO.getStockAmt());
            stockInOutVO.setStockTaxDdctAmt(stockInOutVO.getStockTaxDdctAmt() - stockInOutCalcVO.getStockTaxDdctAmt());

        }else if(stockInOutCalcVO.getCalcTp().equals("+")){
          //재고 상태가 가용재고(01)인 경우
            if(stockInOutCalcVO.getStockSt().equals("01")){
                stockInOutVO.setAvlbStockQty(stockInOutVO.getAvlbStockQty() + stockInOutCalcVO.getQty());

            //재고 상태가 예약재고(02)인 경우
            }else if(stockInOutCalcVO.getStockSt().equals("02")){
                stockInOutVO.setResvStockQty(stockInOutVO.getResvStockQty() + stockInOutCalcVO.getQty());

            //재고 상태가 보류재고(03)인 경우
            }else if(stockInOutCalcVO.getStockSt().equals("03")){
                stockInOutVO.setClamStockQty(stockInOutVO.getClamStockQty() + stockInOutCalcVO.getQty());

            }else{
                //재고 상태 값을 확인해주세요.(입고예정, 출고예정수량)
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockStat", null, LocaleContextHolder.getLocale())});
            }

            if(stockInOutCalcVO.getRentType().equals("B")){ //차입인 경우
                stockInOutVO.setBorrowQty(stockInOutVO.getBorrowQty() + stockInOutCalcVO.getQty());
            }else if(stockInOutCalcVO.getRentType().equals("R")){ //대여인 경우
                stockInOutVO.setRentQty(stockInOutVO.getRentQty() - stockInOutCalcVO.getQty());
            }

            stockInOutVO.setStockAmt(stockInOutVO.getStockAmt() + stockInOutCalcVO.getStockAmt());
            stockInOutVO.setStockTaxDdctAmt(stockInOutVO.getStockTaxDdctAmt() + stockInOutCalcVO.getStockTaxDdctAmt());

        }else{
            //재고 계산 구분자 정보가 +,-가 아닙니다.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockCalcTp", null, LocaleContextHolder.getLocale())});
        }

        if(stockInOutCalcVO.getStockSt().equals("01")){
            if(stockInOutVO.getAvlbStockQty() <  0){
                //가용재고가 0보다 적습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale())});
            }
        //재고 상태가 예약재고(02)인 경우
        }else if(stockInOutCalcVO.getStockSt().equals("02")){
            if(stockInOutVO.getResvStockQty() <  0){
                //예류재고가 0보다 적습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.resvStockQty", null, LocaleContextHolder.getLocale())});
            }
        }

        //소수점 3자리에서 반올림으로 인하여 누적시 금액 차이 발생. => 수량이 '0'이 되는 시점에 재고금액 '0'처리하기로함.
        if((stockInOutVO.getAvlbStockQty() + stockInOutVO.getResvStockQty() + stockInOutVO.getClamStockQty()) == 0){
            //if(Math.abs(stockInOutVO.getStockAmt()) > 0 && Math.abs(stockInOutVO.getStockAmt()) < 10){
            //    if(stockInOutCalcVO.getStockAmt() > 0){
            if(!stockInOutCalcVO.getRentType().equals("X")){ //예류인 경우(가용재고먼저빼기에..어쩔 수 없이..rent유형 사용함..)
                    stockInOutVO.setStockAmt(0);
                    stockInOutVO.setStockTaxDdctAmt(0);
            }
            //    }
            //}
        }

        if(stockInOutVO.getStockAmt() <  0){

            //재고금액 0보다 작을 때 0 값 설정.
            stockInOutVO.setStockAmt(0);

            if(stockInOutVO.getStockAmt() <  0){
                //재고금액이 0보다 적습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.stockPrice", null, LocaleContextHolder.getLocale())});
            }
        }

        if(stockInOutVO.getStockTaxDdctAmt() <  0){

            //재고금액 0보다 작을 때 0 값 설정.
            stockInOutVO.setStockTaxDdctAmt(0);

            if(stockInOutVO.getStockTaxDdctAmt() <  0){
                //재고금액이 0보다 적습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.stockPrice", null, LocaleContextHolder.getLocale())});
            }
        }

        updateStockCnt = stockInOutDAO.updateStockInOut(stockInOutVO);

        //수정된 건이 없거나 생각보다 많이 수정된 경우
        if(updateStockCnt != 1 ){
           //현재고의 정보가 제대로 수정되지 않았습니다.
           throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.currStock", null, LocaleContextHolder.getLocale())});
        }

        /*********************************************
         * 현재고 정보 수정 종료
         *********************************************/

        /*********************************************
         * 부품 최종 입출고 일자 수정
         *********************************************/
        if(stockInOutCalcVO.getRectGrGiDtUpdtYn().equals("Y")){ //최근 입출고일 관리 여부
            if(stockInOutCalcVO.getMvtGrGiTp().equals("R")){ //입고인 경우
                if(stockInOutCalcVO.getCnclMvtYn().equals("Y")){
                    itemMasterDAO.cancelLastGrDt(itemMasterVO);
                }else{
                    itemMasterDAO.updateLastGrDt(itemMasterVO);
                }
            }else if(stockInOutCalcVO.getMvtGrGiTp().equals("I")){ //출고인 경우
                if(stockInOutCalcVO.getCnclMvtYn().equals("Y")){
                    itemMasterDAO.cancelLastGiDt(itemMasterVO);
                }else{
                    itemMasterDAO.updateLastGiDt(itemMasterVO);
                }
            }
        }

        /*********************************************
         * 부품 최종 입출고 일자 수정 종료
         *********************************************/

        /*********************************************
         * 처리결과 Return
         *********************************************/
        return 1;
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockInOutItemsByCondition(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public List<StockInOutVO> selectStockInOutItemsByCondition(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectStockInOutItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockInOutItemsByConditionCnt(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public int selectStockInOutItemsByConditionCnt(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectStockInOutItemsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectInvestigationTargetItemsByCondition(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public List<StockInOutVO> selectInvestigationTargetItemsByCondition(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectInvestigationTargetItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectInvestigationTargetItemsByConditionCnt(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public int selectInvestigationTargetItemsByConditionCnt(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectInvestigationTargetItemsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#updateItemMasterByKey(chn.bhmc.dms.par.stm.vo.StockInOutVO)
     */
    @Override
    public int updateItemMasterByKey(StockInOutVO stockInOutVO) throws Exception {
        return stockInOutDAO.updateItemMasterByKey(stockInOutVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInterfaceService#selectStockInterfaceInfoByItemCd(chn.bhmc.dms.par.stm.vo.StockInterfaceVO)
     */
    @Override
    public StockInterfaceVO selectStockInterfaceInfoByItemCd(StockInterfaceVO stockInterfaceVO) throws Exception {
        StockInterfaceVO result = new StockInterfaceVO();
        result = stockInOutDAO.selectStockInterfaceInfoByItemCd(stockInterfaceVO);
        return result;
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInterfaceService#selectStockInterfaceDlrInfoByItemCd(chn.bhmc.dms.par.stm.vo.StockInterfaceDlrInfoVO)
     */
    @Override
    public StockInterfaceDlrInfoVO selectStockInterfaceDlrInfoByItemCd(StockInterfaceDlrInfoVO stockInterfaceDlrInfoVO)
            throws Exception {
        StockInterfaceDlrInfoVO result = new StockInterfaceDlrInfoVO();
        result = stockInOutDAO.selectStockInterfaceDlrInfoByItemCd(stockInterfaceDlrInfoVO);
        return result;
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInterfaceService#selectStockInterfaceInfoByItemCd(chn.bhmc.dms.par.stm.vo.StockInterfaceVO)
     */
    @Override
    public StockInterfaceVO selectStockInterfaceRealTimeInfoByItemCd(StockInterfaceVO stockInterfaceVO) throws Exception {

        StockInterfaceVO resultVO = new StockInterfaceVO();

        try{
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("IVR_PNO", stockInterfaceVO.getIvrPno());

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS002");
            camelClient.setSender(LoginUtil.getDlrCd());//sender
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            List<StockInterfaceResultVO> results = null;

            String ifResult = receiveData.getFooter().getIfResult();

            // success : Z, error : E
            if("Z".equals(ifResult)){
                //send result purchase order update
                results = receiveData.readMessages(StockInterfaceResultVO.class);

                if(results.size() > 0){
                    resultVO.setIvrCmpKnd(stockInterfaceVO.getIvrCmpKnd());
                    resultVO.setIvrPno(stockInterfaceVO.getIvrPno());
                    resultVO.setIvrPdAExist("Y");
                    resultVO.setIvrPdBExist("N");
                    resultVO.setIvrPdCExist("N");
                    resultVO.setIvrPdDExist("N");
                    resultVO.setIvrPdEExist("N");
                    resultVO.setIvrPdFExist("N");
                    resultVO.setIvrPdGExist("N");
                    resultVO.setIvrPdHExist("N");
                    resultVO.setIvrPdIExist("N");
                    resultVO.setIvrPdJExist("N");
                    for(int i = 0; i < results.size(); i = i + 1){

                        if(results.get(i).getIvrPdc().equals("PD1")){
                            resultVO.setIvrPdBExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD2")){
                            resultVO.setIvrPdCExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD3")){
                            resultVO.setIvrPdDExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD4")){
                            resultVO.setIvrPdEExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD5")){
                            resultVO.setIvrPdFExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD6")){
                            resultVO.setIvrPdGExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD7")){
                            resultVO.setIvrPdHExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD8")){
                            resultVO.setIvrPdIExist("Y");
                        }

                        if(results.get(i).getIvrPdc().equals("PD9")){
                            resultVO.setIvrPdJExist("Y");
                        }


                    }
                }
            }else{
                //throw processException("par.lbl.ifErrMsgParam");
                resultVO.setIvrCmpKnd(stockInterfaceVO.getIvrCmpKnd());
                resultVO.setIvrPno(stockInterfaceVO.getIvrPno());
                resultVO.setIvrPdAExist("N");
                resultVO.setIvrPdBExist("N");
                resultVO.setIvrPdCExist("N");
                resultVO.setIvrPdDExist("N");
                resultVO.setIvrPdEExist("N");
                resultVO.setIvrPdFExist("N");
                resultVO.setIvrPdGExist("N");
                resultVO.setIvrPdHExist("N");
                resultVO.setIvrPdIExist("N");
                resultVO.setIvrPdJExist("N");
            }

            return resultVO;
        }catch(Exception e){
            //throw new BizException(e.getMessage());
            resultVO.setIvrCmpKnd(stockInterfaceVO.getIvrCmpKnd());
            resultVO.setIvrPno(stockInterfaceVO.getIvrPno());
            resultVO.setIvrPdAExist("N");
            resultVO.setIvrPdBExist("N");
            resultVO.setIvrPdCExist("N");
            resultVO.setIvrPdDExist("N");
            resultVO.setIvrPdEExist("N");
            resultVO.setIvrPdFExist("N");
            resultVO.setIvrPdGExist("N");
            resultVO.setIvrPdHExist("N");
            resultVO.setIvrPdIExist("N");
            resultVO.setIvrPdJExist("N");
            return resultVO;
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInterfaceService#selectDlrStockInterfaceRealTimeInfoByItemCd(chn.bhmc.dms.par.stm.vo.StockInterfaceVO)
     */
    @Override
    public List<StockInterfaceDlrInfoVO> selectDlrStockInterfaceRealTimeInfoByItemCd(StockInterfaceDlrInfoVO stockInterfaceDlrInfoVO)
            throws Exception {
        Map<String, Object> message = new HashMap<String, Object>();

        message.put("DPS_PNO", stockInterfaceDlrInfoVO.getDpsPno());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("PTS104");
        camelClient.setSender(LoginUtil.getDlrCd());//sender
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();
        List<StockInterfaceDlrInfoVO> results = null;

        results = receiveData.readMessages(StockInterfaceDlrInfoVO.class);

        return results;
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockAnalysisByCondition(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public List<StockInOutVO> selectStockAnalysisByCondition(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectStockAnalysisByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockAnalysisByConditionCnt(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public int selectStockAnalysisByConditionCnt(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectStockAnalysisByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectMobileStockInoByDlrCd(chn.bhmc.dms.par.stm.vo.StockInOutVO)
     */
    @Override
    public StockInOutVO selectMobileStockInoByDlrCd(StockInOutVO stockInOutVO) throws Exception {
        return stockInOutDAO.selectMobileStockInoByDlrCd(stockInOutVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustDupCheck(java.util.List)
     */
    @SuppressWarnings("unused")
    @Override
    public List<StockInOutVO> selectStockInOutExcelValidate(List<StockInOutVO> list) throws Exception {

        try {
            StockInOutVO stockInOutVO = new StockInOutVO();
            List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
            List<StockInOutVO> resultList = new ArrayList<StockInOutVO>();
            String msg;
            String dlrCd = LoginUtil.getDlrCd();

            // Duplication Customer Check
            for(int i = 2, listLen = list.size(); i < listLen ; i++){
                stockInOutVO = new StockInOutVO();
                errors         = new ArrayList<ExcelUploadError>();
                int totErrCnt = 0;


                //부품번호 널값 체크
                if(StringUtils.isBlank(list.get(i).getItemCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"                //{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())     //부품번호[配件编号]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 11, list.get(i).getItemCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //부품마스터에 없는 부품코드 validation check

                }

                //*********************************************************  부품번호 validation check 완료 **************************************************//

                //창고코드
                if(StringUtils.isBlank(list.get(i).getStrgeCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"                //{0}은(는) 필수 입력사항 입니다.
                        , new String[]{
                                messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())         //부품창고[配件仓库]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 14, list.get(i).getStrgeCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //창고마스터에 없는 창고코드 validation check

                }


                //*********************************************************  부품창고 validation check 완료 **************************************************//

                //가용수량
                if(StringUtils.isBlank(list.get(i).getQty())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"                //{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("par.lbl.avlbStock", null, LocaleContextHolder.getLocale())               //수량[数量]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 24, list.get(i).getQty(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //지불금액은 숫자여야만 함. (포멧체크)
                    char charVal ;
                    String payAmtChkTrue = "N";
                    int qty = 0;
                    qty  = list.get(i).getQty().length();
                    for (int k=0; k<(int)list.get(i).getQty().length(); k++) {

                        charVal = list.get(i).getQty().charAt(k);

                        if (charVal<48 || charVal>57) {
                            break;
                        }else {
                            payAmtChkTrue = "Y";
                        }
                    }

                    if(payAmtChkTrue.equals("N")){
                        msg = messageSource.getMessage(
                                "sal.info.exclNumberCheck"  //{0}은(는) 숫자형식이여야만 합니다.[{0} 只能录数字]
                                , new String[]{
                                        messageSource.getMessage("par.lbl.avlbStock", null, LocaleContextHolder.getLocale())        //수량[数量]
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 24, list.get(i).getQty(), msg));

                        totErrCnt = totErrCnt + 1;

                    }

                }

                //*********************************************************  수량 validation check 완료 **************************************************//

                list.get(i).setErrors(errors);
                list.get(i).setErrorCount(totErrCnt);

                resultList.add(list.get(i));

                continue;

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
    public void updateStockInOutUpload(List<StockInOutVO> list) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String pltCd = LoginUtil.getPltCd();

        for(StockInOutVO stockInOutVO : list){
            stockInOutVO.setDlrCd(dlrCd);
            stockInOutVO.setUpdtUsrId(userId);
            stockInOutVO.setPltCd(pltCd);

            //본테이블에 저장(PT_0301T)
            stockInOutDAO.updateStockInOutUpload(stockInOutVO);

        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockInOutItemsExcelDownByCondition(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public List<StockInOutExcelVO> selectStockInOutItemsExcelByCondition(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectStockInOutItemsExcelByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockInStrgeNmListAndLocNmListOutByItemCd(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public StockInOutVO selectStockInStrgeNmListAndLocNmListOutByItemCd(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectStockInStrgeNmListAndLocNmListOutByItemCd(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#insertEmptyStockInOut(chn.bhmc.dms.par.stm.vo.StockInOutVO)
     */
    @Override
    public int insertEmptyStockInOut(StockInOutVO stockInOutInsertVO) {

        stockInOutInsertVO.setDlrCd(LoginUtil.getDlrCd());
        stockInOutInsertVO.setPltCd(LoginUtil.getPltCd());
        stockInOutInsertVO.setStrgeCd(stockInOutInsertVO.getStrgeCd());
        stockInOutInsertVO.setItemCd(stockInOutInsertVO.getItemCd());
        stockInOutInsertVO.setAvlbStockQty(0);
        stockInOutInsertVO.setClamStockQty(0);
        stockInOutInsertVO.setGiScheQty(0);
        stockInOutInsertVO.setGrScheQty(0);
        stockInOutInsertVO.setRentQty(0);
        stockInOutInsertVO.setBorrowQty(0);
        stockInOutInsertVO.setResvStockQty(0);
        stockInOutInsertVO.setRegUsrId(LoginUtil.getUserId());

        //기초재고 정보가 모두 0인 부품의 재고 정보를 생성한다.
        return stockInOutDAO.insertStockInOut(stockInOutInsertVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        List<String> strgeCdList = new ArrayList<String>();
        String sStrgeCd;
        String[] arrayStrgeCdStr;


        StockInOutSearchVO searchVO = new StockInOutSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(langCd);
        searchVO.setsItemCd(params.get("sItemCd").toString());
        searchVO.setsItemNm(params.get("sItemNm").toString());
        searchVO.setsBpTp(params.get("sBpTp").toString());
        searchVO.setsBpNm(params.get("sBpNm").toString());
        searchVO.setsItemGrpCd(params.get("sItemGrpCd").toString());
        searchVO.setsEndYn(params.get("sEndYn").toString());
        searchVO.setsCarlineCd(params.get("sCarlineCd").toString());
        searchVO.setsAbcInd(params.get("sAbcInd").toString());
        searchVO.setsBrandCd(params.get("sBrandCd").toString());
        searchVO.setsNonMovingFlg(params.get("sNonMovingFlg").toString());
        searchVO.setsAvailQtyFlg(params.get("sAvailQtyFlg").toString());
        searchVO.setsItemDstinCd(params.get("sItemDstinCd").toString());

        if (StringUtils.isNotEmpty((String)params.get("sStrgeCdList"))) {
            sStrgeCd = (String)params.get("sStrgeCdList");
            arrayStrgeCdStr = sStrgeCd.split(",");
            strgeCdList = Arrays.asList(arrayStrgeCdStr);

            searchVO.setsStrgeCdList(strgeCdList);
        }

        if(!StringUtils.isBlank(params.get("sLastGrDtFr").toString())){
            String sLastGrDtFr = params.get("sLastGrDtFr").toString();
            Date dLastGrDtFr = Date.valueOf(sLastGrDtFr);
            searchVO.setsLastGrDtFr(dLastGrDtFr);
        }

        if(!StringUtils.isBlank(params.get("sLastGrDtTo").toString())){
            String sLastGrDtTo = params.get("sLastGrDtTo").toString();
            Date dLastGrDtTo = Date.valueOf(sLastGrDtTo);
            searchVO.setsLastGrDtTo(dLastGrDtTo);
        }

        if(!StringUtils.isBlank(params.get("sLastGiDtFr").toString())){
            String sLastGiDtFr = params.get("sLastGiDtFr").toString();
            Date dLastGiDtFr = Date.valueOf(sLastGiDtFr);
            searchVO.setsLastGiDtFr(dLastGiDtFr);
        }

        if(!StringUtils.isBlank(params.get("sLastGiDtTo").toString())){
            String sLastGiDtTo = params.get("sLastGiDtTo").toString();
            Date dLastGiDtTo = Date.valueOf(sLastGiDtTo);
            searchVO.setsLastGiDtTo(dLastGiDtTo);
        }

        if(!StringUtils.isBlank(params.get("sStockStayDayStart").toString())){
            String sStockStayDayStart = params.get("sStockStayDayStart").toString();
            searchVO.setsStockStayDayStart(Double.parseDouble(sStockStayDayStart));
        }

        if(!StringUtils.isBlank(params.get("sStockStayDayEnd").toString())){
            String sStockStayDayEnd = params.get("sStockStayDayEnd").toString();
            searchVO.setsStockStayDayEnd(Double.parseDouble(sStockStayDayEnd));
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<StockInOutExcelVO> list = selectStockInOutItemsExcelByCondition(searchVO);

        context.putVar("items", list);

    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockInOutSummaryByCondition(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public StockInOutVO selectStockInOutSummaryByCondition(StockInOutSearchVO searchVO) throws Exception {
        return stockInOutDAO.selectStockInOutSummaryByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.StockInOutService#selectStockInOutMaxStrgeCdByItemCd(chn.bhmc.dms.par.stm.vo.StockInOutSearchVO)
     */
    @Override
    public StockInOutVO selectStockInOutMaxStrgeCdByItemCd(StockInOutSearchVO searchVO) throws Exception {

        String[] lblList = new String[1];
        //딜러코드 체크.
        if(StringUtils.isEmpty(searchVO.getsDlrCd())){
            logger.error("dlrCd is mandatory.");
            lblList[0] = messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale()); // 부품번호
            throw processException("par.info.issueCheckMsg", lblList);
        }
        //부품코드 체크.
        if(StringUtils.isEmpty(searchVO.getsItemCd())){
            logger.error("itemCd is mandatory.");
            lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale()); // 부품번호
            throw processException("par.info.issueCheckMsg", lblList);
        }

        return stockInOutDAO.selectStockInOutMaxStrgeCdByItemCd(searchVO);
    }

}
