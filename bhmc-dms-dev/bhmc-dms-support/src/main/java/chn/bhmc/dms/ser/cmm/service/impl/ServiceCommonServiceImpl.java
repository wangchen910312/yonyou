package chn.bhmc.dms.ser.cmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.dao.ServiceCommonDAO;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.LbrSuggestVO;
import chn.bhmc.dms.ser.cmm.vo.NpnPartSearchVO;
import chn.bhmc.dms.ser.cmm.vo.NpnPartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("serviceCommonService")
public class ServiceCommonServiceImpl extends HService implements ServiceCommonService{

    @Resource(name="serviceCommonDAO")
    ServiceCommonDAO serviceCommonDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    
   
    /**
     *
     * 고객요구사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CustDemandVO> selectCustDemandsByCondition(TabInfoSearchVO searchVO) throws Exception {


        String dlrCd = LoginUtil.getDlrCd();
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") || searchVO.getsDlrCd().equals(dlrCd)){
            searchVO.setsDlrCd(dlrCd);
            return serviceCommonDAO.selectCustDemandsByCondition(searchVO);
        }
        //服务历史结算费用(客户主诉查询)
        Map<String, Object> message = new HashMap<String, Object>();
        List<CustDemandVO> custDemandList = new ArrayList<>();
        message.put("I_DLR_CD", searchVO.getsDlrCd());
        message.put("I_JOB_NO", searchVO.getsJobNo());
        message.put("I_PREFIX_ID",searchVO.getsPreFixId());
        Data receiveData = executeCamelClentSearchResult(message, "SER120");
        if("Z".equals(receiveData.getFooter().getIfResult())) {
        	custDemandList = receiveData.readMessages(CustDemandVO.class);
        }
        return custDemandList;
    }

    /**
     *
     * 고장설명  조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public TrobleDescVO selectTrobleDescsByKey(TabInfoSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(dlrCd);
        }
        return serviceCommonDAO.selectTrobleDescsByKey(searchVO);
    }

    /**
     *
     * 기타사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO) throws Exception {


        String dlrCd = LoginUtil.getDlrCd();
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(dlrCd);
        }

        return serviceCommonDAO.selectEtcIssuesByCondition(searchVO);
    }

    /**
    *
    * 수리건의 조회
    *
    * @param obj
    * @param LbrSuggestVO
    * @throws Exception
    */
    public List<LbrSuggestVO> selectLbrSuggestByCondition(TabInfoSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(dlrCd);
        }
        return serviceCommonDAO.selectLbrSuggestByCondition(searchVO);
    }

    /**
     *
     * 고객요청사항/고장설명  저장
     *
     * @return
     * @throws Exception
     */
    public void multiTabInfos(TabInfoSaveVO saveVO) throws Exception {


        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();


        TrobleDescVO trobleDescVO = saveVO.getTrobleDescVO();
        List<CustDemandVO> obj = saveVO.getCustDemandListVO();
        List<EtcIssueVO> issueObj = saveVO.getEtcIssueListVO();

        if(StringUtil.nullConvert(trobleDescVO.getDlrCd()).equals("") ){
            trobleDescVO.setDlrCd(dlrCd);
        }
        trobleDescVO.setRegUsrId(userId);

        CustDemandVO custVO = new CustDemandVO();
        custVO.setDlrCd(trobleDescVO.getDlrCd());
        custVO.setPreFixId(trobleDescVO.getPreFixId());
        custVO.setJobNo(trobleDescVO.getJobNo());

        //고객요구사항 삭제
        deleteCustDemands(custVO);

        // 고객요구사항 저장
        for( CustDemandVO custDemandVO : obj ){
            if(StringUtil.nullConvert(custDemandVO.getDlrCd()).equals("") ){
                custDemandVO.setDlrCd(dlrCd);
            }
            custDemandVO.setJobNo(trobleDescVO.getJobNo());
            custDemandVO.setRegUsrId(userId);
            insertCustDemands(custDemandVO);
        }

        //고장서술 삭제
        deleteTrobleDescs(trobleDescVO);

        //고장서술 저장
        insertTrobleDescs(trobleDescVO);

        //기타사항 삭제
        deleteCustDemands(custVO);

        // 기타사항 저장
        for( EtcIssueVO etcIssueVO : issueObj ){
            if(StringUtil.nullConvert(etcIssueVO.getDlrCd()).equals("") ){
                etcIssueVO.setDlrCd(dlrCd);
            }
            etcIssueVO.setJobNo(trobleDescVO.getJobNo());
            etcIssueVO.setRegUsrId(userId);
            insertEtcIssue(etcIssueVO);
        }
    }

    /**
     *
     * 고객요구사항 저장
     *
     * @param obj
     * @param trobleDescVO
     * @throws Exception
     */
    public void multiCustDemand(List<CustDemandVO> obj, String jobNo, String preFixId) throws Exception{

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();

        CustDemandVO custVO = new CustDemandVO();
        custVO.setDlrCd(dlrCd);
        custVO.setPreFixId(preFixId);
        custVO.setJobNo(jobNo);

        //고객요구사항 삭제
        deleteCustDemands(custVO);

        // 고객요구사항 저장
        if( obj != null && obj.size() > 0 ){
            for( CustDemandVO custDemandVO : obj ){
                custDemandVO.setDlrCd(dlrCd);
                custDemandVO.setPreFixId(preFixId);
                custDemandVO.setJobNo(jobNo);
                custDemandVO.setRegUsrId(userId);

                insertCustDemands(custDemandVO);
            }
        }
    }

    /**
     *
     * 고장 서술 저장
     *
     * @param trobleDescVO
     * @param jobNo
     * @throws Exception
     */
    public void multiTrobleDesc(TrobleDescVO trobleDescVO , String jobNo)throws Exception{

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();

        if(StringUtil.nullConvert(trobleDescVO.getDlrCd()).equals("") ){
            trobleDescVO.setDlrCd(dlrCd);
        }

        if(StringUtil.nullConvert(trobleDescVO.getJobNo()).equals("") ){
            trobleDescVO.setJobNo(jobNo);
        }
        trobleDescVO.setRegUsrId(userId);

        //고장서술 삭제
        deleteTrobleDescs(trobleDescVO);


        //고장서술 저장
        insertTrobleDescs(trobleDescVO);

    }


    /**
    *
    * 고객요구사항 저장
    *
    * @param obj
    * @param trobleDescVO
    * @throws Exception
    */
    public void multiEtcIssue(List<EtcIssueVO> obj, String jobNo, String preFixId) throws Exception{

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();

        EtcIssueVO issueVO = new EtcIssueVO();
        issueVO.setDlrCd(dlrCd);
        issueVO.setPreFixId(preFixId);
        issueVO.setJobNo(jobNo);

        //고객요구사항 삭제
        deleteEtcIssue(issueVO);

        // 고객요구사항 저장
        if( obj != null && obj.size() > 0 ){
            int lineNo = 1;
            for( EtcIssueVO etcIssueVO : obj ){
                etcIssueVO.setLineNo(lineNo);
                etcIssueVO.setDlrCd(dlrCd);
                etcIssueVO.setPreFixId(preFixId);
                etcIssueVO.setJobNo(jobNo);
                etcIssueVO.setRegUsrId(userId);

                insertEtcIssue(etcIssueVO);
                lineNo++;
            }
        }
    }

    /**
    *
    * 수리건의 등록/삭제
    *
    * @param obj
    * @param LbrSuggestVO
    * @throws Exception
    */
    public void multiLbrSuggest(List<LbrSuggestVO> lbrSuggestListVO, String jobNo, String preFixId) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();


        LbrSuggestVO deleteSuggestVO = new LbrSuggestVO();
        deleteSuggestVO.setDlrCd(dlrCd);
        deleteSuggestVO.setPreFixId(preFixId);
        deleteSuggestVO.setJobNo(jobNo);
        deleteLbrSuggest(deleteSuggestVO);

        for(LbrSuggestVO lbrSuggestVO : lbrSuggestListVO){
            lbrSuggestVO.setDlrCd(dlrCd);
            lbrSuggestVO.setPreFixId(preFixId);
            lbrSuggestVO.setJobNo(jobNo);
            lbrSuggestVO.setRegUsrId(userId);
            insertLbrSuggest(lbrSuggestVO);
        }
    }

    /**
    *
    * 수리건의 등록
    *
    * @param obj
    * @param LbrSuggestVO
    * @throws Exception
    */
    public int insertLbrSuggest(LbrSuggestVO lbrSuggestVO) throws Exception {

        return serviceCommonDAO.insertLbrSuggest(lbrSuggestVO);
    }


    /**
     *
     * 고객 요구사항 저장
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int insertCustDemands(CustDemandVO custDemandVO)throws Exception{

        int insCnt = 0;
        if(!StringUtil.nullConvert(custDemandVO.getCustReqCont()).equals("")){
            insCnt = serviceCommonDAO.insertCustDemands(custDemandVO);
        }
        return insCnt;
    }


    /**
     *
     * 고장설명 입력
     *
     * @param trobleDescVO
     * @return
     * @throws Exception
     */
    public int insertTrobleDescs(TrobleDescVO trobleDescVO)throws Exception{

        return serviceCommonDAO.insertTrobleDescs(trobleDescVO);
    }

    /**
    *
    * 기타사항 저장
    *
    * @param custDemandVO
    * @return
    * @throws Exception
    */
    public int insertEtcIssue(EtcIssueVO etcIssueVO)throws Exception{

        return serviceCommonDAO.insertEtcIssue(etcIssueVO);
    }

    /**
     *
     * 고객 요구사항 수정
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int updateCustDemands(CustDemandVO custDemandVO)throws Exception{

        return serviceCommonDAO.updateCustDemands(custDemandVO);
    }



   /**
    *
    * 기타사항 수정
    *
    * @param custDemandVO
    * @return
    * @throws Exception
    */
    public int updateCustDemands(EtcIssueVO etcIssueVO)throws Exception{

        return serviceCommonDAO.updateEtcIssue(etcIssueVO);
    }


    /**
     *
     * 고객 요구사항 삭제
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int deleteCustDemands(CustDemandVO custDemandVO)throws Exception{

        return serviceCommonDAO.deleteCustDemands(custDemandVO);
    }

    /**
     *
     * 고객요청사항 삭제
     *
     * @return
     * @throws Exception
     */
    public void deleteDemands(List<CustDemandVO> obj, String jobNo, String preFixId)throws Exception {

        for(CustDemandVO demandVO : obj){
            demandVO.setPreFixId(preFixId);
            serviceCommonDAO.deleteCustDemands(demandVO);
        }

    }

     /**
     *
     * 고객요청사항 삭제
     *
     * @return
     * @throws Exception
     */
    public void deleteDemand(CustDemandVO custDemandVO)throws Exception {
        serviceCommonDAO.deleteCustDemands(custDemandVO);
    }

    /**
     *
     * 고장설명 삭제
     *
     * @param trobleDescVO
     * @return
     * @throws Exception
     */
    public int deleteTrobleDescs(TrobleDescVO trobleDescVO)throws Exception{

        return serviceCommonDAO.deleteTrobleDescs(trobleDescVO);
    }

    /**
     *
     * 고장설명  삭제
     *
     * @return
     * @throws Exception
     */
    public void deleteTrobleDesc(TrobleDescVO trobleDescVO, String jobNo)throws Exception {

        trobleDescVO.setJobNo(jobNo);
        serviceCommonDAO.deleteTrobleDescs(trobleDescVO);
    }

    /**
    *
    * 기타사항 삭제
    *
    * @param etcIssueVO
    * @return
    * @throws Exception
    */
    public int deleteEtcIssue(EtcIssueVO etcIssueVO)throws Exception{

       return serviceCommonDAO.deleteEtcIssue(etcIssueVO);
    }

    /**
     *
     * 기타사항 삭제
     *
     * @return
     * @throws Exception
     */
    public void deleteEtcIssues(List<EtcIssueVO> obj, String jobNo, String preFixId)throws Exception {
        for(EtcIssueVO issueVO : obj){
            issueVO.setJobNo(jobNo);
            issueVO.setPreFixId(preFixId);
            serviceCommonDAO.deleteEtcIssue(issueVO);
        }
    }

    /**
    *
    * 수리건의 삭제
    *
    * @param obj
    * @param trobleDescVO
    * @throws Exception
    */
    public int deleteLbrSuggest(LbrSuggestVO lbrSuggestVO) throws Exception {

        return serviceCommonDAO.deleteLbrSuggest(lbrSuggestVO);
    }

    /**
     *
     * NPN PART 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<NpnPartVO> selectNpnPartByCondition(NpnPartSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return serviceCommonDAO.selectNpnPartByCondition(searchVO);
    }

    /**
     *
     * CamelClent
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception{

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.addSendMessage(message);
        camelClient.setSender(LoginUtil.getDlrCd());


        camelClient.setIfId(ifId);

        Data receiveData =  null;

        try{
             receiveData =  camelClient.sendRequest();
            if(!receiveData.getFooter().getIfResult().equals("Z")){
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }
        }catch(Exception e){
            //throw new Exception(e.getMessage()); messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())}
            //throw processException("global.err.dcsIfErrMsg", new String[]{"Can not find the I/F data!"});
            throw processException("global.err.dcsIfErrMsg", new String[]{e.getMessage()});
        }

        return receiveData;
    }


    /**
     *
     * CamelClent
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public boolean executeCamelClent(Map<String, Object> message , String ifId)throws Exception{


        boolean result  =  false;
         CamelClient camelClient = camelClientFactory.createCamelClient();
         camelClient.addSendMessage(message);
         camelClient.setSender(LoginUtil.getDlrCd());

         camelClient.setIfId(ifId);
         Data receiveData = null;
         try{
             receiveData =  camelClient.sendRequest();

             result  =  (receiveData.getFooter().getIfResult().equals("Z")) ? true : false;
             log.info("executeCamelClent result " + result + " / IfResult"+receiveData.getFooter().getIfResult());
             if(!receiveData.getFooter().getIfResult().equals("Z")){
                 throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
             }
         }catch(Exception e){
             //throw new Exception(e.getMessage());
             throw processException("global.err.dcsIfErrMsg", new String[]{e.getMessage()});
         }


        return result;
    }



}
