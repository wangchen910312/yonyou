package chn.bhmc.dms.par.pcm.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;

import chn.bhmc.dms.par.pcm.vo.ReceiveEtcInitProcedureVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.ism.service.IssueEtcService;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcVO;
import chn.bhmc.dms.par.pcm.service.ReceiveEtcService;
import chn.bhmc.dms.par.pcm.service.dao.ReceiveEtcDAO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemTrdVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.dao.ItemMasterDAO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.InvestigationService;
import chn.bhmc.dms.par.stm.service.dao.InvestigationDAO;
import chn.bhmc.dms.par.stm.vo.InvestigationItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 기타입고 구현 클래스
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
@Service("receiveEtcService")
public class ReceiveEtcServiceImpl extends HService implements ReceiveEtcService, JxlsSupport {

    @Resource(name="receiveEtcDAO")
    private ReceiveEtcDAO receiveEtcDAO;

    @Resource(name="etcGrDocNoIdgenService")
    EgovIdGnrService etcGrDocNoIdgenService;

    @Resource(name="investigationDAO")
    private InvestigationDAO investigationDAO;

    /**
     * 품목마스터 관리 DAO
     */
    @Resource(name="itemMasterDAO")
    ItemMasterDAO itemMasterDAO;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 기타출고 관리 서비스
     */
    @Resource(name="issueEtcService")
    IssueEtcService issueEtcService;

    /**
     * 재고실사 관리 서비스
     */
    @Resource(name="investigationService")
    InvestigationService investigationService;

    /**
     * 세율 서비스
     */
    @Resource(name="vatInfoService")
    VatInfoService vatInfoService;

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createOrd(java.util.List, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     * 17.03.01 다른 기타입고는 저장, 확정으로 바뀌었지만 실사손익입고는 해당 메소드 사용(즉시 확정)
     */
    @Override
    public ReceiveEtcVO createReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    receiveEtcLineNo     = 1;
           // double amt                = 0;
            int    resultCnt            = 0;
            int     selectCnt           = 0;
            double qty                  = 0;
            String stockDdDocNo         = "";
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            InvestigationItemVO investigationItemVO = new InvestigationItemVO();

            //수불 생성(기타입고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            mvtDocVO.setMvtTp(receiveEtcVO.getMvtTp());

            if(!(receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59"))){//재고 조정에 의한 기타출고
                mvtDocVO.setBpCd(receiveEtcVO.getBpCd());
            }else{

                if(receiveEtcVO.getMvtTp().equals("49")){//실사손익입고에 의한 기타출고
                    //chkReceiveEtcUpdateSomebody(receiveEtcVO);
                    InvestigationVO investigationVO = new InvestigationVO();

                    investigationVO.setDlrCd(dlrCd);
                    investigationVO.setStockDdDocNo(receiveEtcVO.getRefDocNo());
                    investigationVO.setUpdtDtStr(receiveEtcVO.getUpdtDtStr());

                    investigationService.fnChkInvestigationUpdateSomebody(investigationVO);
                }

                receiveEtcVO.setBpCd(dlrCd);
                mvtDocVO.setBpCd(dlrCd);
            }

            //차출반환입고 등록인 경우 참조번호(차출출고번호)의 수정여부를 체크한다.
            if(receiveEtcVO.getMvtTp().equals("36")){
                IssueEtcVO chkIssueEtcVO = new IssueEtcVO();

                chkIssueEtcVO.setDlrCd(dlrCd);
                chkIssueEtcVO.setEtcGiDocNo(receiveEtcVO.getRefDocNo());
                chkIssueEtcVO.setUpdtDtStr(receiveEtcVO.getUpdtDtStr());
                issueEtcService.fnChkIssueEtcUpdateSomebody(chkIssueEtcVO);

                issueEtcService.updateIssueEtcUpdtDt(chkIssueEtcVO);

                receiveEtcVO.setUpdtDtStr(issueEtcService.selectIssueEtcUpdtDtByKey(chkIssueEtcVO));
            }


            // 1. 기타입고 번호를 생성한다.
            String receiveEtcNo =  selectNextEtcGrDocNo();
            receiveEtcVO.setEtcGrDocNo(receiveEtcNo);

            // 2. 기타입고 상태를 설정한다.
            receiveEtcVO.setStatCd("01"); //"01" 등록상태.

            // 3. 기타입고 헤더를 생성한다.
            receiveEtcVO.setDlrCd(dlrCd);
            receiveEtcVO.setPltCd(pltCd);
            receiveEtcVO.setRegUsrId(userId);
            resultCnt = receiveEtcDAO.insertReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            // 4. 기타입고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                qty = list.get(i).getQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(receiveEtcVO.getMvtTp().equals("49")){
                    if(list.get(i).getPrc() < 0){
                        //재고실사입고 일때만 0원 입고 가능하도록 한다. (2018.04.03, 기초재고입고로 0원 입고가 가능하므로, 재고실사도 0원 입고, 출고 모두 가능.)
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                }else{
                    if(list.get(i).getPrc() <= 0){
                        //재고실사입고 일때만 0원 입고 가능하도록 한다. (2018.04.03, 기초재고입고로 0원 입고가 가능하므로, 재고실사도 0원 입고, 출고 모두 가능.)
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                }

                //임시 손익입고시 사유적어줌
                if(receiveEtcVO.getMvtTp().equals("49")){
                    list.get(i).setGrReasonCd("Investigation..");
                }

                //if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59")){
                if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")){
                    if( (list.get(i).getGrReasonCd() == null) || (list.get(i).getGrReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                //amt = qty * list.get(i).getPrc();

                list.get(i).setEtcGrDocNo(receiveEtcNo);
                list.get(i).setEtcGrDocLineNo(receiveEtcLineNo);
                list.get(i).setCancYn("N");
                //list.get(i).setAmt(amt);
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setBpCd(receiveEtcVO.getBpCd());
                list.get(i).setGrStatCd("02");

                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(qty);
                mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGrReasonCd());

                if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고
                    if(list.get(i).getDcRate() == null){
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                    }else if(list.get(i).getDcRate() >= 1){
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate()/100);
                    }else{
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                    }
                    mvtDocItemVO.setPurcPrc(list.get(i).getPrc());
                    mvtDocItemVO.setPurcAmt(list.get(i).getAmt());
                    mvtDocItemVO.setRefDocNo(list.get(i).getRefDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getRefDocLineNo());

                }else{//그외

                    if(list.get(i).getDcRate() == null){
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                    }else if(list.get(i).getDcRate() >= 1){
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate()/100);
                    }else{
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                    }
                    mvtDocItemVO.setPurcPrc(list.get(i).getPrc());
                    mvtDocItemVO.setPurcAmt(list.get(i).getAmt());
                    mvtDocItemVO.setRefDocNo(list.get(i).getEtcGrDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getEtcGrDocLineNo());

                }
                mvtItemList.add(mvtDocItemVO);

                resultCnt = receiveEtcDAO.insertReceiveEtcItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                //일반, 차출, 차용 제외(기타출고인터페이스용 조달도 인터페이스 안하기로함. 사용안함.)
                /*
                if(!receiveEtcVO.getMvtTp().equals("01")&&!receiveEtcVO.getMvtTp().equals("35")&&!receiveEtcVO.getMvtTp().equals("36")&&!receiveEtcVO.getMvtTp().equals("49")&&!receiveEtcVO.getMvtTp().equals("59")&&!receiveEtcVO.getMvtTp().equals("63")){
                    resultCnt = receiveEtcDAO.updateReceiveEtcItemInfc(list.get(i));
                    if(resultCnt < 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                    }
                }
                */


                receiveEtcLineNo = receiveEtcLineNo + 1;
            }

            receiveEtcVO.setStatCd("02");
            resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //기타입고부품의 입고 확정이 처리되지 않았습니다.
               throw processException("par.err.failedEtcIssueMsg");
            }

            //생성된 수불 정보를 기타입고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){

                receiveEtcItemVO = new ReceiveEtcItemVO();

                receiveEtcItemVO.setDlrCd(dlrCd);
                receiveEtcItemVO.setRegUsrId(userId);
                receiveEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                receiveEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                receiveEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고

                    receiveEtcItemVO.setEtcGrDocNo(receiveEtcNo);
                    receiveEtcItemVO.setEtcGrDocLineNo(i + 1);

                }else{
                    receiveEtcItemVO.setEtcGrDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    receiveEtcItemVO.setEtcGrDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());
                }

                resultCnt = receiveEtcDAO.updateReceiveEtcItemMvtInfo(receiveEtcItemVO);
                if(resultCnt < 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }

                if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고
                    investigationItemVO = new InvestigationItemVO();

                    investigationItemVO.setDlrCd(LoginUtil.getDlrCd());
                    investigationItemVO.setStockDdDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    investigationItemVO.setStockDdDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                    investigationItemVO.setStockAdjMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                    investigationItemVO.setStockAdjMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                    investigationItemVO.setStockAdjMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                    investigationItemVO.setItemStatCd("REL");

                    resultCnt = investigationDAO.updateInvestigationItemMvtInfo(investigationItemVO);

                    if(i < 1){
                        stockDdDocNo = mvtSaveItemList.get(i).getRefDocNo();
                    }
                    if(resultCnt < 1){
                        //재고실사등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }
                }
            }


            if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고
            //실사 손익 처리할 정보가 더이상 없는 경우 실사문서 헤더 정보를 'ENDA'(완료)로 변경한다.
                InvestigationSearchVO searchVO  = new InvestigationSearchVO();
                InvestigationVO investigationVO = new InvestigationVO();

                searchVO.setsDlrCd(LoginUtil.getDlrCd());
                searchVO.setsStockDdDocNo(stockDdDocNo);

                selectCnt = investigationDAO.selectInvestigationForEndCnt(searchVO);

                if(selectCnt == 0){
                    investigationVO.setDocStatCd("ENDA");
                    investigationVO.setRegUsrId(LoginUtil.getUserId());
                    investigationVO.setDlrCd(LoginUtil.getDlrCd());
                    investigationVO.setStockDdDocNo(stockDdDocNo);

                    resultCnt = investigationDAO.updateInvestigationApplyCnfm(investigationVO);

                    if(resultCnt < 1){
                        //재고실사등록이 처리되지 않았습니다.
                       throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }
                }else{
                    investigationVO.setRegUsrId(LoginUtil.getUserId());
                    investigationVO.setDlrCd(LoginUtil.getDlrCd());
                    investigationVO.setStockDdDocNo(stockDdDocNo);

                    resultCnt = investigationDAO.updateInvestigationUpdtDt(investigationVO);
                    if(resultCnt < 1){
                        //재고실사등록이 처리되지 않았습니다.
                       throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.btn.createPhysInvDoc", null, LocaleContextHolder.getLocale())});
                    }
                }
            }

            return receiveEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createOrd(java.util.List, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO createReceiveEtcReg(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    receiveEtcLineNo     = 1;
           // double amt                = 0;
            int    resultCnt          = 0;
            double qty                = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            if(!(receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59"))){//재고 조정에 의한 기타출고

            }else{
                receiveEtcVO.setBpCd(dlrCd);
            }


            // 1. 기타입고 번호를 생성한다.
            String receiveEtcNo =  selectNextEtcGrDocNo();
            receiveEtcVO.setEtcGrDocNo(receiveEtcNo);

            // 2. 기타입고 상태를 설정한다.
            receiveEtcVO.setStatCd("01"); //"01" 등록상태.

            // 3. 기타입고 헤더를 생성한다.
            receiveEtcVO.setDlrCd(dlrCd);
            receiveEtcVO.setPltCd(pltCd);
            receiveEtcVO.setRegUsrId(userId);
            resultCnt = receiveEtcDAO.insertReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            // 4. 기타입고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                qty = list.get(i).getQty();

                //수불유형 31이 아닐때만 수량,금액 0 유효성 체크 실행.때
                if(!"31".equals(receiveEtcVO.getMvtTp())){
                    /*if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }*/

                    if(list.get(i).getPrc() <= 0){
                        //단가가 0보다 작거나 같을 수 없습니다.
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                }

                if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")){
                    if( (list.get(i).getGrReasonCd() == null) || (list.get(i).getGrReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                //amt = qty * list.get(i).getPrc();

                list.get(i).setEtcGrDocNo(receiveEtcNo);
                list.get(i).setEtcGrDocLineNo(receiveEtcLineNo);
                list.get(i).setCancYn("N");
                //list.get(i).setAmt(amt);
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setBpCd(receiveEtcVO.getBpCd());
                list.get(i).setGrStatCd("01");

                resultCnt = receiveEtcDAO.insertReceiveEtcItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                //일반, 차출, 차용 제외(기타출고인터페이스용 조달도 인터페이스 안하기로함. 사용안함.)
                /*
                if(!receiveEtcVO.getMvtTp().equals("01")&&!receiveEtcVO.getMvtTp().equals("35")&&!receiveEtcVO.getMvtTp().equals("36")&&!receiveEtcVO.getMvtTp().equals("49")&&!receiveEtcVO.getMvtTp().equals("59")&&!receiveEtcVO.getMvtTp().equals("63")){
                    resultCnt = receiveEtcDAO.updateReceiveEtcItemInfc(list.get(i));
                    if(resultCnt < 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                    }
                }
                */


                receiveEtcLineNo = receiveEtcLineNo + 1;
            }

            return receiveEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createReceiveEtcCnfm(java.util.List, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO createReceiveEtcCnfm(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
           // double amt                = 0;
            int    resultCnt          = 0;
            double qty                = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            chkReceiveEtcUpdateSomebody(receiveEtcVO);

            InvestigationItemVO investigationItemVO = new InvestigationItemVO();

            //수불 생성(기타입고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            mvtDocVO.setMvtTp(receiveEtcVO.getMvtTp());

            if(!(receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59"))){//재고 조정에 의한 기타출고
                mvtDocVO.setBpCd(receiveEtcVO.getBpCd());
            }else{
                mvtDocVO.setBpCd(dlrCd);
            }

            // 4. 기타입고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                qty = list.get(i).getQty();

                /*if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }*/

                if(list.get(i).getPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                //if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59")){
                if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")){
                    if( (list.get(i).getGrReasonCd() == null) || (list.get(i).getGrReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(qty);
                mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGrReasonCd());

                if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고
                    mvtDocItemVO.setRefDocNo(list.get(i).getRefDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getRefDocLineNo());

                }else{//그외

                    if(list.get(i).getDcRate() == null){
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                    }else if(list.get(i).getDcRate() >= 1){
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate()/100);
                    }else{
                        mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                    }
                    mvtDocItemVO.setPurcPrc(list.get(i).getPrc());
                    mvtDocItemVO.setPurcAmt(list.get(i).getAmt());
                    mvtDocItemVO.setRefDocNo(list.get(i).getEtcGrDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getEtcGrDocLineNo());

                }

                list.get(i).setGrStatCd("02");
                list.get(i).setRegUsrId(userId);
                list.get(i).setDlrCd(dlrCd);
                resultCnt = receiveEtcDAO.updateCnfmReceiveEtcItem(list.get(i));

                if(resultCnt < 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }


                mvtItemList.add(mvtDocItemVO);

                //일반, 차출, 차용 제외(기타출고인터페이스용 조달도 인터페이스 안하기로함. 사용안함.)
                /*
                if(!receiveEtcVO.getMvtTp().equals("01")&&!receiveEtcVO.getMvtTp().equals("35")&&!receiveEtcVO.getMvtTp().equals("36")&&!receiveEtcVO.getMvtTp().equals("49")&&!receiveEtcVO.getMvtTp().equals("59")&&!receiveEtcVO.getMvtTp().equals("63")){
                    resultCnt = receiveEtcDAO.updateReceiveEtcItemInfc(list.get(i));
                    if(resultCnt < 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                    }
                }
                */

            }

            receiveEtcVO.setStatCd("02");
            resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //기타입고부품의 입고 확정이 처리되지 않았습니다.
               throw processException("par.err.failedEtcIssueMsg");
            }

            //생성된 수불 정보를 기타입고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){

                receiveEtcItemVO = new ReceiveEtcItemVO();

                receiveEtcItemVO.setDlrCd(dlrCd);
                receiveEtcItemVO.setRegUsrId(userId);
                receiveEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                receiveEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                receiveEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고

                    receiveEtcItemVO.setEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());
                    receiveEtcItemVO.setEtcGrDocLineNo(i + 1);

                }else{
                    receiveEtcItemVO.setEtcGrDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    receiveEtcItemVO.setEtcGrDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());
                }

                resultCnt = receiveEtcDAO.updateReceiveEtcItemMvtInfo(receiveEtcItemVO);
                if(resultCnt < 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }

                if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고
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
            }


            return receiveEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createReceiveEtcCnfmNonUpdate(java.util.List, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO createReceiveEtcCnfmNonUpdate(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO)
            throws Exception {
        try{

             int resultCnt = 0;
             double qty = 0;
             String userId = LoginUtil.getUserId();
             String dlrCd  = LoginUtil.getDlrCd();

             InvestigationItemVO investigationItemVO = new InvestigationItemVO();

             //수불 생성(기타입고)
             MvtDocVO mvtDocVO = new MvtDocVO();
             MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

             ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();

             List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
             List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

             mvtDocVO.setMvtTp(receiveEtcVO.getMvtTp());

             if(!(receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59"))){//재고 조정에 의한 기타출고
                 mvtDocVO.setBpCd(receiveEtcVO.getBpCd());
             }else{
                 mvtDocVO.setBpCd(dlrCd);
             }

             // 4. 기타입고 부품정보를 생성한다.
             for(int i = 0; i < list.size(); i++){
                 mvtDocItemVO = new MvtDocItemVO();

                 qty = list.get(i).getQty();

                 if( qty <= 0 ){
                     //수량이 0보다 작거나 같을 수 없습니다
                     throw processException("global.err.chkZeroQty");
                 }

                 if(list.get(i).getPrc() <= 0){
                     //단가가 0보다 작거나 같을 수 없습니다.
                     throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                 }

                 //if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59")){
                 if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")){
                     if( (list.get(i).getGrReasonCd() == null) || (list.get(i).getGrReasonCd().isEmpty())){
                         throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grReasonCd", null, LocaleContextHolder.getLocale())});
                     }
                 }

                 mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                 mvtDocItemVO.setCancStmtYn("N");
                 mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                 mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                 mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                 mvtDocItemVO.setItemQty(qty);
                 mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                 mvtDocItemVO.setDdlnYn("N");
                 mvtDocItemVO.setCurrCd("");
                 mvtDocItemVO.setMvtReasonCont(list.get(i).getGrReasonCd());

                 if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고
                     mvtDocItemVO.setRefDocNo(list.get(i).getRefDocNo());
                     mvtDocItemVO.setRefDocLineNo(list.get(i).getRefDocLineNo());

                 }else{//그외

                     if(list.get(i).getDcRate() == null){
                         mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                     }else if(list.get(i).getDcRate() >= 1){
                         mvtDocItemVO.setTaxRate(list.get(i).getDcRate()/100);
                     }else{
                         mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                     }
                     mvtDocItemVO.setPurcPrc(list.get(i).getPrc());
                     mvtDocItemVO.setPurcAmt(list.get(i).getAmt());
                     mvtDocItemVO.setRefDocNo(list.get(i).getEtcGrDocNo());
                     mvtDocItemVO.setRefDocLineNo(list.get(i).getEtcGrDocLineNo());

                 }

                 list.get(i).setGrStatCd("02");
                 list.get(i).setRegUsrId(userId);
                 list.get(i).setDlrCd(dlrCd);
                 resultCnt = receiveEtcDAO.updateCnfmReceiveEtcItem(list.get(i));

                 if(resultCnt < 1){
                     //기타입고 확정 실패.
                     throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                 }


                 mvtItemList.add(mvtDocItemVO);

                 //일반, 차출, 차용 제외(기타출고인터페이스용 조달도 인터페이스 안하기로함. 사용안함.)
                 /*
                 if(!receiveEtcVO.getMvtTp().equals("01")&&!receiveEtcVO.getMvtTp().equals("35")&&!receiveEtcVO.getMvtTp().equals("36")&&!receiveEtcVO.getMvtTp().equals("49")&&!receiveEtcVO.getMvtTp().equals("59")&&!receiveEtcVO.getMvtTp().equals("63")){
                     resultCnt = receiveEtcDAO.updateReceiveEtcItemInfc(list.get(i));
                     if(resultCnt < 1){
                         //기타입고 확정 실패.
                         throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                     }
                 }
                 */

             }

             receiveEtcVO.setStatCd("02");
             resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

             if(resultCnt < 1){
                 //기타입고 확정 실패.
                 throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
             }

             mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

             if(mvtSaveItemList.size() < 1){
                 //기타입고부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedEtcIssueMsg");
             }

             //생성된 수불 정보를 기타입고 부품정보에 반영한다.
             for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){

                 receiveEtcItemVO = new ReceiveEtcItemVO();

                 receiveEtcItemVO.setDlrCd(dlrCd);
                 receiveEtcItemVO.setRegUsrId(userId);
                 receiveEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                 receiveEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                 receiveEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                 if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고

                     receiveEtcItemVO.setEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());
                     receiveEtcItemVO.setEtcGrDocLineNo(i + 1);

                 }else{
                     receiveEtcItemVO.setEtcGrDocNo(mvtSaveItemList.get(i).getRefDocNo());
                     receiveEtcItemVO.setEtcGrDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());
                 }

                 resultCnt = receiveEtcDAO.updateReceiveEtcItemMvtInfo(receiveEtcItemVO);
                 if(resultCnt < 1){
                     //기타입고 확정 실패.
                     throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                 }

                 if(receiveEtcVO.getMvtTp().equals("49")){//재고 조정에 의한 기타출고
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
             }


             return receiveEtcVO;

         }catch(Exception e){
             throw new BizException(e.getMessage());
         }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiReceiveEtcs(BaseSaveVO<ReceiveEtcItemVO> obj, ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    resultCnt        = 0;
            double qty              = 0;
            int    receiveEtcLineNo   = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            chkReceiveEtcUpdateSomebody(receiveEtcVO);

            receiveEtcLineNo = receiveEtcDAO.selectReceiveEtcMaxLineNo(receiveEtcVO);

            for(ReceiveEtcItemVO itemVO : obj.getInsertList()){

                //if(receiveEtcVO.getMvtTp().equals("41")||receiveEtcVO.getMvtTp().equals("47")){
                //    qty = itemVO.getQty();
                //if(receiveEtcVO.getMvtTp().equals("48")){
                //    qty = itemVO.getProcQty();
                //}else{
                    qty = itemVO.getQty();
                //}

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                //if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59")){
                if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")){
                    if( (itemVO.getGrReasonCd() == null) || (itemVO.getGrReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                if(itemVO.getPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }


                itemVO.setEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());
                itemVO.setEtcGrDocLineNo(receiveEtcLineNo);
                itemVO.setCancYn("N");
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setBpCd(receiveEtcVO.getBpCd());
                itemVO.setGrStatCd("01");

                resultCnt = receiveEtcDAO.insertReceiveEtcItem(itemVO);

                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

                receiveEtcLineNo = receiveEtcLineNo + 1;
            }

            for(ReceiveEtcItemVO itemVO : obj.getUpdateList()){

                //if(receiveEtcVO.getMvtTp().equals("41")||receiveEtcVO.getMvtTp().equals("47")){
                    qty = itemVO.getQty();
                //}else if(receiveEtcVO.getMvtTp().equals("48")){
                //    qty = itemVO.getProcQty();
                //}

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                //if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")||receiveEtcVO.getMvtTp().equals("59")){
                if(receiveEtcVO.getMvtTp().equals("33")||receiveEtcVO.getMvtTp().equals("49")){
                    if( (itemVO.getGrReasonCd() == null) || (itemVO.getGrReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                if(itemVO.getPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }


                //amt = qty * itemVO.getPrc();

                itemVO.setDlrCd(dlrCd);
                itemVO.setUpdtUsrId(userId);

                resultCnt = receiveEtcDAO.updateReceiveEtcItem(itemVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(ReceiveEtcItemVO itemVO : obj.getDeleteList()){
                itemVO.setUpdtUsrId(userId);
                itemVO.setDlrCd(dlrCd);

                resultCnt = receiveEtcDAO.deleteRegReceiveEtcItem(itemVO);


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});

                }
            }

            resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
              //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void regCancReceiveEtcs(ReceiveEtcVO regReceiveEtcVO) throws Exception {
        try{
            ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
            ReceiveEtcSearchVO searchReceiveEtcVO = new ReceiveEtcSearchVO();
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            int resultCnt = 0;

            //chkReceiveEtcUpdateSomebody(regReceiveEtcVO);

            searchReceiveEtcVO.setsDlrCd(dlrCd);
            searchReceiveEtcVO.setsEtcGrDocNo(regReceiveEtcVO.getEtcGrDocNo());
            //1. 문서로 621t를 찾는다.
            receiveEtcVO = receiveEtcDAO.selectReceiveEtcByKey(searchReceiveEtcVO);

            //2. 헤더상태가 등록상태인 경우 취소를 진행한다.
            if(receiveEtcVO.getStatCd().equals("01")){
                //3. 디테일 취소를 한다.
                ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();
                receiveEtcItemVO.setDlrCd(dlrCd);
                receiveEtcItemVO.setRegUsrId(userId);
                receiveEtcItemVO.setGrStatCd("03");
                receiveEtcItemVO.setEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());
                resultCnt = receiveEtcDAO.updateReceiveCancelEtcKey(receiveEtcItemVO);

                if(resultCnt < 1){
                    //디테일 취소 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }

                //4. 헤더 취소를 한다.
                receiveEtcVO.setStatCd(regReceiveEtcVO.getStatCd());
                resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

                if(resultCnt < 1){
                    //헤더 취소 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    @Override
    public int updateReceiveEtc(ReceiveEtcVO receiveEtcVO) throws Exception {
        try{
            int    resultCnt       = 0;

            chkReceiveEtcUpdateSomebody(receiveEtcVO);

            resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#updateReceiveEtcUpdtDt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int updateReceiveEtcUpdtDt(ReceiveEtcVO receiveEtcVO) throws Exception {

        return receiveEtcDAO.updateReceiveEtcUpdtDt(receiveEtcVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#insertReceiveEtcItem(chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO)
     */
    @Override
    public int insertReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO) throws Exception {

        return receiveEtcDAO.insertReceiveEtcItem(receiveEtcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#updateReceiveEtcItem(chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO)
     */
    @Override
    public int updateReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO) throws Exception {

        return receiveEtcDAO.updateReceiveEtcItem(receiveEtcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#deleteRegReceiveEtcItem(chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO)
     */
    @Override
    public int deleteRegReceiveEtcItem(ReceiveEtcItemVO receiveEtcItemVO) throws Exception {

        return receiveEtcDAO.deleteRegReceiveEtcItem(receiveEtcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#updateReceiveEtc(java.util.List, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    /*
    @Override
    public int updateReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;
            double amt         = 0;
            double totAmt      = 0;


            // 1. 기타입고 부품정보를 수정한다.
            for(int i = 0; i < list.size(); i++){

                if(list.get(i).getQty() <= 0){
                    throw new Exception("수량이 0보다 작거나 같을 수 없습니다.");
                }

                if(list.get(i).getPrc() <= 0){
                    throw new Exception("구매단가가 0보다 작거나 같을 수 없습니다.");
                }

                amt = list.get(i).getQty() * list.get(i).getPrc();

                list.get(i).setAmt(amt);

                resultCnt = receiveEtcDAO.updateReceiveEtcItem(list.get(i));

                if(resultCnt < 1){
                    throw new Exception("부품 수정 실패.[" + list.get(i).getItemCd() + "]");
                }
                totAmt = totAmt + amt;
            }

            // 2. 기타입고 헤더 정보를 수정한다.
            receiveEtcVO.setTotAmt(totAmt);

            resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                throw new Exception("헤더 수정 실패.");
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
    */



    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#deleteReceiveEtc(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int cancelReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;
            double qty             = 0;


            receiveEtcVO.setStatCd("03"); //취소상태로 수정
            receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
            receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
            receiveEtcVO.setPltCd(LoginUtil.getPltCd());
            //resultCnt = cancelReceiveEtcHeader(receiveEtcVO);
            chkReceiveEtcUpdateSomebody(receiveEtcVO);

         // 수불 생성(기타출고 취소)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            mvtDocVO.setMvtTp(receiveEtcVO.getMvtTp());
            mvtDocVO.setBpCd(receiveEtcVO.getBpCd());

         // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                qty = list.get(i).getQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(i == 0){
                    mvtDocVO.setMvtDocYyMm(list.get(i).getMvtDocYyMm());
                    mvtDocVO.setMvtDocNo(list.get(i).getMvtDocNo());
                }

                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setGrStatCd("03");
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                resultCnt = receiveEtcDAO.deleteReceiveEtcItem(list.get(i));


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{list.get(i).getItemCd()});

                }

                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(receiveEtcVO.getPltCd());
                mvtDocItemVO.setCancStmtYn("Y");
                mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(qty);
                mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGrReasonCd());
                if(list.get(i).getDcRate() == null){
                    mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                }else if(list.get(i).getDcRate() >= 1){
                    mvtDocItemVO.setTaxRate(list.get(i).getDcRate()/100);
                }else{
                    mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                }
                mvtDocItemVO.setPurcPrc(list.get(i).getPrc());
                mvtDocItemVO.setPurcAmt(list.get(i).getAmt());
                mvtDocItemVO.setRefDocNo(list.get(i).getMvtDocNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getMvtDocLineNo());
                mvtDocItemVO.setGrDocNo(list.get(i).getEtcGrDocNo());
                mvtDocItemVO.setGrDocLineNo(list.get(i).getEtcGrDocLineNo());

                mvtItemList.add(mvtDocItemVO);

            }

            resultCnt = receiveEtcDAO.cancelReceiveEtc(receiveEtcVO);


            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiCnclMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //기타입고부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedEtcIssueMsg");
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#deleteReceiveEtc(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int cancelRegReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;

            receiveEtcVO.setStatCd("03"); //취소상태로 수정
            //resultCnt = cancelReceiveEtcHeader(receiveEtcVO);
            chkReceiveEtcUpdateSomebody(receiveEtcVO);


            // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setGrStatCd("03");
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                resultCnt = receiveEtcDAO.deleteReceiveEtcItem(list.get(i));

                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{list.get(i).getItemCd()});

                }

            }

            resultCnt = receiveEtcDAO.cancelReceiveEtc(receiveEtcVO);


            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#deleteReceiveEtc(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    /*
    public int cancelReceiveEtcHeader(ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;

            // 1. 기타입고 헤더 정보를 수정한다.(헤더만! 수정한다.)
            receiveEtcVO.setReceiveEtcStatCd("05"); //취소상태로 변경한다.

            //공급업체가 BMP인경우
            if(receiveEtcVO.getBpTp().equals("01")){  //전송상태는 취소가 불가능합니다.

                if(!receiveEtcVO.getReceiveEtcStatCd().equals("01") ){  //등록상태 이외에는 취소가 불가능합니다.
                    //취소 할 수 없습니다
                    throw processException("global.err.cnclFailed");
                }
            }



            resultCnt = receiveEtcDAO.cancelReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
    */

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#multiConfirmReceiveEtc(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public void multiConfirmReceiveEtc(BaseSaveVO<ReceiveEtcItemVO> receiveEtcSaveVO, ReceiveEtcVO receiveEtcVO) throws Exception {


        multiReceiveEtcs(receiveEtcSaveVO, receiveEtcVO);

        confirmReceiveEtc(receiveEtcVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#confirmReceiveEtc(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int confirmReceiveEtc(ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;

            chkReceiveEtcUpdateSomebody(receiveEtcVO);

            if(! receiveEtcVO.getStatCd().equals("01") ){  //등록상태 이외에는 확정 불가능합니다.
                //취소 할 수 없습니다
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }


            // 1. 기타입고 헤더 정보를 수정한다.(헤더만! 수정한다.)
            receiveEtcVO.setStatCd("02"); //취소상태로 변경한다.

            resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#returnInvcReceiveEtc(java.util.List, chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO returnInvcReceiveEtc(List<ReceiveEtcItemVO> list, ReceiveEtcVO receiveEtcVO) throws Exception {


        try{
            int    receiveEtcLineNo = 1;
            int    resultCnt          = 0;

            String pltCd  = LoginUtil.getPltCd();
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            Double lineAmt            = 0.0;
            ReceiveEtcVO returnReceiveEtcVO         = new ReceiveEtcVO();

            ReceiveEtcVO chkReceiveEtcVO            = new ReceiveEtcVO();

            // 수불 생성(판매출고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            ReceiveEtcItemVO mvtReceiveEtcItemVO = new ReceiveEtcItemVO();

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

            // 1. 구매기타반품 번호를 생성한다.
            String receiveEtcNo =  selectNextEtcGrDocNo();
            returnReceiveEtcVO.setEtcGrDocNo(receiveEtcNo);

            // 2. 기타구매입고부품 반품 상태를 설정한다.
            returnReceiveEtcVO.setStatCd("02"); //"02" 확정상태.
            returnReceiveEtcVO.setMvtTp("03"); //"03" 구매입고반품.
            returnReceiveEtcVO.setDlrCd(dlrCd);
            returnReceiveEtcVO.setRegUsrId(userId);
            returnReceiveEtcVO.setBpCd(receiveEtcVO.getBpCd());
            returnReceiveEtcVO.setBpNm(receiveEtcVO.getBpNm());
            returnReceiveEtcVO.setRemark(receiveEtcVO.getRemark());
            returnReceiveEtcVO.setEtcGrDocTp(receiveEtcVO.getEtcGrDocTp());
            returnReceiveEtcVO.setPltCd(pltCd);

            mvtDocVO.setMvtTp("03");  //구매입고반품
            mvtDocVO.setBpCd(receiveEtcVO.getBpCd());

            // 4. 부품판매 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();
              //  movingAvgPrc = 0;
              //  stockAmt = 0;

                chkReceiveEtcVO = new ReceiveEtcVO();

                chkReceiveEtcVO.setDlrCd(dlrCd);
                chkReceiveEtcVO.setEtcGrDocNo(list.get(i).getRefDocNo());
                chkReceiveEtcVO.setUpdtDtStr(list.get(i).getUpdtDtStr());

                chkReceiveEtcUpdateSomebody(chkReceiveEtcVO);

                list.get(i).setRegUsrId(userId);
                list.get(i).setDlrCd(dlrCd);
                list.get(i).setRefDocNo(list.get(i).getRefDocNo());
                list.get(i).setRefDocLineNo(list.get(i).getRefDocLineNo());
                list.get(i).setEtcGrDocNo(receiveEtcNo);
                list.get(i).setEtcGrDocLineNo(receiveEtcLineNo);
                list.get(i).setCancYn("N");

                lineAmt    = (list.get(i).getPrc() * list.get(i).getReturnQty());
                list.get(i).setAmt(lineAmt);

                if(list.get(i).getDcRate() == null){
                    list.get(i).setDcRate(vatInfoVO.getVatApplyRate());
                    list.get(i).setTaxAmt(lineAmt - (lineAmt/(1 + vatInfoVO.getVatApplyRate())));
                    list.get(i).setTaxDdctAmt(lineAmt/(1 + vatInfoVO.getVatApplyRate()));
                }else if(list.get(i).getDcRate() >= 1){
                    list.get(i).setDcRate(list.get(i).getDcRate()/100);

                    list.get(i).setTaxDdctAmt((list.get(i).getPrc() * list.get(i).getReturnQty())/(1 + list.get(i).getDcRate()));
                    list.get(i).setTaxAmt(lineAmt - list.get(i).getTaxDdctAmt());
                }else{
                    list.get(i).setTaxDdctAmt((list.get(i).getPrc() * list.get(i).getReturnQty())/(1 + list.get(i).getDcRate()));
                    list.get(i).setTaxAmt(lineAmt - list.get(i).getTaxDdctAmt());
                }

                list.get(i).setQty(list.get(i).getReturnQty());
                list.get(i).setGrStatCd("02");


                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/
                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(pltCd);
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(list.get(i).getReturnQty());
                mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                if(list.get(i).getDcRate() == null){
                    mvtDocItemVO.setTaxRate(vatInfoVO.getVatApplyRate());
                }else if(list.get(i).getDcRate() >= 1){
                    mvtDocItemVO.setTaxRate(list.get(i).getDcRate()/100);
                }else{
                    mvtDocItemVO.setTaxRate(list.get(i).getDcRate());
                }
                mvtDocItemVO.setPurcPrc(list.get(i).getPrc());
                mvtDocItemVO.setPurcAmt(list.get(i).getAmt());
                mvtDocItemVO.setRefDocNo(list.get(i).getEtcGrDocNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getEtcGrDocLineNo());
                mvtDocItemVO.setMvtReasonCont("Return Invoice Receive Item(Etc.)");
                mvtDocItemVO.setGrDocNo(list.get(i).getRefDocNo());
                mvtDocItemVO.setGrDocLineNo(list.get(i).getRefDocLineNo());

                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/

                mvtItemList.add(mvtDocItemVO);

                if(list.get(i).getReturnQty() == null || list.get(i).getReturnQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //부품정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
                }

                resultCnt = receiveEtcDAO.insertReceiveEtcItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                receiveEtcLineNo = receiveEtcLineNo + 1;
            }



            //  3. 기타구매입고반품 헤더를 생성한다.
            resultCnt = receiveEtcDAO.insertReceiveEtc(returnReceiveEtcVO);

            if(resultCnt < 1){
                //부품판매 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //출고 확정이 처리되지 않았습니다.
               throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            //생성된 수불 정보를 기타출고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                mvtReceiveEtcItemVO = new ReceiveEtcItemVO();

                mvtReceiveEtcItemVO.setDlrCd(dlrCd);
                mvtReceiveEtcItemVO.setRegUsrId(userId);
                mvtReceiveEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                mvtReceiveEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                mvtReceiveEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                //toolGiVO.getToolGiTp()

                mvtReceiveEtcItemVO.setEtcGrDocNo(mvtSaveItemList.get(i).getRefDocNo());
                mvtReceiveEtcItemVO.setEtcGrDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                resultCnt = receiveEtcDAO.updateReceiveEtcItemMvtInfo(mvtReceiveEtcItemVO);

                if(resultCnt < 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }

            }

            return returnReceiveEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public ReceiveEtcVO selectReceiveEtcByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcByKey(receiveEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveReturnEtcByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public ReceiveEtcVO selectReceiveReturnEtcByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception {

        return receiveEtcDAO.selectReceiveReturnEtcByKey(receiveEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectBorrowItemByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectBorrowItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception {

        return receiveEtcDAO.selectBorrowItemByKey(receiveEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcItemByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveEtcItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcItemByKey(receiveEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnItemByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO)
            throws Exception {

        return receiveEtcDAO.selectReceiveEtcReturnItemByKey(receiveEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnDocItemByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnDocItemByKey(ReceiveEtcSearchVO receiveEtcSearchVO)
            throws Exception {
        // TODO Auto-generated method stub
        return receiveEtcDAO.selectReceiveEtcReturnDocItemByKey(receiveEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcItemExcelUploadByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO)
     */
    @Override
    public ReceiveEtcItemVO selectReceiveEtcItemExcelUploadByKey(ReceiveEtcItemVO receiveEtcItemVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcItemExcelUploadByKey(receiveEtcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectItemInfoByReceiveEtcerInfo(chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO)
     */
    @Override
    public ReceiveEtcItemVO selectItemInfoByReceiveEtcerInfo(ReceiveEtcItemVO receiveEtcItemVO) throws Exception {

        return receiveEtcDAO.selectItemInfoByReceiveEtcerInfo(receiveEtcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcesByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcVO> selectReceiveEtcsByCondition(ReceiveEtcSearchVO searchVO) throws Exception {
        return receiveEtcDAO.selectReceiveEtcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcsByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {
        return receiveEtcDAO.selectReceiveEtcsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcForReturnsByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcVO> selectReceiveEtcForReturnsByCondition(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcForReturnsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcForReturnsByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcForReturnsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcForReturnsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectNextEtcGrDocNo()
     */
    @Override
    public String selectNextEtcGrDocNo() throws Exception {
        try {
            return etcGrDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcesByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectInvcItemsByCondition(ReceiveEtcSearchVO searchVO) throws Exception {
        return receiveEtcDAO.selectInvcItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcsByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectInvcItemsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {
        return receiveEtcDAO.selectInvcItemsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcRentalPop(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveEtcPop(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcPop(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcRentalPopCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcPopCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcPopCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcDetailListByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveEtcDetailListByCondition(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcDetailListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcDetailListByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcDetailListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcDetailListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcListByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcVO> selectReceiveEtcListByCondition(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnsByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveEtcReturnsByCondition(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcReturnsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnsByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcReturnsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcReturnsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnSummaryListByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcVO> selectReceiveEtcReturnSummaryListByCondition(ReceiveEtcSearchVO searchVO)
            throws Exception {

        return receiveEtcDAO.selectReceiveEtcReturnSummaryListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnSummaryListByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcReturnSummaryListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcReturnSummaryListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnsByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectPurcReceiveReturnsByCondition(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectPurcReceiveReturnsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnsByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectPurcReceiveReturnsByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectPurcReceiveReturnsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnSummaryListByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcVO> selectPurcReceiveReturnSummaryListByCondition(ReceiveEtcSearchVO searchVO)
    throws Exception {

        return receiveEtcDAO.selectPurcReceiveReturnSummaryListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnSummaryListByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectPurcReceiveReturnSummaryListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectPurcReceiveReturnSummaryListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcListByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcBorrowDetailListByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveEtcBorrowDetailListByCondition(ReceiveEtcSearchVO searchVO)
            throws Exception {

        return receiveEtcDAO.selectReceiveEtcBorrowDetailListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcBorrowDetailListByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveEtcBorrowDetailListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcBorrowDetailListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcReturnAvailableChk(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public String selectReceiveEtcReturnAvailableChk(ReceiveEtcVO receiveEtcVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcReturnAvailableChk(receiveEtcVO);
    }

    public void chkReceiveEtcUpdateSomebody(ReceiveEtcVO receiveEtcVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = receiveEtcDAO.selectReceiveEtcUpdtDtByKey(receiveEtcVO);

            if(!updtDtStrNow.equals(receiveEtcVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#fnChkReceiveEtcUpdateSomebody(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public boolean fnChkReceiveEtcUpdateSomebody(ReceiveEtcVO receiveEtcVO) throws Exception {

        chkReceiveEtcUpdateSomebody(receiveEtcVO);

        return true;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveEtcUpdtDtByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public String selectReceiveEtcUpdtDtByKey(ReceiveEtcVO receiveEtcVO) throws Exception {

        return receiveEtcDAO.selectReceiveEtcUpdtDtByKey(receiveEtcVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createReceiveInitByDataReg(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO createReceiveInitByDataReg(ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    receiveEtcLineNo     = 1;
           // double amt                = 0;
            int    resultCnt          = 0;
            double qty                = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            List<ReceiveEtcItemVO> insertReceiveInitList = new ArrayList<ReceiveEtcItemVO>();

            int receiveInitCnt = 0;

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


            ReceiveEtcSearchVO receiveEtcSearchVO = new ReceiveEtcSearchVO();
            receiveEtcSearchVO.setsDlrCd(dlrCd);

            receiveInitCnt = receiveEtcDAO.selectReceiveInitListCnt(receiveEtcSearchVO);

            if(receiveInitCnt > 0){
                // 1. 기타입고 번호를 생성한다.
                String receiveEtcNo =  selectNextEtcGrDocNo();
                receiveEtcVO.setEtcGrDocNo(receiveEtcNo);

                // 2. 기타입고 상태를 설정한다.
                receiveEtcVO.setStatCd("01"); //"01" 등록상태.

                receiveEtcVO.setMvtTp("31");

                receiveEtcVO.setRemark("-INIT-");

                // 3. 기타입고 헤더를 생성한다.
                resultCnt = receiveEtcDAO.insertReceiveEtc(receiveEtcVO);

                if(resultCnt < 1){
                    //기타입고 생성 실패.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }

                insertReceiveInitList =  receiveEtcDAO.selectReceiveInitList(receiveEtcSearchVO);

                // 4. 기타입고 부품정보를 생성한다.
                for(int i = 0; i < insertReceiveInitList.size(); i++){

                    qty = insertReceiveInitList.get(i).getQty();

                    /*
                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }
                    */

                    /*
                    if(insertReceiveInitList.get(i).getPrc() <= 0){
                        //단가가 0보다 작거나 같을 수 없습니다.
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                    */

                    insertReceiveInitList.get(i).setEtcGrDocNo(receiveEtcNo);
                    insertReceiveInitList.get(i).setEtcGrDocLineNo(receiveEtcLineNo);
                    insertReceiveInitList.get(i).setCancYn("N");
                    //list.get(i).setAmt(amt);
                    insertReceiveInitList.get(i).setRegUsrId(userId);
                    insertReceiveInitList.get(i).setDlrCd(dlrCd);
                    insertReceiveInitList.get(i).setBpCd(receiveEtcVO.getBpCd());
                    insertReceiveInitList.get(i).setGrStatCd("01");
                    insertReceiveInitList.get(i).setAmt(insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty());
                    insertReceiveInitList.get(i).setTaxDdctPrc(insertReceiveInitList.get(i).getPrc() / (1 + vatInfoVO.getVatApplyRate()));
                    if(qty > 0){
                        insertReceiveInitList.get(i).setTaxDdctAmt((insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty()) / (1 + vatInfoVO.getVatApplyRate()));
                        insertReceiveInitList.get(i).setTaxAmt((insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty()) - ((insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty()) / (1 + vatInfoVO.getVatApplyRate())));
                    }else{
                        insertReceiveInitList.get(i).setTaxDdctAmt(0.0);
                        insertReceiveInitList.get(i).setTaxAmt(0.0);
                    }



                    resultCnt = receiveEtcDAO.insertReceiveEtcItem(insertReceiveInitList.get(i));

                    if(resultCnt < 1){
                        //부품 생성 실패.[list.get(i).getItemCd()]
                        throw processException(" global.err.regFailedParam", new String[]{insertReceiveInitList.get(i).getItemCd()});
                    }

                    resultCnt = receiveEtcDAO.applyReceiveInitItem(insertReceiveInitList.get(i));

                    if(resultCnt < 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                    }

                    receiveEtcLineNo = receiveEtcLineNo + 1;
                }
            }else{
                //기초재고 입고 대상 데이터가 없습니다.
                throw processException("global.info.valNoMsg", new String[]{messageSource.getMessage("par.menu.partsInitStock", null, LocaleContextHolder.getLocale())});

            }

            return receiveEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createReceiveInitByDataCnfm(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO createReceiveInitByDataCnfm(ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
           // double amt                = 0;
            int    resultCnt          = 0;
            double qty                = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            chkReceiveEtcUpdateSomebody(receiveEtcVO);

            ReceiveEtcSearchVO receiveEtcSearchVO = new ReceiveEtcSearchVO();
            receiveEtcSearchVO.setsDlrCd(dlrCd);
            receiveEtcSearchVO.setsEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());

            List<ReceiveEtcItemVO> cnfmReceiveInitList  = new ArrayList<ReceiveEtcItemVO>();

            ItemMasterVO itemMasterVO = new ItemMasterVO();

            //수불 생성(기타입고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();


            ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            mvtDocVO.setMvtTp(receiveEtcVO.getMvtTp());

            mvtDocVO.setBpCd(receiveEtcVO.getBpCd());

            cnfmReceiveInitList = selectReceiveEtcItemByKey(receiveEtcSearchVO);

            // 4. 기타입고 부품정보를 생성한다.
            for(int i = 0; i < cnfmReceiveInitList.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();
                itemMasterVO = new ItemMasterVO();

                qty = cnfmReceiveInitList.get(i).getQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(cnfmReceiveInitList.get(i).getPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }


                mvtDocItemVO.setDlrCd(cnfmReceiveInitList.get(i).getDlrCd());
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setLocCd(cnfmReceiveInitList.get(i).getLocCd());
                mvtDocItemVO.setItemCd(cnfmReceiveInitList.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(cnfmReceiveInitList.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(qty);
                mvtDocItemVO.setStrgeCd(cnfmReceiveInitList.get(i).getStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setMvtReasonCont(cnfmReceiveInitList.get(i).getGrReasonCd());

                if(cnfmReceiveInitList.get(i).getDcRate() == null){
                    mvtDocItemVO.setTaxRate(cnfmReceiveInitList.get(i).getDcRate());
                }else if(cnfmReceiveInitList.get(i).getDcRate() >= 1){
                    mvtDocItemVO.setTaxRate(cnfmReceiveInitList.get(i).getDcRate()/100);
                }else{
                    mvtDocItemVO.setTaxRate(cnfmReceiveInitList.get(i).getDcRate());
                }
                mvtDocItemVO.setPurcPrc(cnfmReceiveInitList.get(i).getPrc());
                mvtDocItemVO.setPurcAmt(cnfmReceiveInitList.get(i).getAmt());
                mvtDocItemVO.setRefDocNo(cnfmReceiveInitList.get(i).getEtcGrDocNo());
                mvtDocItemVO.setRefDocLineNo(cnfmReceiveInitList.get(i).getEtcGrDocLineNo());

                cnfmReceiveInitList.get(i).setGrStatCd("02");
                cnfmReceiveInitList.get(i).setRegUsrId(userId);
                cnfmReceiveInitList.get(i).setDlrCd(dlrCd);
                resultCnt = receiveEtcDAO.updateCnfmReceiveEtcItem(cnfmReceiveInitList.get(i));

                if(resultCnt < 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }

                resultCnt = receiveEtcDAO.closingReceiveInitItem(cnfmReceiveInitList.get(i));

                if(resultCnt < 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }


                //기초재고입고인 경우  수불유형과 상관없이 부품 마스터 정보에 최신입고가를 적용한다.
                itemMasterVO.setDlrCd(cnfmReceiveInitList.get(i).getDlrCd());
                itemMasterVO.setItemCd(cnfmReceiveInitList.get(i).getItemCd());
                itemMasterVO.setRegUsrId(LoginUtil.getUserId());
                itemMasterVO.setLastGrAmt(cnfmReceiveInitList.get(i).getPrc());
                itemMasterDAO.updateLastGrAmt(itemMasterVO);

                mvtItemList.add(mvtDocItemVO);

            }

            receiveEtcVO.setStatCd("02");
            resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //기타입고부품의 입고 확정이 처리되지 않았습니다.
               throw processException("par.err.failedEtcIssueMsg");
            }

            //생성된 수불 정보를 기타입고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){

                receiveEtcItemVO = new ReceiveEtcItemVO();

                receiveEtcItemVO.setDlrCd(dlrCd);
                receiveEtcItemVO.setRegUsrId(userId);
                receiveEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                receiveEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                receiveEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());
                receiveEtcItemVO.setEtcGrDocNo(mvtSaveItemList.get(i).getRefDocNo());
                receiveEtcItemVO.setEtcGrDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                resultCnt = receiveEtcDAO.updateReceiveEtcItemMvtInfo(receiveEtcItemVO);
                if(resultCnt < 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }
            }

            return receiveEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#cancelReceiveInitByData(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int cancelReceiveInitByData(ReceiveEtcVO receiveEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;

            List<ReceiveEtcItemVO> cnclReceiveInitList  = new ArrayList<ReceiveEtcItemVO>();


            receiveEtcVO.setStatCd("03"); //취소상태로 수정
            receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
            receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
            receiveEtcVO.setPltCd(LoginUtil.getPltCd());
            //resultCnt = cancelReceiveEtcHeader(receiveEtcVO);
            chkReceiveEtcUpdateSomebody(receiveEtcVO);

            ReceiveEtcSearchVO receiveEtcSearchVO = new ReceiveEtcSearchVO();
            receiveEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            receiveEtcSearchVO.setsEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());

            cnclReceiveInitList = selectReceiveEtcItemByKey(receiveEtcSearchVO);


         // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < cnclReceiveInitList.size(); i++){

                cnclReceiveInitList.get(i).setRegUsrId(LoginUtil.getUserId());
                cnclReceiveInitList.get(i).setGrStatCd("03");
                cnclReceiveInitList.get(i).setDlrCd(LoginUtil.getDlrCd());

                resultCnt = receiveEtcDAO.deleteReceiveEtcItem(cnclReceiveInitList.get(i));


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{cnclReceiveInitList.get(i).getItemCd()});

                }

                resultCnt = receiveEtcDAO.cancelReceiveInitTargetItem(cnclReceiveInitList.get(i));

                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{cnclReceiveInitList.get(i).getItemCd()});

                }
            }

            resultCnt = receiveEtcDAO.cancelReceiveEtc(receiveEtcVO);


            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }


            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#cancelReceiveInitByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int cancelReceiveInitByKey(ReceiveEtcVO receiveEtcVO) throws Exception {

        int resultCnt = 0;

        receiveEtcVO.setStatCd("03"); //취소상태로 수정
        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());

        //기타입고문서 헤더 취소 수정.
        ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();
        receiveEtcItemVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcItemVO.setEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());
        receiveEtcItemVO.setCancId(LoginUtil.getUserId());
        receiveEtcItemVO.setUpdtUsrId(LoginUtil.getUserId());
        receiveEtcItemVO.setGrStatCd("03");//상태코드 : 취소(03)
        resultCnt = receiveEtcDAO.updateReceiveCancelEtcKey(receiveEtcItemVO);

        resultCnt = receiveEtcDAO.cancelReceiveEtc(receiveEtcVO);
        resultCnt = receiveEtcDAO.cancelReceiveInitTargetItem(receiveEtcItemVO);

        return resultCnt;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveInitItemByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveInitItemByKey(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveInitItemByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveInitItemByKeyCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveInitItemByKeyCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveInitItemByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveInitItemByKey(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemTrdVO> selectReceiveInitMigDataByKey(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveInitMigDataByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveInitMigDataByKeyCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveInitMigDataByKeyCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveInitMigDataByCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveInitListByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectReceiveInitListByCondition(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveInitListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectReceiveInitListByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectReceiveInitListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {

        return receiveEtcDAO.selectReceiveInitListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createReceiveInitByRepairOrderDataReg(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO createReceiveInitByRepairOrderDataReg(ReceiveEtcVO receiveEtcVO) throws Exception {
        // TODO Auto-generated method stub
        try{
            int    receiveEtcLineNo     = 1;
           // double amt                = 0;
            int    resultCnt          = 0;
            double qty                = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            List<ReceiveEtcItemVO> insertReceiveInitList = new ArrayList<ReceiveEtcItemVO>();

            int receiveInitCnt = 0;

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


            ReceiveEtcSearchVO receiveEtcSearchVO = new ReceiveEtcSearchVO();
            receiveEtcSearchVO.setsDlrCd(dlrCd);

            receiveInitCnt = receiveEtcDAO.selectRepairOrderInitListCnt(receiveEtcSearchVO);

            if(receiveInitCnt > 0){
                // 1. 기타입고 번호를 생성한다.
                String receiveEtcNo =  selectNextEtcGrDocNo();
                receiveEtcVO.setEtcGrDocNo(receiveEtcNo);

                // 2. 기타입고 상태를 설정한다.
                receiveEtcVO.setStatCd("01"); //"01" 등록상태.

                receiveEtcVO.setMvtTp("31");

                receiveEtcVO.setRemark("-INIT-");

                // 3. 기타입고 헤더를 생성한다.
                resultCnt = receiveEtcDAO.insertReceiveEtc(receiveEtcVO);

                if(resultCnt < 1){
                    //기타입고 생성 실패.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                }

                insertReceiveInitList =  receiveEtcDAO.selectRepairOrderInitList(receiveEtcSearchVO);

                // 4. 기타입고 부품정보를 생성한다.
                for(int i = 0; i < insertReceiveInitList.size(); i++){

                    qty = insertReceiveInitList.get(i).getQty();

                    if( qty <= 0 ){
                        //수량이 0보다 작거나 같을 수 없습니다
                        throw processException("global.err.chkZeroQty");
                    }

                    if(insertReceiveInitList.get(i).getPrc() <= 0){
                        //단가가 0보다 작거나 같을 수 없습니다.
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }

                    insertReceiveInitList.get(i).setEtcGrDocNo(receiveEtcNo);
                    insertReceiveInitList.get(i).setEtcGrDocLineNo(receiveEtcLineNo);
                    insertReceiveInitList.get(i).setCancYn("N");
                    //list.get(i).setAmt(amt);
                    insertReceiveInitList.get(i).setRegUsrId(userId);
                    insertReceiveInitList.get(i).setDlrCd(dlrCd);
                    insertReceiveInitList.get(i).setBpCd(receiveEtcVO.getBpCd());
                    insertReceiveInitList.get(i).setGrStatCd("01");
                    insertReceiveInitList.get(i).setAmt(insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty());
                    insertReceiveInitList.get(i).setTaxDdctPrc(insertReceiveInitList.get(i).getPrc() / (1 + vatInfoVO.getVatApplyRate()));
                    insertReceiveInitList.get(i).setTaxDdctAmt((insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty()) / (1 + vatInfoVO.getVatApplyRate()));
                    insertReceiveInitList.get(i).setTaxAmt((insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty()) - ((insertReceiveInitList.get(i).getPrc() * insertReceiveInitList.get(i).getQty()) / (1 + vatInfoVO.getVatApplyRate())));


                    resultCnt = receiveEtcDAO.insertReceiveEtcItem(insertReceiveInitList.get(i));

                    if(resultCnt < 1){
                        //부품 생성 실패.[list.get(i).getItemCd()]
                        throw processException(" global.err.regFailedParam", new String[]{insertReceiveInitList.get(i).getItemCd()});
                    }

                    resultCnt = receiveEtcDAO.applyRepairOrderInitItem(insertReceiveInitList.get(i));

                    if(resultCnt < 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                    }

                    receiveEtcLineNo = receiveEtcLineNo + 1;
                }
            }else{
                //기초재고 입고 대상 데이터가 없습니다.
                throw processException("global.info.valNoMsg", new String[]{messageSource.getMessage("par.menu.partsInitStock", null, LocaleContextHolder.getLocale())});

            }

            return receiveEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#createReceiveInitByRepairOrderDataCnfm(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public ReceiveEtcVO createReceiveInitByRepairOrderDataCnfm(ReceiveEtcVO receiveEtcVO) throws Exception {
        // TODO Auto-generated method stub
        try{
            // double amt                = 0;
             int    resultCnt          = 0;
             double qty                = 0;
             String userId = LoginUtil.getUserId();
             String dlrCd  = LoginUtil.getDlrCd();

             chkReceiveEtcUpdateSomebody(receiveEtcVO);

             ReceiveEtcSearchVO receiveEtcSearchVO = new ReceiveEtcSearchVO();
             receiveEtcSearchVO.setsDlrCd(dlrCd);
             receiveEtcSearchVO.setsEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());

             List<ReceiveEtcItemVO> cnfmReceiveInitList  = new ArrayList<ReceiveEtcItemVO>();

             ItemMasterVO itemMasterVO = new ItemMasterVO();

             //수불 생성(기타입고)
             MvtDocVO mvtDocVO = new MvtDocVO();
             MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

             ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();

             List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
             List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

             mvtDocVO.setMvtTp(receiveEtcVO.getMvtTp());

             mvtDocVO.setBpCd(receiveEtcVO.getBpCd());

             cnfmReceiveInitList = selectReceiveEtcItemByKey(receiveEtcSearchVO);

             // 4. 기타입고 부품정보를 생성한다.
             for(int i = 0; i < cnfmReceiveInitList.size(); i++){
                 mvtDocItemVO = new MvtDocItemVO();
                 itemMasterVO = new ItemMasterVO();


                 qty = cnfmReceiveInitList.get(i).getQty();

                 if( qty <= 0 ){
                     //수량이 0보다 작거나 같을 수 없습니다
                     throw processException("global.err.chkZeroQty");
                 }

                 if(cnfmReceiveInitList.get(i).getPrc() <= 0){
                     //단가가 0보다 작거나 같을 수 없습니다.
                     throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                 }

                 mvtDocItemVO.setDlrCd(cnfmReceiveInitList.get(i).getDlrCd());
                 mvtDocItemVO.setCancStmtYn("N");
                 mvtDocItemVO.setLocCd(cnfmReceiveInitList.get(i).getLocCd());
                 mvtDocItemVO.setItemCd(cnfmReceiveInitList.get(i).getItemCd());
                 mvtDocItemVO.setItemUnitCd(cnfmReceiveInitList.get(i).getUnitCd());
                 mvtDocItemVO.setItemQty(qty);
                 mvtDocItemVO.setStrgeCd(cnfmReceiveInitList.get(i).getStrgeCd());
                 mvtDocItemVO.setDdlnYn("N");
                 mvtDocItemVO.setCurrCd("");
                 mvtDocItemVO.setMvtReasonCont(cnfmReceiveInitList.get(i).getGrReasonCd());

                 if(cnfmReceiveInitList.get(i).getDcRate() == null){
                     mvtDocItemVO.setTaxRate(cnfmReceiveInitList.get(i).getDcRate());
                 }else if(cnfmReceiveInitList.get(i).getDcRate() >= 1){
                     mvtDocItemVO.setTaxRate(cnfmReceiveInitList.get(i).getDcRate()/100);
                 }else{
                     mvtDocItemVO.setTaxRate(cnfmReceiveInitList.get(i).getDcRate());
                 }
                 mvtDocItemVO.setPurcPrc(cnfmReceiveInitList.get(i).getPrc());
                 mvtDocItemVO.setPurcAmt(cnfmReceiveInitList.get(i).getAmt());
                 mvtDocItemVO.setRefDocNo(cnfmReceiveInitList.get(i).getEtcGrDocNo());
                 mvtDocItemVO.setRefDocLineNo(cnfmReceiveInitList.get(i).getEtcGrDocLineNo());

                 cnfmReceiveInitList.get(i).setGrStatCd("02");
                 cnfmReceiveInitList.get(i).setRegUsrId(userId);
                 cnfmReceiveInitList.get(i).setDlrCd(dlrCd);
                 resultCnt = receiveEtcDAO.updateCnfmReceiveEtcItem(cnfmReceiveInitList.get(i));

                 if(resultCnt < 1){
                     //기타입고 확정 실패.
                     throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                 }

                 resultCnt = receiveEtcDAO.closingRepairOrderInitItem(cnfmReceiveInitList.get(i));

                 if(resultCnt < 1){
                     //기타입고 확정 실패.
                     throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                 }


                 //기초재고입고인 경우  수불유형과 상관없이 부품 마스터 정보에 최신입고가를 적용한다.
                 itemMasterVO.setDlrCd(cnfmReceiveInitList.get(i).getDlrCd());
                 itemMasterVO.setItemCd(cnfmReceiveInitList.get(i).getItemCd());
                 itemMasterVO.setRegUsrId(LoginUtil.getUserId());
                 itemMasterVO.setLastGrAmt(cnfmReceiveInitList.get(i).getPrc());
                 itemMasterDAO.updateLastGrAmt(itemMasterVO);

                 mvtItemList.add(mvtDocItemVO);

             }

             receiveEtcVO.setStatCd("02");
             resultCnt = receiveEtcDAO.updateReceiveEtc(receiveEtcVO);

             if(resultCnt < 1){
                 //기타입고 확정 실패.
                 throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
             }

             mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

             if(mvtSaveItemList.size() < 1){
                 //기타입고부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedEtcIssueMsg");
             }

             //생성된 수불 정보를 기타입고 부품정보에 반영한다.
             for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){

                 receiveEtcItemVO = new ReceiveEtcItemVO();

                 receiveEtcItemVO.setDlrCd(dlrCd);
                 receiveEtcItemVO.setRegUsrId(userId);
                 receiveEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                 receiveEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                 receiveEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());
                 receiveEtcItemVO.setEtcGrDocNo(mvtSaveItemList.get(i).getRefDocNo());
                 receiveEtcItemVO.setEtcGrDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                 resultCnt = receiveEtcDAO.updateReceiveEtcItemMvtInfo(receiveEtcItemVO);
                 if(resultCnt < 1){
                     //기타입고 확정 실패.
                     throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
                 }
             }

             return receiveEtcVO;

         }catch(Exception e){
             throw new BizException(e.getMessage());
         }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#cancelReceiveInitByRepairOrderData(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int cancelReceiveInitByRepairOrderData(ReceiveEtcVO receiveEtcVO) throws Exception {
        // TODO Auto-generated method stub
        try{
            int    resultCnt       = 0;

            List<ReceiveEtcItemVO> cnclReceiveInitList  = new ArrayList<ReceiveEtcItemVO>();


            receiveEtcVO.setStatCd("03"); //취소상태로 수정
            receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
            receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
            receiveEtcVO.setPltCd(LoginUtil.getPltCd());
            //resultCnt = cancelReceiveEtcHeader(receiveEtcVO);
            chkReceiveEtcUpdateSomebody(receiveEtcVO);

            ReceiveEtcSearchVO receiveEtcSearchVO = new ReceiveEtcSearchVO();
            receiveEtcSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            receiveEtcSearchVO.setsEtcGrDocNo(receiveEtcVO.getEtcGrDocNo());

            cnclReceiveInitList = selectReceiveEtcItemByKey(receiveEtcSearchVO);


         // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < cnclReceiveInitList.size(); i++){

                cnclReceiveInitList.get(i).setRegUsrId(LoginUtil.getUserId());
                cnclReceiveInitList.get(i).setGrStatCd("03");
                cnclReceiveInitList.get(i).setDlrCd(LoginUtil.getDlrCd());

                resultCnt = receiveEtcDAO.deleteReceiveEtcItem(cnclReceiveInitList.get(i));


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{cnclReceiveInitList.get(i).getItemCd()});

                }

                resultCnt = receiveEtcDAO.cancelRepairOrderInitTargetItem(cnclReceiveInitList.get(i));

                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{cnclReceiveInitList.get(i).getItemCd()});

                }
            }

            resultCnt = receiveEtcDAO.cancelReceiveEtc(receiveEtcVO);


            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }


            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectRepairOrderInitListByCondition(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectRepairOrderInitListByCondition(ReceiveEtcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return receiveEtcDAO.selectRepairOrderInitListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#selectRepairOrderInitListByConditionCnt(chn.bhmc.dms.par.pcm.vo.ReceiveEtcSearchVO)
     */
    @Override
    public int selectRepairOrderInitListByConditionCnt(ReceiveEtcSearchVO searchVO) throws Exception {
        return receiveEtcDAO.selectRepairOrderInitListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#executeReceiveEtcInitProcedure(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int executeReceiveEtcInitProcedure(ReceiveEtcVO receiveEtcVO) throws Exception {

        int retOutFlag = receiveEtcDAO.executeReceiveEtcInitProcedure(LoginUtil.getDlrCd(), receiveEtcVO.getEtcGrDocNo(),LoginUtil.getUserId(), receiveEtcVO.getEtcGrDocTp(), "VIEW","Y");

        return retOutFlag;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ReceiveEtcService#executeReceiveEtcInitProcedureTest(chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO)
     */
    @Override
    public int executeReceiveEtcInitProcedureTest(ReceiveEtcVO receiveEtcVO) throws Exception {

        ReceiveEtcInitProcedureVO receiveEtcInitProcedureVO = new ReceiveEtcInitProcedureVO();
        receiveEtcInitProcedureVO.setInDlrCd(LoginUtil.getDlrCd());
        receiveEtcInitProcedureVO.setInDocNo(receiveEtcVO.getEtcGrDocNo());
        receiveEtcInitProcedureVO.setInUsrId(LoginUtil.getUserId());
        receiveEtcInitProcedureVO.setInCallMode(receiveEtcVO.getEtcGrDocTp());
        receiveEtcInitProcedureVO.setInPrCallId("VIEW");
        receiveEtcInitProcedureVO.setInDebugMod("Y");

        receiveEtcDAO.executeReceiveEtcInitProcedureTest(receiveEtcInitProcedureVO);

        return receiveEtcInitProcedureVO.getReturnVal();
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        ReceiveEtcSearchVO searchVO = new ReceiveEtcSearchVO();

        List<String> sBpCdLst = new ArrayList<String>();
        String sBpCd;
        String[] arrayBpCdStr;
        List<String> sMvtTpList = new ArrayList<String>();
        String sMvtTp;
        String[] arrayMvtTpStr;

        String sListType = params.get("sListType").toString();

        searchVO.setsLangCd(langCd);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if (StringUtils.isNotEmpty((String)params.get("sBpCdList"))) {
            sBpCd = (String)params.get("sBpCdList");
            arrayBpCdStr = sBpCd.split(",");
            sBpCdLst = Arrays.asList(arrayBpCdStr);
            searchVO.setsBpCdList(sBpCdLst);
        }

        if(!StringUtil.nullConvert(sListType).equals("H") && !StringUtil.nullConvert(sListType).equals("D")){
            if (StringUtils.isNotEmpty((String)params.get("sMvtTpList"))) {
                sMvtTp = (String)params.get("sMvtTpList");
                arrayMvtTpStr = sMvtTp.split(",");
                sMvtTpList = Arrays.asList(arrayMvtTpStr);
                searchVO.setsMvtTpList(sMvtTpList);
            }
        }

        if(!StringUtils.isBlank(params.get("sRegDtFr").toString())){
            String sRegDtFr = params.get("sRegDtFr").toString();
            Date dRegDtFr = Date.valueOf(sRegDtFr);
            searchVO.setsRegDtFr(dRegDtFr);
        }

        if(!StringUtils.isBlank(params.get("sRegDtTo").toString())){
            String sRegDtTo = params.get("sRegDtTo").toString();
            Date dRegDtTo = Date.valueOf(sRegDtTo);
            searchVO.setsRegDtTo(dRegDtTo);
        }

        if(StringUtil.nullConvert(sListType).equals("H") || StringUtil.nullConvert(sListType).equals("D")){
            if(!StringUtils.isBlank(params.get("sReturnDtFr").toString())){
                String sReturnDtFr = params.get("sReturnDtFr").toString();
                Date dReturnDtFr = Date.valueOf(sReturnDtFr);
                searchVO.setsReturnDtFr(dReturnDtFr);
            }

            if(!StringUtils.isBlank(params.get("sReturnDtTo").toString())){
                String sReturnDtTo = params.get("sReturnDtTo").toString();
                Date dReturnDtTo = Date.valueOf(sReturnDtTo);
                searchVO.setsReturnDtTo(dReturnDtTo);
            }
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if(StringUtil.nullConvert(sListType).equals("H")){                  // 부품반품집계(Header)
            List<ReceiveEtcVO> list = selectPurcReceiveReturnSummaryListByCondition(searchVO);
            context.putVar("items", list);
        } else if(StringUtil.nullConvert(sListType).equals("D")){           // 부품반품집계(Detail)
            List<ReceiveEtcItemVO> list = selectPurcReceiveReturnsByCondition(searchVO);
            context.putVar("items", list);
        } else if(StringUtil.nullConvert(sListType).equals("REFH") || StringUtil.nullConvert(sListType).equals("REBH")) {
            List<ReceiveEtcVO> list = selectReceiveEtcListByCondition(searchVO);

            List<CommonCodeVO> statCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd);

            //공통코드 또는 코드 명칭  변환 처리.
            for(ReceiveEtcVO receiveEtcVO : list){
                for(CommonCodeVO cmmCodeVO : statCdList){
                    if(cmmCodeVO.getCmmCd().equals(receiveEtcVO.getStatCd())){
                        receiveEtcVO.setStatCd(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        } else if(StringUtil.nullConvert(sListType).equals("REBD")) {
            List<ReceiveEtcItemVO> list = selectReceiveEtcBorrowDetailListByCondition(searchVO);
            context.putVar("items", list);
        } else {         // 부품조달입고집계(Detail)
            List<ReceiveEtcItemVO> list = selectReceiveEtcDetailListByCondition(searchVO);
            context.putVar("items", list);
        }
    }
}
