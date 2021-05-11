package chn.bhmc.dms.par.stm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.stm.vo.StockInOutCalcVO;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.StockInOutService;
import chn.bhmc.dms.par.stm.service.ToolGiService;
import chn.bhmc.dms.par.stm.service.dao.ToolGiDAO;
import chn.bhmc.dms.par.stm.vo.ToolGiItemVO;
import chn.bhmc.dms.par.stm.vo.ToolGiSearchVO;
import chn.bhmc.dms.par.stm.vo.ToolGiVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 공구출고 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("toolGiService")
public class ToolGiServiceImpl extends HService implements ToolGiService {

    @Resource(name="toolGiDAO")
    private ToolGiDAO toolGiDAO;

    @Resource(name="toolGiDocNoIdgenService")
    EgovIdGnrService toolGiDocNoIdgenService;

    @Autowired
    private StockInOutService stockInOutService;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;


    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#createOrd(java.util.List, chn.bhmc.dms.par.ism.vo.ToolGiVO)
     */
    @Override
    public ToolGiVO createToolGi(List<ToolGiItemVO> list, ToolGiVO toolGiVO) throws Exception {

        try{
            int    toolGiLineNo       = 1;
            int    resultCnt          = 0;
            int    stockInOutResult   = 0;
            double qty                = 0;
            double stockAmt           = 0;
            double stockTaxDdctAmt       = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            ToolGiItemVO toolGiItemVO = new ToolGiItemVO();

            // 수불 생성(공구 폐기)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            StockInOutCalcVO stockInOutCalcVO             = new StockInOutCalcVO();  //재고프로세스 계산VO

            //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            //반품은 상태 "02" 그 외 등록은 "01"
            if(toolGiVO.getToolGiTp().equals("RT")){

                chkToolGiUpdateSomebody(toolGiVO);

                toolGiVO.setRefDocNo(toolGiVO.getToolGiDocNo());
                toolGiVO.setStatCd("02");
            }else{
                toolGiVO.setStatCd("01");
            }

            // 1. 공구출고 번호를 생성한다.
            String toolGiNo =  selectNextToolGiDocNo();
            toolGiVO.setToolGiDocNo(toolGiNo);

            // 2. 공구출고 상태를 설정한다.
            toolGiVO.setStatCd("01"); //"01" 등록상태.

            // 3. 공구출고 헤더를 생성한다.
            toolGiVO.setDlrCd(dlrCd);
            toolGiVO.setRegUsrId(userId);
            resultCnt = toolGiDAO.insertToolGi(toolGiVO);

            if(resultCnt < 1){
                //공구출고 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.toolGiDocNo", null, LocaleContextHolder.getLocale())});
            }


            if(toolGiVO.getToolGiTp().equals("GI")){
                // 4. 공구출고 부품정보를 생성한다.
                for(int i = 0; i < list.size(); i++){

                    qty = list.get(i).getQty();

                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }

                    //amt = qty * list.get(i).getPrc();

                    list.get(i).setToolGiDocNo(toolGiNo);
                    list.get(i).setToolGiDocLineNo(toolGiDAO.selectToolGiMaxLineNo(toolGiVO));
                    list.get(i).setCancYn("N");
                    list.get(i).setRegUsrId(LoginUtil.getUserId());
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());

                    resultCnt = toolGiDAO.insertToolGiItem(list.get(i));

                    if(resultCnt < 1){
                        //부품 생성 실패.[list.get(i).getItemCd()]
                        throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                    }

                    /*********************************************
                     * 재고처리 함수 호출
                     *********************************************/

                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(list.get(i).getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutCalcVO.setItemCd(list.get(i).getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("01");
                    stockInOutCalcVO.setQty(qty);
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("-");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    // 재고처리 함수 이상 주석처리.(가용재고 '-' 처리)
                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(list.get(i).getDlrCd(), pltCd, list.get(i).getStrgeCd(), list.get(i).getItemCd(), "N", "I", "N", "01", qty, stockAmt, "-","","Y");

                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(list.get(i).getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutCalcVO.setItemCd(list.get(i).getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("03");
                    stockInOutCalcVO.setQty(qty);
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("+");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    // 재고처리 함수 이상 주석처리.(보류재고 '+' 처리)
                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(list.get(i).getDlrCd(), pltCd, list.get(i).getStrgeCd(), list.get(i).getItemCd(), "N", "I", "N", "03", qty, stockAmt, "+","","Y");

                    if(stockInOutResult < 1){
                        //재고 처리 중 오류 발생
                       throw processException("par.err.chkStockUpdate");
                    }

                    /*********************************************
                     * 재고처리 함수 호출 종료
                     *********************************************/

                    toolGiLineNo = toolGiLineNo + 1;
                }
            }else if(toolGiVO.getToolGiTp().equals("RT")){
                // 4. 공구출고 부품정보를 생성한다.
                for(int i = 0; i < list.size(); i++){

                    qty = list.get(i).getReturnQty();

                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }

                    if( qty > list.get(i).getQty() ){
                        //반환수량이 출고 수량보다 클 수 없습니다
                        throw processException("global.err.chkGreateParam"
                                , new String[]{messageSource.getMessage("par.lbl.returnQty", null, LocaleContextHolder.getLocale())
                                              ,messageSource.getMessage("par.lbl.giQty", null, LocaleContextHolder.getLocale())  });

                    }

                    //amt = qty * list.get(i).getPrc();

                    list.get(i).setRefDocNo(list.get(i).getToolGiDocNo());
                    list.get(i).setRefDocLineNo(list.get(i).getToolGiDocLineNo());
                    list.get(i).setToolGiDocNo(toolGiNo);
                    list.get(i).setToolGiDocLineNo(toolGiDAO.selectToolGiMaxLineNo(toolGiVO));
                    list.get(i).setCancYn("N");
                    list.get(i).setRegUsrId(LoginUtil.getUserId());
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());

                    resultCnt = toolGiDAO.insertToolGiItem(list.get(i));

                    if(resultCnt < 1){
                        //부품 생성 실패.[list.get(i).getItemCd()]
                        throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                    }

                    /*********************************************
                     * 재고처리 함수 호출
                     *********************************************/
                    // 재고처리 함수 이상 주석처리.(가용재고 '+' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(list.get(i).getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutCalcVO.setItemCd(list.get(i).getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("01");
                    stockInOutCalcVO.setQty(qty);
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("+");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(list.get(i).getDlrCd(), pltCd, list.get(i).getStrgeCd(), list.get(i).getItemCd(), "N", "I", "N", "01", qty, stockAmt, "+","","Y");

                    // 재고처리 함수 이상 주석처리.(보류재고 '-' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(list.get(i).getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutCalcVO.setItemCd(list.get(i).getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("03");
                    stockInOutCalcVO.setQty(qty);
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("-");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(list.get(i).getDlrCd(), pltCd, list.get(i).getStrgeCd(), list.get(i).getItemCd(), "N", "I", "N", "03", qty, stockAmt, "-","","Y");

                    if(stockInOutResult < 1){
                        //재고 처리 중 오류 발생
                       throw processException("par.err.chkStockUpdate");
                    }

                    /*********************************************
                     * 재고처리 함수 호출 종료
                     *********************************************/

                    toolGiLineNo = toolGiLineNo + 1;
                }
            //공구 폐기시
            }else if(toolGiVO.getToolGiTp().equals("65")){

                mvtDocVO.setMvtTp(toolGiVO.getToolGiTp());
                mvtDocVO.setBpCd(dlrCd);

             // 4. 공구출고 부품정보를 생성한다.
                for(int i = 0; i < list.size(); i++){
                    mvtDocItemVO = new MvtDocItemVO();

                    qty = list.get(i).getQty();

                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }

                    /********************************************************************
                     * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                     ********************************************************************/
                    /*
                    searchItemMovingAvgPrcVO.setItemCd(list.get(i).getItemCd()); //부품코드
                    searchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getStrgeCd()); //창고코드
                    searchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

                    itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                    //이동평균가격 정보가 존재하는 경우
                    if(itemMovingAvgPrcVO != null){


                        itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                        itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                        itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                        itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                        itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(qty));
                        itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                        resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                        if(resultCnt != 1){
                            //기타입고 확정 실패.
                            throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                        }

                      //이동평균가격 정보가 없는 경우
                    }else{
                            //기타입고 확정 실패.
                            throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                    }

                    itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                    itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                    resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                    if(resultCnt != 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                     }
                     */


                    /********************************************************************
                     * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                     * 끝
                     ********************************************************************/


                    //amt = qty * list.get(i).getPrc();

                    list.get(i).setToolGiDocNo(toolGiNo);
                    list.get(i).setToolGiDocLineNo(toolGiDAO.selectToolGiMaxLineNo(toolGiVO));
                    list.get(i).setCancYn("N");
                    list.get(i).setRegUsrId(LoginUtil.getUserId());
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());

                    resultCnt = toolGiDAO.insertToolGiItem(list.get(i));

                    if(resultCnt < 1){
                        //부품 생성 실패.[list.get(i).getItemCd()]
                        throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                    }

                    mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                    mvtDocItemVO.setPltCd(pltCd);
                    mvtDocItemVO.setCancStmtYn("N");
                    mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                    mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                    mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                    mvtDocItemVO.setItemQty(qty);
                    mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                    mvtDocItemVO.setDdlnYn("N");
                    mvtDocItemVO.setCurrCd("");
                    mvtDocItemVO.setMvtReasonCont(list.get(i).getRemark());
                    mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                    mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                    mvtDocItemVO.setRefDocNo(list.get(i).getToolGiDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getToolGiDocLineNo());

                    mvtItemList.add(mvtDocItemVO);

                    toolGiLineNo = toolGiLineNo + 1;
                }

                mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

                if(mvtSaveItemList.size() < 1){
                    //공구 폐기 확정이 처리되지 않았습니다.
                   throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.toolCd", null, LocaleContextHolder.getLocale())});
                }

              //생성된 수불 정보를 기타출고 부품정보에 반영한다.
                for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                    toolGiItemVO = new ToolGiItemVO();

                    toolGiItemVO.setDlrCd(dlrCd);
                    toolGiItemVO.setRegUsrId(userId);
                    toolGiItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                    toolGiItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                    toolGiItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                    //toolGiVO.getToolGiTp()

                    toolGiItemVO.setToolGiDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    toolGiItemVO.setToolGiDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                    resultCnt = toolGiDAO.updateToolGiItemMvtInfo(toolGiItemVO);

                    if(resultCnt < 1){
                        //기타출고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.toolCd", null, LocaleContextHolder.getLocale())});
                    }

                    toolGiVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                    toolGiVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                }

                resultCnt = toolGiDAO.updateToolGiMvtInfo(toolGiVO);

                if(resultCnt < 1){
                    //기타출고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.toolCd", null, LocaleContextHolder.getLocale())});
                }
            }

            if(toolGiVO.getToolGiTp().equals("RT")){
                int    noEndCnt          = 0;

                noEndCnt = toolGiDAO.selectReturnUnCompleteItemCntByKey(toolGiVO);

                //미완료된 품목이 1건 이상인 경우
                if(noEndCnt > 0){
                    toolGiVO.setStatCd("02");
                    //반품 시 해당 공구를 전체 반환 한 경우
                }else{
                    toolGiVO.setStatCd("03");
                }

                //기존 공구출고건 상태 변경
                resultCnt = toolGiDAO.updateToolGiStat(toolGiVO);

                if(resultCnt < 1){
                    //공구반품 실패
                    throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("par.btn.invReturn", null, LocaleContextHolder.getLocale())});
                }
            }

            return toolGiVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiToolGis(BaseSaveVO<ToolGiItemVO> obj, ToolGiVO toolGiVO) throws Exception {

        try{
            int    resultCnt          = 0;
            double amt                = 0;
            double qty                = 0;
            double stockAmt           = 0;
            double stockTaxDdctAmt    = 0;
            int    stockInOutResult   = 0;
            int    toolGiLineNo       = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            ToolGiItemVO chkToolGiItemVO = new ToolGiItemVO();

            StockInOutCalcVO stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스 계산VO

            chkToolGiUpdateSomebody(toolGiVO);

            if(!toolGiVO.getStatCd().equals("01")){
                //취소 할 수 없습니다
                  throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.toolGiDocNo", null, LocaleContextHolder.getLocale())});
            }

            //공구 출고 수정
            if(toolGiVO.getToolGiTp().equals("GI")){
                for(ToolGiItemVO itemVO : obj.getInsertList()){
                    toolGiLineNo = toolGiDAO.selectToolGiMaxLineNo(toolGiVO);

                    qty = itemVO.getQty();

                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }

                    /*
                    if(itemVO.getPrc() <= 0){
                        //단가가 0보다 작거나 같을 수 없습니다.
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                    */

                    itemVO.setToolGiDocNo(toolGiVO.getToolGiDocNo());
                    itemVO.setToolGiDocLineNo(toolGiLineNo);
                    itemVO.setCancYn("N");
                    itemVO.setRegUsrId(LoginUtil.getUserId());
                    itemVO.setDlrCd(LoginUtil.getDlrCd());

                    resultCnt = toolGiDAO.insertToolGiItem(itemVO);

                    if(resultCnt < 1){
                        //부품 생성 실패.[itemVO.getItemCd()]
                        throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                    }

                    /*********************************************
                     * 재고처리 함수 호출
                     *********************************************/

                    // 재고처리 함수 이상 주석처리.(가용재고 '-' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                    stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("01");
                    stockInOutCalcVO.setQty(qty);
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("-");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "01", qty, stockAmt, "-","","Y");

                    // 재고처리 함수 이상 주석처리.(보류재고 '+' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                    stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("03");
                    stockInOutCalcVO.setQty(qty);
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("+");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "03", qty, stockAmt, "+","","Y");

                    if(stockInOutResult < 1){
                        //재고 처리 중 오류 발생
                       throw processException("par.err.chkStockUpdate");
                    }

                    /*********************************************
                     * 재고처리 함수 호출 종료
                     *********************************************/
                }

                for(ToolGiItemVO itemVO : obj.getUpdateList()){
                    chkToolGiItemVO = new ToolGiItemVO();

                    if( itemVO.getQty() <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }


                    /*
                    if(itemVO.getPrc() <= 0){
                        //단가가 0보다 작거나 같을 수 없습니다.
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                    */

                    chkToolGiItemVO = toolGiDAO.selectToolGiLineByKey(itemVO);

                    if( !chkToolGiItemVO.getItemCd().equals(itemVO.getItemCd()) ){
                        //공구번호는 수정할 수 없습니다.
                        throw processException("global.info.impos", new String[]{messageSource.getMessage("par.lbl.toolCd", null, LocaleContextHolder.getLocale())});
                    }


                    itemVO.setAmt(amt);
                    itemVO.setDlrCd(dlrCd);
                    itemVO.setUpdtUsrId(userId);

                    resultCnt = toolGiDAO.updateToolGiItem(itemVO);

                    if(resultCnt < 1){
                        //부품 수정 실패
                        throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                    }

                    /***************************************************************
                     * 재고처리 함수 호출(기존 등록된 보류 수량을 취소하고 다시 보류 수량을 등록한다.
                     ***************************************************************/

                    // 재고처리 함수 이상 주석처리.(가용재고 '+' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                    stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("01");
                    stockInOutCalcVO.setQty(chkToolGiItemVO.getQty());
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("+");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "01", chkToolGiItemVO.getQty(), stockAmt, "+","","Y");

                    // 재고처리 함수 이상 주석처리.(보류재고 '-' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                    stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("03");
                    stockInOutCalcVO.setQty(chkToolGiItemVO.getQty());
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("-");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "03", chkToolGiItemVO.getQty(), stockAmt, "-","","Y");

                    if(stockInOutResult < 1){
                        //재고 처리 중 오류 발생
                       throw processException("par.err.chkStockUpdate");
                    }

                    // 재고처리 함수 이상 주석처리.(가용재고 '-' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                    stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("01");
                    stockInOutCalcVO.setQty(itemVO.getQty());
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("-");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "01", itemVO.getQty(), stockAmt, "-","","Y");

                    // 재고처리 함수 이상 주석처리.(보류재고 '+' 처리)
                    stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                    stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                    stockInOutCalcVO.setPltCd(pltCd);
                    stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                    stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                    stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                    stockInOutCalcVO.setMvtGrGiTp("I");
                    stockInOutCalcVO.setCnclMvtYn("N");
                    stockInOutCalcVO.setStockSt("03");
                    stockInOutCalcVO.setQty(itemVO.getQty());
                    stockInOutCalcVO.setStockAmt(stockAmt);
                    stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                    stockInOutCalcVO.setCalcTp("+");
                    stockInOutCalcVO.setRentType("");
                    stockInOutCalcVO.setGrtePrcChkYn("Y");

                    stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                    //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "03", itemVO.getQty(), stockAmt, "+","","Y");

                    if(stockInOutResult < 1){
                        //재고 처리 중 오류 발생
                        throw processException("par.err.chkStockUpdate");
                    }

                    /*********************************************
                     * 재고처리 함수 호출 종료
                     *********************************************/
                }

                for(ToolGiItemVO itemVO : obj.getDeleteList()){
                    itemVO.setRegUsrId(userId);
                    itemVO.setDlrCd(dlrCd);

                    if(!itemVO.getCancYn().equals("Y")){
                        resultCnt = toolGiDAO.deleteToolGiItem(itemVO);

                        if(resultCnt < 1){
                            //부품 생성 실패.[list.get(i).getItemCd()]
                            throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                        }

                        /*********************************************
                         * 재고처리 함수 호출
                         *********************************************/

                        // 재고처리 함수 이상 주석처리.(가용재고 '+' 처리)
                        stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                        stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                        stockInOutCalcVO.setPltCd(pltCd);
                        stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                        stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                        stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                        stockInOutCalcVO.setMvtGrGiTp("I");
                        stockInOutCalcVO.setCnclMvtYn("N");
                        stockInOutCalcVO.setStockSt("01");
                        stockInOutCalcVO.setQty(qty);
                        stockInOutCalcVO.setStockAmt(stockAmt);
                        stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                        stockInOutCalcVO.setCalcTp("+");
                        stockInOutCalcVO.setRentType("");
                        stockInOutCalcVO.setGrtePrcChkYn("Y");

                        stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                        //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "01", qty, stockAmt, "+","","Y");

                        // 재고처리 함수 이상 주석처리.(보류재고 '-' 처리)
                        stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                        stockInOutCalcVO.setDlrCd(itemVO.getDlrCd());
                        stockInOutCalcVO.setPltCd(pltCd);
                        stockInOutCalcVO.setStrgeCd(itemVO.getStrgeCd());
                        stockInOutCalcVO.setItemCd(itemVO.getItemCd());
                        stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                        stockInOutCalcVO.setMvtGrGiTp("I");
                        stockInOutCalcVO.setCnclMvtYn("N");
                        stockInOutCalcVO.setStockSt("03");
                        stockInOutCalcVO.setQty(qty);
                        stockInOutCalcVO.setStockAmt(stockAmt);
                        stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                        stockInOutCalcVO.setCalcTp("-");
                        stockInOutCalcVO.setRentType("");
                        stockInOutCalcVO.setGrtePrcChkYn("Y");

                        stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                        //stockInOutResult = stockInOutService.multiSaveStockInOut(itemVO.getDlrCd(), pltCd, itemVO.getStrgeCd(), itemVO.getItemCd(), "N", "I", "N", "03", qty, stockAmt, "-","","Y");

                        if(stockInOutResult < 1){
                            //재고 처리 중 오류 발생
                           throw processException("par.err.chkStockUpdate");
                        }

                        /*********************************************
                         * 재고처리 함수 호출 종료
                         *********************************************/
                    }
                }
            }

            resultCnt = toolGiDAO.updateToolGi(toolGiVO);

            if(resultCnt < 1){
              //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.toolGiDocNo", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#deleteToolGi(chn.bhmc.dms.par.ism.vo.ToolGiVO)
     */
    @Override
    public int cancelToolGi(List<ToolGiItemVO> list, ToolGiVO toolGiVO) throws Exception {

        try{
            int    resultCnt          = 0;
            double qty                = 0;
            double stockAmt           = 0;
            double stockTaxDdctAmt    = 0;
            int    stockInOutResult   = 0;
            String pltCd  = LoginUtil.getPltCd();
            //String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            //ToolGiItemVO toolGiItemVO = new ToolGiItemVO();

            chkToolGiUpdateSomebody(toolGiVO);

            // 수불 생성(공구 폐기)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            StockInOutCalcVO stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스 계산VO

            //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            if(!toolGiVO.getStatCd().equals("01")){
              //취소 할 수 없습니다
                throw processException("global.err.cnclFailed");
            }

            if(toolGiVO.getToolGiTp().equals("GI")){
                // 4. 공구출고 부품정보를 취소처리한다.
                for(int i = 0; i < list.size(); i++){

                    qty = list.get(i).getQty();

                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }

                    list.get(i).setRegUsrId(LoginUtil.getUserId());
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());

                    if(!list.get(i).getCancYn().equals("Y")){
                        resultCnt = toolGiDAO.deleteToolGiItem(list.get(i));

                        if(resultCnt < 1){
                            //부품 생성 실패.[list.get(i).getItemCd()]
                            throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                        }

                        /*********************************************
                         * 재고처리 함수 호출
                         *********************************************/

                        // 재고처리 함수 이상 주석처리.(가용재고 '+' 처리)
                        stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                        stockInOutCalcVO.setDlrCd(list.get(i).getDlrCd());
                        stockInOutCalcVO.setPltCd(pltCd);
                        stockInOutCalcVO.setStrgeCd(list.get(i).getStrgeCd());
                        stockInOutCalcVO.setItemCd(list.get(i).getItemCd());
                        stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                        stockInOutCalcVO.setMvtGrGiTp("I");
                        stockInOutCalcVO.setCnclMvtYn("N");
                        stockInOutCalcVO.setStockSt("01");
                        stockInOutCalcVO.setQty(qty);
                        stockInOutCalcVO.setStockAmt(stockAmt);
                        stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                        stockInOutCalcVO.setCalcTp("+");
                        stockInOutCalcVO.setRentType("");
                        stockInOutCalcVO.setGrtePrcChkYn("Y");

                        stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                        //stockInOutResult = stockInOutService.multiSaveStockInOut(list.get(i).getDlrCd(), pltCd, list.get(i).getStrgeCd(), list.get(i).getItemCd(), "N", "I", "N", "01", qty, stockAmt, "+","","Y");

                        // 재고처리 함수 이상 주석처리.(보류재고 '-' 처리)
                        stockInOutCalcVO = new StockInOutCalcVO();  //재고프로세스VO

                        stockInOutCalcVO.setDlrCd(list.get(i).getDlrCd());
                        stockInOutCalcVO.setPltCd(pltCd);
                        stockInOutCalcVO.setStrgeCd(list.get(i).getStrgeCd());
                        stockInOutCalcVO.setItemCd(list.get(i).getItemCd());
                        stockInOutCalcVO.setRectGrGiDtUpdtYn("N");
                        stockInOutCalcVO.setMvtGrGiTp("I");
                        stockInOutCalcVO.setCnclMvtYn("N");
                        stockInOutCalcVO.setStockSt("03");
                        stockInOutCalcVO.setQty(qty);
                        stockInOutCalcVO.setStockAmt(stockAmt);
                        stockInOutCalcVO.setStockTaxDdctAmt(stockTaxDdctAmt);
                        stockInOutCalcVO.setCalcTp("-");
                        stockInOutCalcVO.setRentType("");
                        stockInOutCalcVO.setGrtePrcChkYn("Y");

                        stockInOutResult = stockInOutService.multiSaveStockInOut(stockInOutCalcVO);
                        //stockInOutResult = stockInOutService.multiSaveStockInOut(list.get(i).getDlrCd(), pltCd, list.get(i).getStrgeCd(), list.get(i).getItemCd(), "N", "I", "N", "03", qty, stockAmt, "-","","Y");

                        if(stockInOutResult < 1){
                            //재고 처리 중 오류 발생
                           throw processException("par.err.chkStockUpdate");
                        }

                        /*********************************************
                         * 재고처리 함수 호출 종료
                         *********************************************/
                    }

                }
            }else if(toolGiVO.getToolGiTp().equals("65")){

                mvtDocVO.setMvtTp(toolGiVO.getToolGiTp());
                mvtDocVO.setBpCd(dlrCd);
                mvtDocVO.setMvtDocYyMm(toolGiVO.getMvtDocYyMm());
                mvtDocVO.setMvtDocNo(toolGiVO.getMvtDocNo());

               // 4. 공구출고 부품정보를 취소처리한다.
                for(int i = 0; i < list.size(); i++){

                    mvtDocItemVO = new MvtDocItemVO();

                    qty = list.get(i).getQty();

                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }

                    /********************************************************************
                     * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                     ********************************************************************/
                    /*
                    searchItemMovingAvgPrcVO.setItemCd(list.get(i).getItemCd()); //부품코드
                    searchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getStrgeCd()); //창고코드
                    searchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

                    itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                    //이동평균가격 정보가 존재하는 경우
                    if(itemMovingAvgPrcVO != null){


                        itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                        itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                        itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                        itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                        itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(qty));
                        itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                        resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                        if(resultCnt != 1){
                            //기타입고 확정 실패.
                            throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                        }

                      //이동평균가격 정보가 없는 경우
                    }else{
                            //기타입고 확정 실패.
                            throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                    }

                    itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                    itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                    resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                    if(resultCnt != 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                     }
                     */


                    /********************************************************************
                     * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                     * 끝
                     ********************************************************************/

                    list.get(i).setRegUsrId(LoginUtil.getUserId());
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());

                    if(!list.get(i).getCancYn().equals("Y")){
                        resultCnt = toolGiDAO.deleteToolGiItem(list.get(i));

                        if(resultCnt < 1){
                            //부품 생성 실패.[list.get(i).getItemCd()]
                            throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                        }

                        mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                        mvtDocItemVO.setPltCd(pltCd);
                        mvtDocItemVO.setCancStmtYn("Y");
                        mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                        mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                        mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                        mvtDocItemVO.setItemQty(qty);
                        mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                        mvtDocItemVO.setDdlnYn("N");
                        mvtDocItemVO.setCurrCd("");
                        mvtDocItemVO.setMvtReasonCont(list.get(i).getRemark());
                        mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                        mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                        mvtDocItemVO.setRefDocNo(list.get(i).getMvtDocNo());
                        mvtDocItemVO.setRefDocLineNo(list.get(i).getMvtDocLineNo());

                        mvtItemList.add(mvtDocItemVO);


                    }

                }

                mvtSaveItemList = mvtDocService.multiCnclMvtDocs(mvtDocVO, mvtItemList);

                if(mvtSaveItemList.size() < 1){
                    //기타출고부품의 출고 확정이 처리되지 않았습니다.
                   throw processException("par.err.failedEtcIssueMsg");
                }

                //생성된 수불 정보를 기타출고 부품정보에 반영한다.
                /*
                for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                    mvtDocItemVO = new MvtDocItemVO();

                    mvtDocItemVO.setDlrCd(dlrCd);
                    mvtDocItemVO.setRegUsrId(userId);
                    mvtDocItemVO.setCancMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                    mvtDocItemVO.setCancMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                    mvtDocItemVO.setCancMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                    //toolGiVO.getToolGiTp()

                    mvtDocItemVO.setMvtDocYyMm(toolGiVO.getMvtDocYyMm());
                    mvtDocItemVO.setMvtDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    mvtDocItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                    resultCnt = mvtDocService.updateMvtDocInfoByCancel(mvtDocItemVO);

                    if(resultCnt < 1){
                        //기타출고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.toolCd", null, LocaleContextHolder.getLocale())});
                    }
                }*/
            }



            toolGiVO.setStatCd("04"); //취소상태로 변경

            //기존 공구출고건 상태 변경
            resultCnt = toolGiDAO.updateToolGiCancel(toolGiVO);

            if(resultCnt < 1){
              //공구출고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.toolCd", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#selectToolGiByKey(chn.bhmc.dms.par.ism.vo.ToolGiSearchVO)
     */
    @Override
    public ToolGiVO selectToolGiByKey(ToolGiSearchVO toolGiSearchVO) throws Exception {

        return toolGiDAO.selectToolGiByKey(toolGiSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#selectToolGiItemByKey(chn.bhmc.dms.par.ism.vo.ToolGiVO)
     */
    @Override
    public List<ToolGiItemVO> selectToolGiItemByKey(ToolGiSearchVO toolGiSearchVO) throws Exception {

        return toolGiDAO.selectToolGiItemByKey(toolGiSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#selectToolGiItemExcelUploadByKey(chn.bhmc.dms.par.ism.vo.ToolGiItemVO)
     */
    @Override
    public ToolGiItemVO selectToolGiItemExcelUploadByKey(ToolGiItemVO toolGiItemVO) throws Exception {

        return toolGiDAO.selectToolGiItemExcelUploadByKey(toolGiItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#selectToolGiesByCondition(chn.bhmc.dms.par.ism.vo.ToolGiSearchVO)
     */
    @Override
    public List<ToolGiVO> selectToolGisByCondition(ToolGiSearchVO searchVO) throws Exception {
        return toolGiDAO.selectToolGisByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#selectToolGisByConditionCnt(chn.bhmc.dms.par.ism.vo.ToolGiSearchVO)
     */
    @Override
    public int selectToolGisByConditionCnt(ToolGiSearchVO searchVO) throws Exception {
        return toolGiDAO.selectToolGisByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.ToolGiService#selectNextToolGiDocNo()
     */
    @Override
    public String selectNextToolGiDocNo() throws Exception {
        try {
            return toolGiDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.toolGiDocNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ToolGiService#selectToolGiItemListByKey(chn.bhmc.dms.par.stm.vo.ToolGiSearchVO)
     */
    @Override
    public List<ToolGiItemVO> selectToolGiItemListByKey(ToolGiSearchVO searchVO) throws Exception {

        return toolGiDAO.selectToolGiItemListByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ToolGiService#selectToolGiItemListByKeyCnt(chn.bhmc.dms.par.stm.vo.ToolGiSearchVO)
     */
    @Override
    public int selectToolGiItemListByKeyCnt(ToolGiSearchVO searchVO) throws Exception {

        return toolGiDAO.selectToolGiItemListByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ToolGiService#selectSearchToolItemByCondition(chn.bhmc.dms.par.stm.vo.ToolGiSearchVO)
     */
    @Override
    public List<ToolGiItemVO> selectSearchToolItemByCondition(ToolGiSearchVO searchVO) throws Exception {

        return toolGiDAO.selectSearchToolItemByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.ToolGiService#selectSearchToolItemByConditionCnt(chn.bhmc.dms.par.stm.vo.ToolGiSearchVO)
     */
    @Override
    public int selectSearchToolItemByConditionCnt(ToolGiSearchVO searchVO) throws Exception {

        return toolGiDAO.selectSearchToolItemByConditionCnt(searchVO);
    }

    public void chkToolGiUpdateSomebody(ToolGiVO toolGiVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = toolGiDAO.selectToolGiUpdtDtByKey(toolGiVO);

            if(!updtDtStrNow.equals(toolGiVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.toolGiDocNo", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.toolGiDocNo", null, LocaleContextHolder.getLocale())});
        }
    }
}
