package chn.bhmc.dms.par.stm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.InvestigationService;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.service.dao.InvestigationDAO;
import chn.bhmc.dms.par.stm.service.dao.StockInOutDAO;
import chn.bhmc.dms.par.stm.vo.InvestigationItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSaveVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;
import chn.bhmc.dms.par.stm.vo.StockInOutSearchVO;
import chn.bhmc.dms.par.stm.vo.StockInOutVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;



/**
 * 재고실사 구현 클래스
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
@Service("investigationService")
public class InvestigationServiceImpl extends HService implements InvestigationService , JxlsSupport {

    @Resource(name="investigationDAO")
    private InvestigationDAO investigationDAO;

    @Resource(name="stockInOutDAO")
    private StockInOutDAO stockInOutDAO;

    @Resource(name="stockDDDocNoIdgenService")
    EgovIdGnrService stockDDDocNoIdgenService;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 부품이동평균가격 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;
    

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#createClaim(java.util.List, chn.bhmc.dms.par.pcm.vo.ClaimVO)
     */
    @Override
    public int createInvestigation(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {

        try{

            String  investigationDocNo;
            int     resultCnt        = 0;
            int     stockDDDocLineNo = 1;
            StockInOutVO stockInOutVO = new StockInOutVO(); //재고통제 수정을 위해 사용

            /*********************************************
             *  1. 재고실사 번호를 생성 및 세션정보를 세팅한다.
             *********************************************/
            investigationDocNo =  selectNextStockDDDocNo();
            investigationVO.setStockDdDocNo(investigationDocNo);
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setDocStatCd("RGST");

            /*********************************************
             * 2. 재고실사 생성 전 Validation 체크한다.
             *********************************************/
            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                 //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                 //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getStrgeCd() == null) || (investigationVO.getStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPrsnId() == null) || (investigationVO.getPrsnId().isEmpty())){
                //실사 담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.investigationPrsId", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3.  재고실사정보(헤더)를 생성한다.
             *********************************************/
            resultCnt = investigationDAO.insertInvestigationHeader(investigationVO);


            for(int i = 0; i < list.size(); i++){
                stockInOutVO = new StockInOutVO();
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setStockDdDocNo(investigationDocNo);
                list.get(i).setStockDdDocLineNo(stockDDDocLineNo);
                list.get(i).setItemStatCd("RGST");



                /*********************************************
                 * 4. 재고실사 생성 전 Validation 체크한다.
                 *********************************************/

                if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                   throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                     //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                /*********************************************
                 * 5.  재고실사 품목 정보를 등록한다.
                 *********************************************/
                resultCnt = investigationDAO.insertInvestigationItem(list.get(i));

                if(resultCnt < 1){
                     //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }

                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
                    stockInOutVO.setRegUsrId(LoginUtil.getUserId());
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutVO.setItemCd(list.get(i).getItemCd());
                    stockInOutVO.setStockLockYn(investigationVO.getStockLockYn());

                    /*********************************************
                     * 6.  재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
                     *********************************************/
                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);

                    if(resultCnt < 1){
                         //재고실사등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }
                }


                stockDDDocLineNo = stockDDDocLineNo + 1;
            }

            return resultCnt;

       }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#createClaim(java.util.List, chn.bhmc.dms.par.pcm.vo.ClaimVO)
     */
    @Override
    public InvestigationVO createInvestigationReg(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {

        try{


            String  investigationDocNo;
            int     resultCnt        = 0;
            int     stockDDDocLineNo = 1;
           // StockInOutVO stockInOutVO       = new StockInOutVO(); //재고통제 수정을 위해 사용

            /*********************************************
             *  1. 재고실사 번호를 생성 및 세션정보를 세팅한다.
             *********************************************/
            investigationDocNo =  selectNextStockDDDocNo();
            investigationVO.setStockDdDocNo(investigationDocNo);
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setDocStatCd("REDY");

            /*********************************************
             * 2. 재고실사 생성 전 Validation 체크한다.
             *********************************************/
            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            /*if( (investigationVO.getStrgeCd() == null) || (investigationVO.getStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }*/

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPrsnId() == null) || (investigationVO.getPrsnId().isEmpty())){
                //실사 담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.investigationPrsId", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3.  재고실사정보(헤더)를 생성한다.
             *********************************************/
            resultCnt = investigationDAO.insertInvestigationHeader(investigationVO);


            for(int i = 0; i < list.size(); i++){
             //   stockInOutVO       = new StockInOutVO();
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setStockDdDocNo(investigationDocNo);
                list.get(i).setStockDdDocLineNo(stockDDDocLineNo);
                list.get(i).setItemStatCd("REDY");
                //list.get(i).setDdQty(null);
                //list.get(i).setBookQty(null);

                /*********************************************
                 * 4. 재고실사 생성 전 Validation 체크한다.
                 *********************************************/

                if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                /*********************************************
                 * 5.  재고실사 품목 정보를 등록한다.
                 *********************************************/
                resultCnt = investigationDAO.insertInvestigationItem(list.get(i));

                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }

                stockDDDocLineNo = stockDDDocLineNo + 1;
            }

            return investigationVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationReg(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public InvestigationVO updateInvestigationReg(List<InvestigationItemVO> list, InvestigationVO investigationVO)
            throws Exception {

        try{

            int     resultCnt        = 0;
            int     stockDDDocLineNo = 1;

            /*********************************************
             *  1. 재고실사 번호를 생성 및 세션정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setUpdtUsrId(LoginUtil.getUserId());

            /*********************************************
             * 2. 재고실사 생성 전 Validation 체크한다.
             *********************************************/

            //저장전 수정내역이있는지 Validation 체크
            //chkInvestigationUpdateSomebody(investigationVO);


            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            /*if( (investigationVO.getStrgeCd() == null) || (investigationVO.getStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }*/

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPrsnId() == null) || (investigationVO.getPrsnId().isEmpty())){
                //실사 담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.investigationPrsId", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3. 재고실사정보(헤더)를  수정한다.
             *********************************************/
            resultCnt = investigationDAO.updateInvestigationApplyReq(investigationVO);

            /*********************************************
             * 4.  재고실사정보(상세)를 삭제한다.
             *********************************************/
            InvestigationItemVO investigationItemVO = new InvestigationItemVO();
            investigationItemVO.setDlrCd(LoginUtil.getDlrCd());
            investigationItemVO.setStockDdDocNo(investigationVO.getStockDdDocNo());
            investigationItemVO.setStockDdDocLineNo(0);
            resultCnt = investigationDAO.deleteInvestigationItem(investigationItemVO);

            /*********************************************
             * 5.  재고실사정보(상세)를 추가한다.
             *********************************************/

            for(int i = 0; i < list.size(); i++){
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setStockDdDocNo(investigationVO.getStockDdDocNo());
                list.get(i).setStockDdDocLineNo(stockDDDocLineNo);
                list.get(i).setItemStatCd(investigationVO.getDocStatCd()); //상태코드 : REDY준비, RGST등록, CANC 취소, REQ 승인요청, END 완료

                if((list.get(i).getItemStatCd().equals("CANC"))){
                    list.get(i).setDdQty(null);
                    list.get(i).setBookQty(null);
                }

                /*********************************************
                 * 4. 재고실사 생성 전 Validation 체크한다.
                 *********************************************/

                if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                /*********************************************
                 * 5.  재고실사 품목 정보를 등록한다.
                 *********************************************/
                resultCnt = investigationDAO.insertInvestigationItem(list.get(i));

                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }

                stockDDDocLineNo = stockDDDocLineNo + 1;
            }

            return investigationVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationRegNew(chn.bhmc.dms.par.stm.vo.InvestigationSaveVO)
     */
    @Override
    public InvestigationVO updateInvestigationRegNew(InvestigationSaveVO investigationSaveVO) throws Exception {
        try{
            InvestigationVO investigationVO = new InvestigationVO();
            investigationVO = investigationSaveVO.getInvestigationVO();
            StockInOutVO stockInOutVO = new StockInOutVO(); //재고통제 수정을 위해 사용
            InvestigationSearchVO investigationSearchVO = new InvestigationSearchVO();
            int resultCnt = 0;

            /*********************************************
             *  1. 재고실사 번호를 생성 및 세션정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setUpdtUsrId(LoginUtil.getUserId());

            /*********************************************
             * 2. 재고실사 생성 전 Validation 체크한다.
             *********************************************/

            //저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);


            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("RGST")){      // 저장시 상태체크
                throw processException("par.info.checkStatus");
            }

            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            /*if( (investigationVO.getStrgeCd() == null) || (investigationVO.getStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }*/

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPrsnId() == null) || (investigationVO.getPrsnId().isEmpty())){
                //실사 담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.investigationPrsId", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3. 재고실사정보(헤더)를  수정한다.
             *********************************************/
            resultCnt = investigationDAO.updateInvestigationApplyReq(investigationVO);

            /*********************************************
             * 4.  재고실사정보(상세)를 저장한다.
             *********************************************/
            List<InvestigationItemVO> deleteList = investigationSaveVO.getInvestigationList().getDeleteList();
            for(int i = 0; i < deleteList.size(); i++){
                deleteList.get(i).setDlrCd(LoginUtil.getDlrCd());
                resultCnt = investigationDAO.deleteInvestigationItem(deleteList.get(i));

                /*********************************************
                 * 재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
                 *********************************************/
                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
                    stockInOutVO.setRegUsrId(LoginUtil.getUserId());
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(deleteList.get(i).getStrgeCd());
                    stockInOutVO.setItemCd(deleteList.get(i).getItemCd());
                    stockInOutVO.setStockLockYn("N");

                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);
                    if(resultCnt < 1){
                         //부품 수정 실패
                        throw processException("global.err.modifyFailedParam", new String[]{deleteList.get(i).getItemCd()});
                    }
                }
            }

            List<InvestigationItemVO> insertList = investigationSaveVO.getInvestigationList().getInsertList();
            for(int i = 0; i < insertList.size(); i++){
                insertList.get(i).setRegUsrId(LoginUtil.getUserId());
                insertList.get(i).setDlrCd(LoginUtil.getDlrCd());
                insertList.get(i).setStockDdDocNo(investigationVO.getStockDdDocNo());
                insertList.get(i).setStockDdDocLineNo(0);
                insertList.get(i).setItemStatCd(investigationVO.getDocStatCd()); //상태코드 : REDY준비, RGST등록, CANC 취소, REQ 승인요청, END 완료

                if((insertList.get(i).getItemStatCd().equals("CANC"))){
                    insertList.get(i).setDdQty(null);
                    insertList.get(i).setBookQty(null);
                }
                /*********************************************
                 * 4-1. 재고실사 생성 전 Validation 체크한다.
                 *********************************************/
                if( (insertList.get(i).getDlrCd() == null) || (insertList.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }
                if( (insertList.get(i).getItemCd() == null) || (insertList.get(i).getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }
                /*********************************************
                 * 4-2.  재고실사 품목 정보를 등록한다.
                 *********************************************/
                resultCnt = investigationDAO.insertInvestigationItemNew(insertList.get(i));
                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }

                /*********************************************
                 * 재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
                 *********************************************/
                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
                    stockInOutVO.setRegUsrId(LoginUtil.getUserId());
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(insertList.get(i).getStrgeCd());
                    stockInOutVO.setItemCd(insertList.get(i).getItemCd());
                    stockInOutVO.setStockLockYn("Y");

                    // 재고통제여부확인
                    int stockLockCnt = investigationDAO.selectStockLockItem(stockInOutVO);
                    if(stockLockCnt > 0){
                        throw processException("par.err.stockLockMsgParam");
                    }

                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);
                    if(resultCnt < 1){
                         //부품 수정 실패
                        throw processException("global.err.modifyFailedParam", new String[]{insertList.get(i).getItemCd()});
                    }
                }
            }

            List<InvestigationItemVO> updateList = investigationSaveVO.getInvestigationList().getUpdateList();
            for(int i = 0; i < updateList.size(); i++){
                updateList.get(i).setRegUsrId(LoginUtil.getUserId());
                //updateList.get(i).setDlrCd(LoginUtil.getDlrCd());
                //updateList.get(i).setStockDdDocNo(investigationVO.getStockDdDocNo());
                //updateList.get(i).setStockDdDocLineNo(investigationVO.getStockDdDocLineNo());
                updateList.get(i).setItemStatCd(investigationVO.getDocStatCd()); //상태코드 : REDY준비, RGST등록, CANC 취소, REQ 승인요청, END 완료

                if((updateList.get(i).getItemStatCd().equals("CANC"))){
                    updateList.get(i).setDdQty(null);
                    updateList.get(i).setBookQty(null);
                }
                /*********************************************
                 * 4-1. 재고실사 생성 전 Validation 체크한다.
                 *********************************************/
                if( (updateList.get(i).getDlrCd() == null) || (updateList.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }
                if( (updateList.get(i).getItemCd() == null) || (updateList.get(i).getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }
                /*********************************************
                 * 4-2.  재고실사 품목 정보를 등록한다.
                 *********************************************/
                resultCnt = investigationDAO.insertInvestigationItemNew(updateList.get(i));

                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }
            }

            investigationSearchVO.setsDlrCd(investigationVO.getDlrCd());
            investigationSearchVO.setsStockDdDocNo(investigationVO.getStockDdDocNo());
            investigationVO = investigationDAO.selectInvestigationListByKey(investigationSearchVO);

            return investigationVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationRegAdd(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public InvestigationVO updateInvestigationRegAdd(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {
        try{
            int resultCnt = 0;

            /*********************************************
             *  1. 재고실사 번호를 생성 및 세션정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setUpdtUsrId(LoginUtil.getUserId());

            /*********************************************
             * 2. 재고실사 생성 전 Validation 체크한다.
             *********************************************/

            //저장전 수정내역이있는지 Validation 체크
            //chkInvestigationUpdateSomebody(investigationVO);

            if(!(investigationVO.getStockDdDocNo() == null || investigationVO.getStockDdDocNo().equals(""))){
                String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
                if(!docStatus.equals("REDY")){      // 저장시 상태체크
                    throw processException("par.info.checkStatus");
                }
            }

            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            /*if( (investigationVO.getStrgeCd() == null) || (investigationVO.getStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }*/

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPrsnId() == null) || (investigationVO.getPrsnId().isEmpty())){
                //실사 담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.investigationPrsId", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3. 재고실사정보(헤더)를  저장한다.
             *********************************************/
            // 신규건인경우 재고실사문서번호채번
            if(investigationVO.getStockDdDocNo() == null || investigationVO.getStockDdDocNo().equals("")){
                investigationVO.setStockDdDocNo(selectNextStockDDDocNo());
            }

            resultCnt = investigationDAO.insertInvestigationHeaderAdd(investigationVO);

            /*********************************************
             * 4.  재고실사정보(상세)를 추가한다.
             *********************************************/
            for(int i = 0; i < list.size(); i++){
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setStockDdDocNo(investigationVO.getStockDdDocNo());
                list.get(i).setItemStatCd(investigationVO.getDocStatCd()); //상태코드 : REDY준비, RGST등록, CANC 취소, REQ 승인요청, END 완료

                if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                /*********************************************
                 * 5.  재고실사 품목 정보를 등록한다.
                 *********************************************/
                //resultCnt = investigationDAO.insertInvestigationItem(list.get(i));
                resultCnt = investigationDAO.insertInvestigationItemNew(list.get(i));

                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }
            }
            return investigationVO;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#deleteInvestigationReg(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public InvestigationVO deleteInvestigationReg(List<InvestigationItemVO> list) throws Exception {
        try{
            InvestigationVO investigationVO = new InvestigationVO();
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setUpdtUsrId(LoginUtil.getUserId());
            if(list.size() > 0){
                investigationVO.setStockDdDocNo(list.get(0).getStockDdDocNo());
                investigationVO.setDocStatCd(list.get(0).getItemStatCd());
            }

            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("REDY")){      // 저장시 상태체크
                throw processException("par.info.checkStatus");
            }

            /*********************************************
             * 1.  재고실사정보(상세)를 삭제한다.
             *********************************************/
            for(int i = 0; i < list.size(); i++){
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                /*********************************************
                 * 5.  재고실사 품목 정보를 삭제한다.
                 *********************************************/
                investigationDAO.deleteInvestigationItem(list.get(i));
            }
            return investigationVO;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#createInvestigationCnfm(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public InvestigationVO createInvestigationCnfm(List<InvestigationItemVO> list, InvestigationVO investigationVO)
            throws Exception {

        try{

            int     resultCnt        = 0;
            int     stockDDDocLineNo = 1;
            StockInOutVO stockInOutVO       = new StockInOutVO(); //재고통제 수정을 위해 사용

            /*********************************************
             *  1. 재고실사 번호를 생성 및 세션정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setDocStatCd("RGST");

            /*********************************************
             * 2. 재고실사 생성 전 Validation 체크한다.
             *********************************************/

            //저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);

            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("REDY")){
                throw processException("par.info.checkStatus");
            }

            if( (investigationVO.getStockDdDocNo() == null) || (investigationVO.getStockDdDocNo().isEmpty())){
                //실사문서정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3.  재고실사정보(헤더)를 생성한다.
             *********************************************/
            resultCnt = investigationDAO.updateInvestigationRegCnfm(investigationVO);

            /*********************************************
             * 4.  재고실사정보(상세)를 삭제한다.
             *********************************************/
            InvestigationItemVO investigationItemVO = new InvestigationItemVO();
            investigationItemVO.setDlrCd(LoginUtil.getDlrCd());
            investigationItemVO.setStockDdDocNo(investigationVO.getStockDdDocNo());
            investigationItemVO.setStockDdDocLineNo(0);
            resultCnt = investigationDAO.deleteInvestigationItem(investigationItemVO);

            for(int i = 0; i < list.size(); i++){
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setStockDdDocNo(investigationVO.getStockDdDocNo());
                list.get(i).setStockDdDocLineNo(stockDDDocLineNo);
                list.get(i).setItemStatCd(investigationVO.getDocStatCd()); //상태코드 : REDY준비, RGST등록, CANC 취소, REQ 승인요청, END 완료
                //list.get(i).setDdQty(null);
                //list.get(i).setBookQty(null);

                /*********************************************
                 * 4. 재고실사 생성 전 Validation 체크한다.
                 *********************************************/

                if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                /*********************************************
                 * 5.  재고실사 품목 정보를 등록한다.
                 *********************************************/
                resultCnt = investigationDAO.insertInvestigationItem(list.get(i));

                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
                    stockInOutVO.setRegUsrId(LoginUtil.getUserId());
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutVO.setItemCd(list.get(i).getItemCd());
                    stockInOutVO.setStockLockYn(investigationVO.getStockLockYn());

                    /*********************************************
                     * 6.  재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
                     *********************************************/
                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);

                    if(resultCnt < 1){
                         //재고실사등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }
                }

                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }

                stockDDDocLineNo = stockDDDocLineNo + 1;
            }

            return investigationVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationSaveCnfm(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public InvestigationVO updateInvestigationSaveCnfm(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {
        try{
            /*********************************************
             *  1. 재고실사 번호를 생성 및 세션정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());

            /*********************************************
             * 2. 재고실사 생성 전 Validation 체크한다.
             *********************************************/

            // 저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);

            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("REDY")){
                throw processException("par.info.checkStatus");
            }

            if( (investigationVO.getStockDdDocNo() == null) || (investigationVO.getStockDdDocNo().isEmpty())){
                //실사문서정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3.  재고실사정보(헤더)를 생성한다.
             *********************************************/
            investigationDAO.updateInvestigationRegCnfm(investigationVO);

            /*********************************************
             * 5.  재고실사 품목 정보 상태를 수정한다.
             *********************************************/
            investigationVO.setItemStatCd(investigationVO.getDocStatCd());
            // 실사품목정보 상태 수정
            investigationDAO.updateInvestigationAllItemStat(investigationVO);

            /*********************************************
             * 6.  재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
             *********************************************/
            if(investigationVO.getDocStatCd().equals("RGST")){
                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    investigationVO.setDlrCd(LoginUtil.getDlrCd());
                    investigationVO.setRegUsrId(LoginUtil.getUserId());
                    investigationVO.setPltCd(LoginUtil.getPltCd());
                    investigationVO.setStockLockYn("Y");

                    // 재고통제여부확인
                    int stockLockCnt = investigationDAO.selectStockLockItemList(investigationVO);
                    if(stockLockCnt > 0){
                        throw processException("par.err.stockLockMsgParam");
                    }

                    investigationDAO.updateStockInOutByStockLockYn(investigationVO);
                }
            }
            return investigationVO;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#multiInvestigationRegs(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int multiInvestigationRegs(BaseSaveVO<InvestigationItemVO> obj, InvestigationVO investigationVO)
            throws Exception {

        try{
            int    resultCnt             = 0;
            int    investigationLineNo   = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            investigationVO.setDlrCd(dlrCd);
            investigationVO.setRegUsrId(userId);
            investigationLineNo = investigationDAO.selectInvestigationMaxLineNo(investigationVO);

            //저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);

            for(InvestigationItemVO itemVO : obj.getInsertList()){

                if( (itemVO.getDlrCd() == null) || (itemVO.getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (itemVO.getItemCd() == null) || (itemVO.getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                itemVO.setStockDdDocNo(investigationVO.getStockDdDocNo());
                itemVO.setStockDdDocLineNo(investigationLineNo);
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setItemStatCd("REDY");
                itemVO.setDdQty(null);
                itemVO.setBookQty(null);

                resultCnt = investigationDAO.insertInvestigationItem(itemVO);

                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

                investigationLineNo = investigationLineNo + 1;
            }

            for(InvestigationItemVO itemVO : obj.getDeleteList()){
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);

                resultCnt = investigationDAO.deleteInvestigationItem(itemVO);


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});

                }
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationApplyrReq(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int updateInvestigationApplyReq(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {
        try{
            int resultCnt       = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            // 저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);

            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("RGST")){
                throw processException("par.info.applyReqStatMsg");
            }

            if(investigationVO.getStockDdDocNo() == null || investigationVO.getStockDdDocNo().isEmpty()){
                //재고실사정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
            }

            investigationVO.setDocStatCd("REQ");
            investigationVO.setRegUsrId(userId);
            investigationVO.setDlrCd(dlrCd);

            resultCnt = investigationDAO.updateInvestigationApplyReq(investigationVO);

            investigationVO.setItemStatCd("REQ");
            // 실사품목정보 상태 수정
            investigationDAO.updateInvestigationAllItemStat(investigationVO);

            if(resultCnt < 1){
                //승인요청실패
                throw processException(" global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.approvalReq", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationHeaderByKey(chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int updateInvestigationHeaderByKey(InvestigationVO investigationVO) throws Exception {

        //저장전 수정내역이있는지 Validation 체크
        chkInvestigationUpdateSomebody(investigationVO);

        return investigationDAO.updateInvestigationApplyReq(investigationVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#multiInvestigations(java.util.List)
     */
    @Override
    public void multiInvestigations(BaseSaveVO<InvestigationItemVO> obj, InvestigationVO investigationVO) throws Exception {
        try{
            int    resultCnt       = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            StockInOutVO stockInOutVO       = new StockInOutVO(); //재고통제 수정을 위해 사용

            //저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);


            for(InvestigationItemVO itemVO : obj.getUpdateList()){

                if(itemVO.getDdQty() < 0){
                    //수량이 0보다 작을 수 없습니다
                    throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.ddQty", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getStockDdDocNo() == null || itemVO.getStockDdDocNo().isEmpty()){
                    //재고실사정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getStockDdDocLineNo() < 1){
                    //재고실사정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
                }

                if(dlrCd == null || dlrCd.isEmpty() ){
                    //딜러정보가 존재하지 않습니다.
                   throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getItemStatCd() == null || itemVO.getItemStatCd().isEmpty()){
                    //품목상태정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
                }



                itemVO.setDlrCd(dlrCd);
                itemVO.setRegUsrId(userId);

                resultCnt = investigationDAO.updateInvestigationItem(itemVO);


                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(InvestigationItemVO itemVO : obj.getDeleteList()){
                stockInOutVO       = new StockInOutVO();

                if(itemVO.getStockDdDocNo() == null || itemVO.getStockDdDocNo().isEmpty()){
                    //재고실사정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getStockDdDocLineNo() < 1){
                    //재고실사정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
                }

                if(dlrCd == null || dlrCd.isEmpty() ){
                    //딜러정보가 존재하지 않습니다.
                   throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getItemStatCd() == null || itemVO.getItemStatCd().isEmpty()){
                    //품목상태정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
                }



                itemVO.setDlrCd(dlrCd);
                itemVO.setRegUsrId(userId);
                itemVO.setItemStatCd("DEL");

                resultCnt = investigationDAO.updateInvestigationItem(itemVO);


                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }

                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    stockInOutVO.setDlrCd(dlrCd);
                    stockInOutVO.setRegUsrId(userId);
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(itemVO.getStrgeCd());
                    stockInOutVO.setItemCd(itemVO.getItemCd());
                    stockInOutVO.setStockLockYn("N");

                    /*********************************************
                     * 재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
                     *********************************************/
                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);

                    if(resultCnt < 1){
                         //부품 수정 실패
                        throw processException("global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                    }
                }


            }

            investigationDAO.updateInvestigationApplyReq(investigationVO);

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#deleteInvestigation(chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int deleteInvestigation(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {
        try{
            int    resultCnt       = 0;
            //StockInOutVO stockInOutVO       = new StockInOutVO(); //재고통제 수정을 위해 사용

            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("RGST")){
                throw processException("global.err.cnclFailed");
            }

            //저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);

            // 1. 재고실사 헤더 정보를 수정한다.(헤더만! 수정한다.)
            investigationVO.setDocStatCd("CANC"); //취소상태로 변경한다.

            if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                // 페이징 처리로 인한 단건처리 불가로 한번에 update하도록 수정
                /*for(int i = 0; i < list.size(); i++){
                    stockInOutVO       = new StockInOutVO();
                    stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
                    stockInOutVO.setRegUsrId(LoginUtil.getUserId());
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutVO.setItemCd(list.get(i).getItemCd());
                    stockInOutVO.setStockLockYn("N");

                    *//*********************************************
                     * 재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
                     *********************************************//*
                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);

                    if(resultCnt < 1){
                         //재고실사취소 처리되지 않았습니다.
                        throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }
                }*/

                investigationVO.setDlrCd(LoginUtil.getDlrCd());
                investigationVO.setRegUsrId(LoginUtil.getUserId());
                investigationVO.setPltCd(LoginUtil.getPltCd());
                investigationVO.setStockLockYn("N");

                resultCnt = investigationDAO.updateStockInOutByStockLockYn(investigationVO);
            }

            resultCnt = investigationDAO.updateInvestigationStat(investigationVO);

            if(resultCnt < 1){
                //실사 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationByKey(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<InvestigationItemVO> selectInvestigationByKey(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationByKeyCnt(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationByKeyCnt(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationListByCondition(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<InvestigationVO> selectInvestigationListByCondition(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationListByConditionCnt(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationListByConditionCnt(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationListByKey(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public InvestigationVO selectInvestigationListByKey(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationListByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationInfoByKey(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public InvestigationVO selectInvestigationInfoByKey(InvestigationSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsRegUsrId(LoginUtil.getUserId());

        return investigationDAO.selectInvestigationInfoByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationApplyCnfm(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int updateInvestigationApplyCnfm(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {
        try{
            int resultCnt = 0;
            int selectCnt = 0;
            //StockInOutVO stockInOutVO       = new StockInOutVO(); //재고통제 수정을 위해 사용

            InvestigationSearchVO searchVO = new InvestigationSearchVO();

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsStockDdDocNo(investigationVO.getStockDdDocNo());

            /*********************************************
             *  1. 재고실사 세션정보 및 상태 정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setApprovePrsnId(LoginUtil.getUserId());

            // 저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);

            selectCnt = investigationDAO.selectInvestigationForEndCnt(searchVO);

            if(selectCnt > 0){
                investigationVO.setDocStatCd("END");
            }else{
                investigationVO.setDocStatCd("ENDA");
            }

            /*********************************************
             * 2. 재고실사 승인 전 Validation 체크한다.
             *********************************************/
            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("REQ")){
                throw processException("par.info.applyStatMsgParam");
            }

            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                 //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                 //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3.  재고실사정보(헤더)를 수정한다.
             *********************************************/
            resultCnt = investigationDAO.updateInvestigationApplyCnfm(investigationVO);
            if(resultCnt < 1){
                //재고실사등록이 처리되지 않았습니다.
               throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 5.  재고실사 품목 정보 상태를 수정한다.
             *********************************************/
            investigationVO.setItemStatCd("REL");
            // 실사품목정보 상태 수정
            investigationDAO.updateInvestigationAllItemStat(investigationVO);

            /*********************************************
             * 6.  재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우)
             *********************************************/
            if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                investigationVO.setDlrCd(LoginUtil.getDlrCd());
                investigationVO.setRegUsrId(LoginUtil.getUserId());
                investigationVO.setPltCd(LoginUtil.getPltCd());
                investigationVO.setStockLockYn("N");

                investigationDAO.updateStockInOutByStockLockYn(investigationVO);
            }

            return resultCnt;

       }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationApplyCnfm(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    public int updateInvestigationApplyCnfm_20170413(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {

        try{

            int     resultCnt        = 0;
            int     selectCnt        = 0;
            StockInOutVO stockInOutVO       = new StockInOutVO(); //재고통제 수정을 위해 사용

            InvestigationSearchVO searchVO = new InvestigationSearchVO();

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsStockDdDocNo(investigationVO.getStockDdDocNo());

            /*********************************************
             *  1. 재고실사 세션정보 및 상태 정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());

            selectCnt = investigationDAO.selectInvestigationForEndCnt(searchVO);

            if(selectCnt > 0){
                investigationVO.setDocStatCd("END");
            }else{
                investigationVO.setDocStatCd("ENDA");
            }

            /*********************************************
             * 2. 재고실사 승인 전 Validation 체크한다.
             *********************************************/
            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                 //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                 //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            /*if( (investigationVO.getStrgeCd() == null) || (investigationVO.getStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }*/

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            int listLen = list.size();

            for(int i = 0; i < listLen; i = i + 1){
                list.get(i).setRegUsrId(LoginUtil.getUserId());



                stockInOutVO       = new StockInOutVO();
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setItemStatCd("REL");


                if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                   throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                     //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
                    stockInOutVO.setRegUsrId(LoginUtil.getUserId());
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutVO.setItemCd(list.get(i).getItemCd());
                    stockInOutVO.setStockLockYn("N");

                    /*********************************************
                     * 6.  재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우 'N'으로 다시 수정)
                     *********************************************/
                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);

                    if(resultCnt < 1){
                         //재고실사등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }


                }

                resultCnt = investigationDAO.updateInvestigationItemStat(list.get(i));

                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }

            }

            /*********************************************
             * 재고조정 시 재고조정품목 테이블에 수불 정보 업데이트 종료
             *********************************************/

            resultCnt = investigationDAO.updateInvestigationApplyCnfm(investigationVO);

            if(resultCnt < 1){
                //재고실사등록이 처리되지 않았습니다.
               throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
           }

            return resultCnt;

       }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationApplyCnfm(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    public int updateInvestigationApplyCnfm_ORG(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {

        try{

            int     resultCnt        = 0;
            StockInOutVO stockInOutVO       = new StockInOutVO(); //재고통제 수정을 위해 사용

            //수불 생성(재고실사차출고)
            MvtDocVO mvtDocVO                  = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO          = new MvtDocItemVO();
            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            InvestigationItemVO investigationItemVO = new InvestigationItemVO();

            //수불 생성(재고실사차출고취소)
            MvtDocVO mvtDocVOByCncl                  = new MvtDocVO();
            List<MvtDocItemVO> mvtItemListByCncl     = new ArrayList<MvtDocItemVO>();



            mvtDocVO.setMvtTp("43");       //재고실사차출고
            mvtDocVOByCncl.setMvtTp("49"); //재고실사차입고

            /*********************************************
             *  1. 재고실사 세션정보 및 상태 정보를 세팅한다.
             *********************************************/
            investigationVO.setDlrCd(LoginUtil.getDlrCd());
            investigationVO.setPltCd(LoginUtil.getPltCd());
            investigationVO.setRegUsrId(LoginUtil.getUserId());
            investigationVO.setDocStatCd("END");

            /*********************************************
             * 2. 재고실사 승인 전 Validation 체크한다.
             *********************************************/

            //저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);


            if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
                //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getStrgeCd() == null) || (investigationVO.getStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }

            if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
                //재고통제정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
            }

            int listLen = list.size();

            for(int i = 0; i < listLen; i = i + 1){
                list.get(i).setRegUsrId(LoginUtil.getUserId());


                mvtDocItemVO = new MvtDocItemVO();

                stockInOutVO       = new StockInOutVO();
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setItemStatCd("REL");


                if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                if( investigationVO.getStockLockYn() != null && investigationVO.getStockLockYn().equals("Y")){
                    stockInOutVO.setDlrCd(LoginUtil.getDlrCd());
                    stockInOutVO.setRegUsrId(LoginUtil.getUserId());
                    stockInOutVO.setPltCd(LoginUtil.getPltCd());
                    stockInOutVO.setStrgeCd(list.get(i).getStrgeCd());
                    stockInOutVO.setItemCd(list.get(i).getItemCd());
                    stockInOutVO.setStockLockYn("N");

                    /*********************************************
                     * 6.  재고 통제여부 정보를 수정한다.(통제여부가 Y인 경우 'N'으로 다시 수정)
                     *********************************************/
                    resultCnt = stockInOutDAO.updateStockInOutByStockLockInfo(stockInOutVO);

                    if(resultCnt < 1){
                        //재고실사등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }


                }

                if(list.get(i).getDiffQty() == 0){
                    investigationDAO.updateInvestigationItemMvtInfo(list.get(i));
                }else{

                    mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                    mvtDocItemVO.setRegUsrId(LoginUtil.getUserId());
                    mvtDocItemVO.setPltCd(LoginUtil.getPltCd());
                    mvtDocItemVO.setCancStmtYn("N");
                    mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                    mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                    mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                    mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                    mvtDocItemVO.setRefDocNo(list.get(i).getStockDdDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getStockDdDocLineNo());
                    mvtDocItemVO.setDdlnYn("N");
                    mvtDocItemVO.setCurrCd("");
                    mvtDocItemVO.setMvtReasonCont(list.get(i).getReasonCont());

                    if(list.get(i).getDiffQty() < 0){
                        mvtDocItemVO.setItemQty(list.get(i).getDiffQty() * -1);
                        mvtItemList.add(mvtDocItemVO);
                    }else{
                        mvtDocItemVO.setItemQty(list.get(i).getDiffQty());
                        mvtItemListByCncl.add(mvtDocItemVO);
                    }
                }

            }

            if(mvtItemList.size() > 0){
                mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);
            }

            if(mvtItemListByCncl.size() > 0){
                mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVOByCncl, mvtItemListByCncl);
            }

            /*********************************************
             * 재고조정 시 재고조정품목 테이블에 수불 정보 업데이트
             *********************************************/
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                investigationItemVO = new InvestigationItemVO();

                investigationItemVO.setDlrCd(LoginUtil.getDlrCd());
                investigationItemVO.setStockDdDocNo(mvtSaveItemList.get(i).getRefDocNo());
                investigationItemVO.setStockDdDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                investigationItemVO.setStockAdjMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                investigationItemVO.setStockAdjMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                investigationItemVO.setStockAdjMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                investigationItemVO.setItemStatCd("REL");

                resultCnt = investigationDAO.updateInvestigationItemMvtInfo(investigationItemVO);

                if(resultCnt < 1){
                    //재고실사등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                }

            }
            /*********************************************
             * 재고조정 시 재고조정품목 테이블에 수불 정보 업데이트 종료
             *********************************************/

            resultCnt = investigationDAO.updateInvestigationApplyCnfm(investigationVO);

            if(resultCnt < 1){
                //재고실사등록이 처리되지 않았습니다.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#createInvestigationOverageReserve(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int createInvestigationOverageReserve(List<InvestigationItemVO> list, InvestigationVO investigationVO)
            throws Exception {

            try{

                int     resultCnt            = 0;

                //수불 생성(재고실사차출고)
                MvtDocItemVO mvtDocItemVO          = new MvtDocItemVO();
                List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

                InvestigationItemVO investigationItemVO = new InvestigationItemVO();

                //수불 생성(재고실사차출고취소)
                MvtDocVO mvtDocVOByCncl                  = new MvtDocVO();
                List<MvtDocItemVO> mvtItemListByCncl     = new ArrayList<MvtDocItemVO>();


                mvtDocVOByCncl.setMvtTp("49"); //재고실사차입고

                int listLen = list.size();

                for(int i = 0; i < listLen; i = i + 1){
                    list.get(i).setRegUsrId(LoginUtil.getUserId());


                    mvtDocItemVO = new MvtDocItemVO();

                    list.get(i).setRegUsrId(LoginUtil.getUserId());
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());
                    list.get(i).setItemStatCd("REL");


                    if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                        //딜러정보가 존재하지 않습니다.
                       throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                         //품목정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                    }

                    mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                    mvtDocItemVO.setRegUsrId(LoginUtil.getUserId());
                    mvtDocItemVO.setPltCd(LoginUtil.getPltCd());
                    mvtDocItemVO.setCancStmtYn("N");
                    mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                    mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                    mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                    mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                    mvtDocItemVO.setRefDocNo(list.get(i).getStockDdDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getStockDdDocLineNo());
                    mvtDocItemVO.setDdlnYn("N");
                    mvtDocItemVO.setCurrCd("");
                    mvtDocItemVO.setMvtReasonCont(list.get(i).getReasonCont());


                    mvtDocItemVO.setItemQty(list.get(i).getDiffQty());
                    mvtItemListByCncl.add(mvtDocItemVO);


                }

                if(mvtItemListByCncl.size() > 0){
                    mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVOByCncl, mvtItemListByCncl);
                }

                /*********************************************
                 * 재고조정 시 재고조정품목 테이블에 수불 정보 업데이트
                 *********************************************/
                for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                    investigationItemVO = new InvestigationItemVO();

                    investigationItemVO.setDlrCd(LoginUtil.getDlrCd());
                    investigationItemVO.setStockDdDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    investigationItemVO.setStockDdDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                    investigationItemVO.setStockAdjMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                    investigationItemVO.setStockAdjMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                    investigationItemVO.setStockAdjMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                    investigationItemVO.setItemStatCd("REL");

                    resultCnt = investigationDAO.updateInvestigationItemMvtInfo(investigationItemVO);

                    if(resultCnt < 1){
                        //재고실사등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }

                }

                return resultCnt;

           }catch(Exception e){
                throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#createInvestigationShortageIssue(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int createInvestigationShortageIssue(List<InvestigationItemVO> list, InvestigationVO investigationVO)
            throws Exception {

            try{

                int     resultCnt        = 0;

                //수불 생성(재고실사차출고)
                MvtDocVO mvtDocVO                  = new MvtDocVO();
                MvtDocItemVO mvtDocItemVO          = new MvtDocItemVO();
                List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
                List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

                //[이동평균가격]부품이동평균가격정보
                //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
                //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

                //int    itemMovingAvgPrcSeq  = 0;


                InvestigationItemVO investigationItemVO = new InvestigationItemVO();


                mvtDocVO.setMvtTp("43");       //재고실사차출고

                int listLen = list.size();

                for(int i = 0; i < listLen; i = i + 1){
                    list.get(i).setRegUsrId(LoginUtil.getUserId());


                    mvtDocItemVO = new MvtDocItemVO();

                    list.get(i).setRegUsrId(LoginUtil.getUserId());
                    list.get(i).setDlrCd(LoginUtil.getDlrCd());
                    list.get(i).setItemStatCd("REL");


                    if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                        //딜러정보가 존재하지 않습니다.
                       throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                         //품목정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
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
                    searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

                    itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                    //이동평균가격 정보가 존재하는 경우
                    if(itemMovingAvgPrcVO != null){


                        itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                        itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                        itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                        itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                        itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(list.get(i).getDiffQty() * -1));
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

                    mvtDocItemVO.setDlrCd(LoginUtil.getDlrCd());
                    mvtDocItemVO.setRegUsrId(LoginUtil.getUserId());
                    mvtDocItemVO.setPltCd(LoginUtil.getPltCd());
                    mvtDocItemVO.setCancStmtYn("N");
                    mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                    mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                    mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                    mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                    mvtDocItemVO.setRefDocNo(list.get(i).getStockDdDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getStockDdDocLineNo());
                    mvtDocItemVO.setDdlnYn("N");
                    mvtDocItemVO.setCurrCd("");
                    mvtDocItemVO.setMvtReasonCont(list.get(i).getReasonCont());

                    mvtDocItemVO.setItemQty(list.get(i).getDiffQty() * -1);
                    mvtItemList.add(mvtDocItemVO);

                }

                if(mvtItemList.size() > 0){
                    mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);
                }


                /*********************************************
                 * 재고조정 시 재고조정품목 테이블에 수불 정보 업데이트
                 *********************************************/
                for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                    investigationItemVO = new InvestigationItemVO();

                    investigationItemVO.setDlrCd(LoginUtil.getDlrCd());
                    investigationItemVO.setStockDdDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    investigationItemVO.setStockDdDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                    investigationItemVO.setStockAdjMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                    investigationItemVO.setStockAdjMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                    investigationItemVO.setStockAdjMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                    investigationItemVO.setItemStatCd("REL");

                    resultCnt = investigationDAO.updateInvestigationItemMvtInfo(investigationItemVO);

                    if(resultCnt < 1){
                        //재고실사등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }

                }
                /*********************************************
                 * 재고조정 시 재고조정품목 테이블에 수불 정보 업데이트 종료
                 *********************************************/

                return resultCnt;

           }catch(Exception e){
                throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationByReject(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public int updateInvestigationByReject(List<InvestigationItemVO> list, InvestigationVO investigationVO) throws Exception {
        try{
            int resultCnt = 0;

            //저장전 수정내역이있는지 Validation 체크
            chkInvestigationUpdateSomebody(investigationVO);

            String docStatus = investigationDAO.selectInvestigationStatusByKey(investigationVO);
            if(!docStatus.equals("REQ")){
                throw processException("global.err.failedParam", new String[]{messageSource.getMessage("par.btn.appRollback", null, LocaleContextHolder.getLocale())});
            }

            // 1. 재고실사 헤더 정보를 수정한다.
            investigationVO.setDocStatCd("RGST"); //등록상태로 변경한다.
            resultCnt = investigationDAO.updateInvestigationReject(investigationVO);
            if(resultCnt < 1){
                //반려 실패.
                throw processException("global.err.rejectFailedParam", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 5.  재고실사 품목 정보 상태를 수정한다.
             *********************************************/
            investigationVO.setItemStatCd("RGST");
            // 실사품목정보 상태 수정
            investigationDAO.updateInvestigationAllItemStat(investigationVO);

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#updateInvestigationByReject(java.util.List, chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    public int updateInvestigationByReject_20170413(List<InvestigationItemVO> list, InvestigationVO investigationVO)
            throws Exception {

        try{
            int resultCnt = 0;

            // 1. 재고실사 헤더 정보를 수정한다.(헤더만! 수정한다.)
            investigationVO.setDocStatCd("RGST"); //등록상태로 변경한다.

            for(InvestigationItemVO investigationItemVO : list){

                investigationItemVO.setItemStatCd("RJCT");//재고부품문서상태 : 반려
                //재고실사 반려일때 실사수량/장부수량 초기화 처리.
                investigationItemVO.setDdQty(null);
                investigationItemVO.setBookQty(null);

                resultCnt = investigationDAO.updateInvestigationItem(investigationItemVO);

                if(resultCnt < 1){
                    //반려 실패.
                    throw processException("global.err.rejectFailedParam", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
                }
            }

            resultCnt = investigationDAO.updateInvestigationReject(investigationVO);

            if(resultCnt < 1){
                //반려 실패.
                throw processException("global.err.rejectFailedParam", new String[]{messageSource.getMessage("par.lbl.stockDdDoc", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextStockDDDocNo()
     */
    @Override
    public String selectNextStockDDDocNo() throws Exception {
        try {
            return stockDDDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.stockDdDocNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationListGridByCondition(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<InvestigationVO> selectInvestigationListGridByCondition(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationListGridByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationListGridByConditionCnt(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationListGridByConditionCnt(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationListGridByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationListDetailGridByCondition(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationListDetailGridByConditionCnt(InvestigationSearchVO searchVO)throws Exception {

        return investigationDAO.selectInvestigationListDetailGridByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationListDetailGridByCondition(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<InvestigationItemVO> selectInvestigationListDetailGridByCondition(InvestigationSearchVO searchVO)throws Exception {

        return investigationDAO.selectInvestigationListDetailGridByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationForIssueByKey(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectInvestigationForIssueByKey(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationForIssueByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationForIssueByKeyCnt(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationForIssueByKeyCnt(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationForIssueByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationForReserveByKey(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectInvestigationForReserveByKey(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationForReserveByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationForReserveByKeyCnt(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationForReserveByKeyCnt(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationForReserveByKeyCnt(searchVO);
    }

    public void chkInvestigationUpdateSomebody(InvestigationVO investigationVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = investigationDAO.selectInvestigationUpdtDtByKey(investigationVO);

            if(!updtDtStrNow.equals(investigationVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#fnChkInvestigationUpdateSomebody(chn.bhmc.dms.par.stm.vo.InvestigationVO)
     */
    @Override
    public boolean fnChkInvestigationUpdateSomebody(InvestigationVO investigationVO) throws Exception {
        chkInvestigationUpdateSomebody(investigationVO);
        return true;
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationStrgeByKey(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<InvestigationItemVO> selectInvestigationStrgeByKey(InvestigationSearchVO searchVO) throws Exception {
        return investigationDAO.selectInvestigationStrgeByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationStrgeByKey(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationStrgeByKeyCnt(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationStrgeByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationItemByStrge(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public List<InvestigationItemVO> selectInvestigationItemByStrge(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationItemByStrge(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.InvestigationService#selectInvestigationItemByStrge(chn.bhmc.dms.par.stm.vo.InvestigationSearchVO)
     */
    @Override
    public int selectInvestigationItemByStrgeCnt(InvestigationSearchVO searchVO) throws Exception {

        return investigationDAO.selectInvestigationItemByStrgeCnt(searchVO);
    }

    /**
     * @author liuxueying
     * 全库盘点
     */
	@Override
	public String createInvestigationForStrage(
			InvestigationVO investigationVO) throws Exception {
		String nos = ""; //生成单据号 ","拼接的字符串
		int resultCnt = 0;
		int batCnt = 1000;//单据明细最大量  
		investigationVO.setDlrCd(LoginUtil.getDlrCd());
        investigationVO.setPltCd(LoginUtil.getPltCd());
        investigationVO.setRegUsrId(LoginUtil.getUserId());
        investigationVO.setUpdtUsrId(LoginUtil.getUserId());
        //---------------验证------------
        if( (investigationVO.getDlrCd() == null) || (investigationVO.getDlrCd().isEmpty())){
            //딜러정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
        }

        if( (investigationVO.getPltCd() == null) || (investigationVO.getPltCd().isEmpty())){
            //센터정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
        }

        if( (investigationVO.getStockLockYn() == null) || (investigationVO.getStockLockYn().isEmpty())){
            //재고통제정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.stockLockYn", null, LocaleContextHolder.getLocale())});
        }

        if( (investigationVO.getPrsnId() == null) || (investigationVO.getPrsnId().isEmpty())){
            //실사 담당자정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.investigationPrsId", null, LocaleContextHolder.getLocale())});
        }
        
        StockInOutSearchVO stockInOutSearchVO = new StockInOutSearchVO();
        stockInOutSearchVO.setsStrgeCd(investigationVO.getStrgeCd());
        stockInOutSearchVO.setsDlrCd(investigationVO.getDlrCd());
        int totalItems = stockInOutDAO.selectInvestigationTargetItemsByConditionCnt(stockInOutSearchVO);
    	//根据仓库查询全库配件
		List<StockInOutVO> stockList = stockInOutDAO.selectInvestigationTargetItemsByCondition(stockInOutSearchVO);
		
        if(totalItems >0){
            int createNum = totalItems/batCnt + (totalItems%batCnt > 0? 1 : 0);//需生成单据数量
            for(int i = 1;i <= createNum;i++){
            	//--------------生成盘点单主数据----------------
        		InvestigationVO vo = new InvestigationVO();
        		vo.setStockDdDocNo(selectNextStockDDDocNo());
        		vo.setDlrCd(LoginUtil.getDlrCd());
        		vo.setPltCd(LoginUtil.getPltCd());
        		vo.setRegUsrId(LoginUtil.getUserId());
        		vo.setUpdtUsrId(LoginUtil.getUserId());
        		vo.setDocStatCd("RGST");
        		vo.setPrsnId(investigationVO.getPrsnId());
        		vo.setPrsnNm(investigationVO.getPrsnNm());
        		vo.setRemark(investigationVO.getRemark());
        		vo.setStockLockYn(investigationVO.getStockLockYn());
        		vo.setStrgeCd(investigationVO.getStrgeCd());
        		vo.setRegDt(investigationVO.getRegDt());
        		vo.setStockIvstPlanDt(new Date());
            	resultCnt = investigationDAO.insertInvestigationHeader(vo);
            	nos += (i == 1 ? "": ",") + vo.getStockDdDocNo();
            	//根据仓库查询全库配件
        		for(int j = (i-1)*batCnt ;j < ((totalItems < batCnt || i == createNum) ? totalItems : i * batCnt); j++){
        			StockInOutVO stockInOutVO = stockList.get(j);
        			InvestigationItemVO investigationItemVO = new InvestigationItemVO();
        			investigationItemVO.setRegUsrId(LoginUtil.getUserId());
        			investigationItemVO.setDlrCd(LoginUtil.getDlrCd());
        			investigationItemVO.setStockDdDocNo(vo.getStockDdDocNo());
        			investigationItemVO.setItemStatCd("RGST"); //상태코드 : REDY준비, RGST등록, CANC 취소, REQ 승인요청, END 완료
        			investigationItemVO.setItemCd(stockInOutVO.getItemCd());
        			investigationItemVO.setStrgeCd(stockInOutVO.getStrgeCd());
        			investigationItemVO.setLocCd(stockInOutVO.getLocCd());
        			investigationItemVO.setBookQty(stockInOutVO.getAvlbStockQty());
        			investigationItemVO.setDdQty(stockInOutVO.getAvlbStockQty());
        			investigationItemVO.setUnitCd(stockInOutVO.getUnitCd());
                    if(StringUtils.isEmpty(investigationItemVO.getDlrCd())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if(StringUtils.isEmpty(investigationItemVO.getItemCd())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                    }
                    resultCnt = investigationDAO.insertInvestigationItemNew(investigationItemVO);
                    if(resultCnt < 1){
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }
        		}
            }
        }else{
        	 throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("ser.title.itemInfo", null, LocaleContextHolder.getLocale())});
        }
		return nos;
	}
	
    /**
     * 验证导入数据
     */
	@Override
	public InvestigationItemVO checkImportData(InvestigationSearchVO searchVO)
			throws Exception {
		List<InvestigationItemVO> vos = investigationDAO.checkImportData(searchVO);
		return (vos != null && vos.size() > 0) ? vos.get(0) : null;
	}

	/**
	 * excel批量更新盘点数量
	 */
	@Override
	public void updateBathByExcel(InvestigationItemVO itemVO) {
			investigationDAO.updateBathByExcel(itemVO);
	}
    
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		String sStockDdDocNo = params.get("sStockDdDocNo").toString();
		
		InvestigationSearchVO searchVO = new InvestigationSearchVO();
		searchVO.setsDlrCd(LoginUtil.getDlrCd());
		searchVO.setsStockDdDocNo(sStockDdDocNo);
		
		ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
		List<InvestigationItemVO> list = investigationDAO.checkImportData(searchVO);
		context.putVar("items", list);
		
	}
}
