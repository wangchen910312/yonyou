package chn.bhmc.dms.par.pcm.service.impl;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.cmm.nms.service.impl.NotificationMessageContext;
import chn.bhmc.dms.cmm.nms.vo.NotificationTargetUserVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pcm.service.ClaimService;
import chn.bhmc.dms.par.pcm.service.InvcService;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.service.PurcRqstService;
import chn.bhmc.dms.par.pcm.service.ReceiveEtcService;
import chn.bhmc.dms.par.pcm.service.dao.InvcDAO;
import chn.bhmc.dms.par.pcm.vo.InvcExcelVO;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimItemVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcRqstVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.service.VenderMasterService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.pmm.vo.VenderMasterVO;
import chn.bhmc.dms.par.stm.service.GrGiScheduleService;
import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 송장 구현 클래스
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
@Service("invcService")
public class InvcServiceImpl extends HService implements InvcService, JxlsSupport {

    @Resource(name="invcDAO")
    private InvcDAO invcDAO;

    @Resource(name="invcDocNoIdgenService")
    EgovIdGnrService invcDocNoIdgenService;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 클레임 서비스
     */
    @Resource(name="claimService")
    ClaimService claimService;

    /**
     * 입출고예정 서비스
     */
    @Resource(name="grGiScheduleService")
    GrGiScheduleService grGiScheduleService;

    /**
     * 구매오더 서비스
     */
    @Resource(name="purcOrdService")
    PurcOrdService purcOrdService;

    /**
     * 기타입고 서비스
     */
    @Resource(name="receiveEtcService")
    ReceiveEtcService receiveEtcService;

    /**
     * 거래처 서비스
     */
    @Resource(name="venderMasterService")
    VenderMasterService venderMasterService;

    /**
     * 구매요청 서비스
     */
    @Resource(name="purcRqstService")
    PurcRqstService purcRqstService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * notificationMessageService
     */
    @Resource(name="notificationMessageService")
    NotificationMessageService notificationMessageService;

    private static final Logger LOGGER = LoggerFactory.getLogger(InvcServiceImpl.class);


    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#createOrd(java.util.List, chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public InvcVO createInvc(List<InvcItemVO> list, InvcVO invcVO) throws Exception {

        try{
            int    invcDocLineNo   = 1;
            int    resultCnt       = 0;
            double orgGrGiQty      = 0;

            //거래처정보
            VenderMasterVO venderMasterVO = new VenderMasterVO();

            //구매정보
            PurcOrdSearchVO purcOrdSearchVO = new PurcOrdSearchVO();
            PurcOrdVO       purcOrdVO       = new PurcOrdVO();

            //[구매오더]입출고예정정보
            GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();

            //[송장]입출고예정정보
            GrGiScheduleVO invcGrGiScheduleVO = new GrGiScheduleVO();

            // 1. 송장 번호를 생성한다.
            String invcDocNo =  selectNextInvcDocNo();
            invcVO.setInvcDocNo(invcDocNo);

            // 2. 송장 상태&취소여부를 설정한다.
            invcVO.setInvcStatCd("01"); //"01" 등록상태.
            invcVO.setCancYn("N"); //"N"

            /***************************************
             * 로컬 구매에 대한 송장등록인 경우
             * 송장 등록 시 구매오더의 상태를 변경한다.
             ***************************************/
            venderMasterVO = venderMasterService.selectVenderMasterByKey(invcVO.getDlrCd(), invcVO.getBpCd());


            // 3. 송장 헤더를 생성한다.
            resultCnt = invcDAO.insertInvc(invcVO);

            if(resultCnt < 1){
                throw new Exception("헤더 생성 실패.");
            }

            // 4. 송장 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                if(list.get(i).getInvcQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroQty");
                }

                if(list.get(i).getInvcPrc() <= 0){
                    //송장단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.invcPrc", null, LocaleContextHolder.getLocale())});
                }

                if(list.get(i).getInvcAmt() <= 0){
                    //송장금액이 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.invcAmt", null, LocaleContextHolder.getLocale())});
                }

                if(list.get(i).getInvcTotAmt() <= 0){
                    //송장총금액이 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.invcTotAmt", null, LocaleContextHolder.getLocale())});
                }

                //BMP거래처가 아닌 경우
                if(!venderMasterVO.getBpTp().equals("01")){

                    purcOrdSearchVO.setsDlrCd(invcVO.getDlrCd());
                    purcOrdSearchVO.setsPurcOrdNo(list.get(i).getPurcOrdNo());
                    purcOrdVO = purcOrdService.selectPurcOrdByKey(purcOrdSearchVO);

                    //확정상태의 로컬 구매인 경우 완료처리한다.
                    if(purcOrdVO.getPurcOrdStatCd().equals("03")){
                        purcOrdService.invcRegLocalPurcOrd(purcOrdVO);

                    }

                }

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

                orgGrGiQty = grGiScheduleService.selectGrGiDocOrgQty(purcOrdGrGiScheduleVO);


                purcOrdGrGiScheduleVO.setProcQty(list.get(i).getInvcQty() * -1);
                purcOrdGrGiScheduleVO.setGrGiQty(orgGrGiQty);
                purcOrdGrGiScheduleVO.setBpCd(list.get(i).getBpCd());
                purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                 *********************************/

                /**********************************
                 * 송장에 대한 입출고 예정정보 생성 셋팅.
                 *********************************/
                invcGrGiScheduleVO = new GrGiScheduleVO();

                invcGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                invcGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                invcGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
                invcGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                invcGrGiScheduleVO.setGrGiDocNo(invcDocNo);
                invcGrGiScheduleVO.setGrGiDocLineNo(invcDocLineNo);
                invcGrGiScheduleVO.setGrGiTp("R");
                invcGrGiScheduleVO.setProcQty(list.get(i).getInvcQty());
                invcGrGiScheduleVO.setGrGiQty(list.get(i).getInvcQty());
                invcGrGiScheduleVO.setBpCd(list.get(i).getBpCd());
                invcGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 송장에 대한 입출고 예정정보 생성 셋팅 끝.
                 *********************************/


                list.get(i).setInvcDocNo(invcDocNo);
                list.get(i).setInvcDocLineNo(invcDocLineNo);
                list.get(i).setMobisInvcLineNo(invcDocLineNo);
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);

                resultCnt = invcDAO.insertInvcItem(list.get(i));

                grGiScheduleService.createGrGiSchedule(invcGrGiScheduleVO);

                if(resultCnt < 1){
                    throw new Exception("부품 생성 실패.[" + list.get(i).getItemCd() + "]");
                }

                invcDocLineNo = invcDocLineNo + 1;
            }

            return invcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectNextInvcDocNo()
     */
    @Override
    public String selectNextInvcDocNo() throws Exception {
        try {
            return invcDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.btn.invcSave", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdesByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectInvcsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectInvcsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceivesByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcVO> selectReceivesByCondition(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceivesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceivesByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceivesByConditionCnt(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceivesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceivesByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcVO> selectReceivesByConditionForPopup(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceivesByConditionForPopup(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceivesByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceivesByConditionForPopupCnt(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceivesByConditionForPopupCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdItemExcelUploadByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO)
     */
    @Override
    public List<InvcItemVO> selectInvcItemByKey(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectInvcItemByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectInvcItemByPurcKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcVO> selectInvcItemByPurcKey(InvcSearchVO invcSearchVO) throws Exception {

        return invcDAO.selectInvcItemByPurcKey(invcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmItemByEtcGrKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectReceiveCnfmItemByEtcGrKey(InvcSearchVO invcSearchVO) throws Exception {

        return invcDAO.selectReceiveCnfmItemByEtcGrKey(invcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmItemByInvcKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectReceiveCnfmItemByInvcKey(InvcSearchVO invcSearchVO) throws Exception {

        return invcDAO.selectReceiveCnfmItemByInvcKey(invcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmItemSummaryByEtcGrKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public InvcVO selectReceiveCnfmItemSummaryByEtcGrKey(InvcSearchVO search) throws Exception {

        return invcDAO.selectReceiveCnfmItemSummaryByEtcGrKey(search);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmItemSummaryByInvcKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public InvcVO selectReceiveCnfmItemSummaryByInvcKey(InvcSearchVO search) throws Exception {

        return invcDAO.selectReceiveCnfmItemSummaryByInvcKey(search);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectInvcByKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public InvcVO selectInvcByKey(InvcVO invcVO) throws Exception {

        return invcDAO.selectInvcByKey(invcVO);
    }

    //부품별 입고현황 화면 조회
    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmListByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectReceiveCnfmListByCondition(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectReceiveCnfmListByCondition(searchVO);
    }

    //부품별 입고현황 화면 조회 목록 총 갯수
    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveCnfmListByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceiveCnfmListByConditionCnt(InvcSearchVO searchVO) throws Exception {
        return invcDAO.selectReceiveCnfmListByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#updateInvcCnfm(chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public int updateInvcCnfm(InvcVO invcVO) throws Exception {
        try{
            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS004"); //송장확정
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int    resultCnt       = 0;

            chkMobisInvcDocNoUpdateSomebody(invcVO);

            resultCnt = invcDAO.updateInvcCnfm(invcVO);

            if(resultCnt < 1){
                //송장확정 실패
                throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("par.btn.invcCnfm", null, LocaleContextHolder.getLocale())});
            }

            Map<String, Object> message          = new HashMap<String, Object>();

            message.put("ARI_DLR_CD",              LoginUtil.getDlrCd());
            message.put("ARI_INV_NO",              invcVO.getMobisInvcNo());
            message.put("ARI_ARV_DT",              invcVO.getArrvDtChar());
            message.put("ARI_ARV_TIM",             invcVO.getArrvTmChar());
            message.put("ARI_INS_ID",              invcVO.getRegUsrId());
            message.put("ARI_INS_DT",              invcVO.getRegDtChar());

            // message add
            camelClient.addSendMessage(message);

            //Data receiveData = camelClient.sendRequest();
            //String ifResult = receiveData.getFooter().getIfResult();
            //String ifMsg = receiveData.getFooter().getIfFailMsg();

         // success : Z, error : Z번외
            //if(!"Z".equals(ifResult)){
            //    throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
            //}

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("skill QnA Interface Failed[updateInvcCnfm]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#cancelInvcCnfm(chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public int cancelInvcCnfm(InvcVO invcVO) throws Exception {
        try{
            int    resultCnt       = 0;

            chkMobisInvcDocNoUpdateSomebody(invcVO);

            resultCnt = invcDAO.cancelInvcCnfm(invcVO);

            if(resultCnt < 1){
                //송장확정 취소 실패
                throw processException("global.info.failedMsg", new String[]{messageSource.getMessage("par.btn.invcCnfm", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#deleteInvcDoc(chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public int deleteInvcDoc(InvcVO invcVO, List<InvcItemVO> list) throws Exception {
        try{
            int    resultItemCnt     = 0;
            int    resultHeaderCnt   = 0;
            double orgGrGiQty        = 0;

            chkMobisInvcDocNoUpdateSomebody(invcVO);

            //[구매오더]입출고예정정보
            GrGiScheduleVO purcOrdGrGiScheduleVO = new GrGiScheduleVO();

            //[송장]입출고예정정보
            GrGiScheduleVO invcGrGiScheduleVO = new GrGiScheduleVO();


            for(int i = 0; i < list.size(); i++){
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

                orgGrGiQty = grGiScheduleService.selectGrGiDocOrgQty(purcOrdGrGiScheduleVO);


                purcOrdGrGiScheduleVO.setProcQty(list.get(i).getInvcQty());
                purcOrdGrGiScheduleVO.setGrGiQty(orgGrGiQty);
                purcOrdGrGiScheduleVO.setBpCd(list.get(i).getBpCd());
                purcOrdGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 구매오더에 대한 입출고 예정정보 생성 셋팅 끝.
                 *********************************/

                /**********************************
                 * 송장에 대한 입출고 예정정보 생성 셋팅.
                 *********************************/
                invcGrGiScheduleVO = new GrGiScheduleVO();

                invcGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                invcGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                invcGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
                invcGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                invcGrGiScheduleVO.setGrGiDocNo(list.get(i).getInvcDocNo());
                invcGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getInvcDocLineNo());
                invcGrGiScheduleVO.setGrGiTp("R");
                invcGrGiScheduleVO.setProcQty(list.get(i).getInvcQty() * -1);
                invcGrGiScheduleVO.setGrGiQty(list.get(i).getInvcQty());
                invcGrGiScheduleVO.setBpCd(list.get(i).getBpCd());
                invcGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 송장에 대한 입출고 예정정보 생성 셋팅 끝.
                 *********************************/

                grGiScheduleService.createGrGiSchedule(invcGrGiScheduleVO);
                grGiScheduleService.createGrGiSchedule(purcOrdGrGiScheduleVO);
            }

            resultItemCnt = invcDAO.deleteInvcDocItem(invcVO);



            if(resultItemCnt < 1){
                //송장문서 삭제 실패
                throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("par.title.invcInfo", null, LocaleContextHolder.getLocale())});
            }else{
                resultHeaderCnt = invcDAO.deleteInvcDoc(invcVO);
            }

            if(resultHeaderCnt < 1){
                //송장문서 삭제 실패
                throw processException("global.err.delFailedParam", new String[]{messageSource.getMessage("par.title.invcInfo", null, LocaleContextHolder.getLocale())});
            }

            return resultHeaderCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveItemByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceiveItemByConditionCnt(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceiveItemByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveItemByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectReceiveItemByCondition(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceiveItemByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveByMobile(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcVO> selectReceiveByMobile(InvcSearchVO invcSearchVO) throws Exception {

        return invcDAO.selectReceiveByMobile(invcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveByMobileCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceiveByMobileCnt(InvcSearchVO invcSearchVO) throws Exception {

        return invcDAO.selectReceiveByMobileCnt(invcSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveItemByInvcItemBarcode(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public InvcItemVO selectReceiveItemByInvcItemBarcode(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceiveItemByInvcItemBarcode(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveHistoryByItemCd(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectReceiveHistoryByItemCd(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceiveHistoryByItemCd(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectReceiveHistoryByItemCdCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectReceiveHistoryByItemCdCnt(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectReceiveHistoryByItemCdCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#createReceiveRgst(chn.bhmc.dms.par.pcm.vo.InvcVO, java.util.List)
     */
    @Override
    public InvcVO createReceiveRgst(InvcVO invcVO, List<InvcItemVO> list) throws Exception {

        try{
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            String pltCd  = LoginUtil.getPltCd();

            ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
            ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();
            List<ReceiveEtcItemVO> receiveEtcItemList = new ArrayList<ReceiveEtcItemVO>();

            receiveEtcVO.setDlrCd(dlrCd);
            receiveEtcVO.setRegUsrId(userId);
            receiveEtcVO.setPltCd(pltCd);
            receiveEtcVO.setMvtTp("01");
            receiveEtcVO.setBpCd(invcVO.getBpCd());
            receiveEtcVO.setEtcGrDocTp(invcVO.getGrDocTp());
            receiveEtcVO.setRemark(invcVO.getRemark());

            // 4. 기타입고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                receiveEtcItemVO = new ReceiveEtcItemVO();

              //기타입고(구매입고) 시 기타 입고 생성하는 서비스에서 이동평균가격 생성함.
                receiveEtcItemVO.setQty(list.get(i).getInvcQty());
                receiveEtcItemVO.setPrc(list.get(i).getInvcPrc());
                receiveEtcItemVO.setAmt(list.get(i).getInvcTotAmt());
                receiveEtcItemVO.setTaxAmt(list.get(i).getTaxAmt());
                receiveEtcItemVO.setTaxDdctPrc(list.get(i).getTaxDdctPrc());
                receiveEtcItemVO.setTaxDdctAmt(list.get(i).getInvcAmt());
                receiveEtcItemVO.setDcRate(list.get(i).getDcRate());
                receiveEtcItemVO.setLocCd(list.get(i).getGrLocCd());
                receiveEtcItemVO.setItemCd(list.get(i).getItemCd());
                receiveEtcItemVO.setUnitCd(list.get(i).getInvcUnitCd());
                receiveEtcItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
                receiveEtcItemVO.setGrReasonCd(list.get(i).getReqCont());

                receiveEtcItemList.add(receiveEtcItemVO);
            }

            receiveEtcVO = receiveEtcService.createReceiveEtcReg(receiveEtcItemList, receiveEtcVO);

            invcVO.setGrDocNo(receiveEtcVO.getEtcGrDocNo());
            return invcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#multiReceiveRgst(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public void multiReceiveRgst(BaseSaveVO<InvcItemVO> obj, InvcVO invcVO) throws Exception {
        try{
            int    resultCnt        = 0;
            double qty              = 0;

            //[품질]클레임정보
            double compareQty = 0;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();
            invcVO.setInvcStatCd("00");

            chkMobisInvcDocNoUpdateSomebody(invcVO);

            for(InvcItemVO itemVO : obj.getUpdateList()){

                qty = itemVO.getInvcQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }


                if(itemVO.getInvcPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                itemVO.setRegUsrId(userId);
                itemVO.setDlrCd(dlrCd);
                itemVO.setGrQty(itemVO.getInvcQty()); //화면에서 입력한 입고수량(송장수량)을 입고수량으로 적용한다.

                //클레임관련
                if(itemVO.getCompareQty() != 0){

                    if(itemVO.getCompareQty() > 0){
                        compareQty = itemVO.getCompareQty();
                    }else{
                        compareQty = (itemVO.getCompareQty()) * -1;
                        itemVO.setCompareQty(compareQty);
                    }

                    if(Math.abs(itemVO.getCompareQty()) > itemVO.getInvcQty()){
                        //입고수량이 클레임수량보다 적습니다.
                        throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.invcQty", null, LocaleContextHolder.getLocale())});
                    }

                    itemVO.setClaimQty(compareQty);  //과부족 수량이 존재하는 경우 클레임 수량을 설정한다.
                }


                resultCnt = invcDAO.updateReceiveRgstItem(itemVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            resultCnt = invcDAO.updateReceiveRgst(invcVO);

            if(resultCnt < 1){
              //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.receive", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#multiReceiveRgst(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public void multiReceiveEtcRgst(BaseSaveVO<InvcItemVO> obj, InvcVO invcVO) throws Exception {
        try{
            int    resultCnt        = 0;
            double qty              = 0;
            int    receiveEtcLineNo   = 1;
            String userId = LoginUtil.getUserId();
            String dlrCd  = LoginUtil.getDlrCd();

            ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
            ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();

            chkMobisInvcDocNoUpdateSomebody(invcVO);

            receiveEtcVO.setDlrCd(dlrCd);
            receiveEtcVO.setEtcGrDocNo(invcVO.getGrDocNo());

            receiveEtcVO.setStatCd("01");
            receiveEtcVO.setBpCd(invcVO.getBpCd());
            receiveEtcVO.setRegUsrId(userId);
            receiveEtcVO.setRemark(invcVO.getRemark());
            receiveEtcVO.setUpdtDtStr(invcVO.getUpdtDtStr());

            for(InvcItemVO itemVO : obj.getInsertList()){

                receiveEtcLineNo = invcDAO.selectReceiveEtcMaxLineNo(invcVO);

                receiveEtcItemVO = new ReceiveEtcItemVO();
                qty = itemVO.getInvcQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                if(itemVO.getInvcPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }
                receiveEtcItemVO.setEtcGrDocNo(invcVO.getGrDocNo());
                receiveEtcItemVO.setEtcGrDocLineNo(receiveEtcLineNo);
                receiveEtcItemVO.setQty(qty);
                receiveEtcItemVO.setPrc(itemVO.getInvcPrc());
                receiveEtcItemVO.setAmt(itemVO.getInvcTotAmt());
                receiveEtcItemVO.setTaxAmt(itemVO.getTaxAmt());
                receiveEtcItemVO.setTaxDdctPrc(itemVO.getTaxDdctPrc());
                receiveEtcItemVO.setTaxDdctAmt(itemVO.getInvcAmt());
                receiveEtcItemVO.setDcRate(itemVO.getDcRate());
                receiveEtcItemVO.setLocCd(itemVO.getGrLocCd());
                receiveEtcItemVO.setItemCd(itemVO.getItemCd());
                receiveEtcItemVO.setUnitCd(itemVO.getInvcUnitCd());
                receiveEtcItemVO.setStrgeCd(itemVO.getGrStrgeCd());
                receiveEtcItemVO.setRegUsrId(userId);
                receiveEtcItemVO.setDlrCd(dlrCd);
                receiveEtcItemVO.setBpCd(invcVO.getBpCd());
                receiveEtcItemVO.setGrReasonCd(itemVO.getReqCont());
                receiveEtcItemVO.setCancYn("N");
                receiveEtcItemVO.setGrStatCd("01");

                resultCnt = receiveEtcService.insertReceiveEtcItem(receiveEtcItemVO);

                if(resultCnt < 1){
                    //부품 생성 실패.[itemVO.getItemCd()]
                    throw processException(" global.err.regFailedParam", new String[]{itemVO.getItemCd()});
                }

                receiveEtcLineNo = receiveEtcLineNo + 1;
            }

            for(InvcItemVO itemVO : obj.getUpdateList()){

                receiveEtcItemVO = new ReceiveEtcItemVO();

                qty = itemVO.getInvcQty();

                if( qty <= 0 ){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }


                if(itemVO.getInvcPrc() <= 0){
                    //단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }


                //amt = qty * itemVO.getPrc();

                receiveEtcItemVO.setEtcGrDocNo(itemVO.getInvcDocNo());
                receiveEtcItemVO.setEtcGrDocLineNo(itemVO.getInvcDocLineNo());
                receiveEtcItemVO.setQty(qty);
                receiveEtcItemVO.setPrc(itemVO.getInvcPrc());
                receiveEtcItemVO.setAmt(itemVO.getInvcTotAmt());
                receiveEtcItemVO.setTaxAmt(itemVO.getTaxAmt());
                receiveEtcItemVO.setTaxDdctPrc(itemVO.getTaxDdctPrc());
                receiveEtcItemVO.setTaxDdctAmt(itemVO.getInvcAmt());
                receiveEtcItemVO.setDcRate(itemVO.getDcRate());
                receiveEtcItemVO.setLocCd(itemVO.getGrLocCd());
                receiveEtcItemVO.setUnitCd(itemVO.getInvcUnitCd());
                receiveEtcItemVO.setStrgeCd(itemVO.getGrStrgeCd());
                receiveEtcItemVO.setGrReasonCd(itemVO.getReqCont());
                receiveEtcItemVO.setRegUsrId(userId);
                receiveEtcItemVO.setDlrCd(dlrCd);

                resultCnt = receiveEtcService.updateReceiveEtcItem(receiveEtcItemVO);

                if(resultCnt < 1){
                    //부품 수정 실패
                    throw processException(" global.err.modifyFailedParam", new String[]{itemVO.getItemCd()});
                }
            }

            for(InvcItemVO itemVO : obj.getDeleteList()){
                receiveEtcItemVO = new ReceiveEtcItemVO();

                receiveEtcItemVO.setRegUsrId(userId);
                receiveEtcItemVO.setDlrCd(dlrCd);
                receiveEtcItemVO.setEtcGrDocNo(itemVO.getInvcDocNo());
                receiveEtcItemVO.setEtcGrDocLineNo(itemVO.getInvcDocLineNo());

                resultCnt = receiveEtcService.deleteRegReceiveEtcItem(receiveEtcItemVO);


                if(resultCnt < 1){
                    //부품 삭제 실패.[" + itemVO.getItemCd() + "]");
                    throw processException(" global.err.delFailedParam", new String[]{itemVO.getItemCd()});

                }
            }

            resultCnt = receiveEtcService.updateReceiveEtc(receiveEtcVO);

            if(resultCnt < 1){
              //헤더 수정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#updateReceiveRgst(chn.bhmc.dms.par.pcm.vo.InvcVO, java.util.List)
     */
    @Override
    public InvcVO updateReceiveRgst(InvcVO invcVO, List<InvcItemVO> list) throws Exception {

      //ClaimVO claimVO = new ClaimVO();
        int resultCnt  = 0;

        InvcVO chkInvcVO = new InvcVO();

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        chkMobisInvcDocNoUpdateSomebody(invcVO);


        //[품질]클레임정보
        double compareQty = 0;

        invcVO.setGrDocNo(invcVO.getInvcDocNo());
        invcVO.setInvcStatCd("02");
        //입고 대기 화면에서 확정 취소 할경우 입고 확정 처리를 막기 위한 부분
        chkInvcVO = selectInvcByKey(invcVO);
        if(chkInvcVO != null){
            //확정상태인 경우에만 입고 처리한다.
            if(!chkInvcVO.getInvcStatCd().equals("02")){
              //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }
        }else{
          //송장부품의 입고 확정이 처리되지 않았습니다.
            throw processException("par.err.failedReceiveCnfmMsg");
        }

        int listLen = list.size();

        for(int i = 0; i < listLen; i = i + 1){
            list.get(i).setRegUsrId(LoginUtil.getUserId());
            list.get(i).setGrQty(list.get(i).getInvcQty()); //화면에서 입력한 입고수량(송장수량)을 입고수량으로 적용한다.



            //클레임관련
            if(list.get(i).getCompareQty() != 0){

                if(list.get(i).getCompareQty() > 0){
                    compareQty = list.get(i).getCompareQty();
                }else{
                    compareQty = (list.get(i).getCompareQty()) * -1;
                    list.get(i).setCompareQty(compareQty);

                }

                if(Math.abs(list.get(i).getCompareQty()) > list.get(i).getInvcQty()){
                    //입고수량이 클레임수량보다 적습니다.
                    throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.invcQty", null, LocaleContextHolder.getLocale())});
                }

                list.get(i).setClaimQty(compareQty);  //과부족 수량이 존재하는 경우 클레임 수량을 설정한다.
            }

            list.get(i).setRegUsrId(LoginUtil.getUserId());

            resultCnt = invcDAO.updateReceiveRgstItem(list.get(i));

            if(resultCnt != 1){
                //송장부품의 입고 확정이 처리되지 않았습니다.
                 throw processException("par.err.failedReceiveCnfmMsg");
            }

        }

        resultCnt =   invcDAO.updateReceiveRgst(invcVO);

        if(resultCnt != 1){
             //송장부품의 입고 확정이 처리되지 않았습니다.
            throw processException("par.err.failedReceiveCnfmMsg");
        }


        //resultCnt = 1;
        return invcVO;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#insertReceiveCnfm(java.util.List)
     * 입고확정
     * 송장 입고 확정 시 입고확정화면에서 차이수량을 입력 받을 경우
     * 입고수량대로 입고 확정 후  차이수량 만큼 입고 반품(수불)을 발생 시킨다.
     * 차이수량 만큼에 대한 반품 문서는 생성하지 않음.
     * 추후 클레임 발생 시 차이 수량에 대한 수불 근본 문서를 제어할 것인지
     * 기타입고(반품)으로 처리할지는 아직 협의 결론 없음.(17년 1월 고객 협의 사항)
     */
    @Override
    public InvcVO updateReceiveCnfm(InvcVO invcVO, List<InvcItemVO> list) throws Exception {

        //ClaimVO claimVO = new ClaimVO();
        int resultCnt  = 0;
        int selectReceiveTargetCnt  = 0;
        int sendSmsTargetCnt  = 0;

        InvcVO chkInvcVO = new InvcVO();

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        chkMobisInvcDocNoUpdateSomebody(invcVO);

        //[송장]입출고예정정보
        GrGiScheduleVO invcGrGiScheduleVO = new GrGiScheduleVO();

        //[과부족]클레임정보
        OversAndShortsClaimVO oversAndShortsClaimVO = new OversAndShortsClaimVO();
        OversAndShortsClaimItemVO oversAndShortsClaimItemVO = new OversAndShortsClaimItemVO();
        List<OversAndShortsClaimItemVO> oversAndShortsClaimItemList = new ArrayList<OversAndShortsClaimItemVO>();

        //[품질]클레임정보
        QualityClaimVO qualityClaimVO = new QualityClaimVO();
        List<QualityClaimVO> qualityClaimList = new ArrayList<QualityClaimVO>();
        double compareQty = 0;
        String cnfmAlramMsg = new String();

        //기타입고 정보
        ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
        ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();
        List<ReceiveEtcItemVO> receiveEtcItemList = new ArrayList<ReceiveEtcItemVO>();

        List<NotificationTargetUserVO> targetUsrList = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetUsr = new NotificationTargetUserVO();
        List<String> targetUsrIdList = new ArrayList<String>();

        receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
        receiveEtcVO.setRegUsrId(LoginUtil.getUserId());
        receiveEtcVO.setPltCd(LoginUtil.getPltCd());
        receiveEtcVO.setMvtTp("01");
        receiveEtcVO.setBpCd(invcVO.getBpCd());
        receiveEtcVO.setEtcGrDocNo(invcVO.getGrDocNo());
        receiveEtcVO.setUpdtDtStr(invcVO.getUpdtDtStr());
        receiveEtcVO.setRemark(invcVO.getRemark());

        PurcRqstSearchVO purcReqSearchVO = new PurcRqstSearchVO();
        List<PurcRqstVO> purcRqstVOList = new ArrayList<PurcRqstVO>();
        int purcRqstVOListCnt = 0;

        HashMap<String,String> msgMap = new HashMap<String,String>();

        //수불 생성(구매입고)
        MvtDocVO mvtDocVO = new MvtDocVO();
        MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

        PurcOrdItemVO purcOrdItemVO = new PurcOrdItemVO();

        List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
        List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

        //수불 생성(구매입고에서 차이수량 만큼에 대한 반품분)
        //MvtDocVO cancMvtDocVO = new MvtDocVO();
        //MvtDocItemVO cancMvtDocItemVO = new MvtDocItemVO();

        //List<MvtDocItemVO> cancMvtItemList     = new ArrayList<MvtDocItemVO>();
        //List<MvtDocItemVO> cancMvtSaveItemList = new ArrayList<MvtDocItemVO>();

        mvtDocVO.setMvtTp("01");
        mvtDocVO.setBpCd(invcVO.getBpCd());

        //취소 수불에 대한 설정
        //cancMvtDocVO.setMvtTp("01");
        //cancMvtDocVO.setBpCd(invcVO.getBpCd());


        //송장번호가 없는 경우 로컬 입고임.
        if((invcVO.getMobisInvcNo() == null) || (invcVO.getMobisInvcNo().isEmpty()) ){
            resultCnt  = 1;

        }else{

            invcVO.setGrDocNo(invcVO.getInvcDocNo());
            //입고 대기 화면에서 확정 취소 할경우 입고 확정 처리를 막기 위한 부분
            chkInvcVO = selectInvcByKey(invcVO);
            if(chkInvcVO != null){
                //대기상태인 경우에만 입고 처리한다.
                if(!chkInvcVO.getInvcStatCd().equals("00")){
                  //송장부품의 입고 확정이 처리되지 않았습니다.
                    throw processException("par.err.failedReceiveCnfmMsg");
                }
            }else{
              //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }

            oversAndShortsClaimVO.setDlrCd(LoginUtil.getDlrCd());
            //DB컬럼과 다르게 waybillNo가 송장번호임.box번호는 box번호임.(BOX번호는 한 송장에 여러개이기때문에. 일단 보류함.)
            oversAndShortsClaimVO.setWaybillNo(invcVO.getMobisInvcNo());
            //oversAndShortsClaimVO.setBoxNo("");
            oversAndShortsClaimVO.setRegUsrId(LoginUtil.getUserId());
            oversAndShortsClaimVO.setArrivedDate(invcVO.getArrvDt());
        }



        int listLen = list.size();
        int pdcCode;

        for(int i = 0; i < listLen; i = i + 1){

            list.get(i).setRegUsrId(LoginUtil.getUserId());
            list.get(i).setGrQty(list.get(i).getInvcQty()); //화면에서 입력한 입고수량(송장수량)을 입고수량으로 적용한다.

            receiveEtcItemVO = new ReceiveEtcItemVO();
            purcOrdItemVO = new PurcOrdItemVO();

            purcReqSearchVO = new PurcRqstSearchVO();
            purcRqstVOList = new ArrayList<PurcRqstVO>();

            if((list.get(i).getMobisInvcNo() == null) || (list.get(i).getMobisInvcNo().isEmpty()) ){
                //기타입고(구매입고) 시 기타 입고 생성하는 서비스에서 이동평균가격 생성함.
                receiveEtcItemVO.setQty(list.get(i).getInvcQty());
                receiveEtcItemVO.setPrc(list.get(i).getInvcPrc());
                receiveEtcItemVO.setAmt(list.get(i).getInvcTotAmt());
                receiveEtcItemVO.setTaxAmt(list.get(i).getTaxAmt());
                receiveEtcItemVO.setTaxDdctPrc(list.get(i).getTaxDdctPrc());
                receiveEtcItemVO.setTaxDdctAmt(list.get(i).getInvcAmt());
                receiveEtcItemVO.setDcRate(list.get(i).getDcRate());
                receiveEtcItemVO.setLocCd(list.get(i).getGrLocCd());
                receiveEtcItemVO.setItemCd(list.get(i).getItemCd());
                receiveEtcItemVO.setUnitCd(list.get(i).getInvcUnitCd());
                receiveEtcItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
                receiveEtcItemVO.setEtcGrDocNo(list.get(i).getInvcDocNo());
                receiveEtcItemVO.setEtcGrDocLineNo(list.get(i).getInvcDocLineNo());
                receiveEtcItemVO.setDlrCd(LoginUtil.getDlrCd());

                receiveEtcItemList.add(receiveEtcItemVO);
            }else{

                //클레임관련
                if(list.get(i).getCompareQty() != 0){

                    if(list.get(i).getCompareQty() > 0){
                        compareQty = list.get(i).getCompareQty();
                    }else{
                        compareQty = (list.get(i).getCompareQty()) * -1;
                        list.get(i).setCompareQty(compareQty);

                    }

                    if(Math.abs(list.get(i).getCompareQty()) > list.get(i).getInvcQty()){
                        //입고수량이 클레임수량보다 적습니다.
                        throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.invcQty", null, LocaleContextHolder.getLocale())});
                    }

                    list.get(i).setClaimQty(compareQty);  //과부족 수량이 존재하는 경우 클레임 수량을 설정한다.

                    oversAndShortsClaimItemVO = new OversAndShortsClaimItemVO();

                    qualityClaimVO = new QualityClaimVO();

                    oversAndShortsClaimItemVO.setDlrCd(LoginUtil.getDlrCd());
                    //oversAndShortsClaimItemVO.setOrderNo(list.get(i).getPurcOrdNo());
                    oversAndShortsClaimItemVO.setOrderNo(list.get(i).getBmpOrdNo());
                    oversAndShortsClaimItemVO.setPartNo(list.get(i).getItemCd());
                    oversAndShortsClaimItemVO.setOrderNum(list.get(i).getInvcTargetQty());
                    oversAndShortsClaimItemVO.setRealNum(list.get(i).getInvcQty());
                    oversAndShortsClaimItemVO.setClaimantNum(compareQty);
                    oversAndShortsClaimItemVO.setRegUsrId(LoginUtil.getUserId());

                    oversAndShortsClaimItemList.add(oversAndShortsClaimItemVO);

                    //박차장님: 클레임 오더번호는 아모스 오더번호이고, 전송번호는 클레임 신청 시 입력하는 번호임.
                    qualityClaimVO.setDlrCd(LoginUtil.getDlrCd());
                    qualityClaimVO.setRegUsrId(LoginUtil.getUserId());
                    qualityClaimVO.setArrivalDate(invcVO.getArrvDt());
                    //qualityClaimVO.setOrderNo(list.get(i).getPurcOrdNo());
                    qualityClaimVO.setOrderNo(list.get(i).getBmpOrdNo());
                    //qualityClaimVO.setOrderLn(list.get(i).getPurcOrdLineNo());
                    qualityClaimVO.setOrderLn(list.get(i).getBmpOrdLineNo());
                    qualityClaimVO.setPartNo(list.get(i).getItemCd());
                    qualityClaimVO.setClaimNum(compareQty);
                    //qualityClaimVO.setTransportNo(list.get(i).getMobisInvcNo());
                    qualityClaimVO.setSupplierCode(list.get(i).getBpCd());

                    if(list.get(i).getDlPdcCd() != null && !(list.get(i).getDlPdcCd().isEmpty())){
                        pdcCode = Integer.parseInt(list.get(i).getDlPdcCd().substring(2));
                        qualityClaimVO.setPrcCode(pdcCode);
                    }

                    qualityClaimList.add(qualityClaimVO);

                    /*
                    cancMvtDocItemVO = new MvtDocItemVO();

                    cancMvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                    cancMvtDocItemVO.setPltCd(LoginUtil.getPltCd());
                    cancMvtDocItemVO.setCancStmtYn("Y");
                    cancMvtDocItemVO.setLocCd(list.get(i).getGrLocCd());
                    cancMvtDocItemVO.setItemCd(list.get(i).getItemCd());
                    cancMvtDocItemVO.setItemUnitCd(list.get(i).getInvcUnitCd());
                    cancMvtDocItemVO.setItemQty(compareQty);
                    cancMvtDocItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
                    cancMvtDocItemVO.setPurcPrc(list.get(i).getInvcPrc());
                    cancMvtDocItemVO.setPurcAmt(list.get(i).getInvcPrc() * compareQty);
                    cancMvtDocItemVO.setDdlnYn("N");
                    cancMvtDocItemVO.setCurrCd("");

                    cancMvtItemList.add(cancMvtDocItemVO);
                    */

                }

                purcOrdItemVO.setDlrCd(list.get(i).getDlrCd());
                purcOrdItemVO.setPurcOrdNo(list.get(i).getPurcOrdNo());
                purcOrdItemVO.setPurcOrdLineNo(list.get(i).getPurcOrdLineNo());
                purcOrdItemVO.setPurcOrdLineDetlNo(list.get(i).getPurcOrdLineDetlNo());
                purcOrdItemVO.setRegUsrId(list.get(i).getRegUsrId());
                purcOrdItemVO.setGrQty(list.get(i).getInvcQty());


                mvtDocItemVO = new MvtDocItemVO();


                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setLocCd(list.get(i).getGrLocCd());
                mvtDocItemVO.setItemCd(list.get(i).getItemCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getInvcUnitCd());
                mvtDocItemVO.setItemQty(list.get(i).getInvcQty());
                mvtDocItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
                mvtDocItemVO.setPurcPrc(list.get(i).getInvcPrc());
                //mvtDocItemVO.setPurcAmt(list.get(i).getInvcAmt());
                mvtDocItemVO.setPurcAmt(list.get(i).getInvcTotAmt());
                mvtDocItemVO.setRefDocNo(list.get(i).getInvcDocNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getInvcDocLineNo());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");

                mvtItemList.add(mvtDocItemVO);

                /*
                if(list.get(i).getClaimQty() > 0){
                    claimVO = new ClaimVO();

                    claimVO.setDlrCd(LoginUtil.getDlrCd());
                    claimVO.setRegUsrId(LoginUtil.getUserId());
                    claimVO.setPltCd(LoginUtil.getPltCd());
                    claimVO.setBpCd(invcVO.getBpCd());
                    claimVO.setClaimStatCd("01");  //등록
                    claimVO.setClaimTargCd(list.get(i).getClaimTargCd());
                    claimVO.setDlBpCd(list.get(i).getDlBpCd());
                    claimVO.setLocCd(list.get(i).getGrLocCd());
                    claimVO.setStrgeCd(list.get(i).getGrStrgeCd());
                    claimVO.setClaimTp(list.get(i).getClaimTp());
                    claimVO.setItemCd(list.get(i).getItemCd());
                    claimVO.setClaimQty(list.get(i).getClaimQty());
                    claimVO.setClaimUnitCd(list.get(i).getInvcUnitCd());
                    claimVO.setPrc(list.get(i).getInvcPrc());
                    claimVO.setAmt(list.get(i).getInvcAmt());
                    claimVO.setInvcDocNo(list.get(i).getInvcDocNo());
                    claimVO.setInvcDocLineNo(list.get(i).getInvcDocLineNo());
                    claimVO.setReqCont(list.get(i).getReqCont());



                    //claimMvtItemList.add(claimMvtDocItemVO);

                    claimService.createClaimByReceiveCnfm(claimVO);


                    //클레임 생성에 대한 송장 정보 수정(클레임 수량 변경)
                    invcDAO.updateInvcItemByClaim(list.get(i));

                }
                */

                /**********************************
                 * 송장에 대한 입출고 예정정보 생성 셋팅.
                 *********************************/
                invcGrGiScheduleVO = new GrGiScheduleVO();

                invcGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
                invcGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
                invcGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
                invcGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
                invcGrGiScheduleVO.setGrGiDocNo(list.get(i).getInvcDocNo());
                invcGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getInvcDocLineNo());
                invcGrGiScheduleVO.setGrGiTp("R");
                /******************************************************
                 *송장에대한 입출고 수량 계산 시 입고수량으로 안하고 송장수량으로 한다.
                 *입고 시 송장수량에서 +-한 수량으로 입고 가능하기에 변경사항이 많음
                 *BHMC에서 보내는 기준은 송장 수량 기준이니까 송장수량 기준으로 입출고 예정
                 *정보를 차감한다.(송장에 대한 입고 시 입고 한번으로 끝이기 때문에 괜찮음)
                 ********************************************************/
                invcGrGiScheduleVO.setProcQty(list.get(i).getInvcTargetQty() * -1);
                invcGrGiScheduleVO.setGrGiQty(list.get(i).getInvcTargetQty());
                invcGrGiScheduleVO.setBpCd(list.get(i).getBpCd());
                invcGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

                /**********************************
                 * 송장에 대한 입출고 예정정보 생성 셋팅 끝.
                 *********************************/

                list.get(i).setRegUsrId(LoginUtil.getUserId());


                /**********************************
                 * 입고확정에 대한 구매오더 수정.
                 *********************************/

                resultCnt =  purcOrdService.updatePurcOrdCnfmItemByReceive(purcOrdItemVO);


                if(resultCnt != 1){
                   //송장부품의 입고 확정이 처리되지 않았습니다.
                    throw processException("par.err.failedReceiveCnfmMsg");
                }


                /**********************************
                 * 입고확정에 대한 구매오더 수정. 끝.
                 *********************************/

                resultCnt = invcDAO.updateReceiveCnfmItem(list.get(i));

                grGiScheduleService.createGrGiSchedule(invcGrGiScheduleVO);

                if(resultCnt == 1){
                    selectReceiveTargetCnt =  invcDAO.selectInvcsByReceiveCnt(list.get(i));

                    //해당 송장번호의 모든 품목이 입고 완료되었을 경우
                    if(selectReceiveTargetCnt == 0){

                        invcVO.setInvcDocNo(list.get(i).getInvcDocNo());
                        resultCnt =   invcDAO.updateReceiveCnfm(invcVO);

                        if(resultCnt != 1){
                             //송장부품의 입고 확정이 처리되지 않았습니다.
                            throw processException("par.err.failedReceiveCnfmMsg");
                        }
                    }
                }else{
                     //송장부품의 입고 확정이 처리되지 않았습니다.
                    throw processException("par.err.failedReceiveCnfmMsg");
                }

                /*
                if(list.get(i).getReqUsrId() != null && !(list.get(i).getReqUsrId().isEmpty())){
                    targetUsr = new NotificationTargetUserVO();

                    targetUsr.setUsrId(list.get(i).getReqUsrId());
                    targetUsr.setUsrNm(list.get(i).getReqUsrNm());

                    if(!targetUsrIdList.contains(list.get(i).getReqUsrId())){
                        targetUsrList.add(targetUsr);
                        targetUsrIdList.add(list.get(i).getReqUsrId());
                    }
                }
                */

                /*
                if(list.get(i).getOrdRegUsrId() != null && !(list.get(i).getOrdRegUsrId().isEmpty())){
                    targetUsr = new NotificationTargetUserVO();

                    targetUsr.setUsrId(list.get(i).getOrdRegUsrId());
                    targetUsr.setUsrNm(list.get(i).getOrdRegUsrNm());

                    if(!targetUsrIdList.contains(list.get(i).getOrdRegUsrId())){
                        targetUsrList.add(targetUsr);
                        targetUsrIdList.add(list.get(i).getOrdRegUsrId());
                    }

                }
                */

            }

            /*******************************************
             * 결품 대상 정보 조회 및 수정
             ******************************************/
            purcReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            purcReqSearchVO.setsStrgeCd(list.get(i).getGrStrgeCd());
            purcReqSearchVO.setsItemCd(list.get(i).getItemCd());
            purcReqSearchVO.setsRegUsrId(LoginUtil.getUserId());

            sendSmsTargetCnt = purcRqstService.selectPurcReqItemsByConditionForSmsCnt(purcReqSearchVO);

            if(sendSmsTargetCnt > 0){
                purcRqstVOList = purcRqstService.selectPurcReqUsersByConditionForSms(purcReqSearchVO);
                purcRqstVOListCnt = purcRqstVOList.size();

                for(int j = 0; j < purcRqstVOListCnt; j = j + 1){
                    targetUsr = new NotificationTargetUserVO();

                    targetUsr.setUsrId(purcRqstVOList.get(j).getRegUsrId());
                    targetUsr.setUsrNm(purcRqstVOList.get(j).getRegUsrNm());

                    if(!targetUsrIdList.contains(purcRqstVOList.get(j).getRegUsrId())){
                        targetUsrList.add(targetUsr);
                        targetUsrIdList.add(purcRqstVOList.get(j).getRegUsrId());
                        msgMap.put(purcRqstVOList.get(j).getRegUsrId(), "您预订的配件：[" + list.get(i).getItemCd() +  "]");
                    }else{
                        String tempMsg = msgMap.get(purcRqstVOList.get(j).getRegUsrId());
                        tempMsg = tempMsg + " 和 [" + list.get(i).getItemCd() +  "]";
                        msgMap.put(purcRqstVOList.get(j).getRegUsrId(), tempMsg);
                    }

                }

                purcRqstService.updatePurcRqstByReceiveCnfm(purcReqSearchVO);
            }

        }

        if(mvtItemList.size() > 0){
            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                 //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }

            /*
            cancMvtDocVO.setMvtDocYyMm(mvtSaveItemList.get(0).getMvtDocYyMm());
            cancMvtDocVO.setMvtDocNo(mvtSaveItemList.get(0).getMvtDocNo());

            if(cancMvtItemList.size() > 0){

                for(int j = 0,cancSize = cancMvtItemList.size(); j < cancSize; j = j + 1){
                    stockAmt = 0 ;

                     // 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     // 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     // 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     // 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                    searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    searchItemMovingAvgPrcVO.setItemCd(cancMvtItemList.get(j).getItemCd()); //부품코드
                    searchItemMovingAvgPrcVO.setStrgeCd(cancMvtItemList.get(j).getStrgeCd()); //창고코드
                    searchItemMovingAvgPrcVO.setDlrCd(invcVO.getDlrCd()); //딜러코드

                    itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                    //이동평균가격 정보가 존재하는 경우
                    if(itemMovingAvgPrcVO != null){
                        //stockAmt = (itemMovingAvgPrcVO.getTotQty() * itemMovingAvgPrcVO.getMovingAvgPrc()) - Math.abs(cancMvtItemList.get(j).getPurcAmt());

                        //if(stockAmt > 0){
                        //    if((itemMovingAvgPrcVO.getTotQty() - cancMvtItemList.get(j).getItemQty()) > 0 ){
                        //        movingAvgPrc = stockAmt / (itemMovingAvgPrcVO.getTotQty() - Math.abs(cancMvtItemList.get(j).getItemQty()));
                        //    }else{
                        //        movingAvgPrc = itemMovingAvgPrcVO.getMovingAvgPrc();
                        //    }
                        //}else{
                        //    movingAvgPrc = itemMovingAvgPrcVO.getMovingAvgPrc();
                        //}

                        itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                        itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                        itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                        itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                        itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(cancMvtItemList.get(j).getItemQty()));
                        itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                        resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                        if(resultCnt != 1){
                           //송장부품의 입고 확정이 처리되지 않았습니다.
                            throw processException("par.err.failedReceiveCnfmMsg");
                        }

                      //이동평균가격 정보가 없는 경우
                    }else{

                        throw processException("par.err.failedReceiveCnfmMsg");
                    }

                    itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                    itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                    resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                    if(resultCnt != 1){
                        //송장부품의 입고 확정이 처리되지 않았습니다.
                         throw processException("par.err.failedReceiveCnfmMsg");
                     }

                     // 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     // 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     // 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     // 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                     // 끝
                    for(int k = 0,mvtSize = mvtSaveItemList.size(); k < mvtSize; k = k + 1){
                        if((cancMvtItemList.get(j).getItemCd().equals(mvtSaveItemList.get(k).getItemCd()))&&(cancMvtItemList.get(j).getStrgeCd().equals(mvtSaveItemList.get(k).getStrgeCd()))){
                            cancMvtItemList.get(j).setRefDocNo(mvtSaveItemList.get(k).getMvtDocNo());
                            cancMvtItemList.get(j).setRefDocLineNo(mvtSaveItemList.get(k).getMvtDocLineNo());
                        }
                    }
                }

                cancMvtSaveItemList = mvtDocService.multiCnclMvtDocs(cancMvtDocVO, cancMvtItemList);

                if(cancMvtSaveItemList.size() < 1){
                     //송장부품의 입고 확정이 처리되지 않았습니다.
                    throw processException("par.err.failedReceiveCnfmMsg");
                }
            }
            */
        }

        if(receiveEtcItemList.size() > 0){
            //receiveEtcVO = receiveEtcService.createReceiveEtc(receiveEtcItemList, receiveEtcVO);
            receiveEtcVO = receiveEtcService.createReceiveEtcCnfm(receiveEtcItemList, receiveEtcVO);
            resultCnt = 1;

            invcVO.setGrDocNo(receiveEtcVO.getEtcGrDocNo());
        }


        if(oversAndShortsClaimItemList.size() > 0){
            resultCnt =   claimService.createOversAndShortsClaimByInvoice(oversAndShortsClaimItemList, oversAndShortsClaimVO);

            if(resultCnt != 1){
                 //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }

        }

        if(qualityClaimList.size() > 0){
            resultCnt =   claimService.createQualityClaimByInvoice(qualityClaimList);

            if(resultCnt != 1){
                 //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }
        }

        if(targetUsrList.size() > 0){
            for(int i = 0; i < targetUsrList.size(); i = i + 1){
                cnfmAlramMsg = msgMap.get(targetUsrList.get(i).getUsrId()) + " 到货了，请联系库房备货";
                pushSignAlarms(cnfmAlramMsg, targetUsrList.get(i));
            }
        }

        //resultCnt = 1;
        return invcVO;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#cancelReceiveEtc(java.util.List, chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public InvcVO cancelReceiveEtc(List<InvcItemVO> list, InvcVO invcVO) throws Exception {

        try{
            int resultCnt  = 0;
            String cnclAvlbChk = "N";

            ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
            ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();
            List<ReceiveEtcItemVO> receiveEtcItemList = new ArrayList<ReceiveEtcItemVO>();

            invcVO.setDlrCd(LoginUtil.getDlrCd());

            chkMobisInvcDocNoUpdateSomebody(invcVO);

            receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
            receiveEtcVO.setMvtTp("01");
            receiveEtcVO.setBpCd(invcVO.getBpCd());
            receiveEtcVO.setEtcGrDocNo(invcVO.getInvcDocNo());
            receiveEtcVO.setUpdtDtStr(invcVO.getUpdtDtStr());

            cnclAvlbChk = receiveEtcService.selectReceiveEtcReturnAvailableChk(receiveEtcVO);

            //반품건이 1건이라도 있는 경우
            if(cnclAvlbChk.equals("N")){
                String[] lblList = new String[1];
                lblList[0] = messageSource.getMessage("par.lbl.existPreReturn", null, LocaleContextHolder.getLocale());
                throw processException("global.err.cancelFailedParam", lblList);

            }

            // 4. 기타입고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                receiveEtcItemVO = new ReceiveEtcItemVO();

              //기타입고(구매입고) 시 기타 입고 생성하는 서비스에서 이동평균가격 생성함.
                receiveEtcItemVO.setQty(list.get(i).getInvcQty());
                receiveEtcItemVO.setPrc(list.get(i).getInvcPrc());
                receiveEtcItemVO.setAmt(list.get(i).getInvcTotAmt());
                receiveEtcItemVO.setTaxAmt(list.get(i).getTaxAmt());
                receiveEtcItemVO.setTaxDdctPrc(list.get(i).getTaxDdctPrc());
                receiveEtcItemVO.setTaxDdctAmt(list.get(i).getInvcAmt());
                receiveEtcItemVO.setDcRate(list.get(i).getDcRate());
                receiveEtcItemVO.setLocCd(list.get(i).getGrLocCd());
                receiveEtcItemVO.setItemCd(list.get(i).getItemCd());
                receiveEtcItemVO.setUnitCd(list.get(i).getInvcUnitCd());
                receiveEtcItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
                receiveEtcItemVO.setGrReasonCd(list.get(i).getReqCont());
                receiveEtcItemVO.setMvtDocYyMm(list.get(i).getMvtDocYyMm());
                receiveEtcItemVO.setMvtDocNo(list.get(i).getMvtDocNo());
                receiveEtcItemVO.setMvtDocLineNo(list.get(i).getMvtDocLineNo());
                receiveEtcItemVO.setEtcGrDocNo(list.get(i).getInvcDocNo());
                receiveEtcItemVO.setEtcGrDocLineNo(list.get(i).getInvcDocLineNo());

                receiveEtcItemList.add(receiveEtcItemVO);
            }

            resultCnt = receiveEtcService.cancelReceiveEtc(receiveEtcItemList, receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            return invcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#cancelReceiveRegEtc(java.util.List, chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public InvcVO cancelReceiveRegEtc(List<InvcItemVO> list, InvcVO invcVO) throws Exception {

        try{
            int resultCnt  = 0;

            ReceiveEtcVO receiveEtcVO = new ReceiveEtcVO();
            ReceiveEtcItemVO receiveEtcItemVO = new ReceiveEtcItemVO();
            List<ReceiveEtcItemVO> receiveEtcItemList = new ArrayList<ReceiveEtcItemVO>();

            invcVO.setDlrCd(LoginUtil.getDlrCd());

            chkMobisInvcDocNoUpdateSomebody(invcVO);

            receiveEtcVO.setDlrCd(LoginUtil.getDlrCd());
            receiveEtcVO.setBpCd(invcVO.getBpCd());
            receiveEtcVO.setEtcGrDocNo(invcVO.getInvcDocNo());
            receiveEtcVO.setUpdtDtStr(invcVO.getUpdtDtStr());
            receiveEtcVO.setRegUsrId(LoginUtil.getUserId());

            // 4. 기타입고 부품정보를 생성한다.
            for(int i = 0; i < list.size(); i++){

                receiveEtcItemVO = new ReceiveEtcItemVO();

              //기타입고(구매입고) 시 기타 입고 생성하는 서비스에서 이동평균가격 생성함.
                receiveEtcItemVO.setLocCd(list.get(i).getGrLocCd());
                receiveEtcItemVO.setItemCd(list.get(i).getItemCd());
                receiveEtcItemVO.setUnitCd(list.get(i).getInvcUnitCd());
                receiveEtcItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
                receiveEtcItemVO.setGrReasonCd(list.get(i).getReqCont());
                receiveEtcItemVO.setEtcGrDocNo(list.get(i).getInvcDocNo());
                receiveEtcItemVO.setEtcGrDocLineNo(list.get(i).getInvcDocLineNo());

                receiveEtcItemList.add(receiveEtcItemVO);
            }

            resultCnt = receiveEtcService.cancelRegReceiveEtc(receiveEtcItemList, receiveEtcVO);

            if(resultCnt < 1){
                //기타입고 취소 실패.
                throw processException("global.err.cancelFailedParam", new String[]{messageSource.getMessage("par.lbl.etcReceive", null, LocaleContextHolder.getLocale())});
            }

            return invcVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectInvcReceiveEtcItemExcelUploadByKey(chn.bhmc.dms.par.pcm.vo.InvcItemVO)
     */
    @Override
    public InvcItemVO selectInvcReceiveEtcItemExcelUploadByKey(InvcItemVO invcItemVO) throws Exception {

        return invcDAO.selectInvcReceiveEtcItemExcelUploadByKey(invcItemVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#insertReceiveCnfm(java.util.List)
     * 입고확정
     * 송장 입고 확정 시 입고확정화면에서 차이수량을 입력 받을 경우
     * 입고수량대로 입고 확정 후  차이수량 만큼 입고 반품(수불)을 발생 시킨다.
     * 차이수량 만큼에 대한 반품 문서는 생성하지 않음.
     * 추후 클레임 발생 시 차이 수량에 대한 수불 근본 문서를 제어할 것인지
     * 기타입고(반품)으로 처리할지는 아직 협의 결론 없음.(17년 1월 고객 협의 사항)
     */
    @Override
    public InvcVO updateReceiveCnfmForMobile(InvcVO invcVO, List<InvcItemVO> list) throws Exception {

        //ClaimVO claimVO = new ClaimVO();
        int resultCnt  = 0;
        int selectReceiveTargetCnt  = 0;
        int sendSmsTargetCnt  = 0;

        InvcVO chkInvcVO = new InvcVO();

        invcVO.setRegUsrId(LoginUtil.getUserId());
        invcVO.setDlrCd(LoginUtil.getDlrCd());

        //[송장]입출고예정정보
        GrGiScheduleVO invcGrGiScheduleVO = new GrGiScheduleVO();

        //[과부족]클레임정보
        OversAndShortsClaimVO oversAndShortsClaimVO = new OversAndShortsClaimVO();
        OversAndShortsClaimItemVO oversAndShortsClaimItemVO = new OversAndShortsClaimItemVO();
        List<OversAndShortsClaimItemVO> oversAndShortsClaimItemList = new ArrayList<OversAndShortsClaimItemVO>();

        //[품질]클레임정보
        QualityClaimVO qualityClaimVO = new QualityClaimVO();
        List<QualityClaimVO> qualityClaimList = new ArrayList<QualityClaimVO>();
        double compareQty = 0;

        List<NotificationTargetUserVO> targetUsrList = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetUsr = new NotificationTargetUserVO();
        List<String> targetUsrIdList = new ArrayList<String>();
        String cnfmAlramMsg = new String();

        PurcRqstSearchVO purcReqSearchVO = new PurcRqstSearchVO();
        List<PurcRqstVO> purcRqstVOList = new ArrayList<PurcRqstVO>();
        int purcRqstVOListCnt = 0;

        HashMap<String,String> msgMap = new HashMap<String,String>();

        //수불 생성(구매입고)
        MvtDocVO mvtDocVO = new MvtDocVO();
        MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

        PurcOrdItemVO purcOrdItemVO = new PurcOrdItemVO();

        List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();
        List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

        //수불 생성(구매입고에서 차이수량 만큼에 대한 반품분)
        //MvtDocVO cancMvtDocVO = new MvtDocVO();
        //MvtDocItemVO cancMvtDocItemVO = new MvtDocItemVO();

        //List<MvtDocItemVO> cancMvtItemList     = new ArrayList<MvtDocItemVO>();
        //List<MvtDocItemVO> cancMvtSaveItemList = new ArrayList<MvtDocItemVO>();

        mvtDocVO.setMvtTp("01");
        mvtDocVO.setBpCd(invcVO.getBpCd());

        //취소 수불에 대한 설정
        //cancMvtDocVO.setMvtTp("01");
        //cancMvtDocVO.setBpCd(invcVO.getBpCd());



        invcVO.setGrDocNo(invcVO.getInvcDocNo());
        //입고 대기 화면에서 확정 취소 할경우 입고 확정 처리를 막기 위한 부분
        chkInvcVO = selectInvcByKey(invcVO);
        if(chkInvcVO != null){
            //송장확정상태인 경우에만 입고 처리한다.
            if(!chkInvcVO.getInvcStatCd().equals("02")){
              //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }
        }else{
          //송장부품의 입고 확정이 처리되지 않았습니다.
            throw processException("par.err.failedReceiveCnfmMsg");
        }

        oversAndShortsClaimVO.setDlrCd(LoginUtil.getDlrCd());
        //DB컬럼과 다르게 waybillNo가 송장번호임.box번호는 box번호임.(BOX번호는 한 송장에 여러개이기때문에. 일단 보류함.)
        oversAndShortsClaimVO.setWaybillNo(invcVO.getMobisInvcNo());
        //oversAndShortsClaimVO.setBoxNo("");
        oversAndShortsClaimVO.setRegUsrId(LoginUtil.getUserId());
        oversAndShortsClaimVO.setArrivedDate(invcVO.getArrvDt());



        int listLen = list.size();
        int pdcCode;

        for(int i = 0; i < listLen; i = i + 1){

            list.get(i).setRegUsrId(LoginUtil.getUserId());
            list.get(i).setGrQty(list.get(i).getInvcQty()); //화면에서 입력한 입고수량(송장수량)을 입고수량으로 적용한다.

            purcReqSearchVO = new PurcRqstSearchVO();
            purcRqstVOList = new ArrayList<PurcRqstVO>();

            purcOrdItemVO = new PurcOrdItemVO();


            //클레임관련
            if(list.get(i).getCompareQty() != 0){

                if(list.get(i).getCompareQty() > 0){
                    compareQty = list.get(i).getCompareQty();
                }else{
                    compareQty = (list.get(i).getCompareQty()) * -1;
                    list.get(i).setCompareQty(compareQty);

                }

                if(Math.abs(list.get(i).getCompareQty()) > list.get(i).getInvcQty()){
                    //입고수량이 클레임수량보다 적습니다.
                    throw processException("global.err.smallValueParam", new String[]{messageSource.getMessage("par.lbl.invcQty", null, LocaleContextHolder.getLocale())});
                }

                list.get(i).setClaimQty(compareQty);  //과부족 수량이 존재하는 경우 클레임 수량을 설정한다.

                oversAndShortsClaimItemVO = new OversAndShortsClaimItemVO();

                qualityClaimVO = new QualityClaimVO();

                oversAndShortsClaimItemVO.setDlrCd(LoginUtil.getDlrCd());
                //oversAndShortsClaimItemVO.setOrderNo(list.get(i).getPurcOrdNo());
                oversAndShortsClaimItemVO.setOrderNo(list.get(i).getBmpOrdNo());
                oversAndShortsClaimItemVO.setPartNo(list.get(i).getItemCd());
                oversAndShortsClaimItemVO.setOrderNum(list.get(i).getInvcTargetQty());
                oversAndShortsClaimItemVO.setRealNum(list.get(i).getInvcQty());
                oversAndShortsClaimItemVO.setClaimantNum(compareQty);
                oversAndShortsClaimItemVO.setRegUsrId(LoginUtil.getUserId());

                oversAndShortsClaimItemList.add(oversAndShortsClaimItemVO);

                //박차장님: 클레임 오더번호는 아모스 오더번호이고, 전송번호는 클레임 신청 시 입력하는 번호임.
                qualityClaimVO.setDlrCd(LoginUtil.getDlrCd());
                qualityClaimVO.setRegUsrId(LoginUtil.getUserId());
                qualityClaimVO.setArrivalDate(invcVO.getArrvDt());
                //qualityClaimVO.setOrderNo(list.get(i).getPurcOrdNo());
                qualityClaimVO.setOrderNo(list.get(i).getBmpOrdNo());
                //qualityClaimVO.setOrderLn(list.get(i).getPurcOrdLineNo());
                qualityClaimVO.setOrderLn(list.get(i).getBmpOrdLineNo());
                qualityClaimVO.setPartNo(list.get(i).getItemCd());
                qualityClaimVO.setClaimNum(compareQty);
                //qualityClaimVO.setTransportNo(list.get(i).getMobisInvcNo());
                qualityClaimVO.setSupplierCode(list.get(i).getBpCd());

                if(list.get(i).getDlPdcCd() != null && !(list.get(i).getDlPdcCd().isEmpty())){
                    pdcCode = Integer.parseInt(list.get(i).getDlPdcCd().substring(2));
                    qualityClaimVO.setPrcCode(pdcCode);
                }

                qualityClaimList.add(qualityClaimVO);

                /*
                cancMvtDocItemVO = new MvtDocItemVO();

                cancMvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                cancMvtDocItemVO.setPltCd(LoginUtil.getPltCd());
                cancMvtDocItemVO.setCancStmtYn("Y");
                cancMvtDocItemVO.setLocCd(list.get(i).getGrLocCd());
                cancMvtDocItemVO.setItemCd(list.get(i).getItemCd());
                cancMvtDocItemVO.setItemUnitCd(list.get(i).getInvcUnitCd());
                cancMvtDocItemVO.setItemQty(compareQty);
                cancMvtDocItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
                cancMvtDocItemVO.setPurcPrc(list.get(i).getInvcPrc());
                cancMvtDocItemVO.setPurcAmt(list.get(i).getInvcPrc() * compareQty);
                cancMvtDocItemVO.setDdlnYn("N");
                cancMvtDocItemVO.setCurrCd("");

                cancMvtItemList.add(cancMvtDocItemVO);
                */

            }

            purcOrdItemVO.setDlrCd(list.get(i).getDlrCd());
            purcOrdItemVO.setPurcOrdNo(list.get(i).getPurcOrdNo());
            purcOrdItemVO.setPurcOrdLineNo(list.get(i).getPurcOrdLineNo());
            purcOrdItemVO.setPurcOrdLineDetlNo(list.get(i).getPurcOrdLineDetlNo());
            purcOrdItemVO.setRegUsrId(list.get(i).getRegUsrId());
            purcOrdItemVO.setGrQty(list.get(i).getInvcQty());


            mvtDocItemVO = new MvtDocItemVO();


            mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
            mvtDocItemVO.setCancStmtYn("N");
            mvtDocItemVO.setLocCd(list.get(i).getGrLocCd());
            mvtDocItemVO.setItemCd(list.get(i).getItemCd());
            mvtDocItemVO.setItemUnitCd(list.get(i).getInvcUnitCd());
            mvtDocItemVO.setItemQty(list.get(i).getInvcQty());
            mvtDocItemVO.setStrgeCd(list.get(i).getGrStrgeCd());
            mvtDocItemVO.setPurcPrc(list.get(i).getInvcPrc());
            //mvtDocItemVO.setPurcAmt(list.get(i).getInvcAmt());
            mvtDocItemVO.setPurcAmt(list.get(i).getInvcTotAmt());
            mvtDocItemVO.setRefDocNo(list.get(i).getInvcDocNo());
            mvtDocItemVO.setRefDocLineNo(list.get(i).getInvcDocLineNo());
            mvtDocItemVO.setDdlnYn("N");
            mvtDocItemVO.setCurrCd("");

            mvtItemList.add(mvtDocItemVO);

            /**********************************
             * 송장에 대한 입출고 예정정보 생성 셋팅.
             *********************************/
            invcGrGiScheduleVO = new GrGiScheduleVO();

            invcGrGiScheduleVO.setDlrCd(LoginUtil.getDlrCd());
            invcGrGiScheduleVO.setPltCd(LoginUtil.getPltCd());
            invcGrGiScheduleVO.setStrgeCd(list.get(i).getGrStrgeCd());
            invcGrGiScheduleVO.setItemCd(list.get(i).getItemCd());
            invcGrGiScheduleVO.setGrGiDocNo(list.get(i).getInvcDocNo());
            invcGrGiScheduleVO.setGrGiDocLineNo(list.get(i).getInvcDocLineNo());
            invcGrGiScheduleVO.setGrGiTp("R");
            /******************************************************
             *송장에대한 입출고 수량 계산 시 입고수량으로 안하고 송장수량으로 한다.
             *입고 시 송장수량에서 +-한 수량으로 입고 가능하기에 변경사항이 많음
             *BHMC에서 보내는 기준은 송장 수량 기준이니까 송장수량 기준으로 입출고 예정
             *정보를 차감한다.(송장에 대한 입고 시 입고 한번으로 끝이기 때문에 괜찮음)
             ********************************************************/
            invcGrGiScheduleVO.setProcQty(list.get(i).getInvcTargetQty() * -1);
            invcGrGiScheduleVO.setGrGiQty(list.get(i).getInvcTargetQty());
            invcGrGiScheduleVO.setBpCd(list.get(i).getBpCd());
            invcGrGiScheduleVO.setRegUsrId(LoginUtil.getUserId());

            /**********************************
             * 송장에 대한 입출고 예정정보 생성 셋팅 끝.
             *********************************/

            list.get(i).setRegUsrId(LoginUtil.getUserId());


            /**********************************
             * 입고확정에 대한 구매오더 수정.
             *********************************/

            resultCnt =  purcOrdService.updatePurcOrdCnfmItemByReceive(purcOrdItemVO);


            if(resultCnt != 1){
               //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }


            /**********************************
             * 입고확정에 대한 구매오더 수정. 끝.
             *********************************/

            resultCnt = invcDAO.updateReceiveCnfmItem(list.get(i));

            grGiScheduleService.createGrGiSchedule(invcGrGiScheduleVO);

            if(resultCnt == 1){
                selectReceiveTargetCnt =  invcDAO.selectInvcsByReceiveCnt(list.get(i));

                //해당 송장번호의 모든 품목이 입고 완료되었을 경우
                if(selectReceiveTargetCnt == 0){

                    invcVO.setInvcDocNo(list.get(i).getInvcDocNo());
                    resultCnt =   invcDAO.updateReceiveCnfmForMobile(invcVO);

                    if(resultCnt != 1){
                         //송장부품의 입고 확정이 처리되지 않았습니다.
                        throw processException("par.err.failedReceiveCnfmMsg");
                    }
                }
            }else{
                 //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }

            /*
            if(list.get(i).getOrdRegUsrId() != null && !(list.get(i).getOrdRegUsrId().isEmpty())){
                targetUsr = new NotificationTargetUserVO();

                targetUsr.setUsrId(list.get(i).getOrdRegUsrId());
                targetUsr.setUsrNm(list.get(i).getOrdRegUsrNm());

                if(!targetUsrIdList.contains(list.get(i).getOrdRegUsrId())){
                    targetUsrList.add(targetUsr);
                    targetUsrIdList.add(list.get(i).getOrdRegUsrId());
                }

            }
            */

            /*******************************************
             * 결품 대상 정보 조회 및 수정
             ******************************************/
            purcReqSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            purcReqSearchVO.setsStrgeCd(list.get(i).getGrStrgeCd());
            purcReqSearchVO.setsItemCd(list.get(i).getItemCd());
            purcReqSearchVO.setsRegUsrId(LoginUtil.getUserId());

            sendSmsTargetCnt = purcRqstService.selectPurcReqItemsByConditionForSmsCnt(purcReqSearchVO);

            if(sendSmsTargetCnt > 0){
                purcRqstVOList = purcRqstService.selectPurcReqUsersByConditionForSms(purcReqSearchVO);
                purcRqstVOListCnt = purcRqstVOList.size();

                for(int j = 0; j < purcRqstVOListCnt; j = j + 1){
                    targetUsr = new NotificationTargetUserVO();

                    targetUsr.setUsrId(purcRqstVOList.get(j).getRegUsrId());
                    targetUsr.setUsrNm(purcRqstVOList.get(j).getRegUsrNm());

                    if(!targetUsrIdList.contains(purcRqstVOList.get(j).getRegUsrId())){
                        targetUsrList.add(targetUsr);
                        targetUsrIdList.add(purcRqstVOList.get(j).getRegUsrId());

                        msgMap.put(purcRqstVOList.get(j).getRegUsrId(), "您预订的配件：[" + list.get(i).getItemCd() +  "]");
                    }else{
                        String tempMsg = msgMap.get(purcRqstVOList.get(j).getRegUsrId());
                        tempMsg = tempMsg + " 和 [" + list.get(i).getItemCd() +  "]";
                        msgMap.put(purcRqstVOList.get(j).getRegUsrId(), tempMsg);
                    }
                }

                purcRqstService.updatePurcRqstByReceiveCnfm(purcReqSearchVO);
            }
        }

        if(mvtItemList.size() > 0){
            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);

            if(mvtSaveItemList.size() < 1){
                 //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }

            /*
            cancMvtDocVO.setMvtDocYyMm(mvtSaveItemList.get(0).getMvtDocYyMm());
            cancMvtDocVO.setMvtDocNo(mvtSaveItemList.get(0).getMvtDocNo());

            if(cancMvtItemList.size() > 0){

                for(int j = 0,cancSize = cancMvtItemList.size(); j < cancSize; j = j + 1){
                    stockAmt = 0 ;

                     // 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     // 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     // 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     // 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.

                    searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();  //이동평균가격 계산SearchVO
                    itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();  //이동평균가격 계산VO

                    searchItemMovingAvgPrcVO.setItemCd(cancMvtItemList.get(j).getItemCd()); //부품코드
                    searchItemMovingAvgPrcVO.setStrgeCd(cancMvtItemList.get(j).getStrgeCd()); //창고코드
                    searchItemMovingAvgPrcVO.setDlrCd(invcVO.getDlrCd()); //딜러코드

                    itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                    //이동평균가격 정보가 존재하는 경우
                    if(itemMovingAvgPrcVO != null){
                        //stockAmt = (itemMovingAvgPrcVO.getTotQty() * itemMovingAvgPrcVO.getMovingAvgPrc()) - Math.abs(cancMvtItemList.get(j).getPurcAmt());

                        //if(stockAmt > 0){
                        //    if((itemMovingAvgPrcVO.getTotQty() - cancMvtItemList.get(j).getItemQty()) > 0 ){
                        //        movingAvgPrc = stockAmt / (itemMovingAvgPrcVO.getTotQty() - Math.abs(cancMvtItemList.get(j).getItemQty()));
                        //    }else{
                        //        movingAvgPrc = itemMovingAvgPrcVO.getMovingAvgPrc();
                        //    }
                        //}else{
                        //    movingAvgPrc = itemMovingAvgPrcVO.getMovingAvgPrc();
                        //}

                        itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                        itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt()); //이전발생일자
                        itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty()); //이전 총수량
                        itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                        itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(cancMvtItemList.get(j).getItemQty()));
                        itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                        resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                        if(resultCnt != 1){
                           //송장부품의 입고 확정이 처리되지 않았습니다.
                            throw processException("par.err.failedReceiveCnfmMsg");
                        }

                      //이동평균가격 정보가 없는 경우
                    }else{

                        throw processException("par.err.failedReceiveCnfmMsg");
                    }

                    itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                    itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                    resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                    if(resultCnt != 1){
                        //송장부품의 입고 확정이 처리되지 않았습니다.
                         throw processException("par.err.failedReceiveCnfmMsg");
                     }


                     // 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                     // 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                     // 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                     // 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                     // 끝

                    for(int k = 0,mvtSize = mvtSaveItemList.size(); k < mvtSize; k = k + 1){
                        if((cancMvtItemList.get(j).getItemCd().equals(mvtSaveItemList.get(k).getItemCd()))&&(cancMvtItemList.get(j).getStrgeCd().equals(mvtSaveItemList.get(k).getStrgeCd()))){
                            cancMvtItemList.get(j).setRefDocNo(mvtSaveItemList.get(k).getMvtDocNo());
                            cancMvtItemList.get(j).setRefDocLineNo(mvtSaveItemList.get(k).getMvtDocLineNo());
                        }
                    }
                }

                cancMvtSaveItemList = mvtDocService.multiCnclMvtDocs(cancMvtDocVO, cancMvtItemList);

                if(cancMvtSaveItemList.size() < 1){
                     //송장부품의 입고 확정이 처리되지 않았습니다.
                    throw processException("par.err.failedReceiveCnfmMsg");
                }
            }
            */
        }

        if(oversAndShortsClaimItemList.size() > 0){
            resultCnt =   claimService.createOversAndShortsClaimByInvoice(oversAndShortsClaimItemList, oversAndShortsClaimVO);

            if(resultCnt != 1){
                 //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }

        }

        if(qualityClaimList.size() > 0){
            resultCnt =   claimService.createQualityClaimByInvoice(qualityClaimList);

            if(resultCnt != 1){
                 //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }
        }

        if(targetUsrList.size() > 0){
            for(int i = 0; i < targetUsrList.size(); i = i + 1){
                cnfmAlramMsg = msgMap.get(targetUsrList.get(i).getUsrId()) + " 到货了，请联系库房备货";
                pushSignAlarms(cnfmAlramMsg, targetUsrList.get(i));
            }
        }


        //resultCnt = 1;
        return invcVO;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#fnChkMobisInvcDocNoUpdateSomebody(chn.bhmc.dms.par.pcm.vo.InvcVO)
     */
    @Override
    public boolean fnChkMobisInvcDocNoUpdateSomebody(InvcVO invcVO) throws Exception {

        chkMobisInvcDocNoUpdateSomebody(invcVO);

        return true;
    }

    public void chkMobisInvcDocNoUpdateSomebody(InvcVO invcVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = invcDAO.selectInvcUpdtDtByKey(invcVO);

            if(!updtDtStrNow.equals(invcVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("par.lbl.invcDocNo", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.invcDocNo", null, LocaleContextHolder.getLocale())});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectDmsInvcByKey(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public InvcVO selectDmsInvcByKey(InvcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return invcDAO.selectDmsInvcByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectInvcItemByKeyForRgstCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectInvcItemByKeyForRgstCnt(InvcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return invcDAO.selectInvcItemByKeyForRgstCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.InvcService#selectInvcItemByKeyForRgst(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectInvcItemByKeyForRgst(InvcSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return invcDAO.selectInvcItemByKeyForRgst(searchVO);
    }

    /**
     * 알람을 보낸다.
     */
    public void pushSignAlarms(String alramMsg, NotificationTargetUserVO targetUusrList) throws Exception {

        List<NotificationTargetUserVO> targetUsers = new ArrayList<NotificationTargetUserVO>();
        NotificationTargetUserVO targetVO = new NotificationTargetUserVO();

        targetVO.setUsrId(targetUusrList.getUsrId());
        targetVO.setUsrNm(targetUusrList.getUsrNm());
        targetVO.setMesgTmplTpList("S,P,W");
        //targetVO.setMesgTmplTpList("S,W");

        targetUsers.add(targetVO);

        String sysCd = Constants.SYS_CD_DLR;
        String alrtPolicyGrpId = "PAR-00-02";
        String dlrCd = LoginUtil.getDlrCd();
        NotificationMessageContext context = new NotificationMessageContext();
        context.getVelocityContext().put("alramMsg", alramMsg);

        notificationMessageService.sendNotificationMessage(sysCd, alrtPolicyGrpId, dlrCd, context, targetUsers);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        
        /**
         * 增加一个校验逻辑，如果sServiceName是invc，说明是电子发票打印和代入库清单打印，如果是空，则是原始打印
         * wangc 2021年5月12日19:36:24
         */
        //如果是空，则是原始的业务逻辑，没有变动。sServiceName是新增字段，判断是否是电子发票信息还是待入库清单信息 属性为invc
        if(params.get("sServiceName")==null){
        	InvcSearchVO searchVO = new InvcSearchVO();

            List<String> sBpCdLst = new ArrayList<String>();
            String sBpCd;
            String[] arrayBpCdStr;

            String sListType = params.get("sListType").toString();

            searchVO.setsLangCd(langCd);
            searchVO.setsDlrCd(LoginUtil.getDlrCd());

            if (StringUtils.isNotEmpty((String)params.get("sBpCdList"))) {
                sBpCd = (String)params.get("sBpCdList");
                arrayBpCdStr = sBpCd.split(",");
                sBpCdLst = Arrays.asList(arrayBpCdStr);
                searchVO.setsBpCdList(sBpCdLst);
            }

            if(!StringUtils.isBlank(params.get("sInvcGrDtFr").toString())){
                String sInvcGrDtFr = params.get("sInvcGrDtFr").toString();
                Date dInvcGrDtFr = Date.valueOf(sInvcGrDtFr);
                searchVO.setsInvcGrDtFr(dInvcGrDtFr);
            }

            if(!StringUtils.isBlank(params.get("sInvcGrDtTo").toString())){
                String sInvcGrDtTo = params.get("sInvcGrDtTo").toString();
                Date dInvcGrDtTo = Date.valueOf(sInvcGrDtTo);
                searchVO.setsInvcGrDtTo(dInvcGrDtTo);
            }
            //处理乱码
            Object sBpNmObj = params.get("sBpNm");
            String sBpNm = "";
            if(sBpNmObj!=null){
            	params.put("sBpNm",sBpNmObj);
            }
            Object sItemNmObj = params.get("sItemNm");
            String sItemNm = "";
            if(sItemNmObj!=null){
            	params.put("sItemNm",sItemNmObj);
            }
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            if(StringUtil.nullConvert(sListType).equals("H")){
                List<InvcVO> list = selectReceivesByCondition(searchVO);

                List<CommonCodeVO> bpTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR121", null, langCd);
                List<CommonCodeVO> invcTpList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR211", null, langCd);

                //공통코드 또는 코드 명칭  변환 처리.
                for(InvcVO invcVO : list){
                    for(CommonCodeVO cmmCodeVO : bpTpList){
                        if(cmmCodeVO.getCmmCd().equals(invcVO.getBpTp())){
                            invcVO.setBpTp("["+invcVO.getBpTp()+"]"+cmmCodeVO.getCmmCdNm());
                            break;
                        }
                    }

                    for(CommonCodeVO cmmCodeVO : invcTpList){
                        if(cmmCodeVO.getCmmCd().equals(invcVO.getInvcTp())){
                            invcVO.setInvcTp("["+invcVO.getInvcTp()+"]"+cmmCodeVO.getCmmCdNm());
                            break;
                        }
                    }
                }
                context.putVar("items", list);
            } else {
                List<InvcItemVO> list = selectReceiveCnfmListByCondition(searchVO);
                context.putVar("items", list);
            }
        }else{
        	//sServiceName是新增字段，判断是否是电子发票信息或待入库清单信息 属性为invc
        	if("invc".equals(params.get("sServiceName").toString())){
        		InvcSearchVO searchVO = new InvcSearchVO();//查询的是电子发票信息或待入库清单信息
        		ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        		if(!StringUtils.isBlank(params.get("sInvcDtFr").toString())&&!"null".equals(params.get("sInvcDtFr").toString())){
        			String sInvcDtFr = params.get("sInvcDtFr").toString();
    	            java.util.Date invcDtFr = DateUtil.convertToDate(sInvcDtFr);
    	            searchVO.setsInvcDtFr(invcDtFr);;//确认日期开始
    	        }
        		
        		if(!StringUtils.isBlank(params.get("sInvcDtTo").toString())&&!"null".equals(params.get("sInvcDtTo").toString())){
        			String sInvcDtTo = params.get("sInvcDtTo").toString();
    	            java.util.Date invcDtTo = DateUtil.convertToDate(sInvcDtTo);
    	            searchVO.setsInvcDtTo(invcDtTo);//确认日期结束
    	        }
        		searchVO.setsDlrCd(LoginUtil.getDlrCd());
        		List<InvcExcelVO> list = invcDAO.selectInvcsByConditionExcel(searchVO);
        		context.putVar("items", list);
        	}
        }
        
        
    }
}
