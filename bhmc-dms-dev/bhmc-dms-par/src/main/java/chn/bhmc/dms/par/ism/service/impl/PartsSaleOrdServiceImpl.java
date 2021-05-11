package chn.bhmc.dms.par.ism.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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

import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;


import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.ism.service.IssuePartsOutService;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.par.ism.service.PartsSaleOrdService;
import chn.bhmc.dms.par.ism.service.dao.PartsSaleOrdDAO;
import chn.bhmc.dms.par.ism.vo.PartCalculateVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 부품판매 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("partsSaleOrdService")
public class PartsSaleOrdServiceImpl extends HService implements PartsSaleOrdService, JxlsSupport {

    @Resource(name="partsSaleOrdDAO")
    private PartsSaleOrdDAO partsSaleOrdDAO;

    @Resource(name="partsSaleOrdNoIdgenService")
    EgovIdGnrService partsSaleOrdNoIdgenService;

    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 출고등록 서비스
     */
    @Resource(name="issuePartsOutService")
    IssuePartsOutService issuePartsOutService;

    /**
     * 입출고예정 서비스
     */
    @Resource(name="grGiScheduleService")
    GrGiScheduleService grGiScheduleService;

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
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

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



    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#createPartsSaleOrd(java.util.List, chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public PartsSaleOrdVO createPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO)
            throws Exception {

        try{
            int    partsSaleOrdLineNo = 1;
            int    resultCnt       = 0;

            // [부품판매]출고예정정보
            GrGiScheduleVO partsSaleGrGiScheduleVO = new GrGiScheduleVO();

            //구매제시정보

            // 1. 부품판매오더 번호를 생성한다.
            String partsSaleOrdNo =  selectNextPartsSaleOrdNo();
            partsSaleOrdVO.setParSaleOrdNo(partsSaleOrdNo);

            // 2. 부품판매 상태를 설정한다.
            partsSaleOrdVO.setOrdStatCd("01"); //"01" 등록상태.
            partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());

            if( (partsSaleOrdVO.getCustTp() == null) || (partsSaleOrdVO.getCustTp().isEmpty())){
                //고객유형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custTp", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getSaleTp() == null) || (partsSaleOrdVO.getSaleTp().isEmpty())){
                //판매유형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.saleType", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getCustNm() == null) || (partsSaleOrdVO.getCustNm().isEmpty())){
                //고객정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getSalePrsnId() == null) || (partsSaleOrdVO.getSalePrsnId().isEmpty())){
                //담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prsNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getDcBefTotAmt() == null) || (partsSaleOrdVO.getDcBefTotAmt() < 0)){
                //할인전 총액이 0보다 작거나 같을 수 없습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.totAmtBefDc", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getDcAmt() == null) || (partsSaleOrdVO.getDcAmt() < 0)){
                //할인금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("sal.lbl.dcAmt", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getTotAmt() == null) || (partsSaleOrdVO.getTotAmt() < 0)){
                //총금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.totAmt", null, LocaleContextHolder.getLocale())});
            }

            if(partsSaleOrdVO.getDcAmt() > 0){
                partsSaleOrdVO.setDcRate((partsSaleOrdVO.getDcAmt()/partsSaleOrdVO.getTotAmt()) * 100);
            }

            // 3. 부품판매 헤더를 생성한다.
            resultCnt = partsSaleOrdDAO.insertPartsSaleOrd(partsSaleOrdVO);

            if(resultCnt < 1){
                //부품판매 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }

            // 4. 부품판매 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setParSaleOrdNo(partsSaleOrdNo);
                list.get(i).setParSaleOrdLineNo(partsSaleOrdLineNo);
                list.get(i).setGiStatCd("01");

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅.
                 *********************************/
                partsSaleGrGiScheduleVO = new GrGiScheduleVO();

                partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                partsSaleGrGiScheduleVO.setStrgeCd(list.get(i).getGiStrgeCd());
                partsSaleGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                partsSaleGrGiScheduleVO.setGrGiDocNo(partsSaleOrdVO.getParSaleOrdNo());
                partsSaleGrGiScheduleVO.setGrGiDocLineNo(partsSaleOrdLineNo);
                partsSaleGrGiScheduleVO.setGrGiTp("I");
                partsSaleGrGiScheduleVO.setProcQty(list.get(i).getOrdQty());
                partsSaleGrGiScheduleVO.setGrGiQty(list.get(i).getOrdQty());
                partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
                partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅 끝.
                 *********************************/

                if(list.get(i).getOrdQty() == null || list.get(i).getOrdQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(list.get(i).getPrc() == null || list.get(i).getPrc() < 0){
                  //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                /*  부품 상태 아직 사용안함(정의안됨)
                if( (list.get(i).getItemStatCd() == null) || (list.get(i).getItemStatCd().isEmpty())){
                    //부품상태정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
                }*/

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //부품정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getGiStrgeCd() == null) || (list.get(i).getGiStrgeCd().isEmpty())){
                    //출고창고정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale())});
                }

                /*
                if( (list.get(i).getGiLocCd() == null) || (list.get(i).getGiLocCd().isEmpty())){
                    //출고로케이션정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.locationCd", null, LocaleContextHolder.getLocale())});
                }
                */

                if( list.get(i).getDcRate() < 0 ){
                    //할인율 0보다 작을 수 없습니다.
                    throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.dcRate", null, LocaleContextHolder.getLocale())});
                }



                resultCnt = partsSaleOrdDAO.insertPartsSaleOrdItem(list.get(i));


                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

                if(resultCnt < 1){
                    //부품 수정 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.modifyFailedParam", new String[]{list.get(i).getItemCd()});
                }

                partsSaleOrdLineNo = partsSaleOrdLineNo + 1;
            }


            return partsSaleOrdVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#multiPartsSaleOrd(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public void multiPartsSaleOrds(BaseSaveVO<PartsSaleOrdItemVO> obj, PartsSaleOrdVO partsSaleOrdVO)
            throws Exception {


        try{
            int resultCnt          = 0;
            int regItemCnt         = 0;
            int partsSaleOrdLineNo = 1;
            double orgGrGiQty      = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            chkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);

            // [부품판매]출고예정정보
            GrGiScheduleVO partsSaleGrGiScheduleVO = new GrGiScheduleVO();


            partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());
            partsSaleOrdVO.setOrdStatCd("01");

            for(PartsSaleOrdItemVO itemVO : obj.getInsertList()){

                partsSaleOrdLineNo = partsSaleOrdDAO.selectPartsSaleOrdMaxLineNo(partsSaleOrdVO);

                if(itemVO.getOrdQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(itemVO.getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getAmt() < 0){
                    //금액 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.amt", null, LocaleContextHolder.getLocale())});
                }

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅.
                 *********************************/
                partsSaleGrGiScheduleVO = new GrGiScheduleVO();

                partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                partsSaleGrGiScheduleVO.setStrgeCd(itemVO.getGiStrgeCd());
                partsSaleGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                partsSaleGrGiScheduleVO.setGrGiDocNo(partsSaleOrdVO.getParSaleOrdNo());
                partsSaleGrGiScheduleVO.setGrGiDocLineNo(partsSaleOrdLineNo);
                partsSaleGrGiScheduleVO.setGrGiTp("I");
                partsSaleGrGiScheduleVO.setProcQty(itemVO.getOrdQty());
                partsSaleGrGiScheduleVO.setGrGiQty(itemVO.getOrdQty());
                partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
                partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅 끝.
                 *********************************/

                itemVO.setParSaleOrdNo(partsSaleOrdVO.getParSaleOrdNo());
                itemVO.setParSaleOrdLineNo(partsSaleOrdLineNo);
                itemVO.setGiStatCd("01"); //"01" 등록상태
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);


                resultCnt = partsSaleOrdDAO.insertPartsSaleOrdItem(itemVO);


                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

                resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(PartsSaleOrdItemVO itemVO : obj.getUpdateList()){
                orgGrGiQty = 0;

                if(itemVO.getOrdQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(itemVO.getPrc() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                if(itemVO.getAmt() < 0){
                    //금액 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.amt", null, LocaleContextHolder.getLocale())});
                }

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅.
                 *********************************/
                partsSaleGrGiScheduleVO = new GrGiScheduleVO();

                partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                partsSaleGrGiScheduleVO.setStrgeCd(itemVO.getGiStrgeCd());
                partsSaleGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                partsSaleGrGiScheduleVO.setGrGiDocNo(itemVO.getParSaleOrdNo());
                partsSaleGrGiScheduleVO.setGrGiDocLineNo(itemVO.getParSaleOrdLineNo());
                partsSaleGrGiScheduleVO.setGrGiTp("I");

                orgGrGiQty = grGiScheduleService.selectGrGiDocOrgQty(partsSaleGrGiScheduleVO);

                partsSaleGrGiScheduleVO.setProcQty(itemVO.getOrdQty() - orgGrGiQty);
                partsSaleGrGiScheduleVO.setGrGiQty(itemVO.getOrdQty());
                partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
                partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅 끝.
                 *********************************/

                itemVO.setDlrCd(dlrCd);
                itemVO.setUpdtUsrId(userId);

                resultCnt = partsSaleOrdDAO.updatePartsSaleOrdItem(itemVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }

                if((itemVO.getOrdQty() - orgGrGiQty) != 0){
                    resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

                    if(resultCnt < 1){
                        //부품 수정 실패
                        throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                    }
                }
            }

            for(PartsSaleOrdItemVO itemVO : obj.getDeleteList()){
                itemVO.setUpdtUsrId(userId);
                itemVO.setDlrCd(dlrCd);

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅.
                 *********************************/
                partsSaleGrGiScheduleVO = new GrGiScheduleVO();

                partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                partsSaleGrGiScheduleVO.setStrgeCd(itemVO.getGiStrgeCd());
                partsSaleGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                partsSaleGrGiScheduleVO.setGrGiDocNo(itemVO.getParSaleOrdNo());
                partsSaleGrGiScheduleVO.setGrGiDocLineNo(itemVO.getParSaleOrdLineNo());
                partsSaleGrGiScheduleVO.setGrGiTp("I");
                partsSaleGrGiScheduleVO.setProcQty(itemVO.getOrdQty() * -1);
                partsSaleGrGiScheduleVO.setGrGiQty(itemVO.getOrdQty());
                partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
                partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅 끝.
                 *********************************/

                resultCnt = partsSaleOrdDAO.deletePartsSaleOrdItem(itemVO);


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});
                }

                resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            if(partsSaleOrdVO.getDcAmt() > 0){
                partsSaleOrdVO.setDcRate((partsSaleOrdVO.getDcAmt()/partsSaleOrdVO.getTotAmt()) * 100);
            }

            //확정시 아직 남아있는 등록상태인 판매부품이 존재하는지 조회한다.
            regItemCnt = partsSaleOrdDAO.selectPartsSaleOrdItemRegCnt(partsSaleOrdVO);

            //등록되어있는 판매부품이 없는 경우 헤더 상태 변경 실행.
            if(regItemCnt < 1){

                partsSaleOrdVO.setOrdStatCd("02");

                //부품판매 헤더정보를 확정처리한다.
                resultCnt = partsSaleOrdDAO.confirmPartsSaleOrdStat(partsSaleOrdVO);

                if(resultCnt < 1){
                    //부품판매 수정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
                }
            //등록되어있는 판매부품이 있는 경우 헤더 상태 변경 실행.
            }else{
                partsSaleOrdVO.setOrdStatCd("01");

                // 부품판매 헤더를 수정한다.
                resultCnt = partsSaleOrdDAO.updatePartsSaleOrd(partsSaleOrdVO);

                if(resultCnt < 1){
                    //부품판매 생성 실패.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
                }
            }




        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#returnPartsSaleOrd(java.util.List, chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public PartsSaleOrdVO returnPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO)
            throws Exception {

        try{
            int    partsSaleOrdLineNo = 1;
            int    resultCnt          = 0;

            String[] lblList = new String[2];

            String pltCd  = LoginUtil.getPltCd();
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            Double dcBefTotAmt        = 0.0;
            Double dcAmt              = 0.0;
            Double totAmt             = 0.0;
            Double lineAmt            = 0.0;
            Double lineDcAmt          = 0.0;
            PartsSaleOrdVO returnPartsSaleOrdVO         = new PartsSaleOrdVO();

            // 수불 생성(판매출고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            PartsSaleOrdItemVO mvtPartsSaleOrdItemVO = new PartsSaleOrdItemVO();

          //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            chkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);

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


            // 1. 부품판매반품오더 번호를 생성한다.
            String partsSaleOrdNo =  selectNextPartsSaleOrdNo();
            returnPartsSaleOrdVO.setParSaleOrdNo(partsSaleOrdNo);

            // 2. 부품판매 반품 상태를 설정한다.
            returnPartsSaleOrdVO.setOrdStatCd("07"); //"07" 반품상태.
            returnPartsSaleOrdVO.setDlrCd(dlrCd);
            returnPartsSaleOrdVO.setRegUsrId(userId);
            returnPartsSaleOrdVO.setRefDocNo(partsSaleOrdVO.getParSaleOrdNo());
            returnPartsSaleOrdVO.setSaleTp(partsSaleOrdVO.getSaleTp());
            returnPartsSaleOrdVO.setCustTp(partsSaleOrdVO.getCustTp());
            returnPartsSaleOrdVO.setCustCd(partsSaleOrdVO.getCustCd());
            returnPartsSaleOrdVO.setCustNm(partsSaleOrdVO.getCustNm());
            returnPartsSaleOrdVO.setCustTelNo(partsSaleOrdVO.getCustTelNo());
            returnPartsSaleOrdVO.setSaId(partsSaleOrdVO.getSaId());
            returnPartsSaleOrdVO.setSalePrsnId(partsSaleOrdVO.getSalePrsnId());
            returnPartsSaleOrdVO.setRemark(partsSaleOrdVO.getRemark());

            mvtDocVO.setMvtTp("73");  //판매반품
            if(returnPartsSaleOrdVO.getCustTp().equals("01")){ //거래처 유형이 '01': 일반인경우
                mvtDocVO.setCustNo(returnPartsSaleOrdVO.getCustCd());
                mvtDocVO.setBpCd(" ");
            }else if(returnPartsSaleOrdVO.getCustTp().equals("02")){ //거래처 유형이 '02': 거래처인경우
                mvtDocVO.setBpCd(returnPartsSaleOrdVO.getCustCd());
                mvtDocVO.setCustNo(" ");
            }

            // 4. 부품판매 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                list.get(i).setRegUsrId(userId);
                list.get(i).setDlrCd(dlrCd);
                list.get(i).setRefDocNo(list.get(i).getParSaleOrdNo());
                list.get(i).setRefDocLineNo(list.get(i).getParSaleOrdLineNo());
                list.get(i).setParSaleOrdNo(partsSaleOrdNo);
                list.get(i).setParSaleOrdLineNo(partsSaleOrdLineNo);

                if( list.get(i).getReturnQty() + list.get(i).getPreReturnQty() > list.get(i).getOrdQty()){
                    lblList = new String[2];
                    lblList[0] = messageSource.getMessage("par.lbl.returnPartsQty", null, LocaleContextHolder.getLocale()); //반품수량
                    lblList[1] = messageSource.getMessage("par.lbl.partsSaleQty", null, LocaleContextHolder.getLocale());          //판매수량
                    //반품수량이 출고수량보다 큽니다.
                    throw processException("par.info.itemReqCntMsg", lblList);
                }

                // 할인율 적용안함.BHMC결정사항
                /*
                if(list.get(i).getDcRate() > 0){
                    lineAmt    = (list.get(i).getPrc() * list.get(i).getReturnQty()) - (list.get(i).getPrc() * list.get(i).getReturnQty() * (list.get(i).getDcRate()/100));
                    //lineDcAmt  = (list.get(i).getPrc() * list.get(i).getReturnQty() * (list.get(i).getDcRate()/100));
                    lineDcAmt  = (list.get(i).getPrc() * list.get(i).getReturnQty() * (list.get(i).getDcRate()/100));
                    list.get(i).setAmt(lineAmt);
                    list.get(i).setTaxAmt(lineAmt - (lineAmt/(1 + vatInfoVO.getVatApplyRate())));
                    list.get(i).setTaxDdctAmt(lineAmt/(1 + vatInfoVO.getVatApplyRate()));
                }else{
                    lineAmt    = (list.get(i).getPrc() * list.get(i).getReturnQty());
                    lineDcAmt  = 0.0;
                    list.get(i).setAmt(lineAmt);
                    list.get(i).setTaxAmt(lineAmt - (lineAmt/(1 + vatInfoVO.getVatApplyRate())));
                    list.get(i).setTaxDdctAmt(lineAmt/(1 + vatInfoVO.getVatApplyRate()));
                }
                */

                /********************************************************************
                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                 * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                 * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                 * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                 ********************************************************************/
                /*
                searchItemMovingAvgPrcVO.setItemCd(list.get(i).getItemCd()); //부품코드
                searchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getGiStrgeCd()); //창고코드
                searchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

                itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                //이동평균가격 정보가 존재하는 경우
                if(itemMovingAvgPrcVO != null){


                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(list.get(i).getReturnQty()));
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


                lineAmt    = (list.get(i).getPrc() * list.get(i).getReturnQty());
                lineDcAmt  = 0.0;
                list.get(i).setAmt(lineAmt);
                list.get(i).setTaxAmt(lineAmt - (lineAmt/(1 + vatInfoVO.getVatApplyRate())));
                list.get(i).setTaxDdctAmt(lineAmt/(1 + vatInfoVO.getVatApplyRate()));


                list.get(i).setOrdQty(list.get(i).getReturnQty());
                list.get(i).setEndQty(list.get(i).getReturnQty());
                list.get(i).setGiStatCd("07");

                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/
                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(pltCd);
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setLocCd(list.get(i).getGiLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(list.get(i).getReturnQty());
                mvtDocItemVO.setStrgeCd(list.get(i).getGiStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                //mvtDocItemVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());
                //mvtDocItemVO.setMovingAvgAmt(itemMovingAvgPrcVO.getMovingAvgPrc() * list.get(i).getReturnQty());
                mvtDocItemVO.setRefDocNo(list.get(i).getParSaleOrdNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getParSaleOrdLineNo());
                mvtDocItemVO.setMvtReasonCont("Return SaleItem");
                mvtDocItemVO.setGiDocNo(list.get(i).getRefDocNo());
                mvtDocItemVO.setGiDocLineNo(list.get(i).getRefDocLineNo());

                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/

                mvtItemList.add(mvtDocItemVO);


                dcBefTotAmt        = dcBefTotAmt + (list.get(i).getPrc() * list.get(i).getReturnQty());
                dcAmt              = dcAmt + lineDcAmt;
                totAmt             = totAmt + lineAmt;

                if(list.get(i).getReturnQty() == null || list.get(i).getReturnQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //부품정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
                }

                resultCnt = partsSaleOrdDAO.insertPartsSaleOrdItem(list.get(i));

                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }

                partsSaleOrdLineNo = partsSaleOrdLineNo + 1;
            }

            returnPartsSaleOrdVO.setDcAmt(dcAmt);
            returnPartsSaleOrdVO.setDcBefTotAmt(dcBefTotAmt);
            returnPartsSaleOrdVO.setTotAmt(totAmt);
            if( (dcAmt > 0) && (totAmt > 0)){
                returnPartsSaleOrdVO.setDcRate((dcAmt/totAmt) * 100);
            }

            //  3. 부품판매 헤더를 생성한다.
            resultCnt = partsSaleOrdDAO.insertPartsSaleOrd(returnPartsSaleOrdVO);

            if(resultCnt < 1){
                //부품판매 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //출고 확정이 처리되지 않았습니다.
               throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }

            //생성된 수불 정보를 기타출고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                mvtPartsSaleOrdItemVO = new PartsSaleOrdItemVO();

                mvtPartsSaleOrdItemVO.setDlrCd(dlrCd);
                mvtPartsSaleOrdItemVO.setRegUsrId(userId);
                mvtPartsSaleOrdItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                mvtPartsSaleOrdItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                mvtPartsSaleOrdItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                //toolGiVO.getToolGiTp()

                mvtPartsSaleOrdItemVO.setParSaleOrdNo(mvtSaveItemList.get(i).getRefDocNo());
                mvtPartsSaleOrdItemVO.setParSaleOrdLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                resultCnt = partsSaleOrdDAO.updateParSaleOrdItemMvtInfo(mvtPartsSaleOrdItemVO);

                if(resultCnt < 1){
                    //기타출고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
                }

                //returnPartsSaleOrdVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                //returnPartsSaleOrdVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
            }

            //resultCnt = partsSaleOrdDAO.updateParSaleOrdMvtInfo(returnPartsSaleOrdVO);

            //if(resultCnt < 1){
                //기타출고 확정 실패.
            //    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            //}



            resultCnt = partsSaleOrdDAO.updatePartsSaleUpdateDt(partsSaleOrdVO);

            if(resultCnt < 1){
                //기타출고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }

            return partsSaleOrdVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#cnfmPartsSaleOrd(java.util.List, chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public PartsSaleOrdVO cnfmPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO)
            throws Exception {

        try{
            int    partsSaleOrdLineNo = 1;
            int    resultCnt       = 0;
            String pltCd  = LoginUtil.getPltCd();
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            PartsSaleOrdItemVO mvtPartsSaleOrdItemVO = new PartsSaleOrdItemVO();
            //부품요청 정보
            //IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
            //IssueReqVO       issueReqVO       = new IssueReqVO();
            //IssueReqSaveVO   issueReqSaveVO   = new IssueReqSaveVO();
            //List<IssueReqDetailVO> issueReqDetailList = new ArrayList<IssueReqDetailVO>();

            chkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);

            // [부품판매]출고예정정보
            GrGiScheduleVO partsSaleGrGiScheduleVO = new GrGiScheduleVO();

            // 수불 생성(판매출고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            mvtDocVO.setMvtTp("71");  //판매출고

            if(partsSaleOrdVO.getCustTp().equals("01")){ //거래처 유형이 '01': 일반인경우
                mvtDocVO.setCustNo(partsSaleOrdVO.getCustCd());
                mvtDocVO.setBpCd(" ");
            }else if(partsSaleOrdVO.getCustTp().equals("02")){ //거래처 유형이 '02': 거래처인경우
                mvtDocVO.setBpCd(partsSaleOrdVO.getCustCd());
                mvtDocVO.setCustNo(" ");
            }

            // 1. 부품판매 상태를 설정한다.
            partsSaleOrdVO.setOrdStatCd("02"); //"02" 확정상태.
            partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());


            /*
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setRegUsrId(LoginUtil.getUserId());
            issueReqVO.setPltCd(LoginUtil.getPltCd());

            issueReqVO.setSerPrsnId(partsSaleOrdVO.getSalePrsnId());  //담당자(?)
            issueReqVO.setCustCd(partsSaleOrdVO.getCustCd());
            issueReqVO.setCustNm(partsSaleOrdVO.getCustNm());

            issueReqVO.setParGiTp("SA");  //부품요청문서
            issueReqVO.setParReqStatCd("01");  //부품요청상태(요청)
            issueReqVO.setCancYn("N");

            issueReqVO.setRoDocNo(partsSaleOrdVO.getParSaleOrdNo());

            issueReqSaveVO.setIssueReqVO(issueReqVO);
            */

            if( (partsSaleOrdVO.getCustTp() == null) || (partsSaleOrdVO.getCustTp().isEmpty())){
                //고객유형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custTp", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getSaleTp() == null) || (partsSaleOrdVO.getSaleTp().isEmpty())){
                //판매유형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.saleType", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getCustNm() == null) || (partsSaleOrdVO.getCustNm().isEmpty())){
                //고객정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getSalePrsnId() == null) || (partsSaleOrdVO.getSalePrsnId().isEmpty())){
                //담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prsNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getDcBefTotAmt() == null) || (partsSaleOrdVO.getDcBefTotAmt() <= 0)){
                //할인전 총액이 0보다 작거나 같을 수 없습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.totAmtBefDc", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getDcAmt() == null) || (partsSaleOrdVO.getDcAmt() < 0)){
                //할인금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("sal.lbl.dcAmt", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getTotAmt() == null) || (partsSaleOrdVO.getTotAmt() <= 0)){
                //총금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.totAmt", null, LocaleContextHolder.getLocale())});
            }


            //부품판매 헤더정보를 확정처리한다.
            resultCnt = partsSaleOrdDAO.confirmPartsSaleOrdStat(partsSaleOrdVO);

            if(resultCnt < 1){
                //부품판매 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }


            // 4. 부품판매 부품정보를 수정한다.(완료수량 셋팅)
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();

                /*  부품 상태 아직 사용안함(정의안됨)
                if( (list.get(i).getItemStatCd() == null) || (list.get(i).getItemStatCd().isEmpty())){
                    //부품상태정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
                }*/

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //부품정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
                }

                /********************************************************************
                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                 * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                 * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                 * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                 ********************************************************************/
                /*
                searchItemMovingAvgPrcVO.setItemCd(list.get(i).getItemCd()); //부품코드
                searchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getGiStrgeCd()); //창고코드
                searchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

                itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                //이동평균가격 정보가 존재하는 경우
                if(itemMovingAvgPrcVO != null){


                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(list.get(i).getEndQty()));
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

                /**********************************
                 * 부품판매에 대한  출고요청정보 생성 셋팅.
                 *********************************/
                /*
                issueReqDetailVO = new IssueReqDetailVO();

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setParReqStatCd("01"); // 부품요청상태 01(요청)
                issueReqDetailVO.setCancYn("N");
                issueReqDetailVO.setParGiTp("SA");  //부품요청문서
                issueReqDetailVO.setItemCd(list.get(i).getItemCd());
                issueReqDetailVO.setReqQty(list.get(i).getOrdQty());
                issueReqDetailVO.setUnitCd(list.get(i).getUnitCd());
                issueReqDetailVO.setReqStrgeCd(list.get(i).getGiStrgeCd());
                issueReqDetailVO.setGiStrgeCd(list.get(i).getGiStrgeCd());
                issueReqDetailVO.setRoDocNo(list.get(i).getParSaleOrdNo());
                issueReqDetailVO.setRoLineNo(list.get(i).getParSaleOrdLineNo());
                */
                /**********************************
                 * 부품판매에 대한 출고요청정보 생성 셋팅 종료.
                 *********************************/

                /**********************************
                 * 구매오더에 대한 입출고 예정정보 생성 셋팅.(출고로 인한 출고예정정보 삭제)
                 *********************************/
                partsSaleGrGiScheduleVO = new GrGiScheduleVO();

                partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                partsSaleGrGiScheduleVO.setStrgeCd(list.get(i).getGiStrgeCd());
                partsSaleGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                partsSaleGrGiScheduleVO.setGrGiDocNo(list.get(i).getParSaleOrdNo());
                partsSaleGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getParSaleOrdLineNo());
                partsSaleGrGiScheduleVO.setGrGiTp("I");
                partsSaleGrGiScheduleVO.setProcQty(list.get(i).getOrdQty() * -1);
                partsSaleGrGiScheduleVO.setGrGiQty(list.get(i).getOrdQty());
                partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
                partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                 *********************************/

                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/
                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(pltCd);
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setLocCd(list.get(i).getGiLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(list.get(i).getEndQty());
                mvtDocItemVO.setStrgeCd(list.get(i).getGiStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                mvtDocItemVO.setRefDocNo(list.get(i).getParSaleOrdNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getParSaleOrdLineNo());
                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/


                mvtItemList.add(mvtDocItemVO);


                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());


                resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

                if(resultCnt < 1){
                    //부품 수정 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.modifyFailedParam", new String[]{list.get(i).getItemCd()});
                }

                resultCnt = partsSaleOrdDAO.cnfmPartsSaleOrdItem(list.get(i));


                if(resultCnt < 1){
                    //부품 수정 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.modifyFailedParam", new String[]{list.get(i).getItemCd()});
                }

                //issueReqDetailList.add(issueReqDetailVO);

                partsSaleOrdLineNo = partsSaleOrdLineNo + 1;
            }

            //issueReqSaveVO.setIssueReqDetailVO(issueReqDetailList);

            //부품요청정보를 생성한다.
            //issueReqSaveVO = issueReqService.insertIssueReq(issueReqSaveVO);

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //출고 확정이 처리되지 않았습니다.
               throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }

            //생성된 수불 정보를 기타출고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                mvtPartsSaleOrdItemVO = new PartsSaleOrdItemVO();

                mvtPartsSaleOrdItemVO.setDlrCd(dlrCd);
                mvtPartsSaleOrdItemVO.setRegUsrId(userId);
                mvtPartsSaleOrdItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                mvtPartsSaleOrdItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                mvtPartsSaleOrdItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                //toolGiVO.getToolGiTp()

                mvtPartsSaleOrdItemVO.setParSaleOrdNo(mvtSaveItemList.get(i).getRefDocNo());
                mvtPartsSaleOrdItemVO.setParSaleOrdLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                resultCnt = partsSaleOrdDAO.updateParSaleOrdItemMvtInfo(mvtPartsSaleOrdItemVO);

                if(resultCnt < 1){
                    //기타출고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
                }

                //partsSaleOrdVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                //partsSaleOrdVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
            }

            //resultCnt = partsSaleOrdDAO.updateParSaleOrdMvtInfo(partsSaleOrdVO);

            //if(resultCnt < 1){
                //기타출고 확정 실패.
            //    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            //}

            return partsSaleOrdVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#cnfmPartsSaleOrd(java.util.List, chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public PartsSaleOrdVO cnfmPartsItemSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO)
    throws Exception {

        try{
            int partsSaleOrdLineNo = 1;
            int resultCnt          = 0;
            int regItemCnt         = 0;
            double orgGrGiQty      = 0;

            String pltCd  = LoginUtil.getPltCd();
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            PartsSaleOrdItemVO mvtPartsSaleOrdItemVO = new PartsSaleOrdItemVO();

            chkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);

           // PartsSaleOrdVO     chkPartsSaleOrdVO     = new PartsSaleOrdVO();
           //PartsSaleOrdItemVO chkPartsSaleOrdItemVO = new PartsSaleOrdItemVO();
            //부품요청 정보
            //IssueReqDetailVO issueReqDetailVO = new IssueReqDetailVO();
            //IssueReqVO       issueReqVO       = new IssueReqVO();
            //IssueReqSaveVO   issueReqSaveVO   = new IssueReqSaveVO();
            //List<IssueReqDetailVO> issueReqDetailList = new ArrayList<IssueReqDetailVO>();

            //chkPartsSaleOrdVO = partsSaleOrdDAO.chkStatusPartsSaleOrdByKey(dlrCd, partsSaleOrdVO.getParSaleOrdNo());

            //if(!chkPartsSaleOrdVO.getOrdStatCd().equals(partsSaleOrdVO.getOrdStatCd())){
                //판매유형정보가 존재하지 않습니다.
            //    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.partsSaleStat", null, LocaleContextHolder.getLocale())});
            //}

            // 수불 생성(판매출고)
            MvtDocVO mvtDocVO = new MvtDocVO();
            MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            //[부품판매]입출고예정정보
            GrGiScheduleVO partsSaleGrGiScheduleVO = new GrGiScheduleVO();

            //[이동평균가격]부품이동평균가격정보
            //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
            //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

            //int    itemMovingAvgPrcSeq  = 0;

            mvtDocVO.setMvtTp("71");  //판매출고

            if(partsSaleOrdVO.getCustTp().equals("01")){ //거래처 유형이 '01': 일반인경우
                mvtDocVO.setCustNo(partsSaleOrdVO.getCustCd());
                mvtDocVO.setBpCd(" ");
            }else if(partsSaleOrdVO.getCustTp().equals("02")){ //거래처 유형이 '02': 거래처인경우
                mvtDocVO.setBpCd(partsSaleOrdVO.getCustCd());
                mvtDocVO.setCustNo(" ");
            }

            // 1. 부품판매 상태를 설정한다.
            partsSaleOrdVO.setOrdStatCd("02"); //"02" 확정상태.
            partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());


            /*
            issueReqVO.setDlrCd(LoginUtil.getDlrCd());
            issueReqVO.setRegUsrId(LoginUtil.getUserId());
            issueReqVO.setPltCd(LoginUtil.getPltCd());

            issueReqVO.setSerPrsnId(partsSaleOrdVO.getSalePrsnId());  //담당자(?)
            issueReqVO.setCustCd(partsSaleOrdVO.getCustCd());
            issueReqVO.setCustNm(partsSaleOrdVO.getCustNm());

            issueReqVO.setParGiTp("SA");  //부품요청문서
            issueReqVO.setParReqStatCd("01");  //부품요청상태(요청)
            issueReqVO.setCancYn("N");

            issueReqVO.setRoDocNo(partsSaleOrdVO.getParSaleOrdNo());

            issueReqSaveVO.setIssueReqVO(issueReqVO);
             */

            if( (partsSaleOrdVO.getCustTp() == null) || (partsSaleOrdVO.getCustTp().isEmpty())){
                //고객유형정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custTp", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getSaleTp() == null) || (partsSaleOrdVO.getSaleTp().isEmpty())){
                //판매유형정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.saleType", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getCustNm() == null) || (partsSaleOrdVO.getCustNm().isEmpty())){
                //고객정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getSalePrsnId() == null) || (partsSaleOrdVO.getSalePrsnId().isEmpty())){
                //담당자정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prsNm", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getDcBefTotAmt() == null) || (partsSaleOrdVO.getDcBefTotAmt() < 0)){
                //할인전 총액이 0보다 작거나 같을 수 없습니다.
                throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.totAmtBefDc", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getDcAmt() == null) || (partsSaleOrdVO.getDcAmt() < 0)){
                //할인금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("sal.lbl.dcAmt", null, LocaleContextHolder.getLocale())});
            }

            if( (partsSaleOrdVO.getTotAmt() == null) || (partsSaleOrdVO.getTotAmt() < 0)){
                //총금액이 0보다 작을 수 없습니다.
                throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.totAmt", null, LocaleContextHolder.getLocale())});
            }

            // 4. 부품판매 부품정보를 수정한다.(완료수량 셋팅)
            for(int i = 0; i < list.size(); i++){
                mvtDocItemVO = new MvtDocItemVO();
                //chkPartsSaleOrdItemVO = new PartsSaleOrdItemVO();

                //chkPartsSaleOrdItemVO = partsSaleOrdDAO.chkStatusPartsSaleOrdItemByKey(dlrCd, list.get(i).getParSaleOrdNo(),list.get(i).getParSaleOrdLineNo());

                //if(!chkPartsSaleOrdItemVO.getItemStatCd().equals(list.get(i).getItemStatCd())){
                //    //판매유형정보가 존재하지 않습니다.
                //    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("par.lbl.partsSaleStat", null, LocaleContextHolder.getLocale())});
                //}

                //orgGrGiQty   = 0;

                /*  부품 상태 아직 사용안함(정의안됨)
                if( (list.get(i).getItemStatCd() == null) || (list.get(i).getItemStatCd().isEmpty())){
                    //부품상태정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
                }*/

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                    //부품정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())});
                }

                /********************************************************************
                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                 * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                 * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                 * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                 ********************************************************************/
                /*
                searchItemMovingAvgPrcVO.setItemCd(list.get(i).getItemCd()); //부품코드
                searchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getGiStrgeCd()); //창고코드
                searchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

                itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                //이동평균가격 정보가 존재하는 경우
                if(itemMovingAvgPrcVO != null){


                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(list.get(i).getOrdQty()));
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

                /**********************************
                 * 부품판매에 대한  출고요청정보 생성 셋팅.
                 *********************************/
                /*
                issueReqDetailVO = new IssueReqDetailVO();

                issueReqDetailVO.setDlrCd(LoginUtil.getDlrCd());
                issueReqDetailVO.setRegUsrId(LoginUtil.getUserId());
                issueReqDetailVO.setParReqStatCd("01"); // 부품요청상태 01(요청)
                issueReqDetailVO.setCancYn("N");
                issueReqDetailVO.setParGiTp("SA");  //부품요청문서
                issueReqDetailVO.setItemCd(list.get(i).getItemCd());
                issueReqDetailVO.setReqQty(list.get(i).getOrdQty());
                issueReqDetailVO.setUnitCd(list.get(i).getUnitCd());
                issueReqDetailVO.setReqStrgeCd(list.get(i).getGiStrgeCd());
                issueReqDetailVO.setGiStrgeCd(list.get(i).getGiStrgeCd());
                issueReqDetailVO.setRoDocNo(list.get(i).getParSaleOrdNo());
                issueReqDetailVO.setRoLineNo(list.get(i).getParSaleOrdLineNo());
                 */
                /**********************************
                 * 부품판매에 대한 출고요청정보 생성 셋팅 종료.
                 *********************************/

                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/
                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(pltCd);
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setLocCd(list.get(i).getGiLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getUnitCd());
                mvtDocItemVO.setItemQty(list.get(i).getOrdQty());
                mvtDocItemVO.setStrgeCd(list.get(i).getGiStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setSalePrc(list.get(i).getPrc());
                mvtDocItemVO.setSaleAmt(list.get(i).getAmt());
                mvtDocItemVO.setRefDocNo(list.get(i).getParSaleOrdNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getParSaleOrdLineNo());
                /**********************************
                 * 수불정보 생성 셋팅
                 *********************************/


                mvtItemList.add(mvtDocItemVO);

                /******************************************************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅.(확정시 등록 시와 수량이 다른 경우 실행)
                 ******************************************************************/

                partsSaleGrGiScheduleVO = new GrGiScheduleVO();

                partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                partsSaleGrGiScheduleVO.setStrgeCd(list.get(i).getGiStrgeCd());
                partsSaleGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                partsSaleGrGiScheduleVO.setGrGiDocNo(list.get(i).getParSaleOrdNo());
                partsSaleGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getParSaleOrdLineNo());
                partsSaleGrGiScheduleVO.setGrGiTp("I");


                orgGrGiQty = grGiScheduleService.selectGrGiDocOrgQty(partsSaleGrGiScheduleVO);

                //차이수량이 존재하는 경우
                /*
                if((orgGrGiQty - list.get(i).getOrdQty()) != 0){
                    partsSaleGrGiScheduleVO.setProcQty(list.get(i).getOrdQty() - orgGrGiQty);
                    partsSaleGrGiScheduleVO.setGrGiQty(list.get(i).getOrdQty());
                    partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
                    partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                    resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

                    if(resultCnt < 1){
                        //부품 수정 실패.[list.get(i).getItemCd()]
                        throw processException(" global.err.modifyFailedParam", new String[]{list.get(i).getItemCd()});
                    }
                }
                */

                //출고 확정 시 등록시와 수량 차이가 있는 경우 등록수량 만큼만 예정수량을 빼준다. 등록 수량으로 예정수량을 생성했으므로.

                /**********************************
                 * 부품판매에 대한 출고 예정정보 생성 셋팅 끝.
                 *********************************/

                /**********************************
                 * 판매확정에 대한 입출고 예정정보 생성 셋팅.(출고로 인한 출고예정정보 삭제)
                 *********************************/
                partsSaleGrGiScheduleVO = new GrGiScheduleVO();

                partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                partsSaleGrGiScheduleVO.setStrgeCd(list.get(i).getGiStrgeCd());
                partsSaleGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                partsSaleGrGiScheduleVO.setGrGiDocNo(list.get(i).getParSaleOrdNo());
                partsSaleGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getParSaleOrdLineNo());
                partsSaleGrGiScheduleVO.setGrGiTp("I");
                partsSaleGrGiScheduleVO.setProcQty(orgGrGiQty * -1);
                partsSaleGrGiScheduleVO.setGrGiQty(orgGrGiQty);
                partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
                partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 판매확정에 대한 입출고 예정정보 생성 셋팅 끝.
                 *********************************/


                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

                if(resultCnt < 1){
                    //부품 수정 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.modifyFailedParam", new String[]{list.get(i).getItemCd()});
                }

                resultCnt = partsSaleOrdDAO.cnfmPartsSaleOrdItem(list.get(i));


                if(resultCnt < 1){
                    //부품 수정 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.modifyFailedParam", new String[]{list.get(i).getItemCd()});
                }

                //issueReqDetailList.add(issueReqDetailVO);

                partsSaleOrdLineNo = partsSaleOrdLineNo + 1;
            }

            //확정시 아직 남아있는 등록상태인 판매부품이 존재하는지 조회한다.
            regItemCnt = partsSaleOrdDAO.selectPartsSaleOrdItemRegCnt(partsSaleOrdVO);

            //등록되어있는 판매부품이 없는 경우 헤더 상태 변경 실행.
            if(regItemCnt < 1){
              //부품판매 헤더정보를 확정처리한다.
                resultCnt = partsSaleOrdDAO.confirmPartsSaleOrdStat(partsSaleOrdVO);

                if(resultCnt < 1){
                    //부품판매 수정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
                }
            }else{
                resultCnt = partsSaleOrdDAO.updatePartsSaleUpdateDt(partsSaleOrdVO);

                if(resultCnt < 1){
                    //기타출고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
                }
            }

            //issueReqSaveVO.setIssueReqDetailVO(issueReqDetailList);

            //부품요청정보를 생성한다.
            //issueReqSaveVO = issueReqService.insertIssueReq(issueReqSaveVO);

            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                //출고 확정이 처리되지 않았습니다.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }

            //생성된 수불 정보를 기타출고 부품정보에 반영한다.
            for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
                mvtPartsSaleOrdItemVO = new PartsSaleOrdItemVO();

                mvtPartsSaleOrdItemVO.setDlrCd(dlrCd);
                mvtPartsSaleOrdItemVO.setRegUsrId(userId);
                mvtPartsSaleOrdItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
                mvtPartsSaleOrdItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                mvtPartsSaleOrdItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

                //toolGiVO.getToolGiTp()

                mvtPartsSaleOrdItemVO.setParSaleOrdNo(mvtSaveItemList.get(i).getRefDocNo());
                mvtPartsSaleOrdItemVO.setParSaleOrdLineNo(mvtSaveItemList.get(i).getRefDocLineNo());

                resultCnt = partsSaleOrdDAO.updateParSaleOrdItemMvtInfo(mvtPartsSaleOrdItemVO);

                if(resultCnt < 1){
                    //기타출고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
                }

                //partsSaleOrdVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
                //partsSaleOrdVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
            }

            //개별 판매확정이 가능하기때문에 의미없음.
            //resultCnt = partsSaleOrdDAO.updateParSaleOrdMvtInfo(partsSaleOrdVO);

            //if(resultCnt < 1){
                //기타출고 확정 실패.
              //  throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            //}

            return partsSaleOrdVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }


    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdByKey(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public PartsSaleOrdVO selectPartsSaleOrdByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdByKey(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdItemByKey(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO)
            throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdItemByKey(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdCalcItemByKey(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartCalculateVO> selectPartsSaleOrdCalcItemByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO)
            throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdCalcItemByKey(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#cancelPartsSaleOrd(chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public int cancelPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO) throws Exception {

        int    resultCnt       = 0;

     // [부품판매]출고예정정보
        GrGiScheduleVO partsSaleGrGiScheduleVO = new GrGiScheduleVO();

        // 1. 부품판매 상태를 설정한다.
        partsSaleOrdVO.setOrdStatCd("03"); //"03" 취소상태.
        partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
        partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());

        chkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);

        // 4. 부품판매 부품정보를 생성한다.
        for(int i = 0; i < list.size(); i++){
            /**********************************
             * 부품판매에 대한 출고 예정정보 생성 셋팅.
             *********************************/
            partsSaleGrGiScheduleVO = new GrGiScheduleVO();

            partsSaleGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
            partsSaleGrGiScheduleVO.setStrgeCd(list.get(i).getGiStrgeCd());
            partsSaleGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
            partsSaleGrGiScheduleVO.setGrGiDocNo(list.get(i).getParSaleOrdNo());
            partsSaleGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getParSaleOrdLineNo());
            partsSaleGrGiScheduleVO.setGrGiTp("I");
            partsSaleGrGiScheduleVO.setProcQty(list.get(i).getOrdQty() * -1);
            partsSaleGrGiScheduleVO.setGrGiQty(list.get(i).getOrdQty());
            partsSaleGrGiScheduleVO.setBpCd(partsSaleOrdVO.getCustCd());
            partsSaleGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

            /**********************************
             * 부품판매에 대한 출고 예정정보 생성 셋팅 끝.
             *********************************/

            list.get(i).setRegUsrId(LoginUtil.getUserId());

            resultCnt = partsSaleOrdDAO.cancelPartsSaleOrdItem(list.get(i));

            if(resultCnt < 1){
                //부품판매 삭제 실패.
                throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
            }

            resultCnt = grGiScheduleService.createGrGiSchedule(partsSaleGrGiScheduleVO);

            if(resultCnt < 1){
                //부품 수정 실패
                throw processException(" global.err.modifyFailedParam", new String[]{list.get(i).getItemCd()});
            }
        }

        resultCnt = partsSaleOrdDAO.cancelPartsSaleOrd(partsSaleOrdVO);

        if(resultCnt < 1){
            //부품판매 삭제 실패.
            throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
        }

        return resultCnt;
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#modifyPartsSaleOrdDcRates(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void modifyPartsSaleOrdDcRates(BaseSaveVO<PartCalculateVO> obj, PartsSaleOrdVO partsSaleOrdVO) throws Exception {
        try{
            int resultCnt          = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();


            partsSaleOrdVO.setDlrCd(LoginUtil.getDlrCd());
            partsSaleOrdVO.setRegUsrId(LoginUtil.getUserId());

            chkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);

            for(PartCalculateVO itemVO : obj.getUpdateList()){


                if(itemVO.getDcRate() < 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.dcRate", null, LocaleContextHolder.getLocale())});
                }

                itemVO.setDlrCd(dlrCd);
                itemVO.setUpdtUsrId(userId);

                resultCnt = partsSaleOrdDAO.updatePartsSaleOrdItemDcRate(itemVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }

            }

            partsSaleOrdDAO.updateCalculateInfo(partsSaleOrdVO);


        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#modifyPartsSaleOrdStat(chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public int modifyPartsSaleOrdStat(PartsSaleOrdVO partsSaleOrdVO) throws Exception {
        return partsSaleOrdDAO.modifyPartsSaleOrdStat(partsSaleOrdVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#updateCalculateInfo(chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public int updateCalculateInfo(PartsSaleOrdVO partsSaleOrdVO) throws Exception {

        return partsSaleOrdDAO.updateCalculateInfo(partsSaleOrdVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdList(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartsSaleOrdVO> selectPartsSaleOrdList(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdList(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdListCnt(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public int selectPartsSaleOrdListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdListCnt(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdList(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartsSaleOrdVO> selectPartsSaleOrdPopList(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdPopList(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdListCnt(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public int selectPartsSaleOrdPopListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdPopListCnt(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdForCalcList(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartsSaleOrdVO> selectPartsSaleOrdForCalcList(PartsSaleOrdSearchVO partsSaleOrdSearchVO)
            throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdForCalcList(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdForCalcListCnt(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public int selectPartsSaleOrdForCalcListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdForCalcListCnt(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdItemList(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemList(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdItemList(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdItemListCnt(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public int selectPartsSaleOrdItemListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdItemListCnt(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdItemByCondition(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByCondition(PartsSaleOrdSearchVO partsSaleOrdSearchVO)
            throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdItemByCondition(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdItemByConditionCnt(chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public int selectPartsSaleOrdItemByConditionCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdItemByConditionCnt(partsSaleOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdByEstimateKey(java.lang.String, java.lang.String)
     */
    @Override
    public PartsSaleOrdVO selectPartsSaleOrdByEstimateKey(String dlrCd, String estimateDocNo) throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdByEstimateKey(dlrCd, estimateDocNo);
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdItemByEstimateKey(java.lang.String, java.lang.String)
     */
    @Override
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByEstimateKey(String dlrCd, String estimateDocNo)
            throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdItemByEstimateKey(dlrCd, estimateDocNo);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPartsSaleOrdNo()
     */
    @Override
    public String selectNextPartsSaleOrdNo() throws Exception {
        try {
            return partsSaleOrdNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#selectPartsSaleOrdItemExcelUploadByKey(chn.bhmc.dms.par.ism.vo.PartsSaleOrdItemVO)
     */
    @Override
    public PartsSaleOrdItemVO selectPartsSaleOrdItemExcelUploadByKey(PartsSaleOrdItemVO partsSaleOrdItemVO)
            throws Exception {

        return partsSaleOrdDAO.selectPartsSaleOrdItemExcelUploadByKey(partsSaleOrdItemVO);
    }

    public void chkPartsSaleOrdNoUpdateSomebody(PartsSaleOrdVO partsSaleOrdVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = partsSaleOrdDAO.selectPartsSaleOrdUpdtDtByKey(partsSaleOrdVO);

            if(!updtDtStrNow.equals(partsSaleOrdVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.parSaleOrdNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.ism.service.PartsSaleOrdService#fnChkPartsSaleOrdNoUpdateSomebody(chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO)
     */
    @Override
    public boolean fnChkPartsSaleOrdNoUpdateSomebody(PartsSaleOrdVO partsSaleOrdVO) throws Exception {
        chkPartsSaleOrdNoUpdateSomebody(partsSaleOrdVO);
        return true;
    }



    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        String jobType = "";
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        PartsSaleOrdSearchVO searchVO = new PartsSaleOrdSearchVO();

        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        List<StorageVO> storageList        = new ArrayList<StorageVO>();
        List<String> statCdList = new ArrayList<String>();
        String sStatCd;
        String[] arrayStatCdStr;

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageSearchVO.setsStrgeSaleAccYn("Y");//용품창고 제외.
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        searchVO.setsCustTp((String)params.get("sCustTp"));
        searchVO.setsParSaleOrdNo((String)params.get("sParSaleOrdNo"));
        searchVO.setsSaleTp((String)params.get("sSaleTp"));
        searchVO.setsCustCd((String)params.get("sCustCd"));
        searchVO.setsCustNm((String)params.get("sCustNm"));
        searchVO.setsSalePrsnId((String)params.get("sSalePrsnId"));
        searchVO.setsSalePrsnNm((String)params.get("sSalePrsnNm"));
        searchVO.setsCustTelNo((String)params.get("sCustTelNo"));
        searchVO.setsItemCnt(!params.get("sItemCntFr").toString().equals("null") ? Integer.parseInt(params.get("sItemCntFr").toString()) : 0);
        searchVO.setsItemCnt(!params.get("sItemCntTo").toString().equals("null") ? Integer.parseInt(params.get("sItemCntTo").toString()) : 0);
        searchVO.setsItemQty(!params.get("sItemQtyFr").toString().equals("null") ? Double.parseDouble(params.get("sItemQtyFr").toString()) : 0.0);
        searchVO.setsItemQty(!params.get("sItemQtyTo").toString().equals("null") ? Double.parseDouble(params.get("sItemQtyTo").toString()) : 0.0);
        searchVO.setsItemAmtFr(!params.get("sItemAmtFr").toString().equals("null") ? Double.parseDouble(params.get("sItemAmtFr").toString()) : 0.0);
        searchVO.setsItemAmtTo(!params.get("sItemAmtTo").toString().equals("null") ? Double.parseDouble(params.get("sItemAmtTo").toString()) : 0.0);


        if (StringUtils.isNotEmpty((String)params.get("sOrdStatLst"))) {
            sStatCd = (String)params.get("sOrdStatLst");
            arrayStatCdStr = sStatCd.split(",");
            statCdList = Arrays.asList(arrayStatCdStr);

            searchVO.setsOrdStatLst(statCdList);
        }
        //searchVO.setsOrdStatLst((List<String>)params.get("sOrdStatLst"));
       // searchVO.setsOrdStatLst(!params.get("sOrdStatLst").toString().equals("null") ? (List<String>)params.get("sOrdStatLst") : null);
        if (StringUtils.isNotEmpty((String)params.get("sOrdDtFr"))) {
            searchVO.setsOrdDtFr(DateUtil.convertToDate((String)params.get("sOrdDtFr")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sOrdDtTo"))) {
            searchVO.setsOrdDtTo(DateUtil.convertToDate((String)params.get("sOrdDtTo")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sCalcDtFr"))) {
            searchVO.setsCalcDtFr(DateUtil.convertToDate((String)params.get("sCalcDtFr")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sCalcDtTo"))) {
            searchVO.setsCalcDtTo(DateUtil.convertToDate((String)params.get("sCalcDtTo")));
        }

        jobType = params.get("jobType").toString();
        List<CommonCodeVO> itemDstinList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd);
        HashMap<String, String> itemDstinMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : itemDstinList ){
            itemDstinMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> prcTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR131", null, langCd);
        HashMap<String, String> prcTpMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : prcTpList ){
            prcTpMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> custTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR321", null, langCd);
        HashMap<String, String> custTpMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : custTpList ){
            custTpMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> ordStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR323", null, langCd);
        HashMap<String, String> ordStatCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : ordStatCdList ){
            ordStatCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> saleTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR322", null, langCd);
        HashMap<String, String> saleTpMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : saleTpList ){
            saleTpMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> roStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SER030", null, langCd);
        HashMap<String, String> roStatCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : roStatCdList ){
            roStatCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        HashMap<String, String> storageMap = new HashMap<String, String>();
        for( StorageVO storageVO : storageList ){
            storageMap.put(storageVO.getStrgeCd(), storageVO.getStrgeNm());
        }

        searchVO.setsDlrCd(LoginUtil.getDlrCd());


        context.putVar("dlrCd",LoginUtil.getDlrCd());
        context.putVar("dlrNm",LoginUtil.getDlrNm());
        if(jobType.equals("partsSaleOrdListDownload")){
            List<PartsSaleOrdVO> list = new ArrayList<PartsSaleOrdVO>();
            ArrayList<PartsSaleOrdVO> rsltList = new ArrayList<PartsSaleOrdVO>();
             list = partsSaleOrdDAO.selectPartsSaleOrdList(searchVO);

            for( PartsSaleOrdVO sResultVO : list ){

                sResultVO.setOrdStatCd( ordStatCdMap.get(String.valueOf(sResultVO.getOrdStatCd())));
                sResultVO.setSaleTp( saleTpMap.get(String.valueOf(sResultVO.getSaleTp())));
                sResultVO.setCustTp( custTpMap.get(String.valueOf(sResultVO.getCustTp())));

                rsltList.add(sResultVO);
            }

            context.putVar("items", rsltList);
        }else if(jobType.equals("partsSaleOrdDetailListDownload")){
            List<PartsSaleOrdItemVO> list = new ArrayList<PartsSaleOrdItemVO>();
            ArrayList<PartsSaleOrdItemVO> rsltList = new ArrayList<PartsSaleOrdItemVO>();
            list = partsSaleOrdDAO.selectPartsSaleOrdItemByCondition(searchVO);

            for( PartsSaleOrdItemVO sResultVO : list ){
                sResultVO.setGiStatCd( ordStatCdMap.get(String.valueOf(sResultVO.getGiStatCd())));
                sResultVO.setItemDstinCd( itemDstinMap.get(String.valueOf(sResultVO.getItemDstinCd())));
                sResultVO.setSaleTp( saleTpMap.get(String.valueOf(sResultVO.getSaleTp())));
                sResultVO.setGiStrgeCd( storageMap.get(String.valueOf(sResultVO.getGiStrgeCd())));

                if(sResultVO.getDcRate() > 0){
                    sResultVO.setDcRate(sResultVO.getDcRate()/100);
                }
                rsltList.add(sResultVO);
            }

            context.putVar("items", rsltList);
        }else if(jobType.equals("partsSaleOrdCalcListDownload")){
            List<PartsSaleOrdVO> list = new ArrayList<PartsSaleOrdVO>();
            ArrayList<PartsSaleOrdVO> rsltList = new ArrayList<PartsSaleOrdVO>();
            list = partsSaleOrdDAO.selectPartsSaleOrdForCalcList(searchVO);

            for( PartsSaleOrdVO sResultVO : list ){     //      calcStatCd  roStatCdArr ordStatCdMap
                sResultVO.setCustTp( custTpMap.get(String.valueOf(sResultVO.getCustTp())));
                sResultVO.setSaleTp( saleTpMap.get(String.valueOf(sResultVO.getSaleTp())));
                sResultVO.setCalcStatCd(roStatCdMap.get(String.valueOf(sResultVO.getCalcStatCd())));
                sResultVO.setOrdStatCd( ordStatCdMap.get(String.valueOf(sResultVO.getOrdStatCd())));

                if(sResultVO.getDcRate() > 0){
                    sResultVO.setDcRate(sResultVO.getDcRate()/100);
                }
                rsltList.add(sResultVO);
            }

            context.putVar("items", rsltList);
        }

    }
}
