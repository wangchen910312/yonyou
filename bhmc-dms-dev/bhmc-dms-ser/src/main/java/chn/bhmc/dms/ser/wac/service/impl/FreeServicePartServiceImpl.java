package chn.bhmc.dms.ser.wac.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.FreeServicePartService;
import chn.bhmc.dms.ser.wac.service.dao.FreeServicePartDAO;
import chn.bhmc.dms.ser.wac.vo.FreeServicePartSearchVO;
import chn.bhmc.dms.ser.wac.vo.FreeServicePartVO;

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
public class FreeServicePartServiceImpl extends HService implements FreeServicePartService {


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

        if(StringUtil.nullConvert(freeServicePartVO.getDlrCd()).equals("")){
            freeServicePartVO.setDlrCd(dlrCd);
        }
        freeServicePartVO.setRegUsrId(userId);
        freeServicePartVO.setUpdtUsrId(userId);


        if( StringUtil.nullConvert(freeServicePartVO.getFreeItemDocNo()).equals("") ){

            String freeItemDocNo = freeServicePartDocNoIdgenService.getNextStringId();
            freeServicePartVO.setFreeItemDocNo(freeItemDocNo);

            insertFreeServicePart(freeServicePartVO);
        }else{

            String statCd = freeServicePartVO.getFreeItemStatCd();

            //요청 취소전 상태
            String freeItemStatCd = selectFreeItemRequestStatChkByKey(freeServicePartVO);


            //요청 취소 일경우 상태를 작성중으로 변경한다.
            freeServicePartVO.setFreeItemStatCd( statCd.equals("QC") ? "O" : statCd);


            //면비 부품  승인일경우
            if(statCd.equals("HA")){
                String approveNo = freeServicePartAprDocNoIdgenService.getNextStringId();
                freeServicePartVO.setFreeItemApproveNo(approveNo);
                freeServicePartVO.setBhmcJudgId(userId);
                freeServicePartVO.setBhmcJudgNm(userNm);

            }
            int resultCnt = updateFreeServicePart(freeServicePartVO);

            if(resultCnt > 0 ){
              //Carmel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();
                message.put("DLR_CD", freeServicePartVO.getDlrCd());
                message.put("FREE_ITEM_DOC_NO", freeServicePartVO.getFreeItemDocNo());
                message.put("VIN_NO", freeServicePartVO.getVinNo());

                if(statCd.equals("Q")){
                    //int delCnt = selectFreeServicePartIfByConditionCnt(freeServicePartVO);
                    //int insCnt = freeServicePartDAO.insertFreeServicePartIf(freeServicePartVO);
                    freeServicePartDAO.insertFreeItemToIf(freeServicePartVO);
                    serviceCommonService.executeCamelClent(message,"SER045");
                }
                if(statCd.equals("QC")){

                    //상태 체크 : 요청 취소 일경우 현재 접수 상태 인지 확인하다.
                    if(freeItemStatCd.equals("HS") || freeItemStatCd.equals("HA")){
                        throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())});
                    }

                    freeServicePartVO.setIfResltYn("N");
                    int delCnt = selectFreeServicePartIfByConditionCnt(freeServicePartVO);
                    if(delCnt == 0 ){
                        serviceCommonService.executeCamelClent(message,"SER052");
                    }
                }
            }

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


       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }

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

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
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

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       return freeServicePartDAO.selectFreeServicePartByKey(searchVO);

   };

    /**
     *
     * 면비부품 인터페이스 정보 조회
     *
     * @param sanbaoVO - 면비부품 인터페이스 정보 조회 정보 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
    */
    public int selectFreeServicePartIfByConditionCnt(FreeServicePartVO freeServicePartVO) throws Exception{

        int resultCnt = freeServicePartDAO.selectFreeServicePartIfByConditionCnt(freeServicePartVO);

        if(resultCnt > 0){
            freeServicePartDAO.deleteFreeServicePartIf(freeServicePartVO);
        }

        return resultCnt;
    }


}
