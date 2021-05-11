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

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;
import chn.bhmc.dms.ser.wac.service.ClaimRequestService;
import chn.bhmc.dms.ser.wac.service.PwaRequestService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnRequestService;
import chn.bhmc.dms.ser.wac.service.SanbaoTechRequestService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimRequestDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqCustRemarkVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqLbrVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqPartVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqRtnVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSaveVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimReqVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimRequestServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("claimRequestService")
public class ClaimRequestServiceImpl extends HService implements ClaimRequestService , JxlsSupport{

    @Resource(name="claimRequestDAO")
    ClaimRequestDAO claimRequestDAO;

    @Resource(name="claimRequestService")
    ClaimRequestService claimRequestService;

    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Autowired
    PwaRequestService pwaRequestService;

    @Resource(name="claimReqDocNoIdGenService")
    TableIdGenService claimReqDocNoIdGenService;


    @Autowired
    SanbaoTechRequestService sanbaoTechRequestService;

    @Autowired
    ServiceCommonService serviceCommonService;

    @Autowired
    RepairOrderService repairOrderService;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 삼포 반품승인 서비스
     */
    @Autowired
    SanbaoReturnRequestService sanbaoReturnRequestService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
    *
    * 클레임 요청 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록수 데이터
    * @throws Exception
    */
    public int selectClaimRequestForRoByConditionCnt(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimRequestDAO.selectClaimRequestForRoByConditionCnt(searchVO);
    }

    /**
    *
    * 클레임 요청 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqVO> selectClaimRequestForRoByCondition(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimRequestDAO.selectClaimRequestForRoByCondition(searchVO);
    }

    /**
     *
     * 클레임 목록수 데이터 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 목록수 데이터
     * @throws Exception
     */
    public int selectClaimRequestForClaimByConditionCnt(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimRequestDAO.selectClaimRequestForClaimByConditionCnt(searchVO);
    }


    /**
     *
     * 클레임 목록 데이터 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 목록 데이터
     * @throws Exception
     */
    public List<ClaimReqVO> selectClaimRequestForClaimByCondition(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimRequestDAO.selectClaimRequestForClaimByCondition(searchVO);
    }


    /**
    *
    * 클레임 요청 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 상세 데이터
    * @throws Exception
    */
    public ClaimReqVO selectClaimRequestForRoByKey(ClaimReqSearchVO searchVO) throws Exception {

        LtsModelSearchVO ltsModelsearchVO = new LtsModelSearchVO();
        ltsModelsearchVO.setsVinNo(searchVO.getsVinNo());
        LtsModelMappingVO ltsMappingVO =  ltsModelMappingService.selectMappingLtsModelCdByKey(ltsModelsearchVO);

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsLtsModelCd(ltsMappingVO.getLtsModelCd());

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        ClaimReqVO claimReqVO = claimRequestDAO.selectClaimRequestForRoByKey(searchVO);

        if(claimReqVO == null )claimReqVO = new ClaimReqVO();

        return claimReqVO;
    }


    /**
     *
     * 클레임 요청 공임 목록수 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 요청 공임 목록 데이터
     * @throws Exception
     */
    public int selectClaimRequestForRoLabourByConditionCnt(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestForRoLabourByConditionCnt(searchVO);
    }

    /**
     *
     * 클레임 요청 공임 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 요청 공임 목록 데이터
     * @throws Exception
     */
    public List<ClaimReqLbrVO> selectClaimRequestForRoLabourByCondition(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestForRoLabourByCondition(searchVO);
    }

    /**
    *
    * 클레임 요청 부품 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
    public int selectClaimRequestForRoPartByConditionCnt(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestForRoPartByConditionCnt(searchVO);
    }


    /**
    *
    * 클레임 부품 요청  정보를 수정 한다.
    *
    * @param ClaimReqSearchVO - 클레임 요청 부품 수정  목록을 포함하는 ClaimReqSearchVO
    * @return
    * @throws Exception
    */
   public void itemSalePrcJudgeUpdate(ClaimReqSearchVO claimReqSearchVO)throws Exception{

       for(ClaimReqPartVO claimReqPartListVO: claimRequestDAO.selectClaimRequestForRoPartByCondition(claimReqSearchVO)){

           ClaimReqSearchVO claimItemPriUpdate = new ClaimReqSearchVO();
           claimItemPriUpdate.setsItemCd(claimReqPartListVO.getItemCd());
           claimItemPriUpdate.setsDlrCd(claimReqPartListVO.getDlrCd());
           claimItemPriUpdate.setsRoDocNo(claimReqPartListVO.getRoDocNo());
           if (claimReqPartListVO.getItemPrc()== 0){
               claimRequestDAO.itemSalePrcJudgeUpdate(claimItemPriUpdate);
           }
       }
   }

    /**
     *
     * 클레임 요청 부품 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 요청 부품 목록 데이터
     * @throws Exception
     */
    public List<ClaimReqPartVO> selectClaimRequestForRoPartByCondition(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        List<ClaimReqPartVO> claimReqPartListVO = claimRequestDAO.selectClaimRequestForRoPartByCondition(searchVO);

        return claimReqPartListVO;
    }



    /**
     *
     * GOODWILL 클레임 요청 RO 상세 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 요청 상세 데이터
     * @throws Exception
     */
    public ClaimReqVO selectClaimRequestForRoGoodWillByKey(ClaimReqSearchVO searchVO)throws Exception{

        LtsModelSearchVO ltsModelsearchVO = new LtsModelSearchVO();
        ltsModelsearchVO.setsVinNo(searchVO.getsVinNo());
        LtsModelMappingVO ltsMappingVO =  ltsModelMappingService.selectMappingLtsModelCdByKey(ltsModelsearchVO);

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsLtsModelCd(ltsMappingVO.getLtsModelCd());

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        ClaimReqVO claimReqVO = claimRequestDAO.selectClaimRequestForRoGoodWillByKey(searchVO);

        if(claimReqVO == null )claimReqVO = new ClaimReqVO();

        return claimReqVO;

    }


    /**
     *
     * GoodWill 클레임 요청 목록수 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 요청 목록수 데이터
     * @throws Exception
     */
    public int selectClaimRequestForRoGoodWillLabourByConditionCnt(ClaimReqSearchVO searchVO)throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestForRoGoodWillLabourByConditionCnt(searchVO);
    };


    /**
     *
     * GoodWill 클레임 요청 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 요청 목록 데이터
     * @throws Exception
     */
    public List<ClaimReqLbrVO> selectClaimRequestForRoGoodWillLabourByCondition(ClaimReqSearchVO searchVO)throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestForRoGoodWillLabourByCondition(searchVO);
    }



   /**
    *
    * 클레임 요청 RO 부품 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
    public int selectClaimRequestForRoGoodWillPartByConditionCnt(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestForRoGoodWillPartByConditionCnt(searchVO);
    }

    /**
    *
    * 클레임 요청 RO 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqPartVO> selectClaimRequestForRoGoodWillPartByCondition(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestForRoGoodWillPartByCondition(searchVO);
    }

    /**
    *
    * 등록된 클레임 요청 상세 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 상세 데이터
    * @throws Exception
    */
    public ClaimReqVO selectClaimRequestForClaimByKey(ClaimReqSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        ClaimReqVO claimReqVO = claimRequestDAO.selectClaimRequestForClaimByKey(searchVO);
        if(claimReqVO == null) claimReqVO = new ClaimReqVO();

        return claimReqVO;
    }


    /**
     *
     * 등록된 클레임 요청 공임 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
     * @return 클레임 요청 공임 목록 데이터
     * @throws Exception
     */
    public List<ClaimReqLbrVO> selectClaimRequestForClaimLabourByCondition(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimRequestDAO.selectClaimRequestForClaimLabourByCondition(searchVO);
    }

    /**
    *
    * 등록된 클레임 요청 부품 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimReqSearchVO
    * @return 클레임 요청 부품 목록 데이터
    * @throws Exception
    */
    public List<ClaimReqPartVO> selectClaimRequestForClaimPartByCondition(ClaimReqSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimRequestDAO.selectClaimRequestForClaimPartByCondition(searchVO);
    }

    /**
    *
    * 클레임 요청  정보를 등록/수정 한다.
    *
    * @param saveVO - 클레임 요청 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiClaimRequests(ClaimReqSaveVO saveVO) throws Exception {

        String claimDocNo = "";
        ClaimReqVO claimReqVO = saveVO.getClaimReqVO();
        String userId = LoginUtil.getUserId();

        claimReqVO.setRegUsrId(userId);
        claimReqVO.setUpdtUsrId(userId);

        // PIO 부품 Check
        int pioCnt = selectClaimRequestChkPioItems(claimReqVO);
        if( (pioCnt > 0 && claimReqVO.getClaimTp().equals("W")) ){
            throw processException("ser.info.selectPioItemChk", new String[]{claimReqVO.getCauItemCd()});
        }

        if(StringUtil.nullConvert(claimReqVO.getClaimDocNo()).equals("")){

            claimDocNo = claimReqDocNoIdGenService.getNextStringId();
            claimReqVO.setClaimDocNo(claimDocNo);
            saveVO.setClaimDocNo(claimDocNo);

            insertClaimRequest(claimReqVO);
            if(claimReqVO.getClaimTp().equals("G")){
                updateRepairOrder(claimReqVO);
            }

        }else{
            updateClaimRequest(claimReqVO);

            if(claimReqVO.getClaimTp().equals("G") &&
                    claimReqVO.getClaimStatCd().equals("C")){
                updateRepairOrder(claimReqVO);
            }
        }

        saveVO.setClaimDocNo(claimReqVO.getClaimDocNo());
        saveVO.setRoDocNo(claimReqVO.getRoDocNo());
        mulitClaimRequestLabour(saveVO);
        mulitClaimRequestPart(saveVO);

        return claimReqVO.getClaimDocNo();
    }

    /**
     *
     * GoodWill 클레임 일경우 RO Goodwill Stat 업데이트 : F
     *
     * @param claimReqVO
     */
    public void updateRepairOrder(ClaimReqVO claimReqVO) throws Exception{

        RepairOrderVO repairOrderVO = new RepairOrderVO();
        repairOrderVO.setRoDocNo(claimReqVO.getRoDocNo());
        repairOrderVO.setGoodwillStatCd( claimReqVO.getClaimStatCd().equals("C") ? "O" : "F");
        repairOrderService.updateRepairOrder(repairOrderVO);
    }

    //공임 저장
    public void mulitClaimRequestLabour(ClaimReqSaveVO saveVO)throws Exception{

        //TODO [권기현] 2016.06.07 SUB_PAR_AMT 필드는 NPN PART 일경우 저장한다.
        BaseSaveVO<ClaimReqLbrVO> saveLbrVO = saveVO.getClaimReqLbrVO();

        String userId = LoginUtil.getUserId();


        for(ClaimReqLbrVO claimReqLbrVO : saveLbrVO.getInsertList()){
            claimReqLbrVO.setRegUsrId(userId);
            claimReqLbrVO.setClaimDocNo(saveVO.getClaimDocNo());
            claimReqLbrVO.setRoDocNo(saveVO.getRoDocNo());

            if( StringUtil.nullConvert(claimReqLbrVO.getDlrCd()).equals("")){
                claimReqLbrVO.setDlrCd(LoginUtil.getDlrCd());
            }

            if( !StringUtil.isEmpty(claimReqLbrVO.getCauLbrYn())){
                insertClaimRequestLabour(claimReqLbrVO);
            }
        }

        for(ClaimReqLbrVO claimReqLbrVO : saveLbrVO.getUpdateList()){
            claimReqLbrVO.setRegUsrId(userId);

            if( StringUtil.nullConvert(claimReqLbrVO.getDlrCd()).equals("")){
                claimReqLbrVO.setDlrCd(LoginUtil.getDlrCd());
            }
            if( StringUtil.isEmpty(claimReqLbrVO.getCauLbrYn())){
                deleteClaimRequestLabour(claimReqLbrVO);
            }else{
                updateClaimRequestLabour(claimReqLbrVO);
            }
        }

        for(ClaimReqLbrVO claimReqLbrVO : saveLbrVO.getDeleteList()){

            if( StringUtil.nullConvert(claimReqLbrVO.getDlrCd()).equals("")){
                claimReqLbrVO.setDlrCd(LoginUtil.getDlrCd());
            }
            deleteClaimRequestLabour(claimReqLbrVO);
        }

    }

    //부품저장
    public void mulitClaimRequestPart(ClaimReqSaveVO saveVO)throws Exception{

        BaseSaveVO<ClaimReqPartVO> savePartVO = saveVO.getClaimReqPartVO();
        String userId = LoginUtil.getUserId();

        for(ClaimReqPartVO claimReqPartVO : savePartVO.getInsertList()){

            claimReqPartVO.setRegUsrId(userId);
            claimReqPartVO.setClaimDocNo(saveVO.getClaimDocNo());
            claimReqPartVO.setRoDocNo(saveVO.getRoDocNo());
            if( StringUtil.nullConvert(claimReqPartVO.getDlrCd()).equals("")){
                claimReqPartVO.setDlrCd(LoginUtil.getDlrCd());
            }
            if(!StringUtil.isEmpty(claimReqPartVO.getCauItemYn())){
                insertClaimRequestPart(claimReqPartVO);
            }
        }

        for(ClaimReqPartVO claimReqPartVO : savePartVO.getUpdateList()){

            claimReqPartVO.setUpdtUsrId(userId);

            if( StringUtil.nullConvert(claimReqPartVO.getDlrCd()).equals("")){
                claimReqPartVO.setDlrCd(LoginUtil.getDlrCd());
            }
            if(StringUtil.isEmpty(claimReqPartVO.getCauItemYn())){
                deleteClaimRequestPart(claimReqPartVO);
            }else{
                updateClaimRequestPart(claimReqPartVO);
            }
        }

        for(ClaimReqPartVO claimReqPartVO : savePartVO.getDeleteList()){

            if( StringUtil.nullConvert(claimReqPartVO.getDlrCd()).equals("")){
                claimReqPartVO.setDlrCd(LoginUtil.getDlrCd());
            }
            deleteClaimRequestPart(claimReqPartVO);
        }

    }

    /**
    *
    * 클레임 요청 공임 정보를 등록 한다.
    *
    * @param saveVO - 클레임 요청 공임  등록 목록을 포함하는 ClaimReqLbrVO
    * @return bindingResult
    * @throws Exception
    */
    public void insertClaimRequestLabour(ClaimReqLbrVO claimReqLbrVO)throws Exception{

        claimRequestDAO.insertClaimRequestLabour(claimReqLbrVO);
    }

    /**
     *
     * 클레임 부품 요청  정보를 등록 한다.
     *
     * @param saveVO - 클레임 요청 부품 등록 목록을 포함하는 ClaimReqPartVO
     * @return bindingResult
     * @throws Exception
     */
    public void insertClaimRequestPart(ClaimReqPartVO claimReqPartVO)throws Exception{

        claimRequestDAO.insertClaimRequestPart(claimReqPartVO);
    }

    /**
     *
     * 클레임 요청 공임 정보를 수정 한다.
     *
     * @param saveVO - 클레임 요청 공임  수정 목록을 포함하는 ClaimReqLbrVO
     * @return bindingResult
     * @throws Exception
     */
    public void updateClaimRequestLabour(ClaimReqLbrVO claimReqLbrVO)throws Exception{

        claimRequestDAO.updateClaimRequestLabour(claimReqLbrVO);
    }

    /**
     *
     * 클레임 부품 요청  정보를 수정 한다.
     *
     * @param saveVO - 클레임 요청 부품 수정  목록을 포함하는 ClaimReqPartVO
     * @return bindingResult
     * @throws Exception
     */
    public void updateClaimRequestPart(ClaimReqPartVO claimReqPartVO)throws Exception{

        claimRequestDAO.updateClaimRequestPart(claimReqPartVO);
    }

    /**
    *
    * 클레임 요청 공임 정보를 삭제 한다.
    *
    * @param saveVO - 클레임 요청 공임  삭제 목록을 포함하는 ClaimReqLbrVO
    * @return bindingResult
    * @throws Exception
    */
   public int deleteClaimRequestLabour(ClaimReqLbrVO claimReqLbrVO)throws Exception{

      return claimRequestDAO.deleteClaimRequestLabour(claimReqLbrVO);
   }

   /**
    *
    * 클레임 부품 요청  정보를 삭제 한다.
    *
    * @param saveVO - 클레임 요청 부품 삭제  목록을 포함하는 ClaimReqPartVO
    * @return bindingResult
    * @throws Exception
    */
   public int deleteClaimRequestPart(ClaimReqPartVO claimReqPartVO)throws Exception{

       return claimRequestDAO.deleteClaimRequestPart(claimReqPartVO);
   }

    /**
     *
     * 클레임 요청  정보를 등록 한다.
     *
     * @param saveVO - 클레임 요청 등록 목록을 포함하는 ClaimReqVO
     * @return bindingResult
     * @throws Exception
     */
    public void insertClaimRequest(ClaimReqVO claimReqVO)throws Exception{

        if(StringUtil.nullConvert(claimReqVO.getDlrCd()).equals("")){
            claimReqVO.setDlrCd(LoginUtil.getDlrCd());
        }
        insertApproveNo(claimReqVO);
        claimRequestDAO.insertClaimRequest(claimReqVO);
    }



    /**
    *
    * 클레임 PWA , 반품승인 번호를 등록 한다.
    *
    * @param saveVO - 클레임 요청 수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public void insertApproveNo(ClaimReqVO claimReqVO)throws Exception{

        if(StringUtil.nullConvert(claimReqVO.getDlrCd()).equals("")){
            claimReqVO.setDlrCd(LoginUtil.getDlrCd());
        }

        //PWA 정보를 수정 한다.
        if(updatePwaApproveNo(claimReqVO) > 0){ // PWA 승인번호 삭제시 본테이블의 PWA 승인번호 삭제
            claimReqVO.setPwaApproveNoYn("Y");
            claimReqVO.setPwaApproveNo(claimReqVO.getPwaApproveNo());

            /** 승인된 삼포 반품  NO 를 사용한다.**/
            updateSanbaoReturnApproveNo(claimReqVO);
        }


        //삼포 기술처리 수정
        if(updateSanbaoTechApproveNo(claimReqVO) > 0 ){ // 삼포 기술처리 승인번호 삭제시 본테이블의 삼포 기술처리 승인번호 삭제
            claimReqVO.setClaimTcavNoYn("Y");
            claimReqVO.setClaimTcavNo(claimReqVO.getClaimTcavNo());
        }

    }

    /**
     *
     * 클레임 PWA , 반품승인 번호를 삭제 한다.
     *
     * @param saveVO - 클레임 요청 수정 목록을 포함하는 SaveVO
     * @return bindingResult
     * @throws Exception
     */
    public void deleteApproveNo(ClaimReqVO claimReqVO)throws Exception{


        if(StringUtil.nullConvert(claimReqVO.getDlrCd()).equals("")){
            claimReqVO.setDlrCd(LoginUtil.getDlrCd());
        }
        claimReqVO.setUpdtUsrId(LoginUtil.getUserId());

        //PWA 정보를 수정 한다.
        if(updatePwaApproveNo(claimReqVO) > 0){ // PWA 승인번호 삭제시 본테이블의 PWA 승인번호 삭제
            claimReqVO.setPwaApproveNoYn("N");
            claimReqVO.setPwaApproveNo(claimReqVO.getPwaApproveNo());

            /** 승인된 삼포 반품  NO 를 사용한다.**/
            updateSanbaoReturnApproveNo(claimReqVO);

        }

        //삼포 기술처리 수정
        if(updateSanbaoTechApproveNo(claimReqVO) > 0 ){ // 삼포 기술처리 승인번호 삭제시 본테이블의 삼포 기술처리 승인번호 삭제
            claimReqVO.setClaimTcavNoYn("N");
            claimReqVO.setClaimTcavNo(claimReqVO.getClaimTcavNo());
        }

        claimRequestDAO.updateClaimRequest(claimReqVO);

    }

    /**
    *
    * 클레임 요청  정보를 수정 한다.
    *
    * @param saveVO - 클레임 요청 수정 목록을 포함하는 ClaimReqVO
    * @return bindingResult
    * @throws Exception
    */
    public void updateClaimRequest(ClaimReqVO claimReqVO) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        String userId = LoginUtil.getUserId();
        claimReqVO.setRegUsrId(userId);
        claimReqVO.setUpdtUsrId(userId);
        claimReqVO.setClaimReqId(userId);
        claimReqVO.setClaimReqNm(LoginUtil.getUserNm());

        if(StringUtil.nullConvert(claimReqVO.getDlrCd()).equals("")){
            claimReqVO.setDlrCd(LoginUtil.getDlrCd());
        }


        //PWA , 반품승인 , 삼포 기술제출 정보를 수정 한다.
        insertApproveNo(claimReqVO);

 //TODO 2016.12.27 [권기현] 클레임 청구취소 시간  테스트 하기 위해 임시로 늘림.
        HMap paramsMap = new HMap();
        /*String reqStartHm = "07:00";
        String reqEndHm = "21:00";
        String cancelStartHm = "07:00";
        String cancelEndHm = "21:00";
        */
        String reqStartHm = "06:00";
        String reqEndHm = "22:00";
        String cancelStartHm = "06:00";
        String cancelEndHm = "22:00";
        String submitStartHm = "06:00";
        String submitEndHm = "22:00";

        paramsMap.put("dlrCd", claimReqVO.getDlrCd());
        paramsMap.put("claimDocNo", claimReqVO.getClaimDocNo());
        paramsMap.put("roDocNo", claimReqVO.getRoDocNo());
        paramsMap.put("reqStartHm", reqStartHm);
        paramsMap.put("reqEndHm", reqEndHm);
        paramsMap.put("cancelStartHm", cancelStartHm);
        paramsMap.put("cancelEndHm", cancelEndHm);
        paramsMap.put("submitStartHm", submitStartHm);
        paramsMap.put("submitEndHm", submitEndHm);

        HMap hmap = selectClaimRequestChk(paramsMap);

        /**
         * 1. submitYn : 클레임 신청 여부   (Y , N)
         * 2. cancelYn : 클레임 취소 여부   (Y , N)
         * 3. returnYn : 삼포 반품신청 VIN 여부   (Y , N)
         * 4. clmPwaApproveNo : 클레임 사용된 PWA 번호
         * 5. pwaApproveNo : 삼포 반품 승인번호를 사용한 PWA 번호
         */

        //청구 시간 체크 - 오후 9시 이후에는 클레임을 청구할수없다.
        //ser.info.notClaimReq  클레임 신청은 {0} 부터 {1} 까지 가능합니다.

        if(claimReqVO.getClaimStatCd().equals("Q") ) { //신청
            /*
                       요구사항 추가 : 2016.09.13
            W/P/O 상태의 클레임문서의 경우 3일내 신청필요. 기타는 필히 7일내 클레임 신청필요. (기준: 정비종료일)
                       시간초과 시 제출불가.
             * */

            Date sysDt = DateUtil.convertToDate(DateUtil.getDate(dateFormat));
            int claimReqChkDay = DateUtil.daysBetween(claimReqVO.getRoEndDt(), sysDt);
            if( Integer.parseInt(claimReqVO.getClaimVerCd()) == 0 ){
                if(claimReqVO.getClaimTp().equals("W") ||
                        claimReqVO.getClaimTp().equals("P") ||
                        claimReqVO.getClaimTp().equals("O")
                ){
                	//TODO 2016.12.27 [권기현] 클레임 청구기간 테스트 하기 위해 임시로 늘림.
                    if(claimReqChkDay > 30){
                        throw processException("ser.info.noClaimReq");
                    }
                }else{
                    if(claimReqChkDay > 30){
                        throw processException("ser.info.noClaimReq");
                    }
                }
            }

            //클레임 반송건이 3번이면 클레임 청구 불가
            if( Integer.parseInt(claimReqVO.getClaimVerCd()) >= 2 ){
                throw processException("ser.info.overClaimReq", new String[]{"3"});
            }

            if(hmap.get("submitYn").equals("N")){
                String[] msgId = new String[]{
                         reqStartHm
                        ,reqEndHm
                };
                throw processException("ser.info.notClaimReq", msgId);
            }

            //삼포 반품 승인 이 있는경우 PWA NO 필수값으로 체크
            //ser.info.sanbaoVinChk : 삼포대상 VIN 입니다. 반품승인번호가 포함된 PWA NO를 입력해 주세요
            if(hmap.get("returnYn").equals("N")){
                 throw processException("ser.info.sanbaoVinChk");
            }
        } //신청

        //취소 시간 체크 - 청구 취소는 청구한 당일건에 한하여 저녁 9시 까지 취소 가능 하다. (기존 로직)
        //ser.info.notClaimCancel  : 취소는 청구 당일에 한하여 {0}부터 {1} 까지만 할 수 있습니다.
        //요청취소 : QC
        if(claimReqVO.getClaimStatCd().equals("QC") ){

            if(hmap.get("cancelYn").equals("N")){
                String[] msgId = new String[]{
                        cancelStartHm
                        ,cancelEndHm
                };
                throw processException("ser.info.notClaimCancel", msgId);
            }
        }
        String statCd = claimReqVO.getClaimStatCd();
        claimReqVO.setClaimStatCd(statCd.equals("QC") ? "O" : statCd);

        int resultCnt = claimRequestDAO.updateClaimRequest(claimReqVO);

       //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("DLR_CD",       claimReqVO.getDlrCd());
        message.put("CLAIM_DOC_NO", claimReqVO.getClaimDocNo());
        message.put("RO_DOC_NO",    claimReqVO.getRoDocNo());


        // 클레임 요청  Carmel interFace (DCS 전송)
        if(resultCnt > 0 && statCd.equals("Q") ){

          //InterFace Data Save
            ClaimReqSearchVO searchVO = new ClaimReqSearchVO();
            searchVO.setsDlrCd(claimReqVO.getDlrCd());
            searchVO.setsClaimDocNo(claimReqVO.getClaimDocNo());
            searchVO.setsRoDocNo(claimReqVO.getRoDocNo());

            //InterFace Data Save
            claimRequestDAO.insertClaimToTemp(claimReqVO);

            try{
                serviceCommonService.executeCamelClent(message,"SER016");
                serviceCommonService.executeCamelClent(message,"SER017");
                serviceCommonService.executeCamelClent(message,"SER018");
            }catch(Exception e){

                // DCS 전송건  ROLLBACK
                claimRequestDAO.updateClaimReqRollBack(claimReqVO);
                throw e;
            }


        } else {
         // 클레임 요청 취소
            if(resultCnt > 0 ){
                if(statCd.equals("QC")){
                    claimReqVO.setIfResltYn("N");
                    int delCnt = selectClaimRequestIf(claimReqVO);
                    if(delCnt == 0 ){
                        serviceCommonService.executeCamelClent(message,"SER051");
                    }
                }

            }
        }
    }

   /**
   *
   * 클레임 요청  인터페이스 전송 정보(DMS -> DCS)
   *
   * @param saveVO - 클레임 요청  인터페이스 전송 정보(DMS -> DCS)
   * @return bindingResult
   * @throws Exception
   */
   public int selectClaimRequestIf(ClaimReqVO claimReqVO) throws Exception{

       int resultCnt = claimRequestDAO.selectClaimRequestIf(claimReqVO);

       if(resultCnt > 0){
           deleteClaimRequestIf(claimReqVO);
           deleteClaimRequestLabourIf(claimReqVO);
           deleteClaimRequestPartIf(claimReqVO);
       }

       return resultCnt;
   }

   /**
   *
   * 클레임 요청 부품 인터페이스 전송 정보(DMS -> DCS)
   *
   * @param saveVO - 클레임 요청  인터페이스 전송 정보(DMS -> DCS)
   * @return bindingResult
   * @throws Exception
   */
   public int selectClaimPartRequestIf(ClaimReqVO claimReqVO) throws Exception{

       return claimRequestDAO.selectClaimPartRequestIf(claimReqVO);
   };
   /**
    *
    * 클레임 요청 공임 인터페이스 전송 정보(DMS -> DCS)
    *
    * @param saveVO - 클레임 요청  인터페이스 전송 정보(DMS -> DCS)
    * @return bindingResult
    * @throws Exception
    */
   public int selectClaimLaborRequestIf(ClaimReqVO claimReqVO) throws Exception{

       return claimRequestDAO.selectClaimLaborRequestIf(claimReqVO);

   };

   /**
    *
    * 클레임 요청시  인터페이스  전송 전 헤더 데이터 삭제
    *
    * @param saveVO - 클레임 요청시  인터페이스  전송 전 헤더 데이터 삭제
    * @return bindingResult
    * @throws Exception
    */
   public int deleteClaimRequestIf(ClaimReqVO claimReqVO) throws Exception{

       return claimRequestDAO.deleteClaimRequestIf(claimReqVO);
   }

   /**
    *
    * 클레임 요청시  인터페이스  전송 전 부품 데이터 삭제
    *
    * @param saveVO - 클레임 요청시  인터페이스  전송 전부품 데이터 삭제
    * @return bindingResult
    * @throws Exception
   */
   public int deleteClaimRequestPartIf(ClaimReqVO claimReqVO) throws Exception{

       return claimRequestDAO.deleteClaimRequestPartIf(claimReqVO);
   }

   /**
    *
    * 클레임 요청시  인터페이스  전송 전 공임 데이터 삭제
    *
    * @param saveVO - 클레임 요청시  인터페이스  전송 전 공임 데이터 삭제
    * @return bindingResult
    * @throws Exception
   */
   public int deleteClaimRequestLabourIf(ClaimReqVO claimReqVO) throws Exception{

       return claimRequestDAO.deleteClaimRequestLabourIf(claimReqVO);
   }

    /**
     *
     * PWA 사용 정보 수정
     *
     * @param claimReqVO
     * @return
     * @throws Exception
     */
    public int updatePwaApproveNo(ClaimReqVO claimReqVO)throws Exception{

        int resultCnt = 0;
        if(!StringUtil.nullConvert(claimReqVO.getPwaApproveNo()).equals("")){
            /** 승인된 PWA NO 를 사용한다.**/
            PwaVO pwaVO = new PwaVO();

            pwaVO.setDlrCd(claimReqVO.getDlrCd());
            pwaVO.setVinNo(claimReqVO.getVinNo());
            pwaVO.setPwaApproveNo( claimReqVO.getPwaApproveNo() );
            pwaVO.setPwaUseYn( claimReqVO.getPwaApproveNoYn() );
            pwaVO.setRoDocNo( claimReqVO.getRoDocNo() );
            pwaVO.setUpdtUsrId(LoginUtil.getUserId());
            resultCnt = pwaRequestService.updatePwaApproveNoInClaim(pwaVO);
        }
        return resultCnt;
    }

    /**
     *
     * 삼포 기술처리  사용 정보 수정
     *
     * @param claimReqVO
     * @return
     * @throws Exception
     */
    public int updateSanbaoTechApproveNo(ClaimReqVO claimReqVO)throws Exception{

        int resultCnt = 0;
        if(!StringUtil.nullConvert(claimReqVO.getClaimTcavNo()).equals("")){

            /** 승인된 삼포 기술처리  NO 를 사용한다.**/
            SanbaoTechVO sanbaoTechVO = new SanbaoTechVO();
            sanbaoTechVO.setDlrCd(claimReqVO.getDlrCd());
            sanbaoTechVO.setVinNo(claimReqVO.getVinNo());
            sanbaoTechVO.setApproveNo( claimReqVO.getClaimTcavNo() );
            sanbaoTechVO.setUseYn(claimReqVO.getClaimTcavNoYn());
            sanbaoTechVO.setUpdtUsrId(claimReqVO.getUpdtUsrId());

            resultCnt = sanbaoTechRequestService.updateSanbaoTechApproveUseYn(sanbaoTechVO);
        }

        return resultCnt;
    }

    /**
     *
     * 승인된 삼포 반품  NO  사용 정보 수정
     *
     * @param claimReqVO
     * @return
     * @throws Exception
     */
    public int updateSanbaoReturnApproveNo(ClaimReqVO claimReqVO)throws Exception{

        int resultCnt = 0;
        if(!StringUtil.nullConvert(claimReqVO.getClaimTcavNo()).equals("")){

            /** 승인된 삼포 반품  NO 를 사용한다.**/
            SanbaoReturnVO sanbaoReturnVO = new SanbaoReturnVO();
            sanbaoReturnVO.setDlrCd(claimReqVO.getDlrCd());
            sanbaoReturnVO.setVinNo(claimReqVO.getVinNo());
            sanbaoReturnVO.setPwaUseYn( claimReqVO.getPwaApproveNoYn() );
            sanbaoReturnVO.setPwaApproveNo(claimReqVO.getPwaApproveNo());
            sanbaoReturnVO.setPreFixId("CLM");
            sanbaoReturnVO.setUpdtUsrId(claimReqVO.getUpdtUsrId());
           resultCnt= sanbaoReturnRequestService.updateSanbaoReturnApprovePWA(sanbaoReturnVO);
        }

        return resultCnt;
    }

    /**
    *
    * PIO 부품 체크
    *
    * @param claimReqVO
    * @return
    * @throws Exception
    */
    public int selectClaimRequestChkPioItems(ClaimReqVO claimReqVO) throws Exception {

        return claimRequestDAO.selectClaimRequestChkPioItems(claimReqVO);
    }

     /**
     *
     * 클레임 반송 사유 조회
     *
     * @param claimReqVO
     * @return
     * @throws Exception
     */
    public List<ClaimReqRtnVO> selectClaimRequestReturnByCondition(ClaimReqSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return claimRequestDAO.selectClaimRequestReturnByCondition(searchVO);
    }


    /**
    *
    * 클레임 신청/신청취소/삼포 VIN 체크
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public HMap selectClaimRequestChk(HMap paramsMap) throws Exception{

       HMap hmap = (HMap) claimRequestDAO.selectClaimRequestChk(paramsMap);

       return hmap;

   }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ClaimReqSearchVO searchVO = new ClaimReqSearchVO();
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if("RepairRequestList_Tpl.xls".equals(params.get("templateFile").toString())) {
        	if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
                String sRoToDt = params.get("sRoToDt").toString();
                Date dRoToDt = DateUtil.convertToDate(sRoToDt);
                searchVO.setsRoToDt(dRoToDt);
            }
            if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
                String sRoFromDt = params.get("sRoFromDt").toString();
                Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
                searchVO.setsRoFromDt(dRoFromDt);
            }

            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            List<ClaimReqVO> list = selectClaimRequestForRoByCondition(searchVO);
            context.putVar("items", list);

        }else {
        	if(!StringUtils.isBlank(params.get("sClaimToDt").toString())){
                String sClaimToDt = params.get("sClaimToDt").toString();
                Date dClaimToDt = DateUtil.convertToDate(sClaimToDt);
                searchVO.setsClaimToDt(dClaimToDt);
            }
            if(!StringUtils.isBlank(params.get("sClaimFromDt").toString())){
                String sClaimFromDt = params.get("sClaimFromDt").toString();
                Date dClaimFromDt = DateUtil.convertToDate(sClaimFromDt);
                searchVO.setsClaimFromDt(dClaimFromDt);
            }

            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            List<ClaimReqVO> list = selectClaimRequestForClaimByCondition(searchVO);
            context.putVar("items", list);
        }
        
    }

    /**
     * 索赔申请页面客户主诉信息查询
     * @param searchVO
     * @return
     * @throws Exception
     */
	@Override
	public List<ClaimReqCustRemarkVO> selectClaimRequestForClaimCustRemarkByCondition(ClaimReqSearchVO searchVO) throws Exception {
		
		if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimRequestDAO.selectClaimRequestForClaimCustRemarkByCondition(searchVO);
	};

}
