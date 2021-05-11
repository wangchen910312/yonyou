package chn.bhmc.dms.bat.crm.crq.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.crq.service.BatVocDmsDcsInterfaceService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;

/**
 * @ClassName   : BatVocDmsDcsInterfaceServiceImpl
 * @Description : DMS-DCS 고객요청 정보전송을 위한 데이터 수집
 * @author LEE IN MOON
 * @since 2016.10.10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016.10.10.     LEE IN MOON     최초 생성
 * </pre>
 */
@Service("batVocDmsDcsInterfaceService")
public class BatVocDmsDcsInterfaceServiceImpl extends HService implements BatVocDmsDcsInterfaceService {

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Override
    public int selectVocDmsDcs() throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM108");
        camelClient.sendRequest();

        return 0;
    }

}
