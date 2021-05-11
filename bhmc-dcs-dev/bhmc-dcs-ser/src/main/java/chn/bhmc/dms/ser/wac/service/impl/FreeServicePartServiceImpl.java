package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.FreeServicePartService;
import chn.bhmc.dms.ser.wac.service.dao.FreeServicePartDAO;
import chn.bhmc.dms.ser.wac.vo.FreeServicePartSearchVO;
import chn.bhmc.dms.ser.wac.vo.FreeServicePartVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FreeServicePartServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 20.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("freeServicePartService")
public class FreeServicePartServiceImpl extends HService implements FreeServicePartService,JxlsSupport {


    @Resource(name="freeServicePartDAO")
    FreeServicePartDAO freeServicePartDAO;


    @Resource(name="freeServicePartDocNoIdgenService")
    TableIdGenService freeServicePartDocNoIdgenService;

    @Resource(name="freeServicePartAprDocNoIdgenService")
    TableIdGenService freeServicePartAprDocNoIdgenService;

    @Autowired
    ServiceCommonService serviceCommonService;



    /**
     *
     * 면비 부품 등록/수정
     *
     * @param freeServicePartVO
     * @return
     * @throws Exception
     */
    public String multiFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception{


        String dlrCd = LoginUtil.getDlrCd();
        String userNm = LoginUtil.getUserNm();
        String userId = LoginUtil.getUserId();

        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);


        if(StringUtil.nullConvert(freeServicePartVO.getDlrCd()).equals("")){
            freeServicePartVO.setDlrCd(dlrCd);
        }
        freeServicePartVO.setRegUsrId(userId);
        freeServicePartVO.setUpdtUsrId(userId);

        String statCd = freeServicePartVO.getFreeItemStatCd();

        freeServicePartVO.setUpdtDt(toDate);

        //면비 부품  승인일경우
        if(statCd.equals("HA")){
            String approveNo = freeServicePartAprDocNoIdgenService.getNextStringId();
            freeServicePartVO.setFreeItemApproveNo(approveNo);
            freeServicePartVO.setBhmcJudgId(userId);
            freeServicePartVO.setBhmcJudgNm(userNm);
            freeServicePartVO.setBhmcConfirmDt(toDate);

        }else if(statCd.equals("ZA")){

            freeServicePartVO.setSpyrJudgId(userId);
            freeServicePartVO.setSpyrJudgNm(userNm);
            freeServicePartVO.setSpyrJudgDt(toDate);

        }
        int resultCnt = updateFreeServicePart(freeServicePartVO);
        if(resultCnt > 0){

          //DCS-DMS EAI InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("DLR_CD", freeServicePartVO.getDlrCd());
            message.put("FREE_ITEM_DOC_NO", freeServicePartVO.getFreeItemDocNo());
            message.put("VIN_NO",freeServicePartVO.getVinNo());
            message.put("FREE_ITEM_STAT_CD", freeServicePartVO.getFreeItemStatCd());
            //법인 승인
            message.put("BHMC_CONFIRM_DT", DateUtil.convertToDateTimeString(freeServicePartVO.getBhmcConfirmDt()));
            message.put("BHMC_JUDG_ID", freeServicePartVO.getBhmcJudgId());
            message.put("BHMC_JUDG_NM", freeServicePartVO.getBhmcJudgNm());
            message.put("BHMC_JUDG_PROC_CONT", freeServicePartVO.getBhmcJudgProcCont());
            message.put("FREE_ITEM_APPROVE_NO", freeServicePartVO.getFreeItemApproveNo());
            message.put("UPDT_USR_ID", freeServicePartVO.getUpdtUsrId());
            message.put("UPDT_DT", DateUtil.convertToDateTimeString(freeServicePartVO.getUpdtDt()));
            //업체승인
            message.put("SPYR_JUDG_DT", DateUtil.convertToDateTimeString(freeServicePartVO.getSpyrJudgDt()));
            message.put("SPYR_JUDG_ID", freeServicePartVO.getSpyrJudgId());
            message.put("SPYR_JUDG_NM", freeServicePartVO.getSpyrJudgNm());
            message.put("SPYR_PROC_CONT", freeServicePartVO.getSpyrProcCont());
            message.put("SPYR_FREE_ITEM_SEND_DT", DateUtil.convertToDateTimeString(freeServicePartVO.getSpyrFreeItemSendDt()));
            message.put("SPYR_FREE_ITEM_RTN_INVC_NO", freeServicePartVO.getSpyrFreeItemRtnInvcNo());
            message.put("FREE_ITEM_EXPS_CMP_NM", freeServicePartVO.getFreeItemExpsCmpNm());
            message.put("SPYR_NM", freeServicePartVO.getSpyrNm());



            serviceCommonService.executeEaiCall(freeServicePartVO.getDlrCd(),"SER046",message,"Y");
        }else{
            throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("ser.title.freeItemRequest", null, LocaleContextHolder.getLocale())});
        }



        return freeServicePartVO.getFreeItemDocNo();

    }


   /**
   *
   * 면비부품 상태 정보를 조회한다.
   *
   * @param searchVO
   * @return
   * @throws Exception
   */
    @Override
    public String selectFreeItemRequestStatChkByKey(FreeServicePartVO freeServicePartVO) throws Exception {

        return freeServicePartDAO.selectFreeItemRequestStatChkByKey(freeServicePartVO);
    }

    /**
    *
    * 면비 부품 정보를 등록한다.
    *
    * @param freeServicePartVO
    * @return
    * @throws Exception
    */
   public int insertFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception{


       if(StringUtil.nullConvert(freeServicePartVO.getDlrCd()).equals("")){
           freeServicePartVO.setDlrCd(LoginUtil.getDlrCd());
       }
       return freeServicePartDAO.insertFreeServicePart(freeServicePartVO);
   };

   /**
    *
    * 면비부품정보를 수정한다.
    *
    * @param freeServicePartVO
    * @return
    * @throws Exception
    */
   public int updateFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception{

       if(StringUtil.nullConvert(freeServicePartVO.getDlrCd()).equals("")){
           freeServicePartVO.setDlrCd(LoginUtil.getDlrCd());
       }
       return freeServicePartDAO.updateFreeServicePart(freeServicePartVO);
   };

   /**
    *
    * 면비부품정보를 삭제 한다.
    *
    * @param freeServicePartVO
    * @return
    * @throws Exception
    */
   public int deleteFreeServicePart(FreeServicePartVO freeServicePartVO)throws Exception{

       if(StringUtil.nullConvert(freeServicePartVO.getDlrCd()).equals("")){
           freeServicePartVO.setDlrCd(LoginUtil.getDlrCd());
       }
       return freeServicePartDAO.deleteFreeServicePart(freeServicePartVO);
   };

   /**
    *
    * 면비부품 목록수를 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public int selectFreeServicePartByConditionCnt(FreeServicePartSearchVO searchVO)throws Exception{


       /*if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }*/

       return freeServicePartDAO.selectFreeServicePartByConditionCnt(searchVO);
   };

   /**
    *
    * 면비부품 목록을 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public List<FreeServicePartVO> selectFreeServicePartByCondition(FreeServicePartSearchVO searchVO)throws Exception{

      /* if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }*/
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       return freeServicePartDAO.selectFreeServicePartByCondition(searchVO);

   };

   /**
    *
    * 면비부품 상세 정보를 조회한다.
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public FreeServicePartVO selectFreeServicePartByKey(FreeServicePartSearchVO searchVO)throws Exception{

       /*if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }*/
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       return freeServicePartDAO.selectFreeServicePartByKey(searchVO);

   };

   /**
   *
   * 면비부품 Temp로 저장.
   *
   * @param freeServicePartVO - 면비부품품 목록을 포함하는 freeServicePartVO
   * @return bindingResult
   * @throws Exception
   */
   public int insertFreeItemToIf(FreeServicePartVO freeServicePartVO) throws Exception {

       return freeServicePartDAO.insertFreeItemToIf(freeServicePartVO);
   }

   /**
    * 免费配件法人判定 excel 下载
    */
   @Override
   public void initJxlsContext(Context context, HMap params) throws Exception {


	   FreeServicePartSearchVO searchVO = new FreeServicePartSearchVO();

       ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
       searchVO.setsFromDt(DateUtil.convertToDate((String)params.get("sFromDt")));
       searchVO.setsToDt(DateUtil.convertToDate((String)params.get("sToDt")));
       List<FreeServicePartVO> list = selectFreeServicePartByCondition(searchVO);
       context.putVar("items", list);
   }
}
