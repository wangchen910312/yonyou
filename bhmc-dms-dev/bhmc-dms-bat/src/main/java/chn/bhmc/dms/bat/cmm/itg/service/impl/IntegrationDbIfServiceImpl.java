package chn.bhmc.dms.bat.cmm.itg.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.http.client.ClientProtocolException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.itg.service.IntegrationDbIfService;
import chn.bhmc.dms.bat.cmm.itg.service.dao.IntegrationDbIfDAO;
import chn.bhmc.dms.bat.cmm.itg.vo.IntegrationDbIfInfoVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IntegrationDbIfServiceImpl
 * @Description : DMS - DCS 통합 DB I/F 전송을 위한  ServiceImpl
 * @author Choi KyungYong
 * @since 2017. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since            author              description
 *  ===========    ===============    ===========================
 *  2017. 1. 20.     Choi KyungYong            최초 생성
 * </pre>
 */
@Service("integrationDbIfServiceImpl")
public class IntegrationDbIfServiceImpl extends HService implements IntegrationDbIfService {

    @Resource(name="integrationDbIfDAO")
    IntegrationDbIfDAO integrationDbIfDAO;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    private final static int conditionCnt = 100;;
    /*
     * @see chn.bhmc.dms.bat.cmm.itg.service.requestIntegrationDbIf
     */
    @Override
    public void requestIntegrationDbIf(int day) throws Exception {
        String[] lblList = new String[1];
        Data receiveData = new Data();
        String ifResult = "0";
        try{
            integrationDbIfDAO.insertIntegrationDbIfInfo(day);

            List<IntegrationDbIfInfoVO> integrationDbIfVOList = new ArrayList<IntegrationDbIfInfoVO>();
            IntegrationDbIfInfoVO argIntegrationDbIfInfoVO = new IntegrationDbIfInfoVO();
            argIntegrationDbIfInfoVO.setConditionCnt(conditionCnt);
            integrationDbIfVOList = integrationDbIfDAO.getIntegrationDbIfInfo(argIntegrationDbIfInfoVO);
            if(integrationDbIfVOList != null){
                if(integrationDbIfVOList.size() > 0){
                    int i;
                    int j;
                    int loopCnt;
                    IntegrationDbIfInfoVO pIntegrationDbIfInfoVO = new IntegrationDbIfInfoVO();
                    for(i = 0; i < integrationDbIfVOList.size(); i++){
                        loopCnt = integrationDbIfVOList.get(i).getLoopCnt();

                        for(j = 0; j < loopCnt; j++){
                            pIntegrationDbIfInfoVO = new IntegrationDbIfInfoVO();
                            pIntegrationDbIfInfoVO.setBizCd(integrationDbIfVOList.get(i).getBizCd());
                            pIntegrationDbIfInfoVO.setConditionCnt(conditionCnt);
                            integrationDbIfDAO.updateIntegrationDbIfInfo(pIntegrationDbIfInfoVO);
                        }
                        CamelClient camelClient = camelClientFactory.createCamelClient();
                        camelClient.setIfId("COM040"); //통합 DB I/F 전송 ID
                        Map<String, Object> message = new HashMap<String, Object>();
                        camelClient.addSendMessage(message);
                        receiveData = camelClient.sendRequest();
                        ifResult = receiveData.getFooter().getIfResult();
                        if(!"Z".equals(ifResult)){
                            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                        }
                    }
                }
            }

        }catch(ClientProtocolException ce){
            log.error(ce.getMessage(), ce);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
        }catch(IOException ce){
            log.error(ce.getMessage(), ce);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
        }
    }

}
