package chn.bhmc.dms.bat.par.ism.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.ism.vo.BatStockInOutCalcVO;

import chn.bhmc.dms.bat.par.ism.service.BatchPartsIssueReadyActionService;
import chn.bhmc.dms.bat.par.ism.service.dao.BatchPartsIssueReadyActionDAO;
import chn.bhmc.dms.bat.par.ism.vo.BatIssueReqDetailVO;
import chn.bhmc.dms.bat.par.ism.vo.BatIssueReqSearchVO;
import chn.bhmc.dms.bat.par.ism.vo.BatIssueReqVO;
import chn.bhmc.dms.bat.par.ism.vo.BatMovementTypeVO;
import chn.bhmc.dms.bat.par.ism.vo.BatMvtDocItemVO;
import chn.bhmc.dms.bat.par.ism.vo.BatMvtDocVO;
import chn.bhmc.dms.bat.par.ism.vo.BatStockInOutVO;
import chn.bhmc.dms.bat.par.ism.vo.BatSysOwnerDealerVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsIssueReadyActionServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2017. 1. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 14.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("batchPartsIssueReadyActionService")
public class BatchPartsIssueReadyActionServiceImpl extends HService implements BatchPartsIssueReadyActionService {

    @Resource(name="batchPartsIssueReadyActionDAO")
    private BatchPartsIssueReadyActionDAO batchPartsIssueReadyActionDAO;

    @Resource(name="mvtDocNoIdgenService")
    EgovIdGnrService mvtDocNoIdgenService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /*
     * @see chn.bhmc.dms.bat.par.ism.service.BatchPartsIssueReadyActionService#executeIssuePartsReadyActionAutoCancel()
     */
    @Override
    public void executeIssuePartsReadyActionAutoCancel() throws Exception {
        try{
            //시스템 딜러 조회.
            List<BatSysOwnerDealerVO> batSysOwnerDealerVOList = batchPartsIssueReadyActionDAO.selectSysOwnerDealerByCondition("Y");

            for(BatSysOwnerDealerVO batSysOwnerDealerVO : batSysOwnerDealerVOList){
                if(StringUtils.isNotBlank(batSysOwnerDealerVO.getDlrCd())){
                    //부품예류취소 실행.
                    multiIssueResvReadyDetails(batSysOwnerDealerVO);
                }
            }
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * 부품예류 자동 취소 실행.
     *
     * @throws Exception
     */
    public void multiIssueResvReadyDetails(BatSysOwnerDealerVO batSysOwnerDealerVO) throws Exception {

        try{
            String sDlrCd = batSysOwnerDealerVO.getDlrCd(); /* 딜러코드 */
            String sReadyStatCd = "05";                     /* 예류취소코드 */
            String sSysUsrId = "SYSTEM";                    /* 시스템ID */
            String sPltCd = "1000";                         /* 시스템ID */

            //1. 예류일자 오늘보다 작은 예류 리스트 가져오기.
            BatIssueReqSearchVO searchVO = new BatIssueReqSearchVO();
            searchVO.setsDlrCd(sDlrCd);
            searchVO.setsReadyStatCd("RE03");//예류요청(01),예류(03) 한 것

            BatMvtDocVO mvtVO = new BatMvtDocVO();                            /* 수불헤더*/
            List<BatMvtDocItemVO> list = new ArrayList<BatMvtDocItemVO>();

            List<BatIssueReqDetailVO> readyActionList = batchPartsIssueReadyActionDAO.selectIssueReqDetailResvsBatByCondition(searchVO);

            //2. 예류취소처리.
            for(BatIssueReqDetailVO issueReqDetailVO : readyActionList){
                mvtVO = new BatMvtDocVO();
                list = new ArrayList<BatMvtDocItemVO>();

                issueReqDetailVO.setDlrCd(sDlrCd);

                //부품상세 준비상태코드 적용.
                issueReqDetailVO.setReadyStatCd(sReadyStatCd);//예류취소 : 05

                //부품요청 VO 생성.
                BatIssueReqVO issueReqVO = new BatIssueReqVO();

                issueReqVO.setParReqDocNo(issueReqDetailVO.getParReqDocNo());
                issueReqVO.setUpdtUsrId(sSysUsrId);//SYSTEM
                issueReqVO.setReadyStatCd(sReadyStatCd);//예류취소 : 05
                issueReqVO.setDlrCd(sDlrCd);
                issueReqVO.setCancYn("N");

                if(!issueReqVO.getParReqDocNo().equals("")){
                    //부품요청헤더 수정.
                    batchPartsIssueReadyActionDAO.updateIssueReqBat(issueReqVO);

                    //부품예류취소 수불처리
                    boolean bMvtDocNoYn = false;                                      /* 수불처리 유무*/
                    /* 수불상세(부품)*/
                    //수불상세(부품) VO 생성.
                    BatMvtDocItemVO mvtDocItemVO = new BatMvtDocItemVO();

                    //부품예류취소 및 재고이동 수불문서번호 확인.
                    if("05".equals(issueReqDetailVO.getReadyStatCd()) && StringUtils.isNotBlank(issueReqDetailVO.getMvtDocNo()) && StringUtils.isNotBlank(issueReqDetailVO.getMvtDocYyMm())){
                        bMvtDocNoYn = true;
                        //수불함수 헤더 정보 담기.
                        mvtVO.setDlrCd(sDlrCd);
                        //mvtVO.setBpCd(sDlrCd);
                        mvtVO.setMvtTp("23");//재고이동취소(예약=>가용) : 24 => 에 대한 원수불
                        mvtVO.setMvtDocNo(issueReqDetailVO.getMvtDocNo());
                        mvtVO.setMvtDocYyMm(issueReqDetailVO.getMvtDocYyMm());
                        mvtVO.setRegUsrId(sSysUsrId);
                    }

                    if(bMvtDocNoYn){

                        // 고객정보
                        mvtVO.setCustNo(issueReqDetailVO.getCustCd());
                        // 수불상세 VO 데이타 담기.
                        mvtDocItemVO.setDlrCd(sDlrCd);
                        mvtDocItemVO.setPltCd(sPltCd);
                        mvtDocItemVO.setCancStmtYn("Y");// 취소구분
                        mvtDocItemVO.setItemCd(issueReqDetailVO.getItemCd());
                        mvtDocItemVO.setItemUnitCd(issueReqDetailVO.getUnitCd());
                        mvtDocItemVO.setItemQty(issueReqDetailVO.getResvQty());
                        mvtDocItemVO.setSalePrc(issueReqDetailVO.getItemPrc());
                        mvtDocItemVO.setSaleAmt(issueReqDetailVO.getItemAmt());
                        mvtDocItemVO.setSaleTaxDdctAmt(issueReqDetailVO.getTaxDdctAmt());
                        mvtDocItemVO.setFrStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setToStrgeCd(issueReqDetailVO.getReqStrgeCd());
                        mvtDocItemVO.setLocCd(issueReqDetailVO.getGiLocCd());
                        mvtDocItemVO.setRefDocNo(issueReqDetailVO.getParReqDocNo());
                        mvtDocItemVO.setRefDocLineNo(issueReqDetailVO.getParReqDocLineNo());
                        mvtDocItemVO.setDdlnYn("N");
                        mvtDocItemVO.setCurrCd("");//통화코드
                        mvtDocItemVO.setRegUsrId(sSysUsrId);
                        mvtDocItemVO.setMvtReasonCont("BATCH CANCEL");

                        list.add(mvtDocItemVO);
                        //수불 재고이동 처리.(예약 ==> 가용)
                        try{
                            multiItemMoveCancelSaveMvtDocs(mvtVO, list, sDlrCd);

                            issueReqDetailVO.setUpdtUsrId(sSysUsrId);//SYSTEM
                            issueReqDetailVO.setReadyStatCd(sReadyStatCd);//예류취소 : 05
                            issueReqDetailVO.setReadyCancUsrId(sSysUsrId);//SYSTEM
                            issueReqDetailVO.setReadyCancRegDt(new Date());//부품예류취소일자 : 당일
                            issueReqDetailVO.setReadyCancRemark("BATCH CANCEL");
                            issueReqDetailVO.setCancYn("N");
                            //부품요청 상세 수정.
                            batchPartsIssueReadyActionDAO.updateIssueReqDetailBat(issueReqDetailVO);
                        }catch(Exception ex){
                            throw new BizException(ex.getMessage());
                        }
                    }else{
                        //요청건 부품요청 상세 수정.
                        batchPartsIssueReadyActionDAO.updateIssueReqDetailBat(issueReqDetailVO);
                    }
                }
            }
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * 수불 재고이동 실행(예약==>가용).
     *
     * @throws Exception
     */
    public List<BatMvtDocItemVO> multiItemMoveCancelSaveMvtDocs(BatMvtDocVO mvtVO, List<BatMvtDocItemVO> list, String sDlrCd) throws Exception {

        try{

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

            String mvtYYmm = "";
            String mvtDocNo = "";
            //double stockAmt      = 0.0;
            List<BatMvtDocItemVO> itemSaveList = new ArrayList<BatMvtDocItemVO>();

            BatMvtDocItemVO itemFrInfoVO  = new BatMvtDocItemVO();//재고이동 수불 아이템
            BatMvtDocItemVO itemToInfoVO  = new BatMvtDocItemVO();//재고이동 수불 아이템

            //수불유형가져오기.
            BatMovementTypeVO movementTypeVO = batchPartsIssueReadyActionDAO.selectCombiMovementTypeByKey(mvtVO.getDlrCd(), mvtVO.getMvtTp());

            BatStockInOutCalcVO batStockInOutCalcVO = new BatStockInOutCalcVO();  //재고프로세스 계산VO

            //수불키정보가져오기.
            BatMvtDocVO dbBatMvtDocVO = batchPartsIssueReadyActionDAO.selectMvtDocNoBatByKey(sDlrCd);//수불문서키정보 가져오기.
            mvtDocNo = dbBatMvtDocVO.getMvtDocNo();
            mvtYYmm = dbBatMvtDocVO.getMvtDocYyMm();

            mvtVO.setMvtDocYyMm(mvtYYmm);//수불년월설정.
            mvtVO.setMvtDocNo(mvtDocNo);//수불문서번호 설정.

            for(BatMvtDocItemVO mvtDocItemVO : list){
                itemSaveList = new ArrayList<BatMvtDocItemVO>();

                /* A. 출고부품 : 입고취소부품*/
                itemFrInfoVO = new BatMvtDocItemVO();

                /* B. 입고부품 : 출고취소부품*/
                itemToInfoVO = new BatMvtDocItemVO();

                //refInfoVO    = new BatMvtDocItemVO();

                //refInfoVO = batchPartsIssueReadyActionDAO.selectMvtDocItemByRefInfo(mvtVO.getDlrCd(), mvtDocItemVO.getRefDocNo(), mvtDocItemVO.getRefDocLineNo());

                //stockAmt = refInfoVO.getMovingAvgAmt();

                itemFrInfoVO.setMvtDocYyMm(mvtYYmm);
                itemFrInfoVO.setMvtDocNo(mvtDocNo);
                itemFrInfoVO.setMvtDocLineNo(1);
                itemFrInfoVO.setRegUsrId(mvtDocItemVO.getRegUsrId());
                itemFrInfoVO.setSalePrc(0.0);
                itemFrInfoVO.setSaleTaxDdctPrc(0.0);
                itemFrInfoVO.setSaleAmt(0.0);
                itemFrInfoVO.setSaleTaxDdctAmt(0.0);
                itemFrInfoVO.setMovingAvgPrc(0.0);
                itemFrInfoVO.setMovingAvgTaxDdctPrc(0.0);
                itemFrInfoVO.setMovingAvgAmt(0.0);
                itemFrInfoVO.setMovingAvgTaxDdctAmt(0.0);
                itemFrInfoVO.setStdPrc((double) 0);
                itemFrInfoVO.setStdAmt((double) 0);
                itemFrInfoVO.setPltCd(mvtDocItemVO.getPltCd());
                itemFrInfoVO.setDlrCd(mvtDocItemVO.getDlrCd());
                itemFrInfoVO.setStrgeCd(mvtDocItemVO.getFrStrgeCd());
                itemFrInfoVO.setCancStmtYn("N");
                itemFrInfoVO.setItemCd(mvtDocItemVO.getItemCd());
                itemFrInfoVO.setItemQty(mvtDocItemVO.getItemQty());
                itemFrInfoVO.setItemUnitCd(mvtDocItemVO.getItemUnitCd());
                itemFrInfoVO.setRefDocNo(mvtDocItemVO.getRefDocNo());
                itemFrInfoVO.setRefDocLineNo(mvtDocItemVO.getRefDocLineNo());
                itemFrInfoVO.setCurrCd(mvtDocItemVO.getCurrCd());
                itemFrInfoVO.setMvtReasonCont(mvtDocItemVO.getMvtReasonCont());
                itemFrInfoVO.setDdlnYn("N");

                itemToInfoVO.setMvtDocYyMm(mvtYYmm);
                itemToInfoVO.setMvtDocNo(mvtDocNo);
                itemToInfoVO.setMvtDocLineNo(2);
                itemToInfoVO.setRegUsrId(mvtDocItemVO.getRegUsrId());
                itemToInfoVO.setPurcPrc(0.0);
                itemToInfoVO.setPurcTaxDdctPrc(0.0);
                itemToInfoVO.setPurcAmt(0.0);
                itemToInfoVO.setPurcTaxDdctAmt(0.0);
                itemFrInfoVO.setMovingAvgPrc(0.0);
                itemFrInfoVO.setMovingAvgTaxDdctPrc(0.0);
                itemFrInfoVO.setMovingAvgAmt(0.0);
                itemFrInfoVO.setMovingAvgTaxDdctAmt(0.0);
                itemToInfoVO.setStdPrc((double) 0);
                itemToInfoVO.setStdAmt((double) 0);
                itemToInfoVO.setPltCd(mvtDocItemVO.getPltCd());
                itemToInfoVO.setDlrCd(mvtDocItemVO.getDlrCd());
                itemToInfoVO.setStrgeCd(mvtDocItemVO.getToStrgeCd());
                itemToInfoVO.setCancStmtYn("N");
                itemToInfoVO.setItemCd(mvtDocItemVO.getItemCd());
                itemToInfoVO.setItemQty(mvtDocItemVO.getItemQty());
                itemToInfoVO.setItemUnitCd(mvtDocItemVO.getItemUnitCd());
                itemToInfoVO.setRefDocNo(mvtDocItemVO.getRefDocNo());
                itemToInfoVO.setRefDocLineNo(mvtDocItemVO.getRefDocLineNo());
                itemToInfoVO.setCurrCd(mvtDocItemVO.getCurrCd());
                itemToInfoVO.setMvtReasonCont(mvtDocItemVO.getMvtReasonCont());
                itemToInfoVO.setDdlnYn("N");

                /****************************************
                 * 차변대변구분 셋팅
                 ***************************************/
                if(movementTypeVO.getCancMvtYn().equals("N")){
                    //출고창고가 (-)
                    itemFrInfoVO.setDebitCreditDstinCd("H");
                    //입고창고가 (+)
                    itemToInfoVO.setDebitCreditDstinCd("S");
                }else if(movementTypeVO.getCancMvtYn().equals("Y")){
                    //출고창고가 (+)
                    itemFrInfoVO.setDebitCreditDstinCd("S");
                    //입고창고가 (-)
                    itemToInfoVO.setDebitCreditDstinCd("H");
                }

                 // 재고처리 함수 이상 주석처리.(From 창고에 대한)
                if(movementTypeVO.getCancMvtYn().equals("N")){

                    batStockInOutCalcVO = new BatStockInOutCalcVO();  //재고프로세스VO

                    batStockInOutCalcVO.setDlrCd(itemFrInfoVO.getDlrCd());
                    batStockInOutCalcVO.setPltCd(itemFrInfoVO.getPltCd());
                    batStockInOutCalcVO.setStrgeCd(itemFrInfoVO.getStrgeCd());
                    batStockInOutCalcVO.setItemCd(itemFrInfoVO.getItemCd());
                    batStockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                    batStockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                    batStockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                    batStockInOutCalcVO.setStockSt("01");
                    batStockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                    batStockInOutCalcVO.setCalcTp("-");
                    batStockInOutCalcVO.setRentType("");

                    if(movementTypeVO.getMvtTp().equals("21")){

                        batStockInOutCalcVO.setStockAmt(itemFrInfoVO.getSaleAmt());
                        batStockInOutCalcVO.setStockTaxDdctAmt((itemFrInfoVO.getSalePrc() / (1 + vatInfoVO.getVatApplyRate())) * itemFrInfoVO.getItemQty());

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), itemFrInfoVO.getSaleAmt(), "-", "");
                    }else if(movementTypeVO.getMvtTp().equals("23")){

                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "-", "");
                    }else if(movementTypeVO.getMvtTp().equals("25")){

                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "-", "");
                    }

                }else{

                    batStockInOutCalcVO = new BatStockInOutCalcVO();  //재고프로세스VO

                    batStockInOutCalcVO.setDlrCd(itemFrInfoVO.getDlrCd());
                    batStockInOutCalcVO.setPltCd(itemFrInfoVO.getPltCd());
                    batStockInOutCalcVO.setStrgeCd(itemFrInfoVO.getStrgeCd());
                    batStockInOutCalcVO.setItemCd(itemFrInfoVO.getItemCd());
                    batStockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                    batStockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                    batStockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                    batStockInOutCalcVO.setStockSt("01");
                    batStockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                    batStockInOutCalcVO.setCalcTp("+");
                    batStockInOutCalcVO.setRentType("");

                    if(movementTypeVO.getMvtTp().equals("22")){

                        batStockInOutCalcVO.setStockAmt(itemFrInfoVO.getSaleAmt());
                        batStockInOutCalcVO.setStockTaxDdctAmt((itemFrInfoVO.getSalePrc() / (1 + vatInfoVO.getVatApplyRate())) * itemFrInfoVO.getItemQty());

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), itemFrInfoVO.getSaleAmt(), "+", "");
                    }else if(movementTypeVO.getMvtTp().equals("24")){

                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "+", "");
                    }else if(movementTypeVO.getMvtTp().equals("26")){

                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemFrInfoVO.getItemQty(), 0, "+", "");
                    }

                }

                itemFrInfoVO.setAutoCreYn("N");
                itemToInfoVO.setAutoCreYn("Y");

                // 재고처리 함수 이상 주석처리.(To 창고에 대한)
                if(movementTypeVO.getCancMvtYn().equals("N")){

                    batStockInOutCalcVO = new BatStockInOutCalcVO();  //재고프로세스VO

                    batStockInOutCalcVO.setDlrCd(itemToInfoVO.getDlrCd());
                    batStockInOutCalcVO.setPltCd(itemToInfoVO.getPltCd());
                    batStockInOutCalcVO.setStrgeCd(itemToInfoVO.getStrgeCd());
                    batStockInOutCalcVO.setItemCd(itemToInfoVO.getItemCd());
                    batStockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                    batStockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                    batStockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                    batStockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                    batStockInOutCalcVO.setCalcTp("+");
                    batStockInOutCalcVO.setRentType("");

                    if(movementTypeVO.getMvtTp().equals("21")){

                        batStockInOutCalcVO.setStockSt("01");
                        batStockInOutCalcVO.setStockAmt(itemToInfoVO.getPurcAmt());
                        batStockInOutCalcVO.setStockTaxDdctAmt((itemToInfoVO.getPurcPrc() / (1 + vatInfoVO.getVatApplyRate())) * itemFrInfoVO.getItemQty());

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemToInfoVO.getItemQty(), itemToInfoVO.getPurcAmt(), "+", "");
                    }else if(movementTypeVO.getMvtTp().equals("23")){

                        batStockInOutCalcVO.setStockSt("02");
                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "02", itemToInfoVO.getItemQty(), 0, "+", "");
                    }else if(movementTypeVO.getMvtTp().equals("25")){

                        batStockInOutCalcVO.setStockSt("03");
                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "03", itemToInfoVO.getItemQty(), 0, "+", "");
                    }
                }else{

                    batStockInOutCalcVO = new BatStockInOutCalcVO();  //재고프로세스VO

                    batStockInOutCalcVO.setDlrCd(itemToInfoVO.getDlrCd());
                    batStockInOutCalcVO.setPltCd(itemToInfoVO.getPltCd());
                    batStockInOutCalcVO.setStrgeCd(itemToInfoVO.getStrgeCd());
                    batStockInOutCalcVO.setItemCd(itemToInfoVO.getItemCd());
                    batStockInOutCalcVO.setRectGrGiDtUpdtYn(movementTypeVO.getRectGrGiDtUpdtYn());
                    batStockInOutCalcVO.setMvtGrGiTp(movementTypeVO.getMvtGrGiTp());
                    batStockInOutCalcVO.setCnclMvtYn(movementTypeVO.getCancMvtYn());
                    batStockInOutCalcVO.setQty(itemFrInfoVO.getItemQty());
                    batStockInOutCalcVO.setCalcTp("-");
                    batStockInOutCalcVO.setRentType("");

                    if(movementTypeVO.getMvtTp().equals("22")){

                        batStockInOutCalcVO.setStockSt("01");
                        batStockInOutCalcVO.setStockAmt(itemToInfoVO.getPurcAmt());
                        batStockInOutCalcVO.setStockTaxDdctAmt((itemToInfoVO.getPurcPrc() / (1 + vatInfoVO.getVatApplyRate())) * itemFrInfoVO.getItemQty());

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "01", itemToInfoVO.getItemQty(), itemToInfoVO.getPurcAmt(), "-", "");
                    }else if(movementTypeVO.getMvtTp().equals("24")){

                        batStockInOutCalcVO.setStockSt("02");
                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "02", itemToInfoVO.getItemQty(), 0, "-", "");
                    }else if(movementTypeVO.getMvtTp().equals("26")){

                        batStockInOutCalcVO.setStockSt("03");
                        batStockInOutCalcVO.setStockAmt(0);
                        batStockInOutCalcVO.setStockTaxDdctAmt(0);

                        multiSaveStockInOut(batStockInOutCalcVO);
                        //multiSaveStockInOut(itemToInfoVO.getDlrCd(), itemToInfoVO.getPltCd(), itemToInfoVO.getStrgeCd(), itemToInfoVO.getItemCd(), movementTypeVO.getRectGrGiDtUpdtYn(), movementTypeVO.getMvtGrGiTp(), movementTypeVO.getCancMvtYn(), "03", itemToInfoVO.getItemQty(), 0, "-", "");
                    }
                }

                itemSaveList.add(itemFrInfoVO);
                itemSaveList.add(itemToInfoVO);

                /* B. 출고부품 */

                /*
                //부품출고부품 조회.
                BatStockInOutVO stockInOutFrVO = batchPartsIssueReadyActionDAO.selectStockInOutBatByKey(itemFrInfoVO.getDlrCd(), itemFrInfoVO.getPltCd(), itemFrInfoVO.getStrgeCd(), itemFrInfoVO.getItemCd());
                //가용수량 증가(+)
                stockInOutFrVO.setAvlbStockQty(stockInOutFrVO.getAvlbStockQty() + itemFrInfoVO.getItemQty());
                //예류수량 감소(-)
                double dCalResvStockQty = 0.0;
                dCalResvStockQty = stockInOutFrVO.getResvStockQty() - itemFrInfoVO.getItemQty();
                if(dCalResvStockQty < 0){//마이너스 수량 일 때 0 처리.
                    dCalResvStockQty = 0.0;
                }
                stockInOutFrVO.setResvStockQty(dCalResvStockQty);
                //재고수량 수량 수정.
                batchPartsIssueReadyActionDAO.updateStockInOutBat(stockInOutFrVO);
                //수불처리 부품추가.
                itemSaveList.add(itemFrInfoVO);
                */
            }

            //수불문서헤더/상세 추가
            mvtVO.setMvtTp(movementTypeVO.getMvtTp());
            batchPartsIssueReadyActionDAO.insertMvtDocBat(mvtVO);

            for(BatMvtDocItemVO saveMvtDocItemVO : itemSaveList){
                batchPartsIssueReadyActionDAO.insertMvtDocItemBat(saveMvtDocItemVO);
            }

            return itemSaveList;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     *
     *
     *
     * */
    public int multiSaveStockInOut(BatStockInOutCalcVO batStockInOutCalcVO) throws Exception {
   // public int multiSaveStockInOut(String dlrCd, String pltCd, String strgeCd, String itemCd, String rectGrGiDtUpdtYn,String mvtGrGiTp, String cnclMvtYn, String stockSt, double qty, double stockAmt, String calcTp, String rentType) throws Exception {
        try{
            int updateStockCnt = 0;
            BatStockInOutVO stockInOutVO = null;

            /*********************************************
             * 유효성 점검
             *********************************************/

            stockInOutVO  = batchPartsIssueReadyActionDAO.selectStockInOutBatByKey(batStockInOutCalcVO.getDlrCd(), batStockInOutCalcVO.getPltCd(), batStockInOutCalcVO.getStrgeCd(), batStockInOutCalcVO.getItemCd());

            if(batStockInOutCalcVO.getQty() <= 0){
                //수량정보를 다시 확인해 주세요
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 창고재고 점검
             *********************************************/
            //재고 수량을 "-"처리해야 하는 경우
            if(batStockInOutCalcVO.getCalcTp().equals("-")){
                //재고 상태가 가용재고(01)인 경우
                if(batStockInOutCalcVO.getStockSt().equals("01")){
                    if(stockInOutVO.getAvlbStockQty() <  batStockInOutCalcVO.getQty()){
                        //가용재고가 처리할 수량보다 적습니다.
                        throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.avlbStockQty", null, LocaleContextHolder.getLocale())});
                    }

                //재고 상태가 예약재고(02)인 경우
                }else if(batStockInOutCalcVO.getStockSt().equals("02")){
                    if(stockInOutVO.getResvStockQty() <  batStockInOutCalcVO.getQty()){
                        //예약재고가 처리할 수량보다 적습니다.
                        throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.resvStockQty", null, LocaleContextHolder.getLocale())});
                    }

                //재고 상태가 보류재고(03)인 경우
                }else if(batStockInOutCalcVO.getStockSt().equals("03")){
                    if(stockInOutVO.getClamStockQty() <  batStockInOutCalcVO.getQty()){
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
            if(batStockInOutCalcVO.getCalcTp().equals("-")){
                //재고 상태가 가용재고(01)인 경우
                if(batStockInOutCalcVO.getStockSt().equals("01")){
                    stockInOutVO.setAvlbStockQty(stockInOutVO.getAvlbStockQty() - batStockInOutCalcVO.getQty());

                //재고 상태가 예약재고(02)인 경우
                }else if(batStockInOutCalcVO.getStockSt().equals("02")){
                    stockInOutVO.setResvStockQty(stockInOutVO.getResvStockQty() - batStockInOutCalcVO.getQty());

                //재고 상태가 보류재고(03)인 경우
                }else if(batStockInOutCalcVO.getStockSt().equals("03")){
                    stockInOutVO.setClamStockQty(stockInOutVO.getClamStockQty() - batStockInOutCalcVO.getQty());

                }else{
                    //재고 상태 값을 확인해주세요.(입고예정, 출고예정수량)
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockStat", null, LocaleContextHolder.getLocale())});
                }

                if(batStockInOutCalcVO.getRentType().equals("B")){ //차입인 경우
                    stockInOutVO.setBorrowQty(stockInOutVO.getBorrowQty() - batStockInOutCalcVO.getQty());
                }else if(batStockInOutCalcVO.getRentType().equals("R")){ //대여인 경우
                    stockInOutVO.setRentQty(stockInOutVO.getRentQty() + batStockInOutCalcVO.getQty());
                }

                stockInOutVO.setStockAmt(stockInOutVO.getStockAmt() - batStockInOutCalcVO.getStockAmt());
                stockInOutVO.setStockTaxDdctAmt(stockInOutVO.getStockTaxDdctAmt() - batStockInOutCalcVO.getStockTaxDdctAmt());


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

            }else if(batStockInOutCalcVO.getCalcTp().equals("+")){
                //재고 상태가 가용재고(01)인 경우
                if(batStockInOutCalcVO.getStockSt().equals("01")){
                    stockInOutVO.setAvlbStockQty(stockInOutVO.getAvlbStockQty() + batStockInOutCalcVO.getQty());

                //재고 상태가 예약재고(02)인 경우
                }else if(batStockInOutCalcVO.getStockSt().equals("02")){
                    stockInOutVO.setResvStockQty(stockInOutVO.getResvStockQty() + batStockInOutCalcVO.getQty());

                //재고 상태가 보류재고(03)인 경우
                }else if(batStockInOutCalcVO.getStockSt().equals("03")){
                    stockInOutVO.setClamStockQty(stockInOutVO.getClamStockQty() + batStockInOutCalcVO.getQty());

                }else{
                    //재고 상태 값을 확인해주세요.(입고예정, 출고예정수량)
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockStat", null, LocaleContextHolder.getLocale())});
                }

                if(batStockInOutCalcVO.getRentType().equals("B")){ //차입인 경우
                    stockInOutVO.setBorrowQty(stockInOutVO.getBorrowQty() + batStockInOutCalcVO.getQty());
                }else if(batStockInOutCalcVO.getRentType().equals("R")){ //대여인 경우
                    stockInOutVO.setRentQty(stockInOutVO.getRentQty() - batStockInOutCalcVO.getQty());
                }

                stockInOutVO.setStockAmt(stockInOutVO.getStockAmt() + batStockInOutCalcVO.getStockAmt());
                stockInOutVO.setStockTaxDdctAmt(stockInOutVO.getStockTaxDdctAmt() + batStockInOutCalcVO.getStockTaxDdctAmt());

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

            }else{
                //재고 계산 구분자 정보가 +,-가 아닙니다.
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.stockCalcTp", null, LocaleContextHolder.getLocale())});
            }


            updateStockCnt = batchPartsIssueReadyActionDAO.updateStockInOutBat(stockInOutVO);

            //수정된 건이 없거나 생각보다 많이 수정된 경우
            if(updateStockCnt != 1 ){
               //현재고의 정보가 제대로 수정되지 않았습니다.
               throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.currStock", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 현재고 정보 수정 종료
             *********************************************/

            /*********************************************
             * 처리결과 Return
             *********************************************/
            return 1;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }


}
