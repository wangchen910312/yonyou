package chn.bhmc.dms.par.pcm.service.impl;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.par.pcm.service.PurcCostSgstService;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.service.PurcRqstService;
import chn.bhmc.dms.par.pcm.service.dao.PurcOrdDAO;
import chn.bhmc.dms.par.pcm.vo.AmosPurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstVO;
import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 구매오더 구현 클래스
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
@Service("purcOrdService")
public class PurcOrdServiceImpl extends HService implements PurcOrdService, JxlsSupport {

    @Resource(name="purcOrdDAO")
    private PurcOrdDAO purcOrdDAO;

    @Resource(name="purcOrdNoIdgenService")
    EgovIdGnrService purcOrdNoIdgenService;

    /**
     * 입출고예정 서비스
     */
    @Resource(name="grGiScheduleService")
    GrGiScheduleService grGiScheduleService;

    /**
     * 구매요청 서비스
     */
    @Resource(name="purcRqstService")
    PurcRqstService purcRqstService;

    /**
     * 구매제시 서비스
     */
    @Resource(name="purcCostSgstService")
    PurcCostSgstService purcCostSgstService;

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 선수금헤더 서비스
     */
    @Resource(name="advanceReceivedInfoHeaderService")
    AdvanceReceivedInfoHeaderService advanceReceivedInfoHeaderService;

    /**
     * notificationMessageService
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#createOrd(java.util.List, chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public PurcOrdVO createOrd(List<PurcOrdItemVO> list, PurcOrdVO purcOrdVO) throws Exception {

        try{
            int    purcOrdLineNo     = 1;
            double purcAmt           = 0;
            //double taxDdctAmt        = 0;
            double totPurcAmt        = 0;
            int    resultCnt         = 0;

            //[구매요청]입출고예정정보
            GrGiScheduleVO purcReqGrGiScheduleVO = new GrGiScheduleVO();

            //[구매오더]입출고예정정보
            GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();

            //구매요청정보
            PurcRqstVO purcRqstVO = new PurcRqstVO();

            //구매제시정보
            PurcCostSgstVO purcCostSgstVO = new PurcCostSgstVO();

            // 1. 구매오더 번호를 생성한다.
            String purcOrdNo =  selectNextPurcOrdNo();
            purcOrdVO.setPurcOrdNo(purcOrdNo);

            // 2. 구매오더 상태를 설정한다.
            purcOrdVO.setPurcOrdStatCd("01"); //"01" 등록상태.

            //로컬업체 구매등록인 경우 아모스 구매번호를 딜러 구매번호와 동일하게 셋팅한다.
            if(!purcOrdVO.getBpTp().equals("01")){
                //로컬 구매 확정 시 아모스 구매번호, 딜러구매번호를 구매번호로 설정한다.
                purcOrdVO.setBmpOrdNo(purcOrdVO.getPurcOrdNo());
                purcOrdVO.setDlrOrdNo(purcOrdVO.getPurcOrdNo());
            }

            // 3. 구매오더 헤더를 생성한다.
            resultCnt = purcOrdDAO.insertPurcOrd(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 생성 실패.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            // 4. 구매오더 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){
                purcOrdLineNo = purcOrdDAO.selectPurcOrdMaxLineNo(purcOrdVO);

                if(list.get(i).getPurcQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                /*
                if(list.get(i).getPurcPrc() <= 0){
                  //구매단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                }
                */


                if(list.get(i).getPurcItemTp().equals("01") && list.get(i).getPurcReqNoList().size() > 0){
                    for(int j = 0; j < list.get(i).getPurcReqNoList().size(); j++){
                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅.
                         *********************************/
                        purcReqGrGiScheduleVO = new GrGiScheduleVO();
                        purcRqstVO            = new PurcRqstVO();

                        purcReqGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcReqGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcReqGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
                        purcReqGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                        purcReqGrGiScheduleVO.setGrGiDocNo(list.get(i).getPurcReqNoList().get(j));
                        purcReqGrGiScheduleVO.setGrGiDocLineNo(1);
                        purcReqGrGiScheduleVO.setGrGiTp("R");
                        purcReqGrGiScheduleVO.setProcQty(list.get(i).getPurcReqQtyList().get(j) * -1);
                        purcReqGrGiScheduleVO.setGrGiQty(list.get(i).getPurcReqQtyList().get(j));
                        //purcReqGrGiScheduleVO.setProcQty(list.get(i).getPurcReqQty() * -1);
                        //purcReqGrGiScheduleVO.setGrGiQty(list.get(i).getPurcReqQty());
                        purcReqGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                        purcReqGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        purcRqstVO.setRegUsrId(LoginUtil.getUserId());
                        purcRqstVO.setDlrCd(LoginUtil.getDlrCd());
                        purcRqstVO.setPurcReqStatCd("02");
                        purcRqstVO.setPurcReqNo(list.get(i).getPurcReqNoList().get(j));
                        //purcRqstVO.setPurcReqNo(list.get(i).getPurcReqNo());
                        purcRqstVO.setItemCd(list.get(i).getItemCd());
                        purcRqstVO.setPurcReqLineNo(1);
                        //purcRqstVO.setPurcReqLineNo(list.get(i).getPurcReqLineNo());

                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅 끝.
                         *********************************/

                        purcRqstService.updatePurcRqstCnfm(purcRqstVO);
                        grGiScheduleService.createGrGiSchedule(purcReqGrGiScheduleVO);
                    }
                }


                //BMP구매인 경우에만 입출고 예정정보 셋팅함
                if(purcOrdVO.getBpTp().equals("01")){
                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅.
                     *********************************/
                    purcOrdGrGiScheduleVO = new GrGiScheduleVO();

                    purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                    purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                    purcOrdGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
                    purcOrdGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                    purcOrdGrGiScheduleVO.setGrGiDocNo(purcOrdNo);
                    purcOrdGrGiScheduleVO.setGrGiDocLineNo(purcOrdLineNo);
                    purcOrdGrGiScheduleVO.setGrGiTp("R");
                    purcOrdGrGiScheduleVO.setProcQty(list.get(i).getPurcQty());
                    purcOrdGrGiScheduleVO.setGrGiQty(list.get(i).getPurcQty());
                    purcOrdGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                    purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                     *********************************/
                }

                purcAmt    = list.get(i).getPurcQty() * list.get(i).getPurcPrc();
                //taxDdctAmt = list.get(i).getPurcQty() * list.get(i).getTaxDdctPrc();

                list.get(i).setPurcOrdNo(purcOrdNo);
                list.get(i).setPurcOrdLineNo(Integer.toString(purcOrdLineNo));
                list.get(i).setPurcOrdLineDetlNo(" ");
                list.get(i).setPurcItemStatCd("01"); //"01" 등록상태
                list.get(i).setDelYn("N");
                list.get(i).setGrEndYn("N");
                list.get(i).setPurcAmt(purcAmt);
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setTaxAmt(list.get(i).getPurcAmt() - list.get(i).getTaxDdctAmt());

                // 구매 제시에 의한 구매오더인 경우
                if(list.get(i).getPurcItemTp().equals("02")){
                    purcCostSgstVO = new PurcCostSgstVO();
                    purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());
                    purcCostSgstVO.setPltCd(LoginUtil.getPltCd());
                    purcCostSgstVO.setItemCd(list.get(i).getItemCd());
                    purcCostSgstVO.setRegUsrId(LoginUtil.getUserId());
                    purcCostSgstVO.setPurcOrdRegYn("Y");

                    purcCostSgstService.updatePurcCostSgstOrdCnfm(purcCostSgstVO);
                }

                // 로컬업체 구매등록인 경우 아모스 구매번호를 딜러 구매번호와 동일하게 셋팅한다.
                if(!purcOrdVO.getBpTp().equals("01")){
                    //로컬 구매 확정 시 아모스 구매번호, 딜러구매번호를 구매번호로 설정한다.
                    list.get(i).setBmpOrdNo(purcOrdNo);
                    list.get(i).setBmpOrdLineNo(Integer.toString(purcOrdLineNo));
                    list.get(i).setBmpOrdLineDetlNo(" ");
                    list.get(i).setConfirmQty(list.get(i).getPurcQty().intValue());
                }else{
                    //BMP구매 시에만 입고 예정정보 생성함.
                    grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                }

                resultCnt = purcOrdDAO.insertPurcOrdItem(list.get(i));


                if(resultCnt < 1){
                    //부품 생성 실패.[list.get(i).getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{list.get(i).getItemCd()});
                }
                //totPurcAmt = totPurcAmt + purcAmt;
                totPurcAmt = totPurcAmt + purcAmt;

            }

            // 5. 구매오더 헤더 정보의 총구매금액정보를 수정한다.
            purcOrdVO.setTotPurcAmt(totPurcAmt);

            resultCnt = purcOrdDAO.updatePurcOrd(purcOrdVO);

            if(resultCnt < 1){
                //총금액 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.totAmt", null, LocaleContextHolder.getLocale())});
            }

            return purcOrdVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiPurcOrds(BaseSaveVO<PurcOrdItemVO> obj, PurcOrdVO purcOrdVO) throws Exception {

        try{
            int    resultCnt       = 0;
            double purcAmt         = 0;
            //double taxDdctAmt      = 0;
            double orgGrGiQty      = 0;
            int    purcOrdLineNo   = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            chkPurcOrdNoUpdateSomebody(purcOrdVO);

            //[구매요청]입출고예정정보
            GrGiScheduleVO purcReqGrGiScheduleVO = new GrGiScheduleVO();

            //[구매오더]입출고예정정보
            GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();

            //[구매오더]입출고예정정보[창고변경에 따른 이전 입출고예정정보]
            GrGiScheduleVO purcOrdOrgGrGiScheduleVO = new GrGiScheduleVO();

            //구매요청정보
            PurcRqstVO purcRqstVO = new PurcRqstVO();

           //구매제시정보
            PurcCostSgstVO purcCostSgstVO = new PurcCostSgstVO();


            for(PurcOrdItemVO itemVO : obj.getInsertList()){
                purcOrdLineNo = purcOrdDAO.selectPurcOrdMaxLineNo(purcOrdVO);
                if(itemVO.getPurcQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                /*
                if(itemVO.getPurcPrc() <= 0){
                    //구매단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                }
                */

                if(itemVO.getPurcItemTp().equals("01") && itemVO.getPurcReqNoList().size() > 0){
                    for(int j = 0; j < itemVO.getPurcReqNoList().size(); j++){
                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅.
                         *********************************/
                        purcReqGrGiScheduleVO = new GrGiScheduleVO();
                        purcRqstVO            = new PurcRqstVO();

                        purcReqGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcReqGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcReqGrGiScheduleVO.setStrgeCd(itemVO.getGrStrgeCd());
                        purcReqGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                        purcReqGrGiScheduleVO.setGrGiDocNo(itemVO.getPurcReqNoList().get(j));
                        //purcReqGrGiScheduleVO.setGrGiDocNo(itemVO.getPurcReqNo());
                        purcReqGrGiScheduleVO.setGrGiDocLineNo(1);
                        purcReqGrGiScheduleVO.setGrGiTp("R");
                        purcReqGrGiScheduleVO.setProcQty(itemVO.getPurcReqQtyList().get(j) * -1);
                        purcReqGrGiScheduleVO.setGrGiQty(itemVO.getPurcReqQtyList().get(j));
                        //purcReqGrGiScheduleVO.setProcQty(itemVO.getPurcReqQty() * -1);
                        //purcReqGrGiScheduleVO.setGrGiQty(itemVO.getPurcReqQty());
                        purcReqGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                        purcReqGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        purcRqstVO.setRegUsrId(LoginUtil.getUserId());
                        purcRqstVO.setDlrCd(LoginUtil.getDlrCd());
                        purcRqstVO.setPurcReqStatCd("02");
                        purcRqstVO.setPurcReqNo(itemVO.getPurcReqNoList().get(j));
                        //purcRqstVO.setPurcReqNo(itemVO.getPurcReqNo());
                        purcRqstVO.setItemCd(itemVO.getItemCd());
                        purcRqstVO.setPurcReqLineNo(1);
                        //purcRqstVO.setPurcReqLineNo(itemVO.getPurcReqLineNo());

                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅 끝.
                         *********************************/

                        purcRqstService.updatePurcRqstCnfm(purcRqstVO);
                        grGiScheduleService.createGrGiSchedule(purcReqGrGiScheduleVO);
                    }
                }

                //BMP구매인 경우에만 입출고 예정정보 셋팅함
                if(purcOrdVO.getBpTp().equals("01")){
                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅.
                     *********************************/
                    purcOrdGrGiScheduleVO = new GrGiScheduleVO();

                    purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                    purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                    purcOrdGrGiScheduleVO.setStrgeCd(itemVO.getGrStrgeCd());
                    purcOrdGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                    purcOrdGrGiScheduleVO.setGrGiDocNo(purcOrdVO.getPurcOrdNo());
                    purcOrdGrGiScheduleVO.setGrGiDocLineNo(purcOrdLineNo);
                    purcOrdGrGiScheduleVO.setGrGiTp("R");
                    purcOrdGrGiScheduleVO.setProcQty(itemVO.getPurcQty());
                    purcOrdGrGiScheduleVO.setGrGiQty(itemVO.getPurcQty());
                    purcOrdGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                    purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                     *********************************/
                }

                purcAmt    = itemVO.getPurcQty() * itemVO.getPurcPrc();
                //taxDdctAmt = itemVO.getPurcQty() * itemVO.getTaxDdctPrc();

                itemVO.setPurcOrdNo(purcOrdVO.getPurcOrdNo());
                itemVO.setPurcOrdLineNo(Integer.toString(purcOrdLineNo));
                itemVO.setPurcOrdLineDetlNo(" ");
                itemVO.setPurcItemStatCd("01"); //"01" 등록상태
                itemVO.setDelYn("N");
                itemVO.setGrEndYn("N");
                itemVO.setPurcAmt(purcAmt);
                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setTaxAmt(itemVO.getPurcAmt() - itemVO.getTaxDdctAmt());

               // 구매 제시에 의한 구매오더인 경우
                if(itemVO.getPurcItemTp().equals("02")){
                    purcCostSgstVO = new PurcCostSgstVO();
                    purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());
                    purcCostSgstVO.setPltCd(LoginUtil.getPltCd());
                    purcCostSgstVO.setItemCd(itemVO.getItemCd());
                    purcCostSgstVO.setPurcOrdRegYn("Y");
                    purcCostSgstVO.setRegUsrId(LoginUtil.getUserId());

                    purcCostSgstService.updatePurcCostSgstOrdCnfm(purcCostSgstVO);
                }

                // 로컬업체 구매등록인 경우 아모스 구매번호를 딜러 구매번호와 동일하게 셋팅한다.
                if(!purcOrdVO.getBpTp().equals("01")){
                    //로컬 구매 확정 시 아모스 구매번호, 딜러구매번호를 구매번호로 설정한다.
                    itemVO.setBmpOrdNo(purcOrdVO.getPurcOrdNo());
                    itemVO.setBmpOrdLineNo(Integer.toString(purcOrdLineNo));
                    itemVO.setBmpOrdLineDetlNo(" ");
                    itemVO.setConfirmQty(itemVO.getPurcQty().intValue());
                }else{
                    //BMP구매 시에만 입고 예정정보 생성함.
                    grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                }

                resultCnt = purcOrdDAO.insertPurcOrdItem(itemVO);

                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

            }

            for(PurcOrdItemVO itemVO : obj.getUpdateList()){
                orgGrGiQty = 0;

                if(itemVO.getPurcQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                /*
                if(itemVO.getPurcPrc() <= 0){
                    //구매단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                }
                */

                // BMP구매인 경우에만 입출고 예정정보 셋팅함
                if(purcOrdVO.getBpTp().equals("01")){

                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅.
                     *********************************/
                    purcOrdGrGiScheduleVO    = new GrGiScheduleVO();
                    purcOrdOrgGrGiScheduleVO = new GrGiScheduleVO();



                    purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                    purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                    purcOrdGrGiScheduleVO.setStrgeCd(itemVO.getGrStrgeCd());
                    purcOrdGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                    purcOrdGrGiScheduleVO.setGrGiDocNo(itemVO.getPurcOrdNo());
                    purcOrdGrGiScheduleVO.setGrGiDocLineNo(Integer.parseInt(itemVO.getPurcOrdLineNo()));
                    purcOrdGrGiScheduleVO.setGrGiTp("R");

                    //이전 입출고 예정정보를 가져옴.
                    purcOrdOrgGrGiScheduleVO = grGiScheduleService.selectBefGrGiDocInfo(purcOrdGrGiScheduleVO);

                    //구매오더 수정 시 창고 정보를 수정한 경우 이전 입출고 예정정보를 '-'처리하고 새로운 입출고 예정정보를 생성한다.
                    if(itemVO.getGrStrgeCd().equals(purcOrdOrgGrGiScheduleVO.getStrgeCd())){
                        orgGrGiQty = grGiScheduleService.selectGrGiDocOrgQty(purcOrdGrGiScheduleVO);

                        purcOrdGrGiScheduleVO.setProcQty(itemVO.getPurcQty() - orgGrGiQty);
                        purcOrdGrGiScheduleVO.setGrGiQty(itemVO.getPurcQty());
                        purcOrdGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        /**********************************
                         * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                         *********************************/

                        // BMP구매 시에만 입고 예정정보 생성함.
                        if(purcOrdGrGiScheduleVO.getProcQty() > 0){
                            grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                        }
                    }else{
                        /**********************************
                         * 구매오더에 대한 입출고 예정정보 생성 셋팅.
                         *********************************/

                        purcOrdGrGiScheduleVO.setProcQty(itemVO.getPurcQty());
                        purcOrdGrGiScheduleVO.setGrGiQty(itemVO.getPurcQty());
                        purcOrdGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                        purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        /**********************************
                         * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                         *********************************/

                        purcOrdOrgGrGiScheduleVO.setProcQty(purcOrdOrgGrGiScheduleVO.getProcQty() * -1);

                        //  창고 변경에 대한 이전  입고 예정정보를 -처리함.
                        grGiScheduleService.createGrGiSchedule(purcOrdOrgGrGiScheduleVO);

                        //  수정된 구매라인에 대한 입고 예정정보 생성함.
                        grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                    }


                }

                purcAmt    = itemVO.getPurcQty() * itemVO.getPurcPrc();
                //taxDdctAmt = itemVO.getPurcQty() * itemVO.getTaxDdctPrc();

                itemVO.setPurcAmt(purcAmt);
                itemVO.setPurcOrdLineDetlNo(" ");
                itemVO.setDlrCd(dlrCd);
                itemVO.setRegUsrId(userId);
                itemVO.setTaxAmt(itemVO.getPurcAmt() - itemVO.getTaxDdctAmt());

               //  로컬업체 구매등록인 경우 아모스 구매번호를 딜러 구매번호와 동일하게 셋팅한다.
                if(!purcOrdVO.getBpTp().equals("01")){
                    //로컬 구매 확정 시 아모스 구매번호, 딜러구매번호를 구매번호로 설정한다.
                    itemVO.setConfirmQty(itemVO.getPurcQty().intValue());
                }

                resultCnt = purcOrdDAO.updatePurcOrdItem(itemVO);


                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(PurcOrdItemVO itemVO : obj.getDeleteList()){
                itemVO.setUpdtUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setPurcOrdLineDetlNo(" ");

                // 구매 요청에 의한 구매오더인 경우
                if(itemVO.getPurcItemTp().equals("01")){
                    for(int j = 0; j < itemVO.getPurcReqNoList().size(); j++){
                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅.
                         *********************************/
                        purcRqstVO            = new PurcRqstVO();
                        purcReqGrGiScheduleVO = new GrGiScheduleVO();

                        purcRqstVO.setRegUsrId(LoginUtil.getUserId());
                        purcRqstVO.setDlrCd(LoginUtil.getDlrCd());
                        purcRqstVO.setPurcReqStatCd("01");
                        purcRqstVO.setPurcReqNo(itemVO.getPurcReqNoList().get(j));
                        //purcRqstVO.setPurcReqNo(itemVO.getPurcReqNo());
                        purcRqstVO.setItemCd(itemVO.getItemCd());
                        purcRqstVO.setPurcReqLineNo(1);
                        //purcRqstVO.setPurcReqLineNo(itemVO.getPurcReqLineNo());

                        purcReqGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcReqGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcReqGrGiScheduleVO.setStrgeCd(itemVO.getGrStrgeCd());
                        purcReqGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                        purcReqGrGiScheduleVO.setGrGiDocNo(itemVO.getPurcReqNoList().get(j));
                        //purcReqGrGiScheduleVO.setGrGiDocNo(itemVO.getPurcReqNo());
                        purcReqGrGiScheduleVO.setGrGiDocLineNo(1);
                        purcReqGrGiScheduleVO.setGrGiTp("R");
                        purcReqGrGiScheduleVO.setProcQty(itemVO.getPurcReqQtyList().get(j));
                        purcReqGrGiScheduleVO.setGrGiQty(itemVO.getPurcReqQtyList().get(j));
                        //purcReqGrGiScheduleVO.setProcQty(itemVO.getPurcReqQty());
                        //purcReqGrGiScheduleVO.setGrGiQty(itemVO.getPurcReqQty());
                        purcReqGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                        purcReqGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅 끝.
                         *********************************/

                        grGiScheduleService.createGrGiSchedule(purcReqGrGiScheduleVO);
                        purcRqstService.updatePurcRqstCnfm(purcRqstVO);
                    }
                }

                //  BMP구매인 경우에만 입출고 예정정보 셋팅함
                if(purcOrdVO.getBpTp().equals("01")){
                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅.
                     *********************************/
                    purcOrdGrGiScheduleVO = new GrGiScheduleVO();

                    purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                    purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                    purcOrdGrGiScheduleVO.setStrgeCd(itemVO.getGrStrgeCd());
                    purcOrdGrGiScheduleVO.setItemCd(itemVO.getItemCd());
                    purcOrdGrGiScheduleVO.setGrGiDocNo(itemVO.getPurcOrdNo());
                    purcOrdGrGiScheduleVO.setGrGiDocLineNo(Integer.parseInt(itemVO.getPurcOrdLineNo()));
                    purcOrdGrGiScheduleVO.setGrGiTp("R");
                    purcOrdGrGiScheduleVO.setProcQty(itemVO.getPurcQty() * -1);
                    purcOrdGrGiScheduleVO.setGrGiQty(itemVO.getPurcQty());
                    purcOrdGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                    purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                     *********************************/
                }

                // 구매 제시에 의한 구매오더인 경우
                if(itemVO.getPurcItemTp().equals("02")){
                    purcCostSgstVO = new PurcCostSgstVO();
                    purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());
                    purcCostSgstVO.setPltCd(LoginUtil.getPltCd());
                    purcCostSgstVO.setItemCd(itemVO.getItemCd());
                    purcCostSgstVO.setPurcOrdRegYn("N");
                    purcCostSgstVO.setRegUsrId(LoginUtil.getUserId());

                    purcCostSgstService.updatePurcCostSgstOrdCnfm(purcCostSgstVO);
                }

                resultCnt = purcOrdDAO.deletePurcOrdItem(itemVO);

                //  BMP구매인 경우에만 입출고 예정정보 셋팅함
                if(purcOrdVO.getBpTp().equals("01")){
                    grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                }

                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});

                }
            }




            // 2. 구매오더 헤더 정보를 수정한다.
            //purcOrdVO.setTotPurcAmt(purcOrdDAO.selectPurcOrdTotTaxDdctAmt(purcOrdVO));
            //purcOrdVO.setTotPurcAmt(purcOrdDAO.selectPurcOrdTotPurcAmt(purcOrdVO));

            resultCnt = purcOrdDAO.updatePurcOrd(purcOrdVO);

            //토탈 금액이 0인 경우 구매 취소 와 같음.
            //if(purcOrdVO.getTotPurcAmt() <= 0){
                //cancelPurcOrdHeader(purcOrdVO);
            //}

            if(resultCnt < 1){
              //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    @Override
    public int updatePurcOrd(PurcOrdVO purcOrdVO) throws Exception {
        try{
            int    resultCnt       = 0;

            chkPurcOrdNoUpdateSomebody(purcOrdVO);

            resultCnt = purcOrdDAO.updatePurcOrd(purcOrdVO);

            if(resultCnt < 1){
                //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#updatePurcOrd(java.util.List, chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    /*
    @Override
    public int updatePurcOrd(List<PurcOrdItemVO> list, PurcOrdVO purcOrdVO) throws Exception {

        try{
            int    resultCnt       = 0;
            double purcAmt         = 0;
            double totPurcAmt      = 0;


            // 1. 구매오더 부품정보를 수정한다.
            for(int i = 0; i < list.size(); i++){

                if(list.get(i).getPurcQty() <= 0){
                    throw new Exception("수량이 0보다 작거나 같을 수 없습니다.");
                }

                if(list.get(i).getPurcPrc() <= 0){
                    throw new Exception("구매단가가 0보다 작거나 같을 수 없습니다.");
                }

                purcAmt = list.get(i).getPurcQty() * list.get(i).getPurcPrc();

                list.get(i).setPurcAmt(purcAmt);

                resultCnt = purcOrdDAO.updatePurcOrdItem(list.get(i));

                if(resultCnt < 1){
                    throw new Exception("부품 수정 실패.[" + list.get(i).getItemCd() + "]");
                }
                totPurcAmt = totPurcAmt + purcAmt;
            }

            // 2. 구매오더 헤더 정보를 수정한다.
            purcOrdVO.setTotPurcAmt(totPurcAmt);

            resultCnt = purcOrdDAO.updatePurcOrd(purcOrdVO);

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
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#sendPurcOrd(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public int sendPurcOrd(PurcOrdVO purcOrdVO) throws Exception {

        try{
            int    resultCnt       = 0;

            chkPurcOrdNoUpdateSomebody(purcOrdVO);

            // 1. 구매오더 헤더 정보를 수정한다.
            purcOrdVO.setPurcOrdStatCd("02"); //전송상태로 변경한다.
            purcOrdVO.setPurcItemStatCd("02"); //전송상태로 변경한다.

            // 2. 구매오더 품목 정보를 수정한다.
            resultCnt = purcOrdDAO.sendPurcOrdItem(purcOrdVO);

            if(resultCnt < 1){
              //구매오더 부품 전송 실패.
                throw processException("global.err.sendFailedParam", new String[]{messageSource.getMessage("ser.title.itemInfo", null, LocaleContextHolder.getLocale())});
            }

            resultCnt = purcOrdDAO.sendPurcOrd(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 전송 실패.
                throw processException("global.err.sendFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }


            /*
            AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO = advanceReceivedInfoHeaderService.selectAdvanceReceivedInfoHeaderByKey(LoginUtil.getDlrCd());

            BigDecimal balAmtData = new BigDecimal(String.valueOf(advanceReceivedInfoHeaderVO.getBalAmt()));
            BigDecimal calAmtData = new BigDecimal(String.valueOf(advanceReceivedInfoHeaderVO.getCalcAmt() * -1));
            BigDecimal lmtAmtData = new BigDecimal(advanceReceivedInfoHeaderVO.getLmtAmt());
            BigDecimal purcParAmt = new BigDecimal(purcOrdVO.getPurcParAmt());
            BigDecimal advancedAmtData;
            advancedAmtData = balAmtData.add(calAmtData);
            advancedAmtData = advancedAmtData.add(purcParAmt.negate());
             */

            //pushSignAlarms(advancedAmtData, lmtAmtData, LoginUtil.getUserId(), LoginUtil.getUserNm());

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#deletePurcOrd(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public int cancelPurcOrd(List<PurcOrdItemVO> list, PurcOrdVO purcOrdVO) throws Exception {

        try{
            int    resultCnt       = 0;
            PurcOrdVO chkPurcOrdVO = new PurcOrdVO();
            PurcOrdSearchVO purcOrdSearchVO = new PurcOrdSearchVO();

            chkPurcOrdNoUpdateSomebody(purcOrdVO);

            //PurcOrdVO chkPurcOrdVO = new PurcOrdVO();

            //[구매요청]입출고예정정보
            GrGiScheduleVO purcReqGrGiScheduleVO = new GrGiScheduleVO();

            //[구매오더]입출고예정정보
            GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();

            //구매요청정보
            PurcRqstVO purcRqstVO = new PurcRqstVO();

           //구매제시정보
            PurcCostSgstVO purcCostSgstVO = new PurcCostSgstVO();


          //입고 대기 화면에서 확정 취소 할경우 입고 확정 처리를 막기 위한 부분
            purcOrdSearchVO.setsDlrCd(purcOrdVO.getDlrCd());
            purcOrdSearchVO.setsPurcOrdNo(purcOrdVO.getPurcOrdNo());
            chkPurcOrdVO = purcOrdDAO.selectPurcOrdByKey(purcOrdSearchVO);

            if(chkPurcOrdVO != null){
                if(purcOrdVO.getBpTp().equals("01")){ //BMP구매인경우
                    //등록상태인 경우에만 취소 처리한다.
                    if(!chkPurcOrdVO.getPurcOrdStatCd().equals("01")){
                        // 취소 처리되지 않았습니다.
                        throw processException("global.err.cnclFailed");
                    }
                }else{//로컬구매인경우
                    //등록 및 확정상태인 경우에만 취소 처리한다.
                    if(!(chkPurcOrdVO.getPurcOrdStatCd().equals("01")||chkPurcOrdVO.getPurcOrdStatCd().equals("03"))){
                        // 취소 처리되지 않았습니다.
                        throw processException("global.err.cnclFailed");
                    }
                }
            }else{
                // 취소 처리되지 않았습니다.
                throw processException("global.err.cnclFailed");
            }



            resultCnt = cancelPurcOrdHeader(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            // 1. 구매오더 부품정보의 구매제시, 구매요청 정보를 취소한다.
            for(int i = 0; i < list.size(); i++){

             // 구매 요청에 의한 구매오더인 경우
                if(list.get(i).getPurcItemTp().equals("01")){
                    for(int j = 0; j < list.get(i).getPurcReqNoList().size(); j++){
                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅.
                         *********************************/
                        purcRqstVO            = new PurcRqstVO();
                        purcReqGrGiScheduleVO = new GrGiScheduleVO();

                        purcRqstVO.setRegUsrId(LoginUtil.getUserId());
                        purcRqstVO.setDlrCd(LoginUtil.getDlrCd());
                        purcRqstVO.setPurcReqStatCd("01");
                        purcRqstVO.setPurcReqNo(list.get(i).getPurcReqNoList().get(j));
                        //purcRqstVO.setPurcReqNo(list.get(i).getPurcReqNo());
                        purcRqstVO.setItemCd(list.get(i).getItemCd());
                        purcRqstVO.setPurcReqLineNo(1);
                        //purcRqstVO.setPurcReqLineNo(list.get(i).getPurcReqLineNo());


                        purcReqGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                        purcReqGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                        purcReqGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
                        purcReqGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                        purcReqGrGiScheduleVO.setGrGiDocNo(list.get(i).getPurcReqNoList().get(j));
                        //purcReqGrGiScheduleVO.setGrGiDocNo(list.get(i).getPurcReqNo());
                        purcReqGrGiScheduleVO.setGrGiDocLineNo(1);
                        purcReqGrGiScheduleVO.setGrGiTp("R");
                        purcReqGrGiScheduleVO.setProcQty(list.get(i).getPurcReqQtyList().get(j));
                        purcReqGrGiScheduleVO.setGrGiQty(list.get(i).getPurcReqQtyList().get(j));
                        //purcReqGrGiScheduleVO.setProcQty(list.get(i).getPurcReqQty());
                        //purcReqGrGiScheduleVO.setGrGiQty(list.get(i).getPurcReqQty());
                        purcReqGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                        purcReqGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                        /**********************************
                         * 구매요청에 대한 입출고 예정정보 생성 셋팅 끝.
                         *********************************/

                        grGiScheduleService.createGrGiSchedule(purcReqGrGiScheduleVO);
                        purcRqstService.updatePurcRqstCnfm(purcRqstVO);
                    }
                }

                //  BMP구매인 경우에만 입출고 예정정보 셋팅함
                if(purcOrdVO.getBpTp().equals("01")){
                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅.
                     *********************************/
                    purcOrdGrGiScheduleVO = new GrGiScheduleVO();

                    purcOrdGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                    purcOrdGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                    purcOrdGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
                    purcOrdGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                    purcOrdGrGiScheduleVO.setGrGiDocNo(list.get(i).getPurcOrdNo());
                    purcOrdGrGiScheduleVO.setGrGiDocLineNo(Integer.parseInt(list.get(i).getPurcOrdLineNo()));
                    purcOrdGrGiScheduleVO.setGrGiTp("R");
                    purcOrdGrGiScheduleVO.setProcQty(list.get(i).getPurcQty() * -1);
                    purcOrdGrGiScheduleVO.setGrGiQty(list.get(i).getPurcQty());
                    purcOrdGrGiScheduleVO.setBpCd(purcOrdVO.getBpCd());
                    purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                    /**********************************
                     * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                     *********************************/
                }

                // 구매 제시에 의한 구매오더인 경우
                if(list.get(i).getPurcItemTp().equals("02")){
                    purcCostSgstVO = new PurcCostSgstVO();
                    purcCostSgstVO.setDlrCd(LoginUtil.getDlrCd());
                    purcCostSgstVO.setPltCd(LoginUtil.getPltCd());
                    purcCostSgstVO.setItemCd(list.get(i).getItemCd());
                    purcCostSgstVO.setPurcOrdRegYn("N");
                    purcCostSgstVO.setRegUsrId(LoginUtil.getUserId());

                    purcCostSgstService.updatePurcCostSgstOrdCnfm(purcCostSgstVO);
                }

                //구매취소 시에는 조회 시 데이터가 나타날 수 있도록 상태 변경 안함.
                //resultCnt = purcOrdDAO.deletePurcOrdItem(list.get(i));

                //  BMP구매인 경우에만 입출고 예정정보 셋팅함
                if(purcOrdVO.getBpTp().equals("01")){
                    grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
                }

                /*
                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{list.get(i).getItemCd()});

                }*/
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#deletePurcOrd(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    public int cancelPurcOrdHeader(PurcOrdVO purcOrdVO) throws Exception {

        try{
            int    resultCnt       = 0;

            chkPurcOrdNoUpdateSomebody(purcOrdVO);

            //공급업체가 BMP인경우
            if(purcOrdVO.getBpTp().equals("01")){  //전송상태는 취소가 불가능합니다.

                if(!purcOrdVO.getPurcOrdStatCd().equals("01") ){  //등록상태 이외에는 취소가 불가능합니다.
                    //취소 할 수 없습니다
                    throw processException("global.err.cnclFailed");
                }
            }

            // 1. 구매오더 헤더 정보를 수정한다.(헤더만! 수정한다.)
            purcOrdVO.setPurcOrdStatCd("05"); //취소상태로 변경한다.


            resultCnt = purcOrdDAO.cancelPurcOrd(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#multiConfirmPurcOrd(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public void multiConfirmPurcOrd(BaseSaveVO<PurcOrdItemVO> purcOrdSaveVO, PurcOrdVO purcOrdVO) throws Exception {

        multiPurcOrds(purcOrdSaveVO, purcOrdVO);

        confirmPurcOrd(purcOrdVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#confirmPurcOrd(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public int confirmPurcOrd(PurcOrdVO purcOrdVO) throws Exception {

        try{
            int    resultCnt       = 0;

            chkPurcOrdNoUpdateSomebody(purcOrdVO);

            if(! purcOrdVO.getPurcOrdStatCd().equals("01") ){  //등록상태 이외에는 확정 불가능합니다.
                //취소 할 수 없습니다
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }


            //공급업체가 BMP인경우
            if(purcOrdVO.getBpTp().equals("01")){  //전송상태는 취소가 불가능합니다.

                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});

            }

            // 1. 구매오더 헤더 정보를 수정한다.(헤더만! 수정한다.)
            purcOrdVO.setPurcOrdStatCd("03"); //취소상태로 변경한다.



            resultCnt = purcOrdDAO.confirmPurcOrdItem(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 취소 실패.
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            resultCnt = purcOrdDAO.confirmPurcOrd(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 취소 실패.
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#invcRegLocalPurcOrd(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public int invcRegLocalPurcOrd(PurcOrdVO purcOrdVO) throws Exception {


        try{
            int    resultCnt       = 0;

            chkPurcOrdNoUpdateSomebody(purcOrdVO);

            if(! purcOrdVO.getPurcOrdStatCd().equals("03") ){  //확정상태 이외에는 완료 불가능합니다.
                //취소 할 수 없습니다
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }


            //공급업체가 BMP인경우
            if(purcOrdVO.getBpCd().equals("01")){  //전송상태는 취소가 불가능합니다.

                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});

            }

            resultCnt = purcOrdDAO.invcRegLocalPurcOrd(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 취소 실패.
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            resultCnt = purcOrdDAO.invcRegLocalPurcOrdItem(purcOrdVO);

            if(resultCnt < 1){
                //구매오더 취소 실패.
                throw processException("global.info.cnfmFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#returnPurcOrdItems(java.util.List)
     */
    @Override
    public int returnPurcOrdItems(List<PurcOrdItemVO> list) throws Exception {

        try{
            int    resultCnt       = 1;

            // 1. 구매오더 부품정보를 반품 기록한다.
            for(int i = 0; i < list.size(); i++){
                list.get(i).setPurcUnitCd("EA");
                list.get(i).setDelYn("N");
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                purcOrdDAO.insertReturnPurcOrdItem(list.get(i));
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#returnPurcOrdItems(java.util.List)
     */
    @Override
    public void multiReturnPurcOrdItems(BaseSaveVO<PurcOrdItemVO> obj) throws Exception {

        try{

            for(PurcOrdItemVO itemVO : obj.getInsertList()){
                itemVO.setPurcUnitCd("EA");
                itemVO.setDelYn("N");
                itemVO.setRegUsrId(LoginUtil.getUserId());
                purcOrdDAO.insertReturnPurcOrdItem(itemVO);
            }

            for(PurcOrdItemVO itemVO : obj.getUpdateList()){
                purcOrdDAO.updateReturnPurcOrdItem(itemVO);
            }

            for(PurcOrdItemVO itemVO : obj.getDeleteList()){
                purcOrdDAO.deleteReturnPurcOrdItem(itemVO);
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public PurcOrdVO selectPurcOrdByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdByKey(purcOrdSearchVO);
    }

    /**
     * Key에 해당하는 구매오더 서머리 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 구매오더 정보
     */
    public PurcOrdVO selectPurcOrdSummaryByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception{

        return purcOrdDAO.selectPurcOrdSummaryByKey(purcOrdSearchVO);
    }
    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdItemByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdItemByKey(purcOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectReturnPurcOrdItemByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectReturnPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception {

        return purcOrdDAO.selectReturnPurcOrdItemByKey(purcOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdItemExcelUploadByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO)
     */
    @Override
    public PurcOrdItemVO selectPurcOrdItemExcelUploadByKey(PurcOrdItemVO purcOrdItemVO) throws Exception {

        return purcOrdDAO.selectPurcOrdItemExcelUploadByKey(purcOrdItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectItemInfoByPurcOrderInfo(chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO)
     */
    @Override
    public PurcOrdItemVO selectItemInfoByPurcOrderInfo(PurcOrdItemVO purcOrdItemVO) throws Exception {

        return purcOrdDAO.selectItemInfoByPurcOrderInfo(purcOrdItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdesByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectPurcOrdsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectPurcOrdsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdItemCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdVO> selectPurcOrdItemCondition(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdItemCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdItemConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdItemConditionCnt(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdItemConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectReturnPurcOrdItemCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectReturnPurcOrdItemCondition(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectReturnPurcOrdItemCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectReturnPurcOrdItemConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectReturnPurcOrdItemConditionCnt(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectReturnPurcOrdItemConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextPurcOrdNo() throws Exception {
        try {
            return purcOrdNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdesByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectInvcItemsByCondition(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectInvcItemsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectInvcItemsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectInvcItemsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#updatePurcOrdCnfmItemByReceive(chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO)
     */
    @Override
    public int updatePurcOrdCnfmItemByReceive(PurcOrdItemVO purcOrdItemVO) throws Exception {

        return purcOrdDAO.updatePurcOrdCnfmItemByReceive(purcOrdItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#updatePurcOrdCnfmEndItemByReceive(chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO)
     */
    @Override
    public int updatePurcOrdCnfmEndItemByReceive(PurcOrdItemVO purcOrdItemVO) throws Exception {

        return purcOrdDAO.updatePurcOrdCnfmEndItemByReceive(purcOrdItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdStatusListSummary(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusListSummary(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByConditionForPurcOrdSummary(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdStatusByConditionForPurcOrdSummary(PurcOrdSearchVO searchVO)
            throws Exception {

        return purcOrdDAO.selectPurcOrdStatusByConditionForPurcOrdSummary(searchVO);
    }
    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByConditionForPurcOrdSummaryCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdStatusByConditionForPurcOrdSummaryCnt(PurcOrdSearchVO searchVO) throws Exception {

        return purcOrdDAO.selectPurcOrdStatusByConditionForPurcOrdSummaryCnt(searchVO);
    }



    public void chkPurcOrdNoUpdateSomebody(PurcOrdVO purcOrdVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = purcOrdDAO.selectPurcOrdUpdtDtByKey(purcOrdVO);

            if(!updtDtStrNow.equals(purcOrdVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#fnChkPurcOrdNoUpdateSomebody(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public boolean fnChkPurcOrdNoUpdateSomebody(PurcOrdVO purcOrdVO) throws Exception {
        chkPurcOrdNoUpdateSomebody(purcOrdVO);
        return true;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectMobilePurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectMobilePurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectMobilePurcOrdsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusSummary(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdStatusSummary(PurcOrdSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return purcOrdDAO.selectPurcOrdStatusSummary(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        PurcOrdSearchVO searchVO = new PurcOrdSearchVO();

        List<String> sPurcOrdStatLst = new ArrayList<String>();
        String sPurcOrdStatCd;
        String[] arrayPurcOrdStatCdStr;

        List<String> sBpCdLst = new ArrayList<String>();
        String sBpCd;
        String[] arrayBpCdStr;

        String sListType = params.get("sListType").toString();

        searchVO.setsLangCd(langCd);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsDelYn("Y");

        if (StringUtils.isNotEmpty((String)params.get("sPurcOrdStatLst"))) {
            sPurcOrdStatCd = (String)params.get("sPurcOrdStatLst");
            arrayPurcOrdStatCdStr = sPurcOrdStatCd.split(",");
            sPurcOrdStatLst = Arrays.asList(arrayPurcOrdStatCdStr);

            searchVO.setsPurcOrdStatLst(sPurcOrdStatLst);
        }

        if (StringUtils.isNotEmpty((String)params.get("sBpCdList"))) {
            sBpCd = (String)params.get("sBpCdList");
            arrayBpCdStr = sBpCd.split(",");
            sBpCdLst = Arrays.asList(arrayBpCdStr);
            searchVO.setsBpCdList(sBpCdLst);
        }

        if(!StringUtils.isBlank(params.get("sPurcRegDtFr").toString())){
            String sPurcRegDtFr = params.get("sPurcRegDtFr").toString();
            Date dPurcRegDtFr = Date.valueOf(sPurcRegDtFr);
            searchVO.setsPurcRegDtFr(dPurcRegDtFr);
        }

        if(!StringUtils.isBlank(params.get("sPurcRegDtTo").toString())){
            String sPurcRegDtTo = params.get("sPurcRegDtTo").toString();
            Date dPurcRegDtTo = Date.valueOf(sPurcRegDtTo);
            searchVO.setsPurcRegDtTo(dPurcRegDtTo);
        }

        if(!StringUtils.isBlank(params.get("sArrvDtFr").toString())){
            String sArrvDtFr = params.get("sArrvDtFr").toString();
            Date dArrvDtFr = Date.valueOf(sArrvDtFr);
            searchVO.setsArrvDtFr(dArrvDtFr);
        }

        if(!StringUtils.isBlank(params.get("sArrvDtTo").toString())){
            String sArrvDtTo = params.get("sArrvDtTo").toString();
            Date dArrvDtTo = Date.valueOf(sArrvDtTo);
            searchVO.setsArrvDtTo(dArrvDtTo);
        }


        if(!StringUtils.isBlank(params.get("sConfirmFr").toString())){
            String sConfirmFr = params.get("sConfirmFr").toString();
            Date dConfirmFr = Date.valueOf(sConfirmFr);
            searchVO.setsConfirmFr(dConfirmFr);
        }

        if(!StringUtils.isBlank(params.get("sConfirmTo").toString())){
            String sConfirmTo = params.get("sConfirmTo").toString();
            Date dConfirmTo = Date.valueOf(sConfirmTo);
            searchVO.setsConfirmTo(dConfirmTo);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<CommonCodeVO> purcOrdTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd);
        List<CommonCodeVO> purcOrdStatList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd);
        HashMap<String, String> purcOrdStatMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : purcOrdStatList ){
            purcOrdStatMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }
        List<CommonCodeVO> dlPdcCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd);
        HashMap<String, String> dlPdcCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : dlPdcCdList ){
            dlPdcCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }
        List<CommonCodeVO> purcPgssCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR210", null, langCd);
        HashMap<String, String> purcPgssCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : purcPgssCdList ){
            purcPgssCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }
        List<CommonCodeVO> trsfTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd);
        HashMap<String, String> trsfTpMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : trsfTpList ){
            trsfTpMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> ammendCodeList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR207", null, langCd);
        HashMap<String, String> ammendCodeMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : ammendCodeList ){
            ammendCodeMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        if(StringUtil.nullConvert(sListType).equals("H")){
            List<PurcOrdVO> list = selectPurcOrdsByCondition(searchVO);

            //공통코드 또는 코드 명칭  변환 처리.
            for(PurcOrdVO purcOrdVO : list){
                for(CommonCodeVO purcOrdTp : purcOrdTpList){
                    if(purcOrdTp.getCmmCd().equals(purcOrdVO.getPurcOrdTp())){
                        purcOrdVO.setPurcOrdTp("["+purcOrdVO.getPurcOrdTp()+"]"+purcOrdTp.getCmmCdNm());
                        break;
                    }
                }

                for(CommonCodeVO purcOrdStat : purcOrdStatList){
                    if(purcOrdStat.getCmmCd().equals(purcOrdVO.getPurcOrdStatCd())){
                        purcOrdVO.setPurcOrdStatCd("["+purcOrdVO.getPurcOrdStatCd()+"]"+purcOrdStat.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        }else if(StringUtil.nullConvert(sListType).equals("RT")){
            @SuppressWarnings("unchecked")
            List<PurcOrdItemVO> list = (List<PurcOrdItemVO>) selectPurcOrdStatusInterfaceRealTime(searchVO).getData();
            for(PurcOrdItemVO purcOrdItemVO : list){
                for(CommonCodeVO purcOrdTp : purcOrdTpList){
                    if(purcOrdTp.getCmmCd().equals(purcOrdItemVO.getPurcOrdTp())){
                        purcOrdItemVO.setPurcOrdTp("["+purcOrdItemVO.getPurcOrdTp()+"]"+purcOrdTp.getCmmCdNm());
                        break;
                    }
                }
                purcOrdItemVO.setDlDistCd(dlPdcCdMap.get(String.valueOf(purcOrdItemVO.getDlDistCd())));
                purcOrdItemVO.setPurcPgssCd(purcPgssCdMap.get(String.valueOf(purcOrdItemVO.getPurcPgssCd())));
                purcOrdItemVO.setTrsfTp(trsfTpMap.get(String.valueOf(purcOrdItemVO.getTrsfTp())));
            }
            context.putVar("items",list);
        }else {
            List<PurcOrdItemVO> list = selectPurcOrdStatusByCondition(searchVO);
            //공통코드 또는 코드 명칭  변환 처리.
            for(PurcOrdItemVO purcOrdVO : list){
                for(CommonCodeVO purcOrdTp : purcOrdTpList){
                    if(purcOrdTp.getCmmCd().equals(purcOrdVO.getPurcOrdTp())){
                        purcOrdVO.setPurcOrdTp("["+purcOrdVO.getPurcOrdTp()+"]"+purcOrdTp.getCmmCdNm());
                        break;
                    }
                }
                purcOrdVO.setPurcItemStatCd(purcOrdStatMap.get(String.valueOf(purcOrdVO.getPurcItemStatCd())));
                purcOrdVO.setDlDistCd(dlPdcCdMap.get(String.valueOf(purcOrdVO.getDlDistCd())));
                purcOrdVO.setTrsfTp(trsfTpMap.get(String.valueOf(purcOrdVO.getTrsfTp())));
                purcOrdVO.setEditCd(ammendCodeMap.get(String.valueOf(purcOrdVO.getEditCd())));
                purcOrdVO.setPurcPgssCd(purcPgssCdMap.get(String.valueOf(purcOrdVO.getPurcPgssCd())));

            }
            context.putVar("items", list);
        }
    }

    /**
     * 알람을 보낸다.
     */
    public void pushSignAlarms(BigDecimal advancedAmt, BigDecimal lmtAmt, String usrId, String usrNm) throws Exception {

        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();
        targetVO.setUsrId(usrId);
        targetVO.setUsrNm(usrNm);
        targetVO.setMesgTmplTpList("S,P");

        targetUsers.add(targetVO);

        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "PAR-00-01";
        String dlrCd = LoginUtil.getDlrCd();
        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("advancedAmt", advancedAmt);
        context.getVelocityContext().put("lmtAmt", lmtAmt);

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusInterfaceRealTime(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public SearchResult selectPurcOrdStatusInterfaceRealTime(PurcOrdSearchVO searchVO) throws Exception {

        List<PurcOrdItemVO> purcOrdItemVOList = new ArrayList<PurcOrdItemVO>();
        List<AmosPurcOrdItemVO> results = null;
        PurcOrdItemVO purcOrdItemVO = null;
        PurcOrdSearchVO purcOrdSearchVO = null; //부품명 검색(DB 조회)을 위해 만듦
        SearchResult result = new SearchResult();

        try{
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("ORH_DLR_CD", searchVO.getsDlrCd());
            message.put("ORH_ORD_NO", searchVO.getsBmpOrdNo());
            message.put("ORH_INS_START_DT", searchVO.getsBmpOrdDtFr());
            message.put("ORH_INS_END_DT", searchVO.getsBmpOrdDtTo());

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS005");
            camelClient.setSender(LoginUtil.getDlrCd());
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifFailMsg = receiveData.getFooter().getIfFailMsg();

            // success : Z, error : E
            // ifFailMsg를 넣은 이유 : 인터페이스에 없는 오더번호를 입력하여 가져온 경우 ifResult는 Z이나 IfFailMsg는 No data라서 이클립스 Error 발생.(화면에서는 보이지 않음)
            if("Z".equals(ifResult) && "SUCCESS".equals(ifFailMsg)){
                results = receiveData.readMessages(AmosPurcOrdItemVO.class);
                if(results.size() > 0){
                    //구매오더상태에 있는 bmp오더인지 확인 (있으면 DB 데이터 보여줌, 없으면 실시간 데이터 보여줌)
                    searchVO.setsConfirmFr(searchVO.getsConfirmFr());
                    searchVO.setsConfirmTo(searchVO.getsConfirmTo());
                    int purcOrdResult = purcOrdDAO.selectPurcOrdStatusByConditionCnt(searchVO);
                    if(purcOrdResult > 0){
                        purcOrdItemVOList = purcOrdDAO.selectPurcOrdStatusByCondition(searchVO);
                    }else{
                        for(AmosPurcOrdItemVO amosPurcOrdItemVO : results){
                            purcOrdItemVO = new PurcOrdItemVO();
                            purcOrdSearchVO = new PurcOrdSearchVO();
                            purcOrdItemVO.setDlrCd(searchVO.getsDlrCd());
                            purcOrdItemVO.setPurcOrdTp(amosPurcOrdItemVO.getOrhOrdTyp());
                            //Confirm Flag를 이용해서 구매오더상태를 알아낸다. ("05" : 취소(전체) , "03" : 처리)
                            //if(amosPurcOrdItemVO.getOrdCfmAplFlg().equals("N")){
                            //    purcOrdItemVO.setPurcItemStatCd("05");
                            //}else{
                            //    purcOrdItemVO.setPurcItemStatCd("03");
                            //}
                            //넘어온 날짜는 string, purcOrdItemVO는 date 타입이기 때문에 사용함.
                            //purcOrdItemVO.setPurcRegDt(DateUtil.convertToSqlDate(amosPurcOrdItemVO.getOrhOrdRcveDt().substring(0,4)+"-"
                            //        +amosPurcOrdItemVO.getOrhOrdRcveDt().substring(4,6)+"-"+amosPurcOrdItemVO.getOrhOrdRcveDt().substring(6,8)));
                            purcOrdItemVO.setConfirmDt(amosPurcOrdItemVO.getOrhCfmDt());
                            purcOrdItemVO.setPurcOrdNo(amosPurcOrdItemVO.getOrhDlrOrdNo());
                            purcOrdItemVO.setBmpOrdNo(amosPurcOrdItemVO.getOrdOrdNo());
                            purcOrdItemVO.setBpCd("A10AA001");    //프로시저에 공급업체는 무조건 BMP로 함. (AMOS 것만 구매함)
                            purcOrdItemVO.setBpNm("BMP");
                            purcOrdItemVO.setItemCd(amosPurcOrdItemVO.getOrdOrdPno());
                            //itemCd를 이용, 구매오더 부품 정보를 조회(쿼리)하여 부품이름을 가져옴. 우리 DB에 없는 부품일 경우 Error
                            purcOrdSearchVO.setsDlrCd(purcOrdItemVO.getDlrCd());
                            purcOrdSearchVO.setsPurcOrdNo(purcOrdItemVO.getPurcOrdNo());
                            purcOrdSearchVO.setsItemCd(purcOrdItemVO.getItemCd());
                            if(purcOrdDAO.selectPurcOrdItemByKey(purcOrdSearchVO).size() > 0){
                                purcOrdItemVO.setItemNm(purcOrdDAO.selectPurcOrdItemByKey(purcOrdSearchVO).get(0).getItemNm());
                            }else{
                                purcOrdItemVO.setItemNm("");
                            }

                            purcOrdItemVO.setConfirmParNo(amosPurcOrdItemVO.getCfPno());
                            purcOrdItemVO.setPurcQty(amosPurcOrdItemVO.getOrdOrdQt());
                            purcOrdItemVO.setConfirmQty(amosPurcOrdItemVO.getCfQt());
                            purcOrdItemVO.setPurcPrc(amosPurcOrdItemVO.getOrdUpceCur());
                            //Confirm Flag를 이용하여 구매금액을 결정함. ("N" : 취소)
                            //if(amosPurcOrdItemVO.getOrdCfmAplFlg().equals("N")){
                            //    purcOrdItemVO.setPurcPrc(0.0);
                            //}else {
                            //    purcOrdItemVO.setPurcPrc(amosPurcOrdItemVO.getOrdUpceNdp()+amosPurcOrdItemVO.getOrdVatAmt());
                            //}
                            //취소 수량이 0, 구매오더 상태가 전체취소 ("05") 인경우 : 오더수량 = 취소수량
                            //if(amosPurcOrdItemVO.getOrdXclQt()== 0.0){
                            //    if(purcOrdItemVO.getPurcItemStatCd().equals("05")){
                            //        purcOrdItemVO.setCancQty(purcOrdItemVO.getPurcQty());
                            //    }else{
                            //        purcOrdItemVO.setCancQty(0.0);
                            //    }
                            //}
                            purcOrdItemVO.setDlDistCd(amosPurcOrdItemVO.getOrdPdc());
                            //Order Processing Code가 " "인 경우 : PURC_PGSS_CD = "P", 나머지 경우 : 넘어온 값
                            if(amosPurcOrdItemVO.getOrdOrdDtlPrc().equals(" ")){
                                purcOrdItemVO.setPurcPgssCd("P");
                            }else{
                                purcOrdItemVO.setPurcPgssCd(amosPurcOrdItemVO.getOrdOrdDtlPrc());
                            }
                            //설정된 PURC_PGSS_CD에 따라 confirmQty를 달리 해줌.
                            //if(purcOrdItemVO.getPurcPgssCd().equals("C") || purcOrdItemVO.getPurcPgssCd().equals("D")
                            //        || purcOrdItemVO.getPurcPgssCd().equals("Y")){
                            //    if(amosPurcOrdItemVO.getCfQt() > 0){
                            //        purcOrdItemVO.setCalcConfirmQty(amosPurcOrdItemVO.getCfQt()-amosPurcOrdItemVO.getOrdXclQt());
                            //    }else {
                            //        purcOrdItemVO.setCalcConfirmQty(0.0);
                            //    }
                            //}else if(purcOrdItemVO.getPurcPgssCd().equals("X") || purcOrdItemVO.getPurcPgssCd().equals("Z")){
                            //    purcOrdItemVO.setCalcConfirmQty(amosPurcOrdItemVO.getOrdShpQt()+amosPurcOrdItemVO.getOrdAlcQt()
                            //            +amosPurcOrdItemVO.getOrdOpicQt()+amosPurcOrdItemVO.getOrdPakdQt()+amosPurcOrdItemVO.getOrdInvQt());
                            //}else {
                            //    purcOrdItemVO.setCalcConfirmQty((double)amosPurcOrdItemVO.getCfQt());
                            //}
                            purcOrdItemVO.setCalcConfirmQty((double)amosPurcOrdItemVO.getCfQt());
                            purcOrdItemVO.setCancReqQty((int)amosPurcOrdItemVO.getOrdXclQt());
                            purcOrdItemVO.setEditCd(amosPurcOrdItemVO.getOrdLstAmcd());
                            purcOrdItemVO.setBoQty(amosPurcOrdItemVO.getOrdLstBoQt());
                            purcOrdItemVO.setOdrAlcQt((int)amosPurcOrdItemVO.getOrdAlcQt());
                            purcOrdItemVO.setOdrOpicQt((int)amosPurcOrdItemVO.getOrdOpicQt());
                            purcOrdItemVO.setOdrOpacQt((int)amosPurcOrdItemVO.getOrdOpacQt());
                            purcOrdItemVO.setOdrPakdQt((int)amosPurcOrdItemVO.getOrdPakdQt());
                            purcOrdItemVO.setOdrInvQt((int)(amosPurcOrdItemVO.getOrdInvQt()+amosPurcOrdItemVO.getOrdShpQt()));
                            purcOrdItemVO.setMobisInvcNo(amosPurcOrdItemVO.getIvdInvNo());
                            purcOrdItemVO.setBoxNo(amosPurcOrdItemVO.getCaseNo());
                            purcOrdItemVO.setTrsfTp(amosPurcOrdItemVO.getTrnDesc());
                            purcOrdItemVO.setTrsfUsrId(amosPurcOrdItemVO.getTrncd());
                            //넘어온 날짜는 string, purcOrdItemVO는 date 타입이기 때문에 사용함.
                            //purcOrdItemVO.setInvcDt(DateUtil.convertToSqlDate(amosPurcOrdItemVO.getInsInvDt().substring(0,4)+"-"
                            //        +amosPurcOrdItemVO.getInsInvDt().substring(4,6)+"-"+amosPurcOrdItemVO.getInsInvDt().substring(6,8)));
                            //purcOrdItemVO.setArrvDt(DateUtil.convertToSqlDate(amosPurcOrdItemVO.getInsSndDt().substring(0,4)+"-"
                            //        +amosPurcOrdItemVO.getInsSndDt().substring(4,6)+"-"+amosPurcOrdItemVO.getInsSndDt().substring(6,8)));   //구매오더상태와 다름.
                            purcOrdItemVO.setPurcOrdLineNo(amosPurcOrdItemVO.getOrdOrdLn());

                            purcOrdItemVOList.add(purcOrdItemVO);
                        }
                    }

                    result.setTotal(results.size());
                    result.setData(purcOrdItemVOList);
                }
            }else {
                result.setTotal(0);
                //throw processException("par.lbl.ifErrMsgParam"); //인터페이스 실패
            }
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

        return result;
    }
    

    /*
     * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectPurcOrdByCondition(chn.bhmc.dms.par.pmm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdByCondition(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectPurcOrdByCondition(searchVO);
    }

    /*
     * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#selectPurcOrdByConditionCnt(chn.bhmc.dms.par.pmm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {
        return purcOrdDAO.selectPurcOrdByConditionCnt(searchVO);
    }
}
