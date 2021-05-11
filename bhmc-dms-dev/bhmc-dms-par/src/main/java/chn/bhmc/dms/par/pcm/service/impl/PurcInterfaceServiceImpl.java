package chn.bhmc.dms.par.pcm.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.http.client.ClientProtocolException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.PurcInterfaceService;
import chn.bhmc.dms.par.pcm.service.PurcOrdService;
import chn.bhmc.dms.par.pcm.service.dao.PurcOrdInterfaceDAO;
import chn.bhmc.dms.par.pcm.vo.ClaimVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemSendVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdInterfaceServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 3. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 6.     Ju Won Lee     최초 생성
 * </pre>
 */
@Service("purcInterfaceService")
public class PurcInterfaceServiceImpl extends HService implements PurcInterfaceService {

    @Resource(name="purcOrdInterfaceDAO")
    private PurcOrdInterfaceDAO purcOrdInterfaceDAO;

    /**
     * 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 구매오더 서비스
     */
    @Resource(name="purcOrdService")
    PurcOrdService purcOrdService;

    private static final Logger LOGGER = LoggerFactory.getLogger(PurcInterfaceServiceImpl.class);

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcInterfaceService#createOrdInterface(java.util.List)
     */
    @SuppressWarnings("unchecked")
    @Override
    public int createOrdInterface(List<PurcOrdItemVO> list, PurcOrdVO purcOrdVO) throws Exception {
        try{

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS001"); //Purchase Order Code
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int resultCnt = 0;

            purcOrdService.fnChkPurcOrdNoUpdateSomebody(purcOrdVO);
            //liuxueying 删除之前由于amos返回错误信息产生的接口数据 update start
            purcOrdInterfaceDAO.deleteRepeatPurcOrdInterface(purcOrdVO);
            //liuxueying update end
           
            // 4. 구매오더 부품정보를 생성한다.
            for(PurcOrdItemVO purcOrdItemVO : list) {

                if(purcOrdItemVO.getPurcQty() <= 0){
                    //수량이 0보다 작거나 같을 수 없습니다
                    throw processException("global.err.chkZeroQty");
                }

                /*
                if(purcOrdItemVO.getPurcPrc() <= 0){
                    //구매단가가 0보다 작거나 같을 수 없습니다.
                    throw processException("global.err.chkZeroParam", new String[]{messageSource.getMessage("par.lbl.purcPrc", null, LocaleContextHolder.getLocale())});
                }
                */

                purcOrdItemVO.setPurcOrdTp(purcOrdVO.getPurcOrdTp());
                purcOrdItemVO.setTrsfTp(purcOrdVO.getTrsfTp());
                purcOrdItemVO.setRemark(purcOrdVO.getRemark());
                purcOrdItemVO.setDelYn("N");
                purcOrdItemVO.setGrEndYn("N");
                purcOrdItemVO.setRegUsrId(LoginUtil.getUserId());
                purcOrdItemVO.setDlrCd(LoginUtil.getDlrCd());

                resultCnt = purcOrdInterfaceDAO.insertPurcOrdInterfaceItem(purcOrdItemVO);

                //발주전송인터페이스 상세항목 단일 조회.
                PurcOrdSearchVO purcOrdSearchVO = new PurcOrdSearchVO();
                purcOrdSearchVO.setsDlrCd(purcOrdItemVO.getDlrCd());
                purcOrdSearchVO.setsPurcOrdNo(purcOrdItemVO.getPurcOrdNo());
                purcOrdSearchVO.setsPurcOrdLineNo(purcOrdItemVO.getPurcOrdLineNo());

                PurcOrdItemSendVO purcOrdItemSendVO = purcOrdInterfaceDAO.selectPurcOrdInterfaceByKey(purcOrdSearchVO);

                if(purcOrdItemSendVO == null){
                    throw processException("부품 생성 실패.[" + purcOrdItemVO.getItemCd() + "]");
                }

                Map<String, Object> message = new HashMap<String, Object>();
                message.put("POS_DLR", purcOrdItemSendVO.getPosDlr());
                message.put("POS_DLR_ORD", purcOrdItemSendVO.getPosDlrOrd());
                message.put("POS_CMP_KND", purcOrdItemSendVO.getPosCmpKnd());
                message.put("POS_ORD_TYP", purcOrdItemSendVO.getPosOrdTyp());
                message.put("POS_ORD_DT", purcOrdItemSendVO.getPosOrdDt());
                message.put("POS_ORD_TM", purcOrdItemSendVO.getPosOrdTm());
                message.put("POS_TRN_TYP", purcOrdItemSendVO.getPosTrnTyp());
                message.put("POS_RMK", purcOrdItemSendVO.getPosRmk());
                message.put("POS_ORD_LN", purcOrdItemSendVO.getPosOrdLn());
                message.put("POS_ORD_PNO", purcOrdItemSendVO.getPosOrdPno());
                message.put("POS_ORD_QT", purcOrdItemSendVO.getPosOrdQt());


                // update by Zhang QH  EAI新增字段CO_PACK  2019-5-20
                message.put("CO_PACK", purcOrdVO.getCoPack());


                // message add
                camelClient.addSendMessage(message);

            }

            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            // success : Z, interface send error : E ,amos create error : F
            if("Z".equals(ifResult)){
                //send result purchase order update
                resultCnt =  purcOrdService.sendPurcOrd(purcOrdVO);
            }//-----liuxueying 根据amos返回的信息更新接口表，事物提交udpdate start----------
            else if("F".equals(ifResult)){
            	@SuppressWarnings("rawtypes")
				List<Map> errorList = receiveData.readErrorMessages(Map.class);
            	if(errorList!=null&&errorList.size()>0){
            		for(Map<String,String> map:errorList){
            			//更新结果[{POR_FLG=E, POR_DLR=D2327  , POR_DLR_ORD=1910150011,POR_ORD_LN=0001}]
            			purcOrdInterfaceDAO.updatePurcOrdInterfaceItem(map);
            		}
            	}
                LOGGER.error("amos purcOrder create Failed[createOrdInterface]",receiveData.getFooter().getIfFailMsg());
                resultCnt = -2222;
                //throw processException("global.err.amosCreateFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }//----liuxueying update end--------------
            else{
                LOGGER.error("purcOrder Interface Failed[createOrdInterface]",receiveData.getFooter().getIfFailMsg());
                throw processException("global.err.sendFailedParam", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
            }

            return resultCnt;

        }catch(ClientProtocolException e) {
            LOGGER.error("purcOrder Interface Failed[createOrdInterface]",e);
            throw processException("par.lbl.ifErrMsg", new String[]{messageSource.getMessage("par.lbl.ifErrRaiMsg", null, LocaleContextHolder.getLocale())});
        }catch(IOException e){
            LOGGER.error("purcOrder Interface Failed[createOrdInterface]",e);
            throw processException("par.lbl.ifErrMsg", new String[]{messageSource.getMessage("par.lbl.ifErrRaiMsg", null, LocaleContextHolder.getLocale())});
        }

    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcInterfaceService#createClaimInterface(chn.bhmc.dms.par.pcm.vo.ClaimVO)
     */
    @Override
    public void createClaimInterface(ClaimVO claimVO) throws Exception {

        try{
           // int    resultCnt       = 0;

            //클레임 생성 시 수불 추가 생성(재고 이동(가용 -> 보류))
            MvtDocVO claimMvtDocVO = new MvtDocVO();
            MvtDocItemVO claimMvtDocItemVO = new MvtDocItemVO();

            List<MvtDocItemVO> claimMvtItemList     = new ArrayList<MvtDocItemVO>();
            List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();

            /*********************************************
             *  1. 클레임 수불 마스터 정보를 셋팅한다.
             *  (클레임 발생 시 재고이동(25) 가용 -> 보류)
             *********************************************/
            claimMvtDocVO.setMvtTp("25");
            claimMvtDocVO.setBpCd(claimVO.getBpCd());

            /*********************************************
             * 2. 클레임 전송 전 Validation 체크한다.
             *********************************************/
            if((claimVO.getDlrCd() == null) || (claimVO.getDlrCd().isEmpty())){
                 //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if((claimVO.getPltCd() == null) || (claimVO.getPltCd().isEmpty())){
                 //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if((claimVO.getBpCd() == null) || (claimVO.getBpCd().isEmpty())){
                 //공급업체정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if((claimVO.getClaimStatCd() == null) || (claimVO.getClaimStatCd().isEmpty())){
                 //클레임상태 정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimStatCd", null, LocaleContextHolder.getLocale())});
            }

            if((claimVO.getClaimTargCd() == null) || (claimVO.getClaimTargCd().isEmpty())){
                 //클레임대상이 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTargetCd", null, LocaleContextHolder.getLocale())});
            }else{
                if(claimVO.getClaimTargCd().equals("02") && ((claimVO.getDlBpCd() == null) || (claimVO.getDlBpCd().isEmpty()))){
                     //클레임대상이 배송처인 경우 배송업체는 필수입니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.err.dlBpCdChkMsg", null, LocaleContextHolder.getLocale())});
                }
            }

            if((claimVO.getClaimTp() == null) || (claimVO.getClaimTp().isEmpty())){
                 //클레임 사유정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTp", null, LocaleContextHolder.getLocale())});
            }

            if((claimVO.getItemCd() == null) || (claimVO.getItemCd().isEmpty())){
                 //품목정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
            }

            if(claimVO.getClaimQty() == null || claimVO.getClaimQty() < 1){
                 //수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
            }

            if((claimVO.getDlrCd() == null) || (claimVO.getDlrCd().isEmpty())){
                 //단위정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("ser.lbl.unitCd", null, LocaleContextHolder.getLocale())});
            }

            if(claimVO.getPrc() == null || claimVO.getPrc() < 1){
                 //단가정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
            }

            if(claimVO.getAmt() == null || claimVO.getAmt() < 1){
               //금액정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.amt", null, LocaleContextHolder.getLocale())});
            }

            if((claimVO.getInvcDocNo() == null) || (claimVO.getInvcDocNo().isEmpty())){
                 //송장정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcDocNo", null, LocaleContextHolder.getLocale())});
            }

            if(claimVO.getInvcDocLineNo() < 1){
                 //송장라인정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcDocLineNo", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3. 클레임 수불 정보 셋팅
             *********************************************/
            claimMvtDocItemVO.setDlrCd(claimVO.getDlrCd());
            claimMvtDocItemVO.setCancStmtYn("N");
            claimMvtDocItemVO.setLocCd(claimVO.getLocCd());
            claimMvtDocItemVO.setDlrCd(claimVO.getDlrCd());
            claimMvtDocItemVO.setItemCd(claimVO.getItemCd());
            claimMvtDocItemVO.setItemUnitCd(claimVO.getClaimUnitCd());
            claimMvtDocItemVO.setItemQty(claimVO.getClaimQty());
            claimMvtDocItemVO.setFrStrgeCd(claimVO.getStrgeCd());
            claimMvtDocItemVO.setToStrgeCd(claimVO.getStrgeCd());
            claimMvtDocItemVO.setRefDocNo(claimVO.getClaimDocNo());
            claimMvtDocItemVO.setRefDocLineNo(1);
            claimMvtDocItemVO.setDdlnYn("N");
            claimMvtDocItemVO.setCurrCd("");

            claimMvtItemList.add(claimMvtDocItemVO);

            /*********************************************
             * 4.  재고이동 수불을 발생시킨다.(가용 -> 보류)
             *********************************************/
            mvtSaveItemList = mvtDocService.multiSaveMvtDocs(claimMvtDocVO, claimMvtItemList);

            if(mvtSaveItemList.size() < 1){
               //송장부품의 입고 확정이 처리되지 않았습니다.
                throw processException("par.err.failedReceiveCnfmMsg");
            }

            /*********************************************
             * 5.  클레임정보를 전송한다.
             *********************************************/
            //resultCnt = purcInterfaceDAO.insertClaimInterface(claimVO);

            //if(resultCnt < 1){
            //    throw new Exception("클레임 전송 실패.[" + claimVO.getItemCd() + "]");
            //}



        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
}
