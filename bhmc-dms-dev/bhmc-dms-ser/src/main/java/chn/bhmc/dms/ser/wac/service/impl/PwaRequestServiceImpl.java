package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cal.service.dao.CalculateDAO;
import chn.bhmc.dms.ser.cal.service.dao.CalculateDetailDAO;
import chn.bhmc.dms.ser.cal.vo.CalculateDetailVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.wac.service.PwaRequestService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnRequestService;
import chn.bhmc.dms.ser.wac.service.dao.PwaRequestDAO;
import chn.bhmc.dms.ser.wac.vo.PwaLbrVO;
import chn.bhmc.dms.ser.wac.vo.PwaPartVO;
import chn.bhmc.dms.ser.wac.vo.PwaSaveVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaRequestServiceImpl.java
 * @Description : PWA 요청 화면 서비스 구현 클래스
 * @author Kwon Ki Hyun
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("pwaRequestService")
public class PwaRequestServiceImpl extends HService implements PwaRequestService , JxlsSupport{


    @Resource(name="pwaRequestDAO")
    PwaRequestDAO pwaRequestDAO;

    @Autowired
    FileMgrService fileMgrService;

    /**
     * LTS MODEL SERVICE
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Autowired
    ServiceCommonService serviceCommonService;

    @Resource(name="pwaDocNoIdgenService")
    TableIdGenService pwaDocNoIdgenService;

    /**
     * 삼포 반품승인 서비스
     */
    @Autowired
    SanbaoReturnRequestService sanbaoReturnRequestService;
    
    /**
     * csr 62清单需求
     * 查询服务结算信息 贾明 2020-3-29 
     */
    @Resource(name="calculateDAO")
    CalculateDAO calculateDAO;
    /**
     * csr 62清单需求
     * 查询服务结算信息 贾明 2020-3-29 
     */
    @Resource(name="calculateDetailDAO")
    CalculateDetailDAO calculateDetailDAO;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectPwaRequestMainsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if(!StringUtil.isEmpty(searchVO.getsVinNo())){
            searchVO.setsVinLength(searchVO.getsVinNo().length());
        }
        return pwaRequestDAO.selectPwaRequestMainsByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<PwaVO> selectPwaRequestMainsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return pwaRequestDAO.selectPwaRequestMainsByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public PwaVO selectPwaRequestByKey(PwaSearchVO searchVO) throws Exception {



        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        //searchVO.setsLtsModelCd(ltsModelMappingService.selectLtsModelMapping(searchVO.getsVinNo()));

        LtsModelSearchVO ltsModelsearchVO = new LtsModelSearchVO();
        ltsModelsearchVO.setsVinNo(searchVO.getsVinNo());
        LtsModelMappingVO ltsMappingVO =  ltsModelMappingService.selectMappingLtsModelCdByKey(ltsModelsearchVO);
        searchVO.setsLtsModelCd(ltsMappingVO.getLtsModelCd());

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        PwaVO pwaVO = pwaRequestDAO.selectPwaRequestByKey(searchVO);
        if(pwaVO == null ) pwaVO = new PwaVO();

        if(!pwaVO.getVinNo().isEmpty()) {
        	Integer normWarrper = pwaRequestDAO.selectSpecialCarWarrantyEndInfo(pwaVO.getVinNo());
        	if(null != normWarrper) {
	        	if(null!=pwaVO.getWartDt()) {
	        		Date wartExpireDate = DateUtil.add(pwaVO.getWartDt(), Calendar.MONTH, normWarrper);
	        		Date  wartExpireDt = DateUtil.add(wartExpireDate, Calendar.DATE, -1);
	        		pwaVO.setWartExpireDt(wartExpireDt);
	        	}
        	}else {
        		if(null!=pwaVO.getWartDt()) {
        			pwaVO.setLtsModelCd(searchVO.getsLtsModelCd());
        			Date wartExpireDt = pwaRequestDAO.selectCarWarrantyEndDtByKey(pwaVO);
        			pwaVO.setWartExpireDt(wartExpireDt);
        		}
        	}
        }
        return  pwaVO;
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectPwaRequestLbrsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return pwaRequestDAO.selectPwaRequestLbrsByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<PwaLbrVO> selectPwaRequestLbrsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return pwaRequestDAO.selectPwaRequestLbrsByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectPwaRequestPartsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return pwaRequestDAO.selectPwaRequestPartsByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<PwaPartVO> selectPwaRequestPartsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return pwaRequestDAO.selectPwaRequestPartsByCondition(searchVO);
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public List<PwaLbrVO> selectRoLaborsByCondition(TabInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return pwaRequestDAO.selectRoLaborsByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRoLaborsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return pwaRequestDAO.selectRoLaborsByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectRoPartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return pwaRequestDAO.selectRoPartsByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<PwaPartVO> selectRoPartsByCondition(TabInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return pwaRequestDAO.selectRoPartsByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String selectPwaRequestMaxDocNo(String dlrCd) throws Exception {


        pwaDocNoIdgenService.getNextStringId();

        return pwaRequestDAO.selectPwaRequestMaxDocNo(dlrCd);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public String multiPwaRequests(PwaSaveVO saveVO) throws Exception {

        /**
         * CHECK LOGIC
         * 1.
         */

        PwaVO pwaVO = saveVO.getPwaFormVO();

       // log.debug("PWA VIN VO="+pwaVO.getVinNo());

        String user_id = LoginUtil.getUserId();
        String user_nm = LoginUtil.getUserNm();


        pwaVO.setRegUsrId(user_id);
        pwaVO.setUpdtUsrId(user_id);
        pwaVO.setPwaWrtrId(user_id);
        pwaVO.setPwaWrtrNm(user_nm);
        pwaVO.setDlrCd(LoginUtil.getDlrCd());

        String pwaDocNo = "";

        if(StringUtil.nullConvert(pwaVO.getPwaDocNo()).equals("")){

            /** PWA DOC NO 생성 **/
            pwaDocNo = pwaDocNoIdgenService.getNextStringId();
            pwaVO.setPwaStatCd("O");
            log.debug("pwaDocNo="+pwaDocNo);
            saveVO.setPwaDocNo(pwaDocNo);
            pwaVO.setPwaDocNo(pwaDocNo);
            //获取PWA弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态的 csr清单 　62 贾明 2020-3-27
            extendedWarClaimSetCheck(pwaVO);
            insertPwaRequests(pwaVO);
        }else{
        	//获取PWA弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态的 csr清单 　62 贾明 2020-3-27
        	extendedWarClaimSetCheck(pwaVO);
            updatePwaRequests(pwaVO);
        }

        //삼포 반품신청  수정
       /* if(!StringUtil.nullConvert(pwaVO.getReturnApproveNo()).equals("")){
            pwaVO.setPwaUseYn("Y");
            updateSanbaoReturnApproveNo(pwaVO);
        }*/


        saveVO.setPwaDocNo(pwaVO.getPwaDocNo());
        multiPwaLaborCode(saveVO);
        multiPwaPartCode(saveVO);

        return saveVO.getPwaDocNo();

    }

    /** 获取PWA弹框 延保索赔申请类型的PWA申请单，查询 并用是已经承认 状态的 csr清单 　62 贾明 2020-3-27 
     *  保存时  结算单关联过延保索赔结算类型的PWA单据；则提示  结算单已关联过PWA申请，请修改
     *  延保索赔结算单保存时,查询是否延保申请单有没有被其他 延保索赔结算单关联过.
     *   pwaVO.getPwaStatCd().equals("Q") 代表是申请操作
     *                                 O 代表取消申请
     *  start
     * @throws Exception 
     */
    
   public void  extendedWarClaimSetCheck(PwaVO pwaVO) throws Exception{
	   
	   if("C".equals(pwaVO.getPwaTpCd1()) && "S".equals(pwaVO.getRelatedId())){
           if(!StringUtil.nullConvert(pwaVO.getPwaRequiNo()).equals("")){
       		PwaSearchVO  pwaSearchVO = new PwaSearchVO();
       		pwaSearchVO.setsDlrCd(LoginUtil.getDlrCd());
       		pwaSearchVO.setsPwaRequiNo(pwaVO.getPwaRequiNo());
       		List<PwaVO>  pwaVOList = pwaRequestDAO.selectPwaRelateRequiByCondition(pwaSearchVO);
       		if(pwaVOList.size() > 0){
       			for(PwaVO pwaVOL : pwaVOList){
       				// “结算单已关联过PWA申请，请修改”  关联申请单号{0} 已关联过PWA申请单 {1},请修改
       				if(!pwaVO.getPwaDocNo().equals(pwaVOL.getPwaDocNo())){
       					throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("ser.info.coreeApplicationInfo", new String[]{pwaVO.getPwaRequiNo(),pwaVOL.getPwaDocNo()}, LocaleContextHolder.getLocale())});
       				}
       				
       			}
       		}
       		
       	}
       	//结算单的维修委托类型为普通维修，且结算状态为结算完成；“结算单不为普通维修类型”或“结算单不是结算完成状态”  查询结算单信息
           CalculateSearchVO searchVO = new CalculateSearchVO();
           //CalculateSearchVO searchVO
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
           searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
           searchVO.setsCalcDocNo(pwaVO.getCalcDocNo());
           List<CalculateVO> resvList = calculateDAO.selectCalculateListByCondition(searchVO);
           if(1 != resvList.size()){
          	 //关联结算单{0},不存在请修改！
				throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("ser.info.linkedStatementNotExitModify", new String[]{pwaVO.getCalcDocNo()}, LocaleContextHolder.getLocale())});
           }else{
          	 for(CalculateVO calculateVO : resvList){
          		 String calcStatCd = calculateVO.getCalcStatCd();//结算单状态  00  结算完成  05 服务收款
          		 boolean retCalStCd = false;
          		 if("00".equals(calcStatCd) || "05".equals(calcStatCd)){
          			 retCalStCd = false;
          		 }else {
          			 retCalStCd = true;
          		 }
          		 //关联结算单{0},不是结算完成状态
          		 if(retCalStCd){
          			 throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("ser.info.associatedStateNotSettled", new String[]{pwaVO.getCalcDocNo()}, LocaleContextHolder.getLocale())});
          		 }
          		 
          		 // RO_TP 01   普通维修   关联结算单{0},不为普通维修类型
          		 String roTp = calculateVO.getRoTp();
          		 if(!"01".equals(roTp)){
          			 throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("ser.info.associatedNotGeReType", new String[]{pwaVO.getCalcDocNo()}, LocaleContextHolder.getLocale())});
          		 }
          		 
          	 }
          	 
           }
           //结算总金额未被拆分,只有一条；“结算单不能被拆分结算”  并且结算单的应收金额等于PWA申请的合计金额。“结算单应收金额与PWA申请的合计金额不相等”
           List<CalculateDetailVO> calDeList = calculateDetailDAO.selectCalculateDetailsByCondition(searchVO);
           //结算总金额未被拆分,只有一条；“结算单不能被拆分结算”
           if(calDeList.size() > 1){
  			 throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("ser.info.associatedNotSplitSettlement", new String[]{pwaVO.getCalcDocNo()}, LocaleContextHolder.getLocale())});
           }
           String totOccrAmtStr = "";
           String paymAmtStr = "";
           //paymAmt  “结算单应收金额与PWA申请的合计金额不相等”
           if(calDeList.size() == 1){
          	 for(CalculateDetailVO calcDetaVO : calDeList){
          		 //calcDetaVO.getPaymAmt();//结算单应收金额 totOccrAmt
          		 //pwaVO.getTotOccrAmt(); //paw申请合计金额
          		 totOccrAmtStr = String.valueOf(pwaVO.getTotOccrAmt());
          		 paymAmtStr = String.valueOf(calcDetaVO.getPaymAmt());
          		 if(!totOccrAmtStr.equals(paymAmtStr)){
          			 throw processException("global.info.promptInfo", new String[]{messageSource.getMessage("ser.info.calcReceivableNotEqualTotal", new String[]{pwaVO.getCalcDocNo()}, LocaleContextHolder.getLocale())});
          		 }
          	 }
           }
       }
   } 

    public void multiPwaLaborCode(PwaSaveVO saveVO)throws Exception{

        String user_id = LoginUtil.getUserId();
        BaseSaveVO<PwaLbrVO>  objVO = saveVO.getPwaLbrSaveVO();

        //
        /**
         * 1. 공임 코드 가 ZZ 코드 일경우 금액은 0 수량은 1 처리 한다.
         * 2. ZZ 또는 TT 코드는 1개만 입력 가능
         * 3. TT 코드는 PWA 유형코드 2번을 필수로 입력 해야된다.
         * 4. PWA 유형이 G (Good Will )일경우 금액은 직접입력한다.
         */

        for(PwaLbrVO lbrVO : objVO.getInsertList()){
            lbrVO.setDlrCd(LoginUtil.getDlrCd());
            lbrVO.setPwaDocNo(saveVO.getPwaDocNo());
            lbrVO.setRegUsrId(user_id);
            insertPwaRequestLabor(lbrVO);
        }
        for(PwaLbrVO lbrVO : objVO.getUpdateList()){
            lbrVO.setDlrCd(LoginUtil.getDlrCd());
            lbrVO.setRegUsrId(user_id);
            lbrVO.setPwaDocNo(saveVO.getPwaDocNo());
            updatePwaRequestLabor(lbrVO);
        }
        for(PwaLbrVO lbrVO : objVO.getDeleteList()){
            lbrVO.setDlrCd(LoginUtil.getDlrCd());
            lbrVO.setPwaDocNo(saveVO.getPwaDocNo());
            deletePwaRequestLabor(lbrVO);
        }



    }

    public void multiPwaPartCode(PwaSaveVO saveVO)throws Exception{

        String user_id = LoginUtil.getUserId();
        BaseSaveVO<PwaPartVO> objVO = saveVO.getPwaPartSaveVO();

        for(PwaPartVO partVO : objVO.getInsertList()){
            partVO.setDlrCd(LoginUtil.getDlrCd());
            partVO.setPwaDocNo(saveVO.getPwaDocNo());
            partVO.setRegUsrId(user_id);
            insertPwaRequestPart(partVO);
        }
        for(PwaPartVO partVO : objVO.getUpdateList()){
            partVO.setDlrCd(LoginUtil.getDlrCd());
            partVO.setUpdtUsrId(user_id);
            partVO.setPwaDocNo(saveVO.getPwaDocNo());
            updatePwaRequestPart(partVO);
        }
        for(PwaPartVO partVO : objVO.getDeleteList()){

            partVO.setDlrCd(LoginUtil.getDlrCd());
            partVO.setPwaDocNo(saveVO.getPwaDocNo());
            deletePwaRequestPart(partVO);
        }

    }



    /*
     * {@inheritDoc}
     */
    @Override
    public int insertPwaRequests(PwaVO pwaVO) throws Exception {

        return pwaRequestDAO.insertPwaRequests(pwaVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int updatePwaRequests(PwaVO pwaVO) throws Exception {

        return pwaRequestDAO.updatePwaRequests(pwaVO);
    }


    /**
     *
     *  반품승인 번호를 삭제 한다.
     *
     * @param saveVO - 클레임 요청 수정 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    public void deleteApproveNo(PwaVO pwaVO)throws Exception{


        if(StringUtil.nullConvert(pwaVO.getDlrCd()).equals("")){
            pwaVO.setDlrCd(LoginUtil.getDlrCd());
        }
        pwaVO.setUpdtUsrId(LoginUtil.getUserId());
        pwaVO.setPwaUseYn("N");

        pwaRequestDAO.updatePwaRequests(pwaVO);

        /** 승인된 삼포 반품  NO 를 사용한다.**/
        //updateSanbaoReturnApproveNo(pwaVO);

    }

    /**
     *
     * 승인된 삼포 반품  NO  사용 정보 수정
     *
     * @param claimReqVO
     * @return
     * @throws Exception
     */
    public int updateSanbaoReturnApproveNo(PwaVO pwaVO)throws Exception{

        int resultCnt = 0;
        if(!StringUtil.nullConvert(pwaVO.getReturnApproveNo()).equals("")){

            /** 승인된 삼포 반품  NO 를 사용한다.**/
            SanbaoReturnVO sanbaoReturnVO = new SanbaoReturnVO();
            sanbaoReturnVO.setDlrCd(pwaVO.getDlrCd());
            sanbaoReturnVO.setVinNo(pwaVO.getVinNo());
            sanbaoReturnVO.setPwaUseYn( pwaVO.getPwaUseYn() );
            sanbaoReturnVO.setReturnApproveNo(pwaVO.getReturnApproveNo());
            sanbaoReturnVO.setPreFixId("PWA");
            sanbaoReturnVO.setUpdtUsrId(pwaVO.getUpdtUsrId());
            resultCnt= sanbaoReturnRequestService.updateSanbaoReturnApprovePWA(sanbaoReturnVO);
        }


        return resultCnt;
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public void deletePwaRequests(PwaVO pwaVO) throws Exception {


        pwaVO.setDlrCd(LoginUtil.getDlrCd());
        pwaRequestDAO.deletePwaRequests(pwaVO);
        pwaRequestDAO.deletePwaRequestLaborAll(pwaVO);
        pwaRequestDAO.deletePwaRequestPartAll(pwaVO);

        if ( !StringUtil.nullConvert( pwaVO.getFileKeyNm()).equals("")){
            deleteFileInfo(pwaVO.getFileKeyNm());
        }

        int delCnt = selectPwaRequestIfSendByConditionCnt(pwaVO);
        if(delCnt > 0 ){
          //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("DLR_CD", pwaVO.getDlrCd());
            message.put("VIN_NO", pwaVO.getVinNo());
            message.put("PWA_DOC_NO", pwaVO.getPwaDocNo());
            serviceCommonService.executeCamelClent(message,"SER050");
        }
    }

    public int deleteFileInfo(String fileDocNo)throws Exception{

        int cnt = 0;
        if( fileMgrService.deleteFileItemsByFileDocNo(fileDocNo) >0 ){
           cnt =  fileMgrService.deleteFileDoc(fileDocNo);
        }

        return cnt;
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public int insertPwaRequestLabor(PwaLbrVO lbrVO) throws Exception {

        return pwaRequestDAO.insertPwaRequestLabor(lbrVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int updatePwaRequestLabor(PwaLbrVO lbrVO) throws Exception {

        return pwaRequestDAO.updatePwaRequestLabor(lbrVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int deletePwaRequestLabor(PwaLbrVO lbrVO) throws Exception {

        return pwaRequestDAO.deletePwaRequestLabor(lbrVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int insertPwaRequestPart(PwaPartVO partVO) throws Exception {

        return pwaRequestDAO.insertPwaRequestPart(partVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int updatePwaRequestPart(PwaPartVO partVO) throws Exception {

        return pwaRequestDAO.updatePwaRequestPart(partVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int deletePwaRequestLaborAll(PwaVO pwaVO) throws Exception {

        return pwaRequestDAO.deletePwaRequestLaborAll(pwaVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int deletePwaRequestPartAll(PwaVO pwaVO) throws Exception {

        return pwaRequestDAO.deletePwaRequestPartAll(pwaVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int deletePwaRequestPart(PwaPartVO partVO) throws Exception {

        return pwaRequestDAO.deletePwaRequestPart(partVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int updatePwaRequestStat(PwaVO pwaVO) throws Exception {

        String user_id = LoginUtil.getUserId();

        pwaVO.setUpdtUsrId(user_id);
        pwaVO.setDlrCd(LoginUtil.getDlrCd());

        log.info("PWA VO="+pwaVO.toString());

        //요청 취소전 상태
        String pwaStatCd = selectPwaRequestStatChkByKey(pwaVO);

        int resultCnt = pwaRequestDAO.updatePwaRequestStat(pwaVO);


        if(resultCnt > 0 ){
            //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("DLR_CD", pwaVO.getDlrCd());
            message.put("VIN_NO", pwaVO.getVinNo());
            message.put("PWA_DOC_NO", pwaVO.getPwaDocNo());

            if(pwaVO.getPwaStatCd().equals("Q")){

                if(resultCnt > 0 ){
                    // inteface 저장
                    pwaRequestDAO.insertPwaRequestToIf(pwaVO);

                    PwaSearchVO searchVO = new PwaSearchVO();
                    searchVO.setsDlrCd(pwaVO.getDlrCd());
                    searchVO.setsVinNo(pwaVO.getVinNo());
                    searchVO.setsPwaDocNo(pwaVO.getPwaDocNo());

                    try{

                        int pwaHeaderCnt = pwaRequestDAO.selectPwaRequestMainsByConditionCnt(searchVO);

                        //CamelClent Call
                        serviceCommonService.executeCamelClent(message,"SER002");
                        serviceCommonService.executeCamelClent(message,"SER003");
                        if(pwaHeaderCnt > 0 ) serviceCommonService.executeCamelClent(message,"SER001");

                    }catch(Exception e){

                        //PWA 상태 Rollback
                        pwaVO.setPwaStatCd("O");
                        pwaRequestDAO.updatePwaRequestRollBack(pwaVO);
                        throw e;

                    }

                }
            }else{

                //요청 취소전 상태 체크
                if(pwaStatCd.equals("S") || pwaStatCd.equals("A")){
                    throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())});
                }

                pwaVO.setIfResltYn("N");
                int delCnt = selectPwaRequestIfSendByConditionCnt(pwaVO);

                if(delCnt == 0 ){
                    serviceCommonService.executeCamelClent(message,"SER050");
                }
//                receiveData = deletePwaRequestToIf(pwaVO);
            }

        }

        return resultCnt;
    }


    /**
    *
    * PWA 요청  인터페이스 전송 여부 조회
    *
    * @param saveVO - PWA 요청  인터페이스 전송 여부 조회
    * @return bindingResult
    * @throws Exception
    */
   public int selectPwaRequestIfSendByConditionCnt(PwaVO pwaVO) throws Exception{

       int cnt = pwaRequestDAO.selectPwaRequestIfSendByConditionCnt(pwaVO);

       if( cnt > 0 ){
           deleteIfPwaRequests(pwaVO);
           deleteIfPwaRequestLabor(pwaVO);
           deleteIfPwaRequestPart(pwaVO);
       }

       return cnt;
   }

   /**
   *
   * PWA 요청 인터페이스  정보를 삭제한다.
   *
   * @param saveVO - PWA 요청 부품 전체 삭제  목록을 포함하는 SaveVO
   * @return bindingResult
   * @throws Exception
   */
   public int deleteIfPwaRequests(PwaVO pwaVO) throws Exception{

       return pwaRequestDAO.deleteIfPwaRequests(pwaVO);
   }

   /**
   *
   * PWA 요청 부품 인터페이스 정보를 삭제한다.
   *
   * @param saveVO - PWA 요청 부품 삭제 목록을 포함하는 SaveVO
   * @return bindingResult
   * @throws Exception
   */
   public int deleteIfPwaRequestLabor(PwaVO pwaVO) throws Exception{

       return pwaRequestDAO.deleteIfPwaRequestLabor(pwaVO);
   }

   /**
    *
    * PWA 요청 부품 인터페이스  정보를 삭제한다.
    *
    * @param saveVO - PWA 요청 부품 삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
   public int deleteIfPwaRequestPart(PwaVO pwaVO) throws Exception{

       return pwaRequestDAO.deleteIfPwaRequestPart(pwaVO);
   }



    /**
    *
    * PWA 요청 상태 정보를 조회 한다.
    *
    * @param saveVO - PWA 요청 상태 정보를 조회 한다.
    * @return bindingResult
    * @throws Exception
    */
   public String selectPwaRequestStatChkByKey(PwaVO pwaVO) throws Exception{

       String pwaStatCd = pwaRequestDAO.selectPwaRequestStatChkByKey(pwaVO);

       return pwaStatCd;
   }

   /**
     * 클레임에서 사용된 RO NO를  승인된 PWA 에 등록한다.
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int updatePwaApproveNoInClaim(PwaVO pwaVO) throws Exception {

        return pwaRequestDAO.updatePwaApproveNoInClaim(pwaVO);
    }
    
    @Override
	public int selectPwaRelateRequiMainsByConditionCnt(PwaSearchVO searchVO)
			throws Exception {
		
		 searchVO.setsDlrCd(LoginUtil.getDlrCd());
		return pwaRequestDAO.selectPwaRelateRequiMainsByConditionCnt(searchVO);
	}

	@Override
	public List<PwaVO> selectPwaRelateRequiMainsByCondition(PwaSearchVO searchVO)
			throws Exception {
		
		 searchVO.setsDlrCd(LoginUtil.getDlrCd());
		return  pwaRequestDAO.selectPwaRelateRequiMainsByCondition(searchVO);
	}


    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        PwaSearchVO searchVO = new PwaSearchVO();

        if(!StringUtils.isBlank(params.get("sFromDt").toString())){
            String sFromDt = params.get("sFromDt").toString();
            Date dFromDt = DateUtil.convertToDate(sFromDt);
            searchVO.setsFromDt(dFromDt);
        }
        if(!StringUtils.isBlank(params.get("sToDt").toString())){
            String sToDt = params.get("sToDt").toString();
            Date dToDt = DateUtil.convertToDate(sToDt);
            searchVO.setsToDt(dToDt);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<PwaVO> list = selectPwaRequestMainsByCondition(searchVO);

        context.putVar("items", list);

    }



   





}
