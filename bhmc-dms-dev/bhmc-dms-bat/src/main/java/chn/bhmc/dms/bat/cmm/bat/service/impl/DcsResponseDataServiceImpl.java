package chn.bhmc.dms.bat.cmm.bat.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.bat.service.DcsResponseDataService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;

/**
 * <pre>
 * DCS 응답메세지 전송 ServiceImpl
 * </pre>
 *
 * @ClassName   : DcsResponseDataServiceImpl.java
 * @Description : DCS 응답메세지 전송 ServiceImpl
 * @author Kyung Mok Kim
 * @since 2018. 2. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 13.   Kyung Mok Kim     최초 생성
 * </pre>
 */
@Service("dcsResponseDataService")
public class DcsResponseDataServiceImpl extends HService implements DcsResponseDataService {

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Override
    public int insertDcsResponseData() throws Exception {
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("COM043");
        camelClient.sendRequest();

        return 0;
    }
}
