package chn.bhmc.dms.sal.cmm.service.impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.xml.bind.JAXBElement;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.cmm.service.dao.SalesCommonCamelDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesCommonCamelServiceImpl
 * @Description : camel 호출요청. (이승민 과장 요청)
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("salesCommonCamelService")
public class SalesCommonCamelServiceImpl extends HService implements SalesCommonCamelService {

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="salesCommonCamelDAO")
    SalesCommonCamelDAO salesCommonCamelDAO;

    /**
     * EAI 클라이언트
     */
    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     * 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void executeSalesProcedure(String proId) throws Exception{
        salesCommonCamelDAO.executeSalesProcedure(proId);
    }

    /**
    *
    * EAI Client Call
    *
    * @param DLR_CD : 딜러코드
    * @param ifId   : 인터페이스 아이디
    * @param Messge : 보낼 파라미터
    * @param flag   : 호출마지막 여부 ( Y : 마지막호출 , N : 마지막호출이 아닐경우 )
    * @return
    * @throws Exception
    */
    public boolean executeWebSeviceEaiCall( String dlrCd ,String ifId, String sender, Map<String, Object> message, String flag)throws Exception{
          CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
                                   .ifId(ifId)
                                   .company("H")
                                   .sender(sender)
                                   .receiver(dlrCd)
                                   .flag(flag)
                                   .addMessage(message)
                                   .build()
                                   .buildCommDMSDoc();

          CommDMSDoc commDMSDoc = eaiClient.sendRequest(reqCommDMSDoc);

          String ifresultCd = commDMSDoc.getFooter().getValue().getIFRESULT().getValue();

          if(!ifresultCd.equals("Z")){

              JAXBElement<String>  ifResult = commDMSDoc.getFooter().getValue().getIFRESULT();
              JAXBElement<String>  ifResultMsg =  commDMSDoc.getFooter().getValue().getIFFAILMSG();

              log.debug("commDMSDoc ifResult Value ="+ commDMSDoc.getFooter().getValue().getIFRESULT().getValue());
              log.debug("commDMSDoc ifResultMsg Value="+ commDMSDoc.getFooter().getValue().getIFFAILMSG());
              log.debug("commDMSDoc IFRESULT ="+ commDMSDoc.getFooter().getValue().getIFRESULT());

              throw processException("global.err.dcsIfErrMsg", new String[] { ifResult.getValue(), ifResultMsg.getValue()});
          }

          return (ifresultCd.equals("Z")) ? true : false;
      }

    public CommDMSDoc executeEaiService(String pgmId) throws Exception {

        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
        .ifId(pgmId)
        .company("H")
        .sender("SAL")
        .addAttachment("", "", "")
        .build()
        .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc);
        return reqCommDMSDoc;
    }

}
