package chn.bhmc.dms.bat.par.cmm.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.cmm.service.BatPartsCmmCamelService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatPartsCmmCamelServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Juwon Lee
 * @since 2018. 1. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 1. 23.     Juwon Lee     최초 생성
 * </pre>
 */
@Service("batPartsCmmCamelService")
public class BatPartsCmmCamelServiceImpl extends HService implements BatPartsCmmCamelService {

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService#executeCamelClient()
     */
    public boolean executeCamelClient(Map<String, Object> message , String ifId) throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.addSendMessage(message);
       // camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.setIfId(ifId);
        //camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
        camelClient.setReceiver("PTS");// set sender dlrCd

        Data receiveData =  camelClient.sendRequest();
        boolean result  =  (receiveData.getFooter().getIfResult().equals("Z")) ? true : false;
        log.info("executeCamelClent result " + result + " / IfResult"+receiveData.getFooter().getIfResult());
        /*
        if(!receiveData.getFooter().getIfResult().equals("Z")){
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }*/

       return result;

    }

}
