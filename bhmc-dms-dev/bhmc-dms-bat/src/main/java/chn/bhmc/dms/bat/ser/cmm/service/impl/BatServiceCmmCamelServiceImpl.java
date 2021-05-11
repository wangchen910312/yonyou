package chn.bhmc.dms.bat.ser.cmm.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatServiceCmmCamelServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("batServiceCmmCamelService")
public class BatServiceCmmCamelServiceImpl extends HService implements BatServiceCmmCamelService {

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
