package chn.bhmc.dms.ser.wac.service.impl;

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
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.SanbaoRequestService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoRequestDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoPartVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSaveVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoRequestServiceImple.java
 * @Description : 삼보 요청 화면 서비스 구현 클래스
 * @author Kwon Ki Hyun
 * @since 2016. 3. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 21.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("sanbaoRequestService")
public class SanbaoRequestServiceImpl extends HService implements SanbaoRequestService, JxlsSupport{


    @Resource(name="sanbaoRequestDAO")
    SanbaoRequestDAO sanbaoRequestDAO;


    /**
     * 삼보 SEQ
     */
    @Resource(name="sanbaoDocNoIdgenService")
    TableIdGenService sanbaoDocNoIdgenService;

    @Autowired
    FileMgrService fileMgrService;

    @Autowired
    ServiceCommonService serviceCommonService;

    /**
    *
    * 삼보 요청 목록 데이터 갯수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return PWA 요청 목록 데이터 갯수
    * @throws Exception
    */
    public int selectSanbaoRequestByConditionCnt(SanbaoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return sanbaoRequestDAO.selectSanbaoRequestByConditionCnt(searchVO);
    }

    /**
    *
    * 삼보 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return PWA 요청 목록 데이터
    * @throws Exception
    */
    public List<SanbaoVO> selectSanbaoRequestByCondition(SanbaoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return sanbaoRequestDAO.selectSanbaoRequestByCondition(searchVO);
    }

    /**
    *
    * 삼보요청  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoVO selectSanbaoRequestByKey(SanbaoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return sanbaoRequestDAO.selectSanbaoRequestByKey(searchVO);
    }

    /**
    *
    * 삼보요청 부품 정보 데이터 갯수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보요청 부품  정보 데이터 갯수
    * @throws Exception
    */
    public int selectSanbaoRequestPartsByConditionCnt(SanbaoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return sanbaoRequestDAO.selectSanbaoRequestPartsByConditionCnt(searchVO);
    }

    /**
    *
    * 삼보요청 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoSearchVO
    * @return 삼보요청 부품  정보 데이터
    * @throws Exception
    */
    public List<SanbaoPartVO> selectSanbaoRequestPartsByCondition(SanbaoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return sanbaoRequestDAO.selectSanbaoRequestPartsByCondition(searchVO);
    }

    /**
    *
    * 삼보요청 정보를 등록/수정/삭제 한다.
    *
    * @param saveVO - 삼보 요청 등록/수정/삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiSanbaoRequests(SanbaoSaveVO saveVO) throws Exception {


        String userId = LoginUtil.getUserId();
        SanbaoVO sanbaoVO =  saveVO.getSanbaoVO();
        sanbaoVO.setDlrCd(LoginUtil.getDlrCd());
        sanbaoVO.setRegUsrId(userId);
        sanbaoVO.setUpdtUsrId(userId);

        String statCd = sanbaoVO.getStatCd();

        //요청 취소 상태 체크
        String sanbaoStatCd = sanbaoRequestDAO.selectSanbaoRequestStatCdByKey(sanbaoVO);



        if( StringUtil.nullConvert(sanbaoVO.getDocNo()).equals("")){
            // 삼보 DOC NO 신규 채번
            String docNo = sanbaoDocNoIdgenService.getNextStringId();
            sanbaoVO.setDocNo(docNo);
            sanbaoVO.setStatCd("O");
            insertSanbaoRequests(sanbaoVO);
        }else{
            sanbaoVO.setStatCd(statCd.equals("QC") ? "O" : statCd);
            updateSanbaoRequests(sanbaoVO);
        }

        saveVO.setDocNo(sanbaoVO.getDocNo());
        multiSanbaoParts(saveVO);

      //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("DLR_CD", sanbaoVO.getDlrCd());
        message.put("VIN_NO", sanbaoVO.getVinNo());
        message.put("DOC_NO", sanbaoVO.getDocNo());

        // Camel Call DMS -> DCS
        if(statCd.equals("Q")){

            SanbaoSearchVO searchVO = new SanbaoSearchVO();
            searchVO.setsDocNo(sanbaoVO.getDocNo());
            int partCnt = selectSanbaoRequestPartsByConditionCnt(searchVO);
            insertSanBaoRequestToIf(sanbaoVO);
            //int resultCnt = selectSanbaoRequestIfSendByConditionCnt(sanbaoVO);
            //int insCnt = sanbaoRequestDAO.insertSanbaoRequestsIf(sanbaoVO);
            //int insPartCnt = sanbaoRequestDAO.insertSanbaoRequestPartsIf(sanbaoVO);


            try{
            //CamelClent Call
             serviceCommonService.executeCamelClent(message,"SER030");
            if(partCnt > 0 ) serviceCommonService.executeCamelClent(message,"SER031");
            }catch(Exception e){

                sanbaoVO.setStatCd("O");
                sanbaoRequestDAO.insertSanBaoRequestToIfRollBack(sanbaoVO);
                throw e;
            }


        }else if(statCd.equals("QC")){ //요청 취소

            if(sanbaoStatCd.equals("A") || sanbaoStatCd.equals("S")){
                throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())});
            }

            sanbaoVO.setIfResltYn("N");
            int resultCnt = selectSanbaoRequestIfSendByConditionCnt(sanbaoVO);
            if(resultCnt == 0){
                //CamelClent Call
                serviceCommonService.executeCamelClent(message,"SER047");
            }

        }




        return sanbaoVO.getDocNo();
    }


    public void multiSanbaoParts(SanbaoSaveVO saveVO)throws Exception{

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        BaseSaveVO<SanbaoPartVO> objVO = saveVO.getSanbaoPartVO();

        for(SanbaoPartVO sanbaoPartVO : objVO.getInsertList()){

            sanbaoPartVO.setRegUsrId(userId);
            sanbaoPartVO.setDlrCd(dlrCd);
            sanbaoPartVO.setDocNo(saveVO.getDocNo());
            insertSanbaoRequestParts(sanbaoPartVO);

        }
        for(SanbaoPartVO sanbaoPartVO : objVO.getUpdateList()){

            sanbaoPartVO.setUpdtUsrId(userId);
            sanbaoPartVO.setDlrCd(dlrCd);
            sanbaoPartVO.setDocNo(saveVO.getDocNo());
            updateSanbaoRequestParts(sanbaoPartVO);

        }
        for(SanbaoPartVO sanbaoPartVO : objVO.getDeleteList()){

            sanbaoPartVO.setDlrCd(dlrCd);
            sanbaoPartVO.setDocNo(saveVO.getDocNo());
            deleteSanbaoRequestParts(sanbaoPartVO);

        }

    }


    /**
    *
    * 삼보요청 정보를 등록  한다.
    *
    * @param saveVO - 삼보 요청 등록  목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertSanbaoRequests(SanbaoVO sanbaoVO) throws Exception {

        return sanbaoRequestDAO.insertSanbaoRequests(sanbaoVO);
    }

    /**
    *
    * 삼보요청 정보를 수정 한다.
    *
    * @param saveVO - 삼보 요청 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateSanbaoRequests(SanbaoVO sanbaoVO) throws Exception {

        return sanbaoRequestDAO.updateSanbaoRequests(sanbaoVO);
    }

    /**
    *
    * 삼보요청 정보를 삭제 한다.
    *
    * @param saveVO - 삼보 요청 삭제 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deleteSanbaoRequests(SanbaoVO sanbaoVO) throws Exception {

        sanbaoVO.setDlrCd(LoginUtil.getDlrCd());
        SanbaoPartVO sanbaoPartVO = new SanbaoPartVO();
        sanbaoPartVO.setDlrCd(sanbaoVO.getDlrCd());
        sanbaoPartVO.setDocNo(sanbaoVO.getDocNo());

        deleteSanbaoRequestParts(sanbaoPartVO);

        deleteFileInfo(sanbaoVO.getFileKeyNm());

        int delCnt = sanbaoRequestDAO.deleteSanbaoRequests(sanbaoVO);

        if(delCnt > 0 ){
            int resultCnt = selectSanbaoRequestIfSendByConditionCnt(sanbaoVO);
            if(resultCnt > 0){
                Map<String, Object> message = new HashMap<String, Object>();

                message.put("DLR_CD", sanbaoVO.getDlrCd());
                message.put("VIN_NO", sanbaoVO.getVinNo());
                message.put("DOC_NO", sanbaoVO.getDocNo());

                //CamelClent Call
                serviceCommonService.executeCamelClent(message,"SER047");
            }
        }

        return delCnt;
    }

    /**
     *
     * 파일정보 삭제
     *
     * @param fileDocNo
     * @return
     * @throws Exception
     */
    public int deleteFileInfo(String fileDocNo)throws Exception{

        int cnt = 0;
        if( fileMgrService.deleteFileItemsByFileDocNo(fileDocNo) >0 ){
           cnt =  fileMgrService.deleteFileDoc(fileDocNo);
        }

        return cnt;
    }

    /**
    *
    * 삼보요청 부품정보를 등록 한다.
    *
    * @param saveVO - 삼보 요청 등록 부품 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertSanbaoRequestParts(SanbaoPartVO sanbaoPartVO) throws Exception {

        return sanbaoRequestDAO.insertSanbaoRequestParts(sanbaoPartVO);
    }

    /**
    *
    * 삼보요청 부품정보를 수정 한다.
    *
    * @param saveVO - 삼보 요청 수정 부품 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateSanbaoRequestParts(SanbaoPartVO sanbaoPartVO) throws Exception {

        return sanbaoRequestDAO.updateSanbaoRequestParts(sanbaoPartVO);
    }

    /**
    *
    * 삼보요청 부품정보를 삭제 한다.
    *
    * @param saveVO - 삼보 요청 삭제 부품 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public int deleteSanbaoRequestParts(SanbaoPartVO sanbaoPartVO) throws Exception {

        return sanbaoRequestDAO.deleteSanbaoRequestParts(sanbaoPartVO);
    }

    /**
    *
    * 삼보요청을 Temp로 저장.
    *
    * @param sanbaoVO - 삼보 요청 삭제 부품 목록을 포함하는 sanbaoVO
    * @return bindingResult
    * @throws Exception
    */
    public int insertSanBaoRequestToIf(SanbaoVO sanbaoVO) throws Exception {

        return sanbaoRequestDAO.insertSanBaoRequestToIf(sanbaoVO);
    }

    /**
    *
    * 삼보요청  I/F 정보 조회
    *
    * @param sanbaoVO - 삼보요청  I/F 정보 조회 sanbaoVO
    * @return bindingResult
    * @throws Exception
    */
   public int selectSanbaoRequestIfSendByConditionCnt(SanbaoVO sanbaoVO) throws Exception{


       int cnt = sanbaoRequestDAO.selectSanbaoRequestIfSendByConditionCnt(sanbaoVO);

       if( cnt > 0 ){
           deleteSanbaoRequestsIf(sanbaoVO);
           deleteSanbaoRequestPartsIf(sanbaoVO);
       }

       return cnt;

    }


    /**
    *
    * 삼보요청  헤더  I/F 정보 삭제
    *
    * @param sanbaoVO - 삼보요청  헤더  I/F 정보 삭제  sanbaoVO
    * @return bindingResult
    * @throws Exception
   */
   public int deleteSanbaoRequestsIf(SanbaoVO sanbaoVO) throws Exception{

       return sanbaoRequestDAO.deleteSanbaoRequestsIf(sanbaoVO);

   }

 /**
   *
   * 삼보요청  부품  I/F 정보 삭제
   *
   * @param sanbaoVO - 삼보요청  부품  I/F 정보 삭제
   * @return bindingResult
   * @throws Exception
   */
   public int deleteSanbaoRequestPartsIf(SanbaoVO sanbaoVO) throws Exception{

       return sanbaoRequestDAO.deleteSanbaoRequestPartsIf(sanbaoVO);

   }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        SanbaoSearchVO searchVO = new SanbaoSearchVO();

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
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<SanbaoVO> list = selectSanbaoRequestByCondition(searchVO);
        context.putVar("items", list);
    }

    @Override
    public String selectVATSearch(String sApplyDate, String sTypeCd) throws Exception{
        return sanbaoRequestDAO.selectVATSearch(sApplyDate, sTypeCd);
    }




}
