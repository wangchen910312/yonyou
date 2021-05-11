package chn.bhmc.dms.sal.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
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
     * Camel Factory
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="salesCommonCamelDAO")
    SalesCommonCamelDAO salesCommonCamelDAO;


    /**
     * camel 호출
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void executeCamel(String serviceId) throws Exception{
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId(serviceId);
        camelClient.sendRequest();
    }


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
        camelClient.setReceiver("SAL");

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
       camelClient.setReceiver("SAL");


       camelClient.setIfId(ifId);

       Data receiveData =  null;

       try{
            receiveData =  camelClient.sendRequest();
           if(!receiveData.getFooter().getIfResult().equals("Z")){
               throw processException("par.info.ifErrRaiMsg");
//               throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
           }
       }catch(Exception e){
           //throw processException("global.err.dcsIfErrMsg", new String[]{e.getMessage()});
           throw processException("par.info.ifErrRaiMsg");
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
   @SuppressWarnings("rawtypes")
public Data executeCamelClentListResult(Map<String, Object> messages , String ifId, String receiver)throws Exception{

       CamelClient camelClient = camelClientFactory.createCamelClient();
       camelClient.setSender(LoginUtil.getDlrCd());
       camelClient.setReceiver(receiver);

       camelClient.setIfId(ifId);

       camelClient.setContextId("1");



       camelClient.addSendMessage(messages);
       if(messages.get("IR_VIN") != null){

           camelClient.setTotCount( ((List) messages.get("IR_VIN")).size());
           camelClient.setTranCount(((List) messages.get("IR_VIN")).size());

       }

       Data receiveData =  null;

       try{
           receiveData =  camelClient.sendRequest();
           /*if(!receiveData.getFooter().getIfResult().equals("Z")){
               throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
           }*/
       }catch(Exception e){
           //throw new Exception(e.getMessage()); messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())}
           //throw processException("global.err.dcsIfErrMsg", new String[]{"Can not find the I/F data!"});
           throw processException("global.err.dcsIfErrMsg", new String[]{e.getMessage()});
       }

       return receiveData;
   }

}
