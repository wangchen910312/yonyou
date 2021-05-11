package chn.bhmc.dms.ser.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.bind.JAXBElement;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.dao.ServiceCommonDAO;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
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

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     *
     * 고객요구사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CustDemandVO> selectCustDemandsByCondition(TabInfoSearchVO searchVO) throws Exception {
        return serviceCommonDAO.selectCustDemandsByCondition(searchVO);
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
        return serviceCommonDAO.selectTrobleDescsByKey(searchVO);
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
     * 고객 요구사항 저장
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int insertCustDemands(CustDemandVO custDemandVO)throws Exception{

        return serviceCommonDAO.insertCustDemands(custDemandVO);
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
     * 기타사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO) throws Exception {
        return serviceCommonDAO.selectEtcIssuesByCondition(searchVO);
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
  * EAI Client Call
  *
  * @param DLR_CD , Messge
  * @return
  * @throws Exception
  */
    public boolean executeEaiCall( String dlrCd ,String ifId,  Map<String, Object> message, String flag)throws Exception{
      //DCS-DMS 승인 상태 업데이트 CALL

        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
                                 .ifId(ifId)
                                 .company("H")
                                 .sender("SER")
                                 .receiver(dlrCd)
                                 .flag(flag)
                                 .addMessage(message)
                                 .addAttachment("", "", "")
                                 .build()
                                 .buildCommDMSDoc();

        CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);

        String ifresultCd = commDMSDoc.getFooter().getValue().getIFRESULT().getValue();

        if(!ifresultCd.equals("Z")){

            JAXBElement<String>  ifResult = commDMSDoc.getFooter().getValue().getIFRESULT();
            JAXBElement<String>  ifResultMsg =  commDMSDoc.getFooter().getValue().getIFFAILMSG();

            log.error("commDMSDoc ifResult Value ="+ commDMSDoc.getFooter().getValue().getIFRESULT().getValue());
            log.error("commDMSDoc ifResultMsg Value="+ commDMSDoc.getFooter().getValue().getIFFAILMSG());
            log.error("commDMSDoc IFRESULT ="+ commDMSDoc.getFooter().getValue().getIFRESULT());

            throw processException("global.err.dcsIfErrMsg", new String[] { ifResult.getValue(), ifResultMsg.getValue()});
        }

        return (ifresultCd.equals("Z")) ? true : false;
    }

}
