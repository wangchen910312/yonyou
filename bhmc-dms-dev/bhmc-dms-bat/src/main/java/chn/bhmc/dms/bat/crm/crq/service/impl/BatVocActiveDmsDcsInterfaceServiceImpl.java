package chn.bhmc.dms.bat.crm.crq.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.crq.service.BatVocActiveDmsDcsInterfaceService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;

/**
 * @ClassName   : BatVocActiveDmsDcsInterfaceServiceImpl
 * @Description : DMS-DCS 고객요청 활동 정보전송을 위한 데이터 수집
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
@Service("batVocActiveDmsDcsInterfaceService")
public class BatVocActiveDmsDcsInterfaceServiceImpl extends HService implements BatVocActiveDmsDcsInterfaceService {

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Override
    public int selectVocActiveDmsDcs() throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM109");
        camelClient.sendRequest();

        return 0;
    }

}
