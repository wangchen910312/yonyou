package chn.bhmc.dms.par.pcm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.par.pcm.service.ClaimService;
import chn.bhmc.dms.par.pcm.service.dao.ClaimDAO;
import chn.bhmc.dms.par.pcm.service.dao.InvcDAO;
import chn.bhmc.dms.par.pcm.vo.ClaimInterfaceResultVO;
import chn.bhmc.dms.par.pcm.vo.ClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.ClaimVO;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimItemVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimSearchVO;
import chn.bhmc.dms.par.pcm.vo.QualityClaimVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 클레임 구현 클래스
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
@Service("claimService")
public class ClaimServiceImpl extends HService implements ClaimService, JxlsSupport  {

    @Resource(name="claimDAO")
    private ClaimDAO claimDAO;

    @Resource(name="invcDAO")
    private InvcDAO invcDAO;

    @Resource(name="claimDocNoIdgenService")
    EgovIdGnrService claimDocNoIdgenService;

    @Resource(name="oversAndShortsClaimNoIdgenService")
    EgovIdGnrService oversAndShortsClaimNoIdgenService;

    @Resource(name="qualityClaimNoIdgenService")
    EgovIdGnrService qualityClaimNoIdgenService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    private static final Logger LOGGER = LoggerFactory.getLogger(ClaimServiceImpl.class);

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#createClaimByReceiveCnfm(chn.bhmc.dms.par.pcm.vo.ClaimVO)
     */
    @Override
    public int createClaimByReceiveCnfm(ClaimVO claimVO) throws Exception {


        try{

            int    resultCnt       = 0;

            /*********************************************
             *  1. 클레임 번호를 생성한다.
             *********************************************/
            String claimDocNo =  selectNextClaimDocNo();
            claimVO.setClaimDocNo(claimDocNo);

            /*********************************************
             * 2. 클레임 생성 전 Validation 체크한다.
             *********************************************/
            if( (claimVO.getDlrCd() == null) || (claimVO.getDlrCd().isEmpty())){
                 //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (claimVO.getPltCd() == null) || (claimVO.getPltCd().isEmpty())){
                 //센터정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if( (claimVO.getBpCd() == null) || (claimVO.getBpCd().isEmpty())){
                 //공급업체정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
            }

            if( (claimVO.getClaimStatCd() == null) || (claimVO.getClaimStatCd().isEmpty())){
                 //클레임상태 정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimStatCd", null, LocaleContextHolder.getLocale())});
            }

            if( (claimVO.getClaimTargCd() == null) || (claimVO.getClaimTargCd().isEmpty())){
                 //클레임대상이 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTargetCd", null, LocaleContextHolder.getLocale())});
            }else{
                if(claimVO.getClaimTargCd().equals("02") &&  ((claimVO.getDlBpCd() == null) || (claimVO.getDlBpCd().isEmpty()))){
                     //클레임대상이 배송처인 경우 배송업체는 필수입니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.err.dlBpCdChkMsg", null, LocaleContextHolder.getLocale())});
                }
            }

            if( (claimVO.getClaimTp() == null) || (claimVO.getClaimTp().isEmpty())){
                 //클레임 사유정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTp", null, LocaleContextHolder.getLocale())});
            }

            if( (claimVO.getItemCd() == null) || (claimVO.getItemCd().isEmpty())){
                 //품목정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
            }

            if(claimVO.getClaimQty() == null || claimVO.getClaimQty() < 1){
                 //수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
            }

            if( (claimVO.getClaimUnitCd() == null) || (claimVO.getClaimUnitCd().isEmpty())){
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

            if( (claimVO.getInvcDocNo() == null) || (claimVO.getInvcDocNo().isEmpty())){
                 //송장정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcDocNo", null, LocaleContextHolder.getLocale())});
            }

            if(claimVO.getInvcDocLineNo() < 1){
                 //송장라인정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcDocLineNo", null, LocaleContextHolder.getLocale())});
            }


            /*********************************************
             * 3.  클레임정보를 생성한다.
             *********************************************/
            resultCnt = claimDAO.insertClaim(claimVO);

            if(resultCnt < 1){
                 //클레임등록이 처리되지 않았습니다.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
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
    public int createClaim(List<InvcItemVO> list, InvcVO invcVO) throws Exception {

        try{


            ClaimVO claimVO = new ClaimVO();
            String  claimDocNo;
            int     resultCnt = 0;

            for(int i = 0; i < list.size(); i++){
                list.get(i).setRegUsrId(LoginUtil.getUserId());

                /*********************************************
                 *  1. 클레임 번호를 생성 및 세션정보를 세팅한다.
                 *********************************************/
                claimDocNo =  selectNextClaimDocNo();
                claimVO.setClaimDocNo(claimDocNo);
                claimVO.setDlrCd(LoginUtil.getDlrCd());
                claimVO.setPltCd(LoginUtil.getPltCd());
                claimVO.setRegUsrId(LoginUtil.getUserId());


                /*********************************************
                 * 2. 클레임 등록 정보를 셋팅한다.
                 *********************************************/
                claimVO.setClaimStatCd("01");
                claimVO.setDelYn("N");
                claimVO.setBpCd(invcVO.getBpCd());
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
                claimVO.setDocFileNo(list.get(i).getDocFileNo());




                /*********************************************
                 * 2. 클레임 생성 전 Validation 체크한다.
                 *********************************************/
                if( (claimVO.getDlrCd() == null) || (claimVO.getDlrCd().isEmpty())){
                     //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                }

                if( (claimVO.getPltCd() == null) || (claimVO.getPltCd().isEmpty())){
                     //센터정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getBpCd() == null) || (list.get(i).getBpCd().isEmpty())){
                     //공급업체정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.pltCd", null, LocaleContextHolder.getLocale())});
                }

                if( (claimVO.getClaimStatCd() == null) || (claimVO.getClaimStatCd().isEmpty())){
                     //클레임상태 정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimStatCd", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getClaimTargCd() == null) || (list.get(i).getClaimTargCd().isEmpty())){
                     //클레임대상이 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTargetCd", null, LocaleContextHolder.getLocale())});
                }else{
                    if(list.get(i).getClaimTargCd().equals("02") && ( (list.get(i).getDlBpCd() == null) || (list.get(i).getDlBpCd().isEmpty()))){
                         //클레임대상이 배송처인 경우 배송업체는 필수입니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.err.dlBpCdChkMsg", null, LocaleContextHolder.getLocale())});
                    }
                }

                if( (list.get(i).getClaimTp() == null) || (list.get(i).getClaimTp().isEmpty())){
                     //클레임 사유정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTp", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getItemCd() == null) || (list.get(i).getItemCd().isEmpty())){
                     //품목정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                }

                if(list.get(i).getClaimQty() == null || list.get(i).getClaimQty() < 1){
                     //수량정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.qty", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getInvcUnitCd() == null) || (list.get(i).getInvcUnitCd().isEmpty())){
                     //단위정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("ser.lbl.unitCd", null, LocaleContextHolder.getLocale())});
                }

                if(list.get(i).getInvcPrc() == null || list.get(i).getInvcPrc() < 1){
                     //단가정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prc", null, LocaleContextHolder.getLocale())});
                }

                if(list.get(i).getInvcAmt() == null || list.get(i).getInvcAmt() < 1){
                   //금액정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.amt", null, LocaleContextHolder.getLocale())});
                }

                if( (list.get(i).getInvcDocNo() == null) || (list.get(i).getInvcDocNo().isEmpty())){
                     //송장정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcDocNo", null, LocaleContextHolder.getLocale())});
                }

                if(list.get(i).getInvcDocLineNo() < 1){
                     //송장라인정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcDocLineNo", null, LocaleContextHolder.getLocale())});
                }

                /*********************************************
                 * 3.  클레임정보를 생성한다.
                 *********************************************/
                resultCnt = claimDAO.insertClaim(claimVO);

                /*********************************************
                 * 4.  클레임 생성에 따라 송장품목 정보의 클레임 수량을 수정한다.
                 *********************************************/
                invcDAO.updateInvcItemByClaim(list.get(i));

                if(resultCnt < 1){
                     //클레임등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                }
            }

            return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#createOversAndShortsClaim(java.util.List, chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO)
     */
    @Override
    public int createOversAndShortsClaimByInvoice(List<OversAndShortsClaimItemVO> list,
            OversAndShortsClaimVO oversAndShortsClaimVO) throws Exception {

        String  claimDocNo;
        int     resultCnt = 0;


        claimDocNo =  selectNextOversAndShortsClaimDocNo();
        oversAndShortsClaimVO.setClaimNo(claimDocNo);

        if( (oversAndShortsClaimVO.getClaimNo() == null) || (oversAndShortsClaimVO.getClaimNo().isEmpty())){
            //클레임번호가 존재하지 않습니다.
           throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimNo", null, LocaleContextHolder.getLocale())});
        }

        //if( (oversAndShortsClaimVO.getBoxingNo() == null) || (oversAndShortsClaimVO.getBoxingNo().isEmpty())){
        if( (oversAndShortsClaimVO.getWaybillNo() == null) || (oversAndShortsClaimVO.getWaybillNo().isEmpty())){
            //송장번호가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mobisInvcNo", null, LocaleContextHolder.getLocale())});
        }

        if( oversAndShortsClaimVO.getArrivedDate() == null ){
            //도착일정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.arrvDt", null, LocaleContextHolder.getLocale())});
        }

        resultCnt = claimDAO.insertOversAndShortsClaim(oversAndShortsClaimVO);


        if(resultCnt < 1){
             //클레임등록이 처리되지 않았습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
        }


        for(int i = 0; i < list.size(); i++){
            list.get(i).setRegUsrId(LoginUtil.getUserId());
            list.get(i).setClaimNo(claimDocNo);
            list.get(i).setClaimLine(i + 1);

            /*********************************************
             * 2. 클레임 생성 전 Validation 체크한다.
             *********************************************/
            if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                 //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (list.get(i).getOrderNo() == null) || (list.get(i).getOrderNo().isEmpty())){
                 //구매번호가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcOrdNo", null, LocaleContextHolder.getLocale())});
            }


            if( (list.get(i).getPartNo() == null) || (list.get(i).getPartNo().isEmpty())){
                 //품목정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
            }

            if(list.get(i).getOrderNum() == null || list.get(i).getOrderNum() < 1){
                 //구매수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcQty", null, LocaleContextHolder.getLocale())});
            }

            if(list.get(i).getRealNum() == null || list.get(i).getRealNum() < 0){
                //실수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.grQty", null, LocaleContextHolder.getLocale())});
            }

            if(list.get(i).getClaimantNum() == null || list.get(i).getClaimantNum() < 1){
                //클레임수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimQty", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3.  클레임정보를 생성한다.
             *********************************************/
            resultCnt = claimDAO.insertOversAndShortsClaimItem(list.get(i));


            if(resultCnt < 1){
                 //클레임등록이 처리되지 않았습니다.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
            }
        }

        return resultCnt;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#createQualityClaim(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public int createQualityClaimByInvoice(List<QualityClaimVO> list) throws Exception {



        String  claimDocNo;
        int     resultCnt = 0;

        for(int i = 0; i < list.size(); i++){
            claimDocNo =  selectNextQualityClaimDocNo();
            list.get(i).setRegUsrId(LoginUtil.getUserId());
            list.get(i).setClaimNo(claimDocNo);

            /*********************************************
             * 2. 클레임 생성 전 Validation 체크한다.
             *********************************************/

            if( (list.get(i).getClaimNo() == null) || (list.get(i).getClaimNo().isEmpty())){
                //클레임번호가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimNo", null, LocaleContextHolder.getLocale())});
            }

            if( (list.get(i).getDlrCd() == null) || (list.get(i).getDlrCd().isEmpty())){
                 //딜러정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
            }

            if( (list.get(i).getOrderNo() == null) || (list.get(i).getOrderNo().isEmpty())){
                 //구매번호가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcOrdNo", null, LocaleContextHolder.getLocale())});
            }


            if( (list.get(i).getPartNo() == null) || (list.get(i).getPartNo().isEmpty())){
                 //품목정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
            }

            if( (list.get(i).getArrivalDate() == null)){
                //도착일자가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.arrvDt", null, LocaleContextHolder.getLocale())});
            }


            if(list.get(i).getClaimNum() == null || list.get(i).getClaimNum() < 1){
                //클레임수량정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimQty", null, LocaleContextHolder.getLocale())});
            }

            /*********************************************
             * 3.  클레임정보를 생성한다.
             *********************************************/
            resultCnt = claimDAO.insertQualityClaim(list.get(i));


            if(resultCnt < 1){
                 //클레임등록이 처리되지 않았습니다.
                throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
            }
        }

        return resultCnt;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#updateClaimCnfm(chn.bhmc.dms.par.pcm.vo.ClaimVO)
     */
    @Override
    public int updateClaimCnfm(List<ClaimVO> claimListVO) throws Exception {

        try{
            int claimListSize = claimListVO.size();
            int result = 0;

            for(int i = 0; i < claimListSize; i++){
                result =  claimDAO.updateClaimCnfm(claimListVO.get(i));

                if(result == 0){
                    //클레임 수정 실패
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                }
            }

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

        return 0;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#cancelClaimCnfm(chn.bhmc.dms.par.pcm.vo.ClaimVO)
     */
    @Override
    public int cancelClaimCnfm(ClaimVO claimVO) throws Exception {

        return 0;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#deleteClaimDoc(chn.bhmc.dms.par.pcm.vo.ClaimVO)
     */
    @Override
    public int deleteClaimDoc(ClaimVO claimVO) throws Exception {

        return 0;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectClaimItemByKey(chn.bhmc.dms.par.pcm.vo.ClaimSearchVO)
     */
    @Override
    public List<ClaimVO> selectClaimItemByKey(ClaimSearchVO searchVO) throws Exception {

        return null;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectClaimsByCondition(chn.bhmc.dms.par.pcm.vo.ClaimSearchVO)
     */
    @Override
    public List<ClaimVO> selectClaimsByCondition(ClaimSearchVO searchVO) throws Exception {

        return null;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectClaimsByConditionCnt(chn.bhmc.dms.par.pcm.vo.ClaimSearchVO)
     */
    @Override
    public int selectClaimsByConditionCnt(ClaimSearchVO searchVO) throws Exception {

        return 0;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectClaimItemByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<InvcItemVO> selectClaimItemByCondition(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectClaimItemByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectClaimItemByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectClaimItemByConditionCnt(InvcSearchVO searchVO) throws Exception {

        return invcDAO.selectClaimItemByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectClaimManageItemByCondition(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public List<ClaimVO> selectClaimManageItemByCondition(ClaimSearchVO searchVO) throws Exception {

        return claimDAO.selectClaimManageItemByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectClaimManageItemByConditionCnt(chn.bhmc.dms.par.pcm.vo.InvcSearchVO)
     */
    @Override
    public int selectClaimManageItemByConditionCnt(ClaimSearchVO searchVO) throws Exception {

        return claimDAO.selectClaimManageItemByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectQualityClaimByCondition(chn.bhmc.dms.par.pcm.vo.QualityClaimSearchVO)
     */
    @Override
    public List<QualityClaimVO> selectQualityClaimByCondition(QualityClaimSearchVO searchVO) throws Exception {

        return claimDAO.selectQualityClaimByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectQualityClaimByConditionCnt(chn.bhmc.dms.par.pcm.vo.QualityClaimSearchVO)
     */
    @Override
    public int selectQualityClaimByConditionCnt(QualityClaimSearchVO searchVO) throws Exception {

        return claimDAO.selectQualityClaimByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectQualityClaimByKey(chn.bhmc.dms.par.pcm.vo.QualityClaimSearchVO)
     */
    @Override
    public QualityClaimVO selectQualityClaimByKey(QualityClaimSearchVO searchVO) throws Exception {

        return claimDAO.selectQualityClaimByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectOversAndShortsClaimByCondition(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO)
     */
    @Override
    public List<OversAndShortsClaimVO> selectOversAndShortsClaimByCondition(OversAndShortsClaimSearchVO searchVO)
            throws Exception {

        return claimDAO.selectOversAndShortsClaimByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectOversAndShortsClaimByKey(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO)
     */
    @Override
    public OversAndShortsClaimVO selectOversAndShortsClaimByKey(OversAndShortsClaimSearchVO searchVO) throws Exception {

        return claimDAO.selectOversAndShortsClaimByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectOversAndShortsClaimInfcByKey(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO)
     */
    @Override
    public OversAndShortsClaimVO selectOversAndShortsClaimInfcByKey(OversAndShortsClaimSearchVO searchVO)
            throws Exception {

        return claimDAO.selectOversAndShortsClaimInfcByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectOversAndShortsClaimByConditionCnt(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO)
     */
    @Override
    public int selectOversAndShortsClaimByConditionCnt(OversAndShortsClaimSearchVO searchVO) throws Exception {

        return claimDAO.selectOversAndShortsClaimByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectOversAndShortsClaimItemsByKey(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO)
     */
    @Override
    public List<OversAndShortsClaimItemVO> selectOversAndShortsClaimItemsByKey(OversAndShortsClaimSearchVO searchVO)
            throws Exception {

        return claimDAO.selectOversAndShortsClaimItemsByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectOversAndShortsClaimInfcItemsByKey(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimSearchVO)
     */
    @Override
    public List<OversAndShortsClaimItemVO> selectOversAndShortsClaimInfcItemsByKey(OversAndShortsClaimSearchVO searchVO)
            throws Exception {

        return claimDAO.selectOversAndShortsClaimInfcItemsByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectNextClaimDocNo()
     */
    @Override
    public String selectNextClaimDocNo() throws Exception {
        try {
            return claimDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{"구매오더"});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectNextClaimDocNo()
     */
    @Override
    public String selectNextOversAndShortsClaimDocNo() throws Exception {
        try {
            return oversAndShortsClaimNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{"구매오더"});
        }
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#selectNextClaimDocNo()
     */
    @Override
    public String selectNextQualityClaimDocNo() throws Exception {
        try {
            return qualityClaimNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{"구매오더"});
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#updateQualityClaim(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public QualityClaimVO updateQualityClaim(QualityClaimVO qualityClaimVO) throws Exception {


        int     resultCnt = 0;

        qualityClaimVO.setDlrCd(LoginUtil.getDlrCd());
        qualityClaimVO.setRegUsrId(LoginUtil.getUserId());

        //클레임 번호가 없는 경우 클레임을 신규로 생성한다.
        if( (qualityClaimVO.getClaimNo() == null) || (qualityClaimVO.getClaimNo().isEmpty())){

            qualityClaimVO = createQualityClaim(qualityClaimVO);
        }else{
            if( (qualityClaimVO.getDlrCd() == null) || (qualityClaimVO.getDlrCd().isEmpty())){
                //딜러정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
           }

           if( (qualityClaimVO.getOrderNo() == null) || (qualityClaimVO.getOrderNo().isEmpty())){
                //구매번호가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcOrdNo", null, LocaleContextHolder.getLocale())});
           }

           if( (qualityClaimVO.getOrderLn() == null) || (qualityClaimVO.getOrderLn().isEmpty())){
               //오더라인정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.ordLine", null, LocaleContextHolder.getLocale())});
           }

           if( (qualityClaimVO.getClaimPerson() == null) || (qualityClaimVO.getClaimPerson().isEmpty())){
               //클레임신고인정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
           }

           if( (qualityClaimVO.getTelephone() == null) || (qualityClaimVO.getTelephone().isEmpty())){
               //신고인 연락처정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimPerson", null, LocaleContextHolder.getLocale())});
           }

           if( (qualityClaimVO.getPartNo() == null) || (qualityClaimVO.getPartNo().isEmpty())){
               //품목정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTelephone", null, LocaleContextHolder.getLocale())});
           }

           if( qualityClaimVO.getCarModel() < 1){
               //차형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.model", null, LocaleContextHolder.getLocale())});
           }

           if( qualityClaimVO.getClaimType() < 1){
               //클레임유형정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimType", null, LocaleContextHolder.getLocale())});
           }

           if( qualityClaimVO.getClaimType() < 1){
               //클레임방식정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealerClaimWay", null, LocaleContextHolder.getLocale())});
           }

           if( qualityClaimVO.getClaimType() < 1){
               //발송창고정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prcStrgeCd", null, LocaleContextHolder.getLocale())});
           }

           if( qualityClaimVO.getClaimType() < 1){
               //배송방식정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dlTp", null, LocaleContextHolder.getLocale())});
           }

           if( (qualityClaimVO.getArrivalDate() == null)){
               //도착일자가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.arrvDt", null, LocaleContextHolder.getLocale())});
           }


           if( (qualityClaimVO.getProblemDate() == null)){
               //문제발견일자일자가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.problemDate", null, LocaleContextHolder.getLocale())});
           }


           if(qualityClaimVO.getClaimNum() == null || qualityClaimVO.getClaimNum() < 1){
               //클레임수량정보가 존재하지 않습니다.
               throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimQty", null, LocaleContextHolder.getLocale())});
           }

           /*********************************************
            * 3.  클레임정보를 수정한다.
            *********************************************/
           resultCnt = claimDAO.updateQualityClaim(qualityClaimVO);


           if(resultCnt < 1){
                //클레임등록이 처리되지 않았습니다.
               throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
           }
        }



        return qualityClaimVO;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#createQualityClaim(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public QualityClaimVO createQualityClaim(QualityClaimVO qualityClaimVO) throws Exception {



        String  claimDocNo;
        int     resultCnt = 0;

        claimDocNo =  selectNextQualityClaimDocNo();
        qualityClaimVO.setRegUsrId(LoginUtil.getUserId());
        qualityClaimVO.setClaimNo(claimDocNo);

        /*********************************************
         * 2. 클레임 생성 전 Validation 체크한다.
         *********************************************/

        if( (qualityClaimVO.getClaimNo() == null) || (qualityClaimVO.getClaimNo().isEmpty())){
            //클레임번호가 존재하지 않습니다.
           throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimNo", null, LocaleContextHolder.getLocale())});
        }

        if( (qualityClaimVO.getDlrCd() == null) || (qualityClaimVO.getDlrCd().isEmpty())){
             //딜러정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
        }

        if( (qualityClaimVO.getOrderNo() == null) || (qualityClaimVO.getOrderNo().isEmpty())){
             //구매번호가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcOrdNo", null, LocaleContextHolder.getLocale())});
        }

        if( (qualityClaimVO.getOrderLn() == null) || (qualityClaimVO.getOrderLn().isEmpty())){
            //오더라인정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.ordLine", null, LocaleContextHolder.getLocale())});
        }

        if( (qualityClaimVO.getClaimPerson() == null) || (qualityClaimVO.getClaimPerson().isEmpty())){
            //클레임신고인정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
        }

        if( (qualityClaimVO.getTelephone() == null) || (qualityClaimVO.getTelephone().isEmpty())){
            //신고인 연락처정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimPerson", null, LocaleContextHolder.getLocale())});
        }

        if( (qualityClaimVO.getPartNo() == null) || (qualityClaimVO.getPartNo().isEmpty())){
            //품목정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimTelephone", null, LocaleContextHolder.getLocale())});
        }

        if( qualityClaimVO.getCarModel() < 1){
            //차형정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.model", null, LocaleContextHolder.getLocale())});
        }

        if( qualityClaimVO.getClaimType() < 1){
            //클레임유형정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimType", null, LocaleContextHolder.getLocale())});
        }

        if( qualityClaimVO.getClaimType() < 1){
            //클레임방식정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealerClaimWay", null, LocaleContextHolder.getLocale())});
        }

        if( qualityClaimVO.getClaimType() < 1){
            //발송창고정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prcStrgeCd", null, LocaleContextHolder.getLocale())});
        }

        if( qualityClaimVO.getClaimType() < 1){
            //배송방식정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dlTp", null, LocaleContextHolder.getLocale())});
        }

        if( (qualityClaimVO.getArrivalDate() == null)){
            //도착일자가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.arrvDt", null, LocaleContextHolder.getLocale())});
        }


        if( (qualityClaimVO.getProblemDate() == null)){
            //문제발견일자일자가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.problemDate", null, LocaleContextHolder.getLocale())});
        }


        if(qualityClaimVO.getClaimNum() == null || qualityClaimVO.getClaimNum() < 1){
            //클레임수량정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimQty", null, LocaleContextHolder.getLocale())});
        }

        /*********************************************
         * 3.  클레임정보를 생성한다.
         *********************************************/
        resultCnt = claimDAO.insertQualityClaim(qualityClaimVO);


        if(resultCnt < 1){
             //클레임등록이 처리되지 않았습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
        }

        return qualityClaimVO;
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#multiOversAndShortsClaim(chn.bhmc.dms.core.datatype.BaseSaveVO, chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO)
     */
    @Override
    public OversAndShortsClaimVO multiOversAndShortsClaim(BaseSaveVO<OversAndShortsClaimItemVO> obj,
            OversAndShortsClaimVO oversAndShortsClaimVO) throws Exception {

        try{
            int    resultCnt          = 0;
            int    claimLineNo        = 1;
            int    chkExistClaimItem  = 0;
            String userId = LoginUtil.getUserId();
            OversAndShortsClaimSearchVO chkOversAndShortsClaimSearchVO = new OversAndShortsClaimSearchVO();
            String claimDocNo;

            /*
            if( (oversAndShortsClaimVO.getClaimantNo() != null)&&(!oversAndShortsClaimVO.getClaimantNo().isEmpty())){
                //클레임번호(I/F)가 존재합니다.
               throw processException("par.info.itemInsertUseMsg", new String[]{messageSource.getMessage("par.lbl.claimantNo", null, LocaleContextHolder.getLocale())});
            }
            */

            //신규
            if( (oversAndShortsClaimVO.getClaimNo() == null) || (oversAndShortsClaimVO.getClaimNo().isEmpty())){
                claimDocNo =  selectNextOversAndShortsClaimDocNo();
                oversAndShortsClaimVO.setClaimNo(claimDocNo);
                oversAndShortsClaimVO.setRegUsrId(userId);

                if( (oversAndShortsClaimVO.getClaimNo() == null) || (oversAndShortsClaimVO.getClaimNo().isEmpty())){
                    //클레임번호가 존재하지 않습니다.
                   throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimNo", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getDlrCd() == null) || (oversAndShortsClaimVO.getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getBoxingNo() == null) || (oversAndShortsClaimVO.getBoxingNo().isEmpty())){
                    //송장번호가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mobisInvcNo", null, LocaleContextHolder.getLocale())});
                }

                if( oversAndShortsClaimVO.getArrivedDate() == null ){
                    //도착일정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.arrvDt", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getWaybillNo() == null) || (oversAndShortsClaimVO.getWaybillNo().isEmpty())){
                    //배송문서번호가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.waybillNo", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getIsIntact() < 0) || (oversAndShortsClaimVO.getIsIntact() > 1)){
                    //포장파손여부가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.isIntact", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getDescribe() == null) || (oversAndShortsClaimVO.getDescribe().isEmpty())){
                    //상세정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.describe", null, LocaleContextHolder.getLocale())});
                }

                resultCnt = claimDAO.insertOversAndShortsClaim(oversAndShortsClaimVO);


                if(resultCnt < 1){
                     //클레임등록이 처리되지 않았습니다.
                    throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                }

                for(OversAndShortsClaimItemVO itemVO : obj.getInsertList()){
                    chkOversAndShortsClaimSearchVO = new OversAndShortsClaimSearchVO();

                    chkOversAndShortsClaimSearchVO.setsDlrCd(oversAndShortsClaimVO.getDlrCd());
                    chkOversAndShortsClaimSearchVO.setsBoxingNo(oversAndShortsClaimVO.getBoxingNo());
                    chkOversAndShortsClaimSearchVO.setsOrderNo(itemVO.getOrderNo());
                    chkOversAndShortsClaimSearchVO.setsPartNo(itemVO.getPartNo());

                    itemVO.setRegUsrId(userId);
                    itemVO.setClaimNo(claimDocNo);
                    itemVO.setClaimLine(claimLineNo);
                    itemVO.setDlrCd(oversAndShortsClaimVO.getDlrCd());

                    /*********************************************
                     * 2. 클레임 생성 전 Validation 체크한다.
                     *********************************************/
                    if( (itemVO.getDlrCd() == null) || (itemVO.getDlrCd().isEmpty())){
                         //딜러정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getOrderNo() == null) || (itemVO.getOrderNo().isEmpty())){
                         //구매번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcOrdNo", null, LocaleContextHolder.getLocale())});
                    }


                    if( (itemVO.getPartNo() == null) || (itemVO.getPartNo().isEmpty())){
                         //품목정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getClaimantType() < 1) || (itemVO.getClaimantType() > 4)){
                        //클레임유형정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimType", null, LocaleContextHolder.getLocale())});
                    }else{
                        if(itemVO.getClaimantType() == 2){
                            if( (itemVO.getErrorPartNo() == null) || (itemVO.getErrorPartNo().isEmpty())){
                                //오배송품목정보가 존재하지 않습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.errorPartNo", null, LocaleContextHolder.getLocale())});
                            }
                        }
                    }

                    if( (itemVO.getClaimantType() < 1) || (itemVO.getClaimantType() > 4)){
                        //클레임유형정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimType", null, LocaleContextHolder.getLocale())});
                    }

                    if(itemVO.getOrderNum() == null || itemVO.getOrderNum() < 1){
                         //구매수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.invcQty", null, LocaleContextHolder.getLocale())});
                    }


                    if(itemVO.getRealNum() == null || itemVO.getRealNum() < 0){
                        //실제도착수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.realArrivedQty", null, LocaleContextHolder.getLocale())});
                    }

                    chkExistClaimItem = claimDAO.checkOversAndShortsClaimItemByDocNo(chkOversAndShortsClaimSearchVO);

                    if(chkExistClaimItem > 0){
                        //중복된 데이터가 존재합니다.
                       throw processException("global.err.duplicate");
                   }

                    /*********************************************
                     * 3.  클레임정보를 생성한다.
                     *********************************************/
                    resultCnt = claimDAO.insertOversAndShortsClaimItem(itemVO);


                    if(resultCnt < 1){
                         //클레임등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                    }

                    claimLineNo = claimLineNo + 1;
                }

            //수정
            }else{
                oversAndShortsClaimVO.setRegUsrId(LoginUtil.getUserId());
                resultCnt = claimDAO.updateOversAndShortsClaimStatus(oversAndShortsClaimVO);

                if(resultCnt < 1){
                    //클레임등록이 처리되지 않았습니다.
                   throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
               }

                for(OversAndShortsClaimItemVO itemVO : obj.getInsertList()){
                    chkOversAndShortsClaimSearchVO = new OversAndShortsClaimSearchVO();

                    chkOversAndShortsClaimSearchVO.setsDlrCd(oversAndShortsClaimVO.getDlrCd());
                    chkOversAndShortsClaimSearchVO.setsBoxingNo(oversAndShortsClaimVO.getBoxingNo());
                    chkOversAndShortsClaimSearchVO.setsOrderNo(itemVO.getOrderNo());
                    chkOversAndShortsClaimSearchVO.setsPartNo(itemVO.getPartNo());

                    claimLineNo = claimDAO.selectOversAndShortsClaimMaxLineNo(oversAndShortsClaimVO);

                    itemVO.setRegUsrId(userId);
                    itemVO.setClaimNo(oversAndShortsClaimVO.getClaimNo());
                    itemVO.setClaimLine(claimLineNo);
                    itemVO.setDlrCd(oversAndShortsClaimVO.getDlrCd());

                    /*********************************************
                     * 2. 클레임 생성 전 Validation 체크한다.
                     *********************************************/
                    if( (itemVO.getDlrCd() == null) || (itemVO.getDlrCd().isEmpty())){
                         //딜러정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getOrderNo() == null) || (itemVO.getOrderNo().isEmpty())){
                         //구매번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcOrdNo", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getPartNo() == null) || (itemVO.getPartNo().isEmpty())){
                         //품목정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getClaimantType() < 1) || (itemVO.getClaimantType() > 4)){
                        //클레임유형정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimType", null, LocaleContextHolder.getLocale())});
                    }else{
                        if(itemVO.getClaimantType() == 2){
                            if( (itemVO.getErrorPartNo() == null) || (itemVO.getErrorPartNo().isEmpty())){
                                //오배송품목정보가 존재하지 않습니다.
                                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.errorPartNo", null, LocaleContextHolder.getLocale())});
                            }
                        }
                    }

                    if(itemVO.getOrderNum() == null || itemVO.getOrderNum() < 1){
                         //구매수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.ordQty", null, LocaleContextHolder.getLocale())});
                    }


                    if(itemVO.getRealNum() == null || itemVO.getRealNum() < 0){
                        //실제도착수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.realArrivedQty", null, LocaleContextHolder.getLocale())});
                    }

                    chkExistClaimItem = claimDAO.checkOversAndShortsClaimItemByDocNo(chkOversAndShortsClaimSearchVO);

                    if(chkExistClaimItem > 0){
                        //중복된 데이터가 존재합니다.
                       throw processException("global.err.duplicate");
                   }

                    /*********************************************
                     * 3.  클레임정보를 생성한다.
                     *********************************************/
                    resultCnt = claimDAO.insertOversAndShortsClaimItem(itemVO);


                    if(resultCnt < 1){
                         //클레임등록이 처리되지 않았습니다.
                        throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                    }
                }

                for(OversAndShortsClaimItemVO itemVO : obj.getUpdateList()){
                    itemVO.setRegUsrId(userId);
                    itemVO.setDlrCd(oversAndShortsClaimVO.getDlrCd());

                    /*********************************************
                     * 2. 클레임 생성 전 Validation 체크한다.
                     *********************************************/
                    if( (itemVO.getDlrCd() == null) || (itemVO.getDlrCd().isEmpty())){
                         //딜러정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getClaimNo() == null) || (itemVO.getClaimNo().isEmpty())){
                         //클레임번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimDocNo", null, LocaleContextHolder.getLocale())});
                    }

                    if( itemVO.getClaimLine() < 1 ){
                        //클레임라인번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.lineNm", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getOrderNo() == null) || (itemVO.getOrderNo().isEmpty())){
                        //구매번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.purcOrdNo", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getPartNo() == null) || (itemVO.getPartNo().isEmpty())){
                         //품목정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.part", null, LocaleContextHolder.getLocale())});
                    }

                    if(itemVO.getClaimantType() == 2){
                        if( (itemVO.getErrorPartNo() == null) || (itemVO.getErrorPartNo().isEmpty())){
                            //오배송품목정보가 존재하지 않습니다.
                            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.errorPartNo", null, LocaleContextHolder.getLocale())});
                        }
                    }


                    if( (itemVO.getClaimantType() < 1) || (itemVO.getClaimantType() > 4)){
                        //클레임유형정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimType", null, LocaleContextHolder.getLocale())});
                    }

                    if(itemVO.getOrderNum() == null || itemVO.getOrderNum() < 1){
                         //구매수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.ordQty", null, LocaleContextHolder.getLocale())});
                    }


                    if(itemVO.getClaimantNum() == null || itemVO.getClaimantNum() < 1){
                        //클레임수량정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimQty", null, LocaleContextHolder.getLocale())});
                    }

                    /*********************************************
                     * 3.  클레임정보를 생성한다.
                     *********************************************/
                    resultCnt = claimDAO.updateOversAndShortsClaimItem(itemVO);


                    if(resultCnt < 1){
                         //클레임등록이 처리되지 않았습니다.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                    }
                }

                for(OversAndShortsClaimItemVO itemVO : obj.getDeleteList()){
                    itemVO.setRegUsrId(userId);
                    itemVO.setDlrCd(oversAndShortsClaimVO.getDlrCd());

                    /*********************************************
                     * 2. 클레임 생성 전 Validation 체크한다.
                     *********************************************/
                    if( (itemVO.getDlrCd() == null) || (itemVO.getDlrCd().isEmpty())){
                         //딜러정보가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dealer", null, LocaleContextHolder.getLocale())});
                    }

                    if( (itemVO.getClaimNo() == null) || (itemVO.getClaimNo().isEmpty())){
                         //클레임번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimDocNo", null, LocaleContextHolder.getLocale())});
                    }

                    if( itemVO.getClaimLine() < 1 ){
                        //클레임라인번호가 존재하지 않습니다.
                        throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.lineNm", null, LocaleContextHolder.getLocale())});
                    }


                    /*********************************************
                     * 3.  클레임정보를 생성한다.
                     *********************************************/
                    resultCnt = claimDAO.deleteOversAndShortsClaimItem(itemVO);


                    if(resultCnt < 1){
                         //클레임등록이 처리되지 않았습니다.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                    }
                }

                if( (oversAndShortsClaimVO.getClaimNo() == null) || (oversAndShortsClaimVO.getClaimNo().isEmpty())){
                    //클레임번호가 존재하지 않습니다.
                   throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.claimNo", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getDlrCd() == null) || (oversAndShortsClaimVO.getDlrCd().isEmpty())){
                    //딜러정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getBoxingNo() == null) || (oversAndShortsClaimVO.getBoxingNo().isEmpty())){
                    //송장번호가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.mobisInvcNo", null, LocaleContextHolder.getLocale())});
                }

                if( oversAndShortsClaimVO.getArrivedDate() == null ){
                    //도착일정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.arrvDt", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getWaybillNo() == null) || (oversAndShortsClaimVO.getWaybillNo().isEmpty())){
                    //배송문서번호가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.waybillNo", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getIsIntact() < 0) || (oversAndShortsClaimVO.getIsIntact() > 1)){
                    //포장파손여부가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.isIntact", null, LocaleContextHolder.getLocale())});
                }

                if( (oversAndShortsClaimVO.getDescribe() == null) || (oversAndShortsClaimVO.getDescribe().isEmpty())){
                    //상세정보가 존재하지 않습니다.
                    throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.describe", null, LocaleContextHolder.getLocale())});
                }

                resultCnt = claimDAO.updateOversAndShortsClaim(oversAndShortsClaimVO);


                if(resultCnt < 1){
                     //클레임등록이 처리되지 않았습니다.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                }
            }


            return oversAndShortsClaimVO;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendCreateQualityClaim(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public int sendCreateQualityClaim(QualityClaimVO qualityClaimVO) throws Exception {
        try{

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS501"); //클레임 신고 정보 신규 생성
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int resultCnt = 0;
            String returnStatus;
          //  String returnErrMsg;
            String returnClaimCode;
            //TODO [JuwonLee] base64 Encoding file convert
            byte[] fileUrl1;
            byte[] fileUrl2;
            byte[] fileUrl3;

            String base64TagFileUrlString;
            String base64PartFileUrlString;
            String base64PackFileUrlString;


            Map<String, Object> message          = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();
            message.put("DEALER_CODE",           qualityClaimVO.getDlrCd());
            message.put("ORDER_NO",              qualityClaimVO.getOrderNo());
            message.put("ORDER_LN",              qualityClaimVO.getOrderLn());
            message.put("PART_NO",               qualityClaimVO.getPartNo());
            message.put("ARRIVAL_DATE",          qualityClaimVO.getArrivalDateChar());
            message.put("CLAIM_NUM",             qualityClaimVO.getClaimNum().intValue());
            message.put("PROBLEM_DATE",          qualityClaimVO.getProblemDateChar());
            message.put("CAR_MODEL",             qualityClaimVO.getCarModel());
            message.put("CLAIM_TYPE",            qualityClaimVO.getClaimType());
            message.put("CLAIM_WAY",             qualityClaimVO.getDealerClaimWay());
            message.put("PDC_CODE",              qualityClaimVO.getPrcCode());
            message.put("DELIVERY_TYPE",         qualityClaimVO.getDeliveryType());
            message.put("DESCRIPTION",           qualityClaimVO.getDescription());
            message.put("CLAIM_PERSON",          qualityClaimVO.getClaimPerson());
            message.put("TELEPHONE",             qualityClaimVO.getTelephone());
            message.put("VIN",                   qualityClaimVO.getVin());
            message.put("ENGINE_CYLINDER",       qualityClaimVO.getEngineCylinder());
            message.put("TRANSPORT_NO",          qualityClaimVO.getTransportNo());
            message.put("DELIVERY_REMARK",       qualityClaimVO.getDeliveryRemark());
            message.put("IS_INDIVIDUAL_WRAPPED", qualityClaimVO.getIsIndividualWrapped());
            message.put("IS_PACKING_SOUND",      qualityClaimVO.getIsPackingSound());
            message.put("HAS_PART_FRAGMENT",     qualityClaimVO.getHasPartFragment());
            message.put("HAS_OUTER_WRAPPED",     qualityClaimVO.getHasOuterWrapper());
            message.put("IS_OUT_PACKING_SOUND",  qualityClaimVO.getIsOuterPackingSound());

            fileUrl1 = qualityClaimVO.getTagFileDataCont();
            base64TagFileUrlString  = new String(fileUrl1);

            //fileUrl1 = Base64.encode(qualityClaimVO.getTagFileDataCont());
            message.put("FILE_PATH_1",           base64TagFileUrlString);
            message.put("FILE_NAME_1",           qualityClaimVO.getTagFileUrl());
            //message.put("FILE_PATH_1",           qualityClaimVO.getTagFileUrl());
            //message.put("FILE_NAME_1",           qualityClaimVO.getTagFileName());
            //fileUrl2 = Base64.encode(qualityClaimVO.getParFileDataCont());

            fileUrl2 = qualityClaimVO.getParFileDataCont();
            base64PartFileUrlString  = new String(fileUrl2);

            message.put("FILE_PATH_2",           base64PartFileUrlString);
            message.put("FILE_NAME_2",           qualityClaimVO.getPartFileUrl());
            //message.put("FILE_PATH_2",           qualityClaimVO.getPartFileUrl());
            //message.put("FILE_NAME_2",           qualityClaimVO.getPartFileName());
            //fileUrl3 = Base64.encode(qualityClaimVO.getPackFileDataCont());

            fileUrl3 = qualityClaimVO.getPackFileDataCont();
            base64PackFileUrlString  = new String(fileUrl3);

            message.put("FILE_PATH_3",           base64PackFileUrlString);
            message.put("FILE_NAME_3",           qualityClaimVO.getPackFileUrl());
            //message.put("FILE_PATH_3",           qualityClaimVO.getPackFileUrl());
            //message.put("FILE_NAME_3",           qualityClaimVO.getPackFileName());
            //message.put("IF_RESULT_CODE",        '');

            // message add
            camelClient.addSendMessage(message);

            // File attachment
            /*
            List<Attachment> attachments = new ArrayList<Attachment>();
            Attachment attachmentTag  = new Attachment();
            Attachment attachmentPart = new Attachment();
            Attachment attachmentPack = new Attachment();

            attachmentTag.setData(base64TagFileUrlString);
            attachmentTag.setName(qualityClaimVO.getTagFileName());

            attachmentPart.setData(base64PartFileUrlString);
            attachmentPart.setName(qualityClaimVO.getPartFileName());

            attachmentPack.setData(base64PackFileUrlString);
            attachmentPack.setName(qualityClaimVO.getPackFileName());

            attachments.add(attachmentTag);
            attachments.add(attachmentPart);
            attachments.add(attachmentPack);
            camelClient.addSendAttachments(attachments);
            */


            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifMsg = receiveData.getFooter().getIfFailMsg();


            // success : Z, error : Z번외
            if("Z".equals(ifResult)){
                //send result purchase order update
                //resultCnt = claimDAO.updateQualityBMPClaim(qualityClaimVO);

                returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                returnStatus    = returnMessage.getStatus();
             //   returnErrMsg    = returnMessage.getErrorMessage();
                returnClaimCode = returnMessage.getClaimCode();

                //  success : 1, error : 1번외
                if("1".equals(returnStatus)){
                    if((returnClaimCode == null) || (returnClaimCode.isEmpty())){
                        throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                    }else{
                        //send result purchase order update
                        qualityClaimVO.setClaimCode(returnClaimCode);
                        resultCnt = claimDAO.updateQualityBMPClaim(qualityClaimVO);
                    }
                }else{
                    String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                    throw processException("par.err.claimSendMsgResult" + resultCode);
                    //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                }

            }else{
                LOGGER.error("Claim Interface Failed[sendCreateQualityClaim]",ifMsg);
                throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendCreateQualityClaim]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendUpdateQualityClaim(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public int sendUpdateQualityClaim(QualityClaimVO qualityClaimVO) throws Exception {

        try{

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS502"); //클레임 수정 정보 신규 생성
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int resultCnt = 0;
            String returnStatus;
        //    String returnErrMsg;
            //TODO [JuwonLee] base64 Encoding file convert
            byte[] fileUrl1;
            byte[] fileUrl2;
            byte[] fileUrl3;

            String base64TagFileUrlString;
            String base64PartFileUrlString;
            String base64PackFileUrlString;


            Map<String, Object> message          = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();
            message.put("CLAIM_CODE",            qualityClaimVO.getClaimCode());
            message.put("ARRIVAL_DATE",          qualityClaimVO.getArrivalDateChar());
            message.put("CLAIM_NUM",             qualityClaimVO.getClaimNum().intValue());
            message.put("PROBLEM_DATE",          qualityClaimVO.getProblemDateChar());
            message.put("CAR_MODEL",             qualityClaimVO.getCarModel());
            message.put("CLAIM_TYPE",            qualityClaimVO.getClaimType());
            message.put("CLAIM_WAY",             qualityClaimVO.getDealerClaimWay());
            message.put("PDC_CODE",              qualityClaimVO.getPrcCode());
            message.put("DELIVERY_TYPE",         qualityClaimVO.getDeliveryType());
            message.put("DESCRIPTION",           qualityClaimVO.getDescription());
            message.put("CLAIM_PERSON",          qualityClaimVO.getClaimPerson());
            message.put("TELEPHONE",             qualityClaimVO.getTelephone());
            message.put("VIN",                   qualityClaimVO.getVin());
            message.put("ENGINE_CYLINDER",       qualityClaimVO.getEngineCylinder());
            message.put("TRANSPORT_NO",          qualityClaimVO.getTransportNo());
            message.put("DELIVERY_REMARK",       qualityClaimVO.getDeliveryRemark());
            message.put("IS_INDIVIDUAL_WRAPPED", qualityClaimVO.getIsIndividualWrapped());
            message.put("IS_PACKING_SOUND",      qualityClaimVO.getIsPackingSound());
            message.put("HAS_PART_FRAGMENT",     qualityClaimVO.getHasPartFragment());
            message.put("HAS_OUTER_WRAPPED",     qualityClaimVO.getHasOuterWrapper());
            message.put("IS_OUT_PACKING_SOUND",  qualityClaimVO.getIsOuterPackingSound());

            fileUrl1 = qualityClaimVO.getTagFileDataCont();
            base64TagFileUrlString  = new String(fileUrl1);

            //fileUrl1 = Base64.encode(qualityClaimVO.getTagFileDataCont());
            message.put("FILE_PATH_1",           base64TagFileUrlString);
            message.put("FILE_NAME_1",           qualityClaimVO.getTagFileUrl());
            //message.put("FILE_NAME_1",           qualityClaimVO.getTagFileName());
            //fileUrl2 = Base64.encode(qualityClaimVO.getParFileDataCont());

            fileUrl2 = qualityClaimVO.getParFileDataCont();
            base64PartFileUrlString  = new String(fileUrl2);

            message.put("FILE_PATH_2",           base64PartFileUrlString);
            message.put("FILE_NAME_2",           qualityClaimVO.getPartFileUrl());
            //message.put("FILE_NAME_2",           qualityClaimVO.getPartFileName());
            //fileUrl3 = Base64.encode(qualityClaimVO.getPackFileDataCont());

            fileUrl3 = qualityClaimVO.getPackFileDataCont();
            base64PackFileUrlString  = new String(fileUrl3);

            message.put("FILE_PATH_3",           base64PackFileUrlString);
            message.put("FILE_NAME_3",           qualityClaimVO.getPackFileUrl());
            //message.put("FILE_NAME_3",           qualityClaimVO.getPackFileName());
            //message.put("IF_RESULT_CODE",        '');

            // message add
            camelClient.addSendMessage(message);

            // File attachment
            /*
            List<Attachment> attachments = new ArrayList<Attachment>();
            Attachment attachmentTag  = new Attachment();
            Attachment attachmentPart = new Attachment();
            Attachment attachmentPack = new Attachment();

            attachmentTag.setData(base64TagFileUrlString);
            attachmentTag.setName(qualityClaimVO.getTagFileName());

            attachmentPart.setData(base64PartFileUrlString);
            attachmentPart.setName(qualityClaimVO.getPartFileName());

            attachmentPack.setData(base64PackFileUrlString);
            attachmentPack.setName(qualityClaimVO.getPackFileName());

            attachments.add(attachmentTag);
            attachments.add(attachmentPart);
            attachments.add(attachmentPack);
            camelClient.addSendAttachments(attachments);
            */


            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifMsg = receiveData.getFooter().getIfFailMsg();

            // success : Z, error : Z번외
            if("Z".equals(ifResult)){
                //send result purchase order update

                returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                returnStatus    = returnMessage.getStatus();
            //    returnErrMsg    = returnMessage.getErrorMessage();

                //   success : 1, error : 1번외
                if("1".equals(returnStatus)){
                    resultCnt =  1;
                }else{
                    String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                    throw processException("par.err.claimUpdateSendMsgResult" + resultCode);
                    //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                }

            }else{
                LOGGER.error("Claim Interface Failed[sendUpdateQualityClaim]",ifMsg);
                throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendUpdateQualityClaim]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendDeleteQuelityClaim(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public int sendDeleteQuelityClaim(QualityClaimVO qualityClaimVO) throws Exception {

        try{

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS503"); //클레임 전송 정보 삭제
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int resultCnt = 0;
            String returnStatus;
          //  String returnErrMsg;

            Map<String, Object> message          = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();
            message.put("CLAIM_CODE",            qualityClaimVO.getClaimCode());

            // message add
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifMsg = receiveData.getFooter().getIfFailMsg();

            // success : Z, error : Z번외
            if("Z".equals(ifResult)){
                //send result purchase order update
                //인터페이스 완료 시 해당 클레임의 BMP클레임 코드를 삭제한다.

                returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                returnStatus    = returnMessage.getStatus();
               // returnErrMsg    = returnMessage.getErrorMessage();

                //   success : 1, error : 1번외
                if("1".equals(returnStatus)){
                    resultCnt = claimDAO.deleteQualityClaim(qualityClaimVO);
                }else{
                    String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                    throw processException("par.err.claimDeleteSendMsgResult" + resultCode);
                    //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                }

            }else{
                LOGGER.error("Claim Interface Failed[sendDeleteQuelityClaim]",ifMsg);
                throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendDeleteQuelityClaim]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendQuelityClaimStatus(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public int sendQuelityClaimStatus(List<QualityClaimVO>  list) throws Exception {
        try{

            int resultCnt = 0;
            CamelClient camelClient;
            Map<String, Object> message          = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();

            for(int i = 0; i < list.size(); i++){
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                camelClient = new CamelClient();
                camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId("PTS505"); //클레임건 상태 정보 전송
                camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
                String returnStatus;
               // String returnErrMsg;

                message          = new HashMap<String, Object>();
                returnMessage    = new ClaimInterfaceResultVO();
                message.put("CLAIM_CODES",           list.get(i).getClaimCode());
                message.put("WORN_STATUS",           list.get(i).getWornStatus());

                // message add
                camelClient.addSendMessage(message);

                Data receiveData = camelClient.sendRequest();
                String ifResult = receiveData.getFooter().getIfResult();
                String ifMsg = receiveData.getFooter().getIfFailMsg();

                // success : Z, error : Z번외
                if("Z".equals(ifResult)){
                    //send result purchase order update
                    //인터페이스 완료 시 해당 클레임의 상태정보를 수정한다.

                    returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                    returnStatus    = returnMessage.getStatus();
                   // returnErrMsg    = returnMessage.getErrorMessage();

                    //   success : 1, error : 1번외
                    if("1".equals(returnStatus)){
                        resultCnt = claimDAO.updateQualityClaimStatus(list.get(i));
                    }else{
                        String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                        throw processException("par.err.claimStatusSendMsgResult" + resultCode);
                        //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                    }

                }else{
                    LOGGER.error("Claim Interface Failed[sendQuelityClaimStatus]",ifMsg);
                    throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
                }
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendQuelityClaimStatus]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendQuelityClaimIsCheck(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public int sendQuelityClaimIsCheck(List<QualityClaimVO> list) throws Exception {
        try{

            int resultCnt = 0;
            Map<String, Object> message;
            ClaimInterfaceResultVO returnMessage;
            CamelClient camelClient;

            for(int i = 0; i < list.size(); i++){
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                camelClient = new CamelClient();
                camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId("PTS504"); //클레임건 회수 정보 수정 전송
                camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
                String returnStatus;
               // String returnErrMsg;

                message          = new HashMap<String, Object>();
                returnMessage    = new ClaimInterfaceResultVO();

                message.put("CLAIM_CODES",           list.get(i).getClaimCode());
                message.put("WORN_STATUS",           list.get(i).getWornStatus());
                message.put("IS_CHECK",              "1");

                // message add
                camelClient.addSendMessage(message);

                Data receiveData = camelClient.sendRequest();
                String ifResult = receiveData.getFooter().getIfResult();
                String ifMsg = receiveData.getFooter().getIfFailMsg();

                // success : Z, error : Z번외
                if("Z".equals(ifResult)){
                    //send result purchase order update
                    //인터페이스 완료 시 해당 클레임의 BMP클레임 코드를 삭제한다.

                    returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                    returnStatus    = returnMessage.getStatus();
                  //  returnErrMsg    = returnMessage.getErrorMessage();

                    //    success : 1, error : 1번외
                    if("1".equals(returnStatus)){
                        list.get(i).setIsCheck("1");
                        resultCnt = claimDAO.updateQualityClaimIsCheck(list.get(i));
                    }else{
                        String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                        throw processException("par.err.sendIsCheckClaimMsgResult" + resultCode);
                        //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                    }

                }else{
                    LOGGER.error("Claim Interface Failed[sendQuelityClaimIsCheck]",ifMsg);
                    throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
                }
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendQuelityClaimIsCheck]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendReClaimOrder(chn.bhmc.dms.par.pcm.vo.QualityClaimVO)
     */
    @Override
    public int sendReClaimOrder(List<QualityClaimVO> list) throws Exception {
        try{

            int resultCnt = 0;
            CamelClient camelClient;
            Map<String, Object> message          = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();

            for(int i = 0; i < list.size(); i++){
                list.get(i).setDlrCd(LoginUtil.getDlrCd());
                list.get(i).setRegUsrId(LoginUtil.getUserId());

                camelClient = new CamelClient();
                camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId("PTS506"); //클레임건 회수 운송장정보 수정 전송
                camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
                String returnStatus;
              //  String returnErrMsg;

                message          = new HashMap<String, Object>();
                returnMessage = new ClaimInterfaceResultVO();

                message.put("CLAIM_CODES",            list.get(i).getClaimCode());
                message.put("RECLAIM_ORDER",          list.get(i).getReclaimOrder());

                // message add
                camelClient.addSendMessage(message);

                Data receiveData = camelClient.sendRequest();
                String ifResult = receiveData.getFooter().getIfResult();
                String ifMsg = receiveData.getFooter().getIfFailMsg();

                // success : Z, error : Z번외
                if("Z".equals(ifResult)){
                    //send result purchase order update
                    //인터페이스 완료 시 해당 클레임의 BMP클레임 코드를 삭제한다.

                    returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                    returnStatus    = returnMessage.getStatus();
                 //   returnErrMsg    = returnMessage.getErrorMessage();

                   //   success : 1, error : 1번외
                   if("1".equals(returnStatus)){
                       resultCnt = claimDAO.updateReClaimOrder(list.get(i));
                   }else{
                       String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                       throw processException("par.err.sendIsCheckClaimMsgResult" + resultCode);
                       //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                   }

                }else{
                    LOGGER.error("Claim Interface Failed[sendReClaimOrder]",ifMsg);
                    throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
                }
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendReClaimOrder]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendQualityClaimBillNo(java.util.List)
     */
    @Override
    public int sendQualityClaimBillNo(List<QualityClaimVO> list) throws Exception {

        try{
            int resultCnt = 0;
            String returnStatus;
            //String returnErrMsg;
            CamelClient camelClient;
            Map<String, Object> message;
            ClaimInterfaceResultVO returnMessage;


            for(int i = 0; i < list.size(); i++){
                resultCnt = 0;
                list.get(i).setRegUsrId(LoginUtil.getUserId());
                list.get(i).setDlrCd(LoginUtil.getDlrCd());

                camelClient = new CamelClient();

                camelClient = camelClientFactory.createCamelClient();
                camelClient.setIfId("PTS507"); //클레임 영수증 번호 수정 전송
                camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

                message          = new HashMap<String, Object>();
                returnMessage    = new ClaimInterfaceResultVO();
                message.put("CLAIM_CODE",      list.get(i).getClaimCode());
                message.put("BILL_COL",         list.get(i).getBillNo());

                // message add
                camelClient.addSendMessage(message);

                Data receiveData = camelClient.sendRequest();
                String ifResult = receiveData.getFooter().getIfResult();
                String ifMsg = receiveData.getFooter().getIfFailMsg();

                // success : Z, error : Z외
                if("Z".equals(ifResult)){

                    returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                    returnStatus    = returnMessage.getStatus();
                    //returnErrMsg    = returnMessage.getErrorMessage();

                   //   success : 1, error : 1번외
                    if("1".equals(returnStatus)){
                        resultCnt = claimDAO.updateQualityClaimBillNo(list.get(i));
                    }else{
                        String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                        throw processException("par.err.claimUpdateBillNoMsgResult" + resultCode);
                        //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                    }

                }else{
                    LOGGER.error("Claim Interface Failed[sendQualityClaimBillNo]",ifMsg);
                    throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
                }

            }

         return resultCnt;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendCreateOversAndShortsClaim(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO, java.util.List)
     */
    @Override
    public int sendCreateOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO,
            List<OversAndShortsClaimItemVO> list) throws Exception {

        try{

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS511"); //과부족클레임 신고 정보 신규 생성
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int resultCnt = 0;
            String returnStatus;
            String returnErrMsg;
            String returnClaimCode;
            //TODO [JuwonLee] base64 Encoding file convert
            byte[] fileUrl;

            String base64FileUrlString;


            Map<String, Object> message          = new HashMap<String, Object>();

            List<Map<String, Object>> itemList   = new ArrayList<Map<String, Object>>();

            Map<String, Object> itemMessage      = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();
            message.put("CLAIM_INFO_TYPE",         "0");
            message.put("DEALER_CODE",             oversAndShortsClaimVO.getDlrCd());
            message.put("BOXING_NO",               oversAndShortsClaimVO.getBoxingNo());
            message.put("ARRIVED_DATE",            oversAndShortsClaimVO.getArrivedDateChar());
            message.put("WAYBILL_NO",              oversAndShortsClaimVO.getWaybillNo());
            message.put("IS_INTACT",               String.valueOf(oversAndShortsClaimVO.getIsIntact()));
            message.put("SELL_INVENTORY_NO",       oversAndShortsClaimVO.getSellInventoryNo());
            message.put("DELIVERY_INVENTORY_DATE", oversAndShortsClaimVO.getDeliveryInventoryDateChar());
            message.put("DELIVERY_INVENTORY_NO",   oversAndShortsClaimVO.getDeliveryInventoryNo());
            message.put("DESCRIBE",                oversAndShortsClaimVO.getDescribe());

            fileUrl = oversAndShortsClaimVO.getAtchFileCont();
            base64FileUrlString  = new String(fileUrl);

            //fileUrl1 = Base64.encode(qualityClaimVO.getTagFileDataCont());
            //message.put("FILE_URL",           base64TagFileUrlString);
            message.put("FILE_URL",            base64FileUrlString);
            message.put("FILE_NAME",           oversAndShortsClaimVO.getAttachmentName());

            // message add
            //camelClient.addSendMessage(message);

            for(int i = 0; i < list.size(); i++){
                itemMessage      = new HashMap<String, Object>();

                itemMessage.put("ORDER_NO",             list.get(i).getOrderNo());
                itemMessage.put("PART_NO",              list.get(i).getPartNo());
                itemMessage.put("CLAIMANT_TYPE",        list.get(i).getClaimantType());
                itemMessage.put("ERROR_PART_NO",        list.get(i).getErrorPartNo());
                itemMessage.put("ORDER_NUM",            list.get(i).getOrderNum().intValue());
                itemMessage.put("REAL_NUM",             list.get(i).getRealNum().intValue());
                itemMessage.put("CLAIMANT_NUM",         list.get(i).getClaimantNum().intValue());

                itemList.add(itemMessage);
            }
            message.put("CLAIM_PART", itemList);

            // message add
            //camelClient.addSendMessages(itemList);
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifMsg    = receiveData.getFooter().getIfFailMsg();


            // success : Z, error : Z번외
            if("Z".equals(ifResult)){
                //send result purchase order update
                //resultCnt = claimDAO.updateQualityBMPClaim(qualityClaimVO);

                returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                returnStatus    = returnMessage.getStatus();
                returnErrMsg    = returnMessage.getErrorMessage();

                //  success : 1, error : 1번외
                if("1".equals(returnStatus)){
                    returnClaimCode = returnMessage.getCode();
                    if((returnClaimCode == null) || (returnClaimCode.isEmpty())){
                        throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                    }else{
                        //send result purchase order update
                        oversAndShortsClaimVO.setClaimantNo(returnClaimCode);
                        resultCnt = claimDAO.updateOversAndShortsBMPClaim(oversAndShortsClaimVO);
                    }
                }else{
                    if("-4".equals(returnStatus)){
                        throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                    }else{
                        String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                        throw processException("par.err.oversAndShortsClaimSendMsgResult" + resultCode);
                        //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                    }
                }

            }else{
                LOGGER.error("Claim Interface Failed[sendCreateOversAndShortsClaim]",ifMsg);
                throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendCreateOversAndShortsClaim]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendUpdateOversAndShortsClaim(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO, java.util.List)
     */
    @Override
    public int sendUpdateOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO,
            List<OversAndShortsClaimItemVO> list) throws Exception {

        try{

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS515"); //과부족클레임 신고 수정
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int resultCnt = 0;
            String returnStatus;
            String returnErrMsg;
            String returnClaimCode;
          //TODO [JuwonLee] base64 Encoding file convert
            byte[] fileUrl;

            String base64FileUrlString;


            Map<String, Object> message          = new HashMap<String, Object>();
            Map<String, Object> itemMessage      = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();
            message.put("DEALER_CODE",             oversAndShortsClaimVO.getDlrCd());
            message.put("ARRIVED_DATE",            oversAndShortsClaimVO.getArrivedDateChar());
            message.put("WAYBILL_NO",              oversAndShortsClaimVO.getWaybillNo());
            message.put("IS_INTACT",               oversAndShortsClaimVO.getIsIntact());
            message.put("DELIVERY_INVENTORY_DATE", oversAndShortsClaimVO.getDeliveryInventoryDateChar());
            message.put("DELIVERY_INVENTORY_NO",   oversAndShortsClaimVO.getDeliveryInventoryNo());
            message.put("DESCRIBE",                oversAndShortsClaimVO.getDescribe());

            fileUrl = oversAndShortsClaimVO.getAtchFileCont();
            base64FileUrlString  = new String(fileUrl);

            //fileUrl1 = Base64.encode(qualityClaimVO.getTagFileDataCont());
            //message.put("FILE_URL",           base64TagFileUrlString);
            message.put("FILE_URL",            base64FileUrlString);
            message.put("FILE_NAME",           oversAndShortsClaimVO.getAttachmentName());


            for(int i = 0; i < list.size(); i++){
                itemMessage      = new HashMap<String, Object>();
                itemMessage.put("ORDER_NO",             list.get(i).getOrderNo());
                itemMessage.put("PART_NO",              list.get(i).getPartNo());
                itemMessage.put("CLAIMANT_TYPE",        list.get(i).getClaimantType());
                itemMessage.put("ERROR_PART_NO",        list.get(i).getErrorPartNo());
                itemMessage.put("ORDER_NUM",            list.get(i).getOrderNum());
                itemMessage.put("REAL_NUM",             list.get(i).getRealNum());
                itemMessage.put("CLAIMANT_NUM",         list.get(i).getClaimantNum());
                message.put("CLAIM_PART", itemMessage);
            }


            // message add
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifMsg    = receiveData.getFooter().getIfFailMsg();


            // success : Z, error : Z번외
            if("Z".equals(ifResult)){
                //send result purchase order update
                //resultCnt = claimDAO.updateQualityBMPClaim(qualityClaimVO);

                returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                returnStatus    = returnMessage.getStatus();
                returnErrMsg    = returnMessage.getErrorMessage();

                //  success : 1, error : 1번외
                if("1".equals(returnStatus)){
                    returnClaimCode = returnMessage.getCode();
                    if((returnClaimCode == null) || (returnClaimCode.isEmpty())){
                        throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("par.lbl.claim", null, LocaleContextHolder.getLocale())});
                    }else{
                        oversAndShortsClaimVO.setClaimantNo(returnClaimCode);
                        resultCnt = claimDAO.updateOversAndShortsBMPClaim(oversAndShortsClaimVO);
                    }
                }else{
                    if("-4".equals(returnStatus)){
                        throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                    }else{
                        String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                        throw processException("par.err.oversAndShortsClaimModifySendMsgResult" + resultCode);
                        //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                    }

                }

            }else{
                LOGGER.error("Claim Interface Failed[sendUpdateOversAndShortsClaim]",ifMsg);
                throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendUpdateOversAndShortsClaim]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.ClaimService#sendDeleteOversAndShortsClaim(chn.bhmc.dms.par.pcm.vo.OversAndShortsClaimVO, java.util.List)
     */
    @Override
    public int sendDeleteOversAndShortsClaim(OversAndShortsClaimVO oversAndShortsClaimVO) throws Exception {

        try{

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS516"); //과부족클레임 신고 정보 삭제
            camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
            int resultCnt = 0;
            String returnStatus;
            //String returnErrMsg;
            //TODO [JuwonLee] base64 Encoding file convert
            //byte[] fileUrl;
            //String base64FileUrlString;

            Map<String, Object> message          = new HashMap<String, Object>();
            ClaimInterfaceResultVO returnMessage = new ClaimInterfaceResultVO();
            //message.put("CLAIM_INFO_TYPE",         oversAndShortsClaimVO.getC);
            message.put("CODE",             oversAndShortsClaimVO.getClaimantNo());

            // message add
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifMsg    = receiveData.getFooter().getIfFailMsg();


            // success : Z, error : Z번외
            if("Z".equals(ifResult)){
                //send result purchase order update
                //resultCnt = claimDAO.updateQualityBMPClaim(qualityClaimVO);

                returnMessage   = receiveData.readMessage(ClaimInterfaceResultVO.class);
                returnStatus    = returnMessage.getStatus();
             //   returnErrMsg    = returnMessage.getErrorMessage();

                //  success : 1, error : 1번외
                if("1".equals(returnStatus)){

                }else{
                    String resultCode = (Integer.parseInt(returnStatus) * -1) + "Code";
                    throw processException("par.err.oversAndShortsClaimDeleteSendMsgResult" + resultCode);
                    //throw processException("par.lbl.ifErrMsgParam", new String[]{returnErrMsg});
                }

            }else{
                LOGGER.error("Claim Interface Failed[sendDeleteOversAndShortsClaim]",ifMsg);
                throw processException("par.lbl.ifErrMsgParam", new String[]{ifMsg});
            }

            return resultCnt;

        }catch(Exception e){
            LOGGER.error("Claim Interface Failed[sendDeleteOversAndShortsClaim]",e);
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        String jobType = "";
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        QualityClaimSearchVO searchVO = new QualityClaimSearchVO();
        OversAndShortsClaimSearchVO excessSearchVO = new OversAndShortsClaimSearchVO();

     // 차모델 PAR226
        List<CommonCodeVO> carModelList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR226", null, langCd);
        HashMap<String, String> carModelMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : carModelList ){
            carModelMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 클레임유형 PAR226
        List<CommonCodeVO> claimTypeList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR227", null, langCd);
        HashMap<String, String> claimTypeMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : claimTypeList ){
            claimTypeMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 딜러클레임방법유형 PAR228
        List<CommonCodeVO> dealerClaimWayList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR228", null, langCd);
        HashMap<String, String> dealerClaimWayMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : dealerClaimWayList ){
            dealerClaimWayMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // PDC PAR229
        List<CommonCodeVO> prcCodeList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR229", null, langCd);
        HashMap<String, String> prcCodeMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : prcCodeList ){
            prcCodeMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 운송유형 PAR230
        List<CommonCodeVO> deliveryTypeList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR230", null, langCd);
        HashMap<String, String> deliveryTypeMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : deliveryTypeList ){
            deliveryTypeMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 클레임카테고리 PAR241
        List<CommonCodeVO> claimCategoryList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR241", null, langCd);
        HashMap<String, String> claimCategoryMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : claimCategoryList ){
            claimCategoryMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 책임 PAR242
        List<CommonCodeVO> responsibilityList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR242", null, langCd);
        HashMap<String, String> responsibilityMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : responsibilityList ){
            responsibilityMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 보상여부 PAR244
        List<CommonCodeVO> isCompensationList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR244", null, langCd);
        HashMap<String, String> isCompensationMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : isCompensationList ){
            isCompensationMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 보상유형 PAR234
        List<CommonCodeVO> compensationWayList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR234", null, langCd);
        HashMap<String, String> compensationWayMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : compensationWayList ){
            compensationWayMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 거래표시 PAR235
        List<CommonCodeVO> dealMarkList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR235", null, langCd);
        HashMap<String, String> dealMarkMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : dealMarkList ){
            dealMarkMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 상태 PAR233
        List<CommonCodeVO> statusList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR233", null, langCd);
        HashMap<String, String> statusMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : statusList ){
            statusMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 상태 PAR224
        List<CommonCodeVO> excessStatusList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR239", null, langCd);
        HashMap<String, String> excessStatusMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : excessStatusList ){
            excessStatusMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 클레임건 처리 PAR243
        List<CommonCodeVO> wornDealList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR243", null, langCd);
        HashMap<String, String> wornDealMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : wornDealList ){
            wornDealMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 도착여부 PAR237
        List<CommonCodeVO> hasArrivedList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR237", null, langCd);
        HashMap<String, String> hasArrivedMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : hasArrivedList ){
            hasArrivedMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 변상수령증 PAR236
        List<CommonCodeVO> hasSubmitList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR237", null, langCd);
        HashMap<String, String> hasSubmitMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : hasSubmitList ){
            hasSubmitMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 클레임건 상태 PAR234
        List<CommonCodeVO> wornStatusList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR234", null, langCd);
        HashMap<String, String> wornStatusMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : wornStatusList ){
            wornStatusMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        // 도착여부 PAR232
        List<CommonCodeVO> isCheckList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR232", null, langCd);
        HashMap<String, String> isCheckMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : isCheckList ){
            isCheckMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        jobType = params.get("jobType").toString();

        if(jobType.equals("excessClaimDownload")){
            ObjectUtil.convertMapToObject(params, excessSearchVO, "beanName", "templateFile", "fileName");

            excessSearchVO.setsDlrCd(LoginUtil.getDlrCd());

            List<OversAndShortsClaimVO> excessClaimList = new ArrayList<OversAndShortsClaimVO>();

            excessClaimList = claimDAO.selectOversAndShortsClaimByCondition(excessSearchVO);

            ArrayList<OversAndShortsClaimVO> rsltList = new ArrayList<OversAndShortsClaimVO>();

            for( OversAndShortsClaimVO sResultVO : excessClaimList ){

                sResultVO.setStatusNm( excessStatusMap.get(String.valueOf(sResultVO.getStatus())));

                rsltList.add(sResultVO);
            }

            context.putVar("items", rsltList);
        }else{
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

            searchVO.setsDlrCd(LoginUtil.getDlrCd());

            List<QualityClaimVO> list = new ArrayList<QualityClaimVO>();

            if(jobType.equals("claimDownload")){
                list = selectQualityClaimByCondition(searchVO);
            }else if(jobType.equals("claimListDownload")){
                list = claimDAO.selectQualityClaimDownloadListByCondition(searchVO);
                context.putVar("dlrCd",LoginUtil.getDlrCd());
                context.putVar("dlrNm",LoginUtil.getDlrNm());
            }

            ArrayList<QualityClaimVO> rsltList = new ArrayList<QualityClaimVO>();

            for( QualityClaimVO sResultVO : list ){

                sResultVO.setCarModelNm( carModelMap.get(String.valueOf(sResultVO.getCarModel())));
                sResultVO.setClaimTypeNm( claimTypeMap.get(String.valueOf(sResultVO.getClaimType())));
                sResultVO.setDealerClaimWayNm( dealerClaimWayMap.get(String.valueOf(sResultVO.getDealerClaimWay())));
                sResultVO.setPrcCodeNm( prcCodeMap.get(String.valueOf(sResultVO.getPrcCode())));
                sResultVO.setDeliveryTypeNm( deliveryTypeMap.get(String.valueOf(sResultVO.getDeliveryType())));
                sResultVO.setClaimCategoryNm( claimCategoryMap.get(String.valueOf(sResultVO.getClaimCategory())));
                sResultVO.setResponsibilityNm( responsibilityMap.get(String.valueOf(sResultVO.getResponsibility())));
                sResultVO.setIsCompensation( isCompensationMap.get(sResultVO.getIsCompensation()));
                sResultVO.setCompensationWayNm( compensationWayMap.get(String.valueOf(sResultVO.getCompensationWay())));
                sResultVO.setDealMark( dealMarkMap.get(sResultVO.getDealMark()));
                sResultVO.setStatus( statusMap.get(sResultVO.getStatus()));
                sResultVO.setWornDealNm( wornDealMap.get(String.valueOf(sResultVO.getWornDeal())));
                sResultVO.setHasArrived( hasArrivedMap.get(sResultVO.getHasArrived()));
                sResultVO.setHasSubmit( hasSubmitMap.get(sResultVO.getHasSubmit()));
                sResultVO.setWornStatus( wornStatusMap.get(sResultVO.getWornStatus()));
                sResultVO.setIsCheck( isCheckMap.get(sResultVO.getIsCheck()));

                rsltList.add(sResultVO);
            }

            context.putVar("items", rsltList);
        }

    }


}
