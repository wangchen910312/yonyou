package chn.bhmc.dms.bat.sal.veh.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.veh.service.BatchVehFirstRetailDateService;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchVehFirstRetailDateServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 6. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 27.     Lee Seungmin     최초 생성
 * </pre>
 */

@Service("batchVehFirstRetailDateService")
public class BatchVehFirstRetailDateServiceImpl extends HService implements BatchVehFirstRetailDateService {

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    @Override
    public int batFirstRetailDate() throws Exception{

        //EAI 호출
        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()

        .ifId("SAL129")
        .company("H")
        .sender("DCS")
        .receiver("ALL")
        .build()
        .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc);

        return 1;
    }
}
