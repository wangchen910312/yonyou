package chn.bhmc.dms.par.ism.service.impl;


import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.ism.service.IssueEtcService;
import chn.bhmc.dms.par.ism.service.dao.IssueEtcDAO;
import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcVO;
import chn.bhmc.dms.par.pcm.service.ReceiveEtcService;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.InvestigationService;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.par.stm.service.dao.InvestigationDAO;
import chn.bhmc.dms.par.stm.vo.InvestigationItemVO;
import chn.bhmc.dms.par.stm.vo.InvestigationSearchVO;
import chn.bhmc.dms.par.stm.vo.InvestigationVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 기타출고 구현 클래스
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
@Service("issueEtcService")
public class IssueEtcServiceImpl extends HService implements IssueEtcService, JxlsSupport {

    @Resource(name="issueEtcDAO")
    private IssueEtcDAO issueEtcDAO;

    @Resource(name="etcGiDocNoIdgenService")
    EgovIdGnrService etcGiDocNoIdgenService;

    @Resource(name="investigationDAO")
    private InvestigationDAO investigationDAO;

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

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 기타입고 관리 서비스
     */
    @Resource(name="receiveEtcService")
    ReceiveEtcService receiveEtcService;

    /**
     * 재고실사 관리 서비스
     */
    @Resource(name="investigationService")
    InvestigationService investigationService;

    /**
     * 카멜Factory 서비스
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#createOrd(java.util.List, chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public IssueEtcVO createIssueEtc(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception {

        try{
            int    issueEtcLineNo     = 1;
            int    resultCnt          = 0;
            int     selectCnt           = 0;
            double qty                = 0;
            String stockDdDocNo         = "";
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            InvestigationItemVO investigationItemVO = new InvestigationItemVO();

            //수불 생성(기타출고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            IssueEtcItemVO issueEtcItemVO = new IssueEtcItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            mvtDocVO.setMvtTp(issueEtcVO.getMvtTp());


            if(!(issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45"))){//재고 조정에 의한 기타출고
                mvtDocVO.setBpCd(issueEtcVO.getBpCd());
            }else{

                if(issueEtcVO.getMvtTp().equals("43")){//실사손술출고에 의한 기타출고
                    InvestigationVO investigationVO = new InvestigationVO();

                    investigationVO.setDlrCd(dlrCd);
                    investigationVO.setStockDdDocNo(issueEtcVO.getRefDocNo());
                    investigationVO.setUpdtDtStr(issueEtcVO.getUpdtDtStr());

                    investigationService.fnChkInvestigationUpdateSomebody(investigationVO);
                }

                mvtDocVO.setBpCd(dlrCd);
                issueEtcVO.setBpCd(dlrCd);
            }

            //차입반환출고 등록인 경우 참조번호(차입입고번호)의 수정여부를 체크한다.
            if(issueEtcVO.getMvtTp().equals("48")){
                ReceiveEtcVO chkReceiveEtcVO = new ReceiveEtcVO();

                chkReceiveEtcVO.setDlrCd(dlrCd);
                chkReceiveEtcVO.setRegUsrId(userId);
                chkReceiveEtcVO.setEtcGrDocNo(issueEtcVO.getRefDocNo());
                chkReceiveEtcVO.setUpdtDtStr(issueEtcVO.getUpdtDtStr());
                receiveEtcService.fnChkReceiveEtcUpdateSomebody(chkReceiveEtcVO);

                receiveEtcService.updateReceiveEtcUpdtDt(chkReceiveEtcVO);

                issueEtcVO.setUpdtDtStr(receiveEtcService.selectReceiveEtcUpdtDtByKey(chkReceiveEtcVO));
            }


            // 1. 기타출고 번호를 생성한다.
            String issueEtcNo =  selectNextEtcGiDocNo();
            issueEtcVO.setEtcGiDocNo(issueEtcNo);

            // 2. 기타출고 상태를 설정한다.
            issueEtcVO.setStatCd("01"); //"01" 등록상태.

            // 3. 기타출고 헤더를 생성한다.
            issueEtcVO.setDlrCd(dlrCd);
            issueEtcVO.setPltCd(pltCd);
            issueEtcVO.setRegUsrId(userId);
            resultCnt = issueEtcDAO.insertIssueEtc(issueEtcVO);

            if(resultCnt < 1){
                //기타출고 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("47")||issueEtcVO.getMvtTp().equals("61")){
                    qty = list.get(i).getQty();
                //}else if(issueEtcVO.getMvtTp().equals("48")){
                //    qty = list.get(i).getQty();
               // }

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(issueEtcVO.getMvtTp().equals("43")){
                    if(list.get(i).getPrc() < 0){
                        //재고실사를 통한 손실출고일 때는 0원 출고가 가능하도록 한다. (2018.04.03)
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                }else {
                    if(list.get(i).getPrc() <= 0){
                        //단가가 0보다 작거나 같을 수 없습니다.
                        throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                    }
                }

                //임시 손실출고시 사유적어줌
                if(issueEtcVO.getMvtTp().equals("43")){
                    list.get(i).setGiReasonCd("Investigation..");
                }

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("61")){
                if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")){
                    if( (list.get(i).getGiReasonCd() == null) || (list.get(i).getGiReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                    }
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

                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(list.get(i).getQty()));
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

                list.get(i).setEtcGiDocNo(issueEtcNo);
                list.get(i).setEtcGiDocLineNo(issueEtcLineNo);
                list.get(i).setCancYn("N");
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setTaxDdctAmt(list.get(i).getAmt() - list.get(i).getTaxAmt());
                list.get(i).setBpCd(issueEtcVO.getBpCd());
                list.get(i).setGiStatCd("02");



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
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGiReasonCd());

                if(issueEtcVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
                    mvtDocItemVO.setSalePrc(0.0);
                    mvtDocItemVO.setSaleTaxDdctPrc(0.0);
                    mvtDocItemVO.setSaleAmt(0.0);
                    mvtDocItemVO.setSaleTaxDdctAmt(0.0);
                    mvtDocItemVO.setRefDocNo(list.get(i).getRefDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getRefDocLineNo());

                }else{//그외
                    mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                    mvtDocItemVO.setSaleTaxDdctPrc(list.get(i).getTaxDdctPrc());
                    mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                    mvtDocItemVO.setSaleTaxDdctAmt(list.get(i).getTaxDdctAmt());
                    mvtDocItemVO.setRefDocNo(list.get(i).getEtcGiDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getEtcGiDocLineNo());
                    if( "48".equals(issueEtcVO.getMvtTp()) ) {
                    	mvtDocItemVO.setGiDocLineNo(list.get(i).getRefDocLineNo());
                    	mvtDocItemVO.setGiDocNo(list.get(i).getRefDocNo());
                    }
                    
                }

                mvtItemList.add(mvtDocItemVO);


                resultCnt = issueEtcDAO.insertIssueEtcItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }


                /*
                resultCnt = issueEtcDAO.insertIssueEtcInterfaceItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }
                */

                issueEtcLineNo = issueEtcLineNo + 1;
            }

            issueEtcVO.setStatCd("02");
            resultCnt = issueEtcDAO.updateIssueEtc(issueEtcVO);

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
                issueEtcItemVO = new IssueEtcItemVO();

                issueEtcItemVO.setDlrCd(dlrCd);
                issueEtcItemVO.setRegUsrId(userId);
                issueEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                issueEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                issueEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                if(issueEtcVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
                    issueEtcItemVO.setEtcGiDocNo(issueEtcNo);
                    issueEtcItemVO.setEtcGiDocLineNo(i + 1);
                }else{
                    issueEtcItemVO.setEtcGiDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    issueEtcItemVO.setEtcGiDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());
                }
                resultCnt = issueEtcDAO.updateIssueEtcItemMvtInfo(issueEtcItemVO);

                if(resultCnt < 1){
                    //기타출고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                }

                if(issueEtcVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
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

            if(issueEtcVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
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


            return issueEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#createOrd(java.util.List, chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public IssueEtcVO createIssueEtcReg(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception {

        try{
            int    issueEtcLineNo     = 1;
            int    resultCnt          = 0;
            double qty                = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            if(!(issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45"))){//재고 조정에 의한 기타출고
            }else{
                issueEtcVO.setBpCd(dlrCd);
            }


            // 1. 기타출고 번호를 생성한다.
            String issueEtcNo =  selectNextEtcGiDocNo();
            issueEtcVO.setEtcGiDocNo(issueEtcNo);

            // 2. 기타출고 상태를 설정한다.
            issueEtcVO.setStatCd("01"); //"01" 등록상태.

            // 3. 기타출고 헤더를 생성한다.
            issueEtcVO.setDlrCd(dlrCd);
            issueEtcVO.setPltCd(pltCd);
            issueEtcVO.setRegUsrId(userId);
            resultCnt = issueEtcDAO.insertIssueEtc(issueEtcVO);

            if(resultCnt < 1){
                //기타출고 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("47")||issueEtcVO.getMvtTp().equals("61")){
                    qty = list.get(i).getQty();
                //}else if(issueEtcVO.getMvtTp().equals("48")){
                //    qty = list.get(i).getQty();
               // }

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(list.get(i).getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("61")){
                if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")){
                    if( (list.get(i).getGiReasonCd() == null) || (list.get(i).getGiReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }


                //amt = qty * list.get(i).getPrc();

                list.get(i).setEtcGiDocNo(issueEtcNo);
                list.get(i).setEtcGiDocLineNo(issueEtcLineNo);
                list.get(i).setCancYn("N");
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setTaxDdctAmt(list.get(i).getAmt() - list.get(i).getTaxAmt());
                list.get(i).setBpCd(issueEtcVO.getBpCd());
                list.get(i).setGiStatCd("01");

                resultCnt = issueEtcDAO.insertIssueEtcItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }


                /*
                resultCnt = issueEtcDAO.insertIssueEtcInterfaceItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }
                */

                issueEtcLineNo = issueEtcLineNo + 1;
            }

            return issueEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#createIssueEtcCnfm(java.util.List, chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public IssueEtcVO createIssueEtcCnfm(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception {

        try{
            int    resultCnt          = 0;
            double qty                = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            InvestigationItemVO investigationItemVO = new InvestigationItemVO();

            //수불 생성(기타출고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            IssueEtcItemVO issueEtcItemVO = new IssueEtcItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            chkIssueEtcUpdateSomebody(issueEtcVO);

            mvtDocVO.setMvtTp(issueEtcVO.getMvtTp());

            if(!(issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45"))){//재고 조정에 의한 기타출고
                mvtDocVO.setBpCd(issueEtcVO.getBpCd());
            }else{
                mvtDocVO.setBpCd(dlrCd);
            }

            // 4. 기타출고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("47")||issueEtcVO.getMvtTp().equals("61")){
                    qty = list.get(i).getQty();
                //}else if(issueEtcVO.getMvtTp().equals("48")){
                //    qty = list.get(i).getQty();
               // }

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(list.get(i).getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("61")){
                if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")){
                    if( (list.get(i).getGiReasonCd() == null) || (list.get(i).getGiReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                list.get(i).setGiStatCd("02");
                list.get(i).setRegUsrId(userId);
                list.get(i).setDlrCd(dlrCd);

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

                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(list.get(i).getQty()));
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
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGiReasonCd());

                if(issueEtcVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
                    mvtDocItemVO.setRefDocNo(list.get(i).getRefDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getRefDocLineNo());
                    mvtDocItemVO.setSalePrc(0.0);
                    mvtDocItemVO.setSaleTaxDdctPrc(0.0);
                    mvtDocItemVO.setSaleAmt(0.0);
                    mvtDocItemVO.setSaleTaxDdctAmt(0.0);

                }else{//그외
                    mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                    mvtDocItemVO.setSaleTaxDdctPrc(list.get(i).getTaxDdctPrc());
                    mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                    mvtDocItemVO.setSaleTaxDdctAmt(list.get(i).getTaxDdctAmt());
                    mvtDocItemVO.setRefDocNo(list.get(i).getEtcGiDocNo());
                    mvtDocItemVO.setRefDocLineNo(list.get(i).getEtcGiDocLineNo());
                }

                mvtItemList.add(mvtDocItemVO);


                resultCnt = issueEtcDAO.updateCnfmIssueEtcItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                /*
                resultCnt = issueEtcDAO.insertIssueEtcInterfaceItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }
                */

            }

            issueEtcVO.setStatCd("02");
            resultCnt = issueEtcDAO.updateIssueEtc(issueEtcVO);

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
                issueEtcItemVO = new IssueEtcItemVO();

                issueEtcItemVO.setDlrCd(dlrCd);
                issueEtcItemVO.setRegUsrId(userId);
                issueEtcItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                issueEtcItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                issueEtcItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                if(issueEtcVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
                    issueEtcItemVO.setEtcGiDocNo(issueEtcVO.getEtcGiDocNo());
                    issueEtcItemVO.setEtcGiDocLineNo(i + 1);
                }else{
                    issueEtcItemVO.setEtcGiDocNo(mvtSaveItemList.get(i).getRefDocNo());
                    issueEtcItemVO.setEtcGiDocLineNo(mvtSaveItemList.get(i).getRefDocLineNo());
                }
                resultCnt = issueEtcDAO.updateIssueEtcItemMvtInfo(issueEtcItemVO);

                if(resultCnt < 1){
                    //기타출고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                }

                if(issueEtcVO.getMvtTp().equals("43")){//재고 조정에 의한 기타출고
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


            return issueEtcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiIssueEtcs(BaseSaveVO<IssueEtcItemVO> obj, IssueEtcVO issueEtcVO) throws Exception {

        try{
            int    resultCnt        = 0;
            //double amt              = 0;
            double qty              = 0;
            int    issueEtcLineNo   = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            chkIssueEtcUpdateSomebody(issueEtcVO);

            issueEtcLineNo = issueEtcDAO.selectIssueEtcMaxLineNo(issueEtcVO);

            for(IssueEtcItemVO itemVO : obj.getInsertList()){

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("47")||issueEtcVO.getMvtTp().equals("61")){
                    qty = itemVO.getQty();
                //}else if(issueEtcVO.getMvtTp().equals("48")){
                //    qty = itemVO.getQty();
                //}

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("61")){
                if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")){
                    if( (itemVO.getGiReasonCd() == null) || (itemVO.getGiReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                if(itemVO.getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                //amt = qty * itemVO.getPrc();

                itemVO.setEtcGiDocNo(issueEtcVO.getEtcGiDocNo());
                itemVO.setEtcGiDocLineNo(issueEtcLineNo);
                itemVO.setCancYn("N");
                //itemVO.setAmt(amt);
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setTaxDdctAmt(itemVO.getAmt() - itemVO.getTaxAmt());
                itemVO.setBpCd(issueEtcVO.getBpCd());
                itemVO.setGiStatCd("01");

                resultCnt = issueEtcDAO.insertIssueEtcItem(itemVO);

                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

                issueEtcLineNo = issueEtcLineNo + 1;
            }

            for(IssueEtcItemVO itemVO : obj.getUpdateList()){

                //if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("47")||issueEtcVO.getMvtTp().equals("61")){
                    qty = itemVO.getQty();
                //}else if(issueEtcVO.getMvtTp().equals("48")){
                    //qty = itemVO.getQty();
                //}

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

//                if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")||issueEtcVO.getMvtTp().equals("45")||issueEtcVO.getMvtTp().equals("61")){
                if(issueEtcVO.getMvtTp().equals("41")||issueEtcVO.getMvtTp().equals("43")){
                    if( (itemVO.getGiReasonCd() == null) || (itemVO.getGiReasonCd().isEmpty())){
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giReasonCd", null, LocaleContextHolder.getLocale())});
                    }
                }

                if(itemVO.getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }


                //amt = qty * itemVO.getPrc();

                //itemVO.setAmt(amt);
                itemVO.setDlrCd(dlrCd);
                itemVO.setUpdtUsrId(userId);

                resultCnt = issueEtcDAO.updateIssueEtcItem(itemVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(IssueEtcItemVO itemVO : obj.getDeleteList()){
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setGiStatCd("03");

                //resultCnt = issueEtcDAO.deleteIssueEtcItem(itemVO);
                resultCnt = issueEtcDAO.deleteRegIssueEtcItem(itemVO);


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});

                }
            }

            resultCnt = issueEtcDAO.updateIssueEtc(issueEtcVO);

            if(resultCnt < 1){
              //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void regCancIssueEtcs(IssueEtcVO regIssueEtcVO) throws Exception {

        try{
            int resultCnt = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            IssueEtcVO issueEtcVO = new IssueEtcVO();
            IssueEtcSearchVO issueEtcSearchVO = new IssueEtcSearchVO();

            issueEtcSearchVO.setsDlrCd(dlrCd);
            issueEtcSearchVO.setsEtcGiDocNo(regIssueEtcVO.getEtcGiDocNo());

            issueEtcVO = issueEtcDAO.selectIssueEtcByKey(issueEtcSearchVO);

            if(issueEtcVO.getStatCd().equals("01")){
                IssueEtcItemVO issueEtcItemVO = new IssueEtcItemVO();
                issueEtcItemVO.setDlrCd(dlrCd);
                issueEtcItemVO.setRegUsrId(userId);
                issueEtcItemVO.setGiStatCd("03");
                issueEtcItemVO.setEtcGiDocNo(issueEtcVO.getEtcGiDocNo());
                resultCnt = issueEtcDAO.cancelIssueEtcItemAll(issueEtcItemVO);
            }

            if(resultCnt < 1){
                //디테일 취소 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            issueEtcVO.setStatCd(regIssueEtcVO.getStatCd());
            resultCnt = issueEtcDAO.updateIssueEtc(issueEtcVO);

            if(resultCnt < 1){
                //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    @Override
    public int updateIssueEtc(IssueEtcVO issueEtcVO) throws Exception {
        try{
            int    resultCnt       = 0;

            chkIssueEtcUpdateSomebody(issueEtcVO);

            resultCnt = issueEtcDAO.updateIssueEtc(issueEtcVO);

            if(resultCnt < 1){
                //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#updateIssueEtcUpdtDt(chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public int updateIssueEtcUpdtDt(IssueEtcVO issueEtcVO) throws Exception {
        return issueEtcDAO.updateIssueEtcUpdtDt(issueEtcVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#deleteIssueEtc(chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public int cancelIssueEtc(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;
            double qty             = 0;


            issueEtcVO.setStatCd("03"); //취소상태로 수정
            issueEtcVO.setRegUsrId(LoginUtil.getUserId());
            issueEtcVO.setDlrCd(LoginUtil.getDlrCd());
            issueEtcVO.setPltCd(LoginUtil.getPltCd());
            chkIssueEtcUpdateSomebody(issueEtcVO);
            //resultCnt = cancelIssueEtcHeader(issueEtcVO);


            // 수불 생성(기타출고 취소)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            mvtDocVO.setMvtTp(issueEtcVO.getMvtTp());
            mvtDocVO.setBpCd(issueEtcVO.getBpCd());


           // 4. 기타출고 부품정보를 생성한다.
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
                searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd()); //딜러코드

                itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                //이동평균가격 정보가 존재하는 경우
                if(itemMovingAvgPrcVO != null){


                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(list.get(i).getQty()));
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

                if(i == 0){
                    mvtDocVO.setMvtDocYyMm(list.get(i).getMvtDocYyMm());
                    mvtDocVO.setMvtDocNo(list.get(i).getMvtDocNo());
                }

                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setGiStatCd("03");
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                resultCnt = issueEtcDAO.deleteIssueEtcItem(list.get(i));


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{list.get(i).getItemCd()});

                }

                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(issueEtcVO.getPltCd());
                mvtDocItemVO.setCancStmtYn("Y");
                mvtDocItemVO.setLocCd(list.get(i).getLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(qty);
                mvtDocItemVO.setStrgeCd(list.get(i).getStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setMvtReasonCont(list.get(i).getGiReasonCd());
                mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                mvtDocItemVO.setSaleTaxDdctPrc(list.get(i).getTaxDdctPrc());
                mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                mvtDocItemVO.setSaleTaxDdctAmt(list.get(i).getTaxDdctAmt());
                mvtDocItemVO.setRefDocNo(list.get(i).getMvtDocNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getMvtDocLineNo());
                mvtDocItemVO.setGiDocNo(list.get(i).getEtcGiDocNo());
                mvtDocItemVO.setGiDocLineNo(list.get(i).getEtcGiDocLineNo());

                mvtItemList.add(mvtDocItemVO);

            }

            resultCnt = issueEtcDAO.cancelIssueEtc(issueEtcVO);

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
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#deleteIssueEtc(chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    /*
    public int cancelIssueEtcHeader(IssueEtcVO issueEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;

            // 1. 기타출고 헤더 정보를 수정한다.(헤더만! 수정한다.)
            issueEtcVO.setIssueEtcStatCd("05"); //취소상태로 변경한다.

            //공급업체가 BMP인경우
            if(issueEtcVO.getBpTp().equals("01")){  //전송상태는 취소가 불가능합니다.

                if(!issueEtcVO.getIssueEtcStatCd().equals("01") ){  //등록상태 이외에는 취소가 불가능합니다.
                    //취소 할 수 없습니다
                    throw processException("global.err.cnclFailed");
                }
            }



            resultCnt = issueEtcDAO.cancelIssueEtc(issueEtcVO);

            if(resultCnt < 1){
                //기타출고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
    */

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#multiConfirmIssueEtc(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public void multiConfirmIssueEtc(BaseSaveVO<IssueEtcItemVO> issueEtcSaveVO, IssueEtcVO issueEtcVO) throws Exception {


        multiIssueEtcs(issueEtcSaveVO, issueEtcVO);

        confirmIssueEtc(issueEtcVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#confirmIssueEtc(chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public int confirmIssueEtc(IssueEtcVO issueEtcVO) throws Exception {

        try{
            int    resultCnt       = 0;

            chkIssueEtcUpdateSomebody(issueEtcVO);

            if(! issueEtcVO.getStatCd().equals("01") ){  //등록상태 이외에는 확정 불가능합니다.
                //취소 할 수 없습니다
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }


            // 1. 기타출고 헤더 정보를 수정한다.(헤더만! 수정한다.)
            issueEtcVO.setStatCd("02"); //취소상태로 변경한다.

            resultCnt = issueEtcDAO.updateIssueEtc(issueEtcVO);

            if(resultCnt < 1){
                //기타출고 취소 실패.
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcByKey(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public IssueEtcVO selectIssueEtcByKey(IssueEtcSearchVO issueEtcSearchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcByKey(issueEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcItemByKey(chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public List<IssueEtcItemVO> selectIssueEtcItemByKey(IssueEtcSearchVO issueEtcSearchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcItemByKey(issueEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectRentalItemByKey(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<ReceiveEtcItemVO> selectRentalItemByKey(IssueEtcSearchVO issueEtcSearchVO) throws Exception {

        return issueEtcDAO.selectRentalItemByKey(issueEtcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcItemExcelUploadByKey(chn.bhmc.dms.par.ism.vo.IssueEtcItemVO)
     */
    @Override
    public IssueEtcItemVO selectIssueEtcItemExcelUploadByKey(IssueEtcItemVO issueEtcItemVO) throws Exception {

        return issueEtcDAO.selectIssueEtcItemExcelUploadByKey(issueEtcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectItemInfoByIssueEtcerInfo(chn.bhmc.dms.par.ism.vo.IssueEtcItemVO)
     */
    @Override
    public IssueEtcItemVO selectItemInfoByIssueEtcerInfo(IssueEtcItemVO issueEtcItemVO) throws Exception {

        return issueEtcDAO.selectItemInfoByIssueEtcerInfo(issueEtcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcesByCondition(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcVO> selectIssueEtcsByCondition(IssueEtcSearchVO searchVO) throws Exception {
        return issueEtcDAO.selectIssueEtcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectIssueEtcsByConditionCnt(IssueEtcSearchVO searchVO) throws Exception {
        return issueEtcDAO.selectIssueEtcsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectNextEtcGiDocNo()
     */
    @Override
    public String selectNextEtcGiDocNo() throws Exception {
        try {
            return etcGiDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcesByCondition(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectInvcItemsByCondition(IssueEtcSearchVO searchVO) throws Exception {
        return issueEtcDAO.selectInvcItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectInvcItemsByConditionCnt(IssueEtcSearchVO searchVO) throws Exception {
        return issueEtcDAO.selectInvcItemsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcRentalPop(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectIssueEtcRentalPop(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcRentalPop(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcRentalPopCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectIssueEtcRentalPopCnt(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcRentalPopCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcReturnPop(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectIssueEtcReturnPop(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcReturnPop(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcReturnPopCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectIssueEtcReturnPopCnt(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcReturnPopCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcFundsByCondition(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectIssueEtcFundsByCondition(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcFundsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcFundsByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectIssueEtcFundsByConditionCnt(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcFundsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcDetailListByCondition(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectIssueEtcDetailListByCondition(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcDetailListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcDetailListByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectIssueEtcDetailListByConditionCnt(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcDetailListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcListByCondition(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcVO> selectIssueEtcListByCondition(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcListByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectIssueEtcListByConditionCnt(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcListByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcRentDetailListByCondition(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public List<IssueEtcItemVO> selectIssueEtcRentalDetailListByCondition(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcRentalDetailListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcRentDetailListByConditionCnt(chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO)
     */
    @Override
    public int selectIssueEtcRentalDetailListByConditionCnt(IssueEtcSearchVO searchVO) throws Exception {

        return issueEtcDAO.selectIssueEtcRentalDetailListByConditionCnt(searchVO);
    }

    public void chkIssueEtcUpdateSomebody(IssueEtcVO issueEtcVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = issueEtcDAO.selectIssueEtcUpdtDtByKey(issueEtcVO);

            if(!updtDtStrNow.equals(issueEtcVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#fnChkIssueEtcUpdateSomebody(chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public boolean fnChkIssueEtcUpdateSomebody(IssueEtcVO issueEtcVO) throws Exception {

        chkIssueEtcUpdateSomebody(issueEtcVO);

        return false;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#selectIssueEtcUpdtDtByKey()
     */
    @Override
    public String selectIssueEtcUpdtDtByKey(IssueEtcVO issueEtcVO) throws Exception {

        return issueEtcDAO.selectIssueEtcUpdtDtByKey(issueEtcVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        IssueEtcSearchVO searchVO = new IssueEtcSearchVO();

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

        if (StringUtils.isNotEmpty((String)params.get("sMvtTpList"))) {
            sMvtTp = (String)params.get("sMvtTpList");
            arrayMvtTpStr = sMvtTp.split(",");
            sMvtTpList = Arrays.asList(arrayMvtTpStr);
            searchVO.setsMvtTpList(sMvtTpList);
        }

        if(!StringUtils.isBlank(params.get("sGiDtFr").toString())){
            String sGiDtFr = params.get("sGiDtFr").toString();
            Date dGiDtFr = Date.valueOf(sGiDtFr);
            searchVO.setsGiDtFr(dGiDtFr);
        }

        if(!StringUtils.isBlank(params.get("sGiDtTo").toString())){
            String sGiDtTo = params.get("sGiDtTo").toString();
            Date dGiDtTo = Date.valueOf(sGiDtTo);
            searchVO.setsGiDtTo(dGiDtTo);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if(StringUtil.nullConvert(sListType).equals("IERH")){
            List<IssueEtcVO> list = selectIssueEtcListByCondition(searchVO);

            List<CommonCodeVO> statCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd);

            //공통코드 또는 코드 명칭  변환 처리.
            for(IssueEtcVO issueEtcVO : list){
                for(CommonCodeVO cmmCodeVO : statCdList){
                    if(cmmCodeVO.getCmmCd().equals(issueEtcVO.getStatCd())){
                        issueEtcVO.setStatCd(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }
            }

            context.putVar("items", list);
        } else if(StringUtil.nullConvert(sListType).equals("IERD")){
            List<IssueEtcItemVO> list = selectIssueEtcRentalDetailListByCondition(searchVO);
            context.putVar("items", list);
        } else if(StringUtil.nullConvert(sListType).equals("IEFH")) {
            List<IssueEtcVO> list = selectIssueEtcListByCondition(searchVO);

            List<CommonCodeVO> statCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", null, langCd);

            //공통코드 또는 코드 명칭  변환 처리.
            for(IssueEtcVO issueEtcVO : list){
                for(CommonCodeVO cmmCodeVO : statCdList){
                    if(cmmCodeVO.getCmmCd().equals(issueEtcVO.getStatCd())){
                        issueEtcVO.setStatCd(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        } else {
            List<IssueEtcItemVO> list = selectIssueEtcDetailListByCondition(searchVO);
            context.putVar("items", list);
        }


    }

    /*
     * @see chn.bhmc.dms.par.ism.service.IssueEtcService#insertIssueProcureToIf(java.util.List, chn.bhmc.dms.par.ism.vo.IssueEtcVO)
     */
    @Override
    public boolean insertIssueProcureToIf(List<IssueEtcItemVO> list, IssueEtcVO issueEtcVO) throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("PTS103"); //Parts Info Send Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        Map<String, Object> message = null;
        java.util.Date currentDate = new java.util.Date();

        for(IssueEtcItemVO issueEtcItemVO : list){
            message = new HashMap<String, Object>();

            message.put("DLR_CD",issueEtcVO.getDlrCd());
            message.put("DLR_CD_RCV",issueEtcVO.getBpCd());
            message.put("ETC_GI_DOC_NO",issueEtcItemVO.getEtcGiDocNo());
            message.put("ETC_GI_DOC_LINE_NO",String.valueOf(issueEtcItemVO.getEtcGiDocLineNo()));
            message.put("CANC_YN",issueEtcItemVO.getCancYn());
            message.put("ITEM_CD",issueEtcItemVO.getItemCd());
            message.put("QTY",issueEtcItemVO.getQty());
            message.put("PRC",issueEtcItemVO.getPrc());
            message.put("AMT",issueEtcItemVO.getAmt());
            message.put("REASON_CD",issueEtcItemVO.getGiReasonCd());
            message.put("ISS_DT",DateUtil.convertToString(currentDate, "YYYYMMdd"));
            message.put("ISS_TM",DateUtil.convertToString(currentDate, "HHmmss"));
            message.put("PRC_WOT",issueEtcItemVO.getTaxDdctAmt());
            message.put("TAX",issueEtcItemVO.getTaxAmt());
            message.put("REG_USR_ID",issueEtcItemVO.getRegUsrId());

            camelClient.addSendMessage(message);
        }

        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                return true;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }


}
