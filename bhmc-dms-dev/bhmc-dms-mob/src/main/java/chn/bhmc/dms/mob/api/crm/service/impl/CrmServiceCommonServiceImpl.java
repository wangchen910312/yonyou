package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.service.CrmServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.dao.ServiceCommonDAO;

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
@Service("CrmserviceCommonService")
public class CrmServiceCommonServiceImpl extends HService implements CrmServiceCommonService{

    @Resource(name="serviceCommonDAO")
    ServiceCommonDAO serviceCommonDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;


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

}
